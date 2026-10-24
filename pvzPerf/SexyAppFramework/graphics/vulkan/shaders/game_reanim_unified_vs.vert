#version 450
layout(location=0) in vec2 inPosition;
layout(location=1) in vec4 inColor;
layout(location=2) in vec2 inUV;
layout(location=3) in uint inSlot;
layout(location=4) in uint inSampler;
layout(location=0) out vec2 position;
layout(location=1) out vec4 vertexColor;
layout(location=2) out vec2 vertexUV;
layout(location=3) flat out uint vertexSlot;
layout(location=4) flat out uint vertexSampler;
void main() {
    position=inPosition;vertexColor=inColor;vertexUV=inUV;
    vertexSlot=inSlot;vertexSampler=inSampler;
    gl_Position=vec4(0.0,0.0,0.0,1.0);
}
