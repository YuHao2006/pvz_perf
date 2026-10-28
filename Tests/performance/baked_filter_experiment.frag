#version 450
#extension GL_EXT_nonuniform_qualifier : require
// Fixed RGB filters were already baked into straight RGBA8. Keep the original
// premultiplied-per-tap interpolation; remove only repeated filter evaluation.
precision mediump float;
precision highp int;
layout(set=0,binding=0) uniform texture2D images[4096];
layout(set=1,binding=0) uniform sampler samplers[4];
layout(location=0) in vec4 color;
layout(location=1) in vec2 uv;
layout(location=2) flat in uint slot;
layout(location=3) flat in uint samplerIndex;
layout(location=0) out vec4 outColor;
vec4 tap(ivec2 p,ivec2 extent) {
    if ((samplerIndex&2u)!=0u) p=((p%extent)+extent)%extent;
    else p=clamp(p,ivec2(0),extent-ivec2(1));
    vec4 source=texelFetch(sampler2D(images[nonuniformEXT(slot&0xfffu)],
        samplers[nonuniformEXT(samplerIndex)]),p,0);
    if ((slot&0x04000000u)!=0u) source.a=1.0;
    precise vec3 result=source.rgb*source.a;
    source.rgb=result;
    return source;
}
void main() {
    ivec2 extent=textureSize(sampler2D(images[nonuniformEXT(slot&0xfffu)],
        samplers[nonuniformEXT(samplerIndex)]),0);
    vec4 source;
    if ((samplerIndex&1u)==0u) source=tap(ivec2(floor(uv*vec2(extent))),extent);
    else {
        vec2 position=uv*vec2(extent)-vec2(0.5);
        ivec2 base=ivec2(floor(position));vec2 w=fract(position);
        vec4 top=mix(tap(base,extent),tap(base+ivec2(1,0),extent),w.x);
        vec4 bottom=mix(tap(base+ivec2(0,1),extent),tap(base+ivec2(1,1),extent),w.x);
        source=mix(top,bottom,w.y);
    }
    source.rgb=source.a>0.0 ? source.rgb/source.a : vec3(0.0);
    outColor=source*color;
}
