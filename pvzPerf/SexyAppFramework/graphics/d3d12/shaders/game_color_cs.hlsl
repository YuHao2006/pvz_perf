// Native port of vulkan/shaders/game_color_cs.comp, with a directly bound SRV.
// b0, space0: 12 root DWORDs:
// DWORD 0..3 (bytes 0..15): int4 rectangle (source x, y, output width, height).
// DWORD 4..7 (bytes 16..31): int4 tint (R, G, B, A).
// DWORD 8 (byte 32): uint operation (0 = copy; nonzero = tint).
// DWORD 9,10 (bytes 36,40): int sourceWidth, sourceHeight.
// DWORD 11 (byte 44): uint sourceSlot (legacy slot; bit 31 = premultiplied).
// t0: source RGBA image; u0: RGBA8 UNORM. No samplers or descriptor arrays.
// Bind the source itself at t0; sourceSlot's low descriptor bits are ignored.
// Dispatch ceil(rectangle.z/8), ceil(rectangle.w/8), 1.
cbuffer ColorConstants : register(b0, space0)
{
    int4 rectangle : packoffset(c0);
    int4 tint : packoffset(c1);
    uint operation : packoffset(c2.x);
    int sourceWidth : packoffset(c2.y);
    int sourceHeight : packoffset(c2.z);
    uint sourceSlot : packoffset(c2.w);
};

Texture2D<float4> sourceImage : register(t0, space0);
RWTexture2D<float4> target : register(u0, space0);

[numthreads(8, 8, 1)]
void CSMain(uint3 id : SV_DispatchThreadID)
{
    const int2 position = int2(id.xy);
    if (any(position >= rectangle.zw))
        return;
    const int2 inputPosition = position + rectangle.xy;
    if (any(inputPosition < int2(0, 0)) || any(inputPosition >= int2(sourceWidth, sourceHeight)))
    {
        target[position] = float4(0.0, 0.0, 0.0, 0.0);
        return;
    }
    float4 rgba = sourceImage.Load(int3(inputPosition, 0));
    if ((sourceSlot & 0x80000000u) != 0u)
        rgba.rgb = rgba.a > 0.0 ? rgba.rgb / rgba.a : float3(0.0, 0.0, 0.0);
    const uint4 value = uint4(round(clamp(rgba, 0.0, 1.0) * 255.0));
    if (operation == 0u)
    {
        target[position] = float4(value) / 255.0;
        return;
    }
    const uint4 product = value * uint4(tint);
    uint4 result;
    // This branch is pixel-wide, including alpha. Preserve unsigned wrapping.
    if (all(tint <= int4(255, 255, 255, 255)))
        result = (product >> 8u) & uint4(255u, 255u, 255u, 255u);
    else
        result = min(product / 255u, uint4(255u, 255u, 255u, 255u));

    // Raw immutable bytes: preserve hidden RGB and ignore opaque draw metadata.
    target[position] = float4(result) / 255.0;
}
