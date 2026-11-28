#pragma once
#include "NativeHandles.h"
#include "misc/FrameTiming.h"
#include <atomic>
#include <string>
namespace Sexy {
class SexyAppBase;
class MusicInterface;
// Selected by the executable's platform target, with no per-frame dispatch.
void HostSleepFor(unsigned int milliseconds);
void HostSleepUntil(FrameDeadline::TimePoint deadline);
void HostYield();
void HostRunMainLoop(SexyAppBase& app);
std::string HostResourceArchivePath();
std::string HostInstanceLockPath();

// Each host supplies its update step at compile time. The iOS step owns its
// autorelease pool, while the native and browser steps call UpdateApp directly.
template<class App, class Update>
void RunApplicationLoop(App& app, Update update)
{
    while (!app.mShutdown && !app.mLoadingFailed)
    {
        if (app.mExitToTop)
            app.mExitToTop = false;
        update(app);
        HostYield();
    }
}
// Cold-path platform migration. Native platforms load DFU; Web migrates offline before starting the game.
bool HostUpgradeLevelSaveFile(const std::string& path);
void HostStartLoading(SexyAppBase& app, void (*entry)(void*));
void HostFinishResourcePrewarm(SexyAppBase& app, const std::atomic<bool>& closeRequest);
MusicInterface* HostCreateMusic(bool disabled, NativeWindowHandle window);
}
