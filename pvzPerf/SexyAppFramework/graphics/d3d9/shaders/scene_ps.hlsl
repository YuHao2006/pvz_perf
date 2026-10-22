#include "common.hlsl"

struct SceneData {
    float4 rect;
    float4 flags; // generated, opaque, edge, filterKind
    float4 sampleMode; // linear, repeat, independent, targetPremult
};
float flagBit(float packed, float unit)
{
    return floor(packed / unit) - floor(packed / (unit * 2.0)) * 2.0;
}
SceneData sceneData(float4 rect, float packed)
{
    SceneData data;
    data.rect = floor(rect + 0.5);
    packed = floor(packed + 0.5);
    float filterKind = floor(packed / 8.0) - floor(packed / 32.0) * 4.0;
    data.flags = float4(flagBit(packed, 1.0), flagBit(packed, 2.0), flagBit(packed, 4.0), filterKind);
    data.sampleMode = float4(flagBit(packed, 64.0), flagBit(packed, 128.0), flagBit(packed, 32.0), sampling.w);
    return data;
}
float3 rgbToHsl(float3 rgb)
{
    float maximum = max(max(rgb.r, rgb.g), rgb.b);
    float minimum = min(min(rgb.r, rgb.g), rgb.b);
    float lightness = (minimum + maximum) / 2.0;
    if (lightness <= 0.0) return float3(0.0, 0.0, lightness);
    float delta = maximum - minimum;
    float saturation = delta;
    if (saturation <= 0.0) return float3(0.0, saturation, lightness);
    saturation /= lightness <= 0.5 ? minimum + maximum : 2.0 - minimum - maximum;
    float3 difference = (maximum - rgb) / delta;
    float hue;
    if (maximum == rgb.r)
        hue = rgb.g == minimum ? 5.0 + difference.b : 1.0 - difference.g;
    else if (maximum == rgb.g)
        hue = rgb.b == minimum ? 1.0 + difference.r : 3.0 - difference.b;
    else
        hue = rgb.r == minimum ? 3.0 + difference.g : 5.0 - difference.r;
    return float3(hue / 6.0, saturation, lightness);
}
float3 hslToRgb(float3 hsl)
{
    float h = hsl.x;
    float s = hsl.y;
    float l = hsl.z;
    float v = l <= 0.5 ? l * (1.0 + s) : l + s - l * s;
    if (v <= 0.0) return 0.0;
    float y = 2.0 * l - v;
    float sv = (v - y) / v;
    h *= 6.0;
    float sextant = clamp(floor(h), 0.0, 5.0);
    float vsf = v * sv * (h - sextant);
    float x = y + vsf;
    float z = v - vsf;
    if (sextant == 0.0) return float3(v, x, y);
    if (sextant == 1.0) return float3(z, v, y);
    if (sextant == 2.0) return float3(y, v, x);
    if (sextant == 3.0) return float3(y, z, v);
    if (sextant == 4.0) return float3(x, y, v);
    return float3(v, y, z);
}
float3 filterRgb(float3 rgb, float filterKind)
{
    if (filterKind == 0.0) return rgb;
    if (filterKind == 1.0) return 1.0;
    float3 hsl = rgbToHsl(rgb);
    hsl.y *= filterKind == 2.0 ? 0.2 : 0.3;
    hsl.z *= filterKind == 2.0 ? 1.8 : 1.2;
    return floor(clamp(hslToRgb(hsl) * 255.0, 0.0, 255.0)) / 255.0;
}
float4 filterSample(float4 source, bool straightResult, SceneData data)
{
    if (data.flags.w != 0.0) {
        float3 rgb = source.rgb;
        if (data.flags.x != 0.0)
            rgb = source.a > 0.0 ? rgb / source.a : float3(0.0, 0.0, 0.0);
        rgb = filterRgb(rgb, data.flags.w);
        source.rgb = straightResult ? rgb : rgb * source.a;
    } else if (data.flags.x != 0.0) {
        if (straightResult)
            source.rgb = source.a > 0.0 ? source.rgb / source.a : float3(0.0, 0.0, 0.0);
    } else if (!straightResult) {
        source.rgb *= source.a;
    }
    return source;
}
float4 filterTexel(float2 pixel, bool straightResult, SceneData data)
{
    float4 source = fetchSource(pixel, data.rect);
    if (data.flags.y != 0.0) source.a = 1.0;
    if (data.flags.z != 0.0 && data.flags.x == 0.0 && source.a == 0.0) {
        float3 sum = 0.0;
        float count = 0.0;
        [loop] for (int row = 0; row < 2; ++row) {
            [loop] for (int column = 0; column < 3; ++column) {
                float2 neighborPixel = pixel + float2(column - 1, row * 2 - 1);
                if (all(neighborPixel >= 0.0) && all(neighborPixel < data.rect.zw)) {
                    float4 neighbor = fetchSource(neighborPixel, data.rect);
                    if (neighbor.a != 0.0) {
                        sum += toBytes(neighbor).rgb;
                        count += 1.0;
                    }
                }
            }
        }
        source.rgb = count > 0.0 ? integerDivide3(sum, max(count, 1.0)) / 255.0 : float3(0.0, 0.0, 0.0);
    }
    return filterSample(source, straightResult, data);
}
float4 sampleSource(float2 uv, bool filtered, bool straightResult, SceneData data)
{
    float2 position = uv * data.rect.zw;
    if (data.sampleMode.x != 0.0) position -= 0.5;
    float2 base = floor(position);
    float2 weight = position - base;
    float4 topLeft = 0.0, topRight = 0.0, bottomLeft = 0.0, bottomRight = 0.0;
    [loop] for (int i = 0; i < 4; ++i) {
        float2 offset = float2(i - (i / 2) * 2, i / 2);
        float2 pixel = addressPixel(base + offset, data.rect, data.sampleMode.y);
        float4 value;
        [branch] if (filtered) value = filterTexel(pixel, straightResult, data);
        else value = fetchSource(pixel, data.rect);
        if (i == 0) topLeft = value;
        else if (i == 1) topRight = value;
        else if (i == 2) bottomLeft = value;
        else bottomRight = value;
        if (data.sampleMode.x == 0.0) break;
    }
    if (data.sampleMode.x == 0.0) return topLeft;
    return lerp(lerp(topLeft, topRight, weight.x), lerp(bottomLeft, bottomRight, weight.x), weight.y);
}
float4 scenePS(float2 uv : TEXCOORD0, float4 rect : TEXCOORD1,
    float packed : TEXCOORD2, float4 color : TEXCOORD3) : COLOR0
{
    SceneData data = sceneData(rect, packed);
    bool generated = data.flags.x != 0.0;
    bool linearSampling = data.sampleMode.x != 0.0;
    bool independent = data.sampleMode.z != 0.0;
    bool filteredPremult = !generated && data.flags.w != 0.0 && !independent;
    bool premultipliedOutput = data.sampleMode.w != 0.0;
    bool sandStraight = data.flags.z != 0.0 && !generated;
    bool hasFilter = data.flags.w != 0.0 || sandStraight;
    bool filtered = false;
    bool straightResult = false;
    if (modes.x == 0.0) {
        if (premultipliedOutput) {
            if (hasFilter) {
                filtered = true;
                straightResult = independent;
            } else if (independent && generated) {
                filtered = true;
                straightResult = true;
            } else if (!independent && !generated && linearSampling) {
                filtered = true;
            }
        } else if (hasFilter) {
            filtered = true;
            straightResult = !generated && !filteredPremult;
        }
    }
    float4 source = sampleSource(uv, filtered, straightResult, data);
    if (!filtered && data.flags.y != 0.0) source.a = 1.0;
    if (modes.x != 0.0) {
        float cover = toBytes(source).r;
        float alpha = toBytes(color).a;
        source = float4(color.rgb, floor((cover + 1.0) * alpha / 256.0) / 255.0);
        return premultipliedOutput ? float4(source.rgb * source.a, source.a) : source;
    }
    if (premultipliedOutput) {
        if (independent || (!filtered && !generated)) source.rgb *= source.a;
        return float4(source.rgb * color.rgb * color.a, source.a * color.a);
    }
    if (generated || filteredPremult)
        source.rgb = source.a > 0.0 ? source.rgb / source.a : float3(0.0, 0.0, 0.0);
    return source * color;
}
