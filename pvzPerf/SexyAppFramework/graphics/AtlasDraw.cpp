#include "AtlasDraw.h"
#include "Graphics.h"
#include "Image.h"
#include "RenderInterface.h"
#include "misc/SexyMatrix.h"
#include <cmath>

namespace Sexy {
namespace {
void DrawRegion(Graphics& graphics, const TextureSource& texture,
    const Rect& source, const SexyMatrix3& transform, bool linear)
{
    if (source.mWidth <= 0 || source.mHeight <= 0)
        return;
    if (!graphics.mDestImage || !graphics.mDestImage->IsGpuDrawTarget())
        throw NonScreenDrawError(DrawOperation::StretchBlt);
    auto& render = *graphics.mDestImage->mRenderOwner;
    render.SelectDrawSurface(graphics.mDestImage);
    render.BltTransformed(texture, &graphics.mClipRect,
        graphics.mColorizeImages ? graphics.mColor : Color::White,
        graphics.mDrawMode, source, transform, linear);
}
}

void DrawAtlasImage(Graphics* graphics, const TextureSource& texture,
    const Rect& region, float x, float y)
{
    const int translatedX = int(int(x) + graphics->mTransX);
    const int translatedY = int(int(y) + graphics->mTransY);
    const bool scaled = graphics->mScaleX != 1 || graphics->mScaleY != 1;
    const Rect destination = scaled
        ? Rect(int(graphics->mScaleOrigX + std::floor(
                (translatedX - graphics->mScaleOrigX) * graphics->mScaleX)),
            int(graphics->mScaleOrigY + std::floor(
                (translatedY - graphics->mScaleOrigY) * graphics->mScaleY)),
            int(std::ceil(region.mWidth * graphics->mScaleX)),
            int(std::ceil(region.mHeight * graphics->mScaleY)))
        : Rect(translatedX, translatedY, region.mWidth, region.mHeight);
    if (destination.mWidth <= 0 || destination.mHeight <= 0 ||
        region.mWidth <= 0 || region.mHeight <= 0)
        return;
    SexyTransform2D transform;
    transform.Scale(float(destination.mWidth) / region.mWidth,
        float(destination.mHeight) / region.mHeight);
    transform.Translate(float(destination.mX), float(destination.mY));
    DrawRegion(*graphics, texture, region, transform, scaled && !graphics->mFastStretch);
}

void DrawAtlasImage(Graphics* graphics, const TextureSource& texture,
    const Rect& region, const Rect& destination, const Rect& localSource)
{
    if (destination.mWidth <= 0 || destination.mHeight <= 0 ||
        localSource.mWidth <= 0 || localSource.mHeight <= 0)
        return;
    const Rect source(region.mX + localSource.mX, region.mY + localSource.mY,
        localSource.mWidth, localSource.mHeight);
    SexyTransform2D transform;
    transform.Scale(float(destination.mWidth) / source.mWidth,
        float(destination.mHeight) / source.mHeight);
    transform.Translate(float(int(destination.mX + graphics->mTransX)),
        float(int(destination.mY + graphics->mTransY)));
    DrawRegion(*graphics, texture, source, transform, !graphics->mFastStretch);
}

void DrawAtlasImageScaled(Graphics* graphics, const TextureSource& texture,
    const Rect& region, float x, float y, float scaleX, float scaleY)
{
    SexyTransform2D transform;
    transform.Scale(scaleX, scaleY);
    transform.Translate(x + graphics->mTransX, y + graphics->mTransY);
    // TodDrawImageRectScaledF uses floating positions and a matrix with the
    // source center removed by TodBltMatrix; its final origin is top-left.
    const bool unitScale = scaleX == 1.0f && scaleY == 1.0f;
    DrawRegion(*graphics, texture, region, transform, unitScale || graphics->mLinearBlend);
}
}
