#include "common.hlsl"

float4 presentPS(float2 uv : TEXCOORD0) : COLOR0
{
    if (presentation.x != 0.0) uv.y = 1.0 - uv.y;
    float2 position = uv * sourceRect.zw;
    if (sampling.x == 0.0) return fetchSource(clamp(floor(position), 0.0, sourceRect.zw - 1.0));
    position -= 0.5;
    float2 base = floor(position);
    float2 weight = position - base;
    float4 a = fetchSource(clamp(base, 0.0, sourceRect.zw - 1.0));
    float4 b = fetchSource(clamp(base + float2(1, 0), 0.0, sourceRect.zw - 1.0));
    float4 c = fetchSource(clamp(base + float2(0, 1), 0.0, sourceRect.zw - 1.0));
    float4 d = fetchSource(clamp(base + float2(1, 1), 0.0, sourceRect.zw - 1.0));
    return lerp(lerp(a, b, weight.x), lerp(c, d, weight.x), weight.y);
}
