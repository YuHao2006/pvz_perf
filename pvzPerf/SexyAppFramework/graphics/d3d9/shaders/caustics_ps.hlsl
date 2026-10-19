#include "common.hlsl"

// Factors are 1..65535. Every intermediate is an exactly representable integer.
float multiplyHigh16(float a, float b)
{
    float ah = floor(a / 256.0), bh = floor(b / 256.0);
    float al = a - ah * 256.0, bl = b - bh * 256.0;
    return ah * bh + floor((ah * bl + al * bh + floor(al * bl / 256.0)) / 256.0);
}
float blueAt(float2 coordinate)
{
    coordinate -= floor(coordinate / 256.0) * 256.0;
    return floor(fetchSource(coordinate).b * 255.0 + 0.5);
}
float lookup(float2 high, float2 low)
{
    float2 factor1 = floor(low / 2.0) * 2.0 + 1.0;
    float2 factor0 = 65536.0 - factor1;
    float a = floor(multiplyHigh16(factor0.x, factor1.y) * blueAt(high + float2(0, 1)) / 65536.0);
    float b = floor(multiplyHigh16(factor1.x, factor1.y) * blueAt(high + float2(1, 1)) / 65536.0);
    float c = floor(multiplyHigh16(factor0.x, factor0.y) * blueAt(high) / 65536.0);
    float d = floor(multiplyHigh16(factor1.x, factor0.y) * blueAt(high + float2(1, 0)) / 65536.0);
    return positiveMod(a + b + c + d, 256.0);
}
float4 causticsPS(float2 vpos : VPOS) : COLOR0
{
    float2 position = floor(vpos);
    clip(float2(128.0, 64.0) - position - 0.5);
    float a0 = lookup(position * 2.0 + causticOffset0.xz, causticOffset0.yw);
    float a1 = lookup(position * float2(2.0, -2.0) + causticOffset1.xz, causticOffset1.yw);
    float a = floor((a0 + a1) / 2.0);
    float alpha;
    if (a >= 160.0) alpha = 255.0 - 2.0 * (a - 160.0);
    else if (a >= 128.0) alpha = 5.0 * (a - 128.0);
    else alpha = 0.0;
    return float4(1.0, 1.0, 1.0, integerDivide(alpha, 3.0) / 255.0);
}
