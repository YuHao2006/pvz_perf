#include "Sexy.TodLib/Reanimator.h"
#include "ReanimClock.h"
#include "EffectSystem.h"
EffectSystem* gEffectSystem = nullptr;
// Standalone production-runtime fixture. Link TodParticle.cpp, Definition.cpp
// and graphics/Color.cpp with function-section dead stripping. Only the global
// seed source, diagnostics and curve dispatch are substituted; all simulation,
// allocation, node interpolation, random scheduling and input sampling are real.
#include "Sexy.TodLib/Definition.h"
#include "Sexy.TodLib/EffectSystem.h"
#include "Sexy.TodLib/generated/GeneratedDefinitions.h"
#include "SexyAppFramework/graphics/RenderInterface.h"
#include "SexyAppFramework/imagelib/ImageLib.h"
#include "SexyAppFramework/misc/SexyMatrix.h"
#include <bit>
#include <cmath>
#include <cstdarg>
#include <iostream>
#include <stdexcept>
#include <string>
#include <vector>
#include <unordered_map>

namespace
{
unsigned globalRandomCalls;
float Linear(double t, float a, float b) { return static_cast<float>(a + (b - a) * t); }
float Constant(double, float a, float) { return a; }
float UnsupportedCurve(double, float, float) { throw std::runtime_error("fixture contains unsupported curve"); }
void Require(bool value, const char* message)
{
    if (!value) throw std::runtime_error(message);
}
}
namespace Sexy
{
SexyAppBase* gSexyAppBase = nullptr;
unsigned CurrentNativeThreadIdentity() noexcept { return 0; }
SexyMatrix3::SexyMatrix3() {}
void Graphics::FillRect(int, int, int, int) { throw std::runtime_error("unexpected rendering"); }
GpuTexture* RenderInterface::UploadAtlasTexture(ImageLib::Image*&) { throw std::runtime_error("unexpected atlas upload"); }
void RenderInterface::FreeAtlasTextures() { throw std::runtime_error("unexpected atlas release"); }
int Rand(int range)
{
    ++globalRandomCalls;
    return range > 0 ? 0x12345678 % range : 0;
}
}
#ifndef TodTrace
void TodTrace(const char*, ...) {}
#endif
#ifndef TodTraceAndLog
void TodTraceAndLog(const char*, ...) {}
#endif
#ifndef TodTraceWithoutSpamming
void TodTraceWithoutSpamming(const char*, ...) {}
#endif
void TodScaleRotateTransformMatrix(Sexy::SexyMatrix3&, float, float, float, float, float)
{
    throw std::runtime_error("unexpected rendering");
}
TodTriangleGroup::TodTriangleGroup() {}
void TodTriangleGroup::DrawGroup(Sexy::Graphics*) { throw std::runtime_error("unexpected rendering"); }
void TodTriangleGroup::AddTriangle(Sexy::Graphics*, const Sexy::TextureSource&,
    const Sexy::SexyMatrix3&, const Sexy::Rect&, const Sexy::Color&, int, const Sexy::TextureRegion&)
{
    throw std::runtime_error("unexpected rendering");
}
namespace GeneratedDefinitions
{
TodParticleDefinition Particles[ParticleCount];
void LoadParticleImages() { throw std::runtime_error("unexpected image load"); }
void ReleaseParticleImages() { throw std::runtime_error("unexpected image release"); }
void ReleaseImages() { throw std::runtime_error("unexpected image release"); }
}
namespace ImageLib
{
Image::~Image() {}
Image* GetImage(const std::string&, bool) { throw std::runtime_error("unexpected image load"); }
}
void ZombatarFreeResources() { throw std::runtime_error("unexpected resource release"); }
const TodCurveEvalFn kCurveEvals[14]{
    Constant, Linear, UnsupportedCurve, UnsupportedCurve, UnsupportedCurve, UnsupportedCurve, UnsupportedCurve,
    UnsupportedCurve, Constant, UnsupportedCurve, UnsupportedCurve, UnsupportedCurve, UnsupportedCurve, UnsupportedCurve};

namespace
{
std::unordered_map<const TodParticleSystem*, std::int64_t> ownerTimes;
std::int64_t& OwnerTime(const TodParticleSystem* system) { return ownerTimes[system]; }
void StepSystem(TodParticleSystem* system, std::uint64_t delta, std::int64_t now)
{
    const auto previous = OwnerTime(system);
    system->Update(delta, now, previous);
    OwnerTime(system) = now;
}

struct Scene
{
    FloatParameterTrackNode values[12]{
        {0.0, 300.0f, 300.0f, 1, 1}, // system 300 ticks
        {0.0, 130.125f, 130.125f, 1, 1}, // particle 130.125 ticks
        {0.0, 31.125f, 31.125f, 1, 1},
        {1.0 / 3.0, 127.5f, 127.5f, 1, 1},
        {1.0, 17.75f, 17.75f, 1, 1},
        {0.0, -1.0f, -1.0f, 1, 1}, // unconstrained active count
        {0.0, 100.0f, 250.0f, 1, 1}, // launch speed
        {0.0, -180.0f, 180.0f, 1, 1},
        {0.0, 1.7537289f, 1.7537289f, 1, 1}, // image cycles / sec
        {0.0, 0.8f, 0.8f, 1, 1},
        {0.0, 0.02f, 0.02f, 1, 1},
        {0.0, 3.0f, 3.0f, 1, 1}
    };
    ParticleField fields[4]{};
    ParticleField systemField{};
    TodEmitterDefinition emitter{};
    TodParticleDefinition definition{};
    TodParticleData data;
    TodParticleHolder holder{&data};
    TodParticleSystem* system;
    explicit Scene(int fieldSet = -1, bool loop = false, float rate = 0)
    {
        emitter.mSystemDuration = {values, 1};
        emitter.mParticleDuration = {values + 1, 1};
        emitter.mSpawnRate = {values + 2, 3};
        if (fieldSet < 0)
        {
            values[2].mLow = values[2].mHigh = rate;
            emitter.mSpawnRate.mCountNodes = 1;
        }
        emitter.mSpawnMinActive = {values + 5, 1};
        emitter.mSpawnMaxActive = {values + 5, 1};
        emitter.mLaunchSpeed = {values + 6, 1};
        emitter.mLaunchAngle = {values + 7, 1};
        emitter.mAnimationRate = {values + 8, 1};
        emitter.mCollisionReflect = {values + 9, 1};
        emitter.mCollisionSpin = {values + 10, 1};
        emitter.mImageFrames = 8;
        emitter.mEmitterType = EmitterType::EMITTER_BOX;
        emitter.mParticleFlags = 1 << static_cast<int>(ParticleFlags::PARTICLE_SYSTEM_LOOPS);
        if (loop)
            emitter.mParticleFlags |= 1 << static_cast<int>(ParticleFlags::PARTICLE_PARTICLE_LOOPS);
        const ParticleFieldType sets[][4]{
            {FIELD_FRICTION, FIELD_ACCELERATION, FIELD_SHAKE, FIELD_GROUND_CONSTRAINT},
            {FIELD_ATTRACTOR, FIELD_MAX_VELOCITY, FIELD_VELOCITY, FIELD_POSITION},
            {FIELD_CIRCLE, FIELD_AWAY, FIELD_SHAKE, FIELD_GROUND_CONSTRAINT}
        };
        for (int i = 0; i < 4; ++i)
        {
            fields[i].mFieldType = fieldSet < 0 ? FIELD_INVALID : sets[fieldSet][i];
            fields[i].mX = {values + (fields[i].mFieldType == FIELD_FRICTION ? 10 : 11), 1};
            fields[i].mY = fields[i].mX;
        }
        emitter.mParticleFields = {fields, 4};
        systemField.mFieldType = FIELD_SYSTEM_POSITION;
        systemField.mX = {values + 11, 1};
        systemField.mY = systemField.mX;
        emitter.mSystemFields = {&systemField, 1};
        if (fieldSet < 0)
        {
            emitter.mParticleFields.count = 0;
            emitter.mSystemFields.count = 0;
            emitter.mLaunchSpeed = {};
        }
        definition.mEmitterDefs = &emitter;
        definition.mEmitterDefCount = 1;
        definition.mVariantCount = 1;
        data.Initialize();
        system = holder.AllocParticleSystemFromDef(100, 200, 0, &definition,
            ParticleEffect::PARTICLE_NONE, 0);
        OwnerTime(system) = 0;
    }
    TodParticleEmitter* Emitter() const { return system->EmitterRosterEmitterAt(0); }
    TodParticle* Spawn() { return Emitter()->SpawnParticle(0, 1, OwnerTime(system)); }
};

std::vector<std::uint64_t> Snapshot(const Scene& scene)
{
    std::vector<std::uint64_t> result;
    auto integer = [&](auto n) { result.push_back(static_cast<std::uint64_t>(n)); };
    auto number = [&](float n) { integer(std::bit_cast<std::uint32_t>(n)); };
    auto vector = [&](const SexyVector2& n) { number(n.x); number(n.y); };
    integer(scene.system->mRandomState);
    integer(scene.system->mDead);
    integer(scene.system->EmitterRosterCount());
    for (int e = 0; e < scene.system->EmitterRosterCount(); ++e)
    {
        const auto& emitter = *scene.system->EmitterRosterEmitterAt(e);
        integer(ParticleLifeAgeAt(OwnerTime(emitter.mParticleSystem), emitter.mBirthTimeNs, emitter.mSystemDurationNs));
        integer(emitter.mSystemDurationNs);
        const auto emitterAge = ParticleLifeAgeAt(OwnerTime(scene.system), emitter.mBirthTimeNs, emitter.mSystemDurationNs);
        Require(emitter.mParticleSystem->mParticleHolder->mData->mEmitterLifeFractions[emitter.mParticleSystem->mParticleHolder->mEmitters.DataArrayIndexOf(&emitter)] == (emitterAge < 0 ? -1.0 : double(emitterAge)/std::max<std::int64_t>(1,emitter.mSystemDurationNs)), "stale emitter life cache");
        integer(std::bit_cast<std::uint64_t>(emitter.mSystemPositionOriginX));
        integer(std::bit_cast<std::uint64_t>(emitter.mSystemPositionOriginY));
        integer(emitter.mSystemPositionBound);
        integer(emitter.mSpawnRemainder);
        integer(emitter.mParticlesSpawned);
        integer(emitter.mDead);
        vector(emitter.mSystemCenter);
        integer(emitter.ParticleRosterCount());
        for (int p = 0; p < emitter.ParticleRosterCount(); ++p)
        {
            const auto& particle = *emitter.ParticleRosterParticleAt(p);
            integer(particle.mParticleDurationNs);
            const auto particleAge = ParticleLifeAgeAt(OwnerTime(scene.system), particle.mBirthTimeNs, particle.mParticleDurationNs);
            Require(particle.mParticleEmitter->mParticleSystem->mParticleHolder->mData->mParticleLifeFractions[particle.mParticleEmitter->mParticleSystem->mParticleHolder->mParticles.DataArrayIndexOf(&particle)] == (particleAge < 0 ? -1.0 : double(particleAge)/std::max<std::int64_t>(1,particle.mParticleDurationNs)), "stale particle life cache");
            integer(ParticleLifeAgeAt(OwnerTime(particle.mParticleEmitter->mParticleSystem), particle.mBirthTimeNs, particle.mParticleDurationNs));
            integer(ReanimClock::Subtract(OwnerTime(particle.mParticleEmitter->mParticleSystem), particle.mAnimationBirthTimeNs));
            integer(particle.mAnimationSampleIntegral);
            integer(TodParticleAnimationPhase(particle, emitter.mEmitterDef->mAnimationRate, OwnerTime(scene.system)));
            integer(particle.mRandomSeed);
            integer(particle.mImageFrame);
            vector(particle.mPosition);
            vector(particle.mVelocity);
            number(particle.mSpinPosition);
            number(particle.mSpinVelocity);
            for (float n : particle.mParticleInterp) number(n);
            for (auto& field : particle.mParticleFieldInterp)
                for (float n : field) number(n);
        }
    }
    return result;
}

void Advance(Scene& scene, std::uint64_t duration, int frequency, std::uint32_t& random)
{
    std::uint64_t remaining = duration;
    while (remaining)
    {
        random = random * 1664525U + 1013904223U;
        auto delta = frequency ? 1'000'000'000ULL / frequency
            : static_cast<std::uint64_t>(1 + random % 73'000'000);
        delta = std::min<std::uint64_t>(delta, remaining);
        // Explicit intervals must take precedence over ambient frame settings.
        Sexy::gUpdateTicks = 317;
        Sexy::gUpdateIntervalNs = 999;
        StepSystem(scene.system, delta, ReanimClock::Add(OwnerTime(scene.system), static_cast<std::int64_t>(delta)));
        remaining -= delta;
    }
}

void Near(float actual, float expected, const char* message, float tolerance = 0.0001f)
{
    Require(std::abs(actual - expected) <= tolerance, message);
}

void Field(Scene& scene, ParticleFieldType type, float x, float y)
{
    scene.values[10].mLow = scene.values[10].mHigh = x;
    scene.values[11].mLow = scene.values[11].mHigh = y;
    scene.fields[0].mFieldType = type;
    scene.fields[0].mX = {scene.values + 10, 1};
    scene.fields[0].mY = {scene.values + 11, 1};
    scene.emitter.mParticleFields = {scene.fields, 1};
}

void TestActualDelta()
{
    Scene scene;
    auto* p = scene.Spawn();
    Require(ParticleLifeAgeAt(OwnerTime(p->mParticleEmitter->mParticleSystem), p->mBirthTimeNs, p->mParticleDurationNs) == 0 && ReanimClock::Subtract(OwnerTime(p->mParticleEmitter->mParticleSystem), p->mAnimationBirthTimeNs) == 0,
        "birth received hidden time");
    p->mPosition = {0, 0};
    p->mVelocity = {2, -4};
    StepSystem(scene.system, 1'250'000, ReanimClock::Add(OwnerTime(scene.system), static_cast<std::int64_t>(1'250'000)));
    Require(ParticleLifeAgeAt(OwnerTime(p->mParticleEmitter->mParticleSystem), p->mBirthTimeNs, p->mParticleDurationNs) == 1'250'000, "sub-10ms lifetime did not advance");
    Near(p->mPosition.x, 0.25f, "sub-10ms velocity displacement");
    Near(p->mPosition.y, -0.5f, "sub-10ms vertical displacement");
    Require(ReanimClock::Subtract(OwnerTime(p->mParticleEmitter->mParticleSystem), p->mAnimationBirthTimeNs) == 1'250'000, "sub-10ms animation did not advance");
    const auto globalBefore = globalRandomCalls;
    scene.system->SystemMove(150, 275);
    const auto held = Snapshot(scene);
    StepSystem(scene.system, 0, ReanimClock::Add(OwnerTime(scene.system), static_cast<std::int64_t>(0)));
    Require(Snapshot(scene) == held, "zero update sampled input/state/RNG");
    scene.system->mDontUpdate = true;
    StepSystem(scene.system, 123'456'789, ReanimClock::Add(OwnerTime(scene.system), static_cast<std::int64_t>(123'456'789)));
    Require(Snapshot(scene) == held, "paused update sampled input/state/RNG");
    Require(globalBefore == globalRandomCalls, "updates consumed global RNG");
    scene.system->mDontUpdate = false;
    StepSystem(scene.system, 1'000'000, ReanimClock::Add(OwnerTime(scene.system), static_cast<std::int64_t>(1'000'000)));
    Near(p->mPosition.x, 50.45f, "held move was not applied once");
    Near(p->mPosition.y, 74.1f, "held move vertical displacement");
    StepSystem(scene.system, 1'000'000, ReanimClock::Add(OwnerTime(scene.system), static_cast<std::int64_t>(1'000'000)));
    Near(p->mPosition.x, 50.65f, "held move was applied twice");
    Require(ParticleLifeAgeAt(OwnerTime(scene.system), scene.Emitter()->mBirthTimeNs, scene.Emitter()->mSystemDurationNs) == 3'250'000,
        "emitter age used ambient step settings");
    for (int frequency : {30, 60, 100, 144, 200, 240, 1000, 0})
    {
        Scene motion;
        auto* moving = motion.Spawn();
        moving->mPosition = {0, 0};
        moving->mVelocity = {2, -4};
        std::uint32_t random = 711;
        Advance(motion, 1'000'000'000, frequency, random);
        Near(moving->mPosition.x, 200, "constant velocity total elapsed displacement", 0.01f);
        Near(moving->mPosition.y, -400, "constant vertical total elapsed displacement", 0.02f);
        Require(moving->mAnimationSampleIntegral == 0,
            "constant animation rate accumulated sampled increments");
    }

    Scene acceleration;
    Field(acceleration, FIELD_ACCELERATION, 8, -4);
    auto* a = acceleration.Spawn();
    a->mVelocity = {0, 0};
    StepSystem(acceleration.system, 2'500'000, ReanimClock::Add(OwnerTime(acceleration.system), static_cast<std::int64_t>(2'500'000)));
    Near(a->mVelocity.x, 0.02f, "acceleration did not scale with dt");
    Near(a->mVelocity.y, -0.01f, "vertical acceleration did not scale with dt");

    Scene attractor;
    Field(attractor, FIELD_ATTRACTOR, 3, 0);
    auto* b = attractor.Spawn();
    b->mPosition = {110, 200};
    b->mVelocity = {0, 0};
    StepSystem(attractor.system, 50'000'000, ReanimClock::Add(OwnerTime(attractor.system), static_cast<std::int64_t>(50'000'000)));
    Near(b->mVelocity.x, -0.35f, "main step was split into private force steps");
    Near(b->mPosition.x, 108.25f, "main step did not use a single field pass");

    Scene friction;
    Field(friction, FIELD_FRICTION, 0.2f, 1.0f);
    auto* f = friction.Spawn();
    f->mVelocity = {4, 5};
    friction.Emitter()->UpdateParticle(f, 0, OwnerTime(friction.system));
    Near(f->mVelocity.x, 4, "friction changed x velocity at zero dt");
    Near(f->mVelocity.y, 5, "friction 1 changed velocity at zero dt");
    StepSystem(friction.system, 25'000'000, ReanimClock::Add(OwnerTime(friction.system), static_cast<std::int64_t>(25'000'000)));
    Near(f->mVelocity.x, 2, "friction did not integrate the actual 25ms step");
    Near(f->mVelocity.y, 0, "friction 1 did not stop velocity");

    Scene frictionOriginalStep;
    Field(frictionOriginalStep, FIELD_FRICTION, 0.2f, 1);
    auto* fo = frictionOriginalStep.Spawn();
    fo->mVelocity = {4, 5};
    StepSystem(frictionOriginalStep.system, 10'000'000, ReanimClock::Add(OwnerTime(frictionOriginalStep.system), static_cast<std::int64_t>(10'000'000)));
    Near(fo->mVelocity.x, 3.2f, "10ms friction changed original velocity multiplier");
    Near(fo->mVelocity.y, 0, "10ms friction 1 did not stop velocity");

    Scene frictionSplit;
    Field(frictionSplit, FIELD_FRICTION, 0.2f, 1);
    auto* fs = frictionSplit.Spawn();
    fs->mVelocity = {4, 5};
    StepSystem(frictionSplit.system, 7'000'000, ReanimClock::Add(OwnerTime(frictionSplit.system), static_cast<std::int64_t>(7'000'000)));
    Near(fs->mVelocity.x, 3.44f, "friction did not integrate the first 7ms step");
    Near(fs->mVelocity.y, 1.5f, "friction 1 ignored the partial step");
    StepSystem(frictionSplit.system, 18'000'000, ReanimClock::Add(OwnerTime(frictionSplit.system), static_cast<std::int64_t>(18'000'000)));
    // Discrete friction integrates each update independently, so splitting a step changes its result.
    Near(fs->mVelocity.x, 2.2016f, "friction did not integrate the second 18ms step");
    Near(fs->mVelocity.y, 0, "split friction did not clamp the second step");

    Scene frictionLargeStep;
    Field(frictionLargeStep, FIELD_FRICTION, 0.2f, 1);
    auto* fl = frictionLargeStep.Spawn();
    fl->mVelocity = {-4, 5};
    StepSystem(frictionLargeStep.system, 100'000'000, ReanimClock::Add(OwnerTime(frictionLargeStep.system), static_cast<std::int64_t>(100'000'000)));
    Near(fl->mVelocity.x, 0, "large friction step reversed negative velocity");
    Near(fl->mVelocity.y, 0, "large friction step reversed positive velocity");

    Scene spin;
    spin.emitter.mParticleSpinSpeed = {spin.values + 11, 1};
    auto* s = spin.Spawn();
    s->mSpinVelocity = 0.4f;
    StepSystem(spin.system, 50'000'000, ReanimClock::Add(OwnerTime(spin.system), static_cast<std::int64_t>(50'000'000)));
    Near(s->mSpinPosition, 2 + 0.15f * 3.14159265358979323846f / 180,
        "spin speed or collision spin did not scale with dt");
}

void TestDiscreteMotion()
{
    Scene scene(-1, true);
    Field(scene, FIELD_ACCELERATION, 8, -4);
    auto* particle = scene.Spawn();
    particle->mPosition = {10, 20};
    particle->mVelocity = {2, -1};
    particle->mSpinPosition = 7.25f;
    particle->mSpinVelocity = .125f;
    SexyVector2 expectedPosition = particle->mPosition;
    SexyVector2 expectedVelocity = particle->mVelocity;
    float expectedSpin = particle->mSpinPosition;
    for (const auto delta : {1'250'000ULL, 10'000'000ULL, 17'500'000ULL, 0ULL})
    {
        expectedVelocity.x += static_cast<float>(.08f * static_cast<double>(delta) / 10'000'000);
        expectedVelocity.y += static_cast<float>(-.04f * static_cast<double>(delta) / 10'000'000);
        expectedPosition.x += static_cast<float>(expectedVelocity.x * static_cast<double>(delta) / 10'000'000);
        expectedPosition.y += static_cast<float>(expectedVelocity.y * static_cast<double>(delta) / 10'000'000);
        expectedSpin += static_cast<float>(.125f * static_cast<double>(delta) / 10'000'000);
        StepSystem(scene.system, delta, ReanimClock::Add(OwnerTime(scene.system), static_cast<std::int64_t>(delta)));
        Near(particle->mVelocity.x, expectedVelocity.x, "discrete acceleration x");
        Near(particle->mVelocity.y, expectedVelocity.y, "discrete acceleration y");
        Near(particle->mPosition.x, expectedPosition.x, "discrete velocity-first position x");
        Near(particle->mPosition.y, expectedPosition.y, "discrete velocity-first position y");
        Near(particle->mSpinPosition, expectedSpin, "discrete spin accumulation");
    }
    particle->mPosition.x = 100;
    particle->mSpinPosition = 10;
    const auto velocity = particle->mVelocity;
    StepSystem(scene.system, 10'000'000, ReanimClock::Add(OwnerTime(scene.system), static_cast<std::int64_t>(10'000'000)));
    Near(particle->mPosition.x, 100 + velocity.x + .08f,
        "public position edit did not continue discrete motion");
    Near(particle->mSpinPosition, 10.125f,
        "public spin edit did not continue discrete rotation");
}

void TestLifetimesAndTracks()
{
    Scene scene;
    auto* p = scene.Spawn();
    Require(p->mParticleDurationNs == 1'301'250'000,
        "fractional authored duration was truncated");
    StepSystem(scene.system, 1'301'249'999, ReanimClock::Add(OwnerTime(scene.system), static_cast<std::int64_t>(1'301'249'999)));
    Require(scene.Emitter()->ParticleRosterCount() == 1, "particle died before ns boundary");
    StepSystem(scene.system, 1, ReanimClock::Add(OwnerTime(scene.system), static_cast<std::int64_t>(1)));
    Require(scene.Emitter()->ParticleRosterCount() == 0, "particle survived exact duration boundary");

    Scene looping(-1, true);
    auto* loop = looping.Spawn();
    loop->mParticleDurationNs = 12'345'679;
    RefreshParticleLifeFraction(*loop, OwnerTime(loop->mParticleEmitter->mParticleSystem));
    StepSystem(looping.system, 40'000'000, ReanimClock::Add(OwnerTime(looping.system), static_cast<std::int64_t>(40'000'000)));
    Require(ParticleLifeAgeAt(OwnerTime(loop->mParticleEmitter->mParticleSystem), loop->mBirthTimeNs, loop->mParticleDurationNs) == 2'962'963, "particle loop lost ns overshoot");
    Require(ReanimClock::Subtract(OwnerTime(loop->mParticleEmitter->mParticleSystem), loop->mAnimationBirthTimeNs) == 40'000'000, "loop reset animation elapsed");
    looping.Emitter()->mSystemDurationNs = 17'000'003;
    RefreshParticleLifeFraction(*looping.Emitter(), OwnerTime(looping.system));
    StepSystem(looping.system, 50'000'000, ReanimClock::Add(OwnerTime(looping.system), static_cast<std::int64_t>(50'000'000)));
    Require(ParticleLifeAgeAt(OwnerTime(looping.system), looping.Emitter()->mBirthTimeNs, looping.Emitter()->mSystemDurationNs) == 4'999'985,
        "emitter loop lost ns overshoot");

    Scene position;
    FloatParameterTrackNode offsets[]{{0.0, 3, 3, 1, 1}, {1.0, 13, 13, 1, 1}};
    Field(position, FIELD_POSITION, 0, 0);
    position.fields[0].mX = {offsets, 2};
    auto* q = position.Spawn();
    Near(q->mPosition.x, 103, "birth offset was not sampled at zero age");
    q->mParticleDurationNs = 100'000'000;
    RefreshParticleLifeFraction(*q, OwnerTime(q->mParticleEmitter->mParticleSystem));
    StepSystem(position.system, 25'000'000, ReanimClock::Add(OwnerTime(position.system), static_cast<std::int64_t>(25'000'000)));
    Near(q->mPosition.x, 105.5f, "lifetime fraction did not use full duration");
    FloatParameterTrackNode rates[]{{0.0, 1, 1, 1, 1}, {1.0, 3, 3, 1, 1}};
    position.emitter.mAnimationRate = {rates, 2};
    StepSystem(position.system, 25'000'000, ReanimClock::Add(OwnerTime(position.system), static_cast<std::int64_t>(25'000'000)));
    Require(q->mAnimationSampleIntegral == 50'000'000'000,
        "variable animation rate did not integrate actual dt");

    Scene random;
    random.emitter.mParticleFlags |= 1 << static_cast<int>(ParticleFlags::PARTICLE_RANDOM_START_TIME);
    auto* r = random.Spawn();
    Require(ParticleLifeAgeAt(OwnerTime(r->mParticleEmitter->mParticleSystem), r->mBirthTimeNs, r->mParticleDurationNs) >= 0 &&
        ParticleLifeAgeAt(OwnerTime(r->mParticleEmitter->mParticleSystem), r->mBirthTimeNs, r->mParticleDurationNs) < r->mParticleDurationNs &&
        ParticleLifeAgeAt(OwnerTime(r->mParticleEmitter->mParticleSystem), r->mBirthTimeNs, r->mParticleDurationNs) % 10'000'000 != 0,
        "random initial age retained legacy tick grid");
}

void TestExplicitParticleTime()
{
    // Deliberately leave the system boundary clock unrelated to the supplied
    // timestamp. Births, fields, fading and image phase must use the argument.
    Scene scene(0);
    constexpr std::int64_t birth = 123'456'789;
    OwnerTime(scene.system) = -9'000'000'000;
    auto* particle = scene.Emitter()->SpawnParticle(0, 1, birth);
    Require(particle && particle->mBirthTimeNs == birth &&
        particle->mAnimationBirthTimeNs == birth,
        "particle birth consulted the system's cached clock");
    constexpr std::int64_t elapsed = 87'654'321;
    const auto now = birth + elapsed;
    Require(TodParticleAnimationPhase(*particle, scene.emitter.mAnimationRate, now) ==
        ParticleClock::ConstantRatePhase(elapsed, scene.values[8].mLow),
        "particle image phase ignored the explicit timestamp");

    Scene reference(0);
    OwnerTime(reference.system) = birth;
    auto* expected = reference.Emitter()->SpawnParticle(0, 1, birth);
    Require(reference.Emitter()->UpdateParticle(expected, elapsed, now, 0) &&
        scene.Emitter()->UpdateParticle(particle, elapsed, now, 0),
        "explicit-time particle unexpectedly expired");
    Require(particle->mPosition.x == expected->mPosition.x &&
        particle->mPosition.y == expected->mPosition.y &&
        particle->mVelocity.x == expected->mVelocity.x &&
        particle->mVelocity.y == expected->mVelocity.y &&
        particle->mSpinPosition == expected->mSpinPosition,
        "particle fields depended on a stored system timestamp");
    Require(OwnerTime(scene.system) == -9'000'000'000,
        "particle evaluation unexpectedly wrote the system clock");

    TodEmitterDefinition targetDef = scene.emitter;
    FloatParameterTrackNode fadeNode[]{ {0.0, 25.0f, 25.0f, 1, 1} };
    targetDef.mCrossFadeDuration = {fadeNode, 1};
    auto* target = scene.holder.mEmitters.DataArrayAlloc();
    target->TodEmitterInitialize(100, 200, scene.system, &targetDef, now);
    Require(target->mBirthTimeNs == now && scene.system->EmitterRosterAdd(target),
        "crossfade emitter did not use the explicit birth timestamp");
    scene.Emitter()->CrossFadeEmitter(target, now);
    Require(scene.Emitter()->mCrossFadeEndTimeNs == now + 250'000'000 &&
        target->ParticleRosterCount() == 1 &&
        target->ParticleRosterParticleAt(0)->mAnimationBirthTimeNs == now,
        "crossfade deadline or target birth consulted the system clock");
}

void TestEmission()
{
    constexpr std::int64_t elapsed = 5'123'456'789;
    constexpr std::int64_t anchor = 987'654'321'123;
    for (float rate : {1.0f, 31.125f, 1.7537289f})
      for (auto saved : {std::int64_t(0), anchor, -anchor})
      {
        const auto exact = ParticleClock::ConstantRateIntegral(elapsed, rate);
        const auto expected = exact.whole + (exact.fraction + saved) / ParticleClock::Cycle
            - ((exact.whole + (exact.fraction + saved) / ParticleClock::Cycle > 0 &&
                (exact.fraction + saved) % ParticleClock::Cycle < 0) ? 1 : 0);
        for (int frequency : {30, 60, 100, 144, 200, 240, 1000, 0})
        {
            Scene scene(-1, false, rate);
            scene.Emitter()->mSpawnRemainder = saved;
            std::uint32_t random = 0x7171U;
            Advance(scene, elapsed, frequency, random);
            Require(scene.Emitter()->mParticlesSpawned == expected,
                "constant-rate emission total depends on ns partition/phase anchor");
        }
      }
    const auto exact = ParticleClock::ConstantRateIntegral(1'234'567'891, 31.125f);
    Require(exact.whole == 38 && exact.fraction == 425'925'607'375,
        "constant rate integral failed independent exact rational golden");
    const auto neg = ParticleClock::ConstantRateIntegral(1'234'567'891, -31.125f);
    Require(neg.whole == -38 && neg.fraction == -425'925'607'375,
        "negative rate integral sign changed");
    const auto large = ParticleClock::ConstantRateIntegral(INT64_MAX,
        std::bit_cast<float>(1071675952U));
    Require(large.whole == 16'175'293'788 && large.fraction == 212'690'942'246,
        "128-bit rate integral failed exact long-time golden");
    Scene wrap(-1, false, 1);
    StepSystem(wrap.system, 900'000'000, ReanimClock::Add(OwnerTime(wrap.system), static_cast<std::int64_t>(900'000'000)));
    Require(wrap.Emitter()->mParticlesSpawned == 0, "fractional emission spawned early");
    StepSystem(wrap.system, 200'000'000, ReanimClock::Add(OwnerTime(wrap.system), static_cast<std::int64_t>(200'000'000)));
    Require(wrap.Emitter()->mParticlesSpawned == 1 &&
        wrap.Emitter()->mSpawnRemainder == 100'000'000'000, "constant emission phase wrap");
    Require(ParticleLifeAgeAt(OwnerTime(wrap.system), wrap.Emitter()->ParticleRosterParticleAt(0)->mBirthTimeNs, wrap.Emitter()->ParticleRosterParticleAt(0)->mParticleDurationNs) == 0,
        "endpoint emission birth received full outer dt");
}

void TestCrossfade()
{
    Scene scene;
    TodEmitterDefinition definitions[2]{scene.emitter, scene.emitter};
    FloatParameterTrackNode fade{0.0, 10, 10, 1, 1};
    definitions[1].mCrossFadeDuration = {&fade, 1};
    definitions[0].mOnDurationEmitterIndex = 1;
    scene.definition.mEmitterDefs = definitions;
    scene.definition.mEmitterDefCount = 2;
    scene.Emitter()->mEmitterDef = definitions;
    auto* source = scene.Spawn();
    source->mParticleDurationNs = 100'000'000;
    RefreshParticleLifeFraction(*source, OwnerTime(source->mParticleEmitter->mParticleSystem));
    source->mBirthTimeNs = OwnerTime(scene.system) - 90'000'000;
    RefreshParticleLifeFraction(*source, OwnerTime(source->mParticleEmitter->mParticleSystem));
    StepSystem(scene.system, 50'000'000, ReanimClock::Add(OwnerTime(scene.system), static_cast<std::int64_t>(50'000'000)));
    Require(scene.system->EmitterRosterCount() == 2, "OnDuration did not create target emitter");
    auto* target = scene.system->EmitterRosterEmitterAt(1);
    Require(target->ParticleRosterCount() == 1 &&
        ParticleLifeAgeAt(OwnerTime(scene.system), target->ParticleRosterParticleAt(0)->mBirthTimeNs, target->ParticleRosterParticleAt(0)->mParticleDurationNs) == 0 &&
        ParticleLifeAgeAt(OwnerTime(target->mParticleSystem), target->mBirthTimeNs, target->mSystemDurationNs) == 0, "duration target received hidden residual/full step");
    Require(ParticleLifeAgeAt(OwnerTime(source->mParticleEmitter->mParticleSystem), source->mBirthTimeNs, source->mParticleDurationNs) == 100'000'000,
        "nonloop crossfade source age did not clamp at duration");
    StepSystem(scene.system, 5'000'000, ReanimClock::Add(OwnerTime(scene.system), static_cast<std::int64_t>(5'000'000)));
    Require(ParticleLifeAgeAt(OwnerTime(scene.system), target->ParticleRosterParticleAt(0)->mBirthTimeNs, target->ParticleRosterParticleAt(0)->mParticleDurationNs) == 5'000'000,
        "crossfade target failed next actual delta");

    Scene existing(-1, false, 100);
    TodEmitterDefinition targetDef = existing.emitter;
    targetDef.mCrossFadeDuration = {&fade, 1};
    auto* targetEmitter = existing.holder.mEmitters.DataArrayAlloc();
    targetEmitter->TodEmitterInitialize(100, 200, existing.system, &targetDef, OwnerTime(existing.system));
    Require(existing.system->EmitterRosterAdd(targetEmitter), "target emitter roster full");
    existing.Emitter()->CrossFadeEmitter(targetEmitter, OwnerTime(existing.system));
    StepSystem(existing.system, 20'000'000, ReanimClock::Add(OwnerTime(existing.system), static_cast<std::int64_t>(20'000'000)));
    Require(existing.Emitter()->mCrossFadeEndTimeNs - OwnerTime(existing.system) == 80'000'000,
        "crossfade countdown did not use actual ns");
    existing.system->mDontUpdate = true;
    StepSystem(existing.system, 500'000'000, OwnerTime(existing.system) + 500'000'000);
    Require(existing.Emitter()->mCrossFadeEndTimeNs - OwnerTime(existing.system) == 80'000'000,
        "frozen fade deadline expired against the advancing visual clock");
    existing.system->mDontUpdate = false;
    Require(targetEmitter->ParticleRosterCount() >= 2, "crossfade source emitted no targets");
    for (int i = 0; i < targetEmitter->ParticleRosterCount(); ++i)
        Require(ParticleLifeAgeAt(OwnerTime(existing.system), targetEmitter->ParticleRosterParticleAt(i)->mBirthTimeNs, targetEmitter->ParticleRosterParticleAt(i)->mParticleDurationNs) == 0,
            "birth into existing later emitter was updated twice in main step");
    StepSystem(existing.system, 100'000'000, ReanimClock::Add(OwnerTime(existing.system), static_cast<std::int64_t>(100'000'000)));
    Require(existing.Emitter()->mParticlesSpawned == 10,
        "crossfade emission was not clipped to active fade time");
    StepSystem(existing.system, 5'000'000, ReanimClock::Add(OwnerTime(existing.system), static_cast<std::int64_t>(5'000'000)));
    Require(existing.Emitter()->mParticlesSpawned == 10,
        "completed crossfade source resumed emission");
}

void TestSystemPositionDeltas()
{
    FloatParameterTrackNode xNodes[]{{0.0, 3, 3, 1, 1}, {1.0, 13, 13, 1, 1}};
    FloatParameterTrackNode yNodes[]{{0.0, -5, -5, 1, 1}, {1.0, -17, -17, 1, 1}};
    FloatParameterTrackNode second[]{{0.0, .25f, .25f, 1, 1}, {1.0, 2.75f, 2.75f, 1, 1}};
    Scene scene;
    ParticleField fields[2]{};
    fields[0].mFieldType = fields[1].mFieldType = FIELD_SYSTEM_POSITION;
    fields[0].mX = {xNodes, 2};
    fields[0].mY = {yNodes, 2};
    fields[1].mX = fields[1].mY = {second, 2};
    scene.emitter.mSystemFields = {fields, 2};
    auto* emitter = scene.Emitter();
    emitter->TodEmitterInitialize(1000, -1000, scene.system, &scene.emitter, OwnerTime(scene.system));
    // Two authored position fields sum to (3.25 + 12.5*t, -4.75 - 9.5*t).
    // Birth applies the first sample once. Later calls add sample differences
    // to the current float center; they do not reconstruct an absolute origin.
    Near(emitter->mSystemCenter.x, 1003.25f, "birth omitted initial system-position sample");
    Near(emitter->mSystemCenter.y, -1004.75f, "birth omitted initial vertical sample");
    emitter->SampleSystemPosition(.25);
    Near(emitter->mSystemCenter.x, 1006.375f, "system-position x sample difference");
    Near(emitter->mSystemCenter.y, -1007.125f, "system-position y sample difference");
    emitter->mSystemCenter += SexyVector2(13, -7);
    emitter->SampleSystemPosition(.75);
    Near(emitter->mSystemCenter.x, 1025.625f, "system-position replaced an external center edit");
    Near(emitter->mSystemCenter.y, -1018.875f, "vertical sample replaced an external center edit");
    const auto held = emitter->mSystemCenter;
    emitter->SampleSystemPosition(.75);
    Require(emitter->mSystemCenter.x == held.x && emitter->mSystemCenter.y == held.y,
        "repeated system-position sample moved center twice");

    auto* particle = scene.Spawn();
    particle->mPosition = {10, 20};
    particle->mVelocity = {0, 0};
    const auto beforeMove = emitter->mSystemCenter;
    scene.system->SystemMove(50, 75);
    Near(emitter->mSystemCenter.x, 50, "SystemMove was deferred instead of immediate");
    Near(emitter->mSystemCenter.y, 75, "vertical SystemMove was deferred");
    Near(particle->mPosition.x, 10 + 50 - beforeMove.x, "following particle missed external move x");
    Near(particle->mPosition.y, 20 + 75 - beforeMove.y, "following particle missed external move y");
    emitter->SampleSystemPosition(1.0);
    Near(emitter->mSystemCenter.x, 53.125f, "external move reset the curve sample baseline");
    Near(emitter->mSystemCenter.y, 72.625f, "vertical external move reset the curve baseline");

    scene.emitter.mParticleFlags |= 1 << static_cast<int>(ParticleFlags::PARTICLE_PARTICLES_DONT_FOLLOW);
    const auto stationary = particle->mPosition;
    scene.system->SystemMove(-25, 40);
    Require(particle->mPosition.x == stationary.x && particle->mPosition.y == stationary.y,
        "DONT_FOLLOW particle moved with its emitter");
    Near(emitter->mSystemCenter.x, -25, "DONT_FOLLOW prevented emitter movement");
    Near(emitter->mSystemCenter.y, 40, "DONT_FOLLOW prevented vertical emitter movement");
    // Looping from the final authored sample to the first is a negative sample
    // difference, rather than an extra copy of the initial absolute offset.
    emitter->SampleSystemPosition(0.0);
    Near(emitter->mSystemCenter.x, -37.5f, "looped system-position x delta");
    Near(emitter->mSystemCenter.y, 49.5f, "looped system-position y delta");

    const auto beforeZero = Snapshot(scene);
    StepSystem(scene.system, 0, ReanimClock::Add(OwnerTime(scene.system), static_cast<std::int64_t>(0)));
    scene.system->mDontUpdate = true;
    StepSystem(scene.system, 17'123'457, ReanimClock::Add(OwnerTime(scene.system), static_cast<std::int64_t>(17'123'457)));
    Require(Snapshot(scene) == beforeZero, "paused/zero system-position update changed state");
    scene.system->mDontUpdate = false;
    emitter->mSystemPositionBound = 0;
    const auto beforeBinding = emitter->mSystemCenter;
    emitter->SampleSystemPosition(.5);
    Require(emitter->mSystemPositionBound == 1 &&
        emitter->mSystemCenter.x == beforeBinding.x && emitter->mSystemCenter.y == beforeBinding.y,
        "unbound system-position baseline replayed a saved offset");
    emitter->SampleSystemPosition(.75);
    Near(emitter->mSystemCenter.x, beforeBinding.x + 3.125f, "rebound system-position x delta");
    Near(emitter->mSystemCenter.y, beforeBinding.y - 2.375f, "rebound system-position y delta");
    std::cout << "PASS system-position sample deltas: birth, combined fields, public center edits, "
        "external moves, DONT_FOLLOW, loop, zero/pause and lazy baseline\n";
}

void TestLifeFractionRefresh()
{
    Scene scene;
    auto& particle = *scene.Spawn();
    particle.mBirthTimeNs=1'000; particle.mParticleDurationNs=3'000;
    RefreshParticleLifeFraction(particle,2'000);
    Require(particle.mParticleEmitter->mParticleSystem->mParticleHolder->mData->mParticleLifeFractions[particle.mParticleEmitter->mParticleSystem->mParticleHolder->mParticles.DataArrayIndexOf(&particle)] == 1.0/3.0, "particle cache lost double precision");
    RefreshParticleLifeFraction(particle,10'000);
    Require(particle.mParticleEmitter->mParticleSystem->mParticleHolder->mData->mParticleLifeFractions[particle.mParticleEmitter->mParticleSystem->mParticleHolder->mParticles.DataArrayIndexOf(&particle)] == 1.0, "particle cache failed endpoint clamp");
    RefreshParticleLifeFraction(particle,999);
    Require(particle.mParticleEmitter->mParticleSystem->mParticleHolder->mData->mParticleLifeFractions[particle.mParticleEmitter->mParticleSystem->mParticleHolder->mParticles.DataArrayIndexOf(&particle)] == -1.0, "particle cache failed prebirth sentinel");
    auto& emitter = *scene.Emitter();
    emitter.mBirthTimeNs=particle.mBirthTimeNs; emitter.mSystemDurationNs=3'000;
    RefreshParticleLifeFraction(emitter,2'000);
    Require(emitter.mParticleSystem->mParticleHolder->mData->mEmitterLifeFractions[emitter.mParticleSystem->mParticleHolder->mEmitters.DataArrayIndexOf(&emitter)] == 1.0/3.0, "emitter cache lost double precision");
}

void TestLifeFractionSideTableOwnership()
{
    Scene first, second;
    auto* a=first.Spawn(); auto* b=second.Spawn();
    auto& ah=*first.system->mParticleHolder;
    auto& bh=*second.system->mParticleHolder;
    const auto as=ah.mParticles.DataArrayIndexOf(a), bs=bh.mParticles.DataArrayIndexOf(b);
    Require(as==bs, "isolation fixture did not use matching slots");
    a->mBirthTimeNs=-100; a->mParticleDurationNs=1'000;
    b->mBirthTimeNs=-700; b->mParticleDurationNs=1'000;
    RefreshParticleLifeFraction(*a,0); RefreshParticleLifeFraction(*b,0);
    Require(ah.mData->mParticleLifeFractions[as]==.1 && bh.mData->mParticleLifeFractions[bs]==.7,
        "independent particle pools shared side cache");
    auto* ae=first.Emitter(); auto* be=second.Emitter();
    ae->mBirthTimeNs=-200; ae->mSystemDurationNs=1'000;
    be->mBirthTimeNs=-800; be->mSystemDurationNs=1'000;
    RefreshParticleLifeFraction(*ae,0); RefreshParticleLifeFraction(*be,0);
    Require(ah.mData->mEmitterLifeFractions[ah.mEmitters.DataArrayIndexOf(ae)]==.2 &&
        bh.mData->mEmitterLifeFractions[bh.mEmitters.DataArrayIndexOf(be)]==.8,
        "independent emitter pools shared side cache");
    TodParticleHolder alias(ah.mData);
    first.system->mParticleHolder=&alias;
    RefreshParticleLifeFraction(*a,400);
    first.system->mParticleHolder=&ah;
    Require(ah.mData->mParticleLifeFractions[as]==.5,
        "holders borrowing the same pool did not share cache");
    first.Emitter()->DeleteAll();
    auto* recycled=first.Spawn();
    Require(ah.mParticles.DataArrayIndexOf(recycled)==as &&
        ah.mData->mParticleLifeFractions[as]==0,
        "recycled particle slot retained old life cache");
    const auto emitterSlot=ah.mEmitters.DataArrayIndexOf(first.Emitter());
    first.system->ParticleSystemDie();
    ah.mParticleSystems.DataArrayFree(first.system);
    first.system=ah.AllocParticleSystemFromDef(100,200,0,&first.definition,ParticleEffect::PARTICLE_NONE, 0);
    Require(ah.mEmitters.DataArrayIndexOf(first.Emitter())==emitterSlot &&
        ah.mData->mEmitterLifeFractions[emitterSlot]==0,
        "recycled emitter slot retained old life cache");
}

void TestAbsoluteBirthClock()
{
    Scene scene;
    auto* p = scene.Spawn();
    p->mVelocity = {2, 0};
    p->mPosition = {0, 0};
    const auto birth = p->mBirthTimeNs;
    // Lifetime follows the supplied timestamp, while velocity integration uses delta.
    StepSystem(scene.system, 1'000'000, birth + 50'000'000);
    Require(p->mBirthTimeNs == birth &&
        ParticleLifeAgeAt(OwnerTime(scene.system), p->mBirthTimeNs, p->mParticleDurationNs) == 50'000'000,
        "lifetime accumulated delta instead of sampling the supplied timestamp");
    Near(p->mPosition.x, .2f, "simulation ignored the supplied integration delta");
    const auto emitterBirth = scene.Emitter()->mBirthTimeNs;
    scene.system->mDontUpdate = true;
    StepSystem(scene.system, 100'000'000, birth + 150'000'000);
    Require(p->mBirthTimeNs == birth + 100'000'000 &&
        scene.Emitter()->mBirthTimeNs == emitterBirth + 100'000'000,
        "local freeze did not translate birth origins");
    scene.system->mDontUpdate = false;
    StepSystem(scene.system, 1'000'000, birth + 151'000'000);
    Require(ParticleLifeAgeAt(OwnerTime(scene.system), p->mBirthTimeNs, p->mParticleDurationNs) == 51'000'000,
        "local freeze replayed elapsed wall time");
    StepSystem(scene.system, 0, birth + 500'000'000);
    Require(ParticleLifeAgeAt(OwnerTime(scene.system), p->mBirthTimeNs, p->mParticleDurationNs) == 51'000'000,
        "paused board clock translation changed particle age");
}

void TestContinuation()
{
    Scene original(0, true), resumed(0, true);
    std::uint32_t random = 1;
    Advance(original, 123'456'789, 144, random);
    auto* from = original.Emitter();
    auto* to = resumed.Emitter();
    to->DeleteAll();
    for (int i = 0; i < from->ParticleRosterCount(); ++i)
    {
        auto* copy = resumed.Spawn();
        *copy = *from->ParticleRosterParticleAt(i);
        copy->mParticleEmitter = to;
    }
    to->mBirthTimeNs = from->mBirthTimeNs;
    OwnerTime(resumed.system) = OwnerTime(original.system);
    RefreshParticleLifeFraction(*to, OwnerTime(resumed.system));
    for (int i=0; i<to->ParticleRosterCount(); ++i)
        RefreshParticleLifeFraction(*to->ParticleRosterParticleAt(i), OwnerTime(resumed.system));
    to->mSystemPositionOriginX = from->mSystemPositionOriginX;
    to->mSystemPositionOriginY = from->mSystemPositionOriginY;
    to->mSystemPositionBound = from->mSystemPositionBound;
    to->mSpawnRemainder = from->mSpawnRemainder;
    to->mParticlesSpawned = from->mParticlesSpawned;
    to->mSystemCenter = from->mSystemCenter;
    resumed.system->mRandomState = original.system->mRandomState;
    Require(Snapshot(resumed) == Snapshot(original), "copied continuation state differs");
    for (auto delta : {1ULL, 1'234'567ULL, 35'555'555ULL})
    {
        StepSystem(original.system, delta, ReanimClock::Add(OwnerTime(original.system), static_cast<std::int64_t>(delta)));
        StepSystem(resumed.system, delta, ReanimClock::Add(OwnerTime(resumed.system), static_cast<std::int64_t>(delta)));
        Require(Snapshot(resumed) == Snapshot(original), "particle state failed saved-field continuation");
    }
}
}

int main()
{
    try
    {
        FloatParameterTrackNode rationalNodes[]{
            {0.0, 0, 0, 1, 1}, {1.0 / 3.0, 1, 1, 1, 1},
            {1.0, 2, 2, 1, 1}};
        FloatParameterTrack rational{rationalNodes, 3};
        Require(FloatTrackEvaluate(rational, 1.0 / 3.0, 0.0f) == 1.0f,
            "implicit third was rounded to thousandths");
        Require(FloatTrackEvaluate(rational, 2.0 / 3.0, 0.0f) == 1.5f,
            "rational-node interpolation changed");
        FloatParameterTrackNode preciseNode[]{ {0.0, 0.123456789f, 0.123456789f, 1, 1} };
        FloatParameterTrack precise{preciseNode, 1};
        Require(FloatTrackEvaluate(precise, 0.5, 0.0f) == 0.123456789f,
            "ordinary authored float was quantized to thousandths");
        // Expected values were calculated independently with arbitrary-precision
        // integer arithmetic from the exact IEEE-754 source bits.
        const struct { std::uint32_t rateBits; std::int64_t elapsed, phase; } phaseCases[]{
            {1071675952U, 1'234'567'891, 165'097'348'195},
            {3219159600U, 1'234'567'891, 834'902'651'805},
            {1071675952U, 9'007'199'254'740'993, 340'051'457'753},
            {3219159600U, 9'223'372'036'854'775'807, 787'309'057'754},
            {507307272U, 9'223'372'036'854'775'807, 92},
            {1621981420U, 9'223'372'036'854'775'807, 150'357'504'000},
            {1U, 9'223'372'036'854'775'807, 0}
        };
        for (const auto& test : phaseCases)
        {
            preciseNode[0].mLow = preciseNode[0].mHigh = std::bit_cast<float>(test.rateBits);
            TodParticle clock{};
            clock.mAnimationBirthTimeNs = 0 - (test.elapsed);
            clock.mAnimationSampleIntegral = 17;
            Require(TodParticleAnimationPhase(clock, precise, 0) ==
                (test.phase + 17) % 1'000'000'000'000LL,
                "constant float animation rate lost precision in total elapsed phase");
        }
        TestDiscreteMotion();
        TestActualDelta();
        TestLifetimesAndTracks();
        TestExplicitParticleTime();
        TestEmission();
        TestCrossfade();
        TestSystemPositionDeltas();
        TestContinuation();
        TestAbsoluteBirthClock();
        TestLifeFractionRefresh();
        TestLifeFractionSideTableOwnership();
        std::cout << "Particle v7 production runtime: actual-delta fields, ns lifetimes, "
            "8-schedule exact constant emission, zero/pause/input behavior, endpoint "
            "crossfades, continuation and exact long-time animation phase passed.\n";
        return 0;
    }
    catch (const std::exception& error)
    {
        std::cerr << "FAIL particle v7: " << error.what() << '\n';
        return 1;
    }
}
