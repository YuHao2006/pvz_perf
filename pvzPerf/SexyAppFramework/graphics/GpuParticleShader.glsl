// Shared GLSL/HLSL source. The embedding stage supplies pStatic(logicalWord)
// and pDynamic(absoluteWord). Both return the original stored float bits.
float pRound(float x) { return trunc(x>=0.0?x+0.5:x-0.5); }
float pS(float x) { return 3.0*x*x-2.0*x*x*x; }
float pIQS(float x) {
    float y=x<=0.5?x*2.0:(x-0.5)*2.0;
    return x<=0.5?(2.0*y-y*y)*0.5:y*y*0.5+0.5;
}
float pSin(float a) {
    float t=a*0.15915494+0.5;t-=floor(t);
    float x=(t-0.5)*6.2831853,x2=x*x;
    return x*(0.999999707+x2*(-0.166665772+x2*(0.008332558+
        x2*(-0.000198125755+x2*(2.70405121e-06+x2*-2.05342445e-08)))));
}
float pCurve(uint curve,float t,float a,float b) {
    if(curve==0u||curve==8u||t<=0.0)return a;
    if(t>=1.0)return curve>=9u?a:b;
    float x=t;
    if(curve==2u)x=t*t;
    if(curve==3u)x=2.0*t-t*t;
    if(curve==4u)x=pS(pS(t));
    if(curve==5u)x=pS(t);
    if(curve==6u)x=pIQS(pIQS(t));
    if(curve==7u)x=pIQS(t);
    if(curve>=9u&&curve<=11u) {
        x=1.0-abs(2.0*t-1.0);
        if(curve==10u)x=x*x;
        if(curve==11u)x=2.0*x-x*x;
    }
    if(curve==12u)x=pSin(6.283185307179586*t);
    if(curve==13u)x=pSin(6.283185307179586*pS(t));
    return a+(b-a)*x;
}
float pNode(uint at,float randomValue) {
    return pCurve(uint(pStatic(at+4u)),randomValue,pStatic(at+1u),pStatic(at+2u));
}
float pTrack(uint track,float time,float randomValue) {
    uint count=uint(pStatic(track));if(count==0u)return 0.0;
    uint a=track+1u;
    if(count==1u&&pStatic(a+1u)==pStatic(a+2u))return pStatic(a+1u);
    if(time<pStatic(a))return pNode(a,randomValue);
    for(uint i=1u;i<count;++i) {
        uint b=a+8u;
        if(time<=pStatic(b)) {
            float span=pStatic(b)-pStatic(a);
            return pCurve(uint(pStatic(a+3u)),span>0.0?(time-pStatic(a))/span:1.0,
                pNode(a,randomValue),pNode(b,randomValue));
        }
        a=b;
    }
    return pNode(a,randomValue);
}
uint pBits(uint at) { return floatBitsToUint(pDynamic(at)); }
uvec2 pInteger(uint at) { return uvec2(pBits(at),pBits(at+1u)); }
float pIntegerFloat(uint at) {
    uvec2 v=pInteger(at);
    return float(int(v.y))*4294967296.0+float(v.x);
}
float pLife(uint age,uint duration) {
    if(int(pBits(age+1u))<0)return -1.0;
    return pIntegerFloat(age)/max(1.0,pIntegerFloat(duration));
}
bool pGreaterEqual(uvec2 a,uvec2 b) { return a.y>b.y||(a.y==b.y&&a.x>=b.x); }
uvec2 pSubtract(uvec2 a,uvec2 b) { return uvec2(a.x-b.x,a.y-b.y-uint(a.x<b.x)); }
uvec2 pCycle() { return uvec2(3567587328u,232u); }
uvec2 pAppendBit(uvec2 a,uint bit) {
    a=uvec2((a.x<<1u)|bit,(a.y<<1u)|(a.x>>31u));
    return pGreaterEqual(a,pCycle())?pSubtract(a,pCycle()):a;
}
// Full IEEE single rate * int64 nanoseconds, without first rounding either
// operand to float. 16-bit limbs keep every intermediate inside uint32.
uvec2 pConstantPhase(uint elapsed,float rate) {
    uvec2 ns=pInteger(elapsed);
    uint bits=floatBitsToUint(rate),encoded=(bits>>23u)&255u;
    uint sig=(bits&0x7fffffu)|(encoded!=0u?0x800000u:0u);
    int exponent=encoded!=0u?int(encoded)-150:-149;
    uint a[4];a[0]=ns.x&65535u;a[1]=ns.x>>16u;a[2]=ns.y&65535u;a[3]=ns.y>>16u;
    uint b[3];uint first=(sig&65535u)*1000u;
    b[0]=first&65535u;uint second=(sig>>16u)*1000u+(first>>16u);
    b[1]=second&65535u;b[2]=second>>16u;
    uint product[8];for(int i=0;i<8;++i)product[i]=0u;
    for(int i=0;i<4;++i) {
        uint carry=0u;
        for(int j=0;j<3;++j) {
            uint term=a[i]*b[j]+product[i+j]+carry;
            product[i+j]=term&65535u;carry=term>>16u;
        }
        int k=i+3;
        while(carry!=0u&&k<8) {
            uint term=product[k]+carry;product[k]=term&65535u;carry=term>>16u;++k;
        }
    }
    uvec2 result=uvec2(0u,0u);
    for(int bit=255;bit>=0;--bit) {
        int source=bit-exponent;uint digit=0u;
        if(source>=0&&source<128)digit=(product[source/16]>>uint(source%16))&1u;
        result=pAppendBit(result,digit);
    }
    if((bits&0x80000000u)!=0u&&(result.x!=0u||result.y!=0u))
        result=pSubtract(pCycle(),result);
    return result;
}
uvec2 pModuloSigned(uint at) {
    uvec2 value=pInteger(at);bool negative=int(value.y)<0;
    if(negative) { value=~value;value.x+=1u;if(value.x==0u)value.y+=1u; }
    uvec2 result=uvec2(0u,0u);
    for(int bit=63;bit>=0;--bit)
        result=pAppendBit(result,bit>=32?(value.y>>uint(bit-32))&1u:(value.x>>uint(bit))&1u);
    if(negative&&(result.x!=0u||result.y!=0u))result=pSubtract(pCycle(),result);
    return result;
}
uint pPhaseFrame(uvec2 phase,uint frames) {
    // The quotient is at most frames-1. Long division of the 80-bit product
    // retains exact frame boundaries even at very large elapsed clocks.
    uint a[4];a[0]=phase.x&65535u;a[1]=phase.x>>16u;a[2]=phase.y&65535u;a[3]=phase.y>>16u;
    uint b[2];b[0]=frames&65535u;b[1]=frames>>16u;
    uint product[6];for(int i=0;i<6;++i)product[i]=0u;
    for(int i=0;i<4;++i) {
        uint carry=0u;
        for(int j=0;j<2;++j) {
            uint term=a[i]*b[j]+product[i+j]+carry;
            product[i+j]=term&65535u;carry=term>>16u;
        }
        product[i+2]=carry;
    }
    uvec2 remainder=uvec2(0u,0u);uint quotient=0u;
    for(int bit=95;bit>=0;--bit) {
        uint digit=(product[bit/16]>>uint(bit%16))&1u;
        remainder=uvec2((remainder.x<<1u)|digit,(remainder.y<<1u)|(remainder.x>>31u));
        bool take=pGreaterEqual(remainder,pCycle());
        if(take)remainder=pSubtract(remainder,pCycle());
        quotient=(quotient<<1u)|uint(take);
    }
    return quotient;
}
uint pEmitter(uint state) { return uint(pStatic(0u))+pBits(state)*32u; }
float pEvaluate(uint emitter,uint slot,float time,float weight) {
    return pTrack(uint(pStatic(emitter+8u+slot)),time,weight);
}
struct ParticleResult {
    vec4 point0,point1,point2,point3,color;
    bool visible,fullscreen;
};
float pBlend(float previous,float current,uint previousMask,uint currentMask,uint bit,float fraction) {
    if((previousMask&bit)==0u)return current;
    if((currentMask&bit)==0u)return previous;
    return previous+(current-previous)*fraction;
}
vec4 pCorner(vec2 p,vec2 uv,vec4 matrix,vec2 pos,uint draw) {
    vec2 v=vec2(matrix.x*p.x+matrix.y*p.y+pos.x,matrix.z*p.x+matrix.w*p.y+pos.y);
    return vec4(v,uv);
}
vec4 pOverlay(vec4 vertex,uint draw) {
    vec2 v=vertex.xy;
    return vec4(pDynamic(draw+7u)*v.x+pDynamic(draw+8u)*v.y+pDynamic(draw+9u),
        pDynamic(draw+10u)*v.x+pDynamic(draw+11u)*v.y+pDynamic(draw+12u),vertex.zw);
}
ParticleResult pParticle(uint draw,uint count) {
    ParticleResult result;result.visible=false;result.fullscreen=false;
    float red=255.0,green=255.0,blue=255.0,alpha=255.0,scale=1.0,stretch=1.0,spin=0.0,px=0.0,py=0.0;
    uint mask=0u;
    for(int index=int(count)-1;index>=0;--index) {
        uint state=draw+24u+uint(index)*uint(max(48.0,pDynamic(draw+13u))),emitter=pEmitter(state);
        float time=pLife(state+12u,state+14u),systemTime=pLife(state+16u,state+18u);
        vec4 overrideColor=vec4(pDynamic(state+8u),pDynamic(state+9u),pDynamic(state+10u),pDynamic(state+11u));
        float overrideScale=pDynamic(state+7u);
        bool defaults=pStatic(emitter+7u)==0.0&&all(equal(overrideColor,vec4(255.0,255.0,255.0,255.0)))&&overrideScale==1.0;
        uint currentMask=uint(pStatic(emitter+1u));
        if(!defaults) {
            if(overrideColor.x!=1.0)currentMask|=1u;if(overrideColor.y!=1.0)currentMask|=2u;
            if(overrideColor.z!=1.0)currentMask|=4u;if(overrideColor.w!=1.0)currentMask|=8u;
            if(overrideScale!=1.0)currentMask|=16u;
        } else currentMask&=128u;
        float cr=255.0,cg=255.0,cb=255.0,ca=255.0,cs=1.0,ct=1.0;
        if(!defaults) {
            float brightness=pEvaluate(emitter,4u,systemTime,pDynamic(state+46u))*
                pEvaluate(emitter,9u,time,pDynamic(state+30u));
            cr=pEvaluate(emitter,0u,systemTime,pDynamic(state+42u))*pEvaluate(emitter,5u,time,pDynamic(state+26u))*overrideColor.x*brightness;
            cg=pEvaluate(emitter,1u,systemTime,pDynamic(state+43u))*pEvaluate(emitter,6u,time,pDynamic(state+27u))*overrideColor.y*brightness;
            cb=pEvaluate(emitter,2u,systemTime,pDynamic(state+44u))*pEvaluate(emitter,7u,time,pDynamic(state+28u))*overrideColor.z*brightness;
            ca=pEvaluate(emitter,3u,systemTime,pDynamic(state+45u))*pEvaluate(emitter,8u,time,pDynamic(state+29u))*overrideColor.w*brightness;
            cs=pEvaluate(emitter,10u,time,pDynamic(state+33u))*overrideScale;
            ct=pEvaluate(emitter,11u,time,pDynamic(state+34u));
        }
        float cp=pDynamic(state+6u),cx=pDynamic(state+4u),cy=pDynamic(state+5u);
        if(index<int(count)-1&&!defaults) {
            float fraction=pLife(state+12u,state+48u+20u);
            cr=pBlend(red,cr,mask,currentMask,1u,fraction);cg=pBlend(green,cg,mask,currentMask,2u,fraction);
            cb=pBlend(blue,cb,mask,currentMask,4u,fraction);ca=pBlend(alpha,ca,mask,currentMask,8u,fraction);
            cs=pBlend(scale,cs,mask,currentMask,16u,fraction);ct=pBlend(stretch,ct,mask,currentMask,32u,fraction);
            cp=pBlend(spin,cp,mask,currentMask,64u,fraction);
            cx=pBlend(px,cx,mask,currentMask,128u,fraction);cy=pBlend(py,cy,mask,currentMask,128u,fraction);
            currentMask|=mask;
        }
        red=cr;green=cg;blue=cb;alpha=ca;scale=cs;stretch=ct;spin=cp;px=cx;py=cy;mask=currentMask;
    }
    result.color=clamp(vec4(pRound(red),pRound(green),pRound(blue),pRound(alpha)),0.0,255.0)/255.0;
    if(result.color.w<=0.0)return result;
    uint stateWords=uint(max(48.0,pDynamic(draw+13u)));
    uint source=draw+24u+pBits(draw+1u)*stateWords,emitter=pEmitter(source);
    uint rectCount=uint(pStatic(emitter+3u));if(rectCount==0u)return result;
    float time=pLife(source+12u,source+14u);
    int frame=int(pBits(source+2u));uint frames=uint(pStatic(emitter+4u));
    if(frame==-1) {
        if(pStatic(emitter+6u)!=0.0) {
            uint track=uint(pStatic(emitter+24u)),node=track+1u;
            uvec2 phase=pModuloSigned(source+24u);
            if(pStatic(track)==1.0&&pStatic(node+1u)==pStatic(node+2u)) {
                uvec2 increment=pConstantPhase(source+22u,pStatic(node+1u));
                uint low=phase.x+increment.x;phase=uvec2(low,phase.y+increment.y+uint(low<phase.x));
                if(pGreaterEqual(phase,pCycle()))phase=pSubtract(phase,pCycle());
            }
            frame=int(pPhaseFrame(phase,frames));
        } else if(pStatic(emitter+5u)!=0.0)frame=int(time*float(frames));
        else frame=int(pBits(source+1u));
        frame=clamp(frame,0,int(frames)-1);
    }
    uint geometry=uint(pStatic(2u))+(pBits(draw)*uint(pStatic(3u))+
        uint(pStatic(emitter+2u))+uint(clamp(frame,0,int(rectCount)-1)))*8u;
    float width=pStatic(geometry),height=pStatic(geometry+1u);
    if(width<=0.0||height<=0.0)return result;
    float top=pEvaluate(emitter,12u,time,pDynamic(source+37u));
    float bottom=pEvaluate(emitter,13u,time,pDynamic(source+38u));
    float left=pEvaluate(emitter,14u,time,pDynamic(source+39u));
    float right=pEvaluate(emitter,15u,time,pDynamic(source+40u));
    if (pDynamic(draw+14u)>0.5) {
        // Formula packets carry an immutable segment after the common visual
        // state. The GPU evaluates position from elapsed nanoseconds; no
        // per-tick position is uploaded and no GPU result is read back.
        float ticks=max(0.0,pIntegerFloat(source+12u)-pIntegerFloat(source+48u))/10000000.0;
        uint extra=source+50u;
        px=pDynamic(extra+0u)+pDynamic(extra+2u)*ticks+
            pDynamic(extra+4u)*ticks*(ticks+1.0)*0.5;
        py=pDynamic(extra+1u)+pDynamic(extra+3u)*ticks+
            pDynamic(extra+5u)*ticks*(ticks+1.0)*0.5;
        spin=pDynamic(extra+6u)+pDynamic(extra+7u)*ticks;
    }
    px+=pDynamic(draw+2u);py+=pDynamic(draw+3u);
    px+=left*width;py+=top*height;
    uint flags=uint(pStatic(emitter));
    if((flags&4u)!=0u) { px=pRound(px);py=pRound(py); }
    float x=pRound(left*width),y=pRound(top*height);
    float w=width-pRound(width*(left+right)),h=height-pRound(height*(bottom+top));
    float u0=pStatic(geometry+2u),v0=pStatic(geometry+3u),us=pStatic(geometry+4u)-u0,vs=pStatic(geometry+5u)-v0;
    vec4 uv=vec4(u0+us*(x/width),v0+vs*(y/height),u0+us*((x+w)/width),v0+vs*((y+h)/height));
    result.visible=true;result.fullscreen=(flags&512u)!=0u;
    if(result.fullscreen) {
        float fw=pDynamic(draw+5u),fh=pDynamic(draw+6u);
        result.point0=vec4(0,0,0,0);result.point1=vec4(0,fh,0,0);
        result.point2=vec4(fw,fh,0,0);result.point3=vec4(fw,0,0,0);return result;
    }
    vec4 matrix=vec4(cos(spin)*scale,sin(spin)*(stretch*scale),-sin(spin)*scale,cos(spin)*(stretch*scale));
    result.point0=pCorner(vec2(-w*0.5,-h*0.5),uv.xy,matrix,vec2(px,py),draw);
    result.point1=pCorner(vec2(-w*0.5,h*0.5),vec2(uv.x,uv.w),matrix,vec2(px,py),draw);
    result.point2=pCorner(vec2(w*0.5,h*0.5),uv.zw,matrix,vec2(px,py),draw);
    result.point3=pCorner(vec2(w*0.5,-h*0.5),vec2(uv.z,uv.y),matrix,vec2(px,py),draw);
    return result;
}
