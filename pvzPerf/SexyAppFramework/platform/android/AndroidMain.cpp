#include "../../LawnApp.h"
#include "../../Resources.h"
#include "../../Sexy.TodLib/TodStringFile.h"
#include "../../Sexy.TodLib/TodCommon.h"

#include "SexyAppFramework/platform/ErrorDialog.h"
#include "SexyAppFramework/Common.h"
#include "SexyAppFramework/JsonDoc.h"
#include <android/log.h>
#include <cerrno>
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

void ExtractAsset(AAssetManager* manager, const char* name, const std::filesystem::path& destination) {
    if (!manager) throw std::runtime_error("Android asset manager is unavailable");
    AAsset* asset = AAssetManager_open(manager, name, AASSET_MODE_STREAMING);
    if (!asset) throw std::runtime_error(std::string("Android asset is missing: ") + name);
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
    state->onAppCmd = AndroidAppCommand;
    state->onInputEvent = AndroidAppInput;
    BindAndroidApp(state);
    // 诊断文件与可执行目录语义都依赖它；窗口命令在等待循环里就可能触发。
    SetAndroidRuntimeDirectory(state->activity->internalDataPath);
    std::string settingsPath;
    int requestedTargetFps=0;
    // 存档目录：优先应用专属外部存储（JNI 取真实路径，文件管理器可见）；
    // 部分 ROM（实测 nubia Android 14）对本进程直写 Android/data 也拒绝，
    // 探测失败即回退 internalDataPath——存档功能永远优先于可见性。
    {
        std::string appDataDir = state->activity->internalDataPath;
        JNIEnv* env = state->activity->env;
        if (env && state->activity->vm) {
            state->activity->vm->AttachCurrentThread(&env, nullptr);
            const jclass cls = env->GetObjectClass(state->activity->clazz);
            const jmethodID getInfo=env->GetMethodID(cls,"getApplicationInfo","()Landroid/content/pm/ApplicationInfo;");
            const jobject info=getInfo ? env->CallObjectMethod(state->activity->clazz,getInfo) : nullptr;
            if (!env->ExceptionCheck() && info) {
                const jclass infoClass=env->GetObjectClass(info);
                const jfieldID flags=env->GetFieldID(infoClass,"flags","I");
                // ApplicationInfo.FLAG_DEBUGGABLE: FPS only, not cheat/debug input.
                if (flags && (env->GetIntField(info,flags)&2)!=0)
                    setenv("PVZ_ANDROID_TEST_FPS","1",1);
                else
                    unsetenv("PVZ_ANDROID_TEST_FPS");
                env->DeleteLocalRef(infoClass);env->DeleteLocalRef(info);
            }
            if (env->ExceptionCheck()) env->ExceptionClear();
            // Android equivalent of a launch option; persists through the normal settings file.
            const jmethodID getIntent=env->GetMethodID(cls,"getIntent","()Landroid/content/Intent;");
            const jobject intent=getIntent ? env->CallObjectMethod(state->activity->clazz,getIntent) : nullptr;
            if (!env->ExceptionCheck() && intent) {
                const jclass intentClass=env->GetObjectClass(intent);
                const jmethodID getIntExtra=env->GetMethodID(intentClass,"getIntExtra","(Ljava/lang/String;I)I");
                const jstring key=env->NewStringUTF("targetFps");
                if (getIntExtra) requestedTargetFps=env->CallIntMethod(intent,getIntExtra,key,0);
                env->DeleteLocalRef(key);env->DeleteLocalRef(intentClass);env->DeleteLocalRef(intent);
            }
            if (env->ExceptionCheck()) {env->ExceptionClear();requestedTargetFps=0;}
            const jmethodID mid = env->GetMethodID(
                cls, "getExternalFilesDir", "(Ljava/lang/String;)Ljava/io/File;");
            if (mid) {
                const auto file = static_cast<jobject>(
                    env->CallObjectMethod(state->activity->clazz, mid, nullptr));
                if (!env->ExceptionCheck() && file) {
                    const jclass fileCls = env->GetObjectClass(file);
                    const jmethodID getAbs = env->GetMethodID(
                        fileCls, "getAbsolutePath", "()Ljava/lang/String;");
                    const auto jstr = static_cast<jstring>(
                        env->CallObjectMethod(file, getAbs));
                    const char* chars = env->GetStringUTFChars(jstr, nullptr);
                    const std::string external = chars;
                    env->ReleaseStringUTFChars(jstr, chars);
                    // 探测可写：真实 app 进程视角（run-as 域测试会失真）
                    const std::filesystem::path probe =
                        std::filesystem::path(external) / "pvz_probe";
                    if (FILE* f = std::fopen(probe.c_str(), "w")) {
                        std::fputc('x', f);
                        std::fclose(f);
                        std::remove(probe.c_str());
                        appDataDir = external;
                    } else {
                        AndroidDiag("external storage not writable, fallback internal: %s",
                            std::strerror(errno));
                    }
                } else if (env->ExceptionCheck()) {
                    env->ExceptionClear();
                }
            }
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
            setenv("PVZ_ANDROID_GPU_FIXTURE", "1", 1);
        }
        setenv("PVZ_APPDATA_DIR", appDataDir.c_str(), 1);
        // 一次性迁移：旧版把档写在 internal；外部缺档时拷入。
        if (appDataDir != state->activity->internalDataPath) {
            namespace fs2 = std::filesystem;
            const fs2::path legacy(state->activity->internalDataPath);
            const fs2::path external(settingsDirectory);
            std::error_code ec;
            for (const char* name : {"users.dat", "settings.json"}) {
                const fs2::path from = legacy / name, to = external / name;
                std::error_code copyEc;
                if (!fs2::exists(to, copyEc) && fs2::exists(from, copyEc) &&
                    !fs2::copy_file(from, to, copyEc))
                    AndroidDiag("migrate %s failed: %s", name,
                        copyEc.message().c_str());
            }
            for (fs2::directory_iterator it(legacy, ec), end; !ec && it != end;
                 it.increment(ec)) {
                const auto n = it->path().filename().string();
                if (n.rfind("user", 0) != 0 && n.rfind("game", 0) != 0) continue;
                if (it->path().extension() != ".dat64") continue;
                const fs2::path to = external / n;
                std::error_code copyEc;
                if (!fs2::exists(to, copyEc) && !fs2::copy_file(it->path(), to, copyEc))
                    AndroidDiag("migrate %s failed: %s", n.c_str(),
                        copyEc.message().c_str());
            }
        }
    }
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
        // main.cpp 在安卓构建被排除；gLawnApp（PoolEffect/关卡逻辑依赖）
        // 必须在此补赋值，否则资源加载在 LoadingThreadCompleted 处终止。
        gLawnApp = app;
        const std::filesystem::path runtimeRoot(state->activity->internalDataPath);
        ExtractAsset(state->activity->assetManager, "main.pak64", runtimeRoot / "main.pak64");
        ExtractAssetDirectory(state->activity->assetManager, "shaders", runtimeRoot / "shaders");
        // libbass.so 不走 assets：数据目录的 so 在 targetSdk 29+ 无法 dlopen，
        // 它随 APK 装进 nativeLibraryDir，由 BassLoader 按 soname 加载。
        SetAndroidRuntimeDirectory(runtimeRoot.string());
        app->mChangeDirTo = runtimeRoot.string();
        if (requestedTargetFps!=0) {
            if (requestedTargetFps<1) throw std::invalid_argument("targetFps launch option must be positive");
            const auto timing=FrameTiming::FromTargetFps(static_cast<unsigned int>(requestedTargetFps));
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
        AndroidDiag("fatal: %s", error.what());
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
