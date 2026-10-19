#include "common.hlsl"
sampler2D xRanges : register(s1);
sampler2D yRanges : register(s2);
sampler2D xTaps : register(s3);
sampler2D yTaps : register(s4);

float2 tableUV(float offset, float4 extent)
{
    float y = integerDivide(offset, extent.x);
    float x = offset - y * extent.x;
    return (float2(x, y) + 0.5) * extent.zw;
}
float4 rawPixel(float2 position)
{
    float4 rgba = fetchSource(clamp(position, 0.0, sourceRect.zw - 1.0));
    if (sourceFlags.y != 0.0) rgba.a = 1.0;
    if (sourceFlags.x != 0.0)
        rgba.rgb = rgba.a > 0.0 ? rgba.rgb / rgba.a : float3(0.0, 0.0, 0.0);
    return toBytes(rgba);
}
float4 fontPixel(float2 position)
{
    float4 rgba = rawPixel(position);
    if (sourceFlags.z != 0.0 && rgba.a == 0.0) {
        float3 sum = 0.0;
        float count = 0.0;
        [loop] for (int i = 0; i < 6; ++i) {
            float row = floor(float(i) / 3.0);
            float2 neighbor = position + float2(float(i) - row * 3.0 - 1.0, row * 2.0 - 1.0);
            if (all(neighbor >= 0.0) && all(neighbor < sourceRect.zw)) {
                float4 value = rawPixel(neighbor);
                if (value.a != 0.0) {
                    sum += value.rgb;
                    count += 1.0;
                }
            }
        }
        rgba.rgb = count > 0.0 ? integerDivide3(sum, max(count, 1.0)) : float3(0.0, 0.0, 0.0);
    }
    return rgba;
}
float4 fontPS(float2 vpos : VPOS) : COLOR0
{
    float2 outputPosition = floor(vpos) - glyphDestination.xy;
    clip(outputPosition);
    clip(glyphDestination.zw - outputPosition - 0.5);
    float2 xr = tex2Dlod(xRanges, float4(tableUV(outputPosition.x, xRangeTexture), 0, 0)).rg;
    float2 yr = tex2Dlod(yRanges, float4(tableUV(outputPosition.y, yRangeTexture), 0, 0)).rg;
    float4 total = 0.0;
    float4 horizontal = 0.0;
    float x = 0.0, y = 0.0;
    float2 yt = 0.0;
    // 4*129*129 covers 257*256 taps without SM3's 255-repeat truncation.
    [loop] for (int block = 0; block < 4; ++block) {
        if (y >= yr.y || xr.y == 0.0) break;
        [loop] for (int batch = 0; batch < 129; ++batch) {
            if (y >= yr.y) break;
            [loop] for (int step = 0; step < 129; ++step) {
                if (y >= yr.y) break;
                if (x == 0.0)
                    yt = tex2Dlod(yTaps, float4(tableUV(yr.x + y, yTapTexture), 0, 0)).rg;
                float2 xt = tex2Dlod(xTaps, float4(tableUV(xr.x + x, xTapTexture), 0, 0)).rg;
                horizontal += fontPixel(glyphSource.xy + float2(xt.x, yt.x)) * xt.y;
                x += 1.0;
                if (x >= xr.y) {
                    total += horizontal * yt.y;
                    horizontal = 0.0;
                    x = 0.0;
                    y += 1.0;
                }
            }
        }
    }
    float4 result = floor(total / 65536.0);
    result.rgb = floor(result.rgb * result.a / 256.0);
    if (result.a == 0.0) result.rgb = 0.0;
    float alpha = result.a / 255.0;
    float3 rgb = modes.y != 0.0 ? float3(1.0, 1.0, 1.0) : result.rgb / 255.0;
    return float4(rgb * alpha, alpha);
}
