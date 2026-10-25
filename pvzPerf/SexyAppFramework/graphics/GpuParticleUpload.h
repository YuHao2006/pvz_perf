#pragma once
#include "GpuParticle.h"
#include "GpuReanim.h"
#include <algorithm>
#include <cstring>
#include <cmath>
#include <stdexcept>
#include <vector>

namespace Sexy {
inline void ValidateParticleResident(std::span<const float> words,uint32_t variants)
{
    const auto fail=[] {throw std::invalid_argument("Malformed GPU particle definition");};
    if(words.size()<4 || words.size()>=(1u<<24) || !variants)fail();
    for(float value:words)if(!std::isfinite(value))fail();
    const auto integer=[&](size_t at,size_t maximum) -> size_t {
        if(at>=words.size() || words[at]<0 || std::floor(words[at])!=words[at] ||
            double(words[at])>double(maximum))fail();
        return size_t(words[at]);
    };
    const auto emitters=integer(1,words.size()/32),first=integer(0,words.size());
    if(!emitters||first>words.size()-emitters*32)fail();
    const auto rectangles=integer(3,words.size()/8),geometry=integer(2,words.size());
    if(uint64_t(rectangles)*variants*8>words.size()-geometry)fail();
    for(size_t i=0;i<emitters;++i){
        const auto e=first+i*32;
        integer(e,(1u<<12)-1);integer(e+1,255);
        const auto offset=integer(e+2,rectangles),count=integer(e+3,rectangles);
        if(count>rectangles-offset)fail();
        if(!integer(e+4,1u<<20))fail();
        integer(e+5,1);integer(e+6,1);integer(e+7,(1u<<14)-1);
        for(size_t slot=0;slot<17;++slot){
            const auto at=integer(e+8+slot,words.size()-1),nodes=integer(at,words.size()/8);
            if(nodes>(words.size()-at-1)/8)fail();
            float last=-INFINITY;
            for(size_t n=0;n<nodes;++n){
                const auto node=at+1+n*8;
                if(words[node]<last)fail();last=words[node];
                integer(node+3,13);integer(node+4,13);
            }
        }
    }
    for(size_t i=0;i<rectangles*variants;++i){
        const auto at=geometry+i*8;
        if(words[at]<0||words[at+1]<0||words[at+2]<0||words[at+3]<0||
            words[at+4]>1||words[at+5]>1||words[at+2]>words[at+4]||
            words[at+3]>words[at+5])fail();
    }
}
template<class Renderer>
auto UploadParticleResident(Renderer& renderer, std::span<const float> words, uint32_t variants)
{
    ValidateParticleResident(words,variants);
    // The existing resident allocator already supplies upload synchronization,
    // lifetime retirement and painter-order marker batching on every backend.
    // Six useful geometry floats are portable across its native and GL layouts.
    std::vector<GpuReanimGeometry> storage((words.size()+5)/6);
    for(size_t i=0;i<words.size();++i)
        std::memcpy(reinterpret_cast<std::byte*>(&storage[i/6])+(i%6)*4,&words[i],4);
    const GpuReanimTrack track{0,1};
    const GpuReanimKey key{};
    auto* result=renderer.UploadReanimDefinition({{&track,1},{&key,1},storage,uint32_t(storage.size()),1});
    if(result){result->particleEmitterCount=uint32_t(words[1]);result->particleVariantCount=variants;}
    return result;
}
}
