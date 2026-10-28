// Candidate only: test a per-Zombie frame cursor before changing production/save state.
#define WIN32_LEAN_AND_MEAN
#define NOMINMAX
#include <windows.h>
#include "LawnApp.h"
#include "Lawn/Zombie.h"
#include "Sexy.TodLib/Reanimator.h"
#include "Sexy.TodLib/generated/GeneratedDefinitions.h"
#include <algorithm>
#include <bit>
#include <cmath>
#include <cstdio>
#include <filesystem>
#include <stdexcept>

bool (*gAppCloseRequest)();
namespace {
constexpr int Updates = 2'000'000;
constexpr long long StepNs = 10'000'000;
constexpr double Origin = 900;
volatile unsigned long long sink;
void Require(bool ok, const char* message) { if (!ok) throw std::runtime_error(message); }

// Proposed appended fields, shared by every Zombie type. base reuses mRootOriginX.
struct BasicFields { long long frameStartNs, framePeriodNs; int frame; };
struct CachedFields { BasicFields frame; double reciprocalNs, coordinateScale; };
struct BasicZombieLayout { Zombie existing; BasicFields added; };
struct CachedZombieLayout { Zombie existing; CachedFields added; };
struct State {
    BasicFields cursor{};
    double base = Origin, reciprocal = 0, scale = 0;
    float legacyPhase = 0, legacyX = float(Origin);
};
struct Scenario {
    Reanimation animation;
    const ReanimatorSourceTransform* keys;
    const char* name;
    float rate;
    int start = 0, count = 0;
    Scenario(ReanimationType type, const char* label, float animationRate) : name(label), rate(animationRate) {
        animation.mReanimationType = type;
        animation.mDefinition = &GeneratedDefinitions::Reanimations[int(type)];
        animation.mDead = true;
        animation.GetFramesForLayer(ReanimTrackId::anim_walk, start, count);
        keys = animation.mDefinition->mTracks.tracks[animation.FindTrackIndex(ReanimTrackId::_ground)].mTransforms.mTransforms;
        Require(keys && count > 1, "Need authored CPU ground keys");
        animation.mFrameStart = start;
        animation.mFrameCount = count;
        animation.mAnimRate = rate;
        animation.mPeriodNs = ReanimClock::PeriodFromRate(count, rate);
        animation.mLoopType = REANIM_LOOP;
        animation.mCurrentFrame = 0;
        animation.mRootDisplacement = 0;
        animation.mCycleCrossings = 0;
        animation.mFramePeriodNs = std::max(1LL, animation.mPeriodNs / (count - 1));
        animation.mPeriodNs = animation.mFramePeriodNs * (count - 1);

        animation.mRootFrameScale = double(count) / (count - 1);
    }
    State Initial() const {
        State state;
        state.cursor.framePeriodNs = animation.mPeriodNs / (count-1);
        Require(state.cursor.framePeriodNs >= StepNs, "Fixture violates one-keyframe-per-update scope");
        state.reciprocal = 1.0 / double(state.cursor.framePeriodNs);
        state.scale = -double(count) / (count-1);
        return state;
    }
};
__declspec(noinline) float LegacyStep(Scenario& s, State& state, long long) {
    state.legacyPhase += 0.01f*s.rate/s.count;
    if (state.legacyPhase >= 1) state.legacyPhase -= 1;
    const float frame = s.start + state.legacyPhase*(s.count-1);
    const int before = int(std::floor(frame));
    const int after = std::min(before+1, s.start+s.count-1);
    state.legacyX -= (s.keys[after].mTransX-s.keys[before].mTransX)*0.01f*s.rate;
    return state.legacyX;
}
// Historical compatibility fixture: prepare authoritative production state
// outside RootMotion. This preparation now adds timed work to ActualRoot; do not
// compare new runs against its archived timings. Use reanim_frame_cache_benchmark
// for separate query-only and update+query production measurements.
void PrepareAbsoluteRoot(Scenario& s, long long now) {
    const auto q=s.animation.mFramePeriodNs;
    const auto period=s.animation.mPeriodNs;
    const auto phase=now%period;
    s.animation.mCurrentFrame=int(phase/q);
    s.animation.mStartTimeNs=now-phase%q;
    s.animation.mLastUpdateTimeNs=now;
    s.animation.mCycleCrossings=0;
    s.animation.mRootDisplacement=double(now/period)*
        (double(s.keys[s.start+s.count-1].mTransX)-s.keys[s.start].mTransX)*s.animation.mRootFrameScale;
}
__declspec(noinline) float ActualRoot(Scenario& s, State&, long long now) {
    PrepareAbsoluteRoot(s, now);
    return float(Origin + s.animation.RootMotion(ReanimTrackId::_ground, -1));
}
__declspec(noinline) float ActualPeriodLocal(Scenario& s, State&, long long now) {
    now %= s.animation.mPeriodNs; // Same diagnostic input transform as prior benchmark.
    PrepareAbsoluteRoot(s, now);
    return float(Origin + s.animation.RootMotion(ReanimTrackId::_ground, -1));
}
__declspec(noinline) float CursorBasic(Scenario& s, State& state, long long now) {
    auto& cursor = state.cursor;
    const bool advance = now-cursor.frameStartNs >= cursor.framePeriodNs;
    cursor.frame += advance;
    cursor.frameStartNs += cursor.framePeriodNs*advance;
    const double scale = -double(s.count)/(s.count-1);
    if (cursor.frame == s.count-1) {
        cursor.frame = 0;
        state.base += (double(s.keys[s.start+s.count-1].mTransX)-s.keys[s.start].mTransX)*scale;
    }
    const double first = s.keys[s.start].mTransX;
    const double before = s.keys[s.start+cursor.frame].mTransX;
    const double after = s.keys[s.start+cursor.frame+1].mTransX;
    const double age = double(now-cursor.frameStartNs);
    return float(state.base + (before-first + (after-before)*(age/double(cursor.framePeriodNs)))*scale);
}
__declspec(noinline) float CursorCached(Scenario& s, State& state, long long now) {
    auto& cursor = state.cursor;
    const bool advance = now-cursor.frameStartNs >= cursor.framePeriodNs;
    cursor.frame += advance;
    cursor.frameStartNs += cursor.framePeriodNs*advance;
    if (cursor.frame == s.count-1) {
        cursor.frame = 0;
        state.base += (double(s.keys[s.start+s.count-1].mTransX)-s.keys[s.start].mTransX)*state.scale;
    }
    const double first = s.keys[s.start].mTransX;
    const double before = s.keys[s.start+cursor.frame].mTransX;
    const double after = s.keys[s.start+cursor.frame+1].mTransX;
    const double fraction = double(now-cursor.frameStartNs)*state.reciprocal;
    return float(state.base + (before-first + (after-before)*fraction)*state.scale);
}
using Step = float (*)(Scenario&, State&, long long);
__declspec(noinline) unsigned long long Run(Scenario& s, Step step) {
    Step volatile query = step;
    auto state = s.Initial();
    unsigned long long hash = 0;
    for (int i=0;i<Updates;++i)
        hash += std::bit_cast<unsigned int>(query(s,state,(i+1LL)*StepNs));
    return hash;
}
void Measure(Scenario& s,const char* name,Step step) {
    const auto expected = Run(s,step);
    LARGE_INTEGER f,begin,end;QueryPerformanceFrequency(&f);
    for (int round=0;round<5;++round) {
        QueryPerformanceCounter(&begin);const auto hash=Run(s,step);QueryPerformanceCounter(&end);
        Require(hash==expected,"Unstable timing checksum");sink=hash;
        std::printf("%s,%s,%d,%d,%.6f,%llu\n",name,s.name,round,Updates,
            double(end.QuadPart-begin.QuadPart)*1e9/f.QuadPart/Updates,hash);
    }
    std::fflush(stdout);
}
void Accuracy(Scenario& s,FILE* out) {
    // Query the same whole-second checkpoints with multiple fixed/irregular partitions.
    for (const auto step : {CursorBasic,CursorCached}) {
        float referenceCheckpoints[60]{};
        for (const int fps : {100,120,200,240,1000,0}) {
            auto state=s.Initial();long long now=0;int serial=0;
            const auto q=state.cursor.framePeriodNs;
            const auto cycle=q*(s.count-1);
            for (int second=1;second<=60;++second) {
                const auto stop=second*1'000'000'000LL;
                float x=0;
                while (now<stop) {
                    const long long interval=fps?1'000'000'000LL/fps:1+(serial++*9876543ULL)%10'000'000ULL;
                    now+=std::min(interval,stop-now);
                    x=step(s,state,now);
                    Require(now-state.cursor.frameStartNs>=0 && now-state.cursor.frameStartNs<q,
                        "Cursor failed single-frame boundary invariant");
                }
                const auto cycles=now/cycle, phase=now%cycle;
                const int frame=int(phase/q); const auto age=phase%q;
                const double first=s.keys[s.start].mTransX;
                const double delta=double(s.keys[s.start+s.count-1].mTransX)-first;
                const double before=s.keys[s.start+frame].mTransX;
                const double after=s.keys[s.start+frame+1].mTransX;
                const double reference=Origin+(cycles*delta+before-first+(after-before)*double(age)/q)*state.scale;
                Require(std::abs(double(x)-reference)<0.002,"Cursor differs from independent quantized reference");
                if (fps==100) referenceCheckpoints[second-1]=x;
                Require(x==referenceCheckpoints[second-1],"Position changes with update partition");
                PrepareAbsoluteRoot(s,now);
                const auto original=float(Origin+s.animation.RootMotion(ReanimTrackId::_ground,-1));
                std::fprintf(out,"%s,%s,%d,%d,%lld,%lld,%.9g,%.9g,%.12g\n",
                    step==CursorBasic?"basic":"cached",s.name,fps,second,q,
                    s.animation.mPeriodNs-cycle,x,original,std::abs(double(x)-original));
            }
        }
    }
}
}
int main(int argc,char** argv) {
    SetErrorMode(SEM_FAILCRITICALERRORS|SEM_NOGPFAULTERRORBOX|SEM_NOOPENFILEERRORBOX);
    try {
        Require(argc==2,"Pass an existing output directory");
        Require(SetProcessAffinityMask(GetCurrentProcess(),0x4000),"Cannot pin LP14");
        ReanimatorLoadDefinitions(gLawnReanimationArray,NUM_REANIMS);
        const auto dir=std::filesystem::path(argv[1]);
        FILE* accuracy=std::fopen((dir/"accuracy.csv").string().c_str(),"wb");Require(accuracy,"Cannot open accuracy output");
        std::fprintf(accuracy,"candidate,definition,fps,second,frame_ns,discarded_ns_per_cycle,candidate_x,current_root_x,absolute_difference\n");
        FILE* layout=std::fopen((dir/"layout.csv").string().c_str(),"wb");Require(layout,"Cannot open layout output");
        std::fprintf(layout,"current_zombie,basic_fields,cached_fields,basic_appended_layout,cached_appended_layout\n%zu,%zu,%zu,%zu,%zu\n",
            sizeof(Zombie),sizeof(BasicFields),sizeof(CachedFields),sizeof(BasicZombieLayout),sizeof(CachedZombieLayout));std::fclose(layout);
        std::puts("kernel,definition,round,updates,ns_per_update,checksum");
        Scenario scenarios[]{ {REANIM_ZOMBIE,"normal",12},{REANIM_ZOMBIE_FOOTBALL,"football",18},
            {REANIM_ZOMBIE_NEWSPAPER,"newspaper",12},{REANIM_POLEVAULTER,"polevaulter",12} };
        for(auto& s:scenarios) {
            Accuracy(s,accuracy);
            Measure(s,"legacy_velocity_accumulate",LegacyStep);
            Measure(s,"actual_root_long_span",ActualRoot);
            Measure(s,"actual_root_period_local",ActualPeriodLocal);
            Measure(s,"cursor_basic",CursorBasic);
            Measure(s,"cursor_cached",CursorCached);
        }
        std::fclose(accuracy);return 0;
    } catch(const std::exception& e) {std::fprintf(stderr,"FAIL: %s\n",e.what());return 1;}
}
