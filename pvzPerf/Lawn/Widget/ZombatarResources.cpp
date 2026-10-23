#include "ZombatarResources.h"
#include "graphics/Graphics.h"
#include "graphics/RenderInterface.h"
#include "graphics/TextureSource.h"
#include "misc/SexyMatrix.h"
#include <cmath>

using namespace Sexy;

namespace
{
void DrawRegion(Graphics& graphics, const Rect& destination,
    const Rect& source, bool linearFilter)
{
    if (destination.mWidth <= 0 || destination.mHeight <= 0 ||
        source.mWidth <= 0 || source.mHeight <= 0)
        return;
    if (!graphics.mDestImage || !graphics.mDestImage->IsGpuDrawTarget())
        throw NonScreenDrawError(DrawOperation::StretchBlt);
    auto& render = *graphics.mDestImage->mRenderOwner;
    render.SelectDrawSurface(graphics.mDestImage);
    SexyTransform2D transform;
    transform.Scale(float(destination.mWidth) / source.mWidth,
        float(destination.mHeight) / source.mHeight);
    transform.Translate(float(destination.mX), float(destination.mY));
    render.BltTransformed(
        TextureSource{gZombatarAtlas.mTexture, gZombatarAtlas.mWidth, gZombatarAtlas.mHeight},
        &graphics.mClipRect, graphics.mColorizeImages ? graphics.mColor : Color::White,
        graphics.mDrawMode, source, transform, linearFilter);
}
}

void DrawZombatarImage(Graphics* graphics, ZombatarImage image, float x, float y)
{
    if (image == ZombatarImage::None)
        return;
    const Rect& source = gZombatarAtlas.mImages[static_cast<std::size_t>(image)];
    // Preserve Graphics::DrawImage's integer position and scale-origin rules.
    const int translatedX = int(int(x) + graphics->mTransX);
    const int translatedY = int(int(y) + graphics->mTransY);
    const bool scaled = graphics->mScaleX != 1.0f || graphics->mScaleY != 1.0f;
    const Rect destination = scaled
        ? Rect(int(graphics->mScaleOrigX + std::floor(
                (translatedX - graphics->mScaleOrigX) * graphics->mScaleX)),
            int(graphics->mScaleOrigY + std::floor(
                (translatedY - graphics->mScaleOrigY) * graphics->mScaleY)),
            int(std::ceil(source.mWidth * graphics->mScaleX)),
            int(std::ceil(source.mHeight * graphics->mScaleY)))
        : Rect(translatedX, translatedY, source.mWidth, source.mHeight);
    DrawRegion(*graphics, destination, source, scaled && !graphics->mFastStretch);
}

void DrawZombatarImage(Graphics* graphics, ZombatarImage image,
    float x, float y, int width, int height)
{
    if (image == ZombatarImage::None)
        return;
    const Rect& source = gZombatarAtlas.mImages[static_cast<std::size_t>(image)];
    DrawRegion(*graphics,
        Rect(int(x + graphics->mTransX), int(y + graphics->mTransY), width, height),
        source, !graphics->mFastStretch);
}

void DrawZombatarImage(Graphics* graphics, ZombatarImage image,
    const Rect& destination, const Rect& source)
{
    if (image == ZombatarImage::None)
        return;
    const Rect& packed = gZombatarAtlas.mImages[static_cast<std::size_t>(image)];
    const Rect atlasSource(packed.mX + source.mX, packed.mY + source.mY,
        source.mWidth, source.mHeight);
    DrawRegion(*graphics,
        Rect(int(destination.mX + graphics->mTransX), int(destination.mY + graphics->mTransY),
            destination.mWidth, destination.mHeight),
        atlasSource, !graphics->mFastStretch);
}
