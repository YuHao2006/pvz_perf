#version 450
layout(triangles) in;
layout(triangle_strip,max_vertices=18) out;
layout(location=0) in vec2 position[];
layout(location=1) in vec4 vertexColor[];
layout(location=2) in vec2 vertexUV[];
layout(location=3) flat in uint vertexSlot[];
layout(location=4) flat in uint vertexSampler[];
layout(location=0) out vec4 color;
layout(location=1) out vec2 uv;
layout(location=2) flat out uint slot;
layout(location=3) flat out uint samplerIndex;
layout(push_constant) uniform Push {vec2 extent;} push;
struct Job {
    uvec4 sampleInfo;vec4 timeTranslation;vec4 overlayX;vec4 overlayY;
    uvec4 colorFlags;uvec4 outputInfo;vec4 clip;
};
struct Key {
    float transX,transY,skewX,skewY,scaleX,scaleY,alpha;int frame;uint imageSlot;
};
struct Geometry {float width,height,u0,v0,u1,v1;};
layout(set=2,binding=0,std430) readonly buffer Static {uint blob[];};
layout(set=2,binding=1,std430) readonly buffer Jobs {Job jobs[];};
float value(uint index) {return uintBitsToFloat(blob[index]);}
Key readKey(uint offset) {
    return Key(value(offset),value(offset+1u),value(offset+2u),value(offset+3u),
        value(offset+4u),value(offset+5u),value(offset+6u),int(blob[offset+7u]),blob[offset+8u]);
}
Geometry readGeometry(uint offset) {
    return Geometry(value(offset),value(offset+1u),value(offset+2u),value(offset+3u),
        value(offset+4u),value(offset+5u));
}
float interpolate(float a,float b,float t) {
    precise float result=a+(b-a)*t;return result;
}
float fastSin(float radians) {
    precise float t=radians*0.15915494+0.5;t-=floor(t);
    precise float x=(t-0.5)*6.2831853;
    precise float x2=x*x;
    precise float result=x*(0.999999707+x2*(-0.166665772+x2*(0.008332558+
        x2*(-0.000198125755+x2*(2.70405121e-06+x2*-2.05342445e-08)))));
    return result;
}
float fastCos(float radians) {
    precise float angle=radians+1.57079633;return fastSin(angle);
}
vec4 transformCorner(vec2 corner,vec2 sourceUV,vec4 matrix,vec2 translation) {
    precise float x=matrix.x*corner.x+matrix.y*corner.y+translation.x;
    precise float y=matrix.z*corner.x+matrix.w*corner.y+translation.y;
    return vec4(x,y,sourceUV);
}
vec4 residentColor;
uint residentSlot,residentSampler;
void emitResident(vec4 point) {
    gl_Position=vec4(point.xy/push.extent*2.0-1.0,0.0,1.0);
    color=residentColor;uv=point.zw;slot=residentSlot;samplerIndex=residentSampler;EmitVertex();
}
bool insideClip(vec4 point,int edge,float boundary) {
    float coordinate=(edge==0 || edge==2)?point.x:point.y;
    return edge<2?coordinate>=boundary:coordinate<boundary;
}
vec4 intersection(vec4 a,vec4 b,int edge,float boundary) {
    float av=(edge==0 || edge==2)?a.x:a.y,bv=(edge==0 || edge==2)?b.x:b.y;
    precise float t=(boundary-av)/(bv-av);
    precise vec4 result=a+(b-a)*t;return result;
}
void main() {
    if ((vertexSampler[0]&0x80000000u)==0u) {
        for (int i=0;i<3;++i) {
            gl_Position=vec4(position[i]/push.extent*2.0-1.0,0.0,1.0);
            color=vertexColor[i];uv=vertexUV[i];slot=vertexSlot[0];samplerIndex=vertexSampler[0];
            EmitVertex();
        }
        EndPrimitive();return;
    }
    Job job=jobs[vertexSampler[0]&0x7fffffffu];
    uint header=job.outputInfo.x;
    uint track=blob[header]+job.sampleInfo.x*4u;
    uint keyBase=blob[header+1u]+blob[track]*12u;
    Key a=readKey(keyBase+job.sampleInfo.y*12u),b=readKey(keyBase+job.sampleInfo.z*12u);
    float t=job.timeTranslation.x;
    precise float alpha=interpolate(a.alpha,b.alpha,t);
    precise float byteAlpha=alpha*float((job.colorFlags.x>>24u)&255u);
    byteAlpha=clamp(trunc(byteAlpha>0.0?byteAlpha+0.5:byteAlpha-0.5),0.0,255.0);
    uint image=a.imageSlot;
    uint geometryBase=blob[header+2u];
    Geometry base=readGeometry(geometryBase+image*8u);
    Geometry source=readGeometry(geometryBase+(job.sampleInfo.w*job.outputInfo.z+image)*8u);
    if (a.frame<0 || image==0u || byteAlpha<=0.0 || source.width<=0.0 || source.height<=0.0) return;
    if (job.colorFlags.w!=0u && a.frame!=-1 && b.frame==-1 && t>0.0) return;
    residentColor=vec4(float((job.colorFlags.x>>16u)&255u),float((job.colorFlags.x>>8u)&255u),
        float(job.colorFlags.x&255u),byteAlpha)/255.0;
    residentSlot=job.outputInfo.w|job.colorFlags.y;residentSampler=job.colorFlags.z;
    precise float skewX=-(interpolate(a.skewX,b.skewX,t)*0.017453292);
    precise float skewY=-(interpolate(a.skewY,b.skewY,t)*0.017453292);
    precise float sx=interpolate(a.scaleX,b.scaleX,t),sy=interpolate(a.scaleY,b.scaleY,t);
    precise float m00=fastCos(skewX)*sx,m10=-fastSin(skewX)*sx;
    precise float m01=fastSin(skewY)*sy,m11=fastCos(skewY)*sy;
    precise float tx=interpolate(a.transX,b.transX,t),ty=interpolate(a.transY,b.transY,t);
    precise float cx=m00*(base.width*0.5)+m01*(base.height*0.5)+tx;
    precise float cy=m10*(base.width*0.5)+m11*(base.height*0.5)+ty;
    precise float xx=job.overlayX.x*m00+job.overlayX.y*m10,xy=job.overlayX.x*m01+job.overlayX.y*m11;
    precise float yx=job.overlayY.x*m00+job.overlayY.y*m10,yy=job.overlayY.x*m01+job.overlayY.y*m11;
    precise float ox=job.overlayX.x*cx+job.overlayX.y*cy+job.overlayX.z;
    precise float oy=job.overlayY.x*cx+job.overlayY.y*cy+job.overlayY.z;
    ox+=job.timeTranslation.y;oy+=job.timeTranslation.z;
    vec4 matrix=vec4(xx,xy,yx,yy);vec2 translation=vec2(ox,oy);
    vec4 polygon[8];
    polygon[0]=transformCorner(vec2(-source.width/2.0,-source.height/2.0),vec2(source.u0,source.v0),matrix,translation);
    polygon[1]=transformCorner(vec2(-source.width/2.0,source.height/2.0),vec2(source.u0,source.v1),matrix,translation);
    polygon[2]=transformCorner(vec2(source.width/2.0,source.height/2.0),vec2(source.u1,source.v1),matrix,translation);
    polygon[3]=transformCorner(vec2(source.width/2.0,-source.height/2.0),vec2(source.u1,source.v0),matrix,translation);
    if (job.outputInfo.y==6u) {
        emitResident(polygon[0]);emitResident(polygon[1]);emitResident(polygon[3]);emitResident(polygon[2]);
        EndPrimitive();return;
    }
    int count=4;
    for (int edge=0;edge<4;++edge) {
        if (count<2) return;
        vec4 clipped[8];int written=0;
        for (int i=0;i<count;++i) {
            vec4 p=polygon[(i+count-1)%count],q=polygon[i];
            bool pIn=insideClip(p,edge,job.clip[edge]),qIn=insideClip(q,edge,job.clip[edge]);
            if (pIn && qIn) clipped[written++]=q;
            else if (pIn!=qIn) {
                clipped[written++]=intersection(p,q,edge,job.clip[edge]);
                if (qIn) clipped[written++]=q;
            }
        }
        count=written;
        for (int i=0;i<count;++i) polygon[i]=clipped[i];
    }
    for (int i=1;i+1<count;++i) {
        emitResident(polygon[0]);emitResident(polygon[i]);emitResident(polygon[i+1]);EndPrimitive();
    }
}
