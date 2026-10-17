#include "ScaleEffectSizing.h"
#include <algorithm>
#include <cmath>
#include <bit>
#include <stdexcept>
#include <limits>

namespace Sexy {
std::vector<uint32_t> ScaleEffectSizing::BuildConstants(const ScaleEffectRuntimeDesc& effect,
    int inputW, int inputH, int outputW, int outputH)
{
    if (inputW <= 0 || inputH <= 0 || outputW <= 0 || outputH <= 0 || effect.mPasses.empty())
        throw std::invalid_argument("Invalid scale constant dimensions/passes");
    const auto word = [](float value) { return std::bit_cast<uint32_t>(value); };
    std::vector<uint32_t> values = {
        uint32_t(inputW), uint32_t(inputH), uint32_t(outputW), uint32_t(outputH),
        word(1.0f/inputW), word(1.0f/inputH), word(1.0f/outputW), word(1.0f/outputH),
        word(float(outputW)/inputW), word(float(outputH)/inputH)
    };
    for (size_t i = 0; i + 1 < effect.mPasses.size(); ++i) {
        const auto& pass = effect.mPasses[i];
        if (!pass.mPSStyle) continue;
        if (pass.mOutputs.empty()) throw std::invalid_argument("PS pass has no output");
        const auto id = pass.mOutputs[0];
        if (ScaleSlot(id) >= effect.mTextures.size())
            throw std::invalid_argument("PS pass output is missing");
        const auto& texture = effect.mTextures[ScaleSlot(id)];
        if (!texture.mSource.empty()) throw std::invalid_argument("PS pass output is read-only");
        bool widthOk = true, heightOk = true;
        const int w = (id == effect.mOutput || texture.mWidthExpr.empty()) ? outputW :
            EvalSizeExpr(texture.mWidthExpr,inputW,inputH,outputW,outputH,widthOk);
        const int h = (id == effect.mOutput || texture.mHeightExpr.empty()) ? outputH :
            EvalSizeExpr(texture.mHeightExpr,inputW,inputH,outputW,outputH,heightOk);
        if (!widthOk || !heightOk || w <= 0 || h <= 0)
            throw std::invalid_argument("Invalid PS pass output dimensions");
        values.insert(values.end(),{uint32_t(w),uint32_t(h),word(1.0f/w),word(1.0f/h)});
    }
    values.resize((values.size()+3)&~size_t(3),0);
    return values;
}

int ScaleEffectSizing::EvalSizeExpr(const ScaleSizeExpr& expression,
    int inputW, int inputH, int outputW, int outputH, bool& ok)
{
    ok = false;
    if (expression.empty()) return 1; // Legacy empty-expression failure sentinel.
    std::vector<int32_t> stack;
    stack.reserve(expression.size());
    for (const auto& instruction : expression) {
        switch (instruction.mOp) {
        case ScaleSizeOp::Literal: stack.push_back(instruction.mLiteral); break;
        case ScaleSizeOp::InputWidth: stack.push_back(inputW); break;
        case ScaleSizeOp::InputHeight: stack.push_back(inputH); break;
        case ScaleSizeOp::OutputWidth: stack.push_back(outputW); break;
        case ScaleSizeOp::OutputHeight: stack.push_back(outputH); break;
        case ScaleSizeOp::Add:
        case ScaleSizeOp::Subtract:
        case ScaleSizeOp::Multiply:
        case ScaleSizeOp::Divide: {
            if (stack.size() < 2) return 0;
            const int64_t right = stack.back(); stack.pop_back();
            const int64_t left = stack.back(); stack.pop_back();
            int64_t value = 0;
            switch (instruction.mOp) {
            case ScaleSizeOp::Add: value = left + right; break;
            case ScaleSizeOp::Subtract: value = left - right; break;
            case ScaleSizeOp::Multiply: value = left * right; break;
            case ScaleSizeOp::Divide:
                if (!right) return 0;
                value = left / right; break;
            default: break;
            }
            if (value < INT32_MIN || value > INT32_MAX) return 0;
            stack.push_back(int32_t(value));
            break;
        }
        default: return 0;
        }
    }
    ok = stack.size() == 1 && stack[0] > 0;
    return ok ? stack[0] : 0;
}

bool ScaleEffectSizing::ComputePipelineOutputSize(
    const std::vector<ScaleEffectRuntimeDesc*>& effects,
    const std::vector<ScaleEffectScaling>& scalings,
    int srcW, int srcH, int targetW, int targetH, int& outW, int& outH)
{
    outW = outH = 0;
    if (srcW <= 0 || srcH <= 0 || targetW <= 0 || targetH <= 0) return false;
    if (!scalings.empty() && scalings.size() != effects.size()) return false;
    if (effects.empty()) { outW = srcW; outH = srcH; return true; }
    for (const auto& scaling : scalings)
        if (!std::isfinite(scaling.mScaleX) || !std::isfinite(scaling.mScaleY) ||
            scaling.mScaleX <= 0 || scaling.mScaleY <= 0 ||
            scaling.mScalingType < SCALE_SCALING_NORMAL || scaling.mScalingType > SCALE_SCALING_FILL)
            return false;
    const auto rounded = [](float value) {
        const float result = value + 0.5f;
        if (!std::isfinite(result) || result < 1 || double(result) > std::numeric_limits<int>::max()) return 0;
        return int(result);
    };
    int currentW = srcW, currentH = srcH;
    for (size_t i = 0; i < effects.size(); ++i) {
        if (!effects[i]) return false;
        const auto& effect = *effects[i];
        const auto* output = ScaleSlot(effect.mOutput) < effect.mTextures.size() ?
            &effect.mTextures[ScaleSlot(effect.mOutput)] : nullptr;
        int effectW = currentW, effectH = currentH;
        if (output && (!output->mWidthExpr.empty() || !output->mHeightExpr.empty())) {
            bool widthOk = false, heightOk = false;
            effectW = EvalSizeExpr(output->mWidthExpr,currentW,currentH,targetW,targetH,widthOk);
            effectH = EvalSizeExpr(output->mHeightExpr,currentW,currentH,targetW,targetH,heightOk);
            if (!widthOk || !heightOk) return false;
        } else if (i < scalings.size() &&
            (scalings[i].mScalingType != SCALE_SCALING_NORMAL || scalings[i].mScaleX != 1 || scalings[i].mScaleY != 1)) {
            const auto& scaling = scalings[i];
            switch (scaling.mScalingType) {
            case SCALE_SCALING_NORMAL:
                effectW = rounded(currentW * scaling.mScaleX); effectH = rounded(currentH * scaling.mScaleY); break;
            case SCALE_SCALING_ABSOLUTE:
                effectW = rounded(scaling.mScaleX); effectH = rounded(scaling.mScaleY); break;
            case SCALE_SCALING_FILL:
                effectW = targetW; effectH = targetH; break;
            case SCALE_SCALING_FIT: {
                const float scaleW = float(targetW) / float(currentW), scaleH = float(targetH) / float(currentH);
                const float fit = scaleW < scaleH ? scaleW : scaleH;
                effectW = rounded(currentW * fit * scaling.mScaleX);
                effectH = rounded(currentH * fit * scaling.mScaleY); break;
            }
            }
        }
        if (effectW <= 0 || effectH <= 0) return false;
        currentW = effectW; currentH = effectH;
    }
    outW = currentW; outH = currentH;
    return true;
}
}
