float4 projection : register(c0);
float4 poolGeometry : register(c1); // width,height,transX,transY
float4 waveTime : register(c2);
float4 poolClip : register(c3); // left,top,right,bottom before translation
float4 poolLayer : register(c4); // layer,night,textureWidth,textureHeight
float4 poolFlags : register(c5); // packed scene flags
struct Input { float2 grid : POSITION0; float2 phase : TEXCOORD0; };
struct Output {
    float4 position : POSITION0;
    float2 uv : TEXCOORD0;
    float4 rect : TEXCOORD1;
    float flags : TEXCOORD2;
    float4 color : TEXCOORD3;
};
float poolSin(float angle)
{
    // SM3 sincos requires [-pi,pi]. Split 2*pi prevents cancellation of
    // large phase values; /Gis preserves the two subtractions.
    float turns=floor(angle*0.15915494309189535+0.5);
    float folded=(angle-turns*6.28125)-turns*0.0019353071795864769;
    if (folded>3.141592653589793) folded-=6.283185307179586;
    if (folded<-3.141592653589793) folded+=6.283185307179586;
    return sin(folded);
}
Output poolVS(Input input)
{
    float x=input.grid.x,y=input.grid.y;
    float xp=input.phase.x,yp=input.phase.y;
    float t1=waveTime.x,t2=waveTime.y,t3=waveTime.z,t5=waveTime.w;
    float2 base=float2(x/15.0,y/5.0),delta=0;
    if (x!=0 && x!=15 && y!=0 && y!=5) {
        if (poolLayer.x<0.5) {
            delta.x=poolSin(yp+t2)*0.002+poolSin(yp+t1)*0.005;
            delta.y=poolSin(xp+t5)*0.01+poolSin(xp+t3)*0.015+poolSin(xp+t1)*0.005;
        } else if (poolLayer.x<1.5) {
            delta.x=poolSin(yp*0.2+t2)*0.015+poolSin(yp*0.2+t1)*0.012;
            delta.y=poolSin(xp*0.2+t5)*0.005+poolSin(xp*0.2+t3)*0.015+poolSin(xp*0.2+t1)*0.02;
        } else {
            delta.x=poolSin(yp+t1*1.5)*0.004+poolSin(yp+t2*1.5)*0.005;
            delta.y=poolSin(xp*4+t5*2.5)*0.005+poolSin(xp*2+t3*2.5)*0.04+
                poolSin(xp*3+t1*2.5)*0.02;
        }
    }
    Output output;
    output.uv=poolLayer.x>1.5 ? (base+delta)+base : delta+base;
    float2 position=poolLayer.x>1.5 ? float2((704.0/15.0)*x+45,30*y+288) :
        input.grid*(poolGeometry.xy/float2(15,5))+float2(35,279);
    float alpha=1;
    if (poolLayer.x>1.5)
        alpha=(x==0 || x==15 || y==0) ? 32.0/255 :
            poolLayer.y!=0 ? 48.0/255 : x<=7 ? 192.0/255 : 128.0/255;
    int2 clippedPosition=(int2)position;
    if (clippedPosition.x<poolClip.x || clippedPosition.y<poolClip.y ||
        clippedPosition.x>=poolClip.z || clippedPosition.y>=poolClip.w) alpha=0;
    output.color=float4(1,1,1,alpha);
    output.rect=float4(0,0,poolLayer.zw);
    output.flags=poolFlags.x;
    output.position=float4((position+poolGeometry.zw)*projection.xy+projection.zw,0,1);
    return output;
}
