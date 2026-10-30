// Pool wave evaluation is CPU-owned; the GPU only projects and draws the mesh.
struct PushData {
    float2 extent;
    uint slot;
    uint samplerIndex;
};
[[vk::push_constant]] ConstantBuffer<PushData> push;
struct Input {
    [[vk::location(0)]] float2 position : POSITION;
    [[vk::location(1)]] float2 uv : TEXCOORD0;
    [[vk::location(2)]] float alpha : COLOR0;
};
struct Output {
    float4 position : SV_Position;
    [[vk::location(0)]] float4 color : COLOR0;
    [[vk::location(1)]] float2 uv : TEXCOORD0;
    [[vk::location(2)]] uint slot : TEXCOORD1;
    [[vk::location(3)]] uint samplerIndex : TEXCOORD2;
};
Output main(Input input) {
    Output output;
    output.position = float4(input.position/push.extent*2-1,0,1);
    output.color = float4(1,1,1,input.alpha);
    output.uv = input.uv;
    output.slot = push.slot;
    output.samplerIndex = push.samplerIndex;
    return output;
}
