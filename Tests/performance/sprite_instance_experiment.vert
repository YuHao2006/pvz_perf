#version 450
layout(push_constant) uniform PushData { vec2 extent; } push;
layout(location=0) in vec4 positions01;
layout(location=1) in vec4 positions23;
layout(location=2) in vec4 uvs01;
layout(location=3) in vec4 uvs23;
layout(location=4) in vec4 color;
layout(location=5) in uint slot;
layout(location=6) in uint samplerIndex;
layout(location=0) out vec4 outColor;
layout(location=1) out vec2 outUv;
layout(location=2) flat out uint outSlot;
layout(location=3) flat out uint outSampler;
void main() {
    vec2 positions[4]=vec2[](positions01.xy,positions01.zw,positions23.xy,positions23.zw);
    vec2 uvs[4]=vec2[](uvs01.xy,uvs01.zw,uvs23.xy,uvs23.zw);
    gl_Position=vec4(positions[gl_VertexIndex]/push.extent*2.0-1.0,0.0,1.0);
    outColor=color;outUv=uvs[gl_VertexIndex];outSlot=slot;outSampler=samplerIndex;
}
