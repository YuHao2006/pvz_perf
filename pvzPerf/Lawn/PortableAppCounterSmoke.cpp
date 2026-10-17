#include "PortableAppCounterSmoke.h"
#include "ModernVulkanSmoke.h"
#include "LawnApp.h"
#include "Sexy.TodLib/TodFoley.h"
#include "misc/FrameCounterMath.h"
#include "misc/SEHCatcher.h"
#include "sound/MusicInterface.h"
#include "graphics/DDInterface.h"
#include <algorithm>
#include <array>
#include <fstream>
#include <stdexcept>
#include <type_traits>
#include <vector>

namespace {
using namespace Sexy;
void Require(bool value,const char* message){if(!value) throw std::runtime_error(message);}
// Only the audio callback is inert. The actual SexyAppBase::UpdateFrames,
// demo writer/reader and Foley timing functions are exercised below.
class CounterMusic final : public MusicInterface {
public:
    unsigned updates=0;
    bool LoadMusic(int,const std::string&) override {return false;}
    void PlayMusic(int,int,bool) override {}
    void StopMusic(int) override {}
    void PauseMusic(int) override {}
    void ResumeMusic(int) override {}
    void StopAllMusic() override {}
    void UnloadMusic(int) override {}
    void UnloadAllMusic() override {}
    void PauseAllMusic() override {}
    void ResumeAllMusic() override {}
    void FadeIn(int,int,double,bool) override {}
    void FadeOut(int,bool,double) override {}
    void FadeOutAll(bool,double) override {}
    void SetSongVolume(int,double) override {}
    void SetSongMaxVolume(int,double) override {}
    bool IsPlaying(int) override {return false;}
    void SetVolume(double) override {}
    void SetMusicAmplify(int,double) override {}
    void Update() override {++updates;}
};
class CounterApp final : public SexyAppBase {
public:
    using SexyAppBase::UpdateFrames;
    void ButtonPress(int) override {}
    void ButtonDepress(int) override {}
    void ButtonDownTick(int) override {}
    void ButtonMouseEnter(int) override {}
    void ButtonMouseLeave(int) override {}
    void ButtonMouseMove(int,int,int) override {}
};
}

void PortableAppCounterSmoke(LawnApp& realApp) {
    using namespace Sexy;
    Require(!realApp.mDDInterface && !realApp.mLoadingThreadStarted,"App counter probe must precede Init");
    struct Restore {
        LawnApp& app;int priority;
        ~Restore(){gSexyAppBase=&app;SEHCatcher::mApp=&app;SetThreadPriority(GetCurrentThread(),priority);}
    } restore{realApp,GetThreadPriority(GetCurrentThread())};
    CounterApp app;
    app.mReadFromRegistry=false;app.mTimeLoaded=GetTickCount();app.mRandSeed=0x1073;
    app.mPrimaryThreadId=GetCurrentThreadId();app.mMinimized=true;
    app.mDDInterface=new DDInterface(&app); // Own the real image-cleanup lock; no window/device Init.
    auto* music=new CounterMusic;
    app.mMusicInterface=music; // Framework owns and deletes this interface.
    std::ofstream log(ModernSmoke::ProbePath("app-counter-boundaries.txt"));
    Require(bool(log),"Cannot write app counter evidence");
    static_assert(std::is_same_v<decltype(app.mUpdateCount),std::uint32_t>);
    static_assert(std::is_same_v<decltype(app.mLastDemoUpdateCnt),std::uint32_t>);
    static_assert(sizeof(app.mDemoLength)==4 && sizeof(SexyAppBase::DemoMarker::second_type)==4);
    static_assert(std::is_same_v<decltype(app.mDrawTime),std::uint64_t>);
    for(std::uint32_t start:{0x7ffffffeU,0xfffffffeU}) {
        app.mUpdateCount=start;
        for(unsigned tick=1;tick<=3;++tick) {
            const unsigned before=music->updates;
            app.UpdateFrames();
            Require(app.mUpdateCount==start+tick && music->updates==before+1,
                "Actual UpdateFrames did not wrap and dispatch one audio update");
            log<<"frame start="<<start<<" tick="<<tick<<" count="<<app.mUpdateCount<<std::endl;
        }
    }
    TodFoley foley;
    auto& slot=foley.mFoleyTypeData[FOLEY_SPAWN_SUN].mFoleyInstances[0];
    struct Gap {std::uint32_t start,now;bool recent;};
    for(const auto& test:std::to_array<Gap>({
        {100,100,true},{100,109,true},{100,110,false},{100,120,false},
        {0x7ffffffaU,0x80000003U,true},{0x7ffffffaU,0x80000004U,false},
        {0xfffffffdU,5,true},{0xfffffffdU,7,false}})) {
        slot.mStartTime=test.start;slot.mRefCount=1;app.mUpdateCount=test.now;
        const bool recent=SoundSystemHasFoleyPlayedTooRecently(&foley,FOLEY_SPAWN_SUN);
        Require(recent==test.recent,"Foley ten-tick window changed across a frame boundary");
        slot.mRefCount=0;
        Require(!SoundSystemHasFoleyPlayedTooRecently(&foley,FOLEY_SPAWN_SUN),"Inactive Foley slot suppresses sound");
        log<<"foley start="<<test.start<<" now="<<test.now<<" recent="<<recent<<std::endl;
    }
    constexpr std::array deltas{0U,1U,15U,16U,40U};
    std::array<ByteVector,deltas.size()> lowPayload;
    for(std::uint32_t start:{0U,0x7ffffff5U,0xfffffff5U}) {
        for(size_t d=0;d<deltas.size();++d) {
            const auto delta=deltas[d];
            app.mDemoBuffer.Clear();app.mLastDemoUpdateCnt=start;app.mUpdateCount=start+delta;
            app.mDemoCmdOrder=std::uint32_t(-1);app.WriteDemoTimingBlock();
            app.mDemoBuffer.WriteNumBits(0,1);app.mDemoBuffer.WriteNumBits(DEMO_IDLE,5);
            const unsigned commands=delta==0?1:(delta+14)/15;
            Require(app.mDemoCmdOrder==commands-1 && app.mLastDemoUpdateCnt==start+delta,
                "Demo timing writer lost the final position/order");
            if(start==0) lowPayload[d]=app.mDemoBuffer.mData;
            else Require(lowPayload[d]==app.mDemoBuffer.mData,"Demo delta wire bytes depend on counter high bits");
            app.mDemoBuffer.mReadBitPos = 0;app.mLastDemoUpdateCnt=start;app.mDemoCmdOrder=std::uint32_t(-1);
            unsigned elapsed=0;
            for(unsigned i=0;i<commands;++i) {
                elapsed=std::min(delta,(i+1)*15);
                app.mUpdateCount=start+elapsed;app.mDemoNeedsCommand=true;
                Require(app.PrepareDemoCommand(false) && !app.mDemoIsShortCmd && app.mDemoCmdNum==DEMO_IDLE &&
                    app.mLastDemoUpdateCnt==app.mUpdateCount,"Demo command header was not due at the encoded tick");
            }
            Require(app.mDemoBuffer.mReadBitPos==static_cast<int>(commands*10),"Demo timing/header wire width changed");
            log<<"demo start="<<start<<" delta="<<delta<<" commands="<<commands<<" bytes-match=1 decode=1\n";
        }
    }
    app.mDemoFileName=ModernSmoke::ProbePath("counter-wire-fixture.dmo");
    app.mProductVersion="counter-boundary";
    app.mDemoMarkerList={{"high",0x80000010U},{"last",0xefffffffU}};
    app.mUpdateCount=0xf0000000U;
    app.mRecordingDemoBuffer=true;app.WriteDemoBuffer();app.mRecordingDemoBuffer=false;
    const ByteVector payload=app.mDemoBuffer.mData;
    Buffer expected,markers;
    expected.WriteLong(0x42beef78);expected.WriteLong(2);expected.WriteLong(0x1073);
    expected.WriteShort(static_cast<short>(app.mProductVersion.size()));
    expected.WriteBytes(reinterpret_cast<const uchar*>(app.mProductVersion.data()),static_cast<int>(app.mProductVersion.size()));
    markers.WriteLong(2);markers.WriteString("high");markers.WriteLong(static_cast<std::int32_t>(0x80000010U));
    markers.WriteString("last");markers.WriteLong(static_cast<std::int32_t>(0xefffffffU));
    expected.WriteLong(markers.GetDataLen());expected.WriteBytes(markers.GetDataPtr(),markers.GetDataLen());
    expected.WriteLong(static_cast<std::int32_t>(0xf0000000U));
    expected.WriteBytes(payload.data(),static_cast<int>(payload.size()));
    Buffer raw;Require(app.ReadBufferFromFile(app.mDemoFileName,&raw,true) && raw.mData==expected.mData,
        "Demo export no longer matches the literal v2 32-bit file layout");
    app.mDemoBuffer.Clear();app.mDemoMarkerList.clear();app.mDemoLength=0;
    std::string error;
    Require(app.ReadDemoBuffer(error) && app.mDemoLength==0xf0000000U && app.mDemoBuffer.mData==payload &&
        app.mDemoMarkerList.size()==2 && app.mDemoMarkerList.front().second==0x80000010U &&
        app.mDemoMarkerList.back().second==0xefffffffU,"Demo high-bit duration/markers failed to round-trip");
    log<<"demo-v2 literal-byte-layout/high-bit-markers/length=PASS\n";
    using namespace FrameCounterMath;
    static_assert(BeforeEnd(100,12000)==0 && BeforeEnd(100,100)==0 && BeforeEnd(100,0)==100);
    static_assert(BeforeEnd(0xffffffffU,5)==0xfffffffaU);
    static_assert(RemainingSeconds(0xffffffffU,0,10)==42949672ULL);
    static_assert(AverageFps(3000000,30000000,0)==100);
    static_assert(AverageFps(0xffffffffU,42949672950ULL,0)==100);
    static_assert(AverageFps(0,0,0)==0);
    log<<"short-demo-seek-clamped=PASS fps-wide-multiply=PASS\n";
    std::ofstream result(ModernSmoke::ProbePath("result.log"),std::ios::app);
    Require(bool(result),"Cannot record app counter result");
    result<<"portable-app-frame-foley-demo-wire-boundaries before-renderer=1\n";
}
