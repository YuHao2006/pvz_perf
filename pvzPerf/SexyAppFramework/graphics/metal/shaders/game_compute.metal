#include <metal_stdlib>
#include "../MetalShaderTypes.h"
using namespace metal;

// Hand-written ports of the four D3D12/Vulkan built-in compute shaders.
// Sources/targets must be distinct resources, with encoded UNORM source views.
// Color/alpha/caustic targets are RGBA8Unorm; font targets are RGBA16Float.
// Dispatch color/alpha/font in 8x8 groups, caustics in 8x4 groups, depth 1.

kernel void pvz_color_kernel(
    constant MetalColorConstants& p [[buffer(0)]],
    texture2d<float, access::read> source [[texture(0)]],
    texture2d<float, access::write> target [[texture(1)]],
    uint2 id [[thread_position_in_grid]])
{
    const int2 position = int2(id);
    if (any(position >= int2(p.rectangle[2], p.rectangle[3])))
        return;
    const int2 inputPosition = position + int2(p.rectangle[0], p.rectangle[1]);
    if (any(inputPosition < int2(0)) ||
        any(inputPosition >= int2(p.sourceWidth, p.sourceHeight)))
    {
        target.write(float4(0.0f), id);
        return;
    }
    float4 rgba = source.read(uint2(inputPosition));
    if ((p.sourceSlot & 0x80000000u) != 0u)
        rgba.rgb = rgba.a > 0.0f ? rgba.rgb / rgba.a : float3(0.0f);
    const uint4 value = uint4(rint(clamp(rgba, 0.0f, 1.0f) * 255.0f));
    if (p.operation == 0u)
    {
        target.write(float4(value) / 255.0f, id);
        return;
    }
    const int4 tint = int4(p.tint[0], p.tint[1], p.tint[2], p.tint[3]);
    const uint4 product = value * uint4(tint);
    // Preserve negative tint conversion, unsigned overflow, and pixel-wide branch.
    const uint4 result = all(tint <= int4(255)) ?
        (product >> 8u) & uint4(255u) : min(product / 255u, uint4(255u));
    target.write(float4(result) / 255.0f, id);
}

kernel void pvz_alpha_kernel(
    constant MetalAlphaConstants& p [[buffer(0)]],
    texture2d<float, access::read> baseImage [[texture(0)]],
    texture2d<float, access::read> alphaImage [[texture(1)]],
    texture2d<float, access::write> target [[texture(2)]],
    uint2 id [[thread_position_in_grid]])
{
    const int2 position = int2(id);
    if (position.x >= p.width || position.y >= p.height)
        return;
    float4 value = baseImage.read(id);
    const unsigned int alpha = unsigned(rint(alphaImage.read(id).b * 255.0f));
    if (p.colorOnly != 0u)
    {
        const unsigned int packed = p.color | (alpha << 24u);
        value = float4(float((packed >> 16u) & 255u),
            float((packed >> 8u) & 255u), float(packed & 255u),
            float(packed >> 24u)) / 255.0f;
    }
    else
        value.a = float(alpha) / 255.0f;
    target.write(value, id);
}

// Metal has no native double. These integer operations evaluate the finite,
// normal binary64 expressions used by MI_SlowStretchBlt, rounding each operation
// to nearest/even. Positive int32 extents and int32 origins never require
// subnormals, infinities or NaNs. This is not a float32/rational approximation:
// division rounding and subsequent cancellation are observable in byte weights.
struct PvzF64
{
    ulong bits;
};

static ulong pvz_shift_sticky(ulong value, unsigned int shift)
{
    if (shift == 0u)
        return value;
    if (shift >= 64u)
        return value != 0ul ? 1ul : 0ul;
    return (value >> shift) | ((value << (64u - shift)) != 0ul ? 1ul : 0ul);
}

static int pvz_f64_exponent(PvzF64 value)
{
    return int((value.bits >> 52u) & 2047ul) - 1023;
}

static ulong pvz_f64_mantissa(PvzF64 value)
{
    return (value.bits & 0x000ffffffffffffful) | 0x0010000000000000ul;
}

// significand has three guard/round/sticky bits, with its leading bit at 55.
static PvzF64 pvz_f64_pack(ulong significand, int exponent, bool negative)
{
    if (significand == 0ul)
        return PvzF64{0ul};
    while (significand >= (1ul << 56u))
    {
        significand = pvz_shift_sticky(significand, 1u);
        ++exponent;
    }
    while (significand < (1ul << 55u))
    {
        significand <<= 1u;
        --exponent;
    }
    ulong mantissa = significand >> 3u;
    const ulong remainder = significand & 7ul;
    if (remainder > 4ul || (remainder == 4ul && (mantissa & 1ul) != 0ul))
        ++mantissa;
    if (mantissa == (1ul << 53u))
    {
        mantissa >>= 1u;
        ++exponent;
    }
    return PvzF64{(negative ? (1ul << 63u) : 0ul) |
        (ulong(exponent + 1023) << 52u) | (mantissa & 0x000ffffffffffffful)};
}

static PvzF64 pvz_f64_int(int value)
{
    const bool negative = value < 0;
    const ulong magnitude = negative ? ulong(-long(value)) : ulong(value);
    return pvz_f64_pack(magnitude << 3u, 52, negative);
}

static PvzF64 pvz_f64_neg(PvzF64 value)
{
    return PvzF64{value.bits == 0ul ? 0ul : value.bits ^ (1ul << 63u)};
}

static PvzF64 pvz_f64_add(PvzF64 a, PvzF64 b)
{
    if (a.bits == 0ul)
        return b;
    if (b.bits == 0ul)
        return a;
    // Put the larger magnitude first so subtraction cannot underflow.
    if ((a.bits & 0x7ffffffffffffffful) < (b.bits & 0x7ffffffffffffffful))
    {
        const PvzF64 temporary = a;
        a = b;
        b = temporary;
    }
    const int exponent = pvz_f64_exponent(a);
    const ulong ma = pvz_f64_mantissa(a) << 3u;
    const ulong mb = pvz_shift_sticky(pvz_f64_mantissa(b) << 3u,
        unsigned(exponent - pvz_f64_exponent(b)));
    const bool sameSign = ((a.bits ^ b.bits) >> 63u) == 0ul;
    return pvz_f64_pack(sameSign ? ma + mb : ma - mb,
        exponent, (a.bits >> 63u) != 0ul);
}

static PvzF64 pvz_f64_sub(PvzF64 a, PvzF64 b)
{
    return pvz_f64_add(a, pvz_f64_neg(b));
}

static PvzF64 pvz_f64_mul(PvzF64 a, PvzF64 b)
{
    if (a.bits == 0ul || b.bits == 0ul)
        return PvzF64{0ul};
    const ulong ma = pvz_f64_mantissa(a);
    const ulong mb = pvz_f64_mantissa(b);
    // Exact 53x53 -> 106-bit product using four 32-bit limbs.
    const ulong mask = 0xfffffffful;
    const ulong p00 = (ma & mask) * (mb & mask);
    const ulong p01 = (ma & mask) * (mb >> 32u);
    const ulong p10 = (ma >> 32u) * (mb & mask);
    const ulong p11 = (ma >> 32u) * (mb >> 32u);
    const ulong middle = (p00 >> 32u) + (p01 & mask) + (p10 & mask);
    const ulong low = (middle << 32u) | (p00 & mask);
    const ulong high = p11 + (p01 >> 32u) + (p10 >> 32u) + (middle >> 32u);
    const ulong significand = (high << 15u) | (low >> 49u) |
        ((low & ((1ul << 49u) - 1ul)) != 0ul ? 1ul : 0ul);
    return pvz_f64_pack(significand,
        pvz_f64_exponent(a) + pvz_f64_exponent(b),
        ((a.bits ^ b.bits) >> 63u) != 0ul);
}

static PvzF64 pvz_f64_div(PvzF64 a, PvzF64 b)
{
    if (a.bits == 0ul)
        return PvzF64{0ul};
    // Callers guarantee nonzero divisors (positive physical/glyph extents).
    ulong remainder = pvz_f64_mantissa(a);
    const ulong divisor = pvz_f64_mantissa(b);
    int exponent = pvz_f64_exponent(a) - pvz_f64_exponent(b);
    // Normalize before quotient generation to keep all three rounding bits.
    if (remainder < divisor)
    {
        remainder <<= 1u;
        --exponent;
    }
    ulong quotient = 0ul;
    for (unsigned int i = 0u; i < 56u; ++i)
    {
        quotient <<= 1u;
        if (remainder >= divisor)
        {
            remainder -= divisor;
            quotient |= 1ul;
        }
        if (i != 55u)
            remainder <<= 1u;
    }
    quotient |= remainder != 0ul ? 1ul : 0ul;
    return pvz_f64_pack(quotient, exponent, ((a.bits ^ b.bits) >> 63u) != 0ul);
}

static int pvz_f64_trunc(PvzF64 value)
{
    if (value.bits == 0ul || pvz_f64_exponent(value) < 0)
        return 0;
    const ulong magnitude = pvz_f64_mantissa(value) >>
        unsigned(52 - pvz_f64_exponent(value));
    return int((value.bits >> 63u) != 0ul ? -long(magnitude) : long(magnitude));
}

static bool pvz_f64_less(PvzF64 a, PvzF64 b)
{
    if ((a.bits >> 63u) != (b.bits >> 63u))
        return (a.bits >> 63u) != 0ul;
    return (a.bits >> 63u) != 0ul ? a.bits > b.bits : a.bits < b.bits;
}

static int pvz_f64_floor(PvzF64 value)
{
    const int truncated = pvz_f64_trunc(value);
    return pvz_f64_less(value, pvz_f64_int(truncated)) ? truncated - 1 : truncated;
}

static int pvz_f64_ceil(PvzF64 value)
{
    const int truncated = pvz_f64_trunc(value);
    return pvz_f64_less(pvz_f64_int(truncated), value) ? truncated + 1 : truncated;
}

struct PvzFontAxis
{
    int first;
    int last;
    unsigned int firstWeight;
    unsigned int lastWeight;
    bool shrinking;
    PvzF64 factor;
    int outputIndex;
    unsigned int unit;
};

static PvzFontAxis pvz_font_axis(int inputExtent, int outputExtent, int outputIndex,
    int start, int physicalExtent, unsigned int unit)
{
    PvzFontAxis result;
    result.shrinking = inputExtent >= outputExtent;
    result.outputIndex = outputIndex + 1;
    result.unit = unit;
    if (result.shrinking)
    {
        result.factor = pvz_f64_div(pvz_f64_int(outputExtent), pvz_f64_int(inputExtent));
        result.first = max(0, pvz_f64_floor(pvz_f64_div(
            pvz_f64_int(outputIndex), result.factor)) - 1);
        result.last = min(inputExtent - 1, pvz_f64_ceil(pvz_f64_div(
            pvz_f64_int(outputIndex + 1), result.factor)) + 1);
        result.firstWeight = 0u;
        result.lastWeight = 0u;
    }
    else
    {
        const PvzF64 factor = pvz_f64_div(pvz_f64_int(inputExtent - 1),
            pvz_f64_int(outputExtent - 1));
        PvzF64 coordinate = pvz_f64_mul(pvz_f64_int(outputIndex), factor);
        if (unit == 257u)
            coordinate = pvz_f64_add(coordinate, pvz_f64_int(start));
        const int base = pvz_f64_trunc(coordinate);
        const PvzF64 fraction = pvz_f64_sub(coordinate, pvz_f64_int(base));
        result.first = base - (unit == 257u ? start : 0);
        result.last = unit == 257u ? min(result.first + 1, physicalExtent - 1 - start) :
            min(result.first + 1, inputExtent - 1);
        result.firstWeight = unsigned(pvz_f64_trunc(pvz_f64_mul(pvz_f64_int(int(unit)),
            pvz_f64_sub(pvz_f64_int(1), fraction))));
        result.lastWeight = unit - result.firstWeight;
        result.factor = PvzF64{0ul};
    }
    return result;
}

static unsigned int pvz_font_weight(PvzFontAxis axis, int index)
{
    if (!axis.shrinking)
        return (index == axis.first ? axis.firstWeight : 0u) +
            (index == axis.last ? axis.lastWeight : 0u);
    const PvzF64 begin = pvz_f64_add(
        pvz_f64_mul(pvz_f64_int(index), axis.factor), pvz_f64_int(1));
    const PvzF64 end = pvz_f64_add(begin, axis.factor);
    const int a = pvz_f64_trunc(begin);
    const int b = pvz_f64_trunc(end);
    const PvzF64 unit = pvz_f64_int(int(axis.unit));
    if (a == b)
        return a == axis.outputIndex ?
            unsigned(pvz_f64_trunc(pvz_f64_mul(unit, axis.factor))) : 0u;
    return (a == axis.outputIndex ? unsigned(pvz_f64_trunc(pvz_f64_mul(unit,
        pvz_f64_sub(pvz_f64_int(b), begin)))) : 0u) +
        (b == axis.outputIndex ? unsigned(pvz_f64_trunc(pvz_f64_mul(unit,
        pvz_f64_sub(end, pvz_f64_int(b))))) : 0u);
}

static uint4 pvz_font_raw_pixel(texture2d<float, access::read> source,
    constant MetalFontConstants& p, int2 position)
{
    position = clamp(position, int2(0), int2(p.sourceWidth - 1, p.sourceHeight - 1));
    float4 rgba = source.read(uint2(position));
    if ((p.sourceSlot & 0x04000000u) != 0u)
        rgba.a = 1.0f;
    if ((p.sourceSlot & 0x80000000u) != 0u)
        rgba.rgb = rgba.a > 0.0f ? rgba.rgb / rgba.a : float3(0.0f);
    return uint4(rint(clamp(rgba, 0.0f, 1.0f) * 255.0f));
}

static uint4 pvz_font_pixel(texture2d<float, access::read> source,
    constant MetalFontConstants& p, int2 position)
{
    uint4 rgba = pvz_font_raw_pixel(source, p, position);
    if ((p.samplingFlags & 0x08000000u) != 0u && rgba.a == 0u)
    {
        uint3 rgb = uint3(0u);
        unsigned int count = 0u;
        for (int dy = -1; dy <= 1; dy += 2)
            for (int dx = -1; dx <= 1; ++dx)
            {
                const int2 neighbor = position + int2(dx, dy);
                if (any(neighbor < int2(0)) ||
                    any(neighbor >= int2(p.sourceWidth, p.sourceHeight)))
                    continue;
                const uint4 value = pvz_font_raw_pixel(source, p, neighbor);
                if (value.a != 0u)
                {
                    rgb += value.rgb;
                    ++count;
                }
            }
        rgba.rgb = count != 0u ? rgb / count : uint3(0u);
    }
    return rgba;
}

kernel void pvz_font_kernel(
    constant MetalFontConstants& p [[buffer(0)]],
    texture2d<float, access::read> source [[texture(0)]],
    texture2d<float, access::write> target [[texture(1)]],
    uint2 id [[thread_position_in_grid]])
{
    const int2 outputPosition = int2(id);
    if (any(outputPosition >= int2(p.dst[2], p.dst[3])))
        return;
    const PvzFontAxis x = pvz_font_axis(p.src[2], p.dst[2], outputPosition.x,
        p.src[0], p.sourceWidth, 257u);
    const PvzFontAxis y = pvz_font_axis(p.src[3], p.dst[3], outputPosition.y,
        p.src[1], p.sourceHeight, 256u);
    uint4 total = uint4(0u);
    for (int iy = y.first; iy <= y.last; ++iy)
    {
        const unsigned int wy = pvz_font_weight(y, iy);
        if (wy == 0u)
            continue;
        uint4 horizontal = uint4(0u);
        for (int ix = x.first; ix <= x.last; ++ix)
        {
            const unsigned int wx = pvz_font_weight(x, ix);
            if (wx != 0u)
                horizontal += pvz_font_pixel(source, p,
                    int2(p.src[0], p.src[1]) + int2(ix, iy)) * wx;
        }
        total += horizontal * wy;
    }
    uint4 result = total >> 16u;
    result.rgb = (result.rgb * result.a) >> 8u;
    if (result.a == 0u)
        result.rgb = uint3(0u);
    const float alpha = float(result.a) / 255.0f;
    const float3 rgb = p.white != 0u ? float3(1.0f) : float3(result.rgb) / 255.0f;
    target.write(float4(rgb * alpha, alpha),
        uint2(int2(p.dst[0], p.dst[1]) + outputPosition));
}

static unsigned int pvz_caustic_blue(texture2d<float, access::read> source,
    unsigned int index)
{
    return unsigned(rint(source.read(uint2(index % 256u, index / 256u)).b * 255.0f));
}

static unsigned int pvz_caustic_lookup(texture2d<float, access::read> source,
    unsigned int u, unsigned int v)
{
    const unsigned int timeU = u & 0xffff0000u;
    const unsigned int timeV = v & 0xffff0000u;
    const unsigned int factorU1 = ((u - timeU) & 0x0000fffeu) + 1u;
    const unsigned int factorV1 = ((v - timeV) & 0x0000fffeu) + 1u;
    const unsigned int factorU0 = 65536u - factorU1;
    const unsigned int factorV0 = 65536u - factorV1;
    const unsigned int indexU0 = (timeU >> 16u) % 256u;
    const unsigned int indexU1 = ((timeU >> 16u) + 1u) % 256u;
    const unsigned int indexV0 = (timeV >> 16u) % 256u;
    const unsigned int indexV1 = ((timeV >> 16u) + 1u) % 256u;
    return ((((factorU0 * factorV1) / 65536u) *
                pvz_caustic_blue(source, indexV1 * 256u + indexU0)) / 65536u) +
        ((((factorU1 * factorV1) / 65536u) *
                pvz_caustic_blue(source, indexV1 * 256u + indexU1)) / 65536u) +
        ((((factorU0 * factorV0) / 65536u) *
                pvz_caustic_blue(source, indexV0 * 256u + indexU0)) / 65536u) +
        ((((factorU1 * factorV0) / 65536u) *
                pvz_caustic_blue(source, indexV0 * 256u + indexU1)) / 65536u);
}

static unsigned int pvz_caustic_div(unsigned int n, unsigned int divisor)
{
    return (n & 0x80000000u) != 0u ?
        0u - ((0u - n) / divisor) : n / divisor;
}

kernel void pvz_caustic_kernel(
    constant MetalCausticConstants& p [[buffer(0)]],
    texture2d<float, access::read> source [[texture(0)]],
    texture2d<float, access::write> target [[texture(1)]],
    uint2 id [[thread_position_in_grid]])
{
    if (id.x >= 128u || id.y >= 64u)
        return;
    const unsigned int timeV1 = (256u - id.y) << 17u;
    const unsigned int timeV0 = id.y << 17u;
    const unsigned int timeU = id.x << 17u;
    const unsigned int timePool0 = p.counter << 16u;
    const unsigned int timePool1 = ((p.counter & 65535u) + 1u) << 16u;
    const unsigned int a1 = pvz_caustic_lookup(source,
        timeU - pvz_caustic_div(timePool1, 6u), timeV1 + (timePool0 >> 3u)) & 255u;
    const unsigned int a0 = pvz_caustic_lookup(source,
        timeU + pvz_caustic_div(timePool0, 10u), timeV0) & 255u;
    const unsigned int a = (a0 + a1) / 2u;
    unsigned int alpha;
    if (a >= 160u)
        alpha = 255u - 2u * (a - 160u);
    else if (a >= 128u)
        alpha = 5u * (a - 128u);
    else
        alpha = 0u;
    target.write(float4(1.0f, 1.0f, 1.0f, float(alpha / 3u) / 255.0f), id);
}
