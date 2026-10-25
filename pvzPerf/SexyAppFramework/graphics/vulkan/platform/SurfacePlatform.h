#pragma once

// Compile-time WSI selection. Shared context code depends only on this type.
#ifdef _WIN32
#include "Win32Surface.h"
#include "SexyAppFramework/platform/NativeHandles.h"
#include <limits>
#include <stdexcept>
#include <string>

static_assert(sizeof(unsigned int) == 4 && std::numeric_limits<unsigned int>::digits == 32);
static_assert(sizeof(int) == 4 && std::numeric_limits<int>::digits == 31);

struct VulkanSurfacePlatform {
    static constexpr const char* extension = VK_KHR_WIN32_SURFACE_EXTENSION_NAME;
    static void Validate(NativeWindowHandle window) {
        if (!window || !IsWindow(window))
            throw std::invalid_argument("VulkanContext requires an existing HWND");
    }
    static VkSurfaceKHR Create(VkInstance instance, NativeWindowHandle window) {
        return CreateWin32VulkanSurface(instance, window);
    }
    static VkExtent2D DrawableExtent(NativeWindowHandle window, bool suspended) {
        RECT client{};
        if (!GetClientRect(window, &client))
            throw std::runtime_error("GetClientRect for Vulkan surface failed: " +
                                     std::to_string(GetLastError()));
        if (suspended || IsIconic(window) ||
            client.right <= client.left || client.bottom <= client.top)
            return {};
        return {static_cast<unsigned int>(client.right - client.left),
                static_cast<unsigned int>(client.bottom - client.top)};
    }
};
#elif defined(__ANDROID__)
#include <android/native_window.h>
#include <stdexcept>
#include <vulkan/vulkan_android.h>
struct VulkanSurfacePlatform {
    static constexpr const char* extension = VK_KHR_ANDROID_SURFACE_EXTENSION_NAME;
    static void Validate(NativeWindowHandle window) {
        if (!window) throw std::invalid_argument("VulkanContext requires an ANativeWindow");
    }
    static VkSurfaceKHR Create(VkInstance instance, NativeWindowHandle window) {
        Validate(window);
        const VkAndroidSurfaceCreateInfoKHR info{
            .sType = VK_STRUCTURE_TYPE_ANDROID_SURFACE_CREATE_INFO_KHR,
            .window = window,
        };
        VkSurfaceKHR surface = VK_NULL_HANDLE;
        const VkResult result = vkCreateAndroidSurfaceKHR(instance, &info, nullptr, &surface);
        if (result != VK_SUCCESS) throw VulkanCallError(result, "vkCreateAndroidSurfaceKHR");
        return surface;
    }
    static VkExtent2D DrawableExtent(NativeWindowHandle window, bool suspended) {
        if (suspended || !window) return {};
        const int width = ANativeWindow_getWidth(window);
        const int height = ANativeWindow_getHeight(window);
        if (width <= 0 || height <= 0) return {};
        return {static_cast<unsigned int>(width), static_cast<unsigned int>(height)};
    }
};
#else
#include "LinuxSurface.h"
using VulkanSurfacePlatform = LinuxVulkanSurface;
#endif
