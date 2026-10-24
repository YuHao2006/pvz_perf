#include "Sexy.TodLib/TodCommon.h"
#include "Sexy.TodLib/Definition.h"
#include "Sexy.TodLib/TodParticle.h"
#include "Sexy.TodLib/generated/GeneratedDefinitions.h"
#include <array>
#include <algorithm>
#include <cmath>
#include <iostream>
#include <limits>
#include <stdexcept>

// Link the real runtime objects with this entry point. No app/window, resource
// upload or rendering backend is initialized by this targeted regression test.
bool FixtureCloseRequest() { return false; }
bool (*gAppCloseRequest)() = FixtureCloseRequest;

namespace {
void Require(bool value, const char* message)
{
    if (!value) throw std::runtime_error(message);
}

void Same(float actual, float expected, const char* message)
{
    Require(std::isfinite(actual) && std::abs(actual - expected) <= 0.000001f, message);
}

void CompareDefaultRender(TodParticleEmitter& emitter, TodParticle& particle)
{
    auto localDefinition = *emitter.mEmitterDef;
    auto* originalDefinition = emitter.mEmitterDef;
    emitter.mEmitterDef = &localDefinition;
    // The generated definition stays immutable. Force the ordinary evaluator
    // only on this local copy to establish the omitted-track defaults.
    struct Restore {
        TodParticleEmitter& emitter;
        TodEmitterDefinition* definition;
        ~Restore() { emitter.mEmitterDef = definition; }
    } restore{emitter, originalDefinition};
    Require(localDefinition.mRenderTrackMask == 0, "Expected default-render fast path");
    Require(!FloatTrackIsSet(localDefinition.mParticleStretch) &&
        FloatTrackEvaluate(localDefinition.mParticleStretch, 0.5, 0.5f) == 1.f,
        "Generated omitted stretch must evaluate to one");
    ParticleRenderParams fast{}, ordinary{};
    Require(TodParticleEmitter::GetRenderParams(&particle, &fast), "Fast render parameters missing");
    localDefinition.mRenderTrackMask = 1;
    Require(TodParticleEmitter::GetRenderParams(&particle, &ordinary),
        "Ordinary render parameters missing");
    Same(fast.mParticleStretch, ordinary.mParticleStretch,
        "Default particle stretch fast path differs from ordinary evaluator");
    Same(fast.mParticleScale, ordinary.mParticleScale, "Default particle scale differs");
    Same(fast.mRed, ordinary.mRed, "Default particle red differs");
    Same(fast.mGreen, ordinary.mGreen, "Default particle green differs");
    Same(fast.mBlue, ordinary.mBlue, "Default particle blue differs");
    Same(fast.mAlpha, ordinary.mAlpha, "Default particle alpha differs");
    Same(fast.mPosX, ordinary.mPosX, "Default particle x differs");
    Same(fast.mPosY, ordinary.mPosY, "Default particle y differs");
    Same(fast.mSpinPosition, ordinary.mSpinPosition, "Default particle spin differs");
    Require(!fast.mParticleStretchIsSet, "Default stretch was marked authored");

    // Use the same production transform as RenderParticle: a zero stretch
    // collapses its vertical basis and therefore every texture triangle.
    SexyMatrix3 transform;
    TodScaleRotateTransformMatrix(transform, fast.mPosX, fast.mPosY,
        fast.mSpinPosition, fast.mParticleScale,
        fast.mParticleStretch * fast.mParticleScale);
    const float determinant = transform.m00 * transform.m11 - transform.m01 * transform.m10;
    Same(determinant, 1.f, "Default particle texture geometry collapsed or changed scale");
}

void PoolSparklyBirthPositions(TodParticleHolder& holder)
{
    auto& definition = GeneratedDefinitions::Particles[int(ParticleEffect::PARTICLE_POOL_SPARKLY)];
    Require(definition.mEmitterDefCount == 2, "PoolSparkly must have its two original emitters");
    auto* system = holder.AllocParticleSystemFromDef(450.f, 295.f, 0,
        &definition, ParticleEffect::PARTICLE_POOL_SPARKLY);
    Require(system && system->EmitterRosterCount() == 2, "PoolSparkly system allocation failed");
    system->mRandomState = 0x504f4f4cu;
    constexpr int samples = 512;
    for (int index = 0; index < 2; ++index)
    {
        auto* emitter = system->EmitterRosterEmitterAt(index);
        Require(emitter->mEmitterDef == &definition.mEmitterDefs[index],
            "PoolSparkly emitter order differs from authored definition");
        const auto& d = *emitter->mEmitterDef;
        Same(emitter->mSystemCenter.x, 450.f, "PoolSparkly board x anchor changed");
        Same(emitter->mSystemCenter.y, 295.f, "PoolSparkly board y anchor changed");
        Require(d.mEmitterType == EmitterType::EMITTER_BOX, "PoolSparkly requires box emission");
        // Original PoolSparkly.xml applies -.3 to X, not Y. This independent
        // authored expectation catches native-track-order migration mistakes.
        Same(FloatTrackEvaluate(d.mEmitterSkewX, 0, 0.5f), index == 0 ? -0.3f : 0.f,
            "PoolSparkly horizontal skew differs from original XML");
        Same(FloatTrackEvaluate(d.mEmitterSkewY, 0, 0.5f), 0.f,
            "PoolSparkly unexpectedly tilts births vertically");
        Require(FloatTrackIsSet(d.mEmitterSkewX) == (index == 0) &&
            !FloatTrackIsSet(d.mEmitterSkewY),
            "PoolSparkly authored skew axis changed");
        float minY = std::numeric_limits<float>::max(), maxY = -minY;
        float minBoxX = minY, maxBoxX = -minY;
        for (int sample = 0; sample < samples; ++sample)
        {
            // Real production birth path, including skew and zero-duration
            // initialization of particle fields; delete immediately so the
            // test never depends on particle-roster or pool capacity.
            auto* particle = emitter->SpawnParticle(sample, samples);
            Require(particle != nullptr, "PoolSparkly particle birth failed");
            Require(particle->mParticleAge.mNanoseconds == 0,
                "PoolSparkly newborn unexpectedly advanced its lifetime");
            const float boxY = particle->mPosition.y - 295.f;
            const float boxX = particle->mPosition.x - 450.f +
                (index == 0 ? 0.3f * boxY : 0.f);
            constexpr float epsilon = 0.0001f;
            Require(particle->mPosition.y >= 295.f - epsilon &&
                particle->mPosition.y <= 430.f + epsilon,
                "PoolSparkly birth escaped the original vertical pool band");
            Require(boxX >= (index == 0 ? 0.f : -330.f) - epsilon &&
                boxX <= (index == 0 ? 290.f : 260.f) + epsilon,
                "PoolSparkly birth cannot be inverted to its original box coordinates");
            minY = std::min(minY, particle->mPosition.y);
            maxY = std::max(maxY, particle->mPosition.y);
            minBoxX = std::min(minBoxX, boxX);
            maxBoxX = std::max(maxBoxX, boxX);
            emitter->DeleteParticle(particle);
        }
        // Ensure the deterministic samples actually exercise both ends of the
        // box; a collapsed center or reduced emission range cannot pass.
        Require(minY < 300.f && maxY > 425.f, "PoolSparkly samples did not cover its vertical band");
        Require(minBoxX < (index == 0 ? 5.f : -320.f) &&
            maxBoxX > (index == 0 ? 285.f : 250.f),
            "PoolSparkly samples did not cover its horizontal box range");
        std::cout << "PASS PoolSparkly emitter " << index << ": " << samples
            << " deterministic production births, y=[" << minY << ',' << maxY
            << "] recoveredBoxX=[" << minBoxX << ',' << maxBoxX << "]\n";
    }
}

void PowieCloudBirthParameters(TodParticleSystem& system)
{
    system.mRandomState = 0x504f5749u;
    for (int index = 0; index < 2; ++index)
    {
        auto* emitter = system.EmitterRosterEmitterAt(index);
        const auto& d = *emitter->mEmitterDef;
        Require(d.mNameId == (index == 0 ? ParticleEmitterName::powiesmallclouds :
            ParticleEmitterName::powiebigclouds), "Powie cloud emitter order changed");
        // These are authored expectations from the original Powie.xml, not
        // values inferred from the current generated definition. Native dump
        // order differs from member order for launch and system-color tracks.
        const float low = index == 0 ? 2000.f : 500.f;
        const float high = index == 0 ? 2500.f : 1200.f;
        Same(FloatTrackEvaluate(d.mLaunchSpeed, 0, 0), low, "Powie cloud minimum launch speed changed");
        Same(FloatTrackEvaluate(d.mLaunchSpeed, 0, 1), high, "Powie cloud maximum launch speed changed");
        Require(FloatTrackIsSet(d.mLaunchSpeed) && FloatTrackIsSet(d.mSystemAlpha) &&
            !FloatTrackIsSet(d.mSystemGreen), "Powie launch/alpha tracks were mapped to color fields");
        Same(FloatTrackEvaluate(d.mSystemAlpha, 0, 0.5f), 1.f, "Powie cloud initial system alpha changed");
        Same(FloatTrackEvaluate(d.mSystemAlpha, 0.9, 0.5f), 0.5f, "Powie cloud system alpha fade changed");
        Same(FloatTrackEvaluate(d.mSystemAlpha, 1, 0.5f), 0.f, "Powie cloud final system alpha changed");
        for (const auto* track : {&d.mSystemRed, &d.mSystemGreen, &d.mSystemBlue,
            &d.mSystemBrightness})
            Same(FloatTrackEvaluate(*track, 0.9, 0.5f), 1.f,
                "Powie cloud default system color/brightness changed");

        float minimumSpeed = std::numeric_limits<float>::max(), maximumSpeed = -minimumSpeed;
        for (int sample = 0; sample < 64; ++sample)
        {
            emitter->mSystemAge = 0;
            auto* particle = emitter->SpawnParticle(sample, 64);
            Require(particle != nullptr, "Powie cloud birth failed");
            const float speed = std::hypot(particle->mVelocity.x, particle->mVelocity.y);
            Require(std::isfinite(speed) && speed >= low * 0.01f - 0.0001f &&
                speed <= high * 0.01f + 0.0001f,
                "Powie cloud birth velocity lost its authored launch speed");
            minimumSpeed = std::min(minimumSpeed, speed);
            maximumSpeed = std::max(maximumSpeed, speed);
            ParticleRenderParams initial{}, faded{};
            Require(TodParticleEmitter::GetRenderParams(particle, &initial),
                "Powie cloud birth render parameters missing");
            Same(initial.mRed, 255.f, "Powie cloud initial red changed");
            Same(initial.mGreen, (index == 0 ? 0.7f : 0.9f) * 255.f,
                "Powie cloud initial green changed");
            Same(initial.mBlue, 0.f, "Powie cloud initial blue changed");
            Same(initial.mAlpha, 255.f, "Powie cloud initial alpha changed");
            emitter->mSystemAge = 180; // 90% of the original 200-tick system.
            Require(TodParticleEmitter::GetRenderParams(particle, &faded),
                "Powie cloud faded render parameters missing");
            Same(faded.mRed, initial.mRed, "Powie system fade incorrectly affected red");
            Same(faded.mGreen, initial.mGreen, "Powie system fade incorrectly affected green");
            Same(faded.mAlpha, 127.5f, "Powie system fade did not affect alpha");
            emitter->DeleteParticle(particle);
        }
        emitter->mSystemAge = 0;
        Require(maximumSpeed > minimumSpeed, "Powie cloud speed distribution collapsed");
        std::cout << "PASS Powie cloud emitter " << index
            << ": 64 deterministic births, speed=[" << minimumSpeed << ','
            << maximumSpeed << "], original launch/color/alpha tracks and alpha-only fade\n";
    }
}
}

int main()
{
    try
    {
        TodParticleData data;
        data.Initialize();
        TodParticleHolder holder(&data);
        auto& definition = GeneratedDefinitions::Particles[int(ParticleEffect::PARTICLE_POWIE)];
        auto* system = holder.AllocParticleSystemFromDef(320.f, 240.f, 0,
            &definition, ParticleEffect::PARTICLE_POWIE);
        Require(system != nullptr, "Powie particle system allocation failed");
        TodParticleEmitter* word = nullptr;
        for (int i = 0; i < system->EmitterRosterCount(); ++i)
        {
            auto* emitter = system->EmitterRosterEmitterAt(i);
            if (emitter->mEmitterDef->mNameId == ParticleEmitterName::powieword)
                word = emitter;
        }
        Require(word && word->ParticleRosterCount() == 1, "PowieWord must spawn its visible particle");
        auto* wordParticle = word->ParticleRosterParticleAt(0);
        for (const int age : {0, 25, 49})
        {
            word->mSystemAge = age;
            wordParticle->mParticleAge = age;
            CompareDefaultRender(*word, *wordParticle);
        }
        std::cout << "PASS real PowieWord birth/mid/end: default stretch, colors, position, "
            "scale and nondegenerate production transform match ordinary evaluation\n";

        // The fix restores the shared omitted-track contract. Exercise every
        // generated default-render emitter rather than special-casing Powie.
        unsigned checked = 0;
        for (auto& effect : GeneratedDefinitions::Particles)
            for (int i = 0; i < effect.mEmitterDefCount; ++i)
            {
                auto& emitterDefinition = effect.mEmitterDefs[i];
                if (emitterDefinition.mRenderTrackMask != 0) continue;
                TodParticleEmitter emitter{};
                emitter.mEmitterDef = &emitterDefinition;
                emitter.mParticleSystem = system;
                emitter.mColorOverride = Color::White;
                emitter.mScaleOverride = 1.f;
                emitter.mSystemDuration = 100;
                emitter.mSystemAge = 37;
                TodParticle particle{};
                particle.mParticleEmitter = &emitter;
                particle.mParticleDuration = 100;
                particle.mParticleAge = 43;
                particle.mPosition = SexyVector2(123.25f, 234.75f);
                particle.mSpinPosition = 0.37f;
                CompareDefaultRender(emitter, particle);
                ++checked;
            }
        Require(checked != 0, "No default-render emitter coverage");
        std::cout << "PASS all " << checked
            << " generated default-render emitters: fast/ordinary render parameter parity\n";
        PowieCloudBirthParameters(*system);
        PoolSparklyBirthPositions(holder);
        return 0;
    }
    catch (const std::exception& error)
    {
        std::cerr << "FAIL particle render parameter regression: " << error.what() << '\n';
        return 1;
    }
}
