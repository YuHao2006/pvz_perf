#pragma once
#include "SexyAppFramework/platform/NativeHandles.h"
#include <vulkan/vulkan_core.h>
#include <limits>

static_assert(sizeof(unsigned int) == 4 && std::numeric_limits<unsigned int>::digits == 32);
static_assert(sizeof(int) == 4 && std::numeric_limits<int>::digits == 31);

// Borrows the application's NativeWindow and its protocol connection.
// All calls stay on the window/event thread; no event dispatch occurs here.
struct LinuxVulkanSurface {
    static const char* const extension;
    static void Validate(NativeWindowHandle window);
    static VkSurfaceKHR Create(VkInstance instance, NativeWindowHandle window);
    static VkExtent2D DrawableExtent(NativeWindowHandle window, bool suspended);
};
