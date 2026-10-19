float4 projection : register(c0);

struct ImageInput {
    float2 position : POSITION0;
    float2 uv : TEXCOORD0;
};
struct ImageOutput {
    float4 position : POSITION0;
    float2 uv : TEXCOORD0;
};
ImageOutput imageVS(ImageInput input)
{
    ImageOutput output;
    output.position = float4(input.position * projection.xy + projection.zw, 0.0, 1.0);
    output.uv = input.uv;
    return output;
}
