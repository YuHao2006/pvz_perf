#include "LoadingCloseSmoke.h"
#include "SexyAppFramework/SexyAppBase.h"

// 分层注册（2026-10-07）：主循环尾钩子注入——SexyAppBase 不再认识本夹具
// 头；跨 TU 静态初始化顺序安全（钩子槽 zero-init 先于任何动态初始化）。
namespace
{
struct LoadingCloseSmokeHookRegistrar
{
	LoadingCloseSmokeHookRegistrar() { ::gSexyAppAfterLoopHook = &LoadingCloseSmoke::AfterLoop; }
} gLoadingCloseSmokeHookRegistrar;
}

#include "ModernVulkanSmoke.h"
#include "LawnApp.h"
#include "Sexy.TodLib/TodParticle.h"
#include "Sexy.TodLib/TodCommon.h"
#include "graphics/GpuBackend.h"
#include <atomic>
#include <chrono>
#include <condition_variable>
#include <cstdlib>
#include <fstream>
#include <mutex>
#include <stdexcept>
#include <string>

namespace LoadingCloseSmoke {
namespace {
std::mutex mutex;
std::condition_variable changed;
bool reached=false,requested=false,loopExited=false,releasedByLoop=false,cleanup=false;
std::atomic<unsigned> closeUpdates{0};
const char* Target(){return std::getenv("PVZ_MODERN_CLOSE_DURING_LOADING");}
void Require(bool ok,const char* message){if(!ok) throw std::runtime_error(message);}
void Log(const std::string& message){
    std::ofstream file(ModernSmoke::ProbePath("loading-close.txt"),std::ios::app);
    Require(bool(file),"Cannot write loading-close evidence");file<<message<<std::endl;
}
void Request(LawnApp& app){
    SendMessageW(app.mHWnd,WM_CLOSE,0,0);
    app.DrainWindowMessages();
    Require(app.mCloseRequest,"Close request did not request an orderly exit");
    requested=true;
    Log("close-requested started="+std::to_string(app.mLoadingThreadStarted.load())+
        " completed="+std::to_string(app.mLoadingThreadCompleted.load()));
}
}
bool Enabled(){return Target()!=nullptr;}
void AfterInit(LawnApp& app){
    if(Enabled() && std::string(Target())=="BeforeLoader") {
        Require(!app.mLoadingThreadStarted,"BeforeLoader probe was too late");
        Request(app);
    }
}
void Stage(LawnApp&,const char* stage){
    if(!Enabled() || std::string(Target())!=stage) return;
    std::unique_lock lock(mutex);
    reached=true;changed.notify_all();
    Log(std::string("loader-paused stage=")+stage);
    // Old code busy-spins until this deadline releases the real worker. The
    // corrected loop releases it immediately on exit; no test can strand it.
    releasedByLoop=changed.wait_for(lock,std::chrono::milliseconds(500),[]{return loopExited;});
    Log(std::string("loader-released-by-loop=")+(releasedByLoop?"1":"0"));
}
bool Tick(LawnApp& app){
    if(!Enabled()) return false;
    std::lock_guard lock(mutex);
    if(reached && !requested) Request(app);
    return true;
}
void CloseUpdate(LawnApp& app){
    if(Enabled() && !app.mLoadingThreadCompleted) closeUpdates.fetch_add(1,std::memory_order_relaxed);
}
void AfterLoop(Sexy::SexyAppBase&){
    if(!Enabled()) return;
    std::lock_guard lock(mutex);loopExited=true;changed.notify_all();
    Log("main-loop-exited closeUpdatesWhileLoading="+std::to_string(closeUpdates.load()));
}
void AfterShutdown(LawnApp& app){
    if(!Enabled()) return;
    const bool noWorker=!app.mLoadingThreadStarted ||
        (app.mLoadingThreadCompleted && !app.mLoadingThread.joinable());
    cleanup=app.mShutdown && noWorker && !app.mEffectSystem && !app.mPoolEffect &&
        !app.mZenGarden && !app.mReanimatorCache && !gParticleDefArray && gParticleDefCount==0 &&
        TodWarmQueueEmpty();
    Log("post-shutdown cleanup="+std::to_string(cleanup)+" joined="+std::to_string(noWorker));
}
void AfterDestruction(){
    if(!Enabled()) return;
    const bool beforeLoader=std::string(Target())=="BeforeLoader";
    Require(requested && loopExited,"Loading-close probe did not exercise the close request and main loop");
    Require(beforeLoader || releasedByLoop,"Main loop did not exit until the controlled loader wait timed out");
    Require(closeUpdates.load()<=1,"Loading cancellation repeatedly re-entered Shutdown instead of leaving the loop");
    Require(cleanup && !gLawnApp && !Sexy::gSexyAppBase,"Orderly close skipped game cleanup or app destruction");
    std::ofstream result(ModernSmoke::ProbePath("result.log"),std::ios::app);
    Require(bool(result),"Cannot write loading-close result");
    result<<"PASS loading-close stage="<<Target()<<" request/loop/join/game-cleanup/destruction verified\n";
}
}
