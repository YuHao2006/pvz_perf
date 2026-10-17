#pragma once
#include "ScaleEffectCompiler.h"

namespace Sexy {
// CPU metadata calculation only. GPU execution belongs to VulkanScalePipeline.
enum ScaleScalingType {
    SCALE_SCALING_NORMAL = 0,
    SCALE_SCALING_FIT = 1,
    SCALE_SCALING_ABSOLUTE = 2,
    SCALE_SCALING_FILL = 3
};
struct ScaleEffectScaling {
    int mScalingType = SCALE_SCALING_NORMAL;
    float mScaleX = 1.0f, mScaleY = 1.0f;
};
class ScaleEffectSizing {
public:
    static bool ComputePipelineOutputSize(
        const std::vector<ScaleEffectRuntimeDesc*>& effects,
        const std::vector<ScaleEffectScaling>& scalings,
        int srcW, int srcH, int targetW, int targetH, int& outW, int& outH);
    static int EvalSizeExpr(const ScaleSizeExpr& expression,
        int inputW, int inputH, int outputW, int outputH, bool& ok);
    // Magpie's __CB1 is per EFFECT, not per pass. Only the additional PS-pass
    // output pairs vary by pass. Returned words have 16-byte buffer alignment.
    static std::vector<uint32_t> BuildConstants(const ScaleEffectRuntimeDesc& effect,
        int inputW, int inputH, int outputW, int outputH);
};
}
