#include <metal_stdlib>
#include "../MetalShaderTypes.h"
using namespace metal;

// Native port of game_hdr.hlsl/game_hdr_ps.hlsl. All curve constants and
// operation order are retained; input is encoded SDR, output is Rec.2020 PQ.
struct MetalPresentVaryings
{
    float4 position [[position]];
    float4 color;
    float2 uv;
};

vertex MetalPresentVaryings pvz_hdr_vertex(unsigned int id [[vertex_id]],
    const device MetalGpuVertex* vertices [[buffer(0)]],
    constant MetalPresentConstants& p [[buffer(1)]])
{
    const device MetalGpuVertex& v = vertices[id];
    const float2 ndc = float2(v.position[0], v.position[1]) /
        float2(p.viewport[0], p.viewport[1]) * 2.0f - 1.0f;
    MetalPresentVaryings result;
    result.position = float4(ndc.x, -ndc.y, 0.0f, 1.0f);
    result.color = float4(v.color[0], v.color[1], v.color[2], v.color[3]);
    result.uv = float2(v.uv[0], v.uv[1]);
    return result;
}

static float3 pvz_hdr_srgb_to_linear(float3 c)
{
    const float3 lo = c / 12.92f;
    const float3 hi = pow((c + 0.055f) / 1.055f, float3(2.4f));
    return mix(lo, hi, step(float3(0.04045f), c));
}

static float3 pvz_hdr_pq(float3 luminance)
{
    const float m1 = 0.1593017578125f;
    const float m2 = 78.84375f;
    const float c1 = 0.8359375f;
    const float c2 = 18.8515625f;
    const float c3 = 18.6875f;
    const float3 lp = pow(max(luminance, 0.0f) / 10000.0f, float3(m1));
    return pow((c1 + c2 * lp) / (1.0f + c3 * lp), float3(m2));
}

// Explicit row dot products avoid HLSL/MSL matrix-major constructor differences.
static float3 pvz_hdr_709_to_2020(float3 c)
{
    return float3(dot(float3(0.6274040f, 0.3292860f, 0.0433101f), c),
        dot(float3(0.0690970f, 0.9195400f, 0.0113612f), c),
        dot(float3(0.0163916f, 0.0880132f, 0.8955953f), c));
}

static float3 pvz_hdr_709_to_expanded(float3 c)
{
    return float3(dot(float3(0.753845f, 0.198593f, 0.047562f), c),
        dot(float3(0.045746f, 0.941777f, 0.012477f), c),
        dot(float3(-0.001211f, 0.017604f, 0.983607f), c));
}

constant float pvz_hdr_spline_x[5] = {0.0f, 0.3f, 0.6f, 0.9f, 1.0f};
constant float pvz_hdr_spline_y[5] = {0.0f, 0.470306f, 1.56789f, 6.24642f, 10.0f};
constant float pvz_hdr_spline_d[5] = {1.56768f, 2.19488f, 5.92676f, 23.6637f, 37.5354f};
constant float pvz_hdr_spline_slope[4] = {1.56768f, 3.65859f, 15.5951f, 37.5354f};

static float pvz_hdr_spline(float x)
{
    x = saturate(x);
    const int seg = x >= 0.9f ? 3 : x >= 0.6f ? 2 : x >= 0.3f ? 1 : 0;
    const float dx = pvz_hdr_spline_x[seg + 1] - pvz_hdr_spline_x[seg] + 0.000001f;
    const float t = x - pvz_hdr_spline_x[seg];
    const float c3 = (3.0f * pvz_hdr_spline_slope[seg] -
        2.0f * pvz_hdr_spline_d[seg] - pvz_hdr_spline_d[seg + 1]) / dx;
    const float c4 = (pvz_hdr_spline_d[seg] + pvz_hdr_spline_d[seg + 1] -
        2.0f * pvz_hdr_spline_slope[seg]) / (dx * dx);
    return pvz_hdr_spline_y[seg] + pvz_hdr_spline_d[seg] * t +
        c3 * t * t + c4 * t * t * t;
}

static float4 pvz_hdr_convert(float3 signal, constant MetalPresentConstants& p)
{
    const float paperWhite = p.hdr[0];
    const float maxNits = p.hdr[1];
    const float reinhardPaper = p.hdr[2];
    const float strength = p.hdr[3];
    const float3 c = pvz_hdr_srgb_to_linear(saturate(signal));
    const float lum = dot(c, float3(0.212500f, 0.715400f, 0.072100f));
    const float cb = dot(c, float3(-0.099910f, -0.336090f, 0.436000f));
    const float cr = dot(c, float3(0.615000f, -0.558610f, -0.056390f));
    const float a = 1000.0f / reinhardPaper;
    const float k = (a + 0.0001f) / (a - 0.9999f);
    const float b = 1.0f / (a + 1.0001f);
    const float4 x4 = float4(c, lum);
    const float4 yRein = select(x4 / (1.0001f - x4),
        b + x4 * k / (k - x4), x4 > 0.5f);
    float4 ySpline = float4(pvz_hdr_spline(c.r), pvz_hdr_spline(c.g),
        pvz_hdr_spline(c.b), pvz_hdr_spline(lum));
    ySpline *= 100.0f / reinhardPaper;
    const float4 curve = mix(ySpline, yRein, 0.5f);
    const float3 pres = curve.w * (c / max(lum, 0.0001f));
    const float3 rec = float3(curve.w + 1.280330f * cr,
        curve.w - 0.214820f * cb - 0.380590f * cr,
        curve.w + 2.127980f * cb);
    const float3 lumaLerp = float3(1.2f, 1.1f, 1.0f);
    float3 outColor = lumaLerp * pres + (1.0f - lumaLerp) * rec;
    const float3 satWeight = float3(0.2f);
    outColor = (1.0f - satWeight) * outColor + satWeight * curve.rgb;
    outColor = 0.9f * outColor + 0.1f * (c * a);
    const float tGate = saturate((maxNits - reinhardPaper) / (1000.0f - reinhardPaper));
    outColor = mix(c, outColor, tGate);
    outColor *= reinhardPaper / paperWhite;
    const float3 s2020 = pvz_hdr_709_to_2020(outColor);
    const float mx = max(outColor.x, max(outColor.y, outColor.z));
    const float3 gate = saturate((mx - float3(1.0f)) /
        (float3(3.5f, 5.0f, 5.0f) - float3(1.0f)));
    const float3 gamut = mix(s2020, pvz_hdr_709_to_expanded(outColor), gate);
    const float3 sdrRef = pvz_hdr_709_to_2020(c) * (reinhardPaper / paperWhite);
    const float3 output = mix(sdrRef, gamut, strength);
    return float4(pvz_hdr_pq(output * paperWhite), 1.0f);
}

fragment float4 pvz_hdr_fragment(MetalPresentVaryings input [[stage_in]],
    constant MetalPresentConstants& p [[buffer(1)]],
    texture2d<float> source [[texture(0)]],
    sampler sourceSampler [[sampler(0)]])
{
    return pvz_hdr_convert(source.sample(sourceSampler, input.uv).rgb * input.color.rgb, p);
}
