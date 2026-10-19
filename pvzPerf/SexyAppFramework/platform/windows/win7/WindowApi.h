#pragma once

namespace Sexy {
template<>
struct WindowsWindowApi<BuildConfig::WindowsApi::Win7> {
    static constexpr bool HdrOutput = false;
    static inline bool EnableSystemDpiAwareness() {
        return SetProcessDPIAware() != FALSE;
    }
    static inline bool AdjustClientRect(RECT& rect, DWORD style, DWORD exStyle, HWND) {
        return AdjustWindowRectEx(&rect, style, FALSE, exStyle) != FALSE;
    }
};
}
