#pragma once
#include "ParticleDrawReference.h"
#include "Sexy.TodLib/ParticleGpu.h"
#include <algorithm>
#include <array>
#include <iostream>
#include <stdexcept>
#include <string>
#include <vector>

// Compare actual authored resources and the production submission path against
// the frozen pre-migration CPU renderer. The game never links this evaluator.
inline void ParticleGpuRuntimeChecks(Sexy::RenderInterface& render)
{
    using namespace Sexy;
    TodParticleUploadGpuDefinitionData();
    TodParticleData data;
    data.Initialize();
    struct Dispose { TodParticleData& data; ~Dispose() { data.Dispose(); } } dispose{data};
    TodParticleHolder holder{&data};
    Image* target = render.CreateRenderImage(256, 256);
    struct Release { Image* image; ~Release() { delete image; } } release{target};
    unsigned cases = 0, visibleCases = 0;
    const auto compare = [&](TodParticle& particle, const std::string& name, bool cropped, bool transformed=false) {
        const auto draw = [&](bool reference) {
            {
                GpuImageDrawScope destination(render, target);
                Graphics graphics(target);
                graphics.mColor = Color::Black;
                graphics.FillRect(Rect(0,0,256,256));
                graphics.mLinearBlend = true;
                graphics.mTransX = .25f; graphics.mTransY = .375f;
                if (cropped) graphics.mClipRect = Rect(85,81,84,91);
                if (transformed)
                {
                    SexyMatrix3 overlay;
                    TodScaleTransformMatrix(overlay,11.25f,-7.5f,.8f,1.1f);
                    render.PushTransform(overlay,false);
                }
                if (reference)
                {
                    ParticleDrawReference::ParticleRenderParams params{};
                    ParticleDrawReference::GetRenderParams(&particle,&params);
                    const Color color(
                        ClampInt(FloatRoundToInt(params.mRed),0,255),
                        ClampInt(FloatRoundToInt(params.mGreen),0,255),
                        ClampInt(FloatRoundToInt(params.mBlue),0,255),
                        ClampInt(FloatRoundToInt(params.mAlpha),0,255));
                    params.mPosX += graphics.mTransX; params.mPosY += graphics.mTransY;
                    auto* source = &particle;
                    if (!source->mParticleEmitter->mEmitterDef->mImageRectCount)
                        source = holder.mParticles.DataArrayTryToGet(source->mCrossFadeParticleID);
                    TodTriangleGroup triangles;
                    if (source && color.mAlpha > 0)
                        ParticleDrawReference::RenderParticle(&graphics,source,color,&params,&triangles);
                    triangles.DrawGroup(&graphics);
                }
                else TodParticleDrawGpu(graphics,particle);
                if (transformed) render.PopTransform();
            }
            render.Flush();
            return render.ReadImagePixels(*target).pixels;
        };
        const auto expected = draw(true), actual = draw(false);
        unsigned severe = 0, visible = 0, maximum = 0;
        std::uint64_t error = 0;
        for (std::size_t i = 0; i < expected.size(); ++i)
        {
            unsigned pixelError = 0;
            visible += (expected[i] & 0xffffffu) != 0;
            for (unsigned shift : {0u,8u,16u})
            {
                const unsigned difference = unsigned(std::abs(
                    int((actual[i] >> shift) & 255) - int((expected[i] >> shift) & 255)));
                maximum = std::max(maximum,difference);
                pixelError = std::max(pixelError,difference);
                error += difference;
            }
            severe += pixelError > 3;
        }
        // GPU curve/trigonometry evaluation may differ by one output byte.
        // Large errors are restricted to a few rasterization boundary pixels.
        if (severe > std::max(4u,visible/200) || error > std::max<std::uint64_t>(32,visible*4))
            throw std::runtime_error("GPU particle pixel mismatch: "+name+
                " severe="+std::to_string(severe)+" max="+std::to_string(maximum)+
                " total="+std::to_string(error)+" visible="+std::to_string(visible));
        ++cases; visibleCases += visible != 0;
    };
    for (int d = 0; d < gParticleDefCount; ++d)
    {
        auto& definition = gParticleDefArray[d];
        TodParticleSystem system;
        struct Unbind { TodParticleSystem& system; ~Unbind() { system.mParticleHolder=nullptr; } } unbind{system};
        system.mParticleDef = &definition; system.mParticleHolder = &holder;
        for (int e = 0; e < definition.mEmitterDefCount; ++e)
        {
            auto& emitterDefinition = definition.mEmitterDefs[e];
            if (!emitterDefinition.mImageRectCount ||
                TestBit(emitterDefinition.mParticleFlags,PARTICLE_SOFTWARE_ONLY)) continue;
            TodParticleEmitter emitter{};
            emitter.mParticleSystem = &system; emitter.mEmitterDef = &emitterDefinition;
            emitter.mSystemDurationNs = 1'000'000'000;
            emitter.mSystemAgeNs = 370'000'003;
            emitter.mColorOverride = Color::White; emitter.mScaleOverride = 1;
            emitter.mFrameOverride = -1;
            for (std::size_t i = 0; i < std::size(emitter.mTrackInterp); ++i)
                emitter.mTrackInterp[i] = float((i*7+3)%31)/31;
            TodParticle particle{};
            particle.mParticleEmitter = &emitter;
            particle.mPosition = {128.25f,127.75f}; particle.mSpinPosition = .37f;
            particle.mParticleDurationNs = 1'000'000'000;
            particle.mParticleAgeNs = 370'000'003;
            particle.mAnimationElapsedNs = 1'234'567'891;
            particle.mImageFrame = std::max(0,emitterDefinition.mImageFrames-1);
            for (std::size_t i = 0; i < std::size(particle.mParticleInterp); ++i)
                particle.mParticleInterp[i] = float((i*11+5)%37)/37;
            for (unsigned variant = 0; variant < definition.mVariantCount; ++variant)
            {
                system.mVariant = variant;
                const auto name = std::to_string(d)+"/"+std::to_string(e)+"/"+std::to_string(variant);
                compare(particle,name,false);
                if (cases%13 == 0) compare(particle,name+" clipped",true);
                if (cases%47 == 0) compare(particle,name+" overlay",true,true);
            }
        }
    }
    bool testedChain=false, testedFallback=false;
    for (int d=0;d<gParticleDefCount && (!testedChain || !testedFallback);++d)
    {
        auto& definition=gParticleDefArray[d];
        for(int root=0;root<definition.mEmitterDefCount && (!testedChain || !testedFallback);++root)
            for(int source=0;source<definition.mEmitterDefCount && (!testedChain || !testedFallback);++source)
            {
                auto& to=definition.mEmitterDefs[root];
                auto& from=definition.mEmitterDefs[source];
                if(root==source || !from.mImageRectCount ||
                    !ParticleDrawReference::RenderData(to).mRenderTrackMask ||
                    TestBit(from.mParticleFlags,PARTICLE_FULLSCREEN) ||
                    TestBit(to.mParticleFlags,PARTICLE_SOFTWARE_ONLY) ||
                    TestBit(from.mParticleFlags,PARTICLE_SOFTWARE_ONLY)) continue;
                const bool fallback=to.mImageRectCount==0;
                if((fallback&&testedFallback)||(!fallback&&testedChain))continue;
                TodParticleSystem system;
                struct Unbind { TodParticleSystem& system; ~Unbind() { system.mParticleHolder=nullptr; } } unbind{system};
                system.mParticleDef=&definition;system.mParticleHolder=&holder;
                TodParticleEmitter emitters[3]{};
                for(int i=0;i<3;++i)
                {
                    auto& emitter=emitters[i];
                    emitter.mEmitterDef=i==0?&to:&from;emitter.mParticleSystem=&system;
                    emitter.mSystemDurationNs=1'000'000'000;emitter.mSystemAgeNs=370'000'003;
                    emitter.mColorOverride=Color::White;emitter.mScaleOverride=1;emitter.mFrameOverride=-1;
                    std::fill_n(emitter.mTrackInterp,ParticleSystemTracks::NUM_SYSTEM_TRACKS,.37f);
                }
                TodParticle rootParticle{};
                auto* middle=holder.mParticles.DataArrayAlloc();
                auto* older=holder.mParticles.DataArrayAlloc();
                TodParticle* particles[]{&rootParticle,middle,older};
                for(int i=0;i<3;++i)
                {
                    auto& p=*particles[i];p.mParticleEmitter=&emitters[i];
                    p.mPosition={float(120+i*9),float(134-i*8)};
                    p.mSpinPosition=.17f+i*.11f;
                    p.mParticleDurationNs=1'000'000'000;p.mParticleAgeNs=250'000'003;
                    p.mAnimationElapsedNs=1'234'567'891;
                    p.mCrossFadeParticleID=ParticleID::PARTICLEID_NULL;
                    p.mCrossFadeDurationNs=i?1'000'000'000:0;
                    std::fill_n(p.mParticleInterp,ParticleTracks::NUM_PARTICLE_TRACKS,.41f);
                }
                rootParticle.mCrossFadeParticleID=static_cast<ParticleID>(holder.mParticles.DataArrayGetID(middle));
                middle->mCrossFadeParticleID=static_cast<ParticleID>(holder.mParticles.DataArrayGetID(older));
                compare(rootParticle,"chain "+std::to_string(d)+(fallback?" source-frame fallback":""),true);
                holder.mParticles.DataArrayFree(middle);holder.mParticles.DataArrayFree(older);
                if(fallback)testedFallback=true;else testedChain=true;
            }
    }
    if(!testedChain || !testedFallback)
        throw std::runtime_error("GPU particle crossfade/source fallback coverage was empty");
    if (!cases || !visibleCases) throw std::runtime_error("GPU particle pixel coverage was empty");
    std::cout << "PASS production GPU particle drawing: " << cases << " authored emitter/variant/clip cases, "
        << visibleCases << " visible, CPU oracle only in test code\n";
}
