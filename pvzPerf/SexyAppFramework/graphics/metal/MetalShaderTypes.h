#pragma once

// Shared by Objective-C++ and hand-written MSL. Scalar arrays deliberately avoid
// float4/int4 alignment changing the existing packed CPU upload layouts.
// Scene: vertices buffer(0), constants buffer(1), fragment images buffer(2).
// Fragment samplers 0..3: nearest/clamp, linear/clamp, nearest/repeat, linear/repeat.
// images argument IDs 0..4095 require argument-buffer Tier 2. The encoder must
// declare indirect texture residency with useResource(s) before drawing.
// Compile with fast math disabled to retain byte-quantization boundaries.
struct MetalGpuVertex
{
    float position[2];
    float color[4];
    float uv[2];
    unsigned int slot;
    unsigned int samplerIndex;
};

struct MetalSceneConstants
{
    float sceneWidth;
    float sceneHeight;
    unsigned int premultipliedOutput;
    unsigned int coverageInput;
};

struct MetalPoolVertex
{
    float x, y, phaseX, phaseY;
};
// Vertex-only buffer(3); scene/fragment bindings stay unchanged.
struct MetalPoolConstants
{
    float width, height, transX, transY;
    float time1, time2, time3, time5;
    float clipX, clipY, clipWidth, clipHeight;
    unsigned int layer, night, slot, samplerIndex;
};
static_assert(sizeof(MetalPoolVertex) == 16, "Pool vertex stride");
static_assert(sizeof(MetalPoolConstants) == 64, "Pool constants size");

// pvz_color_kernel: buffer(0), source texture(0), RGBA8Unorm target texture(1).
// operation == 0 copies; otherwise tint. Low sourceSlot bits are ignored.
struct MetalColorConstants
{
    int rectangle[4];
    int tint[4];
    unsigned int operation;
    int sourceWidth;
    int sourceHeight;
    unsigned int sourceSlot;
};

// pvz_alpha_kernel: buffer(0), base texture(0), alpha texture(1), target texture(2).
// Equal input dimensions required. The alpha mask stores coverage in blue.
struct MetalAlphaConstants
{
    int width;
    int height;
    unsigned int color;
    unsigned int colorOnly;
};

// pvz_font_kernel: buffer(0), source texture(0), RGBA32Float target texture(1).
// Positive source/destination extents required; dst must fit the target.
// Flags: samplingFlags bit27 sanding; sourceSlot bit26 opaque, bit31 generated.
struct MetalFontConstants
{
    int src[4];
    int dst[4];
    unsigned int white;
    int sourceWidth;
    int sourceHeight;
    unsigned int samplingFlags;
    unsigned int sourceSlot;
};

// pvz_caustic_kernel: buffer(0), 256x256 source texture(0),
// 128x64 RGBA8Unorm target texture(1). All time arithmetic wraps at 32 bits.
struct MetalCausticConstants
{
    unsigned int counter;
};

// pvz_hdr_vertex: vertices buffer(0), constants buffer(1).
// pvz_hdr_fragment: constants buffer(1), SDR UNORM source texture(0),
// linear/clamp sampler(0). Output is Rec.2020 PQ, not scRGB.
struct MetalPresentConstants
{
    float viewport[2];
    float padding[2];
    float hdr[4]; // paperWhite, maxNits, reinhardPaper, strength
};

static_assert(sizeof(float) == 4 && sizeof(int) == 4 &&
    sizeof(unsigned int) == 4, "Metal shader ABI requires 32-bit scalars");
static_assert(sizeof(MetalGpuVertex) == 40, "MetalGpuVertex stride");
static_assert(sizeof(MetalSceneConstants) == 16, "Scene constants size");
static_assert(sizeof(MetalColorConstants) == 48, "Color constants size");
static_assert(sizeof(MetalAlphaConstants) == 16, "Alpha constants size");
static_assert(sizeof(MetalFontConstants) == 52, "Font constants size");
static_assert(sizeof(MetalCausticConstants) == 4, "Caustic constants size");
static_assert(sizeof(MetalPresentConstants) == 32, "Presentation constants size");

#ifndef __METAL_VERSION__
#include <cstddef>
static_assert(offsetof(MetalGpuVertex, position) == 0 &&
    offsetof(MetalGpuVertex, color) == 8 && offsetof(MetalGpuVertex, uv) == 24 &&
    offsetof(MetalGpuVertex, slot) == 32 &&
    offsetof(MetalGpuVertex, samplerIndex) == 36, "Vertex field offsets");
static_assert(offsetof(MetalSceneConstants, sceneHeight) == 4 &&
    offsetof(MetalSceneConstants, premultipliedOutput) == 8 &&
    offsetof(MetalSceneConstants, coverageInput) == 12, "Scene field offsets");
static_assert(offsetof(MetalColorConstants, tint) == 16 &&
    offsetof(MetalColorConstants, operation) == 32 &&
    offsetof(MetalColorConstants, sourceWidth) == 36 &&
    offsetof(MetalColorConstants, sourceHeight) == 40 &&
    offsetof(MetalColorConstants, sourceSlot) == 44, "Color field offsets");
static_assert(offsetof(MetalAlphaConstants, height) == 4 &&
    offsetof(MetalAlphaConstants, color) == 8 &&
    offsetof(MetalAlphaConstants, colorOnly) == 12, "Alpha field offsets");
static_assert(offsetof(MetalFontConstants, dst) == 16 &&
    offsetof(MetalFontConstants, white) == 32 &&
    offsetof(MetalFontConstants, sourceWidth) == 36 &&
    offsetof(MetalFontConstants, sourceHeight) == 40 &&
    offsetof(MetalFontConstants, samplingFlags) == 44 &&
    offsetof(MetalFontConstants, sourceSlot) == 48, "Font field offsets");
static_assert(offsetof(MetalPresentConstants, padding) == 8 &&
    offsetof(MetalPresentConstants, hdr) == 16, "Presentation field offsets");
#endif
