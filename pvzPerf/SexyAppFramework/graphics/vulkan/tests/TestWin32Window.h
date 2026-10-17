#pragma once
#ifndef NOMINMAX
#define NOMINMAX
#endif
#ifndef WIN32_LEAN_AND_MEAN
#define WIN32_LEAN_AND_MEAN
#endif
#include <windows.h>
#include "VulkanContext.h"
#include <stdexcept>

namespace VulkanTest
{
inline VkSwapchainCreateInfoKHR SwapchainConfig()
{
    VkSwapchainCreateInfoKHR config{VK_STRUCTURE_TYPE_SWAPCHAIN_CREATE_INFO_KHR};
    config.imageFormat = VK_FORMAT_B8G8R8A8_UNORM;
    config.imageColorSpace = VK_COLOR_SPACE_SRGB_NONLINEAR_KHR;
    config.imageUsage = VK_IMAGE_USAGE_COLOR_ATTACHMENT_BIT;
    config.compositeAlpha = VK_COMPOSITE_ALPHA_OPAQUE_BIT_KHR;
    config.presentMode = VK_PRESENT_MODE_MAILBOX_KHR;
    config.clipped = VK_TRUE;
    return config;
}

class Window
{
public:
    HWND hwnd = nullptr;
    explicit Window(int width, int height)
    {
        static const ATOM registered = [] {
            WNDCLASSEXW cls{sizeof(WNDCLASSEXW)};
            cls.lpfnWndProc = DefWindowProcW;
            cls.hInstance = GetModuleHandleW(nullptr);
            cls.lpszClassName = L"PvzVulkanTestWindow";
            const auto atom = RegisterClassExW(&cls);
            if (!atom) throw std::runtime_error("Cannot register Vulkan test window");
            return atom;
        }();
        (void)registered;
        RECT rect{0, 0, width, height};
        if (!AdjustWindowRectEx(&rect, WS_OVERLAPPEDWINDOW, FALSE, 0))
            throw std::runtime_error("Cannot size Vulkan test window");
        hwnd = CreateWindowExW(0, L"PvzVulkanTestWindow", L"Vulkan test",
            WS_OVERLAPPEDWINDOW, CW_USEDEFAULT, CW_USEDEFAULT,
            rect.right - rect.left, rect.bottom - rect.top, nullptr, nullptr,
            GetModuleHandleW(nullptr), nullptr);
        if (!hwnd) throw std::runtime_error("Cannot create hidden Vulkan test window");
    }
    ~Window() { if (hwnd) DestroyWindow(hwnd); }
    Window(const Window&) = delete;
    Window& operator=(const Window&) = delete;
    void Resize(int width, int height)
    {
        Resize(hwnd, width, height);
    }
    static void Resize(HWND target, int width, int height)
    {
        RECT rect{0, 0, width, height};
        if (!AdjustWindowRectEx(&rect, static_cast<DWORD>(GetWindowLongPtrW(target, GWL_STYLE)),
            FALSE, static_cast<DWORD>(GetWindowLongPtrW(target, GWL_EXSTYLE))) ||
            !SetWindowPos(target, nullptr, 0, 0, rect.right - rect.left, rect.bottom - rect.top,
                SWP_NOMOVE | SWP_NOZORDER | SWP_NOACTIVATE))
            throw std::runtime_error("Cannot resize Vulkan test window");
    }
    void Minimized(bool value)
    {
        Minimized(hwnd, value);
    }
    static void Minimized(HWND target, bool value)
    {
        // Change only this hidden fixture's style; never expose a desktop window.
        auto style = GetWindowLongPtrW(target, GWL_STYLE);
        style = value ? style | WS_MINIMIZE : style & ~LONG_PTR(WS_MINIMIZE);
        SetLastError(0);
        if (!SetWindowLongPtrW(target, GWL_STYLE, style) && GetLastError())
            throw std::runtime_error("Cannot set minimized test window state");
    }
};
}
