#version 450
struct Track { uint keyOffset,keyCount,flags,padding; };
struct Key {
    float transX,transY,skewX,skewY,scaleX,scaleY,alpha;
    int frame; uint imageSlot,padding0,padding1,padding2;
};
struct Geometry { float width,height,u0,v0,u1,v1; uint padding0,padding1; };
layout(set=2,binding=0,std430) readonly buffer Tracks {Track tracks[];};
layout(set=2,binding=1,std430) readonly buffer Keys {Key keys[];};
layout(set=2,binding=2,std430) readonly buffer Geometries {Geometry geometry[];};
layout(location=0) in uvec4 sampleInfo;
layout(location=1) in vec4 timeTranslation;
layout(location=2) in vec4 overlayX;
layout(location=3) in vec4 overlayY;
layout(location=4) in uvec4 colorFlags;
layout(location=5) in uvec4 outputInfo;
layout(location=6) in vec4 clipInfo;
layout(location=0) flat out vec4 point0;
layout(location=1) flat out vec4 point1;
layout(location=2) flat out vec4 point2;
layout(location=3) flat out vec4 point3;
layout(location=4) flat out vec4 trackColor;
layout(location=5) flat out vec4 trackClip;
layout(location=6) flat out uvec4 trackInfo;
float interpolate(float a,float b,float t) {
    precise float value=a+(b-a)*t; return value;
}
float fastSin(float radians) {
    precise float t=radians*0.15915494+0.5;
    t-=floor(t);
    precise float x=(t-0.5)*6.2831853;
    precise float x2=x*x;
    precise float result=x*(0.999999707+x2*(-0.166665772+x2*(0.008332558+
        x2*(-0.000198125755+x2*(2.70405121e-06+x2*-2.05342445e-08)))));
    return result;
}
float fastCos(float radians) {
    precise float angle=radians+1.57079633; return fastSin(angle);
}
vec4 transformCorner(vec2 corner,vec2 uv,vec4 matrix,vec2 translation) {
    precise float x=matrix.x*corner.x+matrix.y*corner.y+translation.x;
    precise float y=matrix.z*corner.x+matrix.w*corner.y+translation.y;
    return vec4(x,y,uv);
}
void main() {
    Track track=tracks[sampleInfo.x];
    Key a=keys[track.keyOffset+sampleInfo.y],b=keys[track.keyOffset+sampleInfo.z];
    float t=timeTranslation.x;
    precise float alpha=interpolate(a.alpha,b.alpha,t);
    precise float byteAlpha=alpha*float((colorFlags.x>>24u)&255u);
    byteAlpha=clamp(trunc(byteAlpha>0.0?byteAlpha+0.5:byteAlpha-0.5),0.0,255.0);
    uint image=a.imageSlot;
    Geometry base=geometry[image];
    Geometry source=geometry[sampleInfo.w*outputInfo.z+image];
    bool visible=a.frame>=0 && image!=0u && byteAlpha>0.0 && source.width>0.0 && source.height>0.0;
    if (colorFlags.w!=0u && a.frame!=-1 && b.frame==-1 && t>0.0) visible=false;
    trackColor=vec4(float((colorFlags.x>>16u)&255u),float((colorFlags.x>>8u)&255u),
        float(colorFlags.x&255u),byteAlpha)/255.0;
    trackClip=clipInfo;
    trackInfo=uvec4(outputInfo.w|colorFlags.y,colorFlags.z,outputInfo.y,visible?1u:0u);
    gl_Position=vec4(0.0,0.0,0.0,1.0);
    if (!visible) return;
    precise float skewX=-(interpolate(a.skewX,b.skewX,t)*0.017453292);
    precise float skewY=-(interpolate(a.skewY,b.skewY,t)*0.017453292);
    precise float sx=interpolate(a.scaleX,b.scaleX,t),sy=interpolate(a.scaleY,b.scaleY,t);
    precise float m00=fastCos(skewX)*sx,m10=-fastSin(skewX)*sx;
    precise float m01=fastSin(skewY)*sy,m11=fastCos(skewY)*sy;
    precise float tx=interpolate(a.transX,b.transX,t),ty=interpolate(a.transY,b.transY,t);
    precise float cx=m00*(base.width*0.5)+m01*(base.height*0.5)+tx;
    precise float cy=m10*(base.width*0.5)+m11*(base.height*0.5)+ty;
    precise float xx=overlayX.x*m00+overlayX.y*m10,xy=overlayX.x*m01+overlayX.y*m11;
    precise float yx=overlayY.x*m00+overlayY.y*m10,yy=overlayY.x*m01+overlayY.y*m11;
    precise float ox=overlayX.x*cx+overlayX.y*cy+overlayX.z;
    precise float oy=overlayY.x*cx+overlayY.y*cy+overlayY.z;
    ox+=timeTranslation.y;oy+=timeTranslation.z;
    vec4 matrix=vec4(xx,xy,yx,yy);vec2 translation=vec2(ox,oy);
    point0=transformCorner(vec2(-source.width/2.0,-source.height/2.0),vec2(source.u0,source.v0),matrix,translation);
    point1=transformCorner(vec2(-source.width/2.0,source.height/2.0),vec2(source.u0,source.v1),matrix,translation);
    point2=transformCorner(vec2(source.width/2.0,source.height/2.0),vec2(source.u1,source.v1),matrix,translation);
    point3=transformCorner(vec2(source.width/2.0,-source.height/2.0),vec2(source.u1,source.v0),matrix,translation);
}
