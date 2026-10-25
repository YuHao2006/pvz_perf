#include "ParticleGpu.h"
#include "TodParticle.h"
#include "EffectSystem.h"
#include "TodCommon.h"
#include "generated/GeneratedDefinitions.h"
#include "graphics/DDInterface.h"
#include "graphics/Graphics.h"
#include "graphics/GpuParticle.h"
#include "graphics/RenderInterface.h"
#include "paklib/PakInterface.h"
#include <algorithm>
#include <cstdio>
#include <stdexcept>
#include <string>
#include <vector>

namespace
{
Sexy::RenderInterface* PrimaryRender()
{
    return Sexy::gSexyAppBase && Sexy::gSexyAppBase->mDDInterface
        ? Sexy::gSexyAppBase->mDDInterface->mRenderInterface : nullptr;
}
}

void TodParticleFreeGpuDefinition(TodParticleDefinition& definition)
{
#if defined(PVZ_GPU_REANIM_RESIDENT)
    if (definition.mGpuDefinition)
    {
        auto* render = PrimaryRender();
        if (render && render->mRenderer)
            render->mRenderer->DestroyReanimDefinition(definition.mGpuDefinition);
        definition.mGpuDefinition = nullptr;
    }
#else
    definition.mGpuDefinition = nullptr;
#endif
}

void TodParticleUploadGpuDefinitionData()
{
    auto* render = PrimaryRender();
    if (!render || !render->mRenderer ||
        Sexy::CurrentNativeThreadIdentity() != Sexy::gSexyAppBase->mPrimaryThreadId)
        throw std::logic_error("Particle GPU upload requires the primary renderer thread");
#if defined(PVZ_GPU_REANIM_RESIDENT)
    bool flushed = false;
    std::vector<TodParticleDefinition*> uploaded;
    try
    {
        for (int type = 0; type < gParticleDefCount; ++type)
        {
            auto& definition = gParticleDefArray[type];
            if (definition.mGpuDefinition) continue;
            const auto* path = GeneratedDefinitions::ParticleGpuPaths[type];
            PFILE* file = p_fopen(path, "rb");
            if (!file) throw std::runtime_error(std::string("Missing GPU particle definition: ") + path);
            try
            {
                std::uint32_t header[4]{};
                if (p_fread(header, sizeof(header), 1, file) != 1 ||
                    header[0] != 0x31504750 || header[1] < 4 || header[1] >= (1u << 24) ||
                    header[2] != unsigned(definition.mEmitterDefCount) ||
                    header[3] != definition.mVariantCount)
                    throw std::runtime_error(std::string("Invalid GPU particle definition: ") + path);
                std::vector<float> words(header[1]);
                if (p_fread(words.data(), sizeof(float), int(words.size()), file) != words.size() ||
                    p_fgetc(file) != EOF)
                    throw std::runtime_error(std::string("Truncated GPU particle definition: ") + path);
                if (!flushed) { render->Flush(); flushed = true; }
                uploaded.push_back(&definition);
                definition.mGpuDefinition = render->mRenderer->UploadParticleDefinition(words, header[3]);
                if (!definition.mGpuDefinition)
                    throw std::runtime_error("The renderer cannot draw resident GPU particles");
            }
            catch (...) { p_fclose(file); throw; }
            p_fclose(file);
        }
    }
    catch (...)
    {
        for (auto* definition : uploaded) TodParticleFreeGpuDefinition(*definition);
        throw;
    }
#else
    throw std::runtime_error("This renderer does not implement GPU particle drawing");
#endif
}

namespace
{
bool FormulaMotion(const TodParticle& particle)
{
    const auto& fields = particle.mParticleEmitter->mEmitterDef->mParticleFields;
    if (fields.count == 0) return true;
    for (int i = 0; i < fields.count; ++i)
    {
        const auto& field = fields.Fields[i];
        if (field.mFieldType != ParticleFieldType::FIELD_ACCELERATION ||
            field.mX.mCountNodes > 1 || field.mY.mCountNodes > 1)
            return false;
    }
    return true;
}

bool FormulaChain(const TodParticle& particle)
{
    auto* current = &particle;
    auto& system = *particle.mParticleEmitter->mParticleSystem;
    while (current)
    {
        if (!FormulaMotion(*current))
            return false;
        current = system.mParticleHolder->mParticles.DataArrayTryToGet(current->mCrossFadeParticleID);
    }
    return true;
}
}

// The public dispatcher selects the CPU-side submission entry point. The
// selected GPU pipeline carries no per-particle motion-kind field.
void TodParticleDrawGpu(Sexy::Graphics& graphics, TodParticle& particle)
{
    if (FormulaChain(particle))
        TodParticleDrawFormulaGpu(graphics, particle);
    else
        TodParticleDrawDiscreteGpu(graphics, particle);
}

static void SubmitParticleStateGpu(Sexy::Graphics& graphics, TodParticle& particle, bool formula)
{
    if (particle.mCrossFadeDurationNs > 0) return;
    auto& system = *particle.mParticleEmitter->mParticleSystem;
    auto& definition = *system.mParticleDef;
    auto* imageParticle = &particle;
    unsigned frameSource = 0;
    if (!imageParticle->mParticleEmitter->mEmitterDef->mImageRectCount)
    {
        imageParticle = system.mParticleHolder->mParticles.DataArrayTryToGet(particle.mCrossFadeParticleID);
        frameSource = 1;
    }
    if (!imageParticle || !imageParticle->mParticleEmitter->mEmitterDef->mImageRectCount) return;
    if (!graphics.mDestImage || !graphics.mDestImage->IsGpuDrawTarget())
        throw std::logic_error("Particle drawing requires a GPU render target");
    auto& render = *graphics.mDestImage->mRenderOwner;
    render.SelectDrawSurface(graphics.mDestImage);
    if (!render.PreDraw()) return;
#if defined(PVZ_GPU_REANIM_RESIDENT)
    if (!definition.mGpuDefinition)
        throw std::logic_error("Particle drawing definition was not uploaded");
    auto* texture = definition.mTextures[system.mVariant];
    if (!texture) throw std::logic_error("Particle atlas was not uploaded");
    // Reused staging holds only raw state, never evaluated colors/transforms.
    static thread_local std::vector<Sexy::GpuParticleState> discreteChain;
    static thread_local std::vector<Sexy::GpuParticleFormulaState> formulaChain;
    formulaChain.clear();
    discreteChain.clear();
    auto* current = &particle;
    while (current)
    {
        if ((formula ? formulaChain.size() : discreteChain.size()) >=
            unsigned(system.mParticleHolder->mParticles.mMaxSize))
            throw std::logic_error("Particle crossfade chain contains a cycle");
        const auto& emitter = *current->mParticleEmitter;
        if (emitter.mParticleSystem != &system)
            throw std::logic_error("Particle crossfade crosses system ownership");
        if (formula)
        {
            auto& state = formulaChain.emplace_back();
            state.emitter = unsigned(emitter.mEmitterDef - definition.mEmitterDefs);
            state.flags = unsigned(emitter.mEmitterDef->mParticleFlags);
            state.imageFrame = current->mImageFrame;
            state.frameOverride = emitter.mFrameOverride;
            state.positionX = current->mPosition.x; state.positionY = current->mPosition.y;
            state.spin = current->mSpinPosition; state.scaleOverride = emitter.mScaleOverride;
            state.colorOverride[0] = float(emitter.mColorOverride.mRed);
            state.colorOverride[1] = float(emitter.mColorOverride.mGreen);
            state.colorOverride[2] = float(emitter.mColorOverride.mBlue);
            state.colorOverride[3] = float(emitter.mColorOverride.mAlpha);
            state.ageNs = current->mParticleAgeNs; state.durationNs = current->mParticleDurationNs;
            state.systemAgeNs = emitter.mSystemAgeNs; state.systemDurationNs = emitter.mSystemDurationNs;
            state.crossFadeDurationNs = current->mCrossFadeDurationNs;
            state.animationElapsedNs = current->mAnimationElapsedNs;
            state.animationIntegral = current->mAnimationSampleIntegral;
            state.segmentElapsedNs = current->mLinearElapsedNs < 0 ? 0 : current->mLinearElapsedNs;
            state.originX = float(current->mLinearOriginX);
            state.originY = float(current->mLinearOriginY);
            state.velocityX = current->mLinearVelocity.x;
            state.velocityY = current->mLinearVelocity.y;
            state.accelerationX = current->mLinearAcceleration.x;
            state.accelerationY = current->mLinearAcceleration.y;
            state.spinOrigin = float(current->mLinearSpinOrigin);
            state.spinRate = float(current->mLinearSpinRate);
            static_assert(ParticleTracks::NUM_PARTICLE_TRACKS == 16);
            std::copy_n(current->mParticleInterp, 16, state.particleWeights);
            std::copy_n(emitter.mTrackInterp + ParticleSystemTracks::TRACK_SYSTEM_RED, 5, state.systemWeights);
        }
        else
        {
            auto& state = discreteChain.emplace_back();
            state.emitter = unsigned(emitter.mEmitterDef - definition.mEmitterDefs);
            state.flags = unsigned(emitter.mEmitterDef->mParticleFlags);
            state.imageFrame = current->mImageFrame;
            state.frameOverride = emitter.mFrameOverride;
            state.positionX = current->mPosition.x; state.positionY = current->mPosition.y;
            state.spin = current->mSpinPosition; state.scaleOverride = emitter.mScaleOverride;
            state.colorOverride[0] = float(emitter.mColorOverride.mRed);
            state.colorOverride[1] = float(emitter.mColorOverride.mGreen);
            state.colorOverride[2] = float(emitter.mColorOverride.mBlue);
            state.colorOverride[3] = float(emitter.mColorOverride.mAlpha);
            state.ageNs = current->mParticleAgeNs; state.durationNs = current->mParticleDurationNs;
            state.systemAgeNs = emitter.mSystemAgeNs; state.systemDurationNs = emitter.mSystemDurationNs;
            state.crossFadeDurationNs = current->mCrossFadeDurationNs;
            state.animationElapsedNs = current->mAnimationElapsedNs;
            state.animationIntegral = current->mAnimationSampleIntegral;
            static_assert(ParticleTracks::NUM_PARTICLE_TRACKS == 16);
            std::copy_n(current->mParticleInterp, 16, state.particleWeights);
            std::copy_n(emitter.mTrackInterp + ParticleSystemTracks::TRACK_SYSTEM_RED, 5, state.systemWeights);
        }
        current = system.mParticleHolder->mParticles.DataArrayTryToGet(current->mCrossFadeParticleID);
    }
    Sexy::GpuParticleDraw draw;
    draw.variant = system.mVariant; draw.frameSource = frameSource;
    draw.stateWords = formula ? sizeof(Sexy::GpuParticleFormulaState) / sizeof(float)
                              : sizeof(Sexy::GpuParticleState) / sizeof(float);
    draw.motionModel = formula ? 1u : 0u;
    draw.translateX = graphics.mTransX; draw.translateY = graphics.mTransY;
    draw.targetWidth = float(graphics.mDestImage->mWidth);
    draw.targetHeight = float(graphics.mDestImage->mHeight);
    draw.samplingFlags = render.sImageSamplingFlags;
    const auto& sourceEmitter = *imageParticle->mParticleEmitter;
    const auto flags = sourceEmitter.mEmitterDef->mParticleFlags;
    const bool fullscreen = TestBit(flags, int(ParticleFlags::PARTICLE_FULLSCREEN));
    if (fullscreen) texture = render.mRenderer->whiteTexture;
    const auto blend = (!fullscreen && TestBit(flags, int(ParticleFlags::PARTICLE_ADDITIVE))) ||
        graphics.mDrawMode == Sexy::Graphics::DRAWMODE_ADDITIVE ? Sexy::GpuBlend::Additive :
        graphics.mDrawMode == Sexy::Graphics::DRAWMODE_OPAQUE ? Sexy::GpuBlend::Opaque : Sexy::GpuBlend::Normal;
    const auto& rectangle = graphics.mClipRect;
    const Sexy::GpuClip clip{rectangle.mX, rectangle.mY, rectangle.mWidth, rectangle.mHeight};
    const bool clipped = fullscreen ||
        rectangle.mX || rectangle.mY || rectangle.mWidth != 800 || rectangle.mHeight != 600;
    const auto submit = [&](Sexy::GpuBlend mode) {
        bool accepted = false;
        if (formula)
            accepted = render.mRenderer->SubmitFormulaParticles(definition.mGpuDefinition, texture, draw,
                std::span<const Sexy::GpuParticleFormulaState>(formulaChain.data(), formulaChain.size()),
                graphics.mLinearBlend, render.sSamplerAddressWrap, mode, clipped ? &clip : nullptr);
        else
            accepted = render.mRenderer->SubmitDiscreteParticles(definition.mGpuDefinition, texture, draw,
                std::span<const Sexy::GpuParticleState>(discreteChain.data(), discreteChain.size()),
                graphics.mLinearBlend, render.sSamplerAddressWrap, mode, clipped ? &clip : nullptr);
        if (!accepted)
            throw std::runtime_error("GPU particle submission failed");
    };
    submit(blend);
    if (sourceEmitter.mExtraAdditiveDrawOverride &&
        !TestBit(flags, int(ParticleFlags::PARTICLE_FULLSCREEN)))
        submit(Sexy::GpuBlend::Additive);
#else
    throw std::runtime_error("This renderer does not implement GPU particle drawing");
#endif
}

void TodParticleDrawFormulaGpu(Sexy::Graphics& graphics, TodParticle& particle)
{
    // The first split keeps the submission ABI shared while the formula-state
    // packet is introduced. No motion kind is uploaded to the shader.
    SubmitParticleStateGpu(graphics, particle, true);
}

void TodParticleDrawDiscreteGpu(Sexy::Graphics& graphics, TodParticle& particle)
{
    SubmitParticleStateGpu(graphics, particle, false);
}
