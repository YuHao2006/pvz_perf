// Native port of vulkan/shaders/game_font_cs.comp, with a directly bound SRV.
// b0, space0: 13 root DWORDs:
// DWORD 0..3 (bytes 0..15): int4 src (source x, y, width, height).
// DWORD 4..7 (bytes 16..31): int4 dst (target x, y, width, height).
// DWORD 8 (byte 32): uint white; DWORD 9,10 (bytes 36,40): int sourceWidth, sourceHeight.
// DWORD 11 (byte 44): uint samplingFlags (bit 27 = edge RGB sanding).
// DWORD 12 (byte 48): uint sourceSlot (bit 26 = opaque; bit 31 = premultiplied).
// t0: source RGBA image; u0: RGBA16 FLOAT. No samplers or descriptor arrays.
// Bind the source itself at t0; sourceSlot's low descriptor bits are ignored.
// Dispatch ceil(dst.z/8), ceil(dst.w/8), 1. Requires shader double precision.
cbuffer FontConstants : register(b0, space0)
{
    int4 src : packoffset(c0);
    int4 dst : packoffset(c1);
    uint white : packoffset(c2.x);
    int sourceWidth : packoffset(c2.y);
    int sourceHeight : packoffset(c2.z);
    uint samplingFlags : packoffset(c2.w);
    uint sourceSlot : packoffset(c3.x);
};

Texture2D<float4> sourceImage : register(t0, space0);
RWTexture2D<float4> target : register(u0, space0);

uint4 RawPixel(int2 position)
{
    position = clamp(position, int2(0, 0), int2(sourceWidth - 1, sourceHeight - 1));
    float4 rgba = sourceImage.Load(int3(position, 0));
    if ((sourceSlot & 0x04000000u) != 0u)
        rgba.a = 1.0;
    if ((sourceSlot & 0x80000000u) != 0u)
        rgba.rgb = rgba.a > 0.0 ? rgba.rgb / rgba.a : float3(0.0, 0.0, 0.0);
    return uint4(round(clamp(rgba, 0.0, 1.0) * 255.0));
}

uint4 Pixel(int2 position)
{
    uint4 rgba = RawPixel(position);
    if ((samplingFlags & 0x08000000u) != 0u && rgba.a == 0u)
    {
        uint3 rgb = uint3(0u, 0u, 0u);
        uint count = 0u;
        for (int dy = -1; dy <= 1; dy += 2)
        {
            for (int dx = -1; dx <= 1; ++dx)
            {
                const int2 neighbor = position + int2(dx, dy);
                if (any(neighbor < int2(0, 0)) ||
                    any(neighbor >= int2(sourceWidth, sourceHeight)))
                    continue;
                const uint4 value = RawPixel(neighbor);
                if (value.a != 0u)
                {
                    rgb += value.rgb;
                    ++count;
                }
            }
        }
        rgba.rgb = count != 0u ? rgb / count : uint3(0u, 0u, 0u);
    }
    return rgba;
}

// HLSL's floating floor/ceil intrinsics can narrow doubles. Keep the Vulkan
// double-to-integer endpoints exact using truncation and a double comparison.
int FloorToInt(double value)
{
    const int truncated = int(value);
    return double(truncated) > value ? truncated - 1 : truncated;
}

int CeilToInt(double value)
{
    const int truncated = int(value);
    return double(truncated) < value ? truncated + 1 : truncated;
}

// Match MI_SlowStretchBlt.inc: separable unsigned weights, asymmetric 257/256
// units, and endpoint-aligned enlargement. Do not replace with hardware linear.
struct Axis
{
    int first;
    int last;
    uint firstWeight;
    uint lastWeight;
    bool shrinking;
    double factor;
    int outputIndex;
    uint unit;
};

Axis MakeAxis(int inputExtent, int outputExtent, int outputIndex,
    int start, int physicalExtent, uint unit)
{
    Axis result;
    result.shrinking = inputExtent >= outputExtent;
    result.outputIndex = outputIndex + 1;
    result.unit = unit;
    if (result.shrinking)
    {
        precise double factor = double(outputExtent) / double(inputExtent);
        result.factor = factor;
        result.first = max(0, FloorToInt(double(outputIndex) / factor) - 1);
        result.last = min(inputExtent - 1, CeilToInt(double(outputIndex + 1) / factor) + 1);
        result.firstWeight = 0u;
        result.lastWeight = 0u;
    }
    else
    {
        precise double factor = double(inputExtent - 1) / double(outputExtent - 1);
        precise double coordinate = double(outputIndex) * factor;
        if (unit == 257u)
            coordinate += double(start);
        const int base = int(coordinate);
        precise double fraction = coordinate - double(base);
        result.first = base - (unit == 257u ? start : 0);
        result.last = unit == 257u ? min(result.first + 1, physicalExtent - 1 - start) :
            min(result.first + 1, inputExtent - 1);
        result.firstWeight = uint(double(unit) * (1.0 - fraction));
        result.lastWeight = unit - result.firstWeight;
        result.factor = 0.0;
    }
    return result;
}

uint Weight(Axis value, int index)
{
    if (!value.shrinking)
        return (index == value.first ? value.firstWeight : 0u) +
            (index == value.last ? value.lastWeight : 0u);
    precise double begin = double(index) * value.factor + 1.0;
    precise double end = begin + value.factor;
    const int a = int(begin);
    const int b = int(end);
    if (a == b)
        return a == value.outputIndex ? uint(double(value.unit) * value.factor) : 0u;
    return (a == value.outputIndex ? uint(double(value.unit) * (double(b) - begin)) : 0u) +
        (b == value.outputIndex ? uint(double(value.unit) * (end - double(b))) : 0u);
}

[numthreads(8, 8, 1)]
void CSMain(uint3 id : SV_DispatchThreadID)
{
    const int2 outputPosition = int2(id.xy);
    if (any(outputPosition >= dst.zw))
        return;
    const Axis x = MakeAxis(src.z, dst.z, outputPosition.x, src.x, sourceWidth, 257u);
    const Axis y = MakeAxis(src.w, dst.w, outputPosition.y, src.y, sourceHeight, 256u);
    uint4 total = uint4(0u, 0u, 0u, 0u);
    for (int iy = y.first; iy <= y.last; ++iy)
    {
        const uint wy = Weight(y, iy);
        if (wy == 0u)
            continue;
        uint4 horizontal = uint4(0u, 0u, 0u, 0u);
        for (int ix = x.first; ix <= x.last; ++ix)
        {
            const uint wx = Weight(x, ix);
            if (wx != 0u)
                horizontal += Pixel(src.xy + int2(ix, iy)) * wx;
        }
        total += horizontal * wy;
    }
    uint4 result = total >> 16u;
    result.rgb = (result.rgb * result.a) >> 8u;
    if (result.a == 0u)
        result.rgb = uint3(0u, 0u, 0u);
    const float alpha = float(result.a) / 255.0;
    const float3 rgb = white != 0u ? float3(1.0, 1.0, 1.0) : float3(result.rgb) / 255.0;
    target[dst.xy + outputPosition] = float4(rgb * alpha, alpha);
}
