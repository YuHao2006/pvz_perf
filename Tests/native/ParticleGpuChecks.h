#pragma once
#include "SexyAppFramework/graphics/GpuParticle.h"
#include "Sexy.TodLib/ParticleClock.h"
#include "SexyAppFramework/misc/FastMath.h"
#include <algorithm>
#include <array>
#include <cmath>
#include <iostream>
#include <limits>
#include <stdexcept>
#include <vector>

namespace ParticleGpuTest {
inline float Curve(unsigned kind,double t,float a,float b) {
    if(kind==0||kind==8||t<=0)return a;
    if(t>=1)return kind>=9?a:b;
    const auto s=[](double x){return 3*x*x-2*x*x*x;};
    const auto iq=[](double x){return x<=.5?(2*(x*2)-(x*2)*(x*2))*.5:
        ((x-.5)*2)*((x-.5)*2)*.5+.5;};
    double x=t;
    if(kind==2)x=t*t;if(kind==3)x=2*t-t*t;if(kind==4)x=s(s(t));
    if(kind==5)x=s(t);if(kind==6)x=iq(iq(t));if(kind==7)x=iq(t);
    if(kind>=9&&kind<=11){x=1-std::abs(2*t-1);if(kind==10)x=x*x;if(kind==11)x=2*x-x*x;}
    if(kind==12)x=FastSin(float(6.283185307179586*t));
    if(kind==13)x=FastSin(float(6.283185307179586*s(t)));
    return float((double(b)-a)*x+a);
}
struct Definition {
    std::vector<float> words=std::vector<float>(36,0);
    Definition() {
        words[0]=4;words[1]=1;words[3]=8;
        words[4+3]=8;words[4+4]=8;
        for(unsigned slot=0;slot<17;++slot) {
            words[4+8+slot]=float(words.size());
            const float value=slot<12?1.f:0.f;
            words.insert(words.end(),{1,0,value,value,0,1,0,0,0});
        }
    }
    void track(unsigned slot,std::initializer_list<float> nodes) {
        words[4+8+slot]=float(words.size());words.insert(words.end(),nodes);
    }
    void finish() {
        words[2]=float(words.size());
        for(unsigned i=0;i<8;++i)
            words.insert(words.end(),{16,12,float(i)/8,0,float(i+1)/8,1,0,0});
    }
};
template<class Renderer>
void Run(Renderer& renderer) {
    using namespace Sexy;
    const uint32_t texels[]{0xffff2020,0xff20ff20,0xff2020ff,0xffffff20,
        0xffff20ff,0xff20ffff,0xffc08040,0xff80c040};
    auto* texture=renderer.CreateTexture(8,1,texels,32);
    unsigned cases=0;
    {
        Definition valid;valid.finish();
        for(unsigned fault=0;fault<6;++fault) {
            auto invalid=valid.words;
            if(fault==0)invalid[0]=std::numeric_limits<float>::quiet_NaN();
            if(fault==1)invalid[1]=.5f;
            if(fault==2)invalid[2]=float(invalid.size()+1);
            if(fault==3)invalid[4+8]=float(invalid.size());
            if(fault==4)invalid[size_t(invalid[4+8])+4]=14;
            if(fault==5)invalid[size_t(invalid[4+8])]=float(invalid.size());
            bool rejected=false;
            try {
                auto* unexpected=renderer.UploadParticleDefinition(invalid,1);
                if(unexpected)renderer.DestroyReanimDefinition(unexpected);
            } catch(const std::invalid_argument&) { rejected=true; }
            if(!rejected)throw std::runtime_error("Malformed particle blob escaped upload validation");
        }
    }
    const auto quad=[&](float x0,float y0,float x1,float y1,float u0,float u1,float red,float alpha,
        auto* source) {
        const auto slot=Renderer::SlotOf(source);
        const GpuVertex points[]{
            {x0,y0,red,1,1,alpha,u0,0,slot,0},{x0,y1,red,1,1,alpha,u0,1,slot,0},
            {x1,y0,red,1,1,alpha,u1,0,slot,0},{x1,y0,red,1,1,alpha,u1,0,slot,0},
            {x0,y1,red,1,1,alpha,u0,1,slot,0},{x1,y1,red,1,1,alpha,u1,1,slot,0}};
        renderer.SubmitTriangles(points,source,false,false,GpuBlend::Normal);
    };
    const auto clear=[&] {
        quad(0,0,float(renderer.sceneWidth),float(renderer.sceneHeight),0,1,0,1,renderer.whiteTexture);
    };
    const auto check=[&](auto* definition,const GpuParticleState& state,unsigned frame,float red,auto* source) {
        if(!renderer.BeginScene())throw std::runtime_error("Particle oracle reference scene rejected");
        clear();quad(24,26,40,38,float(frame)/8,float(frame+1)/8,red,1,source);
        renderer.EndSceneAndPresent();const auto expected=renderer.ReadScenePixels();
        if(!renderer.BeginScene())throw std::runtime_error("Particle oracle GPU scene rejected");
        clear();GpuParticleDraw draw{};
        if(!renderer.SubmitParticle(definition,source,draw,{&state,1},false,false,GpuBlend::Normal))
            throw std::runtime_error("Particle raw GPU packet rejected");
        renderer.EndSceneAndPresent();const auto actual=renderer.ReadScenePixels();
        for(size_t i=0;i<actual.size();++i)for(unsigned shift:{0u,8u,16u,24u})
            if(std::abs(int((actual[i]>>shift)&255)-int((expected[i]>>shift)&255))>1)
                throw std::runtime_error("Particle synthetic pixel oracle mismatch case="+std::to_string(cases)+
                    " expected-frame="+std::to_string(frame)+" pixel="+std::to_string(i));
        ++cases;
    };
    for(unsigned kind=0;kind<14;++kind) {
        Definition source;source.words[4+7]=1;source.words[4+1]=1;
        source.track(5,{2,0,.15f,.45f,float(kind),float((kind+3)%14),0,0,0,
            1,.65f,.95f,1,float((kind+5)%14),0,0,0});
        source.finish();auto* definition=renderer.UploadParticleDefinition(source.words,1);
        if(!definition)throw std::runtime_error("Particle synthetic upload rejected");
        for(auto age:{0LL,370'000'003LL,1'000'000'000LL}) {
            GpuParticleState state;state.positionX=32;state.positionY=32;
            state.ageNs=age;state.durationNs=1'000'000'000;state.systemDurationNs=1;
            state.particleWeights[0]=.37f;
            const float value=Curve(kind,double(age)/1e9,
                Curve((kind+3)%14,.37f,.15f,.45f),Curve((kind+5)%14,.37f,.65f,.95f));
            const float byte=float(std::clamp(int(std::round(value*255)),0,255))/255;
            check(definition,state,0,byte,renderer.whiteTexture);
        }
        renderer.DestroyReanimDefinition(definition);
    }
    for(float rate:{0.f,.25f,-.25f,.123456789f,12345.625f,
        std::numeric_limits<float>::denorm_min(),std::numeric_limits<float>::max()}) {
        Definition source;source.words[4+6]=1;
        source.track(16,{1,0,rate,rate,1,1,0,0,0});source.finish();
        auto* definition=renderer.UploadParticleDefinition(source.words,1);
        for(auto elapsed:{0LL,1LL,9'007'199'254'740'993LL,INT64_MAX-12345LL})
            for(auto anchor:{0LL,123'456'789'012LL,-234'567'890'123LL}) {
                GpuParticleState state;state.positionX=32;state.positionY=32;
                state.durationNs=state.systemDurationNs=1;
                state.animationElapsedNs=elapsed;state.animationIntegral=anchor;
                auto phase=(ParticleClock::ConstantRatePhase(elapsed,rate)+anchor%ParticleClock::Cycle)%ParticleClock::Cycle;
                if(phase<0)phase+=ParticleClock::Cycle;
                const unsigned frame=unsigned(ReanimClock::MulDiv(phase,8,ParticleClock::Cycle));
                check(definition,state,frame,1,texture);
            }
        renderer.DestroyReanimDefinition(definition);
    }
    renderer.DestroyTexture(texture);
    std::cout<<"PASS GPU particle synthetic pixels: "<<cases
        <<" all14curves/distributions huge-int64-clock negative/subnormal/maxfloat-rate signed-phase-anchor\n";
}
}
