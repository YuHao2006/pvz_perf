#include "SexyAppFramework/graphics/AtlasImageRegion.h"
#include <cmath>
#include <cstdlib>
#include <iostream>
#include <limits>

namespace
{
void Require(bool condition, const char* message)
{
    if (!condition)
    {
        std::cerr << message << '\n';
        std::exit(1);
    }
}
void Near(float actual, float expected, const char* message)
{
    Require(std::abs(actual - expected) < 0.000001f, message);
}
}

int main()
{
    using namespace Sexy;
    const AtlasImageRegion sheet{14, 22, 108, 70, 256, 128, 2, 3};
    Require(IsValidAtlasImageRegion(sheet), "Valid particle strip rejected");
    // The last particle cel is 36x35. Its corners must stay inside this region,
    // with logical origin translated exactly once into the physical atlas.
    Near(AtlasPixelCoordinate(72, sheet.mX, sheet.mTextureWidth), 86.f / 256,
        "Last particle column starts at the wrong atlas pixel");
    Near(AtlasPixelCoordinate(108, sheet.mX, sheet.mTextureWidth), 122.f / 256,
        "Last particle column ends at the wrong atlas pixel");
    Near(AtlasPixelCoordinate(35, sheet.mY, sheet.mTextureHeight), 57.f / 128,
        "Particle row starts at the wrong atlas pixel");
    Near(AtlasPixelCoordinate(70, sheet.mY, sheet.mTextureHeight), 92.f / 128,
        "Particle row ends at the wrong atlas pixel");
    Near(AtlasNormalizedCoordinate(.5f, sheet.mX, sheet.mWidth, sheet.mTextureWidth),
        68.f / 256, "Triangle midpoint treated as an atlas normalized coordinate");
    Near(AtlasNormalizedCoordinate(1.f, sheet.mY, sheet.mHeight, sheet.mTextureHeight),
        92.f / 128, "Non-square atlas used the wrong axis extent");
    // Linear clipping in logical UV space must commute with the atlas mapping.
    const float left = AtlasNormalizedCoordinate(.1f, sheet.mX, sheet.mWidth, sheet.mTextureWidth);
    const float right = AtlasNormalizedCoordinate(.9f, sheet.mX, sheet.mWidth, sheet.mTextureWidth);
    Near(left + (right - left) * .375f,
        AtlasNormalizedCoordinate(.4f, sheet.mX, sheet.mWidth, sheet.mTextureWidth),
        "Clipping interpolation changed after atlas translation");
    Near(AtlasPixelCoordinate(-.5f, sheet.mX, sheet.mTextureWidth), 13.5f / 256,
        "Filter border was incorrectly clamped");
    Near(AtlasNormalizedCoordinate(1.25f, 0, 32, 32), 1.25f,
        "Standalone texture coordinates changed");

    auto invalid = sheet;
    invalid.mX = std::numeric_limits<int>::max();
    Require(!IsValidAtlasImageRegion(invalid), "Overflowing x bounds accepted");
    invalid = sheet;
    invalid.mY = -1;
    Require(!IsValidAtlasImageRegion(invalid), "Negative origin accepted");
    invalid = sheet;
    invalid.mWidth = 0;
    Require(!IsValidAtlasImageRegion(invalid), "Empty view accepted");
    invalid = sheet;
    invalid.mCols = 0;
    Require(!IsValidAtlasImageRegion(invalid), "Zero-column strip accepted");
    invalid = sheet;
    invalid.mRows = 3;
    Require(IsValidAtlasImageRegion(invalid), "Original floor-divided particle grid rejected");
    Require(IsValidAtlasImageRegion({2, 2, 67, 16, 72, 20, 1, 4}),
        "Original 67-pixel four-frame strip rejected");
    Require(IsValidAtlasImageRegion({0, 0, 8, 4, 8, 4, 1, 1}),
        "Region ending at exact atlas bounds rejected");
    Require(!IsValidAtlasImageRegion({1, 0, 8, 4, 8, 4, 1, 1}),
        "Region outside atlas edge accepted");
    std::cout << "Atlas image coordinate and region tests passed\n";
}
