#include <metal_stdlib>
#include "../MetalShaderTypes.h"
using namespace metal;

// MSL language specification 1.6: -fno-fast-math selects safe math but
// contraction remains enabled unless separately disabled. This source alone
// also compiles with -ffp-contract=off; do not use HLSL's precise qualifier.
#pragma STDC FP_CONTRACT OFF

// MSL has no mutable global device-buffer bindings. Keep the shared particle
// evaluator in a thread-local object whose methods read the resident arenas.
struct MetalParticleEvaluator {
    const device uint* arena;
    const device uint* dynamic;
    uint geometry;
    float pStatic(uint index) {
        return as_type<float>(arena[geometry + (index / 6u) * 8u + index % 6u]);
    }
    float pDynamic(uint index) { return as_type<float>(dynamic[index]); }
#define vec2 float2
#define vec4 float4
#define uvec2 uint2
#define floatBitsToUint(value) as_type<uint>(value)
#define equal(a,b) ((a)==(b))
#include "../../GpuParticleShader.glsl"
#undef vec2
#undef vec4
#undef uvec2
#undef floatBitsToUint
#undef equal
};

float reanimValue(const device uint* blob, uint offset) { return as_type<float>(blob[offset]); }
float reanimLerp(float a, float b, float t) { return a + (b - a) * t; }
float reanimSin(float radians) {
    float t = radians * 0.15915494f + 0.5f; t -= floor(t);
    float x = (t - 0.5f) * 6.2831853f;
    float x2 = x * x;
    return x * (0.999999707f + x2 * (-0.166665772f + x2 * (0.008332558f +
        x2 * (-0.000198125755f + x2 * (2.70405121e-06f + x2 * -2.05342445e-08f)))));
}
float reanimCos(float radians) { return reanimSin(radians + 1.57079633f); }
float4 reanimCorner(float2 point, float2 uv, float4 transform, float2 translation) {
    float x = transform.x * point.x + transform.y * point.y + translation.x;
    float y = transform.z * point.x + transform.w * point.y + translation.y;
    return float4(x, y, uv);
}
bool reanimInside(float4 point, int edge, float boundary) {
    float coordinate = (edge == 0 || edge == 2) ? point.x : point.y;
    return edge < 2 ? coordinate >= boundary : coordinate < boundary;
}
float4 reanimIntersection(float4 a, float4 b, int edge, float boundary) {
    float av = (edge == 0 || edge == 2) ? a.x : a.y;
    float bv = (edge == 0 || edge == 2) ? b.x : b.y;
    float t = (boundary - av) / (bv - av);
    return a + (b - a) * t;
}
void reanimEmit(device MetalGpuVertex* output, uint index, float4 point, float4 color,
    uint slot, uint samplerIndex) {
    MetalGpuVertex v;
    v.position[0] = point.x; v.position[1] = point.y;
    v.color[0] = color.x; v.color[1] = color.y; v.color[2] = color.z; v.color[3] = color.w;
    v.uv[0] = point.z; v.uv[1] = point.w; v.slot = slot; v.samplerIndex = samplerIndex;
    output[index] = v;
}
kernel void pvz_reanim_kernel(
    const device uint* blob [[buffer(0)]],
    const device uint* instances [[buffer(1)]],
    const device uint* packets [[buffer(2)]],
    device MetalGpuVertex* output [[buffer(3)]],
    constant uint2& batch [[buffer(4)]],
    uint id [[thread_position_in_grid]]) {
    if (id >= batch.y) return;
    output += id * 18;
    const MetalGpuVertex zero = {};
    for (uint i = 0; i < 18; ++i) output[i] = zero;
    const device uint* packet = packets + (batch.x + id) * 8;
    const device uint* instance = instances + packet[1] * 24;
    uint header = instance[16];
    if ((instance[19] & 16u) != 0u) {
        MetalParticleEvaluator evaluator{blob, instances, blob[header + 2]};
        const auto result = evaluator.pParticle(uint(reanimValue(instance, 8)),
            uint(reanimValue(instance, 9)));
        if (!result.visible) return;
        float4 polygon[8];
        polygon[0] = result.point0; polygon[1] = result.point1;
        polygon[2] = result.point2; polygon[3] = result.point3;
        int count = 4;
        if ((instance[19] & 4u) != 0u) {
            const float4 clip = float4(reanimValue(instance, 20), reanimValue(instance, 21),
                reanimValue(instance, 22), reanimValue(instance, 23));
            for (int edge = 0; edge < 4; ++edge) {
                if (count < 2) return;
                float4 clipped[8]; int written = 0;
                for (int i = 0; i < count; ++i) {
                    const float4 p = polygon[(i + count - 1) % count], q = polygon[i];
                    const bool pIn = reanimInside(p, edge, clip[edge]);
                    const bool qIn = reanimInside(q, edge, clip[edge]);
                    if (pIn != qIn)
                        clipped[written++] = reanimIntersection(p, q, edge, clip[edge]);
                    if (qIn) clipped[written++] = q;
                }
                count = written;
                for (int i = 0; i < count; ++i) polygon[i] = clipped[i];
            }
        }
        const uint slot = instance[18] | (packet[3] & 0x78000000u);
        const uint samplerIndex = instance[19] & 3u;
        const uint drawOffset = uint(reanimValue(instance, 8));
        uint written = 0;
        for (int i = 1; i + 1 < count; ++i) {
            reanimEmit(output, written++, evaluator.pOverlay(polygon[0], drawOffset),
                result.color, slot, samplerIndex);
            reanimEmit(output, written++, evaluator.pOverlay(polygon[i], drawOffset),
                result.color, slot, samplerIndex);
            reanimEmit(output, written++, evaluator.pOverlay(polygon[i + 1], drawOffset),
                result.color, slot, samplerIndex);
        }
        return;
    }
    uint track = blob[header] + packet[0] * 4;
    uint keyBase = blob[header + 1] + blob[track] * 12;
    uint a = keyBase + instance[0] * 12, b = keyBase + instance[1] * 12;
    float t = reanimValue(instance, 4);
    int frame = as_type<int>(blob[a + 7]);
    uint image = blob[a + 8];
    float alpha = reanimLerp(reanimValue(blob, a + 6), reanimValue(blob, b + 6), t);
    float byteAlpha = alpha * float((packet[2] >> 24) & 255);
    byteAlpha = clamp(trunc(byteAlpha > 0 ? byteAlpha + 0.5f : byteAlpha - 0.5f), 0.0f, 255.0f);
    uint geometryBase = blob[header + 2];
    uint base = geometryBase + image * 8;
    uint source = geometryBase + (instance[2] * instance[17] + image) * 8;
    float width = reanimValue(blob, source), height = reanimValue(blob, source + 1);
    if (frame < 0 || image == 0 || byteAlpha <= 0 || width <= 0 || height <= 0) return;
    if ((packet[3] & 1) != 0 && frame != -1 && as_type<int>(blob[b + 7]) == -1 && t > 0) return;
    float4 color = float4(float((packet[2] >> 16) & 255), float((packet[2] >> 8) & 255),
        float(packet[2] & 255), byteAlpha) / 255.0f;
    uint slot = instance[18] | (packet[3] & 0x78000000u), samplerIndex = instance[19] & 3;
    float skewX = -(reanimLerp(reanimValue(blob, a + 2), reanimValue(blob, b + 2), t) * 0.017453292f);
    float skewY = -(reanimLerp(reanimValue(blob, a + 3), reanimValue(blob, b + 3), t) * 0.017453292f);
    float sx = reanimLerp(reanimValue(blob, a + 4), reanimValue(blob, b + 4), t);
    float sy = reanimLerp(reanimValue(blob, a + 5), reanimValue(blob, b + 5), t);
    float m00 = reanimCos(skewX) * sx, m10 = -reanimSin(skewX) * sx;
    float m01 = reanimSin(skewY) * sy, m11 = reanimCos(skewY) * sy;
    float tx = reanimLerp(reanimValue(blob, a), reanimValue(blob, b), t);
    float ty = reanimLerp(reanimValue(blob, a + 1), reanimValue(blob, b + 1), t);
    float cx = m00 * (reanimValue(blob, base) * 0.5f) + m01 * (reanimValue(blob, base + 1) * 0.5f) + tx;
    float cy = m10 * (reanimValue(blob, base) * 0.5f) + m11 * (reanimValue(blob, base + 1) * 0.5f) + ty;
    float4 overlayX = float4(reanimValue(instance, 8), reanimValue(instance, 9),
        reanimValue(instance, 10), reanimValue(instance, 11));
    float4 overlayY = float4(reanimValue(instance, 12), reanimValue(instance, 13),
        reanimValue(instance, 14), reanimValue(instance, 15));
    float xx = overlayX.x * m00 + overlayX.y * m10, xy = overlayX.x * m01 + overlayX.y * m11;
    float yx = overlayY.x * m00 + overlayY.y * m10, yy = overlayY.x * m01 + overlayY.y * m11;
    float ox = overlayX.x * cx + overlayX.y * cy + overlayX.z;
    float oy = overlayY.x * cx + overlayY.y * cy + overlayY.z;
    float translateX = (reanimValue(packet, 4) + reanimValue(instance, 5)) - 0.5f;
    float translateY = (reanimValue(packet, 5) + reanimValue(instance, 6)) - 0.5f;
    if ((instance[19] & 8) != 0) {
        translateX = reanimValue(instance, 5); translateY = reanimValue(instance, 6);
    }
    ox += translateX; oy += translateY;
    float4 transform = float4(xx, xy, yx, yy);
    float2 translation = float2(ox, oy);
    float u0 = reanimValue(blob, source + 2), v0 = reanimValue(blob, source + 3);
    float u1 = reanimValue(blob, source + 4), v1 = reanimValue(blob, source + 5);
    float4 polygon[8];
    polygon[0] = reanimCorner(float2(-width / 2, -height / 2), float2(u0, v0), transform, translation);
    polygon[1] = reanimCorner(float2(-width / 2, height / 2), float2(u0, v1), transform, translation);
    polygon[2] = reanimCorner(float2(width / 2, height / 2), float2(u1, v1), transform, translation);
    polygon[3] = reanimCorner(float2(width / 2, -height / 2), float2(u1, v0), transform, translation);
    if ((instance[19] & 4) == 0 || (packet[3] & 2) != 0) {
        const uint order[6] = {0, 1, 3, 1, 3, 2};
        for (uint i = 0; i < 6; ++i) reanimEmit(output, i, polygon[order[i]], color, slot, samplerIndex);
        return;
    }
    float4 clip = float4(reanimValue(instance, 20), reanimValue(instance, 21),
        reanimValue(instance, 22), reanimValue(instance, 23));
    int count = 4;
    for (int edge = 0; edge < 4; ++edge) {
        if (count < 2) return;
        float4 clipped[8]; int written = 0;
        for (int i = 0; i < count; ++i) {
            float4 p = polygon[(i + count - 1) % count], q = polygon[i];
            bool pIn = reanimInside(p, edge, clip[edge]), qIn = reanimInside(q, edge, clip[edge]);
            if (pIn && qIn) clipped[written++] = q;
            else if (pIn != qIn) {
                clipped[written++] = reanimIntersection(p, q, edge, clip[edge]);
                if (qIn) clipped[written++] = q;
            }
        }
        count = written;
        for (int i = 0; i < count; ++i) polygon[i] = clipped[i];
    }
    uint written = 0;
    for (int i = 1; i + 1 < count; ++i) {
        reanimEmit(output, written++, polygon[0], color, slot, samplerIndex);
        reanimEmit(output, written++, polygon[i], color, slot, samplerIndex);
        reanimEmit(output, written++, polygon[i + 1], color, slot, samplerIndex);
    }
}
