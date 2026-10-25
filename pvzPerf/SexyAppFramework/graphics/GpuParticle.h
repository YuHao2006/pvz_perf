#pragma once
#include <cstddef>
#include <cstdint>
#include <span>

namespace Sexy {
// Numeric float words, addressed relative to the beginning of this blob.
// Header: emitter table offset, emitter count, geometry offset, rects per
// variant. Each emitter is 32 words: flags, channel-is-set mask (RGBA, scale,
// stretch, spin, position), rect offset/count, frames, animated, animation-rate
// is-set, reserved, then 17 track offsets in the order below; unused words zero.
// Track: node count, followed by nodes of 8 words: time, low, high, curve,
// distribution, reserved[3]. Geometry: width,height,u0,v0,u1,v1,reserved[2].
// Omitted/default tracks still carry their actual constant value.
enum class GpuParticleTrack : uint32_t {
    SystemRed, SystemGreen, SystemBlue, SystemAlpha, SystemBrightness,
    Red, Green, Blue, Alpha, Brightness, Scale, Stretch,
    ClipTop, ClipBottom, ClipLeft, ClipRight, AnimationRate, Count
};
inline constexpr uint32_t GpuParticleEmitterWords = 32;
inline constexpr uint32_t GpuParticleNodeWords = 8;

// Raw simulation state. Nanosecond fields are copied verbatim; only shaders
// derive time fractions, animation frames, colors, clipping and transforms.
// The first state is the drawn particle, followed by its crossfade ancestors.
// Every ancestor may use a different emitter from the same static definition.
struct GpuParticleState {
    uint32_t emitter = 0;
    int32_t imageFrame = 0, frameOverride = -1;
    uint32_t flags = 0;
    float positionX = 0, positionY = 0, spin = 0, scaleOverride = 1;
    float colorOverride[4]{255,255,255,255};
    int64_t ageNs = 0, durationNs = 0, systemAgeNs = 0, systemDurationNs = 0;
    int64_t crossFadeDurationNs = 0, animationElapsedNs = 0, animationIntegral = 0;
    float particleWeights[16]{};
    float systemWeights[5]{};
    uint32_t reserved = 0;
};
// Formula particles use the same common prefix as GpuParticleState, followed
// by an analytic motion segment. Keeping the prefix identical lets the
// renderer validate emitter/visual state without introducing a per-particle
// motion-kind field.
struct GpuParticleFormulaState : GpuParticleState {
    int64_t segmentElapsedNs = 0;
    float originX = 0, originY = 0;
    float velocityX = 0, velocityY = 0;
    float accelerationX = 0, accelerationY = 0;
    float spinOrigin = 0, spinRate = 0;
};
struct GpuParticleDraw {
    uint32_t variant = 0, frameSource = 0;
    float translateX = 0, translateY = 0;
    uint32_t samplingFlags = 0;
    float targetWidth = 0, targetHeight = 0;
    float overlay00 = 1, overlay01 = 0, overlay02 = 0;
    float overlay10 = 0, overlay11 = 1, overlay12 = 0;
    // Words 13 and 14 are consumed by the resident particle shader.
    // stateWords is the stride of one state in 32-bit words (48 or 56).
    uint32_t stateWords = 48;
    uint32_t motionModel = 0; // 0 discrete, 1 formula; one value per draw.
    uint32_t reserved = 0;
};
static_assert(sizeof(GpuParticleState) == 192);
static_assert(sizeof(GpuParticleFormulaState) == 232);
static_assert(offsetof(GpuParticleFormulaState, segmentElapsedNs) == sizeof(GpuParticleState));
static_assert(offsetof(GpuParticleState, ageNs) == 48);
static_assert(offsetof(GpuParticleState, particleWeights) == 104);
static_assert(sizeof(GpuParticleDraw) == 64);
}
