#pragma once

namespace Sexy {
template<>
struct WindowsWindowApi<BuildConfig::WindowsApi::Win10> {
    static constexpr bool HdrOutput = true;
    static inline bool EnableSystemDpiAwareness() {
        return SetProcessDpiAwarenessContext(DPI_AWARENESS_CONTEXT_PER_MONITOR_AWARE) != FALSE;
    }
    static inline bool AdjustClientRect(RECT& rect, DWORD style, DWORD exStyle, HWND window) {
        return AdjustWindowRectExForDpi(&rect, style, FALSE, exStyle,
            window ? GetDpiForWindow(window) : GetDpiForSystem()) != FALSE;
    }
};
}
