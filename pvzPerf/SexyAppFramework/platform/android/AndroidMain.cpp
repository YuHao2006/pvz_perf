#include "../../LawnApp.h"
#include "../../Resources.h"
#include "../../Sexy.TodLib/TodStringFile.h"
#include "../../Sexy.TodLib/TodDebug.h"
#include "AndroidWindow.h"
#include <android_native_app_glue.h>
#include <android/log.h>
#include <exception>
#include <android/asset_manager.h>
#include <filesystem>
#include <fstream>
#include <stdexcept>

using namespace Sexy;

namespace {
LawnApp* app = nullptr;
bool started = false;

void ExtractAsset(AAssetManager* manager, const char* name, const std::filesystem::path& destination) {
    if (!manager) throw std::runtime_error("Android asset manager is unavailable");
    AAsset* asset = AAssetManager_open(manager, name, AASSET_MODE_STREAMING);
    if (!asset) throw std::runtime_error(std::string("Android asset is missing: ") + name);
    const auto closeAsset = [&] { AAsset_close(asset); };
    std::filesystem::create_directories(destination.parent_path());
    std::ofstream output(destination, std::ios::binary | std::ios::trunc);
    if (!output) { closeAsset(); throw std::runtime_error("Cannot create extracted Android asset"); }
    char buffer[1024 * 1024];
    while (true) {
        const int count = AAsset_read(asset, buffer, sizeof(buffer));
        if (count < 0) { closeAsset(); throw std::runtime_error("Cannot read Android asset"); }
        if (count == 0) break;
        output.write(buffer, count);
        if (!output) { closeAsset(); throw std::runtime_error("Cannot write extracted Android asset"); }
    }
    closeAsset();
}

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
        const std::filesystem::path runtimeRoot(state->activity->internalDataPath);
        ExtractAsset(state->activity->assetManager, "main.pak64", runtimeRoot / "main.pak64");
        app->mChangeDirTo = runtimeRoot.string();
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
