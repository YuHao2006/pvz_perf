#pragma once

namespace Sexy
{
struct AtlasImageRegion
{
    int mX = 0, mY = 0;
    int mWidth = 0, mHeight = 0;
    int mTextureWidth = 0, mTextureHeight = 0;
};

constexpr bool IsValidAtlasImageRegion(const AtlasImageRegion& region)
{
    return region.mX >= 0 && region.mY >= 0 &&
        region.mWidth > 0 && region.mHeight > 0 &&
        region.mTextureWidth > 0 && region.mTextureHeight > 0 &&
        region.mWidth <= region.mTextureWidth &&
        region.mHeight <= region.mTextureHeight &&
        region.mX <= region.mTextureWidth - region.mWidth &&
        region.mY <= region.mTextureHeight - region.mHeight;
}

// Pixel coordinates belong to the logical source image. Do not clamp them:
// clipping and filtering interpolate the same coordinates after translation.
constexpr float AtlasPixelCoordinate(float pixel, int offset, int textureExtent)
{
    return (pixel + static_cast<float>(offset)) / static_cast<float>(textureExtent);
}

constexpr float AtlasNormalizedCoordinate(float uv, int offset,
    int logicalExtent, int textureExtent)
{
    return AtlasPixelCoordinate(uv * static_cast<float>(logicalExtent), offset, textureExtent);
}
}
