float4 projection : register(c0);

struct Input {
    float2 position : POSITION0;
    float4 color : COLOR0;
    float2 uv : TEXCOORD0;
    float4 rect : TEXCOORD1;
    float flags : TEXCOORD2;
};
struct Output {
    float4 position : POSITION0;
    float2 uv : TEXCOORD0;
    float4 rect : TEXCOORD1;
    float flags : TEXCOORD2;
    float4 color : TEXCOORD3;
};
Output sceneVS(Input input)
{
    Output output;
    output.position = float4(input.position * projection.xy + projection.zw, 0.0, 1.0);
    output.uv = input.uv;
    output.color = input.color;
    output.rect = input.rect;
    output.flags = input.flags;
    return output;
}
