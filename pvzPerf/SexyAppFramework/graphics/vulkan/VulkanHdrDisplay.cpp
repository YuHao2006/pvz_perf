#include "VulkanHdr.h"
#ifdef _WIN32
#include <string>
#include <roapi.h>
#include <windows.graphics.display.interop.h>
#include <winrt/Windows.Graphics.Display.h>
namespace Sexy {
VulkanHdrDisplayInfo QueryVulkanHdrDisplay(NativeMonitorHandle monitor) {
    if (!monitor) throw std::invalid_argument("HDR query requires a target monitor");
    // GetForMonitor needs no DispatcherQueue without event subscriptions and
    // does not hook the application's HWND/WndProc. Release the snapshot before the balanced
    // apartment uninitialization; respect existing STA/MTA ownership.
    struct Apartment {
        HRESULT result = RoInitialize(RO_INIT_MULTITHREADED);
        Apartment() { if (FAILED(result) && result != RPC_E_CHANGED_MODE) winrt::check_hresult(result); }
        ~Apartment() { if (SUCCEEDED(result)) RoUninitialize(); }
    };
    try {
        Apartment apartment;
        using namespace winrt::Windows::Graphics::Display;
        auto factory=winrt::get_activation_factory<DisplayInformation,IDisplayInformationStaticsInterop>();
        DisplayInformation display{nullptr};
        winrt::check_hresult(factory->GetForMonitor(monitor,winrt::guid_of<DisplayInformation>(),winrt::put_abi(display)));
        const auto color=display.GetAdvancedColorInfo();
        return {color.CurrentAdvancedColorKind()==AdvancedColorKind::HighDynamicRange,
            color.SdrWhiteLevelInNits(),color.MaxLuminanceInNits(),color.MinLuminanceInNits(),
            color.MaxAverageFullFrameLuminanceInNits()};
    } catch (const winrt::hresult_error& error) {
        throw std::runtime_error("Windows HDR monitor query failed (GetForMonitor requires Windows 11 22621+): "+
            winrt::to_string(error.message())+" HRESULT="+std::to_string(error.code().value));
    }
}
}
#endif
