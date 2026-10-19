#pragma once
#include "pvz/BuildConfig.h"
#include "graphics/vulkan/VulkanHdr.h"
#include <memory>

namespace Sexy {
template<bool Enabled>
struct WindowsHdrState {};

template<>
struct WindowsHdrState<true> {
    std::unique_ptr<VulkanHdrDisplayObserver> observer;
};

using NativeWindowsHdrState =
    WindowsHdrState<BuildConfig::Windows == BuildConfig::WindowsApi::Win10>;

template<class State>
inline void CloseWindowsHdr(State& state)
{
    if constexpr (BuildConfig::Windows == BuildConfig::WindowsApi::Win10)
        if (state.observer) state.observer->Close();
}

template<class State>
inline void ResetWindowsHdr(State& state)
{
    if constexpr (BuildConfig::Windows == BuildConfig::WindowsApi::Win10)
        state.observer.reset();
}

template<class State, class App>
inline void ResolveWindowsHdr(State& state, App& app, NativeMonitorHandle monitor)
{
    if constexpr (BuildConfig::Windows == BuildConfig::WindowsApi::Win7) {
        app.mScaleHDREnabled = false;
    } else {
        if (!app.mScaleHDREnabled) return;
        if (!app.mHWnd) throw std::logic_error("HDR parameters require the target game window");
        if (!state.observer)
            state.observer = std::make_unique<VulkanHdrDisplayObserver>(monitor);
        const auto snapshot = state.observer->Snapshot();
        const auto params = snapshot.display.Params(app.mScaleHDRStrength);
        app.mScaleHDRPaperWhite = params.paperWhiteNits;
        app.mScaleHDRMaxNits = params.peakNits;
        app.mScaleHDRReinhardPaperNits = params.reinhardPaperNits;
        app.mHdrDisplayRevision = snapshot.revision;
        app.mHdrTopologyGeneration = app.mNativeMonitorGeneration;
    }
}

template<class State, class App, class FindMonitor>
inline void UpdateWindowsHdr(State& state, App& app, FindMonitor&& findMonitor)
{
    if constexpr (BuildConfig::Windows == BuildConfig::WindowsApi::Win10) {
        if (!state.observer || app.mShutdown || app.mPhysMinimized) return;
        if (app.mHdrTargetPending || app.mHdrTopologyGeneration != app.mNativeMonitorGeneration) {
            state.observer->Rebind(findMonitor(), app.mHdrTopologyGeneration != app.mNativeMonitorGeneration);
            app.mHdrTopologyGeneration = app.mNativeMonitorGeneration;
            app.mHdrTargetPending = false;
        }
        if (app.mHdrDisplayRevision == state.observer->Revision()) return;
        const auto snapshot = state.observer->Snapshot();
        const auto params = snapshot.display.Params(app.mScaleHDRStrength);
        auto& render = *app.mDDInterface->mRenderInterface;
        render.Flush();
        render.mRenderer->SetHdrParams(params);
        app.mScaleHDRPaperWhite = params.paperWhiteNits;
        app.mScaleHDRMaxNits = params.peakNits;
        app.mScaleHDRReinhardPaperNits = params.reinhardPaperNits;
        app.mHdrDisplayRevision = snapshot.revision;
        app.mWidgetManager->MarkAllDirty();
    }
}
}
