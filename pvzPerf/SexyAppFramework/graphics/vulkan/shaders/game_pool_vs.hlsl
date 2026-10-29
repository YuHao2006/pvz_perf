struct PushData {
    float2 extent;
    float2 geometry;
    float2 translation;
    float2 padding;
    float4 time;
    uint4 meta; // layer, night, encoded texture slot, sampler
};
[[vk::push_constant]] ConstantBuffer<PushData> push;
struct Input {
    [[vk::location(0)]] float2 grid : POSITION;
    [[vk::location(1)]] float2 phase : TEXCOORD0;
};
struct Output {
    float4 position : SV_Position;
    [[vk::location(0)]] float4 color : COLOR0;
    [[vk::location(1)]] float2 uv : TEXCOORD0;
    [[vk::location(2)]] uint slot : TEXCOORD1;
    [[vk::location(3)]] uint samplerIndex : TEXCOORD2;
};
Output main(Input input) {
    const float x=input.grid.x, y=input.grid.y;
    const float px=input.phase.x, py=input.phase.y;
    const float t1=push.time.x, t2=push.time.y, t3=push.time.z, t5=push.time.w;
    const uint layer=push.meta.x;
    float2 wave=0;
    if (x!=0 && x!=15 && y!=0 && y!=5) {
        if (layer==0) {
            wave.x=sin(py+t2)*0.002+sin(py+t1)*0.005;
            wave.y=sin(px+t5)*0.01+sin(px+t3)*0.015+sin(px+t1)*0.005;
        } else if (layer==1) {
            wave.x=sin(py*0.2+t2)*0.015+sin(py*0.2+t1)*0.012;
            wave.y=sin(px*0.2+t5)*0.005+sin(px*0.2+t3)*0.015+sin(px*0.2+t1)*0.02;
        } else {
            wave.x=sin(py+t1*1.5)*0.004+sin(py+t2*1.5)*0.005;
            wave.y=sin(px*4+t5*2.5)*0.005+sin(px*2+t3*2.5)*0.04+sin(px*3+t1*2.5)*0.02;
        }
    }
    const float2 base=float2(x/15,y/5);
    const float2 position=layer==2 ? float2((704.0/15)*x+45,30*y+288) :
        float2((push.geometry.x/15)*x+35,(push.geometry.y/5)*y+279);
    float alpha=1;
    // Destination-space scissors clip translated pool geometry exactly.
    // Vertex alpha is only the authored caustic opacity, never a crop mask.
    if (layer==2)
        alpha=(x==0 || x==15 || y==0 ? 32 : push.meta.y!=0 ? 48 : x<=7 ? 192 : 128)/255.0;
    Output output;
    output.position=float4((position+push.translation)/push.extent*2-1,0,1);
    output.color=float4(1,1,1,alpha);
    output.uv=layer==2 ? (base+wave)+base : wave+base;
    output.slot=push.meta.z;
    output.samplerIndex=push.meta.w;
    return output;
}
