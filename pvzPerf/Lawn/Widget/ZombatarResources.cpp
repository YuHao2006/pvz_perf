#include "ZombatarResources.h"
#include "graphics/Graphics.h"
#include "graphics/RenderInterface.h"
#include "graphics/TextureSource.h"
#include "misc/SexyMatrix.h"
#include <cmath>
#include <algorithm>

using namespace Sexy;

namespace
{
void DrawRegion(Graphics& graphics, ZombatarImage image, const Rect& destination,
    const Rect& requested, bool linearFilter)
{
    const auto index=static_cast<std::size_t>(image);
    const auto& packed=gZombatarAtlas.mImages[index];
    const auto& crop=gZombatarAtlas.mCrops[index];
    if(destination.mWidth<=0||destination.mHeight<=0||requested.mWidth<=0||requested.mHeight<=0)return;
    const int x=std::max(requested.mX,crop.mX),y=std::max(requested.mY,crop.mY);
    const int right=std::min(requested.mX+requested.mWidth,crop.mX+crop.mWidth);
    const int bottom=std::min(requested.mY+requested.mHeight,crop.mY+crop.mHeight);
    if(right<=x||bottom<=y)return;
    auto region=packed;region.mWidth=crop.mWidth;region.mHeight=crop.mHeight;
    const auto source=CropTextureRegion(region,Rect(x-crop.mX,y-crop.mY,right-x,bottom-y));
    if (!graphics.mDestImage || !graphics.mDestImage->IsGpuDrawTarget())
        throw NonScreenDrawError(DrawOperation::StretchBlt);
    auto& render = *graphics.mDestImage->mRenderOwner;
    render.SelectDrawSurface(graphics.mDestImage);
    SexyTransform2D transform;
    const float sx=float(destination.mWidth)/requested.mWidth,sy=float(destination.mHeight)/requested.mHeight;
    transform.Scale(sx,sy);
    transform.Translate(destination.mX+(x-requested.mX)*sx,destination.mY+(y-requested.mY)*sy);
    render.BltTransformed(
        TextureSource{gZombatarAtlas.mTexture, 0},
        &graphics.mClipRect, graphics.mColorizeImages ? graphics.mColor : Color::White,
        graphics.mDrawMode, source, transform, linearFilter);
}
}

void DrawZombatarImage(Graphics* graphics, ZombatarImage image, float x, float y)
{
    if (image == ZombatarImage::None)
        return;
    const TextureRegion& source = gZombatarAtlas.mImages[static_cast<std::size_t>(image)];
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
    DrawRegion(*graphics,image,destination,Rect(0,0,source.mWidth,source.mHeight),scaled && !graphics->mFastStretch);
}

void DrawZombatarImage(Graphics* graphics, ZombatarImage image,
    float x, float y, int width, int height)
{
    if (image == ZombatarImage::None)
        return;
    const TextureRegion& source = gZombatarAtlas.mImages[static_cast<std::size_t>(image)];
    DrawRegion(*graphics,image,
        Rect(int(x + graphics->mTransX), int(y + graphics->mTransY), width, height),
        Rect(0,0,source.mWidth,source.mHeight), !graphics->mFastStretch);
}

void DrawZombatarImage(Graphics* graphics, ZombatarImage image,
    const Rect& destination, const Rect& source)
{
    if (image == ZombatarImage::None)
        return;
    const TextureRegion& packed = gZombatarAtlas.mImages[static_cast<std::size_t>(image)];
    DrawRegion(*graphics,image,
        Rect(int(destination.mX + graphics->mTransX), int(destination.mY + graphics->mTransY),
            destination.mWidth, destination.mHeight), source, !graphics->mFastStretch);
}
