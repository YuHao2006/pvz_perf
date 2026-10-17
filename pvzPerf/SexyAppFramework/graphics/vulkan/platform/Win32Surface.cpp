#include "Win32Surface.h"
#include "SexyAppFramework/graphics/vulkan/VulkanEnumeration.h"
#include <stdexcept>
#include <string>

VkSurfaceKHR CreateWin32VulkanSurface(VkInstance instance, HWND hwnd) {
    SetLastError(ERROR_SUCCESS);
    const auto hinstance = reinterpret_cast<HINSTANCE>(
        GetWindowLongPtrW(hwnd, GWLP_HINSTANCE));
    if (!hinstance)
        throw std::runtime_error("Cannot query Vulkan surface HWND instance: " +
                                 std::to_string(GetLastError()));
    const VkWin32SurfaceCreateInfoKHR createInfo{
        .sType = VK_STRUCTURE_TYPE_WIN32_SURFACE_CREATE_INFO_KHR,
        .hinstance = hinstance,
        .hwnd = hwnd,
    };
    VkSurfaceKHR surface = VK_NULL_HANDLE;
    const auto result = vkCreateWin32SurfaceKHR(instance, &createInfo, nullptr, &surface);
    if (result != VK_SUCCESS)
        throw VulkanCallError(result, "vkCreateWin32SurfaceKHR");
    return surface;
}
