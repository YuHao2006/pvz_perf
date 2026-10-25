#include "../../LawnApp.h"
#include "../../Resources.h"
#include "../../Sexy.TodLib/TodStringFile.h"
#include "../../Sexy.TodLib/TodDebug.h"
#include "AndroidWindow.h"
#include <android_native_app_glue.h>
#include <android/log.h>
#include <exception>

using namespace Sexy;

namespace {
LawnApp* app = nullptr;
bool started = false;

void HandleCommand(android_app* state, int32_t command) {
    switch (command) {
    case APP_CMD_INIT_WINDOW:
        AttachAndroidNativeWindow(state->window);
        break;
    case APP_CMD_TERM_WINDOW:
        AttachAndroidNativeWindow(nullptr);
        break;
    default:
        break;
    }
}
}

void android_main(android_app* state) {
    app_dummy();
    state->onAppCmd = HandleCommand;
    while (!state->window) {
        int events = 0;
        android_poll_source* source = nullptr;
        if (ALooper_pollOnce(-1, nullptr, &events,
                reinterpret_cast<void**>(&source)) >= 0 && source)
            source->process(state, source);
    }
    try {
        gTodStringFormats = gLawnStringFormats;
        gTodStringFormatCount = gLawnStringFormatCount;
        gAppCloseRequest = LawnGetCloseRequest;
        app = new LawnApp();
        app->Init();
        started = true;
        app->Start();
        app->Shutdown();
        app->RethrowLoadingThreadError();
        delete app;
        app = nullptr;
    } catch (const std::exception& error) {
        __android_log_print(ANDROID_LOG_ERROR, "pvz_perf", "%s", error.what());
        if (app) { app->Shutdown(); delete app; app = nullptr; }
    }
}
