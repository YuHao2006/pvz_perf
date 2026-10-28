#version 450
#extension GL_EXT_nonuniform_qualifier : require
// Experimental specialization of the production game_ps.frag: preserve its
// straight output and hardware blend equations, without unrelated filter paths.
precision mediump float;
precision highp int;
layout(set = 0, binding = 0) uniform texture2D images[4096];
layout(set = 1, binding = 0) uniform sampler samplers[4];
layout(location = 0) in vec4 color;
layout(location = 1) in vec2 uv;
layout(location = 2) flat in uint slot;
layout(location = 3) flat in uint samplerIndex;
layout(location = 0) out vec4 outColor;
void main() {
    vec4 source = texture(sampler2D(images[nonuniformEXT(slot & 0xfffu)],
                                   samplers[nonuniformEXT(samplerIndex)]), uv);
    if ((slot & 0x04000000u) != 0u) source.a = 1.0;
    if ((slot & 0x80000000u) != 0u)
        source.rgb = source.a > 0.0 ? source.rgb / source.a : vec3(0.0);
    outColor = source * color;
}
