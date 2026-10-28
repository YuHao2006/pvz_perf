// Compare the original velocity/integration arithmetic with the actual current
// root-motion evaluator, using the current game's authored _ground keyframes.
#define WIN32_LEAN_AND_MEAN
#define NOMINMAX
#include <windows.h>
#include "LawnApp.h"
#include "Sexy.TodLib/Reanimator.h"
#include "Sexy.TodLib/ReanimClock.h"
#include "Sexy.TodLib/generated/GeneratedDefinitions.h"
#include <algorithm>
#include <array>
#include <bit>
#include <cmath>
#include <cstdio>
#include <filesystem>
#include <stdexcept>

bool (*gAppCloseRequest)();
namespace {
volatile unsigned long long sink;
constexpr int Updates = 2'000'000;
constexpr long long StepNs = 10'000'000;
constexpr float Origin = 900;

void Require(bool value, const char* message) { if (!value) throw std::runtime_error(message); }

struct Scenario {
    Reanimation animation;
    const ReanimatorSourceTransform* keys = nullptr;
    const char* name;
    float rate;
    int start = 0, count = 0;
    Scenario(ReanimationType type, const char* label, float animationRate) : name(label), rate(animationRate) {
        animation.mReanimationType = type;
        animation.mDefinition = &GeneratedDefinitions::Reanimations[int(type)];
        animation.mDead = true; // Borrow definition only; no instance tracks/attachments to destroy.
        animation.GetFramesForLayer(ReanimTrackId::anim_walk, start, count);
        const auto index = animation.FindTrackIndex(ReanimTrackId::_ground);
        keys = animation.mDefinition->mTracks.tracks[index].mTransforms.mTransforms;
        Require(keys && count > 1, "Walking action needs CPU ground keyframes");
        animation.mFrameStart = start;
        animation.mFrameCount = count;
        animation.mAnimRate = rate;
        animation.mPeriodNs = ReanimClock::PeriodFromRate(count, rate);
        animation.mLoopType = ReanimLoopType::REANIM_LOOP;
    }
};

// Original GetFrameTime/GetTrackVelocity arithmetic with the ground track
// already resolved. Phase advancement is included by LegacyStep below.
float LegacyVelocity(const Scenario& s, float phase, float seconds) {
    const float position = s.start + phase * (s.count - 1);
    const int before = int(std::floor(position));
    const int after = std::min(before + 1, s.start + s.count - 1);
    return (s.keys[after].mTransX - s.keys[before].mTransX) * seconds * s.rate;
}

// Same current arithmetic, excluding the public method's MPHF track lookup.
double ResolvedRoot(const Scenario& s, long long now) {
    const auto sampled = s.animation.SamplePlaybackAt(now);
    unsigned long long fraction;
    const auto frame = ReanimClock::MulDiv(sampled.phaseNs, s.count - 1,
        s.animation.mPeriodNs, &fraction);
    const int before = s.start + int(std::min<unsigned long long>(frame, s.count - 1));
    const int after = std::min(before + 1, s.start + s.count - 1);
    return ReanimClock::RootSampleFloat(s.count, false, s.animation.mPeriodNs, sampled.cycles,
        s.keys[s.start].mTransX, s.keys[before].mTransX, s.keys[after].mTransX,
        s.keys[s.start + s.count - 1].mTransX, fraction, -1);
}

// Independent long-double reference; no runtime clock/mul-div helpers.
long double Reference(const Scenario& s, long long now) {
    const auto period = s.animation.mPeriodNs;
    const auto cycles = now / period, remainder = now % period;
    const long double local = static_cast<long double>(remainder) * (s.count - 1) / period;
    const int frame = int(local);
    const auto before = static_cast<long double>(s.keys[s.start + frame].mTransX);
    const auto after = static_cast<long double>(s.keys[s.start + std::min(frame + 1, s.count - 1)].mTransX);
    const auto first = static_cast<long double>(s.keys[s.start].mTransX);
    const auto last = static_cast<long double>(s.keys[s.start + s.count - 1].mTransX);
    return Origin - (cycles * (last - first) + before - first + (after - before) * (local - frame)) * s.count / (s.count - 1);
}

struct LegacyState { float phase = 0, x = Origin; };
__declspec(noinline) float LegacyStep(Scenario& s, LegacyState& state, long long) {
    state.phase += 0.01f * s.rate / s.count;
    while (state.phase >= 1) state.phase -= 1;
    state.x -= LegacyVelocity(s, state.phase, 0.01f);
    return state.x;
}
__declspec(noinline) float CurrentStep(Scenario& s, LegacyState&, long long now) {
    s.animation.mLastUpdateTimeNs = now;
    return float(Origin + s.animation.RootMotion(ReanimTrackId::_ground, -1));
}
__declspec(noinline) float ResolvedStep(Scenario& s, LegacyState&, long long now) {
    return float(Origin + ResolvedRoot(s, now));
}
__declspec(noinline) float CurrentLocalStep(Scenario& s, LegacyState&, long long now) {
    // Measure the common period-local anchor separately. Same input modulo in
    // both before/after binaries; this is not an extra production operation.
    now %= s.animation.mPeriodNs;
    s.animation.mLastUpdateTimeNs = now;
    return float(Origin + s.animation.RootMotion(ReanimTrackId::_ground, -1));
}
using Step = float (*)(Scenario&, LegacyState&, long long);
__declspec(noinline) unsigned long long Run(Scenario& s, Step step) {
    // Identical call barrier prevents LTCG from hoisting a fixed track lookup
    // out of millions of iterations. Include this barrier in all three paths.
    Step volatile query = step;
    LegacyState state;
    unsigned long long hash = 0;
    for (int i = 0; i < Updates; ++i) {
        const float x = query(s, state, (i + 1LL) * StepNs);
        hash += std::bit_cast<unsigned int>(x);
    }
    return hash;
}

void Measure(Scenario& scenario, const char* name, Step step) {
    const auto expected = Run(scenario, step);
    LARGE_INTEGER frequency, begin, end;
    QueryPerformanceFrequency(&frequency);
    for (int round = 0; round < 5; ++round) {
        QueryPerformanceCounter(&begin);
        const auto hash = Run(scenario, step);
        QueryPerformanceCounter(&end);
        Require(hash == expected, "Movement checksum changed between rounds");
        sink = hash;
        std::printf("%s,%s,%g,%d,%d,%.6f,%llu\n", name, scenario.name, scenario.rate,
            round, Updates, (end.QuadPart - begin.QuadPart) * 1e9 / frequency.QuadPart / Updates, hash);
    }
    std::fflush(stdout);
}

void Accuracy(Scenario& s, FILE* output) {
    constexpr long long duration = 60'000'000'000LL;
    static constexpr int frequencies[]{100, 120, 200, 240, 1000};
    float invariant = 0;
    for (const int fps : frequencies) {
        long long now = 0;
        float phase = 0, legacy = Origin, current = Origin;
        while (now < duration) {
            const auto step = std::min(1'000'000'000LL / fps, duration - now);
            now += step;
            const float seconds = float(step) / 1'000'000'000.0f;
            phase += seconds * s.rate / s.count;
            while (phase >= 1) phase -= 1;
            legacy -= LegacyVelocity(s, phase, seconds);
            s.animation.mLastUpdateTimeNs = now;
            current = float(Origin + s.animation.RootMotion(ReanimTrackId::_ground, -1));
        }
        const auto reference = Reference(s, duration);
        Require(std::isfinite(legacy) && std::isfinite(current), "Nonfinite movement output");
        Require(std::abs(static_cast<long double>(current) - reference) <= 0.002L,
            "Current root differs from independent reference");
        if (fps == 100) invariant = current;
        Require(current == invariant, "Current final position changes with timestep");
        std::fprintf(output, "%s,%d,%lld,%.9g,%.9g,%.12Lg,%.12Lg,%.12Lg\n",
            s.name, fps, duration, legacy, current, reference,
            std::abs(static_cast<long double>(legacy) - reference),
            std::abs(static_cast<long double>(current) - reference));
    }
}
void CheckPhaseAndGroundIndices() {
    for (unsigned int type = 0; type < gReanimGroundTrackIndices.size(); ++type) {
        const auto& definition = GeneratedDefinitions::Reanimations[type];
        int expected = -1;
        for (int track = 0; track < definition.mTracks.count; ++track)
            if (definition.mTracks.tracks[track].mTrackId == ReanimTrackId::_ground) {
                expected = track;
                break;
            }
        Require(gReanimGroundTrackIndices[type] == expected, "Ground table differs from first authored track");
    }
    Reanimation probe;
    probe.mDead = true;
    probe.mFrameCount = 17;
    probe.mStartTimeNs = 1'000'000'000'000LL;
    probe.mPeriodNs = 1'000'000'007LL;
    for (const auto loop : {REANIM_LOOP, REANIM_LOOP_FULL_LAST_FRAME, REANIM_PLAY_ONCE_AND_HOLD})
    for (const auto rate : {-12.0f, 0.0f, 12.0f})
    for (const long long origin : {0LL, 123LL, probe.mPeriodNs})
    for (const long long cycles : {-2LL, 0LL, 3LL})
    for (const long long delta : {-2*probe.mPeriodNs-1, -1LL, 0LL, 1LL,
        probe.mPeriodNs-1, probe.mPeriodNs, 2*probe.mPeriodNs+1})
    for (const long long offset : {-999LL, 0LL, 999LL}) {
        probe.mLoopType = loop;
        probe.mAnimRate = rate;
        probe.mPhaseOriginNs = origin;
        probe.mOriginCycleCount = cycles;
        long long phase, expectedCycles;
        const auto now = probe.mStartTimeNs + delta;
        ReanimClock::SampleAt(now+offset, probe.mStartTimeNs, origin, cycles,
            probe.mPeriodNs, rate == 0 ? 0 : (rate > 0 ? 1 : -1), phase, expectedCycles);
        if (loop != REANIM_LOOP && loop != REANIM_LOOP_FULL_LAST_FRAME && expectedCycles != 0) {
            phase = expectedCycles > 0 ? probe.mPeriodNs : 0;
            expectedCycles = 0;
        }
        const auto actual = probe.SamplePlaybackAt(now, offset);
        Require(actual.phaseNs == phase && actual.cycles == expectedCycles,
            "Optimized playback differs from exact generic phase evaluator");
    }
}

}

int main(int argc, char** argv) {
    SetErrorMode(SEM_FAILCRITICALERRORS | SEM_NOGPFAULTERRORBOX | SEM_NOOPENFILEERRORBOX);
    try {
        Require(argc == 2, "Pass existing output directory");
        Require(SetProcessAffinityMask(GetCurrentProcess(), 0x4000), "Cannot pin LP14");
        ReanimatorLoadDefinitions(gLawnReanimationArray, int(ReanimationType::NUM_REANIMS));
        CheckPhaseAndGroundIndices();
        const auto output = std::filesystem::path(argv[1]);
        FILE* accuracy = std::fopen((output / "accuracy.csv").string().c_str(), "wb");
        Require(accuracy != nullptr, "Cannot open accuracy output");
        std::fprintf(accuracy, "definition,fps,duration_ns,legacy_x,current_x,reference_x,legacy_abs_error,current_abs_error\n");
        Scenario scenarios[]{
            {REANIM_ZOMBIE, "normal", 12}, {REANIM_ZOMBIE_FOOTBALL, "football", 18},
            {REANIM_ZOMBIE_NEWSPAPER, "newspaper", 12}, {REANIM_POLEVAULTER, "polevaulter", 12}
        };
        std::printf("kernel,definition,rate,round,updates,ns_per_update,checksum\n");
        for (auto& scenario : scenarios) {
            for (int i = 0; i < 1024; ++i) {
                const auto now = scenario.animation.mPeriodNs * 7 / 3 + i * 9876543LL;
                scenario.animation.mLastUpdateTimeNs = now;
                Require(std::abs(scenario.animation.RootMotion(ReanimTrackId::_ground, -1) - ResolvedRoot(scenario, now)) < 1e-9,
                    "Resolved evaluator differs from actual RootMotion");
            }
            Accuracy(scenario, accuracy);
            Measure(scenario, "legacy_velocity_accumulate", LegacyStep);
            Measure(scenario, "current_root_method", CurrentStep);
            Measure(scenario, "current_root_resolved", ResolvedStep);
            Measure(scenario, "current_period_local", CurrentLocalStep);
        }
        std::fclose(accuracy);
        return 0;
    } catch (const std::exception& error) { std::fprintf(stderr, "FAIL: %s\n", error.what()); return 1; }
}
