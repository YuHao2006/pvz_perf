#ifndef PVZ_D3D9_COMMON
#define PVZ_D3D9_COMMON

float4 sourceRect : register(c0);
float4 sourceTexture : register(c1);
float4 sourceFlags : register(c2);
float4 sampling : register(c3);
float4 modes : register(c4);
float4 rectangle : register(c5);
float4 alphaRect : register(c6);
float4 alphaTexture : register(c7);
float4 packedColor : register(c8);
float4 causticOffset0 : register(c10);
float4 causticOffset1 : register(c11);
float4 glyphSource : register(c12);
float4 glyphDestination : register(c13);
float4 xRangeTexture : register(c14);
float4 yRangeTexture : register(c15);
float4 xTapTexture : register(c16);
float4 yTapTexture : register(c17);
float4 tintRed : register(c18);
float4 tintGreen : register(c19);
float4 tintBlue : register(c20);
float4 tintAlpha : register(c21);
float4 presentation : register(c22);
sampler2D sourceImage : register(s0);

float4 fetchSource(float2 pixel, float4 rect)
{
    return tex2Dlod(sourceImage, float4((rect.xy + pixel + 0.5) * sourceTexture.xy, 0, 0));
}
float4 fetchSource(float2 pixel)
{
    return fetchSource(pixel, sourceRect);
}
float4 toBytes(float4 value)
{
    return floor(saturate(value) * 255.0 + 0.5);
}
// Correct a reciprocal-based division estimate before integer truncation.
// n, d, q*d and (q+1)*d must be exact float32 integers.
float integerDivide(float n, float d)
{
    float q = floor(n / d);
    if (q * d > n) q -= 1.0;
    if ((q + 1.0) * d <= n) q += 1.0;
    return q;
}
float3 integerDivide3(float3 n, float d)
{
    return float3(integerDivide(n.x, d), integerDivide(n.y, d), integerDivide(n.z, d));
}
float positiveMod(float value, float extent)
{
    return value - integerDivide(value, extent) * extent;
}
float2 addressPixel(float2 pixel, float4 rect, float repeat)
{
    if (repeat != 0.0)
        return float2(positiveMod(pixel.x, rect.z), positiveMod(pixel.y, rect.w));
    return clamp(pixel, 0.0, rect.zw - 1.0);
}

#endif
