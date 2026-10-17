// Native port of vulkan/shaders/game_vs.hlsl and game_ps.frag.
// b0, space0: 4 root DWORDs (byte offsets 0, 4, 8, 12):
// float sceneWidth, float sceneHeight, uint premultipliedOutput, uint coverageInput.
// t0..t4095, space0: Texture2D<float4> SRVs. Slot bits 0..11 select the SRV.
// s0..s3, space0: nearest/clamp, linear/clamp, nearest/repeat, linear/repeat.
// Slot flags: bit 26 opaque alpha, bit 27 edge RGB sanding, bits 28..29
// color filter (none/white/washed/less washed), bit 30 independent filtering,
// bit 31 generated premultiplied input. Preserve the source's encoded RGB.
cbuffer SceneConstants : register(b0, space0)
{
    float sceneWidth : packoffset(c0.x);
    float sceneHeight : packoffset(c0.y);
    uint premultipliedOutput : packoffset(c0.z);
    uint coverageInput : packoffset(c0.w);
};

Texture2D<float4> images[4096] : register(t0, space0);
SamplerState samplers[4] : register(s0, space0);

// VulkanVertex: 40-byte stride; offsets 0, 8, 24, 32, 36.
struct VertexIn
{
    float2 position : POSITION;
    float4 color : COLOR0;
    float2 uv : TEXCOORD0;
    uint slot : TEXCOORD1;
    uint samplerIndex : TEXCOORD2;
};

struct VertexOut
{
    float4 position : SV_Position;
    float4 color : COLOR0;
    float2 uv : TEXCOORD0;
    nointerpolation uint slot : TEXCOORD1;
    nointerpolation uint samplerIndex : TEXCOORD2;
};

VertexOut VSMain(VertexIn input)
{
    VertexOut output;
    // D3D NDC +1 is the top. Integer positions describe pixel edges; the
    // rasterizer supplies half-integer pixel centers without a DX9 correction.
    const float2 ndc = input.position / float2(sceneWidth, sceneHeight) * 2.0 - 1.0;
    output.position = float4(ndc.x, -ndc.y, 0.0, 1.0);
    output.color = input.color;
    output.uv = input.uv;
    output.slot = input.slot;
    output.samplerIndex = input.samplerIndex;
    return output;
}

float3 RgbToHsl(float3 rgb)
{
    precise float maxval = max(rgb.r, rgb.g);
    maxval = max(maxval, rgb.b);
    precise float minval = min(rgb.r, rgb.g);
    minval = min(minval, rgb.b);
    precise float l = (minval + maxval) / 2.0;
    if (l <= 0.0)
        return float3(0.0, 0.0, l);

    precise float delta = maxval - minval;
    precise float s = delta;
    if (s <= 0.0)
        return float3(0.0, s, l);
    s /= l <= 0.5 ? (minval + maxval) : (2.0 - minval - maxval);

    precise float r2 = (maxval - rgb.r) / delta;
    precise float g2 = (maxval - rgb.g) / delta;
    precise float b2 = (maxval - rgb.b) / delta;
    precise float h;
    if (maxval == rgb.r)
        h = rgb.g == minval ? (5.0 + b2) : (1.0 - g2);
    else if (maxval == rgb.g)
        h = rgb.b == minval ? (1.0 + r2) : (3.0 - b2);
    else
        h = rgb.r == minval ? (3.0 + g2) : (5.0 - r2);
    h /= 6.0;
    return float3(h, s, l);
}

float3 HslToRgb(float3 hsl)
{
    precise float h = hsl.x;
    precise float sl = hsl.y;
    precise float l = hsl.z;
    precise float v = l <= 0.5 ? (l * (1.0 + sl)) : (l + sl - l * sl);
    if (v <= 0.0)
        return float3(0.0, 0.0, 0.0);

    precise float y = 2.0 * l - v;
    precise float sv = (v - y) / v;
    h *= 6.0;
    const int sextant = clamp(int(h), 0, 5);
    precise float vsf = v * sv * (h - float(sextant));
    precise float x = y + vsf;
    precise float z = v - vsf;
    switch (sextant)
    {
    case 0: return float3(v, x, y);
    case 1: return float3(z, v, y);
    case 2: return float3(y, v, x);
    case 3: return float3(y, z, v);
    case 4: return float3(x, y, v);
    case 5: return float3(v, y, z);
    }
    return float3(0.0, 0.0, 0.0);
}

float3 FilterRgb(float3 encodedRgb, uint colorFilterKind)
{
    if (colorFilterKind == 0u)
        return encodedRgb;
    if (colorFilterKind == 1u)
        return float3(1.0, 1.0, 1.0);

    // FilterEffect.cpp scales encoded HSL before truncating RGB to bytes.
    // In particular, do not clamp luminance before HSL-to-RGB conversion.
    precise float3 hsl = RgbToHsl(encodedRgb);
    hsl.y *= colorFilterKind == 2u ? 0.2 : 0.3;
    hsl.z *= colorFilterKind == 2u ? 1.8 : 1.2;
    precise float3 rgb = HslToRgb(hsl);
    precise float3 byteRgb = clamp(rgb * 255.0, 0.0, 255.0);
    precise float3 result = float3(int3(byteRgb)) / 255.0;
    return result;
}

float4 FilterSample(float4 source, uint slot, bool straightResult)
{
    const bool generated = (slot & 0x80000000u) != 0u;
    const uint colorFilterKind = (slot >> 28u) & 3u;
    if (colorFilterKind != 0u)
    {
        precise float3 encodedRgb = source.rgb;
        if (generated)
            encodedRgb = source.a > 0.0 ? encodedRgb / source.a : float3(0.0, 0.0, 0.0);
        precise float3 filteredRgb = FilterRgb(encodedRgb, colorFilterKind);
        precise float3 result = straightResult ? filteredRgb : filteredRgb * source.a;
        source.rgb = result;
    }
    else if (generated)
    {
        if (straightResult)
            source.rgb = source.a > 0.0 ? source.rgb / source.a : float3(0.0, 0.0, 0.0);
    }
    else if (!straightResult)
    {
        source.rgb *= source.a;
    }
    return source;
}

float4 FilterTexel(int2 pixel, int2 extent, uint descriptorIndex,
    uint slot, uint samplerIndex, bool straightResult)
{
    if ((samplerIndex & 2u) != 0u)
        pixel = ((pixel % extent) + extent) % extent;
    else
        pixel = clamp(pixel, int2(0, 0), extent - int2(1, 1));

    float4 source = images[NonUniformResourceIndex(descriptorIndex)].Load(int3(pixel, 0));
    if ((slot & 0x04000000u) != 0u)
        source.a = 1.0;
    if ((slot & 0x08000000u) != 0u && (slot & 0x80000000u) == 0u && source.a == 0.0)
    {
        // Legacy sanding skips the current row and never wraps neighbors,
        // even when the selected sampler uses repeat addressing.
        int3 rgbSum = int3(0, 0, 0);
        int count = 0;
        for (int dy = -1; dy <= 1; dy += 2)
        {
            for (int dx = -1; dx <= 1; ++dx)
            {
                const int2 neighborPixel = pixel + int2(dx, dy);
                if (any(neighborPixel < int2(0, 0)) || any(neighborPixel >= extent))
                    continue;
                const float4 neighbor = images[NonUniformResourceIndex(descriptorIndex)].Load(
                    int3(neighborPixel, 0));
                if (neighbor.a != 0.0)
                {
                    precise float3 byteRgb = round(clamp(neighbor.rgb, 0.0, 1.0) * 255.0);
                    rgbSum += int3(byteRgb);
                    ++count;
                }
            }
        }
        if (count > 0)
        {
            precise float3 correctedRgb = float3(rgbSum / count) / 255.0;
            source.rgb = correctedRgb;
        }
        else
        {
            source.rgb = float3(0.0, 0.0, 0.0);
        }
    }
    return FilterSample(source, slot, straightResult);
}

float4 FilterSource(uint descriptorIndex, uint slot, uint samplerIndex,
    float2 uv, bool straightResult)
{
    uint width, height;
    images[NonUniformResourceIndex(descriptorIndex)].GetDimensions(width, height);
    const int2 extent = int2(width, height);
    if ((samplerIndex & 1u) == 0u)
        return FilterTexel(int2(floor(uv * float2(extent))), extent, descriptorIndex,
            slot, samplerIndex, straightResult);

    const float2 position = uv * float2(extent) - float2(0.5, 0.5);
    const int2 base = int2(floor(position));
    const float2 weight = frac(position);
    const float4 top = lerp(
        FilterTexel(base, extent, descriptorIndex, slot, samplerIndex, straightResult),
        FilterTexel(base + int2(1, 0), extent, descriptorIndex, slot, samplerIndex, straightResult),
        weight.x);
    const float4 bottom = lerp(
        FilterTexel(base + int2(0, 1), extent, descriptorIndex, slot, samplerIndex, straightResult),
        FilterTexel(base + int2(1, 1), extent, descriptorIndex, slot, samplerIndex, straightResult),
        weight.x);
    return lerp(top, bottom, weight.y);
}

float4 PSMain(VertexOut input) : SV_Target0
{
    const uint slot = input.slot;
    const uint samplerIndex = input.samplerIndex;
    const uint descriptorIndex = slot & 0xfffu;
    const uint colorFilterKind = (slot >> 28u) & 3u;
    const bool sandStraight = (slot & 0x08000000u) != 0u && (slot & 0x80000000u) == 0u;
    float4 source = images[NonUniformResourceIndex(descriptorIndex)].Sample(
        samplers[NonUniformResourceIndex(samplerIndex)], input.uv);
    if ((slot & 0x04000000u) != 0u)
        source.a = 1.0;

    if (coverageInput != 0u)
    {
        const uint cover = uint(round(clamp(source.r, 0.0, 1.0) * 255.0));
        const uint alpha = uint(round(clamp(input.color.a, 0.0, 1.0) * 255.0));
        source = float4(input.color.rgb, float(((cover + 1u) * alpha) >> 8u) / 255.0);
        return premultipliedOutput != 0u ? float4(source.rgb * source.a, source.a) : source;
    }
    else if (premultipliedOutput != 0u)
    {
        const bool generated = (slot & 0x80000000u) != 0u;
        const bool linearFiltering = (samplerIndex & 1u) != 0u;
        const bool independent = (slot & 0x40000000u) != 0u;
        if (colorFilterKind != 0u || sandStraight)
        {
            // Apply the transform per texel, before channel interpolation.
            source = (linearFiltering || sandStraight) ?
                FilterSource(descriptorIndex, slot, samplerIndex, input.uv, independent) :
                FilterSample(source, slot, independent);
            if (independent)
                source.rgb *= source.a;
        }
        else if (independent)
        {
            if (generated)
                source = linearFiltering ?
                    FilterSource(descriptorIndex, slot, samplerIndex, input.uv, true) :
                    float4(source.a > 0.0 ? source.rgb / source.a : float3(0.0, 0.0, 0.0), source.a);
            source.rgb *= source.a;
        }
        else if (!generated && linearFiltering)
        {
            source = FilterSource(descriptorIndex, slot, samplerIndex, input.uv, false);
        }
        else if (!generated)
        {
            source.rgb *= source.a;
        }
        return float4(source.rgb * input.color.rgb * input.color.a, source.a * input.color.a);
    }
    else
    {
        const bool generated = (slot & 0x80000000u) != 0u;
        if (colorFilterKind != 0u || sandStraight)
        {
            const bool linearFiltering = (samplerIndex & 1u) != 0u;
            source = (linearFiltering || sandStraight) ?
                FilterSource(descriptorIndex, slot, samplerIndex, input.uv, !generated) :
                FilterSample(source, slot, !generated);
        }
        if (generated)
            source.rgb = source.a > 0.0 ? source.rgb / source.a : float3(0.0, 0.0, 0.0);
        return source * input.color;
    }
}
