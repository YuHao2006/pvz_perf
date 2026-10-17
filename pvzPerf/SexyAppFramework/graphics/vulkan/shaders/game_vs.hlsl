struct PushData { float2 extent; };
[[vk::push_constant]] ConstantBuffer<PushData> push;
struct VertexIn {
    [[vk::location(0)]] float2 position : POSITION;
    [[vk::location(1)]] float4 color : COLOR0;
    [[vk::location(2)]] float2 uv : TEXCOORD0;
    // bindless 槽位：纹理不再是绑定状态，由每个顶点声明本四边形采哪个槽
    [[vk::location(3)]] uint slot : TEXCOORD1;
    // 采样器索引：与槽位同法，消除采样器切换断点（sampler 是 HLSL 保留字）
    [[vk::location(4)]] uint samplerIndex : TEXCOORD2;
};
struct VertexOut {
    float4 position : SV_Position;
    [[vk::location(0)]] float4 color : COLOR0;
    [[vk::location(1)]] float2 uv : TEXCOORD0;
    [[vk::location(2)]] uint slot : TEXCOORD1;
    [[vk::location(3)]] uint samplerIndex : TEXCOORD2;
};
VertexOut main(VertexIn input) {
    VertexOut output;
    // Positive Vulkan viewport height: NDC -1 is the TOP, unlike D3D.
    // Pixel edges stay integral; no inherited DX9 half-pixel correction.
    output.position = float4(input.position / push.extent * 2.0 - 1.0, 0.0, 1.0);
    output.color = input.color;
    output.uv = input.uv;
    output.slot = input.slot;
    output.samplerIndex = input.samplerIndex;
    return output;
}
