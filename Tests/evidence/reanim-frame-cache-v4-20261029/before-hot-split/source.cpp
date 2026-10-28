// Actual v4 CPU frame/root queries vs a frozen v3.6 arithmetic model.
// Independent benchmark: no GPU initialization, no production instrumentation.
#define WIN32_LEAN_AND_MEAN
#define NOMINMAX
#include <windows.h>
#include "LawnApp.h"
#include "Lawn/Zombie.h"
#include "Sexy.TodLib/Reanimator.h"
#include "Sexy.TodLib/ReanimClock.h"
#include "Sexy.TodLib/generated/GeneratedDefinitions.h"
#include <algorithm>
#include <bit>
#include <cmath>
#include <climits>
#include <cstdio>
#include <filesystem>
#include <stdexcept>
#include <vector>

bool (*gAppCloseRequest)();
namespace {
constexpr int Updates = 1'000'000;
constexpr int QueryBatches = 256;
constexpr int QueriesPerBatch = 4096;
constexpr long long StepNs = 10'000'000;
volatile unsigned long long sink;
LONG CALLBACK FailHardwareException(EXCEPTION_POINTERS* exception)
{
    const auto code=exception->ExceptionRecord->ExceptionCode;
    if (code==EXCEPTION_ACCESS_VIOLATION || code==EXCEPTION_ILLEGAL_INSTRUCTION ||
        code==EXCEPTION_INT_DIVIDE_BY_ZERO || code==EXCEPTION_STACK_OVERFLOW)
    {
        std::fprintf(stderr,"FATAL hardware exception 0x%08lx at %p\n",
            code,exception->ExceptionRecord->ExceptionAddress);
        std::fflush(stderr);
        TerminateProcess(GetCurrentProcess(),code);
    }
    return EXCEPTION_CONTINUE_SEARCH;
}
void Require(bool value, const char* message) { if (!value) throw std::runtime_error(message); }
struct OldClock {
    long long start=0, period=1, lastTime=0, cycles=0, lastPhase=0, lastCycles=0;
    int loopCount=0;
    bool hasLast=false;
};
struct Scenario {
    Reanimation animation;
    Zombie zombie{};
    OldClock old;
    const ReanimatorSourceTransform* keys=nullptr;
    const char* name;
    float rate;
    int start=0,count=0;
    Scenario(ReanimationType type,const char* label,float r):name(label),rate(r) {
        animation.mReanimationType=type;
        animation.mDefinition=&GeneratedDefinitions::Reanimations[int(type)];
        animation.mDead=true;
        animation.GetFramesForLayer(ReanimTrackId::anim_walk,start,count);
        const auto index=animation.FindTrackIndex(ReanimTrackId::_ground);
        keys=animation.mDefinition->mTracks.tracks[index].mTransforms.mTransforms;
        Require(keys&&count>1,"Missing authored CPU ground track");
        animation.mFrameStart=start; animation.mFrameCount=count;
        animation.mAnimRate=rate; animation.mLoopType=REANIM_LOOP;
        animation.mFramePeriodNs=ReanimClock::PeriodFromRate(count,rate)/(count-1);
        Require(animation.mFramePeriodNs>=StepNs,"Fixture exceeds one-frame-per-update scope");
        animation.mPeriodNs=animation.mFramePeriodNs*(count-1);
        animation.mRootFrameScale=double(count)/(count-1);
        Reset();
    }
    ~Scenario(){animation.mDead=true;}
    void Reset() {
        animation.mDead=false;
        animation.mCurrentFrame=0; animation.mStartTimeNs=0;
        animation.mOriginCycleCount=0; animation.mLastUpdateTimeNs=0;
        animation.mLastFrameNs=0; animation.mLastCycleCount=0;
        animation.mHasLastFrame=false; animation.mPendingTiming=false;
        animation.mLoopCount=0; animation.mPlaybackGeneration=1;
        old={};old.period=animation.mPeriodNs;
        zombie.mX=900;zombie.mRootOriginX=0;zombie.mRootBindingGeneration=0;
        zombie.mRootScale=0;zombie.mRootCycleCount=0;zombie.mRootCoordinateScale=0;
        (void)zombie.RootPosition(animation,-1);
    }
    void Prepare(long long now) {
        const auto period=animation.mPeriodNs,q=animation.mFramePeriodNs;
        const auto cycles=now/period,phase=now%period;
        animation.mCurrentFrame=int(phase/q);
        animation.mStartTimeNs=now-phase%q;
        animation.mOriginCycleCount=cycles;
        animation.mLastUpdateTimeNs=now;
        old.start=now-phase;old.cycles=cycles;old.lastTime=now;
    }
};
// Same optimized forward/loop sampling used by the frozen v3.6 implementation.
// It is a model of that arithmetic, not a direct call into the old EXE.
ReanimPlaybackPosition OldSample(const OldClock& old,long long now) {
    ReanimPlaybackPosition result{old.cycles,0};
    const auto elapsed=ReanimClock::Subtract(now,old.start);
    if (static_cast<unsigned long long>(elapsed)<static_cast<unsigned long long>(old.period)) result.phaseNs=elapsed;
    else ReanimClock::SampleAt(now,old.start,0,old.cycles,old.period,1,result.phaseNs,result.cycles);
    return result;
}
void OldConsume(Scenario& s,long long now) {
    const auto previous=OldSample(s.old,s.old.lastTime);
    s.old.lastPhase=previous.phaseNs;s.old.lastCycles=previous.cycles;s.old.hasLast=true;
    const auto current=OldSample(s.old,now);
    const auto crossed=ReanimClock::Subtract(current.cycles,previous.cycles);
    Require(crossed>=0&&crossed<=INT_MAX,"Old-model loop count overflow");
    s.old.loopCount+=int(crossed);
    s.old.start=ReanimClock::Subtract(now,current.phaseNs);
    s.old.cycles=current.cycles;s.old.lastTime=now;
}
double OldRootValue(Scenario& s,long long now) {
    const auto p=OldSample(s.old,now);
    unsigned long long remainder;
    const auto frame=ReanimClock::MulDiv(p.phaseNs,s.count-1,s.old.period,&remainder);
    const int before=s.start+int(std::min<unsigned long long>(frame,s.count-1));
    const int after=std::min(before+1,s.start+s.count-1);
    return ReanimClock::RootSampleFloat(s.count,false,s.old.period,p.cycles,
        s.keys[s.start].mTransX,s.keys[before].mTransX,s.keys[after].mTransX,
        s.keys[s.start+s.count-1].mTransX,remainder,-1);
}
ReanimatorFrameTime OldFrameValue(Scenario& s,long long now) {
    const auto p=OldSample(s.old,now);
    unsigned long long remainder=0;
    const auto frame=ReanimClock::MulDiv(p.phaseNs,s.count-1,s.old.period,&remainder);
    const int before=s.start+std::min(int(frame),s.count-1);
    return {float(double(remainder)/s.old.period),before,std::min(before+1,s.start+s.count-1)};
}
unsigned long long FrameBits(const ReanimatorFrameTime& frame) {
    return std::bit_cast<unsigned int>(frame.mFraction) ^
        (static_cast<unsigned long long>(frame.mAnimFrameBeforeInt)<<32) ^
        (static_cast<unsigned long long>(frame.mAnimFrameAfterInt)<<48);
}
__declspec(noinline) unsigned long long OldRootQuery(Scenario& s,long long now) {
    return std::bit_cast<unsigned int>(float(900+OldRootValue(s,now)));
}
__declspec(noinline) unsigned long long NewRootQuery(Scenario& s,long long) {
    return std::bit_cast<unsigned int>(float(900+s.animation.RootMotion(ReanimTrackId::_ground,-1)));
}
__declspec(noinline) unsigned long long OldFrameQuery(Scenario& s,long long now) {return FrameBits(OldFrameValue(s,now));}
__declspec(noinline) unsigned long long NewFrameQuery(Scenario& s,long long) {
    ReanimatorFrameTime frame;s.animation.GetFrameTime(&frame);return FrameBits(frame);
}
__declspec(noinline) unsigned long long OldUpdateRoot(Scenario& s,long long now) {OldConsume(s,ReanimClock::Add(s.old.lastTime,StepNs));return OldRootQuery(s,now);}
__declspec(noinline) unsigned long long NewUpdateRoot(Scenario& s,long long now) {s.animation.Advance(StepNs);return NewRootQuery(s,now);}
__declspec(noinline) unsigned long long OldUpdateFrame(Scenario& s,long long now) {OldConsume(s,ReanimClock::Add(s.old.lastTime,StepNs));return OldFrameQuery(s,now);}
__declspec(noinline) unsigned long long NewUpdateFrame(Scenario& s,long long now) {s.animation.Advance(StepNs);return NewFrameQuery(s,now);}
__declspec(noinline) unsigned long long NewUpdateZombieRoot(Scenario& s,long long now) {
    s.animation.Advance(StepNs);
    return std::bit_cast<unsigned int>(float(s.zombie.RootPosition(s.animation,-1)));
}
using Query=unsigned long long(*)(Scenario&,long long);
struct Measurement {double ns;unsigned long long hash;};
Measurement QueryRun(Scenario& s,Query function) {
    Query volatile query=function; LARGE_INTEGER f,begin,end;QueryPerformanceFrequency(&f);
    long long ticks=0;unsigned long long hash=0;
    for (int batch=0;batch<QueryBatches;++batch) {
        const long long now=(batch+1LL)*987654321LL;
        s.Prepare(now); // Replay preparation deliberately outside the timed query batch.
        QueryPerformanceCounter(&begin);
        for (int i=0;i<QueriesPerBatch;++i) hash+=query(s,now);
        QueryPerformanceCounter(&end);ticks+=end.QuadPart-begin.QuadPart;
    }
    sink=hash;return {ticks*1e9/double(f.QuadPart)/(QueryBatches*QueriesPerBatch),hash};
}
Measurement UpdateRun(Scenario& s,Query function) {
    s.Reset();Query volatile query=function;LARGE_INTEGER f,begin,end;QueryPerformanceFrequency(&f);
    unsigned long long hash=0;QueryPerformanceCounter(&begin);
    for (int i=0;i<Updates;++i) hash+=query(s,(i+1LL)*StepNs);
    QueryPerformanceCounter(&end);sink=hash;
    return {(end.QuadPart-begin.QuadPart)*1e9/double(f.QuadPart)/Updates,hash};
}
void Measure(Scenario& s,const char* name,Query function,bool update) {
    const auto run=update?UpdateRun:QueryRun;const auto warm=run(s,function);
    for(int round=0;round<5;++round) {
        const auto result=run(s,function);Require(result.hash==warm.hash,"Unstable per-kernel checksum");
        std::printf("%s,%s,%s,%d,%d,%.6f,%llu\n",name,update?"update_and_query":"query_only",s.name,round,
            update?Updates:QueryBatches*QueriesPerBatch,result.ns,result.hash);
    }
    std::fflush(stdout);
}
void Validate(Scenario& s,FILE* out) {
    double rootError=0,fractionError=0,zombieError=0;
    s.Reset();
    for(int i=0;i<20000;++i) {
        const auto now=(i+1LL)*StepNs;
        OldConsume(s,now);s.animation.Advance(StepNs);
        const double a=OldRootValue(s,now),b=s.animation.RootMotion(ReanimTrackId::_ground,-1);
        rootError=std::max(rootError,std::abs(a-b));
        ReanimatorFrameTime frame;s.animation.GetFrameTime(&frame);const auto old=OldFrameValue(s,now);
        Require(frame.mAnimFrameBeforeInt==old.mAnimFrameBeforeInt&&frame.mAnimFrameAfterInt==old.mAnimFrameAfterInt,
            "Frame indices differ from frozen arithmetic");
        fractionError=std::max(fractionError,std::abs(double(frame.mFraction)-old.mFraction));
        zombieError=std::max(zombieError,std::abs(s.zombie.RootPosition(s.animation,-1)-(900+b)));
    }
    Require(rootError<1e-8&&fractionError<1e-6&&zombieError<1e-7,"New output exceeds independent validation tolerance");
    std::fprintf(out,"%s,%.12g,%.12g,%.12g\n",s.name,rootError,fractionError,zombieError);
    s.Reset();
}
}
int main(int argc,char** argv) {
    SetErrorMode(SEM_FAILCRITICALERRORS|SEM_NOGPFAULTERRORBOX|SEM_NOOPENFILEERRORBOX);
    AddVectoredExceptionHandler(1,FailHardwareException);
    try {
        Require(argc==2||argc==3,"Pass an existing output directory, optional reverse order");
        Require(SetProcessAffinityMask(GetCurrentProcess(),0x4000),"Cannot pin LP14");
        LawnApp app; // GameObject constructors borrow gSexyAppBase; no Init/window/game UI.
        gLawnApp=&app;
        app.mReadFromRegistry=false;
        ReanimatorLoadDefinitions(gLawnReanimationArray,NUM_REANIMS);
        const auto dir=std::filesystem::path(argv[1]);
        FILE* validation=std::fopen((dir/"validation.csv").string().c_str(),"wb");Require(validation,"Cannot open validation output");
        std::fputs("definition,max_root_error,max_fraction_error,max_zombie_error\n",validation);
        FILE* layout=std::fopen((dir/"layout.csv").string().c_str(),"wb");Require(layout,"Cannot open layout output");
        std::fprintf(layout,"zombie,reanimation\n%zu,%zu\n",sizeof(Zombie),sizeof(Reanimation));std::fclose(layout);
        struct Kernel {const char* name;Query function;bool update;};
        std::vector<Kernel> kernels{{"frozen_v36_root",OldRootQuery,false},{"v4_root",NewRootQuery,false},
            {"frozen_v36_frame",OldFrameQuery,false},{"v4_frame",NewFrameQuery,false},
            {"frozen_v36_update_root",OldUpdateRoot,true},{"v4_update_root",NewUpdateRoot,true},
            {"frozen_v36_update_frame",OldUpdateFrame,true},{"v4_update_frame",NewUpdateFrame,true},
            {"v4_update_zombie_root",NewUpdateZombieRoot,true}};
        if(argc==3)std::reverse(kernels.begin(),kernels.end());
        Scenario scenarios[]{{REANIM_ZOMBIE,"normal",12},{REANIM_ZOMBIE_FOOTBALL,"football",18},
            {REANIM_ZOMBIE_NEWSPAPER,"newspaper",12},{REANIM_POLEVAULTER,"polevaulter",12}};
        std::puts("kernel,scope,definition,round,operations,ns_per_operation,checksum");
        for(auto& scenario:scenarios) {Validate(scenario,validation);for(const auto& kernel:kernels)Measure(scenario,kernel.name,kernel.function,kernel.update);}
        std::fclose(validation);return 0;
    } catch(const std::exception& error){std::fprintf(stderr,"FAIL: %s\n",error.what());return 1;}
}
