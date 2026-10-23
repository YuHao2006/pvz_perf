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
#include <cstdarg>
#include <iostream>
#include <stdexcept>
#include <string>
#include <vector>

namespace
{
unsigned globalRandomCalls;
float Linear(float t, float a, float b) { return a + (b - a) * t; }
float Constant(float, float a, float) { return a; }
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
TodCurveEvalFn TodCurveResolveEval(int curve)
{
    if (curve == 0 || curve == 8) return Constant;
    if (curve == 1) return Linear;
    throw std::runtime_error("fixture contains unsupported curve");
}

namespace
{
struct Scene
{
    FloatParameterTrackNode values[12]{
        {0, 1, 300.0f, 300.0f, 1, 1}, // system 300 ticks
        {0, 1, 130.125f, 130.125f, 1, 1}, // particle 130.125 ticks
        {0, 1, 31.125f, 31.125f, 1, 1},
        {1, 3, 127.5f, 127.5f, 1, 1},
        {1, 1, 17.75f, 17.75f, 1, 1},
        {0, 1, -1.0f, -1.0f, 1, 1}, // unconstrained active count
        {0, 1, 100.0f, 250.0f, 1, 1}, // launch speed
        {0, 1, -180.0f, 180.0f, 1, 1},
        {0, 1, 1.7537289f, 1.7537289f, 1, 1}, // image cycles / sec
        {0, 1, 0.8f, 0.8f, 1, 1},
        {0, 1, 0.02f, 0.02f, 1, 1},
        {0, 1, 3.0f, 3.0f, 1, 1}
    };
    ParticleField fields[4]{};
    ParticleField systemField{};
    TodEmitterDefinition emitter{};
    TodParticleDefinition definition{};
    TodParticleData data;
    TodParticleHolder holder{&data};
    TodParticleSystem* system;
    explicit Scene(int fieldSet, bool loop)
    {
        emitter.mSystemDuration = {values, 1};
        emitter.mParticleDuration = {values + 1, 1};
        emitter.mSpawnRate = {values + 2, 3};
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
            fields[i].mFieldType = sets[fieldSet][i];
            fields[i].mX = {values + (fields[i].mFieldType == FIELD_FRICTION ? 10 : 11), 1};
            fields[i].mY = fields[i].mX;
        }
        emitter.mParticleFields = {fields, 4};
        systemField.mFieldType = FIELD_SYSTEM_POSITION;
        systemField.mX = {values + 11, 1};
        systemField.mY = systemField.mX;
        emitter.mSystemFields = {&systemField, 1};
        definition.mEmitterDefs = &emitter;
        definition.mEmitterDefCount = 1;
        definition.mVariantCount = 1;
        data.Initialize();
        system = holder.AllocParticleSystemFromDef(100, 200, 0, &definition,
            ParticleEffect::PARTICLE_NONE);
    }
};

std::vector<std::uint64_t> Snapshot(const Scene& scene)
{
    std::vector<std::uint64_t> result;
    auto integer = [&](auto n) { result.push_back(static_cast<std::uint64_t>(n)); };
    auto number = [&](float n) { integer(std::bit_cast<std::uint32_t>(n)); };
    auto vector = [&](const SexyVector2& n) { number(n.x); number(n.y); };
    integer(scene.system->mSimulationRemainderNs);
    integer(scene.system->mRandomState);
    integer(scene.system->mDead);
    integer(scene.system->EmitterRosterCount());
    for (int e = 0; e < scene.system->EmitterRosterCount(); ++e)
    {
        const auto& emitter = *scene.system->EmitterRosterEmitterAt(e);
        integer(emitter.mSystemAge.mNanoseconds);
        integer(emitter.mSystemDuration.mNanoseconds);
        integer(emitter.mSystemSampleAgeNs);
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
            integer(particle.mParticleSampleAgeNs);
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
        // Deliberately corrupt the old outer-frame scaling inputs: the
        // production fixed-step simulation must not read them.
        Sexy::gUpdateTicks = static_cast<double>(delta) / 10'000'000;
        Sexy::gUpdateIntervalNs = delta;
        scene.system->Update(delta);
        remaining -= delta;
    }
}

std::vector<std::uint64_t> Run(int frequency, int fields, bool loop, float animationRate)
{
    Scene scene(fields, loop);
    scene.values[8].mLow = scene.values[8].mHigh = animationRate;
    std::uint32_t partitionRandom = 0x7171U;
    std::vector<std::uint64_t> checkpoints;
    auto checkpoint = [&] {
        const auto state = Snapshot(scene);
        checkpoints.push_back(state.size());
        checkpoints.insert(checkpoints.end(), state.begin(), state.end());
    };
    // The same external event timeline is split explicitly in every run.
    Advance(scene, 777'777'777, frequency, partitionRandom);
    checkpoint();
    scene.system->SystemMove(-128, 64);
    Advance(scene, 1'222'222'223, frequency, partitionRandom);
    checkpoint();
    scene.system->SystemMove(512, -256);
    Advance(scene, 3'123'456'789, frequency, partitionRandom);
    checkpoint();
    return checkpoints;
}
}

int main()
{
    try
    {
        FloatParameterTrackNode rationalNodes[]{
            {0, 1, 0, 0, 1, 1}, {1, 3, 1, 1, 1, 1},
            {1, 1, 2, 2, 1, 1}};
        FloatParameterTrack rational{rationalNodes, 3};
        Require(FloatTrackEvaluate(rational, 1.0 / 3.0, 0.0f) == 1.0f,
            "implicit third was rounded to thousandths");
        Require(FloatTrackEvaluate(rational, 2.0 / 3.0, 0.0f) == 1.5f,
            "rational-node interpolation changed");
        FloatParameterTrackNode preciseNode[]{ {0, 1, 0.123456789f, 0.123456789f, 1, 1} };
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
        for (float rate : {1.7537289f, -1.7537289f})
          for (int fields = 0; fields < 3; ++fields)
            for (bool loop : {false, true})
            {
                const auto reference = Run(100, fields, loop, rate);
                for (int frequency : {30, 60, 144, 200, 240, 1000, 0})
                    Require(Run(frequency, fields, loop, rate) == reference,
                        "canonical particle state differs across outer partitions");
            }
        Scene one(0, false);
        const auto before = Snapshot(one);
        const auto randomBefore = globalRandomCalls;
        one.system->Update(0);
        Require(Snapshot(one) == before, "zero delta changed particle state");
        one.system->Update(1);
        Require(one.system->mSimulationRemainderNs == 1, "substep remainder lost");
        Require(globalRandomCalls == randomBefore, "substep consumed global random");
        Require(one.emitter.mParticleDuration.mNodes[0].mLow == 130.125f,
            "authored particle duration mutated");
        Require(one.system->EmitterRosterEmitterAt(0)->mSystemDuration.mNanoseconds == 3'000'000'000,
            "system duration lost nanoseconds");
        std::uint32_t partitionRandom = 1;
        Advance(one, 1'000'000'000, 240, partitionRandom);
        const auto* live = one.system->EmitterRosterEmitterAt(0);
        Require(live->ParticleRosterCount() > 0, "fixture emitted no particles");
        const auto* particle = live->ParticleRosterParticleAt(0);
        Require(particle->mParticleDuration.mNanoseconds == 1'301'250'000,
            "fractional authored duration was truncated to ticks");
        Require(particle->mAnimationElapsedNs > 0 && particle->mAnimationSampleIntegral == 0,
            "constant image rate accumulated phase");
        Scene variable(0, false);
        FloatParameterTrackNode animationCurve[]{
            {0, 1, 1.7537289f, 1.7537289f, 1, 1},
            {1, 1, 3.7521133f, 3.7521133f, 1, 1}};
        variable.emitter.mAnimationRate = {animationCurve, 2};
        Advance(variable, 123'456'789, 144, partitionRandom);
        const auto variableReference = Snapshot(variable);
        Scene variableOther(0, false);
        variableOther.emitter.mAnimationRate = {animationCurve, 2};
        Advance(variableOther, 123'456'789, 30, partitionRandom);
        Require(Snapshot(variableOther) == variableReference,
            "varying image-rate sampled integral depends on outer partition");
        std::cout << "Particle v7 production runtime: exact partition states passed "
            "(3 field sets, loops, 8 schedules, rational nodes, substeps, float rates "
            "and exact long-time animation phase).\n";
        return 0;
    }
    catch (const std::exception& error)
    {
        std::cerr << "FAIL particle v7: " << error.what() << '\n';
        return 1;
    }
}
