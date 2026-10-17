#version 450
// 场景主像素着色器。GLSL 而非 HLSL：glslc 的 HLSL 前端没有
// NonUniformResourceIndex 内建（数组采样装饰必需），GLSL 的
// nonuniformEXT() 原生可用——合并游程里同一绘制跨三角携带不同槽位/采样器，
// 索引必须声明非一致，否则驱动按动态一致优化属未定义行为。
#extension GL_EXT_nonuniform_qualifier : require

// bindless：全场纹理数组按存活数定容 4096（复用语义，渲染器侧见
// kTextureSlots）。采样器同理：4 个（bit0=线性过滤 bit1=重复寻址）装一个
// 数组描述符，逐顶点声明——纹理与采样器都不再是绑定状态。
// 定长数组免 runtimeDescriptorArray 特性位。
layout(set = 0, binding = 0) uniform texture2D images[4096];
layout(set = 1, binding = 0) uniform sampler samplers[4];

layout(location = 0) in vec4 color;
layout(location = 1) in vec2 uv;
layout(location = 2) flat in uint slot;
layout(location = 3) flat in uint samplerIndex;

layout(location = 0) out vec4 outColor;

// One compiled module serves the scene, generated-image and coverage pipelines.
layout(constant_id = 0) const bool premultipliedOutput = false;
layout(constant_id = 1) const bool coverageInput = false;

vec3 rgbToHsl(vec3 rgb)
{
    precise float maxval = max(rgb.r, rgb.g);
    maxval = max(maxval, rgb.b);
    precise float minval = min(rgb.r, rgb.g);
    minval = min(minval, rgb.b);
    precise float l = (minval + maxval) / 2.0;
    if (l <= 0.0)
        return vec3(0.0, 0.0, l);

    precise float delta = maxval - minval;
    precise float s = delta;
    if (s <= 0.0)
        return vec3(0.0, s, l);
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
    return vec3(h, s, l);
}

vec3 hslToRgb(vec3 hsl)
{
    precise float h = hsl.x;
    precise float sl = hsl.y;
    precise float l = hsl.z;
    precise float v = l <= 0.5 ? (l * (1.0 + sl)) : (l + sl - l * sl);
    if (v <= 0.0)
        return vec3(0.0);

    precise float y = 2.0 * l - v;
    precise float sv = (v - y) / v;
    h *= 6.0;
    const int sextant = clamp(int(h), 0, 5);
    precise float vsf = v * sv * (h - float(sextant));
    precise float x = y + vsf;
    precise float z = v - vsf;
    switch (sextant) {
    case 0: return vec3(v, x, y);
    case 1: return vec3(z, v, y);
    case 2: return vec3(y, v, x);
    case 3: return vec3(y, z, v);
    case 4: return vec3(x, y, v);
    case 5: return vec3(v, y, z);
    }
    return vec3(0.0);
}

vec3 filterRgb(vec3 encodedRgb, uint colorFilterKind)
{
    // Slot bits 28..29: 0=none, 1=white, 2=washed out, 3=less washed out.
    if (colorFilterKind == 0u)
        return encodedRgb;
    if (colorFilterKind == 1u)
        return vec3(1.0);

    // Match FilterEffect.cpp on encoded RGB, without clamping scaled luminance.
    precise vec3 hsl = rgbToHsl(encodedRgb);
    hsl.y *= colorFilterKind == 2u ? 0.2 : 0.3;
    hsl.z *= colorFilterKind == 2u ? 1.8 : 1.2;
    precise vec3 rgb = hslToRgb(hsl);
    // Clamping before conversion is equivalent for finite values and keeps the
    // truncating integer conversion within range. Alpha is never quantized here.
    precise vec3 byteRgb = clamp(rgb * 255.0, vec3(0.0), vec3(255.0));
    precise vec3 result = vec3(ivec3(byteRgb)) / 255.0;
    return result;
}

vec4 filterSample(vec4 source, bool straightResult)
{
    const bool generated = (slot & 0x80000000u) != 0u;
    const uint colorFilterKind = (slot >> 28u) & 3u;
    if (colorFilterKind != 0u) {
        precise vec3 encodedRgb = source.rgb;
        if (generated)
            encodedRgb = source.a > 0.0 ? encodedRgb / source.a : vec3(0.0);
        precise vec3 filteredRgb = filterRgb(encodedRgb, colorFilterKind);
        precise vec3 result = straightResult ? filteredRgb : filteredRgb * source.a;
        source.rgb = result;
    } else if (generated) {
        if (straightResult)
            source.rgb = source.a > 0.0 ? source.rgb / source.a : vec3(0.0);
    } else if (!straightResult) {
        source.rgb *= source.a;
    }
    return source;
}

vec4 filterTexel(ivec2 pixel, ivec2 extent, uint descriptorIndex, bool straightResult)
{
    if ((samplerIndex & 2u) != 0u)
        pixel = ((pixel % extent) + extent) % extent;
    else
        pixel = clamp(pixel, ivec2(0), extent - ivec2(1));
    vec4 source = texelFetch(sampler2D(images[nonuniformEXT(descriptorIndex)],
                                     samplers[nonuniformEXT(samplerIndex)]), pixel, 0);
    if ((slot & 0x04000000u) != 0u) source.a = 1.0;
    if ((slot & 0x08000000u) != 0u && (slot & 0x80000000u) == 0u && source.a == 0.0) {
        // Legacy sanding excludes the current row and never wraps neighbors.
        ivec3 rgbSum = ivec3(0);
        int count = 0;
        for (int dy = -1; dy <= 1; dy += 2) {
            for (int dx = -1; dx <= 1; ++dx) {
                const ivec2 neighborPixel = pixel + ivec2(dx, dy);
                if (any(lessThan(neighborPixel, ivec2(0))) ||
                    any(greaterThanEqual(neighborPixel, extent)))
                    continue;
                const vec4 neighbor = texelFetch(
                    sampler2D(images[nonuniformEXT(descriptorIndex)],
                              samplers[nonuniformEXT(samplerIndex)]), neighborPixel, 0);
                if (neighbor.a != 0.0) {
                    precise vec3 byteRgb = round(clamp(neighbor.rgb, vec3(0.0), vec3(1.0)) * 255.0);
                    rgbSum += ivec3(byteRgb);
                    ++count;
                }
            }
        }
        if (count > 0) {
            precise vec3 correctedRgb = vec3(rgbSum / count) / 255.0;
            source.rgb = correctedRgb;
        } else {
            source.rgb = vec3(0.0);
        }
    }
    return filterSample(source, straightResult);
}

vec4 filterSource(uint descriptorIndex, bool straightResult)
{
    const ivec2 extent = textureSize(sampler2D(images[nonuniformEXT(descriptorIndex)],
                                              samplers[nonuniformEXT(samplerIndex)]), 0);
    if ((samplerIndex & 1u) == 0u)
        return filterTexel(ivec2(floor(uv * vec2(extent))), extent, descriptorIndex, straightResult);
    const vec2 position = uv * vec2(extent) - vec2(0.5);
    const ivec2 base = ivec2(floor(position));
    const vec2 weight = fract(position);
    const vec4 top = mix(filterTexel(base, extent, descriptorIndex, straightResult),
                         filterTexel(base + ivec2(1, 0), extent, descriptorIndex, straightResult), weight.x);
    const vec4 bottom = mix(filterTexel(base + ivec2(0, 1), extent, descriptorIndex, straightResult),
                            filterTexel(base + ivec2(1, 1), extent, descriptorIndex, straightResult), weight.x);
    return mix(top, bottom, weight.y);
}

void main()
{
    const uint descriptorIndex = slot & 0xfffu;
    const uint colorFilterKind = (slot >> 28u) & 3u;
    const bool sandStraight = (slot & 0x08000000u) != 0u && (slot & 0x80000000u) == 0u;
    vec4 source = texture(sampler2D(images[nonuniformEXT(descriptorIndex)],
                                   samplers[nonuniformEXT(samplerIndex)]), uv);
    if ((slot & 0x04000000u) != 0u) source.a = 1.0;
    if (coverageInput) {
        const uint cover = uint(round(clamp(source.r, 0.0, 1.0) * 255.0));
        const uint alpha = uint(round(clamp(color.a, 0.0, 1.0) * 255.0));
        source = vec4(color.rgb, float(((cover + 1u) * alpha) >> 8u) / 255.0);
        outColor = premultipliedOutput ? vec4(source.rgb * source.a, source.a) : source;
    } else if (premultipliedOutput) {
        const bool generated = (slot & 0x80000000u) != 0u;
        const bool linear = (samplerIndex & 1u) != 0u;
        const bool independent = (slot & 0x40000000u) != 0u;
        if (colorFilterKind != 0u || sandStraight) {
            // Transform each straight texel before interpolation, retaining the
            // existing choice of independent or premultiplied channel filtering.
            source = (linear || sandStraight) ? filterSource(descriptorIndex, independent) :
                filterSample(source, independent);
            if (independent)
                source.rgb *= source.a;
        } else if (independent) {
            if (generated)
                source = linear ? filterSource(descriptorIndex, true) :
                    vec4(source.a > 0.0 ? source.rgb / source.a : vec3(0.0), source.a);
            source.rgb *= source.a;
        } else if (!generated && linear) {
            // Filtering straight RGB first leaks transparent texel colors.
            // Convert each tap to premultiplied before the weighted sum.
            source = filterSource(descriptorIndex, false);
        } else if (!generated) {
            source.rgb *= source.a;
        }
        outColor = vec4(source.rgb * color.rgb * color.a, source.a * color.a);
    } else {
        const bool generated = (slot & 0x80000000u) != 0u;
        if (colorFilterKind != 0u || sandStraight) {
            const bool linear = (samplerIndex & 1u) != 0u;
            // Ordinary scene sampling interpolates generated sources as
            // premultiplied, but straight sources as independent channels.
            source = (linear || sandStraight) ? filterSource(descriptorIndex, !generated) :
                filterSample(source, !generated);
        }
        if (generated)
            source.rgb = source.a > 0.0 ? source.rgb / source.a : vec3(0.0);
        outColor = source * color;
    }
}
