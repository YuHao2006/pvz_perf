#pragma once
#include "misc/Rect.h"

namespace Sexy
{
// Normalized texture coordinates plus the independent logical drawing size.
// Width/height describe sprite geometry, never the containing atlas texture.
struct TextureRegion
{
    float mU0 = 0;
    float mV0 = 0;
    float mU1 = 0;
    float mV1 = 0;
    int mWidth = 0;
    int mHeight = 0;
};

// Only dynamic Image crops need this bridge. Offline atlas regions already
// contain UVs and never pass through pixel normalization while drawing.
inline TextureRegion PixelSourceToUv(const Rect& source, int width, int height)
{
    return {float(source.mX)/width,float(source.mY)/height,
        (float(source.mX)+source.mWidth)/width,
        (float(source.mY)+source.mHeight)/height,source.mWidth,source.mHeight};
}

inline TextureRegion CropTextureRegion(const TextureRegion& region, const Rect& local)
{
    const float du=(region.mU1-region.mU0)/region.mWidth;
    const float dv=(region.mV1-region.mV0)/region.mHeight;
    return {region.mU0+local.mX*du,region.mV0+local.mY*dv,
        region.mU0+(float(local.mX)+local.mWidth)*du,
        region.mV0+(float(local.mY)+local.mHeight)*dv,local.mWidth,local.mHeight};
}
}
