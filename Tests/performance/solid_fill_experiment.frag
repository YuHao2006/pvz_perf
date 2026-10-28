#version 450
precision mediump float;
layout(location=0) in vec4 color;
layout(location=0) out vec4 outColor;
void main() { outColor=vec4(color.rgb*color.a,color.a); }
