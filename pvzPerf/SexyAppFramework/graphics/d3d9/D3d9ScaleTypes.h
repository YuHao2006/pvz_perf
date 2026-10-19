#pragma once
#include "SexyAppFramework/effect/ScaleEffectSizing.h"
struct IDirect3DTexture9;
namespace Sexy {
struct D3d9ScaleImage {
    IDirect3DTexture9* texture{};
    unsigned int format{}, width{}, height{};
};
struct D3d9ScaleStep {
    ScaleEffectRuntimeDesc* effect{};
    ScaleEffectScaling scaling{};
};
}
