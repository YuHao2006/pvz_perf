#pragma once
#include "SexyAppFramework/effect/ScaleEffectSizing.h"

namespace Sexy {
struct OpenGLScaleImage {
    unsigned int texture{};
    unsigned int format{}, width{}, height{};
};
struct OpenGLScaleStep {
    ScaleEffectRuntimeDesc* effect{};
    ScaleEffectScaling scaling{};
};
}
