#include "platform/windows/WindowApi.h"
#include "platform/windows/HdrPolicy.h"
#include <iostream>
#include <stdexcept>
#include <type_traits>

int main()
{
    using namespace Sexy;
    try {
        static_assert(NativeWindowsWindowApi::HdrOutput ==
            (BuildConfig::Windows == BuildConfig::WindowsApi::Win10));
        static_assert(std::is_empty_v<WindowsHdrState<false>>);
        if (!NativeWindowsWindowApi::EnableSystemDpiAwareness())
            throw std::runtime_error("System DPI awareness initialization failed");
        WindowsHdrState<false> sdr;
        // Explicitly instantiate the disabled policy without any HDR observer.
        []<class State>(State& state) {
            if constexpr (BuildConfig::Windows == BuildConfig::WindowsApi::Win7) {
                struct Settings { bool mScaleHDREnabled = true; } settings;
                ResolveWindowsHdr(state, settings, nullptr);
                if (settings.mScaleHDREnabled)
                    throw std::runtime_error("Win7 accepted HDR configuration");
                CloseWindowsHdr(state);
                ResetWindowsHdr(state);
            }
        }(sdr);
        RECT actual{0,0,800,600};
        if (!NativeWindowsWindowApi::AdjustClientRect(actual,
            WS_CAPTION | WS_SYSMENU, WS_EX_APPWINDOW, nullptr))
            throw std::runtime_error("Window bounds adjustment failed");
        if (actual.right - actual.left < 800 || actual.bottom - actual.top < 600)
            throw std::runtime_error("Client bounds were reduced");
        std::cout << "PASS: selected Windows window API and Win7 SDR policy\n";
        return 0;
    } catch (const std::exception& error) {
        std::cerr << error.what() << '\n';
        return 1;
    }
}
