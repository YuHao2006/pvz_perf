#include "SexyAppFramework/platform/NativeWindow.h"
#include "LinuxSurface.h"
#include <vulkan/vulkan.h>
#include "SexyAppFramework/graphics/vulkan/VulkanEnumeration.h"
#include <stdexcept>
#include <utility>

#if defined(VK_USE_PLATFORM_XLIB_KHR) && !defined(VK_USE_PLATFORM_WAYLAND_KHR)
namespace {
constexpr Sexy::NativeWindowBackend kBackend = Sexy::NativeWindowBackend::X11;
constexpr const char* kExtension = VK_KHR_XLIB_SURFACE_EXTENSION_NAME;

VkSurfaceKHR CreateSurface(VkInstance instance, const Sexy::NativeSurfaceHandles& handles) {
    if (!handles.connection || !handles.windowId ||
        !std::in_range<Window>(handles.windowId))
        throw std::invalid_argument("Vulkan Xlib surface requires a live Display and Window");
    const VkXlibSurfaceCreateInfoKHR info{
        .sType = VK_STRUCTURE_TYPE_XLIB_SURFACE_CREATE_INFO_KHR,
        .dpy = static_cast<Display*>(handles.connection),
        .window = static_cast<Window>(handles.windowId),
    };
    VkSurfaceKHR surface = VK_NULL_HANDLE;
    const VkResult result = vkCreateXlibSurfaceKHR(instance, &info, nullptr, &surface);
    if (result != VK_SUCCESS) throw VulkanCallError(result, "vkCreateXlibSurfaceKHR");
    return surface;
}
}
#elif defined(VK_USE_PLATFORM_WAYLAND_KHR) && !defined(VK_USE_PLATFORM_XLIB_KHR)
namespace {
constexpr Sexy::NativeWindowBackend kBackend = Sexy::NativeWindowBackend::Wayland;
constexpr const char* kExtension = VK_KHR_WAYLAND_SURFACE_EXTENSION_NAME;

VkSurfaceKHR CreateSurface(VkInstance instance, const Sexy::NativeSurfaceHandles& handles) {
    if (!handles.connection || !handles.surface)
        throw std::invalid_argument("Vulkan Wayland surface requires a live display and surface");
    const VkWaylandSurfaceCreateInfoKHR info{
        .sType = VK_STRUCTURE_TYPE_WAYLAND_SURFACE_CREATE_INFO_KHR,
        .display = static_cast<wl_display*>(handles.connection),
        .surface = static_cast<wl_surface*>(handles.surface),
    };
    VkSurfaceKHR surface = VK_NULL_HANDLE;
    const VkResult result = vkCreateWaylandSurfaceKHR(instance, &info, nullptr, &surface);
    if (result != VK_SUCCESS) throw VulkanCallError(result, "vkCreateWaylandSurfaceKHR");
    return surface;
}
}
#else
#error Select exactly one Vulkan Linux WSI backend: VK_USE_PLATFORM_XLIB_KHR or VK_USE_PLATFORM_WAYLAND_KHR
#endif

const char* const LinuxVulkanSurface::extension = kExtension;

void LinuxVulkanSurface::Validate(NativeWindowHandle window) {
    if (!window)
        throw std::invalid_argument("VulkanContext requires an existing NativeWindow");
    if (window->Backend() != kBackend)
        throw std::invalid_argument("NativeWindow does not match the compiled Vulkan WSI backend");
}

VkSurfaceKHR LinuxVulkanSurface::Create(VkInstance instance, NativeWindowHandle window) {
    return CreateSurface(instance, window->SurfaceHandles());
}

VkExtent2D LinuxVulkanSurface::DrawableExtent(NativeWindowHandle window, bool suspended) {
    // PumpEvents publishes actual configured dimensions. Wayland uses buffer
    // scale 1; its logical dimensions are therefore framebuffer pixels.
    // xdg-shell has no minimized query: suspension is supplied by the app.
    if (suspended || window->Width <= 0 || window->Height <= 0)
        return {};
    return {static_cast<unsigned int>(window->Width),
            static_cast<unsigned int>(window->Height)};
}
