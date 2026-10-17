#include "PortableFixesSmoke.h"
#include "Sexy.TodLib/TodAllocator.h"
#include "Sexy.TodLib/DefinitionCacheReader.h"
#include "PortableTextProfileSmoke.h"
#include "PortableRichTextSmoke.h"
#include "PortableTooltipSmoke.h"
#include "PortableWidgetCounterSmoke.h"
#include "PortableAppCounterSmoke.h"
#include "PortableDemoToolsSmoke.h"
#include "PortableDemoReaderSmoke.h"
#include "PortableDemoDispatchSmoke.h"
#include "AttachmentLifetimeSmoke.h"
#include "ModernVulkanSmoke.h"
#include "LawnApp.h"
#include "Board.h"
#include "Plant.h"
#include "SeedPacket.h"
#include "Projectile.h"
#include "Zombie.h"
#include "MessageWidget.h"
#include "Widget/TitleScreen.h"
#include "System/Music.h"
#include "System/PlayerInfo.h"
#include "System/TypingCheck.h"
#include "Widget/AchievementsWidget.h"
#include "Sexy.TodLib/TodParticle.h"
#include "Sexy.TodLib/EffectSystem.h"
#include "Sexy.TodLib/Attachment.h"
#include "Sexy.TodLib/Reanimator.h"
#include "Sexy.TodLib/TodFoley.h"
#include "graphics/MemoryImage.h"
#include "graphics/DDInterface.h"
#include "graphics/RenderInterface.h"
#include "misc/DescParser.h"
#include "misc/PerfTimer.h"
#include "misc/ResourceManager.h"
#include "misc/SEHCatcher.h"
#include "sound/BassMusicInterface.h"
#include "platform/Audio.h"
#include "sound/SoundManager.h"
#include "sound/SoundInstance.h"
#include <algorithm>
#include <array>
#include <atomic>
#include <chrono>
#include <cmath>
#include <cstring>
#include <future>
#include <fstream>
#include <memory>
#include <set>
#include <stdexcept>
#include <thread>
// Common.h forces the old Win2000 target macro. Expose the XP+ memory
// diagnostic structure locally without changing the game's compilation target.
#pragma push_macro("_WIN32_WINNT")
#undef _WIN32_WINNT
#define _WIN32_WINNT 0x0501
#include <psapi.h>
#pragma pop_macro("_WIN32_WINNT")
#pragma comment(lib, "psapi.lib")
#if _WIN32_WINNT < 0x0501
extern "C" WINBASEAPI BOOL WINAPI GetProcessHandleCount(HANDLE process, PDWORD count);
#endif

namespace {
// 临时失败落盘（归因期用后即拆）：exit=1 的 Require 消息原本只进异常链
void Require(bool value,const char* message) {
	if(!value) {
		if(FILE* f=fopen(ModernSmoke::ProbePath("require-failure.log").c_str(),"a")) {
			fprintf(f,"FAILED: %s\n",message);fclose(f);
		}
		throw std::runtime_error(message);
	}
}
std::atomic<int> gAlreadyLoadedStartupWeight{-1};

class NumericContractProbeError final : public std::exception {
public:
    const unsigned caseNumber;
    explicit NumericContractProbeError(unsigned caseNumber) noexcept : caseNumber(caseNumber) {}
};

void CheckNumericErrorContracts() {
    using namespace Sexy;
    unsigned checks=0,rejected=0,decoded=0,bounded=0;
    const auto check=[&](bool ok) {
        ++checks;
        if(!ok)throw NumericContractProbeError(checks);
    };
    const auto expect=[&](BufferOperation operation,BufferFailure reason,auto&& invoke) {
        bool caught=false;
        try {invoke();}
        catch(const BufferError& error) {
            check(error.operation==operation&&error.reason==reason);
            caught=true;
        }
        check(caught);++rejected;
    };
    for(int width:{-1,33}) {
        Buffer b;
        expect(BufferOperation::WriteNumBits,BufferFailure::InvalidWidth,[&]{b.WriteNumBits(1,width);});
        expect(BufferOperation::ReadNumBits,BufferFailure::InvalidWidth,[&]{b.ReadNumBits(width,false);});
        check(b.mData.empty()&&b.mWriteBitPos==0&&b.mReadBitPos==0);
    }
    for(int position:{-1,INT_MAX}) {
        Buffer b;b.mWriteBitPos=position;
        expect(BufferOperation::WriteNumBits,BufferFailure::PositionOverflow,[&]{b.WriteNumBits(1,8);});
        expect(BufferOperation::WriteBuffer,BufferFailure::PositionOverflow,[&]{b.WriteBuffer(ByteVector{1});});
        check(b.mData.empty()&&b.mWriteBitPos==position);
    }
    for(int position:{1,8}) {
        Buffer b;b.mWriteBitPos=position;
        expect(BufferOperation::WriteNumBits,BufferFailure::PositionOutsideStorage,[&]{b.WriteNumBits(1,8);});
        expect(BufferOperation::WriteBuffer,BufferFailure::PositionOutsideStorage,[&]{b.WriteBuffer(ByteVector{1});});
        check(b.mData.empty()&&b.mWriteBitPos==position);
    }
    {
        Buffer b;b.WriteByte(7);const auto original=b.mData;
        expect(BufferOperation::WriteBuffer,BufferFailure::SourceAliasesOutput,[&]{b.WriteBuffer(b.mData);});
        expect(BufferOperation::ReadBuffer,BufferFailure::InvalidOutput,[&]{b.ReadBuffer(nullptr);});
        expect(BufferOperation::ReadBuffer,BufferFailure::InvalidOutput,[&]{b.ReadBuffer(&b.mData);});
        check(b.mData==original&&b.mReadBitPos==0&&b.mWriteBitPos==8);
        b.mReadBitPos=-1;ByteVector output{9};
        expect(BufferOperation::ReadBuffer,BufferFailure::NegativeReadPosition,[&]{b.ReadBuffer(&output);});
        expect(BufferOperation::ReadNumBits,BufferFailure::NegativeReadPosition,[&]{b.ReadNumBits(8,false);});
        check(output==ByteVector{9}&&b.mReadBitPos==-1);
        b.mDataBitSize=-1;
        expect(BufferOperation::UTF8ToWideString,BufferFailure::NegativeLogicalSize,[&]{b.UTF8ToWideString();});
        b.mDataBitSize=16;
        expect(BufferOperation::UTF8ToWideString,BufferFailure::LogicalSizeBeyondStorage,[&]{b.UTF8ToWideString();});
    }
    for(bool payload:{false,true}) {
        Buffer b;
        if(payload){b.WriteLong(2);b.WriteByte(1);}else b.WriteByte(1);
        ByteVector output{3,4};const auto original=b.mData;
        expect(BufferOperation::ReadBuffer,payload?BufferFailure::TruncatedPayload:BufferFailure::TruncatedLength,
            [&]{b.ReadBuffer(&output);});
        check(output==ByteVector({3,4})&&b.mData==original&&b.mReadBitPos==0);
    }
    const std::array<ByteVector,12> malformed={{
        {0x80},{0xc0,0x80},{0xc1,0xbf},{0xc2},{0xe0,0x80,0x80},
        {0xed,0xa0,0x80},{0xef,0xbf,0xbe},{0xef,0xbf,0xbf},
        {0xf0,0x80,0x80,0x80},{0xf4,0x90,0x80,0x80},{0xf5,0x80,0x80,0x80},{0xe2,0x28,0xa1}
    }};
    for(size_t prefix:{size_t(0),size_t(1),size_t(3)})for(const auto& tail:malformed) {
        ByteVector bytes(prefix,0x41);bytes.insert(bytes.end(),tail.begin(),tail.end());
        Buffer b;b.SetData(bytes);bool caught=false;
        try {b.UTF8ToWideString();}
        catch(const UTF8DecodeError& error) {check(error.byteOffset==prefix);caught=true;}
        check(caught&&b.mData==bytes&&b.mDataBitSize==int(bytes.size()*8));++decoded;
    }
    {
        Buffer b;b.SetData(ByteVector{0x41,0x42});b.mDataBitSize=15;bool caught=false;
        try {b.UTF8ToWideString();}
        catch(const UTF8DecodeError& error) {check(error.byteOffset==1);caught=true;}
        check(caught);++decoded;
    }
    for(const auto& bytes:std::array<ByteVector,3>{{{}, {0x41}, {0xef,0xbb,0xbf,0x41}}}) {
        Buffer b;b.SetData(bytes);
        check(b.UTF8ToWideString()==(bytes.empty()?L"":L"A"));++decoded;
    }
    {
        Buffer b;b.SetData(ByteVector{0xf0,0x9f,0x98,0x80});
        check(b.UTF8ToWideString()==std::wstring({wchar_t(0xd83d),wchar_t(0xde00)}));++decoded;
    }
    const std::array<std::uint8_t,8> payload{};
    {
        DefinitionCacheReader reader(payload.data(),payload.size());
        std::uint32_t value=1;
        check(reader.mError==DefinitionReadFailure::None&&reader.Read(&value,4)&&value==0&&reader.mPosition==4);
        check(!reader.Take(5)&&reader.mError==DefinitionReadFailure::PayloadBounds&&reader.mPosition==4);
        reader.Fail(DefinitionReadFailure::Schema);
        check(reader.mError==DefinitionReadFailure::PayloadBounds&&reader.Take(4)&&reader.AtEnd());++bounded;
    }
    for(const auto [count,size]:std::array<std::pair<int,int>,5>{{{-1,4},{1,0},{1,-1},{3,4},{INT_MAX,4}}}) {
        DefinitionCacheReader reader(payload.data(),payload.size());size_t bytes=99;
        const auto expected=count<0||size<=0?DefinitionReadFailure::InvalidCount:DefinitionReadFailure::ArrayBounds;
        check(!reader.ArrayBytes(count,size,bytes)&&reader.mError==expected&&reader.mPosition==0&&bytes==99);++bounded;
    }
    {
        DefinitionCacheReader reader(payload.data(),payload.size());size_t bytes=99;
        check(reader.ArrayBytes(0,4,bytes)&&bytes==0&&reader.ArrayBytes(2,4,bytes)&&bytes==8&&
            reader.mError==DefinitionReadFailure::None&&reader.mPosition==0);++bounded;
    }
    check(rejected==21&&decoded==41&&bounded==7);
    std::ofstream evidence(ModernSmoke::ProbePath("numeric-error-contracts.txt"));
    check(bool(evidence));
    evidence<<rejected<<' '<<decoded<<' '<<bounded<<' '<<checks<<'\n';
    evidence.close();check(bool(evidence));
}

void CheckProfilerClock() {
    LARGE_INTEGER frequency{},begin{},end{};
    Require(QueryPerformanceFrequency(&frequency) && frequency.QuadPart>0,"Native profiler QPF unavailable");
    const int priority=GetThreadPriority(GetCurrentThread());
    Require(Sexy::PerfTimer::GetCounterFrequency()==frequency.QuadPart &&
        Sexy::PerfTimer::GetCPUSpeed()==frequency.QuadPart,"Profiler does not use exact Windows frequency");
    constexpr auto key=Sexy::PerfKind::Unknown;
    QueryPerformanceCounter(&begin);
    Sexy::SexyPerf::BeginPerf();
    for(int i=0;i<32;++i){Sexy::SexyPerf::StartTiming(key);Sexy::SexyPerf::StopTiming(key);}
    Sexy::SexyPerf::EndPerf();QueryPerformanceCounter(&end);
    const auto report=Sexy::SexyPerf::GetResults();
    Require(report.find(std::to_string(static_cast<unsigned int>(key))+" (32 calls,")!=std::string::npos && report.find("nan")==std::string::npos &&
        report.find("inf")==std::string::npos,"Native profiler numeric report missing or non-finite");
    const double measured=std::stod(report.substr(std::string("Total Time: ").size()));
    const double wall=(end.QuadPart-begin.QuadPart)*1000.0/frequency.QuadPart;
    Require(std::isfinite(measured) && measured>=0 && measured<=wall+0.01,"Native profiler units/interval inconsistent");
    Require(priority==GetThreadPriority(GetCurrentThread()),"Native profiler changed thread priority");
    // Clear this private hidden pre-init run without touching a user's
    // F2 monitoring session.
    Sexy::SexyPerf::BeginPerf(true);Sexy::SexyPerf::EndPerf();
    Require(!Sexy::SexyPerf::sPerfOn,"Native profiler stayed enabled after probe");
    std::ofstream log(ModernSmoke::ProbePath("profiler-clock.txt"));
    Require(bool(log),"Cannot write profiler clock evidence");
    log<<"qpf="<<frequency.QuadPart<<" scopes=32 key="<<static_cast<unsigned int>(key)<<" measured-ms="<<measured
        <<" outer-wall-ms="<<wall<<" priority-unchanged=1"<<std::endl;
    // The renderer does not exist in this pre-init probe. Report only the
    // clock result, not renderer counters through ModernSmoke::Report.
    std::ofstream result(ModernSmoke::ProbePath("result.log"),std::ios::app);
    Require(bool(result),"Cannot write pre-init profiler result");
    result<<"portable-profiler-exact-qpf-32-scopes-long-report before-renderer=1"<<std::endl;
}

void CheckLogPathCache() {
    const char* directory=getenv("PVZ_LOG_DIR");
    Require(directory!=nullptr,"Log path cache probe requires a private output directory");
    const auto prefix=Sexy::AddTrailingSlash(directory,true);
    Require(Sexy::GetLogFilePath("cache-initial.log")==prefix+"cache-initial.log",
        "Log directory does not match launch configuration");
    std::atomic<unsigned> wrong{0};
    {
        std::vector<std::jthread> workers;
        for(unsigned worker=0;worker<4;++worker)workers.emplace_back([&,worker]{
            (void)Sexy::GetLogFilePathC("cache-initial.log");
            for(unsigned item=0;item<64;++item){
                const auto name="cache-"+std::to_string(worker*64+item)+".log";
                SetLastError(0x1073u);
                const auto path=Sexy::GetLogFilePath(name);
                const DWORD error=GetLastError();
                if(path!=prefix+name||error!=0x1073u)++wrong;
                SetLastError(0x1073u);
                const char* raw=Sexy::GetLogFilePathC(name.c_str());
                const DWORD rawError=GetLastError();
                if(raw!=prefix+name||rawError!=0x1073u)++wrong;
            }
        });
    }
    Require(wrong.load()==0,"Cached log path changed output or repeated filesystem calls");
    std::ofstream result(ModernSmoke::ProbePath("result.log"),std::ios::app);
    Require(bool(result),"Cannot write log path cache result");
    result<<"portable-log-path-four-threads-512-stable-no-mkdir before-renderer=1\n";
}

struct LoadingLifetimeState {
    std::atomic<bool> ready{false},tailDone{false},releasedEarly{false};
    DWORD threadId=0;
};
void LoadingLifetimeBody(LoadingLifetimeState& state) {
    struct Tail {
        LoadingLifetimeState* state;
        ~Tail(){Sleep(300);state->tailDone.store(true,std::memory_order_release);}
    };
    // The real framework stub publishes mLoadingThreadCompleted BEFORE this
    // thread-local destructor runs. No delay is inserted into production code.
    thread_local Tail tail{&state};
    state.threadId=GetCurrentThreadId();
    state.ready.store(true,std::memory_order_release);state.ready.notify_one();
}
class LoadingLifetimeResources final : public Sexy::ResourceManager {
    LoadingLifetimeState& state;
    void Observe(){if(!state.tailDone.load(std::memory_order_acquire)) state.releasedEarly=true;}
public:
    LoadingLifetimeResources(Sexy::SexyAppBase& app,LoadingLifetimeState& s):ResourceManager(&app),state(s){}
    ~LoadingLifetimeResources() override {Observe();}
    void DeleteResources() override {Observe();ResourceManager::DeleteResources();}
    void DeleteResources(ResourceGroupId group) override {Observe();ResourceManager::DeleteResources(group);}
};
class FrameworkLoadingFixture final : public Sexy::SexyAppBase {
    LoadingLifetimeState& state;
public:
    explicit FrameworkLoadingFixture(LoadingLifetimeState& s):state(s){}
    void LoadingThreadProc() override {LoadingLifetimeBody(state);}
    void WaitForWorker(){WaitForLoadingThread();}
    void ButtonPress(int) override {}
    void ButtonDepress(int) override {}
    void ButtonDownTick(int) override {}
    void ButtonMouseEnter(int) override {}
    void ButtonMouseLeave(int) override {}
    void ButtonMouseMove(int,int,int) override {}
};
class LawnLoadingFixture final : public LawnApp {
    LoadingLifetimeState& state;
public:
    explicit LawnLoadingFixture(LoadingLifetimeState& s):state(s){}
    void LoadingThreadProc() override {LoadingLifetimeBody(state);}
};
void CheckLoadingThreadLifetime(LawnApp& realApp) {
    Require(!realApp.mDDInterface && !realApp.mLoadingThreadStarted,
        "Loading lifetime fixtures must run before the actual app starts loading");
    struct Restore {
        Sexy::SexyAppBase* app;int priority;
        ~Restore(){Sexy::gSexyAppBase=app;SetThreadPriority(GetCurrentThread(),priority);}
    } restore{Sexy::gSexyAppBase,GetThreadPriority(GetCurrentThread())};
    std::ofstream log(ModernSmoke::ProbePath("loading-thread-lifetime.txt"));
    Require(bool(log),"Cannot write loading thread lifetime evidence");
    bool ok=true;
    for(int mode=0;mode<3;++mode) {
        LoadingLifetimeState state;
        std::unique_ptr<Sexy::SexyAppBase> fixture;
        if(mode==2) fixture=std::make_unique<LawnLoadingFixture>(state);
        else fixture=std::make_unique<FrameworkLoadingFixture>(state);
        fixture->mReadFromRegistry=false;fixture->mTimeLoaded=GetTickCount();
        fixture->mPrimaryThreadId=GetCurrentThreadId();
        delete fixture->mResourceManager;
        fixture->mResourceManager=new LoadingLifetimeResources(*fixture,state);
        fixture->StartLoadingThread();
        state.ready.wait(false,std::memory_order_acquire);
        HANDLE handle=OpenThread(SYNCHRONIZE|THREAD_QUERY_INFORMATION,FALSE,state.threadId);
        Require(handle!=nullptr,"Cannot query the fixture loading thread");
        DWORD exitCode=STILL_ACTIVE;
        bool tailAtWait=true;
        if(mode==0) {
            static_cast<FrameworkLoadingFixture*>(fixture.get())->WaitForWorker();
            Require(GetExitCodeThread(handle,&exitCode)!=0,"Cannot query thread exit code");
            tailAtWait=state.tailDone.load(std::memory_order_acquire);
        } else {
            fixture.reset();
            Require(GetExitCodeThread(handle,&exitCode)!=0,"Cannot query destroyed fixture thread");
        }
        // Always finish the controlled tail before destroying its external
        // state, including the red run of the old flag-polling implementation.
        const DWORD waited=WaitForSingleObject(handle,2000);
        CloseHandle(handle);
        Require(waited==WAIT_OBJECT_0,"Controlled loading tail did not finish");
        fixture.reset();
        log<<"mode="<<mode<<" threadStillActive="<<(exitCode==STILL_ACTIVE)
            <<" tailAtWait="<<tailAtWait<<" resourceReleasedEarly="<<state.releasedEarly.load()<<std::endl;
        ok &= exitCode!=STILL_ACTIVE && tailAtWait && !state.releasedEarly.load();
    }
    Require(ok,"Loading completion flag returned before thread exit or resources were released before joining");
    std::ofstream result(ModernSmoke::ProbePath("result.log"),std::ios::app);
    Require(bool(result),"Cannot write loading lifetime result");
    result<<"portable-loading-thread-joined-before-resource-release before-renderer=1\n";
}

void CheckDemoBufferOwnership(LawnApp& app) {
    using namespace Sexy;
    struct Restore {
        LawnApp& app;
        std::string filename;
        Buffer buffer;
        SexyAppBase::DemoMarkerList markers;
        std::uint32_t length;
        ~Restore() {
            app.mDemoFileName=std::move(filename);app.mDemoBuffer=buffer;
            app.mDemoMarkerList=std::move(markers);app.mDemoLength=length;
        }
    } restore{app,app.mDemoFileName,app.mDemoBuffer,app.mDemoMarkerList,app.mDemoLength};
    const auto memory=[] {
        PROCESS_MEMORY_COUNTERS_EX counters{};
        counters.cb=sizeof(counters);
        Require(GetProcessMemoryInfo(GetCurrentProcess(),reinterpret_cast<PROCESS_MEMORY_COUNTERS*>(&counters),sizeof(counters))!=0,
            "Cannot read private-memory counters for demo leak regression");
        return counters.PrivateUsage;
    };
    const auto file=ModernSmoke::ProbePath("demo-reader-fixture.dmo");
    app.mDemoFileName=file;
    ByteVector fileBytes;
    const auto makeFile=[&](unsigned version,bool malformed) {
        Buffer fixture;
        fixture.WriteLong(0x42beef78);fixture.WriteLong(version);fixture.WriteLong(app.mRandSeed);
        Require(app.mProductVersion.size()<256,"Unexpected smoke product-version size");
        fixture.WriteShort(static_cast<short>(app.mProductVersion.size()));
        fixture.WriteBytes(reinterpret_cast<const uchar*>(app.mProductVersion.data()),int(app.mProductVersion.size()));
        if(version>=2) {
            Buffer markers;
            markers.WriteLong(malformed?-1:2);
            if(malformed) {
                // Negative item count forces the checked failure AFTER the
                // old 64 KiB allocation, without publishing partial markers.
                while(markers.GetDataLen()<65536) markers.WriteByte(0);
            } else {
                markers.WriteString("intro");markers.WriteLong(25);
                markers.WriteString("sun-pickup");markers.WriteLong(100);
            }
            fixture.WriteLong(markers.GetDataLen());fixture.WriteBytes(markers.GetDataPtr(),markers.GetDataLen());
        }
        fixture.WriteLong(250);
        const uchar payload[]={0x50,0xab,0,0xff,0x7f};
        fixture.WriteBytes(payload,sizeof(payload));
        std::ofstream output(file,std::ios::binary|std::ios::trunc);
        output.write(reinterpret_cast<const char*>(fixture.GetDataPtr()),fixture.GetDataLen());
        output.flush();
        Require(bool(output),"Cannot write isolated demo reader fixture");
        fileBytes=fixture.mData;
    };
    makeFile(2,true);
    app.mDemoBuffer.Clear();app.mDemoMarkerList.clear();
    std::string error;
    const auto failRead=[&] {
        Require(!app.ReadDemoBuffer(error) && error=="Invalid demo file.",
            "Malformed demo marker list was accepted or its diagnostic changed");
    };
    for(int warm=0;warm<8;++warm) failRead();
    const auto before=memory();
    for(int repeat=0;repeat<256;++repeat) failRead();
    const auto after=memory();
    std::ofstream log(ModernSmoke::ProbePath("demo-buffer-ownership.txt"));
    Require(bool(log),"Cannot write demo ownership evidence");
    log<<"malformedReads=256 markerBytes=65536 privateBefore="<<before<<" privateAfter="<<after
        <<" privateGrowth="<<(after>before?after-before:0)<<std::endl;
    Require(after<=before || after-before<8*1024*1024,
        "Repeated rejected demos retained their 64 KiB temporary buffers");
    for(unsigned version:{1u,2u}) {
        makeFile(version,false);app.mDemoBuffer.Clear();app.mDemoMarkerList.clear();error.clear();
        Require(app.ReadDemoBuffer(error),"Valid demo container failed to load");
        const ByteVector expected={0x50,0xab,0,0xff,0x7f};
        Require(app.mDemoLength==250 && app.mDemoBuffer.mData==expected && app.mDemoBuffer.mReadBitPos==0,
            "Demo duration or command payload changed");
        Require(app.mDemoMarkerList.size()==(version==1?0:2),"Demo marker count changed");
        if(version==2) Require(app.mDemoMarkerList.front()==SexyAppBase::DemoMarker("intro",25) &&
            app.mDemoMarkerList.back()==SexyAppBase::DemoMarker("sun-pickup",100),"Demo marker contents changed");
        Buffer rawFile;
        Require(app.ReadBufferFromFile(file,&rawFile,true) && rawFile.mData==fileBytes,
            "Ordinary file-read temporary changed the returned bytes");
    }
    log<<"validV1/V2 duration/markers/rawPayload=PASS (container read only; no playback)\n";
    std::ofstream result(ModernSmoke::ProbePath("result.log"),std::ios::app);
    Require(bool(result),"Cannot write pre-renderer demo ownership result");
    result<<"portable-demo-rejected-buffer-lifetime-valid-v1-v2 before-renderer=1\n";
}

void CheckBufferBitBoundaries() {
    using namespace Sexy;
    constexpr unsigned int value=0x89abcdefu;
    unsigned cases=0,blocks=0;
    for(int offset=0;offset<8;++offset)for(int bits=0;bits<=32;++bits){
        Buffer b;b.WriteNumBits(0x5a,offset);b.WriteNumBits(static_cast<int>(value),bits);
        ByteVector expected((offset+bits+7)/8,0);
        for(int i=0;i<offset;++i)if((0x5a>>i)&1)expected[i/8]|=uchar(1u<<(i%8));
        for(int i=0;i<bits;++i)if((value>>i)&1)expected[(i+offset)/8]|=uchar(1u<<((i+offset)%8));
        Require(b.mData==expected&&b.mDataBitSize==offset+bits,"Bit writer changed diagnostic wire bytes");
        const unsigned long long base=1ull<<bits;
        const unsigned int masked=static_cast<unsigned int>(value&(base-1));
        b.mReadBitPos=offset;
        Require(static_cast<unsigned int>(b.ReadNumBits(bits,false))==masked,"Unsigned bit read changed");
        b.mReadBitPos=offset;long long signedValue=masked;
        if(bits&&(masked&(base/2)))signedValue-=static_cast<long long>(base);
        Require(b.ReadNumBits(bits,true)==static_cast<int>(signedValue)&&b.mReadBitPos==offset+bits,"Signed bit read changed");
        ++cases;
    }
    for(int offset=0;offset<8;++offset)for(size_t count:{size_t(0),size_t(1),size_t(32767),size_t(32768),size_t(65535),size_t(65536)}){
        ByteVector input(count);for(size_t i=0;i<count;++i)input[i]=uchar(i*13+7);
        Buffer b;b.WriteNumBits(0x5a,offset);b.WriteBuffer(input);b.mReadBitPos=offset;
        Require(static_cast<unsigned int>(b.ReadLong())==count,"Block length was narrowed to 16 bits");
        b.mReadBitPos=offset;ByteVector output;b.ReadBuffer(&output);
        Require(output==input&&b.mReadBitPos==b.mWriteBitPos,"Large block roundtrip changed bytes or position");++blocks;
    }
    Require(Buffer::GetBitsRequired(0x7fffffff,true)==32&&Buffer::GetBitsRequired(-2147483647-1,true)==32,
        "Integer width boundaries changed");
    Buffer broken;broken.WriteLong(32);broken.WriteByte(1);ByteVector retained={7,8};bool threw=false;
    try{broken.ReadBuffer(&retained);}catch(const BufferError& error){
        threw=error.operation==BufferOperation::ReadBuffer&&error.reason==BufferFailure::TruncatedPayload;
    }
    Require(threw&&retained==ByteVector({7,8})&&broken.mReadBitPos==0,"Truncated block consumed output or cursor");
    std::ofstream result(ModernSmoke::ProbePath("result.log"),std::ios::app);
    Require(bool(result),"Cannot write buffer boundary result");
    Require(cases==264&&blocks==48,"Buffer boundary fixture did not run fully");
    result<<"portable-buffer-264-bit-wires-48-block-roundtrips before-renderer=1\n";
    unsigned growthCases=0;
    for(bool blockWrites:{false,true})for(int offset=0;offset<8;++offset){
        Buffer b;b.WriteNumBits(0x5a,offset);const ByteVector payload={0xa5};
        size_t reallocations=0,copiedBytes=0;
        for(int i=0;i<4096;++i){
            const auto capacity=b.mData.capacity(),size=b.mData.size();
            if(blockWrites)b.WriteBuffer(payload);else b.WriteNumBits(0xa5,8);
            if(b.mData.capacity()!=capacity){++reallocations;copiedBytes+=size;}
        }
        Require(reallocations<=32&&copiedBytes<=4*b.mData.size(),"Buffer repeated writes lost geometric growth");
        b.mReadBitPos=offset;
        for(int i=0;i<4096;++i){
            if(blockWrites){ByteVector output;b.ReadBuffer(&output);Require(output==payload,"Growth changed block data");}
            else Require(b.ReadNumBits(8,false)==0xa5,"Growth changed bit data");
        }
        Require(b.mReadBitPos==b.mWriteBitPos,"Growth changed the end position");++growthCases;
    }
    Require(growthCases==16,"Buffer growth fixture did not run fully");
    result<<"portable-buffer-geometric-growth-16-cases before-renderer=1\n";
}

void CheckBufferCRC() {
    using namespace Sexy;
    const auto reference=[](const ByteVector& bytes,uint32_t crc){for(auto b:bytes){crc^=uint32_t(b)<<24;
        for(unsigned bit=0;bit<8;++bit)crc=(crc&0x80000000u)?(crc<<1)^0x04c11db7u:crc<<1;}return crc;};
    unsigned cases=0;
    for(unsigned length:{0u,1u,2u,31u,256u,1025u}){
        Buffer buffer;for(unsigned i=0;i<length;++i)buffer.WriteByte(uchar(i*23u+71u));
        for(uint32_t seed:{0u,1u,0xffffffffu,0x80000000u}){
            Require(buffer.GetCRC32(seed)==reference(buffer.mData,seed),"Real CRC differs from independent bitwise reference");++cases;
            Buffer left,right;const size_t split=buffer.mData.size()/2;
            left.mData.assign(buffer.mData.begin(),buffer.mData.begin()+split);
            right.mData.assign(buffer.mData.begin()+split,buffer.mData.end());
            Require(right.GetCRC32(left.GetCRC32(seed))==buffer.GetCRC32(seed),"CRC seeded continuation changed");++cases;
        }
    }
    Require(cases==48,"CRC fixture did not run completely");
    std::ofstream result(ModernSmoke::ProbePath("result.log"),std::ios::app);
    Require(bool(result),"Cannot write CRC smoke result");
    result<<"portable-buffer-crc-48-exact-seed-and-split-cases before-renderer=1\n";
}

void CheckEffectSystemLifetime() {
    Require(gEffectSystem==nullptr,"Effect initialization probe needs no active system");
    for(int cycle=0;cycle<8;++cycle){
        {EffectSystem effects;effects.EffectSystemInitialize();
            Require(gEffectSystem==&effects&&effects.mParticleHolder&&effects.mReanimationHolder&&effects.mAttachmentHolder,
                "Effect system published incomplete real holders");
            Require(effects.mParticleHolder->mParticleSystems.mMaxSize==1024&&effects.mParticleHolder->mEmitters.mMaxSize==1024&&
                effects.mParticleHolder->mParticles.mMaxSize==1024&&
                effects.mReanimationHolder->mReanimations.mMaxSize==1024&&effects.mAttachmentHolder->mAttachments.mMaxSize==1024,
                "Effect holder capacities changed");
            {EffectSystem empty;empty.EffectSystemDispose();Require(gEffectSystem==&effects,"Empty disposal cleared the active system");
                bool rejected=false;try{empty.EffectSystemInitialize();}catch(const std::logic_error&){rejected=true;}
                Require(rejected&&!empty.mParticleHolder&&gEffectSystem==&effects,"Duplicate initialization replaced the active system");}
            Require(gEffectSystem==&effects,"Empty destructor cleared the active system");
            if(cycle%2){effects.EffectSystemDispose();effects.EffectSystemDispose();
                Require(!gEffectSystem&&!effects.mParticleHolder&&!effects.mReanimationHolder&&!effects.mAttachmentHolder,
                    "Explicit effect cleanup left holders");}
        }
        Require(!gEffectSystem,"Effect destructor left a dangling global");
    }
    std::ofstream result(ModernSmoke::ProbePath("result.log"),std::ios::app);
    Require(bool(result),"Cannot write effect initialization evidence");
    result<<"effect-system-eight-real-initialize-dispose-cycles before-renderer=1\n";
}

void CheckAllocatorLifecycle() {
    for(int size:{8,9,24,256}){
        TodAllocator allocator;allocator.Initialize(3,size);std::array<void*,10> items{};
        for(size_t i=0;i<items.size();++i){items[i]=allocator.Alloc(size);
            const auto* expected=static_cast<unsigned char*>(allocator.mBlockList)+sizeof(void*)+(2-i%3)*size;
            Require(items[i]==expected&&allocator.mTotalItems==int(i+1),"Allocator changed original high-to-low slot order");}
        allocator.Free(items[2],size);allocator.Free(items[5],size);
        Require(allocator.Alloc(size)==items[5]&&allocator.Alloc(size)==items[2],"Allocator changed LIFO reuse");
        for(auto* item:items)allocator.Free(item,size);
        Require(allocator.mTotalItems==0,"Allocator live count did not return to zero");
        const auto oldHead=allocator.mFreeList;bool rejected=false;
        try{allocator.Calloc(size+1);}catch(const std::invalid_argument&){rejected=true;}
        Require(rejected&&allocator.mFreeList==oldHead&&allocator.mTotalItems==0,"Wrong-sized request changed allocator state");
        allocator.FreeAll();allocator.FreeAll();Require(!allocator.mBlockList&&!allocator.mFreeList,"Allocator cleanup left blocks");
    }
    // This is a synchronous pre-renderer probe; only its newly appended registry
    // entry is removed. Existing game entries and their blocks are never touched.
    const int before=gNumGlobalAllocators;Require(before>=0&&before<MAX_GLOBAL_ALLOCATORS,"Allocator registry probe has no spare slot");
    int size=8;for(;;size+=8){bool found=false;for(int i=0;i<before;++i)found|=gGlobalAllocators[i].mItemSize==size;if(!found)break;}
    const auto unused=gGlobalAllocators[before];Require(!unused.mBlockList&&!unused.mFreeList&&!unused.mTotalItems,"Inactive registry slot still owns blocks");
    auto* added=FindGlobalAllocator(size);
    Require(added==&gGlobalAllocators[before]&&added->mBlockList&&added->mFreeList&&added->mTotalItems==0&&
        gNumGlobalAllocators==before+1&&FindGlobalAllocator(size)==added,"New global allocator did not prepare its original first block");
    added->FreeAll();*added=unused;gNumGlobalAllocators=before;
    std::ofstream result(ModernSmoke::ProbePath("result.log"),std::ios::app);
    Require(bool(result),"Cannot write allocator evidence");result<<"tod-allocator-four-strides-lifo-first-block before-renderer=1\n";
}

#if defined(SEXY_FONT_TEXT_COMPAT_TEST_ONLY)
class TestDescParser final : public Sexy::DescParser {
public:
    bool throwOnError=false;
    bool HandleCommand(const Sexy::ListDataElement&) override {return true;}
    bool Error(const std::string& error) override {
        if(throwOnError) throw std::runtime_error(error);
        return DescParser::Error(error);
    }
};

void CheckDescParser(LawnApp& app) {
    using namespace Sexy;
    TestDescParser parser;
    const std::pair<const char*,const char*> malformed[]={
        {"head (one (two three)","Unterminated List"},
        {"head (one (\"two)","Unterminated Double Quotes"},
        {"head (one ('two)","Unterminated Single Quotes"},
        {"head (one (two(three)))","Unexpected List Start"}};
    for(int repeat=0;repeat<128;++repeat) {
        for(const auto& [input,error]:malformed) {
            ListDataElement list;
            parser.mError.clear();
            Require(!parser.ParseToList(input,&list,false,nullptr),"Invalid nested descriptor was accepted");
            Require(parser.mError==error,"Descriptor error text/propagation changed");
            Require(list.mElementVector.size()==1 && !list.mElementVector[0]->mIsList &&
                static_cast<SingleDataElement*>(list.mElementVector[0])->mString=="head",
                "Failed descriptor published a partially parsed child");
        }
        ListDataElement list;
        Require(parser.ParseToList("head (one (two three)) tail",&list,false,nullptr),
            "Valid descriptor failed after malformed inputs");
        Require(list.mElementVector.size()==3 && list.mElementVector[1]->mIsList,
            "Valid descriptor tree ownership/shape changed");
        auto* child=static_cast<ListDataElement*>(list.mElementVector[1]);
        Require(child->mElementVector.size()==2 && child->mElementVector[1]->mIsList,
            "Nested descriptor child was lost");
        auto* nested=static_cast<ListDataElement*>(child->mElementVector[1]);
        Require(nested->mElementVector.size()==2 &&
            static_cast<SingleDataElement*>(nested->mElementVector[1])->mString=="three",
            "Nested descriptor token changed");
    }
    parser.throwOnError=true;
    bool propagated=false;
    try {
        ListDataElement list;
        parser.ParseToList("head (one (two",&list,false,nullptr);
    } catch(const std::runtime_error& error) {
        propagated=std::string(error.what())=="Unterminated List";
    }
    Require(propagated,"Descriptor callback exception was swallowed or changed");
    ModernSmoke::Report("portable-desc-parser-nested-failure-success-exception",app);
}

#endif

class TestSound final : public Sexy::SoundInstance {
public:
    bool playing=false;
    unsigned releases=0,plays=0;
    void Release() override {playing=false;++releases;}
    void SetBaseVolume(double) override {}
    void SetBasePan(int) override {}
    void AdjustPitch(double) override {}
    void SetVolume(double) override {}
    void SetPan(int) override {}
    bool Play(bool,bool) override {playing=true;++plays;return true;}
    void Stop() override {playing=false;}
    bool IsPlaying() override {return playing;}
    bool IsReleased() override {return !playing;}
};
class TestSounds final : public Sexy::SoundManager {
public:
    TestSound sound;
    TestSounds() { mInitialized = true; }
    bool LoadSound(unsigned int,const std::string&) override {return true;}
    int LoadSound(const std::string&) override {return 0;}
    void ReleaseSound(unsigned int) override {}
    void SetVolume(double) override {}
    bool SetBaseVolume(unsigned int,double) override {return true;}
    bool SetBasePan(unsigned int,int) override {return true;}
    Sexy::SoundInstance* GetSoundInstance(unsigned int) override {return &sound;}
    void ReleaseSounds() override {}
    void ReleaseChannels() override {}
    void Flush() override {}
    void SetCooperativeWindow(HWND) override {}
    void StopAllSounds() override {sound.Stop();}
    int GetFreeSoundId() override {return 0;}
    int GetNumSounds() override {return 1;}
};

void CheckFoley(LawnApp& app) {
    TestSounds fake;
    struct Restore {
        Sexy::SoundManager*& slot;
        Sexy::SoundManager* original;
        ~Restore(){slot=original;}
    } restore{app.mSoundManager,app.mSoundManager};
    app.mSoundManager=&fake;
    TodFoley foley;
    auto& slot=foley.mFoleyTypeData[FOLEY_SUN].mFoleyInstances[0];
    for(int cycle=0;cycle<2;++cycle) {
        // Exactly the free-slot state left by CancelPausedFoley.
        slot.mPaused=true;
        foley.PlayFoleyPitch(FOLEY_SUN,0);
        Require(slot.mRefCount==1 && slot.mInstance==&fake.sound && !slot.mPaused,
            "Reused Foley slot retained its previous pause state");
        fake.sound.playing=false;
        SoundSystemReleaseFinishedInstances(&foley);
        Require(slot.mRefCount==0 && !slot.mInstance,"Finished reused Foley slot was not released");
    }
    Require(fake.sound.plays==2 && fake.sound.releases==2,"Foley slot cannot play/release repeatedly");
}

void CheckRotation(LawnApp& app) {
    using namespace Sexy;
    std::ofstream log(ModernSmoke::ProbePath("rotated-source-stride.txt"));
    Require(bool(log),"Cannot write rotated source stride evidence");
    unsigned cases=0;
    std::array<unsigned int,256> colors{};
    for(unsigned i=0;i<colors.size();++i) colors[i]=0xff000000u|((i*19u&255u)<<16)|((i*37u&255u)<<8)|(i*71u&255u);
    for(bool indexed:{false,true}) {
        MemoryImage full(&app),crop(&app),wrongCrop(&app);
        full.Create(8,6);crop.Create(4,3);wrongCrop.Create(4,3);
        if(indexed) {
            full.mColorTable=new unsigned int[256];crop.mColorTable=new unsigned int[256];
            wrongCrop.mColorTable=new unsigned int[256];
            std::copy(colors.begin(),colors.end(),full.mColorTable);
            std::copy(colors.begin(),colors.end(),crop.mColorTable);
            std::copy(colors.begin(),colors.end(),wrongCrop.mColorTable);
            full.mColorIndices=new uchar[48];crop.mColorIndices=new uchar[12];
            wrongCrop.mColorIndices=new uchar[12];
            for(int i=0;i<48;++i) full.mColorIndices[i]=uchar(i+1);
            for(int y=0;y<3;++y) for(int x=0;x<4;++x) crop.mColorIndices[y*4+x]=uchar((y+2)*8+x+3);
            for(int y=0;y<3;++y) for(int x=0;x<4;++x) wrongCrop.mColorIndices[y*4+x]=uchar(2*4+2+y*8+x+1);
        } else {
            auto* f=full.GetBits();auto* c=crop.GetBits();auto* bad=wrongCrop.GetBits();
            for(int i=0;i<48;++i) f[i]=colors[i+1];
            for(int y=0;y<3;++y) for(int x=0;x<4;++x) c[y*4+x]=colors[(y+2)*8+x+3];
            for(int y=0;y<3;++y) for(int x=0;x<4;++x) bad[y*4+x]=colors[2*4+2+y*8+x+1];
        }
        for(int mode:{0,1}) for(double angle:{.37,-.21}) {
            MemoryImage actual(&app),expected(&app),mutant(&app);
            actual.Create(64,64);expected.Create(64,64);mutant.Create(64,64);
            actual.FillRect(Rect(0,0,64,64),Color(16,24,32,255),0);
            expected.FillRect(Rect(0,0,64,64),Color(16,24,32,255),0);
            mutant.FillRect(Rect(0,0,64,64),Color(16,24,32,255),0);
            actual.BltRotated(&full,24,24,Rect(2,2,4,3),Rect(0,0,64,64),Color::White,mode,angle,2,1.5f);
            expected.BltRotated(&crop,24,24,Rect(0,0,4,3),Rect(0,0,64,64),Color::White,mode,angle,2,1.5f);
            // The original bad base address was x + y * SUBRECT width. Crop
            // those wrong rows independently, so an all-empty comparison or a
            // shared wrong-origin implementation cannot pass the test silently.
            mutant.BltRotated(&wrongCrop,24,24,Rect(0,0,4,3),Rect(0,0,64,64),Color::White,mode,angle,2,1.5f);
            unsigned different=0,visible=0,oldStrideDifferent=0;
            for(unsigned i=0;i<64*64;++i) {
                const auto pixel=actual.GetBits()[i];
                different+=pixel!=expected.GetBits()[i];visible+=pixel!=0xff101820u;
                oldStrideDifferent+=mutant.GetBits()[i]!=expected.GetBits()[i];
            }
            log<<"case="<<cases<<" indexed="<<indexed<<" mode="<<mode<<" angle="<<angle
               <<" differences="<<different<<" visible="<<visible<<" old-stride-differences="<<oldStrideDifferent<<std::endl;
            Require(!different && visible && oldStrideDifferent,
                "Rotated subrectangle equality/nonempty/old-stride negative control failed");++cases;
        }
    }
    ModernSmoke::Report("portable-rotation-eight-nonempty-crops-eight-old-stride-controls",app);
}

void CheckPixelCorners(LawnApp& app) {
    using namespace Sexy;
    auto& render=*app.mDDInterface->mRenderInterface;
    Require(app.mWidth==800 && app.mHeight==600 && render.mTransformStack.empty(),
        "Pixel-corner probe requires the normal logical canvas and no active transform");
    std::ofstream log(ModernSmoke::ProbePath("gpu-pixel-corners.txt"));
    Require(bool(log),"Cannot write pixel corner evidence");
    const Rect canvas(0,0,800,600);
    std::vector<unsigned int> expected(800*600,0xffe06030u);
    unsigned positive=0,negative=0;
    auto check=[&](const char* name,bool shouldMatch=true) {
        render.Flush();const auto pixels=render.mRenderer->ReadScenePixels();
        Require(pixels.size()==expected.size(),"Pixel-corner readback size mismatch");
        size_t differences=0,edgeDifferences=0;
        for(size_t i=0;i<expected.size();++i) if(pixels[i]!=expected[i]) {
            ++differences;if(i%800==799 || i/800==599)++edgeDifferences;
        }
        log<<"case="<<name<<" pixels="<<pixels.size()<<" differences="<<differences
           <<" right-bottom-differences="<<edgeDifferences<<" expected-match="<<shouldMatch<<std::endl;
        Require(shouldMatch?differences==0:differences!=0,"GPU pixel-corner/negative-control comparison failed");
        shouldMatch?++positive:++negative;
    };
    auto clear=[&]{render.FillRect(canvas,Color::Black,0);};
    clear();render.FillRect(canvas,Color(224,96,48),0);check("fill");
    SexyMatrix3 translation;translation.LoadIdentity();translation.m02=-5;translation.m12=-7;
    clear();render.PushTransform(translation);
    {
        struct Pop {RenderInterface& render;~Pop(){render.PopTransform();}} pop{render};
        render.FillRect(Rect(5,7,800,600),Color(224,96,48),0);
    }
    check("fill-transformed");
    MemoryImage source(&app);source.Create(800,600);auto* bits=source.GetBits();
    for(int y=0;y<600;++y) for(int x=0;x<800;++x) {
        // Unequal dimensions and single-pixel patterns expose width-1/height-1
        // projection stretch and inherited half-pixel sampling offsets.
        expected[y*800+x]=0xff000000u|(((x*37u+y*13u)&255u)<<16)|
            (((x*11u+y*47u)&255u)<<8)|((x*3u+y*19u)&255u);
        bits[y*800+x]=expected[y*800+x];
    }
    source.BitsChanged();
    SexyMatrix3 identity;identity.LoadIdentity();
    SexyMatrix3 translated=identity;translated.m02=5;translated.m12=7;
    for(bool linear:{false,true}) {
        clear();render.Blt(&source,0,0,canvas,Color::White,0,linear);check(linear?"blt-linear":"blt-point");
        clear();render.BltTransformed(&source,nullptr,Color::White,0,canvas,identity,linear);
        check(linear?"identity-linear":"identity-point");
        clear();render.BltTransformed(&source,nullptr,Color::White,0,canvas,identity,linear,400,300,true);
        check(linear?"centered-linear":"centered-point");
        clear();render.BltTransformed(&source,&canvas,Color::White,0,canvas,translated,linear,-5,-7);
        check(linear?"translated-clipped-linear":"translated-clipped-point");
    }
    SexyMatrix3 wrongExtent=identity;wrongExtent.m00=800.f/799.f;wrongExtent.m11=600.f/599.f;
    clear();render.BltTransformed(&source,nullptr,Color::White,0,canvas,wrongExtent,false);
    check("old-extent-negative-control",false);
    clear();render.BltTransformed(&source,nullptr,Color::White,0,canvas,identity,true,-.5f,-.5f);
    check("half-offset-negative-control",false);
    Require(positive==10 && negative==2,"Pixel-corner scenario count incomplete");
    ModernSmoke::Report("portable-pixel-corners-ten-gpu-two-negative-controls",app);
}

void CheckAUSources(LawnApp& app) {
    if (app.mNoSoundNeeded) return;
    Require(app.mMusicVolume==0 && app.mSfxVolume==0,
        "AU probe requires application-muted audio");
    auto* live=dynamic_cast<Sexy::DSoundManager*>(app.mSoundManager);
    Require(live && live->mDirectSound,"AU probe requires the real DirectSound device");
    class Probe final:public Sexy::DSoundManager {
    public:
        explicit Probe(LPDIRECTSOUND device):DSoundManager(nullptr) {
            mDirectSound=device; mDirectSound->AddRef();
            mInitialized = true;
        }
        bool CheckSource(unsigned id,DWORD expectedSize) {
            DSBCAPS caps{}; caps.dwSize=sizeof(caps);
            WAVEFORMATEX format{}; DWORD actualSize=0;
            auto* source=mSourceSounds[id];
            return source && source->GetCaps(&caps)==DS_OK && caps.dwBufferBytes==expectedSize &&
                source->GetFormat(&format,sizeof(format),&actualSize)==DS_OK &&
                format.wFormatTag==WAVE_FORMAT_PCM && format.nChannels==1 &&
                format.nSamplesPerSec==8012 && format.wBitsPerSample==16 &&
                format.nBlockAlign==2 && format.nAvgBytesPerSec==16024 &&
                mSourceDataSizes[id]==expectedSize;
        }
    } probe(live->mDirectSound);
    // Own source buffers only: no playback, no duplicate buffers, no device
    // reinitialization or global volume API, no changes to the game's sources.
    std::ofstream log(ModernSmoke::ProbePath("au-source-lifetime.txt"));
    Require(bool(log),"Cannot write AU lifetime evidence");
    for(int round=0;round<16;++round) {
        for(const auto& [name,size]:std::array<std::pair<const char*,DWORD>,2>{{
            {"sounds\\diamond",8394},{"sounds\\tapglass",5564}}}) {
            Require(probe.LoadSound(3,name),"Real AU loading failed");
            Require(probe.GetNumSounds()==1 && probe.CheckSource(3,size),"Real AU format/size differs from 1073");
            probe.ReleaseSound(3);
            Require(probe.GetNumSounds()==0,"AU source survived unload");
            log<<"round="<<round<<" name="<<name<<" decodedBytes="<<size<<" released=1\n";
        }
    }
    const auto badName=ModernSmoke::ProbePath("invalid-au-source");
    {std::ofstream bad(badName+".au",std::ios::binary);bad<<"bad!";Require(bool(bad),"Cannot write invalid AU fixture");}
    Require(probe.LoadSound(badName)==-1 && probe.LoadSound(badName)==-1 && probe.GetNumSounds()==0,
        "Failed AU request became a cached sound");
    log<<"real-au-load-unload=32 malformed-repeat-rejected=2\n";
    unsigned char wav[]={
        'R','I','F','F',0,0,0,0,'W','A','V','E',
        'J','U','N','K',1,0,0,0,0x55,0,
        'f','m','t',' ',16,0,0,0,1,0,1,0,0x4c,0x1f,0,0,
        0x98,0x3e,0,0,2,0,16,0,
        'd','a','t','a',8,0,0,0,0,0,0x10,0,0x20,0,0,0};
    static_assert(sizeof(wav)==62);wav[4]=sizeof(wav)-8;
    const auto wavName=ModernSmoke::ProbePath("odd-chunk-pcm");
    {std::ofstream file(wavName+".wav",std::ios::binary);file.write(reinterpret_cast<const char*>(wav),sizeof(wav));
        Require(bool(file),"Cannot write odd-chunk WAV fixture");}
    Require(probe.LoadSound(3,wavName)&&probe.CheckSource(3,8),"Odd-sized RIFF chunk lost WAV format/data");
    probe.ReleaseSound(3);Require(probe.GetNumSounds()==0,"WAV source survived unload");
    log<<"odd-wav-junk-padding=1 format-8012-mono16=1 released=1\n";
    ModernSmoke::Report("portable-wav-odd-chunk-real-source",app);
    Require(bool(log),"Failed to write AU lifetime results");
    ModernSmoke::Report("portable-au-real32-load-unload-two-rejected-no-playback",app);
}

void CheckMusicMap(LawnApp& app) {
    auto* bass=dynamic_cast<Sexy::BassMusicInterface*>(app.mMusicInterface);
    if(!bass) {ModernSmoke::Report("portable-music-map-needs-audio-run",app);return;}
    // 所有权模型（2026-10-01 重构）：装载线程是唯一写入者，PublishSlots() 以
    // release 发布后槽位全程不可变；主线程只读零锁，发布前调用安全 no-op。
    // 旧递归互斥锁与 1024 并发发布测试随模型删除——竞态被结构性消除。
    Require(bass->mSlotsPublished.load(std::memory_order_acquire),
            "Startup music load did not publish the slot table");
    bass->Update(); // 发布后无锁更新路径
    bass->UnloadMusic(-7654321); // 未知 ID 仍然拒绝、不动存储
    Require(!bass->IsMusicLoaded(-7654321),"Unknown music id reported loaded");
    Require(!bass->IsMusicLoaded(0),"Reserved slot 0 reported loaded");
    bass->PlayMusic(-7654321); // 安全 no-op
    bass->PlayMusic(0);        // 保留槽 no-op
    // 发布前 no-op 门：临时 unpublished，验证主线程不碰未发布槽位且查询报未装载。
    bass->mSlotsPublished.store(false,std::memory_order_release);
    bass->Update();
    bass->PlayMusic(1);
    bass->FadeOutAll(false,1000.0);
    Require(!bass->IsMusicLoaded(1),"Gated pre-publish query reported a song");
    bass->mSlotsPublished.store(true,std::memory_order_release);
    Require(bass->IsMusicLoaded(1),"Post-restore query lost a startup song");
    ModernSmoke::Report("portable-music-map-publish-ownership",app);
}
}

void PortableBeforeInitSmoke(LawnApp& app) {
    if(getenv("PVZ_MODERN_CLOSE_DURING_LOADING")) return;
    if(!getenv("PVZ_MODERN_SMOKE") || getenv("PVZ_MODERN_GAMEPLAY_SMOKE") || getenv("PVZ_MODERN_CREDITS_SMOKE"))
        return;
    Require(app.mDDInterface==nullptr,"Demo memory probe must run before renderer initialization");
    for(unsigned byte=0;byte<256;++byte) {
        unsigned upper=byte;
        if(upper>='a' && upper<='z') upper-='a'-'A';
        const unsigned expected=upper>=0x30 && upper<=0x5a ? upper :
            upper>=0x33 && upper<=0x60 ? upper+0x80 : 0;
        Require(unsigned(Sexy::GetKeyCodeFromAscii(static_cast<unsigned char>(byte)))==expected,
            "ASCII key byte mapping changed");
    }
    CheckProfilerClock();
    CheckLogPathCache();
    // Init later replaces this with the real session seed. The constructor has
    // not initialized mRandSeed yet; do not read it while making the fixture.
    app.mRandSeed=0x1073u;
    CheckDemoBufferOwnership(app);
    CheckNumericErrorContracts();
    CheckBufferBitBoundaries();
    CheckBufferCRC();
    CheckEffectSystemLifetime();
    CheckAllocatorLifecycle();
    PortableDemoReaderSmoke(app);
    PortableDemoDispatchSmoke(app);
    CheckLoadingThreadLifetime(app);
    PortableAppCounterSmoke(app);
    PortableDemoToolsSmoke();
}

void PortableLoadingPlanSmoke(LawnApp& app) {
    if(getenv("PVZ_MODERN_CLOSE_DURING_LOADING")) return;
    if(!getenv("PVZ_MODERN_SMOKE") || getenv("PVZ_MODERN_CREDITS_SMOKE"))
        return;
    std::ofstream log(ModernSmoke::ProbePath("loading-already-loaded.txt"));
    Require(bool(log),"Cannot write pre-loading resource evidence");
    int weight=0;
    auto& resources=*app.mResourceManager;
    for(auto* res:resources.mResourceSlots) {
        if(!res || res->mFromProgram) continue;
        const int unit=res->mResGroup==ResourceGroupId::LoadingImages?9:
            (res->mResGroup==ResourceGroupId::LoadingFonts || res->mResGroup==ResourceGroupId::LoadingSounds)?54:0;
        if(!unit) continue;
        bool loaded=false;
        switch(res->mType) {
        case Sexy::ResourceManager::ResType_Image:
            loaded=static_cast<Sexy::MemoryImage*>(static_cast<Sexy::ResourceManager::ImageRes*>(res)->mImage)!=nullptr;break;
        case Sexy::ResourceManager::ResType_Sound:
            loaded=static_cast<Sexy::ResourceManager::SoundRes*>(res)->mSoundId!=-1;break;
        case Sexy::ResourceManager::ResType_Font:
            loaded=static_cast<Sexy::ResourceManager::FontRes*>(res)->mFont!=nullptr;break;
        }
        if(loaded){weight+=unit;log<<static_cast<unsigned>(res->mResGroup)<<' '<<res->mId<<" weight="<<unit<<'\n';}
    }
    log<<"alreadyLoadedWeight="<<weight<<std::endl;
    gAlreadyLoadedStartupWeight.store(weight,std::memory_order_release);
}

void CheckPortableLoadingAndAdvice(LawnApp& app) {
    Require(app.mLoaded && app.mLoadingThreadCompleted && app.mTitleScreen,
        "Loading accounting smoke requires the finished startup and its title screen");
    std::ofstream log(ModernSmoke::ProbePath("loading-advice.txt"));
    Require(bool(log),"Cannot write loading/advice evidence");
    const int planned=app.mNumLoadingThreadTasks.load();
    const int completed=app.mCompletedLoadingThreadTasks.load();
    const int expected=app.mResourceManager->GetNumResources(ResourceGroupId::LoadingFonts)*54+
        app.mResourceManager->GetNumResources(ResourceGroupId::LoadingImages)*9+
        app.mResourceManager->GetNumResources(ResourceGroupId::LoadingSounds)*54+
        int(std::size(gLawnParticleArray))*6+app.GetNumPreloadingTasks()+app.mMusic->GetNumLoadingTasks();
    const int alreadyLoaded=gAlreadyLoadedStartupWeight.load(std::memory_order_acquire);
    log<<"startup planned="<<planned<<" completed="<<completed<<" expected="<<expected<<" alreadyLoaded="<<alreadyLoaded
        <<" particleCount="<<std::size(gLawnParticleArray)<<std::endl;
    const bool startupOk=alreadyLoaded>=0 && planned==expected && completed+alreadyLoaded==expected;
    bool preloadOk=true;
    {
        struct Restore {
            LawnApp& app;int planned,completed;PlayerInfo* player;Sexy::KeyCode quickKey;
            ~Restore(){app.mNumLoadingThreadTasks=planned;app.mCompletedLoadingThreadTasks=completed;
                app.mPlayerInfo=player;app.mTitleScreen->mQuickLoadKey=quickKey;}
        } restore{app,planned,completed,app.mPlayerInfo,app.mTitleScreen->mQuickLoadKey};
        app.mPlayerInfo=nullptr; // Only the ten common reanimations, already loaded.
        for(bool cancel:{false,true}) {
            app.mCompletedLoadingThreadTasks=1234;app.mNumLoadingThreadTasks=9000;
            app.mTitleScreen->mQuickLoadKey=cancel?Sexy::KEYCODE_SPACE:Sexy::KEYCODE_UNKNOWN;
            app.PreloadForUser();
            log<<"preload cancel="<<cancel<<" planned="<<app.mNumLoadingThreadTasks.load()
                <<" completed="<<app.mCompletedLoadingThreadTasks.load()<<" expectedCompleted=1914"<<std::endl;
            preloadOk &= app.mNumLoadingThreadTasks==9000 && app.mCompletedLoadingThreadTasks==1914;
        }
    }
    alignas(MessageWidget) std::array<std::byte,sizeof(MessageWidget)> storage;
    storage.fill(std::byte{0xa5});
    auto* advice=std::construct_at(reinterpret_cast<MessageWidget*>(storage.data()),&app);
    int rawDisplay=0,rawType=0;
    static_assert(sizeof(ReanimationType)==sizeof(rawType));
    // Inspect the object representation so a missing constructor write is
    // detectable without evaluating an indeterminate enum in game logic.
    std::memcpy(&rawDisplay,&advice->mDisplayTime,sizeof(rawDisplay));
    std::memcpy(&rawType,&advice->mReanimType,sizeof(rawType));
    const int expectedDisplay=0;const ReanimationType expectedType=REANIM_NONE;
    const bool initialized=std::memcmp(&advice->mDisplayTime,&expectedDisplay,sizeof(expectedDisplay))==0 &&
        std::memcmp(&advice->mReanimType,&expectedType,sizeof(expectedType))==0;
    log<<"new advice display="<<rawDisplay<<" reanimType="<<rawType<<" initialized="<<initialized<<std::endl;
    bool adviceOk=initialized;
    if(initialized) {
        advice->ClearLabel();advice->Update();
        adviceOk &= advice->mDuration==0 && !advice->IsBeingDisplayed();
        advice->SetLabel(("portable initialization probe"),MESSAGE_STYLE_HINT_FAST);
        adviceOk &= advice->mDuration==500 && advice->mDisplayTime==500 && advice->mReanimType==REANIM_NONE;
        advice->ClearLabel();adviceOk &= advice->mDuration==0;
    }
    std::destroy_at(advice);
    Require(startupOk,"Actual loading counters disagree with the registered task budget");
    Require(preloadOk,"PreloadForUser counts the total budget again or writes cancellation progress to the wrong counter");
    Require(adviceOk,"MessageWidget has indeterminate initial timing/animation state");
    ModernSmoke::Report("portable-loading-budget-preload-cancel-advice-init",app);
}

void PortableFixesSmoke(LawnApp& app) {
    // Independent literal pairs read from 1073's 20-entry table at 00721148.
    // Do not derive the expected description from the current implementation.
    constexpr std::array<std::array<const char*,2>,20> originalAchievements{{
        {"Home Lawn Security","Complete Adventure Mode."},
        {"Nobel Peas Prize","Get the golden sunflower trophy."},
        {"Better Off Dead","Get to a streak of 10 in I, Zombie Endless"},
        {"China Shop","Get to a streak of 15 in Vasebreaker Endless"},
        {"SPUDOW!","Blow up a zombie using a Potato Mine."},
        {"Explodonator","Take out 10 full-sized zombies with a single Cherry Bomb."},
        {"Morticulturalist","Collect all 49 plants (including plants from Crazy Dave's shop)."},
        {"Don't Pea in the Pool","Complete a daytime pool level without using pea shooters of any kind."},
        {"Roll Some Heads","Bowl over 5 zombies with a single Wall-Nut."},
        {"Grounded","Defeat a normal roof level without using any catapult plants."},
        {"Zombologist","Discover the Yeti zombie."},
        {"Penny Pincher","Pick up 30 coins in a row on a single level without letting any disappear."},
        {"Sunny Days","Get 8000 sun during a single level."},
        {"Popcorn Party","Defeat 2 Gargantuars with Corn Cob missiles in a single level."},
        {"Good Morning","Complete a daytime level by planting only Mushrooms and Coffee Beans."},
        {"No Fungus Among Us","Complete a nighttime level without planting any Mushrooms."},
        {"Beyond the Grave","Beat all 20 mini games."},
        {"Immortal","Survive 20 waves of pure zombie ferocity."},
        {"Towering Wisdom","Grow the Tree of Wisdom to 100 feet."},
        {"Mustache Mode","Enable Mustache Mode"}
    }};
    static_assert(originalAchievements.size()==MAX_ACHIEVEMENTS);
    std::ofstream achievementLog(ModernSmoke::ProbePath("achievement-text-cases.txt"));
    Require(bool(achievementLog),"Cannot write achievement text evidence");
    unsigned textWrong=0;
    for(unsigned i=0;i<originalAchievements.size();++i){
        const bool name=gAchievementList[i].name==originalAchievements[i][0];
        const bool description=gAchievementList[i].description==originalAchievements[i][1];
        textWrong+=!name; textWrong+=!description;
        achievementLog<<"achievement="<<i<<" name="<<name<<" description="<<description<<std::endl;
    }
    achievementLog<<"text-fields=40 wrong="<<textWrong<<std::endl;
    Require(textWrong==0,"Achievement title/description differs from 1073; see achievement-text-cases.txt");
    ModernSmoke::Report("portable-achievements-40-original-text-fields",app);
    alignas(Music) std::array<std::byte,sizeof(Music)> storage;
    storage.fill(std::byte{0xa5});
    auto* music=std::construct_at(reinterpret_cast<Music*>(storage.data()));
    const bool initialized=music->mBurstStateCounter==0 && music->mDrumsStateCounter==0;
    std::destroy_at(music);
    Require(initialized,"Music constructor left counters uninitialized");
    CheckPortableLoadingAndAdvice(app);
    PortableWidgetCounterSmoke(app);
    PortableTextFormatSmoke(app);
    PortableRichTextSmoke(app);
    PortableTooltipSmoke(app);
    PortableUserListSmoke(app);
    PortableContinueConfirmSmoke(app);
#if defined(SEXY_FONT_TEXT_COMPAT_TEST_ONLY)
    CheckDescParser(app);
#endif
    AttachmentLifetimeSmoke(app);
    CheckFoley(app);
    CheckRotation(app);
    CheckPixelCorners(app);
    CheckMusicMap(app);
    CheckAUSources(app);
    PortableDialogTrophySmoke(app);
    PortableButtonHitSmoke(app);
    ModernSmoke::Report("portable-counter-foley-rotation-regressions",app);
}

void CheckBloverTiming(LawnApp& app) {
    auto& board=*app.mBoard;
    struct Restore {
        Board& board;int fog;
        std::vector<std::pair<Zombie*,bool>> previous;
        Plant* blover=nullptr;Plant* zero=nullptr;Zombie* flying=nullptr;Zombie* falling=nullptr;
        ~Restore(){
            board.mFogBlownCountDown=fog;
            for(const auto& [z,value]:previous) z->mBlowingAway=value;
            if(blover) blover->Die();if(zero) zero->Die();
            if(flying) flying->DieNoLoot();if(falling) falling->DieNoLoot();
        }
    } restore{board,board.mFogBlownCountDown};
    Zombie* existing=nullptr;
    while(board.IterateZombies(existing)) restore.previous.emplace_back(existing,existing->mBlowingAway);
    board.mFogBlownCountDown=0;
    auto* blover=restore.blover=board.AddPlant(8,0,SEED_BLOVER);
    auto* flying=restore.flying=board.AddZombieInRow(ZOMBIE_BALLOON,0,0);
    auto* falling=restore.falling=board.AddZombieInRow(ZOMBIE_BALLOON,1,0);
    flying->mZombiePhase=PHASE_BALLOON_FLYING;flying->mBlowingAway=false;
    falling->mZombiePhase=PHASE_BALLOON_POPPING;falling->mBlowingAway=false;
    Require(blover->IsInPlay() && blover->mDoSpecialCountdown==50 && blover->mStateCountdown==0,
        "Blover timing fixture does not match normal planting state");
    std::ofstream log(ModernSmoke::ProbePath("blover-timing.txt"));
    Require(bool(log),"Cannot write blover timing evidence");
    bool timing=true;
    for(int tick=1;tick<=50;++tick) {
        blover->UpdateAbilities();
        const bool due=tick==50;
        timing &= blover->mDoSpecialCountdown==50-tick &&
            (blover->mState==STATE_DOINGSPECIAL)==due && flying->mBlowingAway==due &&
            !falling->mBlowingAway && board.mFogBlownCountDown==(due?4000:0);
        if(tick==1 || tick==49 || tick==50)
            log<<"tick="<<tick<<" countdown="<<blover->mDoSpecialCountdown<<" special="
                <<(blover->mState==STATE_DOINGSPECIAL)<<" flying="<<flying->mBlowingAway
                <<" falling="<<falling->mBlowingAway<<" fog="<<board.mFogBlownCountDown<<std::endl;
    }
    board.mFogBlownCountDown=3999;
    blover->UpdateAbilities();
    timing &= board.mFogBlownCountDown==3999; // Do not repeat the blow after activation.
    auto* zero=restore.zero=board.AddPlant(8,4,SEED_BLOVER);
    zero->mDoSpecialCountdown=0;zero->mStateCountdown=17;
    zero->UpdateBlover();
    const bool zeroEntry=zero->mState==STATE_DOINGSPECIAL && board.mFogBlownCountDown==4000;
    log<<"zero-entry-with-state-countdown17="<<zeroEntry<<std::endl;
    auto* body=app.ReanimationGet(zero->mBodyReanimID);
    body->mLoopCount=1;body->mLoopType=REANIM_PLAY_ONCE_AND_HOLD;
    zero->UpdateBlover();
    const bool loop=body->mLoopType==REANIM_LOOP;
    log<<"completed-animation-transitions-to-loop="<<loop<<std::endl;
    Require(timing,"Blover acts before the original 50-tick wind-up or blows falling balloons/repeats effects");
    Require(zeroEntry && loop,"Blover lost the original zero-countdown trigger or animation loop transition");
    ModernSmoke::Report("portable-blover-50tick-zero-entry-and-falling-balloon",app);
}

void CheckPoolEligibility(LawnApp& app) {
    auto& board=*app.mBoard;
    Require(board.StageHasPool() && app.mPlayerInfo,"Pool eligibility probe requires a playing pool/fog board");
    auto& player=*app.mPlayerInfo;
    struct Restore {
        Board& board;PlayerInfo& player;
        int wave,ice,avatars;std::array<unsigned char,sizeof(Zombatar)> first;
        std::vector<Zombie*> owned;
        ~Restore(){
            for(auto* z:owned) if(!z->mDead) z->DieNoLoot();
            board.mCurrentWave=wave;board.mIceTrapCounter=ice;
            player.mNumZombatars=avatars;
            std::memcpy(&player.mZombatars[0],first.data(),first.size());
        }
    } restore{board,player,board.mCurrentWave,board.mIceTrapCounter,
        player.mNumZombatars,{}};
    // Preserve object bytes: an inactive avatar slot may contain indeterminate
    // integers, so do not evaluate them with a memberwise Zombatar copy.
    std::memcpy(restore.first.data(),&player.mZombatars[0],restore.first.size());
    std::ofstream log(ModernSmoke::ProbePath("pool-eligibility.txt"));
    Require(bool(log),"Cannot write pool eligibility evidence");
    // Literal type numbers from the 1073 EXE, 0x542A10. Do not derive the
    // expected set from the production helper we are testing.
    constexpr std::array allowed{0,1,2,4,11,14,16,26,27,28,29,31,33};
    static_assert(ZOMBIE_BALLOON==16 && ZOMBIE_ZOMBATAR==33 && NUM_ZOMBIE_TYPES==34);
    bool good=true;
    for(int type=0;type<NUM_ZOMBIE_TYPES;++type) {
        const bool expected=std::find(allowed.begin(),allowed.end(),type)!=allowed.end();
        const bool actual=Zombie::ZombieTypeCanGoInPool(static_cast<ZombieType>(type));
        good &= expected==actual;
        log<<"type="<<type<<" expected="<<expected<<" actual="<<actual<<std::endl;
    }
    board.mCurrentWave=4;
    good &= !board.RowCanHaveZombieType(2,ZOMBIE_BALLOON) &&
        !board.RowCanHaveZombieType(2,ZOMBIE_ZOMBATAR);
    board.mCurrentWave=5;
    const bool balloonRow=board.RowCanHaveZombieType(2,ZOMBIE_BALLOON);
    const bool avatarRow=board.RowCanHaveZombieType(2,ZOMBIE_ZOMBATAR);
    log<<"wave5 balloon-row="<<balloonRow<<" avatar-row="<<avatarRow<<std::endl;
    good &= balloonRow && avatarRow && !board.RowCanHaveZombieType(0,ZOMBIE_SNORKEL);
    auto add=[&](ZombieType type,int row){
        auto* z=board.AddZombieInRow(type,row,0);
        restore.owned.push_back(z);return z;
    };
    player.mNumZombatars=0;
    auto* flag=add(ZOMBIE_FLAG,2);
    // Follow the real saved-avatar -> flag-type rewrite, not just assigning
    // mZombieType on an ordinary zombie after its initialization.
    player.mNumZombatars=1;
    auto& avatar=player.mZombatars[0];
    std::fill(std::begin(avatar.mColors),std::end(avatar.mColors),-1);
    std::fill(std::begin(avatar.mItems),std::end(avatar.mItems),-1);
    avatar.mColors[ZOMBATAR_CUSTOM_SKIN]=0;
    avatar.mColors[ZOMBATAR_CUSTOM_BACKDROPS]=47;
    avatar.mItems[ZOMBATAR_CUSTOM_BACKDROPS]=4;
    auto* custom=add(ZOMBIE_FLAG,2);
    Require(flag->mZombieType==ZOMBIE_FLAG && custom->mZombieType==ZOMBIE_ZOMBATAR &&
        custom->mHasZombatar && custom->mZombatarIndex==0,"Saved avatar did not select a custom flag zombie");
    bool speedGood=flag->mVelX==0.45f&&custom->mVelX==0.45f;
    log<<"flag-initial-speed plain="<<flag->mVelX<<" custom="<<custom->mVelX<<std::endl;
    flag->StartWalkAnim(0);custom->StartWalkAnim(0);
    for(int repeat=0;repeat<16;++repeat) {
        flag->PickRandomSpeed();custom->PickRandomSpeed();
        auto* plainBody=app.ReanimationGet(flag->mBodyReanimID);
        auto* customBody=app.ReanimationGet(custom->mBodyReanimID);
        speedGood &= flag->mVelX==0.45f&&custom->mVelX==0.45f&&
            plainBody->mAnimRate>0&&plainBody->mAnimRate==customBody->mAnimRate;
        if(repeat==0||repeat==15)log<<"flag-speed repeat="<<repeat<<" plain="<<flag->mVelX<<" custom="<<custom->mVelX
            <<" plainAnim="<<plainBody->mAnimRate<<" customAnim="<<customBody->mAnimRate<<std::endl;
    }
    auto* snorkel=add(ZOMBIE_SNORKEL,3);
    snorkel->mX=710;snorkel->mPosX=710;snorkel->UpdateZombieSnorkel();
    speedGood &= snorkel->mZombiePhase==PHASE_SNORKEL_INTO_POOL&&snorkel->mVelX==0.2f;
    auto* snorkelBody=app.ReanimationGet(snorkel->mBodyReanimID);
    snorkelBody->mLoopCount=1;snorkel->UpdateZombieSnorkel();
    const float beforeEating=snorkel->mVelX;
    speedGood &= snorkel->mZombiePhase==PHASE_SNORKEL_WALKING_IN_POOL&&snorkel->mInPool&&beforeEating==0.2f;
    snorkel->mIsEating=true;snorkel->UpdateZombieSnorkel();
    speedGood &= snorkel->mZombiePhase==PHASE_SNORKEL_UP_TO_EAT;
    snorkelBody->mLoopCount=1;snorkel->UpdateZombieSnorkel();
    speedGood &= snorkel->mZombiePhase==PHASE_SNORKEL_EATING_IN_POOL;
    snorkel->mIsEating=false;snorkel->UpdateZombieSnorkel();
    speedGood &= snorkel->mZombiePhase==PHASE_SNORKEL_DOWN_FROM_EAT;
    snorkelBody->mLoopCount=1;snorkel->UpdateZombieSnorkel();
    speedGood &= snorkel->mZombiePhase==PHASE_SNORKEL_WALKING_IN_POOL&&snorkel->mVelX==0.3f;
    log<<"snorkel-swim-speed before-eating="<<beforeEating<<" after-eating="<<snorkel->mVelX<<std::endl;
    auto* dolphin=add(ZOMBIE_DOLPHIN_RIDER,3);
    dolphin->mZombiePhase=PHASE_DOLPHIN_WALKING_IN_POOL;
    for(int repeat=0;repeat<16;++repeat){dolphin->PickRandomSpeed();speedGood &= dolphin->mVelX>=0.23f&&dolphin->mVelX<=0.37f;
        log<<"dolphin-pool-speed repeat="<<repeat<<" speed="<<dolphin->mVelX<<std::endl;}
    board.mIceTrapCounter=0;
    for(auto* z:{flag,custom}) {
        z->mPosX=600;z->mX=600;
        Require(!z->mInPool && z->mZombieHeight==HEIGHT_ZOMBIE_NORMAL && z->mAltitude==0 && z->mScaleZombie==1,
            "Flag pool probe did not start on the bank");
        z->CheckForPool();
        const bool entered=z->mInPool && z->mZombieHeight==HEIGHT_IN_TO_POOL;
        for(int tick=0;tick<40;++tick) z->UpdateZombiePool();
        const bool submerged=z->mInPool && z->mZombieHeight==HEIGHT_ZOMBIE_NORMAL && z->mAltitude==-40;
        z->mPosX=700;z->mX=700;z->CheckForPool();
        const bool leaving=z->mZombieHeight==HEIGHT_OUT_OF_POOL;
        for(int tick=0;tick<40;++tick) z->UpdateZombiePool();
        const bool exited=!z->mInPool && z->mZombieHeight==HEIGHT_ZOMBIE_NORMAL && z->mAltitude==0;
        log<<"flag-type="<<int(z->mZombieType)<<" entered="<<entered<<" depth40="<<submerged
            <<" leaving="<<leaving<<" exited="<<exited<<std::endl;
        good &= entered && submerged && leaving && exited;
    }
    board.mIceTrapCounter=75;
    custom->mPosX=600;custom->mX=600;custom->CheckForPool();
    const bool iced=custom->mIceTrapCounter==75 && !custom->mInPool && custom->mChilledCounter>0;
    log<<"custom-flag-ice-branch="<<iced<<std::endl;good &= iced;
    board.mIceTrapCounter=0;
    auto* balloon=add(ZOMBIE_BALLOON,2);
    balloon->mPosX=600;balloon->mX=600;
    balloon->CheckForPool();
    const bool flyingExcluded=!balloon->mInPool && balloon->mZombieHeight==HEIGHT_ZOMBIE_NORMAL;
    balloon->mZombiePhase=PHASE_BALLOON_POPPING;balloon->CheckForPool();
    const bool fallingExcluded=!balloon->mInPool && balloon->mZombieHeight==HEIGHT_ZOMBIE_NORMAL;
    balloon->mZombiePhase=PHASE_BALLOON_FLYING;balloon->LandFlyer(0);
    const bool waterLandingDies=balloon->mDead;
    log<<"balloon flying-excluded="<<flyingExcluded<<" falling-excluded="<<fallingExcluded
        <<" water-landing-dies="<<waterLandingDies<<std::endl;
    good &= flyingExcluded && fallingExcluded && waterLandingDies;
    Require(good,"1073 pool eligibility/flag transitions differ (including saved Zombatar type 33)");
    Require(speedGood,"1073 flag speed/animation or snorkel eating-cycle speed differs");
    ModernSmoke::Report("portable-zombie-speed-flags-snorkel-cycle-dolphin",app);
    ModernSmoke::Report("portable-pool-all34-types-avatar-flag-enter-exit-balloon",app);
}

void CheckMustacheAchievement(LawnApp& app) {
    auto& board=*app.mBoard;
    auto& player=*app.mPlayerInfo;
    MessageWidget advice(&app);
    struct Restore {
        LawnApp& app;Board& board;PlayerInfo& player;MessageWidget* previous;
        AdviceType help;bool boardMode,appMode,earned,shown;
        std::vector<std::pair<TypingCheck*,TypingCheck>> typing;
        ~Restore(){
            board.mAdvice=previous;board.mHelpIndex=help;
            board.mMustacheMode=boardMode;app.mMustacheMode=appMode;
            player.mEarnedAchievements[MustacheMode]=earned;
            player.mShownAchievements[MustacheMode]=shown;
            for(auto& [target,saved]:typing) std::swap(*target,saved);
            Zombie* z=nullptr;
            while(board.IterateZombies(z)) z->EnableMustache(boardMode);
        }
    } restore{app,board,player,board.mAdvice,board.mHelpIndex,board.mMustacheMode,app.mMustacheMode,
        player.mEarnedAchievements[MustacheMode],player.mShownAchievements[MustacheMode]};
    for(auto* check:{app.mKonamiCheck,app.mMustacheCheck,app.mMoustacheCheck,
        app.mSuperMowerCheck,app.mSuperMowerCheck2,app.mFutureCheck,app.mPinataCheck,
        app.mDanceCheck,app.mDaisyCheck,app.mSukhbirCheck}) restore.typing.emplace_back(check,*check);
    board.mAdvice=&advice;
    std::ofstream log(ModernSmoke::ProbePath("mustache-achievement.txt"));
    Require(bool(log),"Cannot write mustache achievement evidence");
    const auto reset=[&]{
        player.mEarnedAchievements[MustacheMode]=false;
        player.mShownAchievements[MustacheMode]=false;
        advice.ClearLabel();board.mMustacheMode=false;app.mMustacheMode=false;
    };
    const auto popup=[&]{return player.mEarnedAchievements[MustacheMode] &&
        player.mShownAchievements[MustacheMode] && advice.mMessageStyle==MESSAGE_STYLE_ACHIEVEMENT &&
        advice.mDuration==250 && advice.mDisplayTime==250 &&
        SexyString(advice.mLabel)==gAchievementList[MustacheMode].name+" Achievement!";};
    bool good=true;
    for(const auto* word:{"mustache","moustache"}) {
        reset();bool prefixClean=true;
        const size_t length=std::strlen(word);
        for(size_t i=0;i<length;++i) {
            board.DoTypingCheck(Sexy::GetKeyCodeFromAscii(static_cast<unsigned char>(word[i])));
            if(i+1<length) prefixClean &= !player.mEarnedAchievements[MustacheMode] && advice.mDuration==0;
        }
        const bool first=popup() && board.mMustacheMode && app.mMustacheMode;
        advice.SetLabel(("already shown sentinel"),MESSAGE_STYLE_HINT_STAY);
        const int duration=advice.mDuration;
        for(size_t i=0;i<length;++i) board.DoTypingCheck(Sexy::GetKeyCodeFromAscii(static_cast<unsigned char>(word[i])));
        const bool noDuplicate=!board.mMustacheMode && !app.mMustacheMode &&
            player.mEarnedAchievements[MustacheMode] && player.mShownAchievements[MustacheMode] &&
            advice.mDuration==duration && SexyString(advice.mLabel)==("already shown sentinel");
        log<<word<<" prefix-clean="<<prefixClean<<" first-popup="<<first<<" repeat-toggles-without-popup="<<noDuplicate<<std::endl;
        good &= prefixClean && first && noDuplicate;
    }
    reset();board.SetMustacheMode(true);
    const bool direct=popup();
    log<<"direct-set-mode-popup="<<direct<<std::endl;good &= direct;
    reset();ReportAchievement::GiveAchievement(&app,MustacheMode,false);
    const bool deferred=player.mEarnedAchievements[MustacheMode] && !player.mShownAchievements[MustacheMode] && advice.mDuration==0;
    log<<"deferred-menu-style-grant="<<deferred<<std::endl;good &= deferred;
    Require(good,"Mustache achievement popup/duplicate state differs from 1073");
    ModernSmoke::Report("portable-mustache-both-spellings-popup-once-original-setter",app);
}

void PortableTutorialFirstPacketSmoke(LawnApp& app) {
    Require(getenv("PVZ_MODERN_HIDDEN") && getenv("PVZ_APPDATA_DIR") && app.mBoard,
        "Tutorial probe requires isolated board");
    auto& board=*app.mBoard;auto& bank=*board.mSeedBank;
    Require(board.mTutorialParticleID==PARTICLESYSTEMID_NULL,"Tutorial probe would remove an existing arrow");
    struct Restore { Board& board;TutorialState state;int timer,bx,by,count,x0,y0,x1,y1;
        ~Restore(){auto& bank=*board.mSeedBank;board.TutorialArrowRemove();board.ClearAdvice(ADVICE_NONE);
            board.mTutorialState=state;board.mTutorialTimer=timer;bank.mX=bx;bank.mY=by;bank.mNumPackets=count;
            bank.mSeedPackets[0].mX=x0;bank.mSeedPackets[0].mY=y0;
            bank.mSeedPackets[1].mX=x1;bank.mSeedPackets[1].mY=y1;}
    } restore{board,board.mTutorialState,board.mTutorialTimer,bank.mX,bank.mY,bank.mNumPackets,
        bank.mSeedPackets[0].mX,bank.mSeedPackets[0].mY,bank.mSeedPackets[1].mX,bank.mSeedPackets[1].mY};
    std::ofstream log(ModernSmoke::ProbePath("tutorial-first-packet.txt"));Require(bool(log),"Cannot write tutorial evidence");
    unsigned cases=0,wrong=0;
    bank.mNumPackets=1;
    for(const auto& coordinates:std::array<std::array<int,4>,6>{{
        {0,0,78,8},{10,-90,78,8},{25,13,81,9},{-10,20,30,15},{200,40,19,27},{0,-50,100,16}}}) {
        bank.mX=coordinates[0];bank.mY=coordinates[1];
        bank.mSeedPackets[0].mX=coordinates[2];bank.mSeedPackets[0].mY=coordinates[3];
        bank.mSeedPackets[1].mX=333;bank.mSeedPackets[1].mY=222; // Not a usable packet.
        board.mTutorialState=TUTORIAL_LEVEL_1_PICK_UP_PEASHOOTER;board.mTutorialTimer=1;
        board.UpdateTutorial();
        auto* system=app.ParticleTryToGet(board.mTutorialParticleID);
        Require(system && system->mEffectType==PARTICLE_SEED_PACKET_PICK && system->EmitterRosterCount()>0,
            "Actual tutorial did not create its arrow emitters");
        const int x=coordinates[0]+coordinates[2],y=coordinates[1]+coordinates[3];
        bool correct=board.mTutorialTimer==-1;
        for(int ei=0;ei<system->EmitterRosterCount();++ei) {
            auto* emitter=system->EmitterRosterEmitterAt(ei);
            correct &= emitter->mSystemCenter.x==float(x) && emitter->mSystemCenter.y==float(y);
            log<<"tutorial origin="<<emitter->mSystemCenter.x<<','<<emitter->mSystemCenter.y
                <<" expected="<<x<<','<<y<<'\n';
        }
        const auto id=board.mTutorialParticleID;board.UpdateTutorial();
        correct &= board.mTutorialParticleID==id; // One-time prompt, not recreated every update.
        ++cases;wrong+=!correct;
        board.TutorialArrowRemove();app.mEffectSystem->ProcessDeleteQueue();
    }
    log<<"tutorial-first-packet-cases="<<cases<<" wrong="<<wrong<<std::endl;
    Require(wrong==0,"Tutorial arrow targeted the unused second packet");
    ModernSmoke::Report("portable-tutorial-first-packet-six-origin-and-once-cases",app);
}

void PortablePlantFixesSmoke(LawnApp& app) {
    PortableMiniGameCompletionSmoke(app);
    CheckMustacheAchievement(app);
    auto& board=*app.mBoard;
    auto* target=board.AddZombieInRow(ZOMBIE_NORMAL,0,0);
    target->mPosX=600;target->mX=600;
    auto* pea=board.AddPlant(2,0,SEED_PEASHOOTER);
    Require(pea->FindTargetAndFire(0) && pea->mShootingCounter==35,
        "Default pea head shooting counter differs from 1073");
    auto* left=board.AddPlant(3,0,SEED_LEFTPEATER);
    int offsetX=0,offsetY=0;left->GetPeaHeadOffset(offsetX,offsetY);
    std::set<Projectile*> old;
    Projectile* projectile=nullptr;
    while(board.IterateProjectiles(projectile)) old.insert(projectile);
    left->Fire(nullptr,0);
    unsigned created=0;projectile=nullptr;
    while(board.IterateProjectiles(projectile)) if(!old.contains(projectile)) {
        Require(projectile->mPosX==float(left->mX-offsetX+27),"Leftpeater projectile origin is not mirrored");
        ++created;projectile->Die();
    }
    Require(created==1,"Leftpeater fire did not create one projectile");
    auto* squash=board.AddPlant(0,1,SEED_SQUASH);
    squash->mState=STATE_SQUASH_FALLING;squash->mStateCountdown=8;
    squash->mTargetX=board.GridToPixelX(1,1);
    const int y=board.GridToPixelY(1,1)+8;
    squash->UpdateSquash();
    Require(squash->mY==y-96,"Squash falling curve is not the 1073 linear curve");
    pea->Die();left->Die();squash->Die();target->DieNoLoot();
    CheckBloverTiming(app);
    CheckPoolEligibility(app);
    ModernSmoke::Report("portable-plants-shoot35-left-origin-linear-squash",app);
}
