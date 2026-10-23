// Native port of vulkan/shaders/game_alpha_cs.comp.
// b0, space0: 4 root DWORDs, byte offsets 0, 4, 8, 12:
// int width, height; uint color, colorOnly.
// color is the legacy packed ARGB value, combined with alpha by bitwise OR.
// t0: base RGBA image; t1: alpha image (coverage in blue); u0: RGBA8 UNORM.
// No samplers. Dispatch ceil(width/8), ceil(height/8), 1; inputs have equal dimensions.
cbuffer AlphaConstants : register(b0, space0)
{
    int width : packoffset(c0.x);
    int height : packoffset(c0.y);
    uint color : packoffset(c0.z);
    uint colorOnly : packoffset(c0.w);
};

Texture2D<float4> baseImage : register(t0, space0);
Texture2D<float4> alphaImage : register(t1, space0);
RWTexture2D<float4> target : register(u0, space0);

[numthreads(8, 8, 1)]
void CSMain(uint3 id : SV_DispatchThreadID)
{
    const int2 position = int2(id.xy);
    if (position.x >= width || position.y >= height)
        return;
    float4 value = baseImage.Load(int3(position, 0));
    const uint alpha = uint(round(alphaImage.Load(int3(position, 0)).b * 255.0));
    if (colorOnly != 0u)
    {
        const uint packed = color | (alpha << 24u);
        value = float4(float((packed >> 16u) & 255u), float((packed >> 8u) & 255u),
            float(packed & 255u), float(packed >> 24u)) / 255.0;
    }
    else
    {
        value.a = float(alpha) / 255.0;
    }
    target[position] = value;
}
