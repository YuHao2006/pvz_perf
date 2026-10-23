#include "common.hlsl"
sampler2D alphaImage : register(s1);

float4 copyValue(float2 position)
{
    float2 inputPosition = position + rectangle.xy;
    if (any(inputPosition < 0.0) || any(inputPosition >= sourceRect.zw)) return 0.0;
    float4 rgba = fetchSource(inputPosition);
    if (sourceFlags.x != 0.0)
        rgba.rgb = rgba.a > 0.0 ? rgba.rgb / rgba.a : float3(0.0, 0.0, 0.0);
    return toBytes(rgba);
}
float4 copyPS(float2 vpos : VPOS) : COLOR0
{
    float2 position = floor(vpos);
    clip(rectangle.zw - position - 0.5);
    return copyValue(position) / 255.0;
}
// Return byte1 for >>8 &255, or saturated floor(wrappedProduct/255).
float tintChannel(float value, float4 bytes)
{
    float p = value * bytes.x;
    float b0 = p - floor(p / 256.0) * 256.0;
    float carry = floor(p / 256.0);
    p = value * bytes.y + carry;
    float b1 = p - floor(p / 256.0) * 256.0;
    carry = floor(p / 256.0);
    p = value * bytes.z + carry;
    float b2 = p - floor(p / 256.0) * 256.0;
    carry = floor(p / 256.0);
    p = value * bytes.w + carry;
    float b3 = p - floor(p / 256.0) * 256.0;
    if (modes.w != 0.0) return b1;
    if (b3 != 0.0 || b2 != 0.0) return 255.0;
    return min(integerDivide(b1 * 256.0 + b0, 255.0), 255.0);
}
float4 colorizePS(float2 vpos : VPOS) : COLOR0
{
    float2 position = floor(vpos);
    clip(rectangle.zw - position - 0.5);
    float4 value = copyValue(position);
    return float4(tintChannel(value.r, tintRed), tintChannel(value.g, tintGreen),
        tintChannel(value.b, tintBlue), tintChannel(value.a, tintAlpha)) / 255.0;
}
float byteOr(float a, float b)
{
    float result = 0.0;
    float bit = 1.0;
    [unroll] for (int i = 0; i < 8; ++i) {
        float halfA = floor(a / 2.0), halfB = floor(b / 2.0);
        result += max(a - halfA * 2.0, b - halfB * 2.0) * bit;
        a = halfA;
        b = halfB;
        bit *= 2.0;
    }
    return result;
}
float4 composeAlphaPS(float2 vpos : VPOS) : COLOR0
{
    float2 position = floor(vpos);
    clip(rectangle.zw - position - 0.5);
    float4 value = fetchSource(position);
    float4 mask = tex2Dlod(alphaImage, float4((alphaRect.xy + position + 0.5) * alphaTexture.xy, 0, 0));
    float alpha = floor(mask.b * 255.0 + 0.5);
    if (modes.z != 0.0)
        value = float4(packedColor.rgb, byteOr(packedColor.a, alpha)) / 255.0;
    else value.a = alpha / 255.0;
    return value;
}
