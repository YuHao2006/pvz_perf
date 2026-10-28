// Standalone functional regression. Uses only its own fixture application/window;
// no loading thread, Board, save mutation or interaction with other game processes.
#define WIN32_LEAN_AND_MEAN
#define NOMINMAX
#define PSAPI_VERSION 2
#include <windows.h>
#include <psapi.h>
#include "LawnApp.h"
#include "Sexy.TodLib/TodStringFile.h"
#include "SexyAppFramework/graphics/DDInterface.h"
#include "SexyAppFramework/graphics/RenderInterface.h"
#include "SexyAppFramework/platform/windows/WindowApi.h"
#include <cstdio>
#include <cstdlib>
#include <filesystem>
#include <stdexcept>

bool (*gAppCloseRequest)();
namespace {
class FixtureApp : public LawnApp {
public:
    using Sexy::SexyAppBase::ReconfigureScale;
    void DoParseCmdLine() override { mCmdLineParsed=true; }
    // Production Init always calls ReadFromRegistry and mode changes always
    // call WriteToRegistry. Suppress both only in this functional fixture.
    void ReadFromRegistry() override {}
    void WriteToRegistry() override {}
    void Popup(const std::string& text) override { throw std::runtime_error(text); }
    void Popup(const std::wstring& text) override {
        throw std::runtime_error(std::string(text.begin(),text.end()));
    }
};
void Require(bool condition,const char* message) {
    if(!condition)throw std::runtime_error(message);
}
void Memory(const char* stage) {
    PROCESS_MEMORY_COUNTERS_EX counters{};counters.cb=sizeof(counters);
    Require(K32GetProcessMemoryInfo(GetCurrentProcess(),
        reinterpret_cast<PROCESS_MEMORY_COUNTERS*>(&counters),sizeof(counters))!=FALSE,
        "GetProcessMemoryInfo failed");
    std::printf("memory,%s,working_set_mib=%.3f,private_commit_mib=%.3f\n",stage,
        double(counters.WorkingSetSize)/(1024*1024),double(counters.PrivateUsage)/(1024*1024));
    std::fflush(stdout);
}
void Check(FixtureApp& app,const char* stage,bool enabled,bool windowed) {
    auto& renderer=*app.mDDInterface->mRenderInterface->mRenderer;
    const auto counts=renderer.GetScaleCounts();
    std::printf("scale,%s,prepared=%u,enabled=%u,windowed=%u,programs=%zu,lookups=%zu,writable_images=%zu\n",
        stage,unsigned(app.mModernScalePrepared),unsigned(app.mUseCustomScale),unsigned(app.mIsWindowed),
        counts.programs,counts.lookups,counts.writableImages);
    Memory(stage);
    Require(app.mModernScalePrepared==enabled,"scale prepared state differs from enabled state");
    Require(app.mUseCustomScale==enabled,"scale option differs from requested state");
    Require(app.mIsWindowed==windowed,"screen mode transaction failed");
    Require(enabled?counts.writableImages>0:counts.writableImages==0,
        "scale writable images were missing or retained while disabled");
    Require(!app.mLoadingThreadStarted,"functional scale fixture started the game loader");
}
}
int main(int argc,char** argv) {
    SetErrorMode(SEM_FAILCRITICALERRORS|SEM_NOGPFAULTERRORBOX|SEM_NOOPENFILEERRORBOX);
    FixtureApp* application=nullptr;
    try {
        Require(argc==2,"Pass the paired Release runtime directory");
        const auto runtime=std::filesystem::absolute(argv[1]);
        Require(std::filesystem::is_directory(runtime),"Release directory does not exist");
        Require(std::filesystem::is_regular_file(runtime/"scale.json"),"Release scale.json is required");
        Require(Sexy::NativeWindowsWindowApi::EnableSystemDpiAwareness(),"Cannot set DPI awareness");
        const auto profile=std::filesystem::temp_directory_path()/
            ("pvz-scale-residency-"+std::to_string(GetCurrentProcessId())+"-"+std::to_string(GetTickCount64()));
        Require(std::filesystem::create_directory(profile),"Cannot create isolated test profile");
        Require(_putenv_s("PVZ_APPDATA_DIR",profile.string().c_str())==0,"Cannot set process-local fixture profile");
        std::printf("fixture_profile,%s\n",profile.string().c_str());
        gTodStringFormats=gLawnStringFormats;gTodStringFormatCount=gLawnStringFormatCount;
        gAppCloseRequest=LawnGetCloseRequest;
        Memory("before_init");
        application=new FixtureApp;
        auto& app=*application;gLawnApp=application;
        app.mChangeDirTo=runtime.string();
        app.mReadFromRegistry=false;app.mUseCustomScale=false;app.mIsWindowed=true;
        app.mNoSoundNeeded=true;app.mCmdLineParsed=true;app.mOnlyAllowOneCopyToRun=false;
        app.mTodCheatKeys=true;app.mShowFPS=false;
        app.Init();
        Require(!app.mLoadingFailed,"fixture Init failed");
        Check(app,"startup_disabled",false,true);
        app.ReconfigureScale(true); Check(app,"first_enable",true,true);
        app.ReconfigureScale(false);Check(app,"first_disable",false,true);
        app.ReconfigureScale(true); Check(app,"second_enable",true,true);
        app.ReconfigureScale(false);Check(app,"second_disable",false,true);
        app.RequestScreenMode(false,true);Check(app,"fullscreen_and_enable",true,false);
        app.RequestScreenMode(true,false);Check(app,"windowed_and_disable",false,true);
        app.Shutdown();
        delete application;application=nullptr;
        Memory("after_destroy");
        std::puts("PASS scale residency: disabled startup, enable/release/re-enable, combined mode transactions");
        return 0;
    }catch(const std::exception& error){
        std::fprintf(stderr,"FAIL scale residency: %s\n",error.what());
        if(application){
            try{application->Shutdown();delete application;}catch(...){ }
        }
        return 1;
    }
}
