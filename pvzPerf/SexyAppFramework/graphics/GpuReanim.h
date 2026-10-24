#pragma once
#include <cstddef>
#include <cstdint>
#include <span>
#include <limits>

namespace Sexy {
// Logical track indexes are identical in CPU and GPU tables. CPU-only tracks
// have no key allocation and retain this sentinel at their original index.
inline constexpr uint32_t GpuReanimNoKeys = std::numeric_limits<uint32_t>::max();
struct GpuReanimKey {
    float transX, transY, skewX, skewY, scaleX, scaleY, alpha;
    int32_t frame;
    uint32_t imageSlot, padding[3]{};
};
struct GpuReanimTrack {
    uint32_t keyOffset, keyCount, flags = 0, padding = 0;
};
struct GpuReanimGeometry {
    float width, height, u0, v0, u1, v1;
    uint32_t padding[2]{};
};
struct GpuReanimDefinition {
    std::span<const GpuReanimTrack> tracks;
    std::span<const GpuReanimKey> keys;
    // Variant-major image slots. Variant zero also supplies the base pivot.
    std::span<const GpuReanimGeometry> geometry;
    uint32_t imageSlotCount, variantCount;
};
// One image-track draw, in painter order. Text, fullscreen and runtime blended
// transforms remain CPU draws. Callers precompose track/instance/Graphics color;
// the GPU rounds interpolated source alpha times that byte alpha.
struct GpuReanimDraw {
    uint32_t track, before, after, variant;
    float fraction, translateX, translateY, padding0 = 0;
    float overlay00, overlay01, overlay02, padding1 = 0;
    float overlay10, overlay11, overlay12, padding2 = 0;
    // Native little-endian 0xAARRGGBB, matching the existing draw contract.
    uint32_t color, samplingFlags = 0, sampler = 0, truncate = 0;
};
// Shared once by an animation render group. Translation is raw Graphics
// translation: the GPU evaluates (track shake + translation) - 0.5 in the
// original arithmetic order.
struct GpuReanimInstance {
    uint32_t before, after, variant, padding0 = 0;
    float fraction, translateX, translateY, padding1 = 0;
    float overlay00, overlay01, overlay02, padding2 = 0;
    float overlay10, overlay11, overlay12, padding3 = 0;
};
struct GpuReanimTrackDraw {
    static constexpr uint32_t Truncate = 1u;
    static constexpr uint32_t IgnoreDefaultClip = 2u;
    uint32_t track, color, samplingFlags = 0, flags = 0;
    float shakeX = 0, shakeY = 0;
    uint32_t padding[2]{};
};
static_assert(sizeof(GpuReanimKey) == 48 && offsetof(GpuReanimKey, frame) == 28);
static_assert(sizeof(GpuReanimTrack) == 16);
static_assert(sizeof(GpuReanimGeometry) == 32);
static_assert(sizeof(GpuReanimDraw) == 80 && offsetof(GpuReanimDraw, color) == 64);
static_assert(sizeof(GpuReanimInstance) == 64);
static_assert(sizeof(GpuReanimTrackDraw) == 32 && offsetof(GpuReanimTrackDraw, shakeX) == 16);
}
