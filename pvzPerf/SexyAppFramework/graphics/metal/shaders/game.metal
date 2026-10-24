#include <metal_stdlib>
#include "../MetalShaderTypes.h"
using namespace metal;

// Native MSL port of d3d12/shaders/game.hlsl and vulkan/shaders/game_ps.frag.
// All textures contain encoded UNORM RGB, including the scene render target.
// Use Tier 2 argument buffers, with 4096 encoded texture descriptors at ID 0.
struct MetalGameImages
{
    array<texture2d<float>, 4096> images [[id(0)]];
};

struct MetalGameVaryings
{
    float4 position [[position]];
    float4 color;
    float2 uv;
    unsigned int slot [[flat]];
    unsigned int samplerIndex [[flat]];
};

vertex MetalGameVaryings pvz_game_vertex(
    unsigned int id [[vertex_id]],
    const device MetalGpuVertex* vertices [[buffer(0)]],
    constant MetalSceneConstants& scene [[buffer(1)]])
{
    const device MetalGpuVertex& v = vertices[id];
    const float2 ndc = float2(v.position[0], v.position[1]) /
        float2(scene.sceneWidth, scene.sceneHeight) * 2.0f - 1.0f;
    MetalGameVaryings result;
    result.position = float4(ndc.x, -ndc.y, 0.0f, 1.0f);
    result.color = float4(v.color[0], v.color[1], v.color[2], v.color[3]);
    result.uv = float2(v.uv[0], v.uv[1]);
    result.slot = v.slot;
    result.samplerIndex = v.samplerIndex;
    return result;
}

vertex MetalGameVaryings pvz_pool_vertex(
    unsigned int id [[vertex_id]],
    const device MetalPoolVertex* vertices [[buffer(0)]],
    constant MetalSceneConstants& scene [[buffer(1)]],
    constant MetalPoolConstants& p [[buffer(3)]])
{
    const device MetalPoolVertex& grid = vertices[id];
    const float x = grid.x, y = grid.y, px = grid.phaseX, py = grid.phaseY;
    const float2 base = float2(x / 15.0f, y / 5.0f);
    float2 wave = 0.0f;
    if (x != 0.0f && x != 15.0f && y != 0.0f && y != 5.0f)
    {
        if (p.layer == 0u)
            wave = float2(
                sin(py + p.time2) * 0.002f + sin(py + p.time1) * 0.005f,
                sin(px + p.time5) * 0.01f + sin(px + p.time3) * 0.015f + sin(px + p.time1) * 0.005f);
        else if (p.layer == 1u)
            wave = float2(
                sin(py * 0.2f + p.time2) * 0.015f + sin(py * 0.2f + p.time1) * 0.012f,
                sin(px * 0.2f + p.time5) * 0.005f + sin(px * 0.2f + p.time3) * 0.015f + sin(px * 0.2f + p.time1) * 0.02f);
        else
            wave = float2(
                sin(py + p.time1 * 1.5f) * 0.004f + sin(py + p.time2 * 1.5f) * 0.005f,
                sin(px * 4.0f + p.time5 * 2.5f) * 0.005f + sin(px * 2.0f + p.time3 * 2.5f) * 0.04f + sin(px * 3.0f + p.time1 * 2.5f) * 0.02f);
    }
    const float2 position = p.layer == 2u ?
        float2((704.0f / 15.0f) * x + 45.0f, 30.0f * y + 288.0f) :
        float2((p.width / 15.0f) * x + 35.0f, (p.height / 5.0f) * y + 279.0f);
    float alpha = 255.0f;
    const int2 clipPosition = int2(position); // Rect::Contains truncates toward zero.
    const int2 clipOrigin = int2(p.clipX, p.clipY);
    if (any(clipPosition < clipOrigin) ||
        any(clipPosition >= clipOrigin + int2(p.clipWidth, p.clipHeight)))
        alpha = 0.0f;
    else if (p.layer == 2u)
        alpha = (x == 0.0f || x == 15.0f || y == 0.0f) ? 32.0f :
            (p.night != 0u ? 48.0f : (x <= 7.0f ? 192.0f : 128.0f));
    const float2 ndc = (position + float2(p.transX, p.transY)) /
        float2(scene.sceneWidth, scene.sceneHeight) * 2.0f - 1.0f;
    MetalGameVaryings result;
    result.position = float4(ndc.x, -ndc.y, 0.0f, 1.0f);
    result.color = float4(1.0f, 1.0f, 1.0f, alpha / 255.0f);
    result.uv = base + wave;
    if (p.layer == 2u) result.uv += base;
    result.slot = p.slot;
    result.samplerIndex = p.samplerIndex;
    return result;
}

static float3 pvz_rgb_to_hsl(float3 rgb)
{
    float maxval = max(rgb.r, rgb.g);
    maxval = max(maxval, rgb.b);
    float minval = min(rgb.r, rgb.g);
    minval = min(minval, rgb.b);
    const float l = (minval + maxval) / 2.0f;
    if (l <= 0.0f)
        return float3(0.0f, 0.0f, l);
    const float delta = maxval - minval;
    float s = delta;
    if (s <= 0.0f)
        return float3(0.0f, s, l);
    s /= l <= 0.5f ? (minval + maxval) : (2.0f - minval - maxval);
    const float r2 = (maxval - rgb.r) / delta;
    const float g2 = (maxval - rgb.g) / delta;
    const float b2 = (maxval - rgb.b) / delta;
    float h;
    if (maxval == rgb.r)
        h = rgb.g == minval ? (5.0f + b2) : (1.0f - g2);
    else if (maxval == rgb.g)
        h = rgb.b == minval ? (1.0f + r2) : (3.0f - b2);
    else
        h = rgb.r == minval ? (3.0f + g2) : (5.0f - r2);
    h /= 6.0f;
    return float3(h, s, l);
}

static float3 pvz_hsl_to_rgb(float3 hsl)
{
    float h = hsl.x;
    const float sl = hsl.y;
    const float l = hsl.z;
    const float v = l <= 0.5f ? l * (1.0f + sl) : l + sl - l * sl;
    if (v <= 0.0f)
        return float3(0.0f);
    const float y = 2.0f * l - v;
    const float sv = (v - y) / v;
    h *= 6.0f;
    const int sextant = clamp(int(h), 0, 5);
    const float vsf = v * sv * (h - float(sextant));
    const float x = y + vsf;
    const float z = v - vsf;
    switch (sextant)
    {
    case 0: return float3(v, x, y);
    case 1: return float3(z, v, y);
    case 2: return float3(y, v, x);
    case 3: return float3(y, z, v);
    case 4: return float3(x, y, v);
    case 5: return float3(v, y, z);
    }
    return float3(0.0f);
}

static float3 pvz_filter_rgb(float3 rgb, unsigned int kind)
{
    if (kind == 0u)
        return rgb;
    if (kind == 1u)
        return float3(1.0f);
    float3 hsl = pvz_rgb_to_hsl(rgb);
    hsl.y *= kind == 2u ? 0.2f : 0.3f;
    hsl.z *= kind == 2u ? 1.8f : 1.2f;
    const float3 bytes = clamp(pvz_hsl_to_rgb(hsl) * 255.0f, 0.0f, 255.0f);
    return float3(int3(bytes)) / 255.0f;
}

static float4 pvz_filter_sample(float4 source, unsigned int slot, bool straight)
{
    const bool generated = (slot & 0x80000000u) != 0u;
    const unsigned int kind = (slot >> 28u) & 3u;
    if (kind != 0u)
    {
        float3 rgb = source.rgb;
        if (generated)
            rgb = source.a > 0.0f ? rgb / source.a : float3(0.0f);
        const float3 filtered = pvz_filter_rgb(rgb, kind);
        source.rgb = straight ? filtered : filtered * source.a;
    }
    else if (generated)
    {
        if (straight)
            source.rgb = source.a > 0.0f ? source.rgb / source.a : float3(0.0f);
    }
    else if (!straight)
        source.rgb *= source.a;
    return source;
}

static float4 pvz_filter_texel(texture2d<float> image, int2 pixel, int2 extent,
    unsigned int slot, unsigned int samplerIndex, bool straight)
{
    if ((samplerIndex & 2u) != 0u)
        pixel = ((pixel % extent) + extent) % extent;
    else
        pixel = clamp(pixel, int2(0), extent - int2(1));
    float4 source = image.read(uint2(pixel), 0);
    if ((slot & 0x04000000u) != 0u)
        source.a = 1.0f;
    if ((slot & 0x08000000u) != 0u && (slot & 0x80000000u) == 0u &&
        source.a == 0.0f)
    {
        // Sanding excludes the current row and never wraps neighbor coordinates.
        int3 rgbSum = int3(0);
        int count = 0;
        for (int dy = -1; dy <= 1; dy += 2)
            for (int dx = -1; dx <= 1; ++dx)
            {
                const int2 neighborPixel = pixel + int2(dx, dy);
                if (any(neighborPixel < int2(0)) || any(neighborPixel >= extent))
                    continue;
                const float4 neighbor = image.read(uint2(neighborPixel), 0);
                if (neighbor.a != 0.0f)
                {
                    rgbSum += int3(rint(clamp(neighbor.rgb, 0.0f, 1.0f) * 255.0f));
                    ++count;
                }
            }
        source.rgb = count > 0 ? float3(rgbSum / count) / 255.0f : float3(0.0f);
    }
    return pvz_filter_sample(source, slot, straight);
}

static float4 pvz_filter_source(texture2d<float> image, unsigned int slot,
    unsigned int samplerIndex, float2 uv, bool straight)
{
    const int2 extent = int2(image.get_width(), image.get_height());
    if ((samplerIndex & 1u) == 0u)
        return pvz_filter_texel(image, int2(floor(uv * float2(extent))), extent,
            slot, samplerIndex, straight);
    const float2 position = uv * float2(extent) - float2(0.5f);
    const int2 base = int2(floor(position));
    const float2 weight = fract(position);
    const float4 top = mix(
        pvz_filter_texel(image, base, extent, slot, samplerIndex, straight),
        pvz_filter_texel(image, base + int2(1, 0), extent, slot, samplerIndex, straight),
        weight.x);
    const float4 bottom = mix(
        pvz_filter_texel(image, base + int2(0, 1), extent, slot, samplerIndex, straight),
        pvz_filter_texel(image, base + int2(1, 1), extent, slot, samplerIndex, straight),
        weight.x);
    return mix(top, bottom, weight.y);
}

fragment float4 pvz_game_fragment(MetalGameVaryings input [[stage_in]],
    constant MetalSceneConstants& scene [[buffer(1)]],
    constant MetalGameImages& resources [[buffer(2)]],
    array<sampler, 4> samplers [[sampler(0)]])
{
    const unsigned int slot = input.slot;
    const unsigned int samplerIndex = input.samplerIndex;
    const unsigned int index = slot & 0xfffu;
    const unsigned int kind = (slot >> 28u) & 3u;
    const bool sandStraight = (slot & 0x08000000u) != 0u &&
        (slot & 0x80000000u) == 0u;
    float4 source = resources.images[index].sample(samplers[samplerIndex], input.uv);
    if ((slot & 0x04000000u) != 0u)
        source.a = 1.0f;
    if (scene.coverageInput != 0u)
    {
        // rint is ties-to-even, matching HLSL round (MSL round is ties-away).
        const unsigned int cover = unsigned(rint(clamp(source.r, 0.0f, 1.0f) * 255.0f));
        const unsigned int alpha = unsigned(rint(clamp(input.color.a, 0.0f, 1.0f) * 255.0f));
        source = float4(input.color.rgb, float(((cover + 1u) * alpha) >> 8u) / 255.0f);
        return scene.premultipliedOutput != 0u ?
            float4(source.rgb * source.a, source.a) : source;
    }
    const bool generated = (slot & 0x80000000u) != 0u;
    const bool linearFiltering = (samplerIndex & 1u) != 0u;
    if (scene.premultipliedOutput != 0u)
    {
        const bool independent = (slot & 0x40000000u) != 0u;
        if (kind != 0u || sandStraight)
        {
            source = (linearFiltering || sandStraight) ?
                pvz_filter_source(resources.images[index], slot, samplerIndex, input.uv, independent) :
                pvz_filter_sample(source, slot, independent);
            if (independent)
                source.rgb *= source.a;
        }
        else if (independent)
        {
            if (generated)
                source = linearFiltering ?
                    pvz_filter_source(resources.images[index], slot, samplerIndex, input.uv, true) :
                    float4(source.a > 0.0f ? source.rgb / source.a : float3(0.0f), source.a);
            source.rgb *= source.a;
        }
        else if (!generated && linearFiltering)
            source = pvz_filter_source(resources.images[index], slot, samplerIndex, input.uv, false);
        else if (!generated)
            source.rgb *= source.a;
        return float4(source.rgb * input.color.rgb * input.color.a, source.a * input.color.a);
    }
    const bool filteredPremult = !generated && kind != 0u &&
        (slot & 0x40000000u) == 0u;
    if (kind != 0u || sandStraight)
        source = (linearFiltering || sandStraight) ?
            pvz_filter_source(resources.images[index], slot, samplerIndex, input.uv, !generated && !filteredPremult) :
            pvz_filter_sample(source, slot, !generated && !filteredPremult);
    if (generated || filteredPremult)
        source.rgb = source.a > 0.0f ? source.rgb / source.a : float3(0.0f);
    return source * input.color;
}
