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
void TodTrace(const char*, ...) {}
void TodTraceAndLog(const char*, ...) {}
void TodTraceWithoutSpamming(const char*, ...) {}
void TodScaleRotateTransformMatrix(Sexy::SexyMatrix3&, float, float, float, float, float)
{
    throw std::runtime_error("unexpected rendering");
}
TodTriangleGroup::TodTriangleGroup() {}
void TodTriangleGroup::DrawGroup(Sexy::Graphics*) { throw std::runtime_error("unexpected rendering"); }
void TodTriangleGroup::AddTriangle(Sexy::Graphics*, const Sexy::TextureSource&,
    const Sexy::SexyMatrix3&, const Sexy::Rect&, const Sexy::Color&, int, const Sexy::Rect&)
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
            ParticleEffect::PARTICLE_NONE);
    }
    TodParticleEmitter* Emitter() const { return system->EmitterRosterEmitterAt(0); }
    TodParticle* Spawn() { return Emitter()->SpawnParticle(0, 1); }
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
        integer(emitter.mSystemAge.mNanoseconds);
        integer(emitter.mSystemDuration.mNanoseconds);
        integer(emitter.mEmissionElapsedNs);
        integer(emitter.mSystemLastSampleAgeNs);
        integer(emitter.mSpawnRemainder);
        integer(emitter.mParticlesSpawned);
        integer(emitter.mDead);
        vector(emitter.mSystemCenter);
        vector(emitter.mExternalTarget);
        vector(emitter.mExternalAppliedCenter);
        integer(emitter.ParticleRosterCount());
        for (int p = 0; p < emitter.ParticleRosterCount(); ++p)
        {
            const auto& particle = *emitter.ParticleRosterParticleAt(p);
            integer(particle.mParticleDuration.mNanoseconds);
            integer(particle.mParticleAge.mNanoseconds);
            integer(particle.mParticleLastSampleAgeNs);
            integer(particle.mAnimationElapsedNs);
            integer(particle.mAnimationSampleIntegral);
            integer(TodParticleAnimationPhase(particle, emitter.mEmitterDef->mAnimationRate));
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
        scene.system->Update(delta);
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
    Require(p->mParticleAge.mNanoseconds == 0 && p->mAnimationElapsedNs == 0,
        "birth received hidden time");
    p->mPosition = {0, 0};
    p->mVelocity = {2, -4};
    scene.system->Update(1'250'000);
    Require(p->mParticleAge.mNanoseconds == 1'250'000, "sub-10ms lifetime did not advance");
    Near(p->mPosition.x, 0.25f, "sub-10ms velocity displacement");
    Near(p->mPosition.y, -0.5f, "sub-10ms vertical displacement");
    Require(p->mAnimationElapsedNs == 1'250'000, "sub-10ms animation did not advance");
    const auto globalBefore = globalRandomCalls;
    scene.system->SystemMove(150, 275);
    const auto held = Snapshot(scene);
    scene.system->Update(0);
    Require(Snapshot(scene) == held, "zero update sampled input/state/RNG");
    scene.system->mDontUpdate = true;
    scene.system->Update(123'456'789);
    Require(Snapshot(scene) == held, "paused update sampled input/state/RNG");
    Require(globalBefore == globalRandomCalls, "updates consumed global RNG");
    scene.system->mDontUpdate = false;
    scene.system->Update(1'000'000);
    Near(p->mPosition.x, 50.45f, "held move was not applied once");
    Near(p->mPosition.y, 74.1f, "held move vertical displacement");
    scene.system->Update(1'000'000);
    Near(p->mPosition.x, 50.65f, "held move was applied twice");
    Require(scene.Emitter()->mSystemAge.mNanoseconds == 3'250'000,
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
    acceleration.system->Update(2'500'000);
    Near(a->mVelocity.x, 0.02f, "acceleration did not scale with dt");
    Near(a->mVelocity.y, -0.01f, "vertical acceleration did not scale with dt");

    Scene attractor;
    Field(attractor, FIELD_ATTRACTOR, 3, 0);
    auto* b = attractor.Spawn();
    b->mPosition = {110, 200};
    b->mVelocity = {0, 0};
    attractor.system->Update(50'000'000);
    Near(b->mVelocity.x, -0.35f, "main step was split into private force steps");
    Near(b->mPosition.x, 108.25f, "main step did not use a single field pass");

    Scene friction;
    Field(friction, FIELD_FRICTION, 0.2f, 1.0f);
    auto* f = friction.Spawn();
    f->mVelocity = {4, 5};
    friction.Emitter()->UpdateParticle(f, 0);
    Near(f->mVelocity.y, 5, "friction 1 changed velocity at zero dt");
    friction.system->Update(25'000'000);
    Near(f->mVelocity.x, 4 * std::pow(0.8f, 2.5f), "friction did not exponentiate by dt");
    Near(f->mVelocity.y, 0, "friction 1 did not stop velocity");
    Scene frictionSplit;
    Field(frictionSplit, FIELD_FRICTION, 0.2f, 1);
    auto* fs = frictionSplit.Spawn();
    fs->mVelocity = {4, 5};
    frictionSplit.system->Update(7'000'000);
    frictionSplit.system->Update(18'000'000);
    Near(fs->mVelocity.x, f->mVelocity.x, "constant friction composition changed");

    Scene spin;
    spin.emitter.mParticleSpinSpeed = {spin.values + 11, 1};
    auto* s = spin.Spawn();
    s->mSpinVelocity = 0.4f;
    spin.system->Update(50'000'000);
    Near(s->mSpinPosition, 2 + 0.15f * 3.14159265358979323846f / 180,
        "spin speed or collision spin did not scale with dt");
}

void TestLifetimesAndTracks()
{
    Scene scene;
    auto* p = scene.Spawn();
    Require(p->mParticleDuration.mNanoseconds == 1'301'250'000,
        "fractional authored duration was truncated");
    scene.system->Update(1'301'249'999);
    Require(scene.Emitter()->ParticleRosterCount() == 1, "particle died before ns boundary");
    scene.system->Update(1);
    Require(scene.Emitter()->ParticleRosterCount() == 0, "particle survived exact duration boundary");

    Scene looping(-1, true);
    auto* loop = looping.Spawn();
    loop->mParticleDuration.mNanoseconds = 12'345'679;
    looping.system->Update(40'000'000);
    Require(loop->mParticleAge.mNanoseconds == 2'962'963, "particle loop lost ns overshoot");
    Require(loop->mAnimationElapsedNs == 40'000'000, "loop reset animation elapsed");
    looping.Emitter()->mSystemDuration.mNanoseconds = 17'000'003;
    looping.system->Update(50'000'000);
    Require(looping.Emitter()->mSystemAge.mNanoseconds == 4'999'985,
        "emitter loop lost ns overshoot");
    Require(looping.Emitter()->mEmissionElapsedNs == 90'000'000,
        "emitter loop reset emission clock");

    Scene position;
    FloatParameterTrackNode offsets[]{{0.0, 3, 3, 1, 1}, {1.0, 13, 13, 1, 1}};
    Field(position, FIELD_POSITION, 0, 0);
    position.fields[0].mX = {offsets, 2};
    auto* q = position.Spawn();
    Near(q->mPosition.x, 103, "birth offset was not sampled at zero age");
    q->mParticleDuration.mNanoseconds = 100'000'000;
    position.system->Update(25'000'000);
    Near(q->mPosition.x, 105.5f, "lifetime fraction did not use full duration");
    FloatParameterTrackNode rates[]{{0.0, 1, 1, 1, 1}, {1.0, 3, 3, 1, 1}};
    position.emitter.mAnimationRate = {rates, 2};
    position.system->Update(25'000'000);
    Require(q->mAnimationSampleIntegral == 50'000'000'000,
        "variable animation rate did not integrate actual dt");

    Scene random;
    random.emitter.mParticleFlags |= 1 << static_cast<int>(ParticleFlags::PARTICLE_RANDOM_START_TIME);
    auto* r = random.Spawn();
    Require(r->mParticleAge.mNanoseconds >= 0 &&
        r->mParticleAge < r->mParticleDuration &&
        r->mParticleAge.mNanoseconds % 10'000'000 != 0,
        "random initial age retained legacy tick grid");
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
            Require(scene.Emitter()->mEmissionElapsedNs == elapsed,
                "emission clock lost actual elapsed time across loops");
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
    wrap.system->Update(900'000'000);
    Require(wrap.Emitter()->mParticlesSpawned == 0, "fractional emission spawned early");
    wrap.system->Update(200'000'000);
    Require(wrap.Emitter()->mParticlesSpawned == 1 &&
        wrap.Emitter()->mSpawnRemainder == 100'000'000'000, "constant emission phase wrap");
    Require(wrap.Emitter()->ParticleRosterParticleAt(0)->mParticleAge.mNanoseconds == 0,
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
    source->mParticleDuration.mNanoseconds = 100'000'000;
    source->mParticleAge.mNanoseconds = 90'000'000;
    scene.system->Update(50'000'000);
    Require(scene.system->EmitterRosterCount() == 2, "OnDuration did not create target emitter");
    auto* target = scene.system->EmitterRosterEmitterAt(1);
    Require(target->ParticleRosterCount() == 1 &&
        target->ParticleRosterParticleAt(0)->mParticleAge.mNanoseconds == 0 &&
        target->mSystemAge.mNanoseconds == 0, "duration target received hidden residual/full step");
    Require(source->mParticleAge.mNanoseconds == 100'000'000,
        "nonloop crossfade source age did not clamp at duration");
    scene.system->Update(5'000'000);
    Require(target->ParticleRosterParticleAt(0)->mParticleAge.mNanoseconds == 5'000'000,
        "crossfade target failed next actual delta");

    Scene existing(-1, false, 100);
    TodEmitterDefinition targetDef = existing.emitter;
    targetDef.mCrossFadeDuration = {&fade, 1};
    auto* targetEmitter = existing.holder.mEmitters.DataArrayAlloc();
    targetEmitter->TodEmitterInitialize(100, 200, existing.system, &targetDef);
    Require(existing.system->EmitterRosterAdd(targetEmitter), "target emitter roster full");
    existing.Emitter()->CrossFadeEmitter(targetEmitter);
    existing.system->Update(20'000'000);
    Require(existing.Emitter()->mEmitterCrossFadeCountDown.mNanoseconds == 80'000'000,
        "crossfade countdown did not use actual ns");
    Require(targetEmitter->ParticleRosterCount() >= 2, "crossfade source emitted no targets");
    for (int i = 0; i < targetEmitter->ParticleRosterCount(); ++i)
        Require(targetEmitter->ParticleRosterParticleAt(i)->mParticleAge.mNanoseconds == 0,
            "birth into existing later emitter was updated twice in main step");
    existing.system->Update(100'000'000);
    Require(existing.Emitter()->mEmissionElapsedNs == 100'000'000 &&
        existing.Emitter()->mParticlesSpawned == 10,
        "crossfade emission was not clipped to active fade time");
    existing.system->Update(5'000'000);
    Require(existing.Emitter()->mEmissionElapsedNs == 100'000'000 &&
        existing.Emitter()->mParticlesSpawned == 10,
        "completed crossfade source resumed emission");
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
    to->mSystemAge = from->mSystemAge;
    to->mSystemLastSampleAgeNs = from->mSystemLastSampleAgeNs;
    to->mEmissionElapsedNs = from->mEmissionElapsedNs;
    to->mSpawnRemainder = from->mSpawnRemainder;
    to->mParticlesSpawned = from->mParticlesSpawned;
    to->mSystemCenter = from->mSystemCenter;
    to->mExternalTarget = from->mExternalTarget;
    to->mExternalAppliedCenter = from->mExternalAppliedCenter;
    resumed.system->mRandomState = original.system->mRandomState;
    Require(Snapshot(resumed) == Snapshot(original), "copied continuation state differs");
    for (auto delta : {1ULL, 1'234'567ULL, 35'555'555ULL})
    {
        original.system->Update(delta);
        resumed.system->Update(delta);
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
            clock.mAnimationElapsedNs = test.elapsed;
            clock.mAnimationSampleIntegral = 17;
            Require(TodParticleAnimationPhase(clock, precise) ==
                (test.phase + 17) % 1'000'000'000'000LL,
                "constant float animation rate lost precision in total elapsed phase");
        }
        TestActualDelta();
        TestLifetimesAndTracks();
        TestEmission();
        TestCrossfade();
        TestContinuation();
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
