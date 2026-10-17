#pragma once
#include <cstddef>
#include <limits>

namespace Sexy {
static_assert(sizeof(unsigned int) == 4 && std::numeric_limits<unsigned int>::digits == 32);
static_assert(sizeof(int) == 4 && std::numeric_limits<int>::digits == 31);
static_assert(sizeof(float) == 4 && std::numeric_limits<float>::is_iec559);
// Shared game draw contract. Backend SDK types stay in backend implementation.
struct GpuVertex {
    static constexpr unsigned int kIndependentColorFilter = 0x40000000u;
    static constexpr unsigned int kColorFilterMask = 0x30000000u;
    static constexpr unsigned int kAlphaEdgeFilter = 0x08000000u;
    static constexpr unsigned int kOpaqueInput = 0x04000000u;
    float x, y;
    float r, g, b, a;
    float u, v;
    // Low 12 bits select a texture; upper bits describe its sampling semantics.
    unsigned int slot;
    // Bit 0 selects linear filtering; bit 1 selects repeat addressing.
    unsigned int sampler;
};
static_assert(sizeof(GpuVertex) == 40);
static_assert(alignof(GpuVertex) == 4);
static_assert(offsetof(GpuVertex, r) == 8 && offsetof(GpuVertex, u) == 24);
static_assert(offsetof(GpuVertex, slot) == 32 && offsetof(GpuVertex, sampler) == 36);
enum class GpuBlend { Normal, Additive, Opaque };
struct GpuClip { int x, y, width, height; };
struct GpuPoint { int x, y; };
struct GpuFontGlyph {
    int sourceX, sourceY, sourceWidth, sourceHeight;
    int targetX, targetY, targetWidth, targetHeight;
};
enum class GpuImageOperation : unsigned int { Copy, Colorize };
struct GpuImageProcessing {
    int x, y, width, height;
    int red, green, blue, alpha;
    GpuImageOperation operation;
};
static_assert(sizeof(GpuImageOperation) == 4);
static_assert(sizeof(GpuImageProcessing) == 36 && alignof(GpuImageProcessing) == 4);
static_assert(offsetof(GpuImageProcessing, operation) == 32);
}
