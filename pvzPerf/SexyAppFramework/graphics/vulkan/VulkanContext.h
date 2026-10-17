#pragma once
#include "SexyAppFramework/platform/NativeHandles.h"
#include <vulkan/vulkan.h>
#include <cstdint>
#include <optional>
#include <vector>

using VulkanGpuFilter = bool (*)(VkPhysicalDevice);
struct VulkanInitConfig {
    VkApplicationInfo appInfo{
        .sType = VK_STRUCTURE_TYPE_APPLICATION_INFO,
        .pApplicationName = "VulkanContext",
        .applicationVersion = VK_MAKE_VERSION(0, 1, 0),
        .apiVersion = VK_API_VERSION_1_2,
    };
    VkInstanceCreateInfo instanceInfo{
        .sType = VK_STRUCTURE_TYPE_INSTANCE_CREATE_INFO,
        .pApplicationInfo = &appInfo,
    };
    std::vector<const char*> extraExtensions;
    std::vector<const char*> extraLayers;
    std::vector<const char*> deviceExtensions;
    bool enableValidation = false;
    VulkanGpuFilter gpuFilter = [](VkPhysicalDevice) { return true; };
    VkPhysicalDeviceFeatures features{};
    PFN_vkDebugUtilsMessengerCallbackEXT debugCallback = &DefaultDebugCallback;
    static VkBool32 VKAPI_CALL DefaultDebugCallback(
        VkDebugUtilsMessageSeverityFlagBitsEXT severity,
        VkDebugUtilsMessageTypeFlagsEXT types,
        const VkDebugUtilsMessengerCallbackDataEXT* data, void* userData);
};

// Owns Vulkan resources only. The application's native window must outlive this context
// and every renderer using its device; the application owns all window actions.
// WSI is selected at build time; Linux also borrows the window's connection.
class VulkanContext {
public:
    VulkanContext(const VulkanInitConfig& config, NativeWindowHandle borrowedWindow,
                  const VkSwapchainCreateInfoKHR& swapchainConfig);
    ~VulkanContext();
    VulkanContext(const VulkanContext&) = delete;
    VulkanContext& operator=(const VulkanContext&) = delete;
    VulkanContext(VulkanContext&&) = delete;
    VulkanContext& operator=(VulkanContext&&) = delete;

    NativeWindowHandle const hwnd;
    // Shared GPU lifetime is retained for the renderer's existing resources.
    static inline VkPhysicalDevice physicalDevice = VK_NULL_HANDLE;
    static inline VkDevice device = VK_NULL_HANDLE;
    static inline uint32_t graphicsFamily = 0;
    static inline uint32_t presentFamily = 0;
    static inline VkQueue graphicsQueue = VK_NULL_HANDLE;
    static inline VkQueue presentQueue = VK_NULL_HANDLE;

    VkSurfaceKHR surface = VK_NULL_HANDLE;
    VkSwapchainKHR swapchain = VK_NULL_HANDLE;
    VkFormat swapchainFormat = VK_FORMAT_UNDEFINED;
    VkColorSpaceKHR swapchainColorSpace = VK_COLOR_SPACE_SRGB_NONLINEAR_KHR;
    VkExtent2D swapchainExtent{};
    std::vector<VkImage> swapchainImages;
    std::vector<VkImageView> swapchainViews;
    VkRenderPass renderPass = VK_NULL_HANDLE;

    struct FrameContext {
        VkCommandBuffer cmd = VK_NULL_HANDLE;
        uint32_t imageIndex = 0;
        VkExtent2D extent{};
        bool valid = false;
    };
    // Zero-size/minimized surfaces defer without acquiring or destroying assets.
    bool RecreateSwapchain();
    // Application notification only: retains the existing suspension/rebuild
    // state without performing any window action or GPU operation.
    void NotifySurfaceSuspended(bool suspended);
    FrameContext BeginCommands();
    void BeginPresentPass(VkClearColorValue clearColor);
    void WaitForFrame();
    void EndFrame();
    uint64_t swapchainGeneration = 0;

private:
    static void InitializeVulkan(const VulkanInitConfig& config);
    void DestroyAssets() noexcept;
    void CreateSurfaceAssets();
    VkExtent2D QueryDrawableExtent() const;
    std::optional<VkExtent2D> QuerySwapchainExtent(VkSurfaceCapabilitiesKHR& caps) const;
    void CreateSwapchain(const VkSurfaceCapabilitiesKHR& caps, VkExtent2D extent);
    void CreateRenderPass();
    void CreateFramebuffers();
    void CreateFrameLoopAssets();
    void CreatePresentSemaphores();

    VkSwapchainCreateInfoKHR swapchainConfig_{};
    bool counted_ = false;
    std::vector<VkFramebuffer> framebuffers_;
    VkCommandPool commandPool_ = VK_NULL_HANDLE;
    VkCommandBuffer commandBuffer_ = VK_NULL_HANDLE;
    VkSemaphore imageAvailable_ = VK_NULL_HANDLE;
    std::vector<VkSemaphore> renderFinished_;
    VkFence inFlight_ = VK_NULL_HANDLE;
    bool frameActive_ = false;
    bool presentPassActive_ = false;
    bool swapchainDirty_ = false;
    bool surfaceSuspended_ = false;
    uint32_t currentImageIndex_ = 0;
};
