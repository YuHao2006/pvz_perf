#include <vulkan/vulkan.h>
#include "LawnApp.h"
#include "Resources.h"
#include "Sexy.TodLib/TodCommon.h"
#include "Sexy.TodLib/TodStringFile.h"
#include "platform/NativeWindow.h"
#include "platform/ErrorDialog.h"
#include "misc/FloatingPointMode.h"
#include "widget/EditWidget.h"
#include "widget/WidgetManager.h"
#include "HarmonyAudio.h"
#include <napi/native_api.h>
#include <hilog/log.h>
#include <atomic>
#include <chrono>
#include <condition_variable>
#include <filesystem>
#include <thread>
#include <mutex>
#include <vector>
#include <charconv>
#include <algorithm>
#if !defined(PVZ_HARMONY_BACKEND_MODULE)
#include <dlfcn.h>
#include <deviceinfo.h>
#endif
#include <sstream>
#include <fstream>
#include <cstring>

bool (*gAppCloseRequest)();
bool (*gGetCurrentLevelName)();
bool (*gAppHasUsedCheatKeys)();
bool (*gExtractResourcesByGroup)(class ResourceManager*, int);

struct HarmonyGameSession {
    OHNativeWindow* surface = nullptr;
    std::atomic_bool stopping{false};
    std::atomic_bool editing{false};
    std::mutex lifecycleMutex;
    std::condition_variable lifecycleChanged;
    bool foreground = false;
    std::string startupStage;
    std::mutex eventMutex, errorMutex;
    std::vector<Sexy::NativeWindowEvent> pending;
    Sexy::NativePointerState pointer;
    std::string lastError;
};

namespace {
#if !defined(PVZ_HARMONY_BACKEND_MODULE)
HarmonyGameSession ownedSession;
std::thread gameThread;
HarmonyGameSession* session = &ownedSession;
#else
HarmonyGameSession* session = nullptr;
#endif

void stage(const char* what) {
    std::lock_guard lock(session->errorMutex);
    session->startupStage = what;
    OH_LOG_Print(LOG_APP, LOG_INFO, 0, "PvZNative", "%{public}s", what);
}

void report(const char* what) {
    std::lock_guard lock(session->errorMutex);
    session->lastError = what;
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, "PvZNative", "%{public}s", what);
}
#if !defined(PVZ_HARMONY_BACKEND_MODULE)
struct VulkanProbe {
    VkInstance instance{};
    ~VulkanProbe() {
        if (instance) vkDestroyInstance(instance, nullptr);
    }
};

bool supportsSwapchain(VkPhysicalDevice device) {
    uint32_t count = 0;
    if (vkEnumerateDeviceExtensionProperties(device, nullptr, &count, nullptr) != VK_SUCCESS)
        return false;
    std::vector<VkExtensionProperties> extensions(count);
    if (vkEnumerateDeviceExtensionProperties(device, nullptr, &count, extensions.data()) != VK_SUCCESS ||
        std::none_of(extensions.begin(), extensions.end(), [](const auto& extension) {
            return std::strcmp(extension.extensionName, VK_KHR_SWAPCHAIN_EXTENSION_NAME) == 0;
        }))
        return false;
    vkGetPhysicalDeviceQueueFamilyProperties(device, &count, nullptr);
    std::vector<VkQueueFamilyProperties> queues(count);
    vkGetPhysicalDeviceQueueFamilyProperties(device, &count, queues.data());
    return std::any_of(queues.begin(), queues.end(), [](const auto& queue) {
        return queue.queueCount > 0 && (queue.queueFlags & VK_QUEUE_GRAPHICS_BIT);
    });
}

bool supportsRenderImages(VkPhysicalDevice device, VkFormat format, bool modern) {
    VkFormatFeatureFlags required = VK_FORMAT_FEATURE_COLOR_ATTACHMENT_BIT |
        VK_FORMAT_FEATURE_COLOR_ATTACHMENT_BLEND_BIT | VK_FORMAT_FEATURE_SAMPLED_IMAGE_BIT |
        VK_FORMAT_FEATURE_SAMPLED_IMAGE_FILTER_LINEAR_BIT | VK_FORMAT_FEATURE_STORAGE_IMAGE_BIT;
    if (modern) required |= VK_FORMAT_FEATURE_TRANSFER_SRC_BIT | VK_FORMAT_FEATURE_TRANSFER_DST_BIT;
    constexpr VkImageUsageFlags usage = VK_IMAGE_USAGE_COLOR_ATTACHMENT_BIT |
        VK_IMAGE_USAGE_TRANSFER_SRC_BIT | VK_IMAGE_USAGE_TRANSFER_DST_BIT |
        VK_IMAGE_USAGE_SAMPLED_BIT | VK_IMAGE_USAGE_STORAGE_BIT;
    VkFormatProperties properties{};
    vkGetPhysicalDeviceFormatProperties(device, format, &properties);
    VkImageFormatProperties image{};
    return (properties.optimalTilingFeatures & required) == required &&
        vkGetPhysicalDeviceImageFormatProperties(device, format, VK_IMAGE_TYPE_2D,
            VK_IMAGE_TILING_OPTIMAL, usage, 0, &image) == VK_SUCCESS;
}

enum class VulkanMode { Automatic, Modern, Compatible };

bool inspectDriver(const std::string& directory, VulkanMode requested) {
    std::ostringstream details;
    uint32_t loader = VK_API_VERSION_1_0;
    const auto enumerate = reinterpret_cast<PFN_vkEnumerateInstanceVersion>(
        vkGetInstanceProcAddr(nullptr, "vkEnumerateInstanceVersion"));
    if (enumerate && enumerate(&loader) != VK_SUCCESS) loader = VK_API_VERSION_1_0;
    const auto version = [](uint32_t v) {
        return std::to_string(VK_VERSION_MAJOR(v)) + "." + std::to_string(VK_VERSION_MINOR(v)) +
            "." + std::to_string(VK_VERSION_PATCH(v));
    };
    details << "Vulkan loader " << version(loader);

    VkApplicationInfo ai{VK_STRUCTURE_TYPE_APPLICATION_INFO};
    ai.apiVersion = std::min(loader, uint32_t(VK_API_VERSION_1_3));
    VkInstanceCreateInfo ci{VK_STRUCTURE_TYPE_INSTANCE_CREATE_INFO};
    ci.pApplicationInfo = &ai;
    VulkanProbe probe;
    auto result = vkCreateInstance(&ci, nullptr, &probe.instance);
    if (result != VK_SUCCESS && ai.apiVersion >= VK_API_VERSION_1_3) {
        details << "\nVulkan 1.3 instance failed: " << int(result);
        ai.apiVersion = VK_API_VERSION_1_0;
        result = vkCreateInstance(&ci, nullptr, &probe.instance);
    }
    bool modern = false, compatible = false;
    if (result == VK_SUCCESS) {
        uint32_t count = 0;
        if (vkEnumeratePhysicalDevices(probe.instance, &count, nullptr) == VK_SUCCESS && count) {
            std::vector<VkPhysicalDevice> devices(count);
            if (vkEnumeratePhysicalDevices(probe.instance, &count, devices.data()) == VK_SUCCESS) {
                for (auto device : devices) {
                    VkPhysicalDeviceProperties props{};
                    vkGetPhysicalDeviceProperties(device, &props);
                    VkPhysicalDeviceFeatures base{};
                    vkGetPhysicalDeviceFeatures(device, &base);
                    const bool swapchain = supportsSwapchain(device);
                    const bool rgba8 = supportsRenderImages(device, VK_FORMAT_R8G8B8A8_UNORM, false);
                    const bool rgba16f = supportsRenderImages(device, VK_FORMAT_R16G16B16A16_SFLOAT, true);
                    compatible |= swapchain && rgba8;
                    details << "\n" << props.deviceName << " API " << version(props.apiVersion)
                        << " swapchain=" << swapchain << " dualSrcBlend=" << base.dualSrcBlend
                        << " renderRGBA8=" << rgba8 << " renderRGBA16F=" << rgba16f;
                    if (!swapchain || ai.apiVersion < VK_API_VERSION_1_3 || props.apiVersion < VK_API_VERSION_1_3)
                        continue;
                    VkPhysicalDeviceVulkan13Features v13{VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VULKAN_1_3_FEATURES};
                    VkPhysicalDeviceVulkan12Features v12{VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VULKAN_1_2_FEATURES, &v13};
                    VkPhysicalDeviceFeatures2 features{VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FEATURES_2, &v12};
                    vkGetPhysicalDeviceFeatures2(device, &features);
                    details << "\nsynchronization2=" << v13.synchronization2
                        << " partiallyBound=" << v12.descriptorBindingPartiallyBound
                        << " sampledImageUpdateAfterBind=" << v12.descriptorBindingSampledImageUpdateAfterBind
                        << " nonUniformIndexing=" << v12.shaderSampledImageArrayNonUniformIndexing;
                    modern |= rgba16f && v13.synchronization2 && v12.descriptorBindingPartiallyBound &&
                        v12.descriptorBindingSampledImageUpdateAfterBind && v12.shaderSampledImageArrayNonUniformIndexing;
                }
            }
        }
    } else {
        details << "\nVulkan instance error: " << int(result);
    }
    const bool selectModern=modern && requested!=VulkanMode::Compatible;
    const bool selectCompatible=compatible && requested!=VulkanMode::Modern && !selectModern;
    details << "\nRequested: " << (requested==VulkanMode::Modern ? "Vulkan 1.3" :
        requested==VulkanMode::Compatible ? "Vulkan 1.0" : "automatic");
    details << "\nSelected: " << (selectModern ? "Vulkan 1.3 bindless" :
        selectCompatible ? "Vulkan 1.0 compatibility" : "unavailable");
    const auto text = details.str();
    std::ofstream(directory + "/vulkan-report.txt") << text << "\n";
    OH_LOG_Print(LOG_APP, LOG_INFO, 0, "PvZNative", "%{public}s", text.c_str());
    if (requested==VulkanMode::Modern && !selectModern)
        throw std::runtime_error("当前设备缺少 Vulkan 1.3 后端要求的特性，请选择 Vulkan 1.0。");
    if (!selectModern && !selectCompatible)
        throw std::runtime_error("当前设备无法运行所选 Vulkan 后端。");
    return selectModern;
}
#endif
void runApplication(const std::string& directory) {
    try {
        Sexy::EnableDenormalFlushForCurrentThread();
        std::filesystem::current_path(directory);
        const auto saves = std::filesystem::path(directory) / "userdata";
        std::filesystem::create_directories(saves);
        setenv("PVZ_APPDATA_DIR", saves.c_str(), 1);
        gTodStringFormats = gLawnStringFormats;
        gTodStringFormatCount = gLawnStringFormatCount;
        gAppCloseRequest = LawnGetCloseRequest;
        auto app = std::make_unique<LawnApp>();
        gLawnApp = app.get();
        app->mChangeDirTo = directory;
        stage("04 Initializing game and renderer");
        app->Init();
        stage("05 Starting game loop");
        app->Start();
        app->Shutdown();
        app->RethrowLoadingThreadError();
    } catch (const std::exception& e) { report(e.what()); }
    gLawnApp = nullptr;
}
#if !defined(PVZ_HARMONY_BACKEND_MODULE)
void runGame(const std::string& directory, VulkanMode requested) {
    {
        std::unique_lock lock(session->lifecycleMutex);
        session->lifecycleChanged.wait(lock, [] {
            return session->foreground || session->stopping;
        });
        if (session->stopping) return;
    }
    try {
        const char* model = OH_GetProductModel();
        OH_LOG_Print(LOG_APP, LOG_INFO, 0, "PvZVulkanWSI", "Vulkan-only diagnosis on %{public}s",
            model ? model : "unknown model");
        stage("02 Checking Vulkan device and surface");
        if (inspectDriver(directory, requested)) {
            stage("03 Starting Vulkan 1.3 renderer");
            runApplication(directory);
            return;
        }
        // Keep the library loaded: it owns game globals and may be used after a surface restart.
        static void* library = nullptr;
        if (!library) library = dlopen("libpvz_legacy.so", RTLD_NOW | RTLD_LOCAL);
        if (!library) throw std::runtime_error(std::string("无法加载 Vulkan 兼容后端：") + dlerror());
        using RunLegacy = void (*)(HarmonyGameSession*, const char*);
        stage("03 Starting Vulkan compatibility renderer");
        const auto runLegacy = reinterpret_cast<RunLegacy>(dlsym(library, "PvzRunLegacy"));
        if (!runLegacy) throw std::runtime_error("Vulkan 兼容后端缺少启动入口");
        runLegacy(session, directory.c_str());
    } catch (const std::exception& e) { report(e.what()); }
}
std::string stringArg(napi_env env, napi_value arg) {
    size_t size = 0;
    napi_get_value_string_utf8(env, arg, nullptr, 0, &size);
    std::string str(size + 1, 0);
    napi_get_value_string_utf8(env, arg, str.data(), str.size(), &size);
    str.resize(size);
    return str;
}
void stopGame() {
    {
        std::lock_guard lock(session->lifecycleMutex);
        session->stopping = true;
    }
    session->lifecycleChanged.notify_all();
    if (gameThread.joinable()) gameThread.join();
    if (session->surface) OH_NativeWindow_DestroyNativeWindow(session->surface);
    session->surface = nullptr;
    std::lock_guard lock(session->eventMutex);
    session->pending.clear();
    session->pointer = {};
    session->editing = false;
}
napi_value start(napi_env env,napi_callback_info info) {
    napi_value args[3]; size_t count=3;
    napi_get_cb_info(env,info,&count,args,nullptr,nullptr);
    if (count<2) return nullptr;
    const auto mode=count==3 ? stringArg(env,args[2]) : std::string{};
    const auto requested=mode=="1.3" ? VulkanMode::Modern :
        mode=="1.0" ? VulkanMode::Compatible : VulkanMode::Automatic;
    stopGame();
    {
        std::lock_guard lock(session->errorMutex);
        session->lastError.clear();
    }
    stage("01 Acquiring native game surface");
    const auto id=stringArg(env,args[0]);
    uint64_t numeric=0;
    if(std::from_chars(id.data(),id.data()+id.size(),numeric).ec!=std::errc{} ||
       OH_NativeWindow_CreateNativeWindowFromSurfaceId(numeric,&session->surface)!=0) {
        report("Could not acquire HarmonyOS surface"); return nullptr;
    }
    auto directory=stringArg(env,args[1]);
    int32_t width=0,height=0;
    const int geometry=OH_NativeWindow_NativeWindowHandleOpt(session->surface,GET_BUFFER_GEOMETRY,&height,&width);
    const std::string native="Native window geometry result="+std::to_string(geometry)+
        " "+std::to_string(width)+"x"+std::to_string(height);
    std::ofstream(directory + "/vulkan-wsi.log",std::ios::trunc) << native << "\n";
    OH_LOG_Print(LOG_APP, LOG_INFO, 0, "PvZVulkanWSI", "%{public}s", native.c_str());
    session->stopping=false;
    gameThread=std::thread(runGame,std::move(directory),requested);
    return nullptr;
}
napi_value stop(napi_env,napi_callback_info) { stopGame();return nullptr; }
napi_value setForeground(napi_env env, napi_callback_info info) {
    napi_value arg;
    size_t count = 1;
    bool foreground = false;
    napi_get_cb_info(env, info, &count, &arg, nullptr, nullptr);
    if (count != 1 || napi_get_value_bool(env, arg, &foreground) != napi_ok) return nullptr;
    {
        std::lock_guard lock(session->lifecycleMutex);
        session->foreground = foreground;
    }
    session->lifecycleChanged.notify_all();
    return nullptr;
}
napi_value startupStatus(napi_env env, napi_callback_info) {
    napi_value result;
    std::lock_guard lock(session->errorMutex);
    napi_create_string_utf8(env, session->startupStage.c_str(), session->startupStage.size(), &result);
    return result;
}
napi_value status(napi_env env,napi_callback_info) {
    napi_value result;
    std::lock_guard lock(session->errorMutex);
    napi_create_string_utf8(env,session->lastError.c_str(),session->lastError.size(),&result);
    return result;
}
napi_value touch(napi_env env,napi_callback_info info) {
    napi_value a[4]; size_t n=4; napi_get_cb_info(env,info,&n,a,nullptr,nullptr);
    if(n!=4 || !session->surface)return nullptr;
    int32_t kind=0,id=0;Sexy::NativeWindowEvent event{};
    napi_get_value_int32(env,a[0],&kind);napi_get_value_int32(env,a[1],&id);
    napi_get_value_double(env,a[2],&event.x);napi_get_value_double(env,a[3],&event.y);
    using Kind=Sexy::NativeWindowEventKind;
    constexpr Kind kinds[]={Kind::TouchBegan,Kind::TouchMoved,Kind::TouchEnded,Kind::TouchCanceled};
    if(kind<0||kind>3)return nullptr;
    event.kind=kinds[kind];event.touchId=uint32_t(id);
    std::lock_guard lock(session->eventMutex);
    session->pending.push_back(event);
    return nullptr;
}
napi_value mouse(napi_env env, napi_callback_info info) {
    napi_value args[4];
    size_t count = 4;
    napi_get_cb_info(env, info, &count, args, nullptr, nullptr);
    if (count != 4 || !session->surface) return nullptr;

    int32_t action = 0, button = 0;
    double x = 0, y = 0;
    napi_get_value_int32(env, args[0], &action);
    napi_get_value_int32(env, args[1], &button);
    napi_get_value_double(env, args[2], &x);
    napi_get_value_double(env, args[3], &y);
    std::lock_guard lock(session->eventMutex);
    session->pointer = {x, y, action != 3};
    if (action == 1 || action == 2) {
        Sexy::NativeWindowEvent event{};
        event.kind = Sexy::NativeWindowEventKind::MouseButton;
        event.button = button;
        event.pressed = action == 1;
        event.x = x;
        event.y = y;
        event.timeMs = std::chrono::duration_cast<std::chrono::milliseconds>(
            std::chrono::steady_clock::now().time_since_epoch()).count();
        session->pending.push_back(event);
    }
    return nullptr;
}
napi_value key(napi_env env, napi_callback_info info) {
    napi_value args[3];
    size_t count = 3;
    napi_get_cb_info(env, info, &count, args, nullptr, nullptr);
    if (count != 3 || !session->surface) return nullptr;
    uint32_t symbol = 0, character = 0;
    bool pressed = false;
    napi_get_value_uint32(env, args[0], &symbol);
    napi_get_value_bool(env, args[1], &pressed);
    napi_get_value_uint32(env, args[2], &character);
    std::lock_guard lock(session->eventMutex);
    if (symbol) {
        Sexy::NativeWindowEvent event{};
        event.kind = Sexy::NativeWindowEventKind::Key;
        event.key = symbol;
        event.pressed = pressed;
        session->pending.push_back(event);
    }
    if (pressed && character >= 32 && character <= 126) {
        Sexy::NativeWindowEvent event{};
        event.kind = Sexy::NativeWindowEventKind::Text;
        event.text = character;
        session->pending.push_back(event);
    }
    return nullptr;
}
napi_value insertText(napi_env env, napi_callback_info info) {
    napi_value arg;
    size_t count = 1;
    napi_get_cb_info(env, info, &count, &arg, nullptr, nullptr);
    if (count != 1 || !session->editing.load()) return nullptr;
    const auto value = stringArg(env, arg);
    std::lock_guard lock(session->eventMutex);
    for (unsigned char character : value) {
        if (character < 32 || character > 126) continue;
        Sexy::NativeWindowEvent event{};
        event.kind = Sexy::NativeWindowEventKind::Text;
        event.text = character;
        session->pending.push_back(event);
    }
    return nullptr;
}
napi_value isEditing(napi_env env, napi_callback_info) {
    napi_value result;
    napi_get_boolean(env, session->editing.load(), &result);
    return result;
}
napi_value init(napi_env env,napi_value exports) {
    napi_property_descriptor methods[]={
        {"start",nullptr,start},{"stop",nullptr,stop},{"touch",nullptr,touch},
        {"mouse",nullptr,mouse},{"key",nullptr,key},{"insertText",nullptr,insertText},
        {"isEditing",nullptr,isEditing},{"status",nullptr,status},
        {"setForeground",nullptr,setForeground},{"startupStatus",nullptr,startupStatus}};
    napi_define_properties(env,exports,std::size(methods),methods);return exports;
}
napi_module mod{1,0,nullptr,init,"pvz",nullptr,{0}};
__attribute__((constructor)) void registerGame(){napi_module_register(&mod);}
#endif
}

#if defined(PVZ_HARMONY_BACKEND_MODULE)
#if defined(PVZ_GPU_WEBGL)
#define PVZ_HARMONY_BACKEND_ENTRY PvzRunGles
#else
#define PVZ_HARMONY_BACKEND_ENTRY PvzRunLegacy
#endif
extern "C" __attribute__((visibility("default"))) void PVZ_HARMONY_BACKEND_ENTRY(HarmonyGameSession* state, const char* directory) {
    session = state;
    runApplication(directory);
    session = nullptr;
}
#endif
namespace Sexy {
bool ShowNativeErrorDialog(const char* msg,const char*) {report(msg);return true;}
struct NativeWindow::Impl { NativeWindowConfig config; bool firstPump = true; };
NativeWindow::NativeWindow(const NativeWindowConfig& c):impl_(std::make_unique<Impl>()) {
    impl_->config=c; Focused=Visible=true;
    OH_NativeWindow_NativeWindowHandleOpt(session->surface,GET_BUFFER_GEOMETRY,&Height,&Width);
}
NativeWindow::~NativeWindow()=default;
void NativeWindow::PumpEvents() {
    {
        std::unique_lock lock(session->lifecycleMutex);
        if (!session->foreground && !session->stopping) {
            lock.unlock();
            stopOutput();
            if (gLawnApp) gLawnApp->NativeFocusChanged(false);
            session->editing = false;
            OH_LOG_Print(LOG_APP, LOG_INFO, 0, "PvZNative", "Background: game and audio suspended");
            lock.lock();
            session->lifecycleChanged.wait(lock, [] {
                return session->foreground || session->stopping;
            });
            lock.unlock();
            {
                std::lock_guard eventsLock(session->eventMutex);
                session->pending.clear();
                session->pointer = {};
            }
            if (!session->stopping) {
                if (gLawnApp) {
                    gLawnApp->NativeFocusChanged(true);
                    gLawnApp->ClearUpdateBacklog(false);
                }
                startOutput();
                OH_LOG_Print(LOG_APP, LOG_INFO, 0, "PvZNative", "Foreground: game and audio resumed");
            }
        }
    }
    if (impl_->firstPump) {
        std::lock_guard lock(session->errorMutex);
        session->startupStage.clear();
        impl_->firstPump = false;
        OH_LOG_Print(LOG_APP, LOG_INFO, 0, "PvZNative", "06 Game loop running");
    }
    std::vector<NativeWindowEvent> events;
    {std::lock_guard lock(session->eventMutex);events.swap(session->pending);}
    if(session->stopping.load())events.push_back({NativeWindowEventKind::Close});
    int h=0,w=0;
    if (!OH_NativeWindow_NativeWindowHandleOpt(session->surface,GET_BUFFER_GEOMETRY,&h,&w) && w>0 && h>0 && (Width!=w||Height!=h)) {
        Height=h;Width=w;NativeWindowEvent e{NativeWindowEventKind::Resize};e.width=w;e.height=h;events.push_back(e);
    }
    for(const auto& e:events)impl_->config.callback(impl_->config.callbackContext,e);
    const auto* manager = gLawnApp ? gLawnApp->mWidgetManager : nullptr;
    session->editing = manager && dynamic_cast<EditWidget*>(manager->mFocusWidget) != nullptr;
}
NativePointerState NativeWindow::SamplePointer() {
    std::lock_guard lock(session->eventMutex);
    return session->pointer;
}
void NativeWindow::Show(){Visible=true;}
void NativeWindow::ApplyCursor(NativeCursor){}
void NativeWindow::SetTitle(const std::string&){}
void NativeWindow::SetFullscreen(bool){}
void NativeWindow::Resize(int,int){}
bool NativeWindow::Minimized()const{return !Visible;}
double NativeWindow::RefreshRate()const{return 60.;}
NativeWindowBackend NativeWindow::Backend()const{return NativeWindowBackend::HarmonyOS;}
NativeSurfaceHandles NativeWindow::SurfaceHandles()const{return {nullptr,session->surface,0};}
}
