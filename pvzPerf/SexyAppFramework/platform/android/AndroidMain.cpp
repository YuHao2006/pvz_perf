#include "Lawn/System/PendingSaveRecovery.h"
#include "../../LawnApp.h"
#include "../../Resources.h"
#include "../../Sexy.TodLib/TodStringFile.h"
#include "../../Sexy.TodLib/TodCommon.h"

#include "SexyAppFramework/platform/ErrorDialog.h"
#include "SexyAppFramework/Common.h"
#include "SexyAppFramework/misc/FloatingPointMode.h"
#include "SexyAppFramework/JsonDoc.h"
#include "SexyAppFramework/graphics/DDInterface.h"
#include "SexyAppFramework/graphics/RenderInterface.h"
#include <android/log.h>
#include <cerrno>
#include <cstdlib>
#include <cstdio>

namespace Sexy {
bool ShowNativeErrorDialog(const char* message, const char* title)
{
    __android_log_print(ANDROID_LOG_FATAL, "pvz_perf", "%s: %s",
        title ? title : "Error", message ? message : "(null)");
    std::fprintf(stderr, "%s: %s\n", title ? title : "Error",
        message ? message : "(null)");
    return true;
}
}

// main.cpp 在 Android 构建中被排除；全局函数指针在此定义（TodCommon.h 声明）。
bool (*gAppCloseRequest)();
bool (*gGetCurrentLevelName)();
bool (*gAppHasUsedCheatKeys)();
bool (*gExtractResourcesByGroup)(class ResourceManager*, int);
#include "../../Sexy.TodLib/TodDebug.h"
#include "AndroidWindow.h"
#include <android_native_app_glue.h>
#include <jni.h>
#include <android/log.h>
#include <android/native_activity.h>
#include <exception>
#include <android/asset_manager.h>
#include <filesystem>
#include <fstream>
#include <stdexcept>

using namespace Sexy;

namespace {
LawnApp* app = nullptr;
bool started = false;

class AndroidLawnApp : public LawnApp
{
public:
    void LoadingThreadCompleted() override
    {
        if (mDDInterface && mDDInterface->mRenderInterface && mDDInterface->mRenderInterface->mRenderer)
            mDDInterface->mRenderInterface->mRenderer->SavePipelineCache();
        LawnApp::LoadingThreadCompleted();
    }
};

// Only benchmark sessions need a transition after the title has prebuilt
// its render cache. Normal games do not run the benchmark update step.
class AndroidBenchmarkApp final : public AndroidLawnApp
{
public:
    bool UpdateApp() override
    {
        const bool updated = LawnApp::UpdateApp();
        if (mRestoreFixture && mTitleScreen && mLoaded && mCacheFramesPrebuilt)
        {
            mRestoreFixture = false;
            LoadingCompleted();
            KillGameSelector();
            PreNewGame(GAMEMODE_SURVIVAL_ENDLESS_STAGE_3, true);
            if (!mBoard || !GetDialog(DIALOG_CONTINUE))
                throw std::runtime_error("GPU benchmark failed to restore the paused fixture");
        }
        return updated;
    }
private:
    bool mRestoreFixture = true;
};

bool ExtractAsset(AAssetManager* manager, const char* name, const std::filesystem::path& destination,
    bool optional = false) {
    if (!manager) throw std::runtime_error("Android asset manager is unavailable");
    AAsset* asset = AAssetManager_open(manager, name, AASSET_MODE_STREAMING);
    if (!asset) {
        if (optional) return false;
        throw std::runtime_error(std::string("Android asset is missing: ") + name);
    }
    const auto closeAsset = [&] { AAsset_close(asset); };
    std::filesystem::create_directories(destination.parent_path());
    std::ofstream output(destination, std::ios::binary | std::ios::trunc);
    if (!output) { closeAsset(); throw std::runtime_error("Cannot create extracted Android asset"); }
    std::vector<char> buffer(1024 * 1024);  // 堆分配：native_app_glue 线程栈扛不住 1MB 栈缓冲（android_main+1206 SEGV 栈溢出案）
    while (true) {
        const int count = AAsset_read(asset, buffer.data(), buffer.size());
        if (count < 0) { closeAsset(); throw std::runtime_error("Cannot read Android asset"); }
        if (count == 0) break;
        output.write(buffer.data(), count);
        if (!output) { closeAsset(); throw std::runtime_error("Cannot write extracted Android asset"); }
    }
    closeAsset();
    return true;
}

// 把 APK assets 下的整目录（如 shaders/）解到运行目录。
void ExtractAssetDirectory(AAssetManager* manager, const char* directory,
    const std::filesystem::path& destination) {
    AAssetDir* dir = AAssetManager_openDir(manager, directory);
    if (!dir) throw std::runtime_error(std::string("Android asset dir is missing: ") + directory);
    const auto closeDir = [dir] { AAssetDir_close(dir); };
    const char* name = nullptr;
    while ((name = AAssetDir_getNextFileName(dir)) != nullptr) {
        const std::string assetPath = std::string(directory) + "/" + name;
        try {
            ExtractAsset(manager, assetPath.c_str(), destination / name);
        } catch (...) {
            closeDir();
            throw;
        }
    }
    closeDir();
}
}

void android_main(android_app* state) {
    Sexy::EnableDenormalFlushForCurrentThread();
    state->onAppCmd = AndroidAppCommand;
    state->onInputEvent = AndroidAppInput;
    BindAndroidApp(state);
    // 诊断文件与可执行目录语义都依赖它；窗口命令在等待循环里就可能触发。
    SetAndroidRuntimeDirectory(state->activity->internalDataPath);
    std::string settingsPath;
    int requestedTargetFps=0;
    int resetEndless=0;
    bool restoreGpuFixture = false;
    try {
    // Prefer the Activity's Android/media directory. Keep the former external
    // files directory as a migration source and a fallback when media is absent.
    {
        std::string appDataDir = state->activity->internalDataPath;
        std::string legacyExternalDir;
        JNIEnv* env = state->activity->env;
        if (env && state->activity->vm) {
            state->activity->vm->AttachCurrentThread(&env, nullptr);
            const jclass cls = env->GetObjectClass(state->activity->clazz);
            // Android equivalent of a launch option; persists through the normal settings file.
            const jmethodID getIntent=env->GetMethodID(cls,"getIntent","()Landroid/content/Intent;");
            const jobject intent=getIntent ? env->CallObjectMethod(state->activity->clazz,getIntent) : nullptr;
            if (!env->ExceptionCheck() && intent) {
                const jclass intentClass=env->GetObjectClass(intent);
                const jmethodID getIntExtra=env->GetMethodID(intentClass,"getIntExtra","(Ljava/lang/String;I)I");
                const jstring key=env->NewStringUTF("targetFps");
                if (getIntExtra) requestedTargetFps=env->CallIntMethod(intent,getIntExtra,key,0);
                const jstring resetKey=env->NewStringUTF("resetEndless");
                if (getIntExtra) resetEndless=env->CallIntMethod(intent,getIntExtra,resetKey,0);
                const jmethodID removeExtra=env->GetMethodID(intentClass,"removeExtra","(Ljava/lang/String;)V");
                if (removeExtra) env->CallVoidMethod(intent,removeExtra,resetKey);
                env->DeleteLocalRef(resetKey);
                env->DeleteLocalRef(key);env->DeleteLocalRef(intentClass);env->DeleteLocalRef(intent);
            }
            if (env->ExceptionCheck()) {env->ExceptionClear();requestedTargetFps=0;}
            const jmethodID getSaveDir = env->GetMethodID(cls, "androidSaveDirectory", "()Ljava/lang/String;");
            const auto saveDir = getSaveDir
                ? static_cast<jstring>(env->CallObjectMethod(state->activity->clazz, getSaveDir)) : nullptr;
            if (env->ExceptionCheck()) env->ExceptionClear();
            if (!saveDir) throw std::runtime_error("Android save directory is busy or unavailable");
            const char* path = env->GetStringUTFChars(saveDir, nullptr);
            if (!path) throw std::runtime_error("Cannot read Android save directory");
            appDataDir = path;
            env->ReleaseStringUTFChars(saveDir, path);
            env->DeleteLocalRef(saveDir);
            const jmethodID getLegacy = env->GetMethodID(cls, "getExternalFilesDir", "(Ljava/lang/String;)Ljava/io/File;");
            const jobject legacyDir = getLegacy ? env->CallObjectMethod(state->activity->clazz, getLegacy, nullptr) : nullptr;
            if (legacyDir && !env->ExceptionCheck()) {
                const jclass fileClass = env->GetObjectClass(legacyDir);
                const jmethodID getPath = env->GetMethodID(fileClass, "getAbsolutePath", "()Ljava/lang/String;");
                const auto legacyPath = getPath ? static_cast<jstring>(env->CallObjectMethod(legacyDir, getPath)) : nullptr;
                if (legacyPath && !env->ExceptionCheck()) {
                    if (const char* chars = env->GetStringUTFChars(legacyPath, nullptr)) {
                        legacyExternalDir = chars;
                        env->ReleaseStringUTFChars(legacyPath, chars);
                    }
                }
                if (legacyPath) env->DeleteLocalRef(legacyPath);
                env->DeleteLocalRef(fileClass);
                env->DeleteLocalRef(legacyDir);
            }
            if (env->ExceptionCheck()) env->ExceptionClear();
            env->DeleteLocalRef(cls);
        }
        // Settings belong to the normal external data directory even when test saves are isolated.
        const std::filesystem::path settingsDirectory(appDataDir);
        settingsPath=(settingsDirectory/"settings.json").string();
        setenv("PVZ_SETTINGS_FILE",settingsPath.c_str(),1);
        const std::filesystem::path internal(state->activity->internalDataPath);
        if (std::filesystem::exists(internal / "gpu-benchmark.enable")) {
            // Keep the original GPU fixture intact while comparing an extra
            // dense case. Both are isolated from normal player data.
            const auto fixture = internal / (std::filesystem::exists(internal / "gpu-benchmark-dense.enable")
                ? "gpu-dense-fixture-20261028" : "gpu-only-fixture-20261027");
            const auto session = internal / "gpu-benchmark-session";
            if (!std::filesystem::is_regular_file(fixture / "game1_58.dat64"))
                throw std::runtime_error("GPU benchmark fixture is missing");
            std::filesystem::create_directories(session);
            for (const char* name : {"game1_58.dat64", "user1.dat64", "users.dat"})
                std::filesystem::copy_file(fixture / name, session / name,
                    std::filesystem::copy_options::overwrite_existing);
            appDataDir = session.string();
            restoreGpuFixture = true;
        }
        setenv("PVZ_APPDATA_DIR", appDataDir.c_str(), 1);
        // Import once, preferring the latest external files over old internal
        // copies. Without a marker, consumed level saves would resurrect on
        // the next launch. Never overwrite files already in the destination.
        PendingSaves::RecoverDirectory(settingsDirectory);
        const auto migrationMarker = settingsDirectory / ".user-data-migrated";
        if (!std::filesystem::exists(migrationMarker)) {
            namespace fs2 = std::filesystem;
            for (const fs2::path& source : {fs2::path(legacyExternalDir), internal}) {
                if (source.empty() || source == settingsDirectory || !fs2::exists(source)) continue;
                for (const auto& entry : fs2::directory_iterator(source)) {
                    if (!entry.is_regular_file()) continue;
                    const auto name = entry.path().filename().string();
                    if (entry.path().extension() != ".dat64" ||
                        (name.rfind("user", 0) != 0 && name.rfind("game", 0) != 0)) continue;
                    const auto to = settingsDirectory / name;
                    if (!fs2::exists(to) && !PendingSaves::Unavailable(to)) fs2::copy_file(entry.path(), to);
                }
                // Publish the profile index only after its records are present.
                for (const char* name : {"settings.json", "scale.json", "users.dat"}) {
                    const auto from = source / name, to = settingsDirectory / name;
                    if (!fs2::exists(to) && fs2::is_regular_file(from)) fs2::copy_file(from, to);
                }
            }
            std::ofstream completed(migrationMarker);
            completed << "1\n";
            completed.close();
            if (!completed) throw std::runtime_error("Cannot commit Android user-data migration");
        }
    }
    while (!state->window) {
        int events = 0;
        android_poll_source* source = nullptr;
        if (ALooper_pollOnce(-1, nullptr, &events,
                reinterpret_cast<void**>(&source)) >= 0 && source)
            source->process(state, source);
    }
        gTodStringFormats = gLawnStringFormats;
        gTodStringFormatCount = gLawnStringFormatCount;
        gAppCloseRequest = LawnGetCloseRequest;
        // Test APKs include the perfect profile and canonical endless start.
        // Publish users.dat last; an interrupted first launch can retry without
        // replacing an established profile or a consumed level save.
        const char* dataPath = std::getenv("PVZ_APPDATA_DIR");
        const std::filesystem::path userDirectory(dataPath ? dataPath : state->activity->internalDataPath);
        // Run after legacy-directory migration so an existing preference is
        // never replaced. Only the first launch creates these Android defaults.
        if (!std::filesystem::exists(settingsPath)) {
            JsonDoc settings;
            settings.SetBool("landscapeUI", true);
            settings.SetBool("autoDetectFrameRate", true);
            if (!settings.SaveFile(settingsPath))
                throw std::runtime_error("Cannot create settings: " + settingsPath);
        }
        const auto scalePath = userDirectory / "scale.json";
        if (!std::filesystem::exists(scalePath)) {
            const auto temporary = userDirectory / "scale.json.tmp";
            ExtractAsset(state->activity->assetManager, "scale.json", temporary);
            std::filesystem::rename(temporary, scalePath);
        }
        setenv("PVZ_SCALE_CONFIG_FILE", scalePath.string().c_str(), 1);
        if (!std::filesystem::exists(userDirectory / "users.dat")) {
            for (const char* name : {"user1.dat64", "game1_58.dat64", "users.dat"}) {
                const std::string asset = std::string("bundled-saves/") + name;
                const auto target = userDirectory / name;
                if (!std::filesystem::exists(target) && !PendingSaves::Unavailable(target))
                    ExtractAsset(state->activity->assetManager, asset.c_str(), target);
            }
        }
        const std::filesystem::path internalDirectory(state->activity->internalDataPath);
        int previousReset=0;
        if (std::ifstream marker(internalDirectory / "endless-reset-token"); marker)
            marker >> previousReset;
        if (resetEndless > 0 && resetEndless != previousReset) {
            const auto level=userDirectory / "game1_58.dat64";
            const std::filesystem::path internal(state->activity->internalDataPath);
            // Explicit benchmark reset replaces only this slot. Do not retain
            // superseded gameplay saves; the bundled baseline is authoritative.
            ExtractAsset(state->activity->assetManager,"bundled-saves/game1_58.dat64",level);
            // Export a copy from the actual application storage namespace for
            // external verification; run-as cannot write that path on all ROMs.
            std::filesystem::copy_file(level,internal / "endless-restored.dat64",
                std::filesystem::copy_options::overwrite_existing);
            // Do not let the old internal migration seed resurrect a consumed
            // level on a later launch after restoring the external slot.
            if (userDirectory != internal)
                std::filesystem::remove(internal / "game1_58.dat64");
            std::ofstream marker(internal / "endless-reset-token", std::ios::trunc);
            if (!(marker << resetEndless)) throw std::runtime_error("Cannot record completed endless reset");
        }
        if (restoreGpuFixture)
            app = new AndroidBenchmarkApp();
        else
            app = new AndroidLawnApp();
        // main.cpp 在安卓构建被排除；gLawnApp（PoolEffect/关卡逻辑依赖）
        // 必须在此补赋值，否则资源加载在 LoadingThreadCompleted 处终止。
        gLawnApp = app;
        const std::filesystem::path runtimeRoot(state->activity->internalDataPath);
        const auto archivePath = runtimeRoot / "main.pak64";
        if (!ExtractAsset(state->activity->assetManager, "main.pak64", archivePath, true) &&
            !std::filesystem::is_regular_file(archivePath))
            throw std::runtime_error("Import main.pak64 in the Android launcher before starting the game");
#ifdef PVZ_VULKAN_LEGACY
        constexpr const char* shaderAssets = "shaders-vk10";
#else
        constexpr const char* shaderAssets = "shaders";
#endif
        __android_log_print(ANDROID_LOG_INFO, "pvz_perf", "Launching %s",
#ifdef PVZ_VULKAN_LEGACY
            "Vulkan 1.0"
#else
            "Vulkan 1.3"
#endif
        );
        ExtractAssetDirectory(state->activity->assetManager, shaderAssets, runtimeRoot / "shaders");
        // libbass.so 不走 assets：数据目录的 so 在 targetSdk 29+ 无法 dlopen，
        // 它随 APK 装进 nativeLibraryDir，由 BassLoader 按 soname 加载。
        SetAndroidRuntimeDirectory(runtimeRoot.string());
        app->mChangeDirTo = runtimeRoot.string();
        if (requestedTargetFps!=0) {
            const auto timing=FrameTiming::FromSetting(requestedTargetFps);
            JsonDoc settings;
            if (std::filesystem::exists(settingsPath) && !settings.LoadFile(settingsPath))
                throw std::runtime_error("Cannot read existing settings: "+settings.mError);
            settings.SetInt("targetFps",timing.mTargetFps);
            if (!settings.SaveFile(settingsPath)) throw std::runtime_error("Cannot save settings: "+settingsPath);
        }
        app->Init();
        started = true;
        app->Start();
        app->Shutdown();
        app->RethrowLoadingThreadError();
        delete app;
        app = nullptr;
        gLawnApp = nullptr;
    } catch (const std::exception& error) {
        __android_log_print(ANDROID_LOG_ERROR, "pvz_perf", "%s", error.what());
        if (app) { app->Shutdown(); delete app; app = nullptr; }
        gLawnApp = nullptr;
    }
    // android_main 返回即 glue 线程终结；finish 的 DESTROY 命令必须先在本
    // 线程泵完，否则 Activity 悬挂、系统报 destroy timeout、进程变僵尸。
    if (state->activity)
        ANativeActivity_finish(state->activity);
    while (!state->destroyRequested) {
        int events = 0;
        android_poll_source* source = nullptr;
        if (ALooper_pollOnce(-1, nullptr, &events,
                reinterpret_cast<void**>(&source)) >= 0 && source)
            source->process(state, source);
    }
}
