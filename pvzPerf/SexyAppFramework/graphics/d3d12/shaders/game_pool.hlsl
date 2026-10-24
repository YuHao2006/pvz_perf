#include "game.hlsl"

// Separate root constants and compact immutable vertices; the ordinary draw
// shader and its vertex format have no pool-specific state.
cbuffer PoolConstants : register(b1, space0)
{
    float2 poolSize;
    float2 translation;
    float4 times; // time1, time2, time3, time5 (time4 == time1)
    float4 clipRect;
    uint layer;
    uint night;
    uint poolSlot;
    uint poolSampler;
};

VertexOut PoolVS(float4 grid : POSITION)
{
    const float x = grid.x, y = grid.y, px = grid.z, py = grid.w;
    const float2 base = float2(x / 15.0, y / 5.0);
    float2 wave = 0.0;
    if (x != 0.0 && x != 15.0 && y != 0.0 && y != 5.0)
    {
        if (layer == 0u)
            wave = float2(
                sin(py + times.y) * 0.002 + sin(py + times.x) * 0.005,
                sin(px + times.w) * 0.01 + sin(px + times.z) * 0.015 + sin(px + times.x) * 0.005);
        else if (layer == 1u)
            wave = float2(
                sin(py * 0.2 + times.y) * 0.015 + sin(py * 0.2 + times.x) * 0.012,
                sin(px * 0.2 + times.w) * 0.005 + sin(px * 0.2 + times.z) * 0.015 + sin(px * 0.2 + times.x) * 0.02);
        else
            wave = float2(
                sin(py + times.x * 1.5) * 0.004 + sin(py + times.y * 1.5) * 0.005,
                sin(px * 4.0 + times.w * 2.5) * 0.005 + sin(px * 2.0 + times.z * 2.5) * 0.04 + sin(px * 3.0 + times.x * 2.5) * 0.02);
    }
    const float2 position = layer == 2u ?
        float2((704.0 / 15.0) * x + 45.0, 30.0 * y + 288.0) :
        float2((poolSize.x / 15.0) * x + 35.0, (poolSize.y / 5.0) * y + 279.0);
    float alpha = 255.0;
    const int2 clipPosition = int2(position); // Rect::Contains truncates toward zero.
    if (any(clipPosition < int2(clipRect.xy)) ||
        any(clipPosition >= int2(clipRect.xy) + int2(clipRect.zw)))
        alpha = 0.0;
    else if (layer == 2u)
        alpha = (x == 0.0 || x == 15.0 || y == 0.0) ? 32.0 :
            (night != 0u ? 48.0 : (x <= 7.0 ? 192.0 : 128.0));
    const float2 ndc = (position + translation) / float2(sceneWidth, sceneHeight) * 2.0 - 1.0;
    VertexOut result;
    result.position = float4(ndc.x, -ndc.y, 0.0, 1.0);
    result.color = float4(1.0, 1.0, 1.0, alpha / 255.0);
    result.uv = base + wave;
    if (layer == 2u) result.uv += base;
    result.slot = poolSlot;
    result.samplerIndex = poolSampler;
    return result;
}
