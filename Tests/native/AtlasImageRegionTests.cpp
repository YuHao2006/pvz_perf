#include "SexyAppFramework/graphics/AtlasImageRegion.h"
#include "SexyAppFramework/graphics/Image.h"
#include "SexyAppFramework/graphics/Graphics.h"
#include "SexyAppFramework/graphics/MemoryImage.h"
#include "SexyAppFramework/graphics/RenderInterface.h"
#include "SexyAppFramework/graphics/TextureSource.h"
#include "Sexy.TodLib/Reanimator.h"
#include "Sexy.TodLib/TodParticle.h"
#include <cmath>
#include <concepts>
#include <cstdlib>
#include <iostream>
#include <limits>
#include <type_traits>

namespace
{
template<class T>
concept DeleteThroughPointer = requires(T* image) { delete image; };

template<class T>
concept GraphicsDrawsImage = requires(Sexy::Graphics& graphics, T* image) {
    graphics.DrawImage(image, 0, 0);
};

template<class T>
concept RendererBlitsImage = requires(Sexy::RenderInterface& render, T* image,
                                      const Sexy::Rect& rect, const Sexy::Color& color) {
    render.Blt(image, 0.f, 0.f, rect, color, 0);
};

template<class T>
concept RendererDrawsTexturedTriangle = requires(Sexy::RenderInterface& render, T* image,
                                                 const Sexy::TriVertex& vertex, const Sexy::Color& color) {
    render.DrawTriangleTex(vertex, vertex, vertex, color, 0, image);
};

template<class T>
concept RendererUploadsImage = requires(Sexy::RenderInterface& render, T* image) {
    render.CreateImageTexture(image);
};

template<class T>
concept RendererUploadsAtlas = requires(Sexy::RenderInterface& render, T*& image) {
    { render.UploadAtlasTexture(image) } -> std::same_as<Sexy::GpuTexture*>;
};

template<class T>
concept HasImageTypeTag = requires(T& image) { image.mImageType; }
    || requires { typename T::ImageType; };
template<class T>
concept HasDrawnMarker = requires(T& image) { image.mDrawn; };
template<class T>
concept HasImagePath = requires(T& image) { image.mFilePath; };
template<class T>
concept HasDirectCpuPixels = requires(T& image) { image.mBits; }
    || requires(T& image) { image.mColorTable; }
    || requires(T& image) { image.mColorIndices; }
    || requires(T& image) { image.GetBits(); };
template<class T>
concept HasStripGrid = requires(T& image) { image.mNumRows; }
    || requires(T& image) { image.mNumCols; };
template<class T>
concept HasAnimationMetadata = requires(T& image) { image.mAnimInfo; };
template<class T>
concept HasFrameMetadata = requires(T& image) { image.mFrames; };
template<class T>
concept HasAtlasGrid = requires(T& image) { image.mRows; }
    || requires(T& image) { image.mCols; };
template<class T>
concept GraphicsDrawsSourceRect = requires(Sexy::Graphics& graphics, T* image,
                                          const Sexy::Rect& rect) {
    graphics.DrawImage(image, 0, 0, rect);
    graphics.DrawImage(image, rect, rect);
    graphics.DrawImageF(image, 0.f, 0.f, rect);
};
template<class T>
concept GraphicsDrawsCel = requires(T& graphics, Sexy::Image* image) {
    graphics.DrawImageCel(image, 0, 0, 0);
};
template<class T>
concept HasImageFilters = requires(T& image) { image.mFilterImages; }
    || requires(T& image) { image.mFilterOwner; };
template<class T>
concept HasAtlasWrapper = requires(T& definition) { definition.mAtlas; };
template<class T>
concept HasTrackImageOverride = requires(T& track) { track.mImageOverride; };
template<class T>
concept HasImageOverrideApi =
    requires(T& value, Sexy::Image* image) {
        value.SetImageOverride(ReanimTrackId::None,image);
    } || requires(T& value) {
        value.GetImageOverride(ReanimTrackId::None);
    } || requires(T& value) {
        value.mImageOverride;
    } || requires(T& value, Sexy::Image* image) {
        value.OverrideImage(ParticleEmitterName::unnamed,image);
    } || requires(T& value, Sexy::Image* image) {
        value.OverrideImage(ParticleEmitterRanges::All,image);
    } || requires(T& value, Sexy::Image* image) {
        value.OverrideImage(nullptr,image);
    } || requires(T& value, Sexy::Image* image) {
        value.OverrideImage(image);
    };
template<class T>
concept HasNestedGpuData = requires(T& image) { image.mD3DData; };
template<class T>
concept HasRetiredImageState = requires(T& image) { image.mPurgeBits; }
    || requires(T& image) { image.mIsVolatile; }
    || requires(T& image) { image.mWantPal; }
    || requires(T& image) { image.mBitsChangedCount; };

// Definitions embed the borrowed GPU pointer; frames/emitters keep the same
// pointer-free inline region. Drawing needs no image wrapper dereference.
static_assert(std::is_same_v<decltype(ReanimatorDefinition::mTextures),Sexy::GpuTexture**>);
static_assert(std::is_same_v<decltype(TodParticleDefinition::mTextures),Sexy::GpuTexture**>);
static_assert(!HasAtlasWrapper<ReanimatorDefinition>);
static_assert(!HasAtlasWrapper<TodParticleDefinition>);
static_assert(sizeof(DefinitionImageRegion)==6*sizeof(int));
static_assert(std::is_same_v<decltype(ReanimatorTransform::mImageSlot), std::uint32_t>);
static_assert(sizeof(decltype(ReanimatorTransform::mImageSlot)) == sizeof(std::uint32_t));
static_assert(!HasTrackImageOverride<ReanimatorTrackInstance>);
static_assert(!HasImageOverrideApi<Reanimation>);
static_assert(!HasImageOverrideApi<TodParticleSystem>);
static_assert(!HasImageOverrideApi<TodParticleEmitter>);
static_assert(std::is_same_v<decltype(Reanimation::mVariant), std::uint32_t>);
static_assert(std::is_same_v<decltype(ReanimatorDefinition::mImageRects), Sexy::Rect*>);
static_assert(std::is_same_v<decltype(TodEmitterDefinition::mImageRectOffset), std::uint32_t>);
static_assert(std::is_same_v<decltype(TodParticleSystem::mVariant), std::uint32_t>);
static_assert(std::is_same_v<decltype(TodParticleDefinition::mImageRects), Sexy::Rect*>);

// These are API/ownership boundaries, not a mirrored GPU field layout.
// Positive draw controls also ensure a missing/renamed API cannot make the
// corresponding negative MemoryImage check pass vacuously.
static_assert(!std::is_base_of_v<Sexy::Image, Sexy::MemoryImage>);
static_assert(!std::is_convertible_v<Sexy::MemoryImage*, Sexy::Image*>);
static_assert(!std::is_constructible_v<Sexy::Graphics, Sexy::MemoryImage*>);
static_assert(std::is_constructible_v<Sexy::Graphics, Sexy::Image*>);
static_assert(!GraphicsDrawsImage<Sexy::MemoryImage>);
static_assert(GraphicsDrawsImage<Sexy::Image>);
static_assert(!GraphicsDrawsImage<Sexy::GpuTexture>);
static_assert(!RendererBlitsImage<Sexy::MemoryImage>);
static_assert(RendererBlitsImage<Sexy::Image>);
static_assert(!RendererDrawsTexturedTriangle<Sexy::MemoryImage>);
static_assert(RendererDrawsTexturedTriangle<Sexy::Image>);
static_assert(!RendererUploadsImage<Sexy::MemoryImage>);
static_assert(RendererUploadsImage<Sexy::Image>);

// The atlas uploader consumes only a decoded loading payload, and returns a
// GPU pointer. Neither a CPU utility nor an ordinary GPU Image can enter it.
static_assert(RendererUploadsAtlas<ImageLib::Image>);
static_assert(!RendererUploadsAtlas<Sexy::Image>);
static_assert(!RendererUploadsAtlas<Sexy::MemoryImage>);
static_assert(!RendererBlitsImage<Sexy::GpuTexture>);
static_assert(!RendererUploadsImage<Sexy::GpuTexture>);
static_assert(!HasStripGrid<Sexy::ImageMetadata>);
static_assert(!HasAnimationMetadata<Sexy::ImageMetadata>);
static_assert(!HasFrameMetadata<Sexy::ImageMetadata>);
static_assert(!HasStripGrid<Sexy::Image>);
static_assert(!HasAnimationMetadata<Sexy::Image>);
static_assert(!HasFrameMetadata<Sexy::Image>);
static_assert(!HasAtlasGrid<Sexy::AtlasImageRegion>);
static_assert(GraphicsDrawsSourceRect<Sexy::Image>);
static_assert(!GraphicsDrawsCel<Sexy::Graphics>);

// Borrowed texture draw data must remain safe to copy and discard without
// touching the texture owner's lifetime. No offsets/field-size mirror.
static_assert(std::is_trivially_copyable_v<Sexy::TextureSource>);
static_assert(std::is_trivially_destructible_v<Sexy::TextureSource>);
static_assert(std::is_standard_layout_v<Sexy::TextureSource>);
static_assert(std::is_aggregate_v<Sexy::TextureSource>);

static_assert(!HasImageTypeTag<Sexy::Image>);
static_assert(!HasDrawnMarker<Sexy::Image>);
static_assert(!HasImagePath<Sexy::Image>);
static_assert(!HasDirectCpuPixels<Sexy::Image>);
static_assert(HasDirectCpuPixels<Sexy::MemoryImage>);
static_assert(!std::is_polymorphic_v<Sexy::Image>);
static_assert(std::is_default_constructible_v<Sexy::Image>);
static_assert(!DeleteThroughPointer<Sexy::ImageMetadata>);
static_assert(DeleteThroughPointer<Sexy::Image>);
static_assert(!std::is_copy_assignable_v<Sexy::Image>);
static_assert(std::is_same_v<decltype(Sexy::Image::mTexture),Sexy::GpuTexture*>);
static_assert(!HasNestedGpuData<Sexy::Image>);
static_assert(!HasImageFilters<Sexy::Image>);
static_assert(!HasRetiredImageState<Sexy::Image>);
static_assert(!HasRetiredImageState<Sexy::MemoryImage>);

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
    // Match the original horizontal selection, including floor-divided sheets,
    // frame wrapping, and hidden frames retaining their single-cel geometry.
    const DefinitionImageRegion reanimSheet{14, 22, 109, 71, 2, 3};
    const auto requireReanimRect = [&](int frame, int expectedX) {
        const auto rect = DefinitionReanimCelRect(reanimSheet, frame);
        Require(rect.mX == expectedX && rect.mY == 22 &&
            rect.mWidth == 36 && rect.mHeight == 35,
            "Precomputed reanimation cel changed horizontal strip semantics");
    };
    requireReanimRect(0, 14);
    requireReanimRect(2, 86);
    requireReanimRect(3, 14);
    requireReanimRect(7, 50);
    requireReanimRect(std::numeric_limits<int>::max(),
        14 + (std::numeric_limits<int>::max() % 3) * 36);
    requireReanimRect(-1, 14);
    const auto emptyReanim = DefinitionReanimCelRect({}, 7);
    Require(emptyReanim.mX == 0 && emptyReanim.mY == 0 &&
        emptyReanim.mWidth == 0 && emptyReanim.mHeight == 0,
        "Imageless reanimation acquired a source rectangle");
    const auto oneCel = DefinitionReanimCelRect({3, 5, 67, 19, 1, 1}, 19);
    Require(oneCel.mX == 3 && oneCel.mY == 5 &&
        oneCel.mWidth == 67 && oneCel.mHeight == 19,
        "Single-cel reanimation changed its source rectangle");
    const AtlasImageRegion sheet{14, 22, 108, 70, 256, 128};
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
    invalid.mTextureHeight = 0;
    Require(!IsValidAtlasImageRegion(invalid), "Zero-height texture accepted");
    Require(IsValidAtlasImageRegion({2, 2, 67, 16, 72, 20}),
        "Original 67-pixel four-frame strip rejected");
    Require(IsValidAtlasImageRegion({0, 0, 8, 4, 8, 4}),
        "Region ending at exact atlas bounds rejected");
    Require(!IsValidAtlasImageRegion({1, 0, 8, 4, 8, 4}),
        "Region outside atlas edge accepted");
    std::cout << "Atlas image coordinate and region tests passed\n";
}
