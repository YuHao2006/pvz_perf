#version 450
layout(points) in;
layout(triangle_strip,max_vertices=18) out;
layout(location=0) flat in vec4 point0[];
layout(location=1) flat in vec4 point1[];
layout(location=2) flat in vec4 point2[];
layout(location=3) flat in vec4 point3[];
layout(location=4) flat in vec4 trackColor[];
layout(location=5) flat in vec4 trackClip[];
layout(location=6) flat in uvec4 trackInfo[];
layout(location=0) out vec4 color;
layout(location=1) out vec2 uv;
layout(location=2) flat out uint slot;
layout(location=3) flat out uint samplerIndex;
layout(push_constant) uniform Push {vec2 extent;} push;
void emitPoint(vec4 point) {
    gl_Position=vec4(point.xy/push.extent*2.0-1.0,0.0,1.0);
    color=trackColor[0];uv=point.zw;slot=trackInfo[0].x;samplerIndex=trackInfo[0].y;
    EmitVertex();
}
bool insideClip(vec4 vertex,int edge,float boundary) {
    float value=(edge==0 || edge==2)?vertex.x:vertex.y;
    return edge<2?value>=boundary:value<boundary;
}
vec4 intersection(vec4 a,vec4 b,int edge,float boundary) {
    float av=(edge==0 || edge==2)?a.x:a.y,bv=(edge==0 || edge==2)?b.x:b.y;
    precise float t=(boundary-av)/(bv-av);
    precise vec4 result=a+(b-a)*t;
    return result;
}
void main() {
    if (trackInfo[0].w==0u) return;
    if (trackInfo[0].z==6u) {
        // Same diagonal as the CPU's four-corner strip. Winding is immaterial
        // because sprite pipelines have no face culling.
        emitPoint(point0[0]);emitPoint(point1[0]);emitPoint(point3[0]);emitPoint(point2[0]);
        EndPrimitive();return;
    }
    vec4 polygon[8];
    polygon[0]=point0[0];polygon[1]=point1[0];polygon[2]=point2[0];polygon[3]=point3[0];
    int count=4;
    for (int edge=0;edge<4;++edge) {
        if (count<2) return;
        vec4 clipped[8];int written=0;
        for (int i=0;i<count;++i) {
            vec4 p=polygon[(i+count-1)%count],q=polygon[i];
            bool pIn=insideClip(p,edge,trackClip[0][edge]);
            bool qIn=insideClip(q,edge,trackClip[0][edge]);
            if (pIn && qIn) clipped[written++]=q;
            else if (pIn!=qIn) {
                clipped[written++]=intersection(p,q,edge,trackClip[0][edge]);
                if (qIn) clipped[written++]=q;
            }
        }
        count=written;
        for (int i=0;i<count;++i) polygon[i]=clipped[i];
    }
    for (int i=1;i+1<count;++i) {
        emitPoint(polygon[0]);emitPoint(polygon[i]);emitPoint(polygon[i+1]);EndPrimitive();
    }
}
