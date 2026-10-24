#include <iostream>
#include <stdexcept>
#include <string>
#include <cstring>
#include <set>
#include <algorithm>
#include "VulkanContext.h"
#include "VulkanSurfaceFormat.h"
#include "VulkanSurfaceExtent.h"
#include "VulkanEnumeration.h"
#include "platform/SurfacePlatform.h"

// 宏在预处理器阶段做文本替换，namespace 对它无效——习惯上放在 include 之后
#define VK_CHECK(expr) \
    do { if (const VkResult result_ = (expr); result_ != VK_SUCCESS) \
        throw VulkanCallError(result_, #expr); } while (0)

namespace {
    static constexpr char kValidationLayerName[] = "VK_LAYER_KHRONOS_validation";

    // ---- 进程级内部状态：static = 进程级共享存储，应用不可见。对外共享
    // 的进程级句柄（physicalDevice/device/队列族/队列）是类的 public
    // static 成员，声明在头文件，不在这里。 ----
    static bool appInitialized = false;
    static int contextCount = 0;
    static VulkanInitConfig initConfigSnapshot{};  // init 的配置快照（首窗口选卡要用）
    static VkInstance instance = VK_NULL_HANDLE;
    static VkDebugUtilsMessengerEXT debugMessenger = VK_NULL_HANDLE;
    static VulkanGpuFilter gpuFilter =
        [](VkPhysicalDevice) { return true; };
    static VkPhysicalDeviceFeatures deviceFeatures{};

    // ---- 纯创建函数：吃参数、返结果，不碰 VulkanContext 的任何成员 ----
    // 放无名 namespace = 内部链接，只属于本文件，不进全局符号表。

    VkInstance CreateInstanceImpl(const VulkanInitConfig& config,
                                  const std::vector<const char*>& extensions,
                                  const std::vector<const char*>& layers) {
        unsigned int loaderVersion = 0;
        VK_CHECK(vkEnumerateInstanceVersion(&loaderVersion));
        if (loaderVersion < VK_API_VERSION_1_2 || config.appInfo.apiVersion < VK_API_VERSION_1_2)
            throw std::runtime_error("This renderer requires Vulkan 1.2");
        // Instance WSI extensions and requested validation/extra layers.
        VkInstanceCreateInfo createInfo = config.instanceInfo;
        createInfo.sType = VK_STRUCTURE_TYPE_INSTANCE_CREATE_INFO;   // 强制
        createInfo.pApplicationInfo = &config.appInfo;               // 强制指向配置内的 appInfo
        createInfo.enabledExtensionCount =
            static_cast<uint32_t>(extensions.size());
        createInfo.ppEnabledExtensionNames = extensions.data();
        createInfo.enabledLayerCount = static_cast<uint32_t>(layers.size());
        createInfo.ppEnabledLayerNames = layers.data();

        VkInstance instance = VK_NULL_HANDLE;
        VK_CHECK(vkCreateInstance(&createInfo, nullptr, &instance));
        return instance;
    }

    // Explicit diagnostics are a requirement, not a best-effort fallback.
    // A normal release launch leaves enableValidation false and needs no SDK.
    VkInstance CreateConfiguredInstance(const VulkanInitConfig& config) {
        const auto layers = EnumerateVulkan<VkLayerProperties>(
            "vkEnumerateInstanceLayerProperties", vkEnumerateInstanceLayerProperties);
        std::vector<const char*> layerNames = config.extraLayers;
        if (config.enableValidation) layerNames.push_back(kValidationLayerName);
        for (const char* name : layerNames) {
            if (!name) throw std::invalid_argument("Vulkan layer name is null");
            if (std::none_of(layers.begin(), layers.end(), [name](const auto& layer) {
                return std::strcmp(layer.layerName, name) == 0;
            }))
                throw VulkanCallError(VK_ERROR_LAYER_NOT_PRESENT, std::string("Required Vulkan layer ") + name);
        }
        std::vector<const char*> extensions{
            VK_KHR_SURFACE_EXTENSION_NAME, VulkanSurfacePlatform::extension};
        if (config.enableValidation) {
            extensions.push_back(VK_EXT_DEBUG_UTILS_EXTENSION_NAME);
        }
        extensions.insert(extensions.end(), config.extraExtensions.begin(),
                          config.extraExtensions.end());
        return CreateInstanceImpl(config, extensions, layerNames);
    }

    // 注册调试回调：错误/警告按严重级别过滤输出。回调函数指针由配置给定。
    // 这个扩展不是核心 API，需要经 vkGetInstanceProcAddr 取函数指针。
    VkDebugUtilsMessengerEXT RegisterDebugMessenger(
        VkInstance instance, PFN_vkDebugUtilsMessengerCallbackEXT callback) {
        if (!callback) throw std::invalid_argument("Vulkan validation callback is null");
        VkDebugUtilsMessengerCreateInfoEXT debugInfo{
            VK_STRUCTURE_TYPE_DEBUG_UTILS_MESSENGER_CREATE_INFO_EXT};
        debugInfo.messageSeverity =
            VK_DEBUG_UTILS_MESSAGE_SEVERITY_WARNING_BIT_EXT |
            VK_DEBUG_UTILS_MESSAGE_SEVERITY_ERROR_BIT_EXT;
        debugInfo.messageType =
            VK_DEBUG_UTILS_MESSAGE_TYPE_GENERAL_BIT_EXT |
            VK_DEBUG_UTILS_MESSAGE_TYPE_VALIDATION_BIT_EXT |
            VK_DEBUG_UTILS_MESSAGE_TYPE_PERFORMANCE_BIT_EXT;
        debugInfo.pfnUserCallback = callback;
        auto create = reinterpret_cast<PFN_vkCreateDebugUtilsMessengerEXT>(
            vkGetInstanceProcAddr(instance,
                                  "vkCreateDebugUtilsMessengerEXT"));
        VkDebugUtilsMessengerEXT messenger = VK_NULL_HANDLE;
        if (!create) throw std::runtime_error("Requested Vulkan debug messenger entry point is unavailable");
        VK_CHECK(create(instance, &debugInfo, nullptr, &messenger));
        return messenger;
    }

    // 自动过滤器 1：候选卡必须支持全部要求的设备扩展
    bool DeviceExtensionsSupported(VkPhysicalDevice candidate,
                                   const std::vector<const char*>& required) {
        const auto avail = EnumerateVulkan<VkExtensionProperties>(
            "vkEnumerateDeviceExtensionProperties", [candidate](uint32_t* count, VkExtensionProperties* values) {
                return vkEnumerateDeviceExtensionProperties(candidate, nullptr, count, values);
            });
        for (const char* name : required)
        {
            bool found = false;
            for (const auto& e : avail)
                if (std::strcmp(e.extensionName, name) == 0) { found = true; break; }
            if (!found)
                return false;
        }
        return true;
    }

    // 自动过滤器 2：请求开启的每个功能位都必须受支持。
    // VkPhysicalDeviceFeatures 的成员全是 VkBool32，规范布局无填充，
    // 按数组逐位比较安全且完备。
    bool DeviceFeaturesSupported(VkPhysicalDevice candidate,
                                 const VkPhysicalDeviceFeatures& wanted) {
        VkPhysicalDeviceFeatures supported{};
        vkGetPhysicalDeviceFeatures(candidate, &supported);
        constexpr uint32_t kBoolCount =
            sizeof(VkPhysicalDeviceFeatures) / sizeof(VkBool32);
        const VkBool32* w = reinterpret_cast<const VkBool32*>(&wanted);
        const VkBool32* s = reinterpret_cast<const VkBool32*>(&supported);
        for (uint32_t i = 0; i < kBoolCount; ++i)
            if (w[i] == VK_TRUE && s[i] != VK_TRUE)
                return false;
        return true;
    }

    bool RequiredFeaturesSupported(VkPhysicalDevice candidate) {
        VkPhysicalDeviceProperties properties{};
        vkGetPhysicalDeviceProperties(candidate, &properties);
        if (properties.apiVersion < VK_API_VERSION_1_2)
            return false;
        VkPhysicalDeviceVulkan12Features v12{
            VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VULKAN_1_2_FEATURES};
        VkPhysicalDeviceFeatures2 features2{
            VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FEATURES_2, &v12};
        vkGetPhysicalDeviceFeatures2(candidate, &features2);
        return v12.descriptorBindingPartiallyBound == VK_TRUE &&
               v12.descriptorBindingSampledImageUpdateAfterBind == VK_TRUE &&
               v12.shaderSampledImageArrayNonUniformIndexing == VK_TRUE;
    }

    VkPhysicalDeviceVulkan12Features DescriptorIndexingEnable() {
        VkPhysicalDeviceVulkan12Features v12{
            VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VULKAN_1_2_FEATURES};
        v12.descriptorBindingPartiallyBound = VK_TRUE;
        v12.descriptorBindingSampledImageUpdateAfterBind = VK_TRUE;
        v12.shaderSampledImageArrayNonUniformIndexing = VK_TRUE;
        return v12;
    }

    // 选卡：打分制（独显 +1000），同时带回 graphics/present 队列族下标。
    // 过滤顺序：自动生成的扩展/功能过滤器 → 调用者的 gpuFilter。
    VkPhysicalDevice PickPhysicalDevice(VkInstance instance, VkSurfaceKHR surface,
                                        VulkanGpuFilter gpuFilter,
                                        const std::vector<const char*>& requiredExtensions,
                                        const VkPhysicalDeviceFeatures& wantedFeatures,
                                        uint32_t& outGraphicsFamily,
                                        uint32_t& outPresentFamily) {
        const auto devices = EnumerateVulkan<VkPhysicalDevice>(
            "vkEnumeratePhysicalDevices", [instance](uint32_t* count, VkPhysicalDevice* values) {
                return vkEnumeratePhysicalDevices(instance, count, values);
            });
        if (devices.empty())
            throw std::runtime_error("没有找到支持 Vulkan 的显卡");

        int bestScore = -1;
        VkPhysicalDevice best = VK_NULL_HANDLE;
        for (VkPhysicalDevice candidate : devices)
        {
            // 自动过滤器先行：扩展/功能/descriptor indexing 不支持的候选根本不进打分
            if (!DeviceExtensionsSupported(candidate, requiredExtensions))
                continue;
            if (!DeviceFeaturesSupported(candidate, wantedFeatures))
                continue;
            if (!RequiredFeaturesSupported(candidate))
                continue;

            if (!gpuFilter(candidate))
                continue;                    // 调用者的谓词有一票否决权

            uint32_t graphics = UINT32_MAX, present = UINT32_MAX;
            uint32_t familyCount = 0;
            vkGetPhysicalDeviceQueueFamilyProperties(candidate, &familyCount,
                                                     nullptr);
            std::vector<VkQueueFamilyProperties> families(familyCount);
            vkGetPhysicalDeviceQueueFamilyProperties(candidate, &familyCount,
                                                     families.data());
            for (uint32_t i = 0; i < familyCount; ++i)
            {
                if (families[i].queueFlags & VK_QUEUE_GRAPHICS_BIT)
                    graphics = i;
                VkBool32 presentSupport = VK_FALSE;
                VK_CHECK(vkGetPhysicalDeviceSurfaceSupportKHR(candidate, i, surface,
                                                     &presentSupport));
                if (presentSupport)
                    present = i;
                if (graphics != UINT32_MAX && present != UINT32_MAX)
                    break;
            }
            if (graphics == UINT32_MAX || present == UINT32_MAX)
                continue;

            // 交换链支持是硬性要求
            uint32_t formatCount = 0, modeCount = 0;
            VK_CHECK(vkGetPhysicalDeviceSurfaceFormatsKHR(candidate, surface,
                                                 &formatCount, nullptr));
            VK_CHECK(vkGetPhysicalDeviceSurfacePresentModesKHR(candidate, surface,
                                                      &modeCount, nullptr));
            if (formatCount == 0 || modeCount == 0)
                continue;

            VkPhysicalDeviceProperties props{};
            vkGetPhysicalDeviceProperties(candidate, &props);
            int score = 0;
            if (props.deviceType == VK_PHYSICAL_DEVICE_TYPE_DISCRETE_GPU)
                score += 1000;
            score += static_cast<int>(props.limits.maxImageDimension2D);

            if (score > bestScore)
            {
                bestScore = score;
                best = candidate;
                outGraphicsFamily = graphics;
                outPresentFamily = present;
            }
        }
        if (best == VK_NULL_HANDLE)
            throw std::runtime_error("No GPU supports Vulkan 1.2, descriptor indexing and graphics/present");

        return best;
    }

    // 逻辑设备：按两个队列族各建一条队列，启用配置要求的设备扩展。
    // VK_KHR_swapchain 由库强制加上（窗口呈现的底线）。
    // 设备功能（wantedFeatures）默认全关——要用各向异性过滤等功能时，
    // 由 InitConfig.features 置位传入。
    VkDevice CreateLogicalDevice(VkPhysicalDevice physicalDevice,
                                 uint32_t graphicsFamily, uint32_t presentFamily,
                                 const VkPhysicalDeviceFeatures& wantedFeatures,
                                 const std::vector<const char*>& deviceExtensions,
                                 VkQueue* outGraphicsQueue, VkQueue* outPresentQueue) {
        float priority = 1.0F;   // 1.0 = 最高调度优先级（单队列场景实际无效果）
        std::set<uint32_t> uniqueFamilies = {graphicsFamily, presentFamily};
        std::vector<VkDeviceQueueCreateInfo> queueInfos;
        for (uint32_t family : uniqueFamilies)
        {
            VkDeviceQueueCreateInfo info{
                VK_STRUCTURE_TYPE_DEVICE_QUEUE_CREATE_INFO};
            info.queueFamilyIndex = family;
            info.queueCount = 1;
            info.pQueuePriorities = &priority;
            queueInfos.push_back(info);
        }

        // swapchain 扩展由库强制加上；其余来自配置
        std::vector<const char*> extensions = deviceExtensions;
        if (std::find(extensions.begin(), extensions.end(),
                      VK_KHR_SWAPCHAIN_EXTENSION_NAME) == extensions.end())
            extensions.push_back(VK_KHR_SWAPCHAIN_EXTENSION_NAME);

        VkPhysicalDeviceVulkan12Features v12 = DescriptorIndexingEnable();

        VkDeviceCreateInfo createInfo{VK_STRUCTURE_TYPE_DEVICE_CREATE_INFO};
        createInfo.pNext = &v12;
        createInfo.queueCreateInfoCount =
            static_cast<uint32_t>(queueInfos.size());
        createInfo.pQueueCreateInfos = queueInfos.data();
        createInfo.pEnabledFeatures = &wantedFeatures;
        createInfo.enabledExtensionCount =
            static_cast<uint32_t>(extensions.size());
        createInfo.ppEnabledExtensionNames = extensions.data();

        VkDevice device = VK_NULL_HANDLE;
        VK_CHECK(vkCreateDevice(physicalDevice, &createInfo, nullptr, &device));
        vkGetDeviceQueue(device, graphicsFamily, 0, outGraphicsQueue);
        vkGetDeviceQueue(device, presentFamily, 0, outPresentQueue);
        return device;
    }
}

// ---- 配置里的默认回调实现：放 .cpp，头文件就不必为 std::cerr 引头文件 ----
VkBool32 VKAPI_CALL VulkanInitConfig::DefaultDebugCallback(
    VkDebugUtilsMessageSeverityFlagBitsEXT severity,
    VkDebugUtilsMessageTypeFlagsEXT,
    const VkDebugUtilsMessengerCallbackDataEXT* data, void*)
{
    // Never globally suppress a VUID: the same diagnostic may describe a real
    // image-format/usage mismatch in a different resource.
    if (severity >= VK_DEBUG_UTILS_MESSAGE_SEVERITY_WARNING_BIT_EXT)
        std::cerr << "[validation] " << data->pMessage << '\n';
    return VK_FALSE;
}

// Instance state is shared; the first attached surface selects the GPU.
void VulkanContext::InitializeVulkan(const VulkanInitConfig& config) {
    if (appInitialized)
        return;                               // 幂等：重复调用直接跳过
    initConfigSnapshot = config;                     // 首窗口选卡时要读 deviceExtensions/features

    try {
        instance = CreateConfiguredInstance(config);
        if (config.enableValidation)
            debugMessenger = RegisterDebugMessenger(instance, config.debugCallback);
        gpuFilter = config.gpuFilter;
        deviceFeatures = config.features;
        appInitialized = true;
    } catch (...) {
        // Unwind the partially initialized instance and preserve the failure.
        if (debugMessenger) {
            auto destroy = reinterpret_cast<PFN_vkDestroyDebugUtilsMessengerEXT>(
                vkGetInstanceProcAddr(instance, "vkDestroyDebugUtilsMessengerEXT"));
            if (destroy) destroy(instance, debugMessenger, nullptr);
            debugMessenger = VK_NULL_HANDLE;
        }
        if (instance) vkDestroyInstance(instance, nullptr);
        instance = VK_NULL_HANDLE;
        throw;
    }
}

// ---- 每窗口：swapchain + 图像视图 ----
VkExtent2D VulkanContext::QueryDrawableExtent() const {
    return VulkanSurfacePlatform::DrawableExtent(hwnd, surfaceSuspended_);
}

std::optional<VkExtent2D> VulkanContext::QuerySwapchainExtent(VkSurfaceCapabilitiesKHR& caps) const {
    const auto drawable = QueryDrawableExtent();
    if (!drawable.width || !drawable.height)
        return std::nullopt;
    VK_CHECK(vkGetPhysicalDeviceSurfaceCapabilitiesKHR(physicalDevice,surface,&caps));
    return ChooseVulkanSurfaceExtent(caps,static_cast<int>(drawable.width),
                                    static_cast<int>(drawable.height));
}

void VulkanContext::CreateSwapchain(const VkSurfaceCapabilitiesKHR& caps, VkExtent2D extent) {

    // 从用户预填的创建信息出发；依赖 caps/窗口的字段随后由库强制覆写
    VkSwapchainCreateInfoKHR scInfo = swapchainConfig_;
    scInfo.sType = VK_STRUCTURE_TYPE_SWAPCHAIN_CREATE_INFO_KHR;   // 强制
    scInfo.surface = surface;

    const auto formats = EnumerateVulkan<VkSurfaceFormatKHR>(
        "vkGetPhysicalDeviceSurfaceFormatsKHR", [this](uint32_t* count, VkSurfaceFormatKHR* values) {
            return vkGetPhysicalDeviceSurfaceFormatsKHR(physicalDevice, surface, count, values);
        });
    if (formats.empty()) throw std::runtime_error("Vulkan surface advertises no formats");
    const auto chosenFormat=ChooseVulkanSurfaceFormat(formats,scInfo.imageFormat,scInfo.imageColorSpace);
    scInfo.imageFormat=swapchainFormat=chosenFormat.format;
    scInfo.imageColorSpace=swapchainColorSpace=chosenFormat.colorSpace;

    // 呈现模式：FIFO 规范保证可用；请求的模式不支持时自然回退 FIFO
    const auto modes = EnumerateVulkan<VkPresentModeKHR>(
        "vkGetPhysicalDeviceSurfacePresentModesKHR", [this](uint32_t* count, VkPresentModeKHR* values) {
            return vkGetPhysicalDeviceSurfacePresentModesKHR(physicalDevice, surface, count, values);
        });
    if (modes.empty()) throw std::runtime_error("Vulkan surface advertises no present modes");
    VkPresentModeKHR chosenMode = VK_PRESENT_MODE_FIFO_KHR;
    for (VkPresentModeKHR mode : modes)
        if (mode == scInfo.presentMode)
            chosenMode = mode;
    scInfo.presentMode = chosenMode;

    // Extent and capabilities are one validated snapshot, queried before
    // dismantling the old resources. Window configuration is not a fallback.
    scInfo.imageExtent = extent;
    swapchainExtent = extent;

    // 图像数 = 最小值 + 1：避免 CPU 等待 GPU 释放图像；上限再钳一次
    uint32_t imageCount = caps.minImageCount + 1;
    if (caps.maxImageCount > 0 && imageCount > caps.maxImageCount)
        imageCount = caps.maxImageCount;
    scInfo.minImageCount = imageCount;

    scInfo.imageArrayLayers = 1;
    // 图像属于哪个队列族：graphics 与 present 同族时 EXCLUSIVE 最高效
    uint32_t families[] = {graphicsFamily, presentFamily};
    if (graphicsFamily != presentFamily)
    {
        scInfo.imageSharingMode = VK_SHARING_MODE_CONCURRENT;
        scInfo.queueFamilyIndexCount = 2;
        scInfo.pQueueFamilyIndices = families;
    }
    else
    {
        scInfo.imageSharingMode = VK_SHARING_MODE_EXCLUSIVE;
    }
    scInfo.preTransform = caps.currentTransform;
    // Some Linux compositors do not advertise OPAQUE. Preserve the caller's
    // supported mode; otherwise select one the presentation engine accepts.
    if (!(caps.supportedCompositeAlpha & scInfo.compositeAlpha)) {
        constexpr VkCompositeAlphaFlagBitsKHR candidates[]{
            VK_COMPOSITE_ALPHA_OPAQUE_BIT_KHR,
            VK_COMPOSITE_ALPHA_PRE_MULTIPLIED_BIT_KHR,
            VK_COMPOSITE_ALPHA_POST_MULTIPLIED_BIT_KHR,
            VK_COMPOSITE_ALPHA_INHERIT_BIT_KHR};
        for (const VkCompositeAlphaFlagBitsKHR candidate : candidates)
            if (caps.supportedCompositeAlpha & candidate) {
                scInfo.compositeAlpha = candidate;
                break;
            }
        if (!(caps.supportedCompositeAlpha & scInfo.compositeAlpha))
            throw std::runtime_error("Vulkan surface advertises no supported composite alpha mode");
    }

    VK_CHECK(vkCreateSwapchainKHR(device, &scInfo, nullptr, &swapchain));

    // 实际图像数量可能与 minImageCount+1 不同，再查一次拿真值
    swapchainImages = EnumerateVulkan<VkImage>(
        "vkGetSwapchainImagesKHR", [this](uint32_t* count, VkImage* values) {
            return vkGetSwapchainImagesKHR(device, swapchain, count, values);
        });
    if (swapchainImages.empty()) throw std::runtime_error("Vulkan swapchain has no images");

    // 视图：包一层让 shader/attachment 能引用图像（短，并入 swapchain 流程）
    swapchainViews.resize(swapchainImages.size());
    for (size_t i = 0; i < swapchainImages.size(); ++i)
    {
        VkImageViewCreateInfo view{VK_STRUCTURE_TYPE_IMAGE_VIEW_CREATE_INFO};
        view.image = swapchainImages[i];
        view.viewType = VK_IMAGE_VIEW_TYPE_2D;
        view.format = swapchainFormat;
        view.subresourceRange.aspectMask = VK_IMAGE_ASPECT_COLOR_BIT;
        view.subresourceRange.levelCount = 1;
        view.subresourceRange.layerCount = 1;
        VK_CHECK(vkCreateImageView(device, &view, nullptr, &swapchainViews[i]));
    }
    ++swapchainGeneration;
}

void VulkanContext::CreateRenderPass() {
    VkAttachmentDescription color{};
    color.format = swapchainFormat;
    color.samples = VK_SAMPLE_COUNT_1_BIT;
    // Presentation overwrites the game rectangle and explicitly clears any
    // letterbox bands. No swapchain pixel depends on its previous contents.
    color.loadOp = VK_ATTACHMENT_LOAD_OP_DONT_CARE;
    color.storeOp = VK_ATTACHMENT_STORE_OP_STORE;
    color.stencilLoadOp = VK_ATTACHMENT_LOAD_OP_DONT_CARE;
    color.stencilStoreOp = VK_ATTACHMENT_STORE_OP_DONT_CARE;
    color.initialLayout = VK_IMAGE_LAYOUT_UNDEFINED;   // 不关心旧内容
    color.finalLayout = VK_IMAGE_LAYOUT_PRESENT_SRC_KHR; // 结束即可呈现

    VkAttachmentReference colorRef{};
    colorRef.attachment = 0;
    colorRef.layout = VK_IMAGE_LAYOUT_COLOR_ATTACHMENT_OPTIMAL;

    VkSubpassDescription subpass{};
    subpass.pipelineBindPoint = VK_PIPELINE_BIND_POINT_GRAPHICS;
    subpass.colorAttachmentCount = 1;
    subpass.pColorAttachments = &colorRef;

    // The acquire semaphore is waited at COLOR_ATTACHMENT_OUTPUT. The implicit
    // UNDEFINED -> COLOR_ATTACHMENT layout transition must itself depend on
    // that wait, not only the later color writes. A default TOP_OF_PIPE
    // external dependency allows the transition to race presentation reads.
    VkSubpassDependency acquireDependency{};
    acquireDependency.srcSubpass = VK_SUBPASS_EXTERNAL;
    acquireDependency.dstSubpass = 0;
    acquireDependency.srcStageMask = VK_PIPELINE_STAGE_COLOR_ATTACHMENT_OUTPUT_BIT;
    acquireDependency.dstStageMask = VK_PIPELINE_STAGE_COLOR_ATTACHMENT_OUTPUT_BIT;
    acquireDependency.dstAccessMask = VK_ACCESS_COLOR_ATTACHMENT_WRITE_BIT;

    // Release side: the implicit COLOR_ATTACHMENT -> PRESENT_SRC transition at
    // vkCmdEndRenderPass is itself an image write. Without a subpass ->
    // EXTERNAL dependency its availability scope is empty, so the color
    // attachment writes are not ordered/flushed relative to that transition
    // and the presentation engine's read — sync validation reports
    // PRESENT_AFTER_WRITE for every present. This dependency is the render
    // pass equivalent of the explicit release barrier the dynamic-rendering
    // backend records before signaling the present semaphore.
    VkSubpassDependency releaseDependency{};
    releaseDependency.srcSubpass = 0;
    releaseDependency.dstSubpass = VK_SUBPASS_EXTERNAL;
    releaseDependency.srcStageMask = VK_PIPELINE_STAGE_COLOR_ATTACHMENT_OUTPUT_BIT;
    releaseDependency.srcAccessMask = VK_ACCESS_COLOR_ATTACHMENT_WRITE_BIT;
    releaseDependency.dstStageMask = VK_PIPELINE_STAGE_BOTTOM_OF_PIPE_BIT;
    releaseDependency.dstAccessMask = VK_ACCESS_MEMORY_READ_BIT;
    releaseDependency.dependencyFlags = VK_DEPENDENCY_BY_REGION_BIT;

    const VkSubpassDependency dependencies[] = {acquireDependency, releaseDependency};

    VkRenderPassCreateInfo rpInfo{
        VK_STRUCTURE_TYPE_RENDER_PASS_CREATE_INFO};
    rpInfo.attachmentCount = 1;
    rpInfo.pAttachments = &color;
    rpInfo.subpassCount = 1;
    rpInfo.pSubpasses = &subpass;
    rpInfo.dependencyCount = 2;
    rpInfo.pDependencies = dependencies;
    VK_CHECK(vkCreateRenderPass(device, &rpInfo, nullptr, &renderPass));
}

// ---- 帧循环托管设施：framebuffers（随交换链重建）+ 命令/同步（一次性）----
void VulkanContext::CreateFramebuffers() {
    framebuffers_.resize(swapchainViews.size());
    for (size_t i = 0; i < swapchainViews.size(); ++i) {
        VkFramebufferCreateInfo info{
            VK_STRUCTURE_TYPE_FRAMEBUFFER_CREATE_INFO};
        info.renderPass = renderPass;
        info.attachmentCount = 1;
        info.pAttachments = &swapchainViews[i];
        info.width = swapchainExtent.width;
        info.height = swapchainExtent.height;
        info.layers = 1;
        VK_CHECK(vkCreateFramebuffer(device, &info, nullptr,
                                     &framebuffers_[i]));
    }
}

void VulkanContext::CreateFrameLoopAssets() {
    // RESET_COMMAND_BUFFER_BIT：每帧整条重录（demo 级简单，不做复用优化）
    VkCommandPoolCreateInfo poolInfo{
        VK_STRUCTURE_TYPE_COMMAND_POOL_CREATE_INFO};
    poolInfo.flags = VK_COMMAND_POOL_CREATE_RESET_COMMAND_BUFFER_BIT;
    poolInfo.queueFamilyIndex = graphicsFamily;
    VK_CHECK(vkCreateCommandPool(device, &poolInfo, nullptr, &commandPool_));

    VkCommandBufferAllocateInfo allocInfo{
        VK_STRUCTURE_TYPE_COMMAND_BUFFER_ALLOCATE_INFO};
    allocInfo.commandPool = commandPool_;
    allocInfo.level = VK_COMMAND_BUFFER_LEVEL_PRIMARY;
    allocInfo.commandBufferCount = 1;
    VK_CHECK(vkAllocateCommandBuffers(device, &allocInfo, &commandBuffer_));

    // 栅栏限制单帧在途；取图信号量单份即可（每次提交都会等它）
    VkSemaphoreCreateInfo semInfo{VK_STRUCTURE_TYPE_SEMAPHORE_CREATE_INFO};
    VkFenceCreateInfo fenceInfo{VK_STRUCTURE_TYPE_FENCE_CREATE_INFO};
    fenceInfo.flags = VK_FENCE_CREATE_SIGNALED_BIT;
    VK_CHECK(vkCreateSemaphore(device, &semInfo, nullptr, &imageAvailable_));
    VK_CHECK(vkCreateFence(device, &fenceInfo, nullptr, &inFlight_));

    CreatePresentSemaphores();   // 呈现信号量必须每交换链图像一个
}

// 呈现信号量按图像索引建：MAILBOX 下旧图的 present 可能还"占用"着上一份
// 信号量，共用一份会触发复用警告（校验层 VUID-vkQueueSubmit-pSignalSemaphores）
void VulkanContext::CreatePresentSemaphores() {
    for (VkSemaphore s : renderFinished_)
        if (s) vkDestroySemaphore(device, s, nullptr);
    renderFinished_.clear();
    renderFinished_.resize(swapchainImages.size());
    VkSemaphoreCreateInfo semInfo{VK_STRUCTURE_TYPE_SEMAPHORE_CREATE_INFO};
    for (VkSemaphore& s : renderFinished_)
        VK_CHECK(vkCreateSemaphore(device, &semInfo, nullptr, &s));
}

VulkanContext::VulkanContext(const VulkanInitConfig& config, NativeWindowHandle borrowedWindow,
                             const VkSwapchainCreateInfoKHR& swapchainConfig)
    : hwnd(borrowedWindow), swapchainConfig_(swapchainConfig) {
    VulkanSurfacePlatform::Validate(hwnd);
    try {
        InitializeVulkan(config);
        ++contextCount;
        counted_ = true;
        CreateSurfaceAssets();
    } catch (...) { DestroyAssets(); throw; }
}

void VulkanContext::CreateSurfaceAssets() {
    surface = VulkanSurfacePlatform::Create(instance, hwnd);

    if (device == VK_NULL_HANDLE)
    {
        // 首窗口：直接用本窗口的 surface 选卡——不需要任何引导窗口。
        std::vector<const char*> requiredExtensions = initConfigSnapshot.deviceExtensions;
        requiredExtensions.push_back(VK_KHR_SWAPCHAIN_EXTENSION_NAME);
        physicalDevice = PickPhysicalDevice(instance, surface, gpuFilter,
                                            requiredExtensions, deviceFeatures,
                                            graphicsFamily, presentFamily);
#if defined(PVZ_REANIM_UNIFIED)
        if (initConfigSnapshot.allowOptionalGeometryShader) {
            VkPhysicalDeviceFeatures supported{};
            vkGetPhysicalDeviceFeatures(physicalDevice,&supported);
            deviceFeatures.geometryShader=supported.geometryShader;
        }
#endif
        device = CreateLogicalDevice(physicalDevice, graphicsFamily,
                                     presentFamily, deviceFeatures,
                                     requiredExtensions,
                                     &graphicsQueue, &presentQueue);
        geometryShaderEnabled = deviceFeatures.geometryShader == VK_TRUE;
    }

    // present 守门员：后续窗口可能落在另一块显卡驱动的显示器上（混合显卡
    // 的边角场景），这里检查不过就大声失败。
    VkBool32 presentOK = VK_FALSE;
    VK_CHECK(vkGetPhysicalDeviceSurfaceSupportKHR(physicalDevice, presentFamily, surface,
                                         &presentOK));
    if (!presentOK)
        throw std::runtime_error("所选显卡无法呈现到该窗口");

    VkSurfaceCapabilitiesKHR caps{};
    const auto extent=QuerySwapchainExtent(caps);
    if (!extent)
        throw std::runtime_error("Initial Vulkan surface has no drawable extent");
    CreateSwapchain(caps,*extent);     // Initial window must supply a drawable surface.
    CreateRenderPass();                // 每窗口：renderPass
    CreateFramebuffers();              // 帧循环托管：framebuffers + 命令 + 同步
    CreateFrameLoopAssets();
}

// ---- 交换链及下游重建：等空闲 → 销毁视图/交换链 → 重建 → 格式变了连 renderPass。
// All surface framebuffers/renderPass assets are owned by this GPU context.
bool VulkanContext::RecreateSwapchain() {
    if (frameActive_)
        throw std::logic_error("Cannot rebuild a swapchain while recording a frame");
    if (device == VK_NULL_HANDLE || swapchain == VK_NULL_HANDLE)
        throw std::logic_error("Cannot recreate an uninitialized Vulkan swapchain");
    swapchainDirty_=true;
    VkSurfaceCapabilitiesKHR caps{};
    auto extent=QuerySwapchainExtent(caps);
    if (!extent) return false; // No wait, destruction, or invented dimensions.
    VK_CHECK(vkDeviceWaitIdle(device));       // Report device loss, do not destroy/rebuild as if it succeeded.
    // The surface can change while the GPU drains. Recheck before destruction.
    extent=QuerySwapchainExtent(caps);
    if (!extent) return false;

    for (VkFramebuffer fb : framebuffers_)   // framebuffer 引用着视图，先拆
        if (fb) vkDestroyFramebuffer(device, fb, nullptr);
    framebuffers_.clear();
    for (VkImageView view : swapchainViews)
        if (view) vkDestroyImageView(device, view, nullptr);
    swapchainViews.clear();
    vkDestroySwapchainKHR(device, swapchain, nullptr);
    swapchain = VK_NULL_HANDLE;

    const VkFormat oldFormat = swapchainFormat;
    CreateSwapchain(caps,*extent);
    if (oldFormat != swapchainFormat) {       // 格式变了 → renderPass 兼容性破坏
        vkDestroyRenderPass(device, renderPass, nullptr);
        renderPass = VK_NULL_HANDLE;
        CreateRenderPass();
    }
    CreateFramebuffers();   // 新尺寸（或新格式 → 新 renderPass）下重包 framebuffer
    CreatePresentSemaphores();   // 图像数量可能变了；已等 idle，拆建安全
    swapchainDirty_ = false;
    return true;
}

void VulkanContext::WaitForFrame() {
    VK_CHECK(vkWaitForFences(device, 1, &inFlight_, VK_TRUE, UINT64_MAX));
}

void VulkanContext::NotifySurfaceSuspended(bool suspended) {
    if (surfaceSuspended_ == suspended) return;
    surfaceSuspended_ = suspended;
    swapchainDirty_ = true;
}

VulkanContext::FrameContext VulkanContext::BeginCommands() {
    if (frameActive_)
        throw std::runtime_error("上一帧还没 EndFrame");
    const auto drawable = QueryDrawableExtent();
    if (!drawable.width || !drawable.height)
        return {}; // Do not acquire images from a minimized surface.
    if (swapchainDirty_ || drawable.width != swapchainExtent.width ||
        drawable.height != swapchainExtent.height)
        if (!RecreateSwapchain()) return {};
    WaitForFrame();

    uint32_t imageIndex = 0;
    const auto acquired=vkAcquireNextImageKHR(device, swapchain, UINT64_MAX,
        imageAvailable_, VK_NULL_HANDLE,&imageIndex);
    if (acquired == VK_ERROR_OUT_OF_DATE_KHR) {
        swapchainDirty_=true;     // Next frame rebuilds only when the surface is drawable.
        return {};                // valid=false
    }
    if (acquired != VK_SUCCESS && acquired != VK_SUBOPTIMAL_KHR)
        throw std::runtime_error("vkAcquireNextImageKHR 失败: " +
                                 std::to_string(static_cast<int>(acquired)));

    swapchainDirty_ = acquired == VK_SUBOPTIMAL_KHR;
    // Keep the fence signaled throughout recording. Reset only immediately
    // before submit: a recording failure must not leave a permanently unsignaled fence.
    VK_CHECK(vkResetCommandBuffer(commandBuffer_, 0));
    VkCommandBufferBeginInfo beginInfo{
        VK_STRUCTURE_TYPE_COMMAND_BUFFER_BEGIN_INFO};
    beginInfo.flags = VK_COMMAND_BUFFER_USAGE_ONE_TIME_SUBMIT_BIT;
    VK_CHECK(vkBeginCommandBuffer(commandBuffer_, &beginInfo));

    frameActive_ = true;
    currentImageIndex_ = imageIndex;
    return {commandBuffer_, imageIndex, swapchainExtent, true};
}

void VulkanContext::BeginPresentPass(VkClearColorValue clearColor) {
    if (!frameActive_ || presentPassActive_)
        throw std::logic_error("Invalid presentation pass state");

    VkClearValue clear{};
    clear.color = clearColor;
    VkRenderPassBeginInfo passBegin{
        VK_STRUCTURE_TYPE_RENDER_PASS_BEGIN_INFO};
    passBegin.renderPass = renderPass;
    passBegin.framebuffer = framebuffers_[currentImageIndex_];
    passBegin.renderArea.offset = {0, 0};
    passBegin.renderArea.extent = swapchainExtent;
    passBegin.clearValueCount = 1;
    passBegin.pClearValues = &clear;
    vkCmdBeginRenderPass(commandBuffer_, &passBegin, VK_SUBPASS_CONTENTS_INLINE);

    // viewport/scissor 恒动态：每帧按当前交换链尺寸设
    VkViewport viewport{};
    viewport.width = static_cast<float>(swapchainExtent.width);
    viewport.height = static_cast<float>(swapchainExtent.height);
    viewport.maxDepth = 1.0F;
    VkRect2D scissor{{0, 0}, swapchainExtent};
    vkCmdSetViewport(commandBuffer_, 0, 1, &viewport);
    vkCmdSetScissor(commandBuffer_, 0, 1, &scissor);

    presentPassActive_ = true;
}

void VulkanContext::EndFrame(VkCommandBuffer computePrelude) {
    if (!frameActive_)
        return;                   // 交换链过期那帧没活可干；重复调用也安全
    if (!presentPassActive_)
        throw std::logic_error("A frame must have a presentation pass before submit");

    vkCmdEndRenderPass(commandBuffer_);
    presentPassActive_ = false;
    VK_CHECK(vkEndCommandBuffer(commandBuffer_));

    // 提交：等 imageAvailable（等到才能往这幅图上画）→ 执行 → 交出本图的
    // 呈现信号量（每图一份，防 MAILBOX 下呈现引擎还占用旧信号量）
    VkPipelineStageFlags waitStage = VK_PIPELINE_STAGE_COLOR_ATTACHMENT_OUTPUT_BIT;
    VkSubmitInfo submit{VK_STRUCTURE_TYPE_SUBMIT_INFO};
    submit.waitSemaphoreCount = 1;
    submit.pWaitSemaphores = &imageAvailable_;
    submit.pWaitDstStageMask = &waitStage;
    const VkCommandBuffer commands[] = {computePrelude, commandBuffer_};
    submit.commandBufferCount = computePrelude ? 2u : 1u;
    submit.pCommandBuffers = computePrelude ? commands : &commandBuffer_;
    submit.signalSemaphoreCount = 1;
    submit.pSignalSemaphores = &renderFinished_[currentImageIndex_];
    VK_CHECK(vkResetFences(device, 1, &inFlight_));
    VK_CHECK(vkQueueSubmit(graphicsQueue, 1, &submit, inFlight_));
    frameActive_ = false;

    // 呈现：本图的 renderFinished 一到就把这幅图换上屏
    VkPresentInfoKHR present{VK_STRUCTURE_TYPE_PRESENT_INFO_KHR};
    present.waitSemaphoreCount = 1;
    present.pWaitSemaphores = &renderFinished_[currentImageIndex_];
    present.swapchainCount = 1;
    present.pSwapchains = &swapchain;
    uint32_t imageIndex = currentImageIndex_;
    present.pImageIndices = &imageIndex;
    const auto result=vkQueuePresentKHR(presentQueue,&present);
    if (result == VK_ERROR_OUT_OF_DATE_KHR || result == VK_SUBOPTIMAL_KHR)
        swapchainDirty_ = true;
    else
        VK_CHECK(result);
}

VulkanContext::~VulkanContext() { DestroyAssets(); }

void VulkanContext::DestroyAssets() noexcept {
    // Also called after partial initialization fails; no fallback rendering.
    if (device) vkDeviceWaitIdle(device);   // 等 GPU 把在途帧画完（托管帧资产还在用）
    for (VkFramebuffer fb : framebuffers_)
        if (fb) vkDestroyFramebuffer(device, fb, nullptr);
    if (commandPool_)
        vkDestroyCommandPool(device, commandPool_, nullptr);  // 连带释放 cmd
    if (imageAvailable_)
        vkDestroySemaphore(device, imageAvailable_, nullptr);
    for (VkSemaphore s : renderFinished_)
        if (s) vkDestroySemaphore(device, s, nullptr);
    if (inFlight_) vkDestroyFence(device, inFlight_, nullptr);
    for (VkImageView view : swapchainViews)
        if (view) vkDestroyImageView(device, view, nullptr);
    if (swapchain) vkDestroySwapchainKHR(device, swapchain, nullptr);
    if (renderPass) vkDestroyRenderPass(device, renderPass, nullptr);
    if (surface) vkDestroySurfaceKHR(instance, surface, nullptr);

    if (counted_) { --contextCount; counted_ = false; }
    if (contextCount == 0) {
        if (device) vkDestroyDevice(device, nullptr);
        device = VK_NULL_HANDLE;
        geometryShaderEnabled = false;
        physicalDevice = VK_NULL_HANDLE;
        graphicsQueue = presentQueue = VK_NULL_HANDLE;
        if (debugMessenger) {
            auto destroy = reinterpret_cast<PFN_vkDestroyDebugUtilsMessengerEXT>(
                vkGetInstanceProcAddr(instance, "vkDestroyDebugUtilsMessengerEXT"));
            if (destroy) destroy(instance, debugMessenger, nullptr);
            debugMessenger = VK_NULL_HANDLE;
        }
        if (instance) vkDestroyInstance(instance, nullptr);
        instance = VK_NULL_HANDLE;
        appInitialized = false;
    }
}
