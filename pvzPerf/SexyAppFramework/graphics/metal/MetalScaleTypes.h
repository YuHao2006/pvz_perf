#pragma once
#include "SexyAppFramework/effect/ScaleEffectSizing.h"
#include <cstdint>

namespace Sexy {
struct MetalScaleImage {
    void* texture{};
    uint32_t format{}, width{}, height{};
};
struct MetalScaleStep {
    ScaleEffectRuntimeDesc* effect{};
    ScaleEffectScaling scaling{};
};
}
