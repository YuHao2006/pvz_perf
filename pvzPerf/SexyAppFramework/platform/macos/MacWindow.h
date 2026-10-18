#pragma once
#include <cstdint>
#include <memory>
#include <string>

namespace Sexy {
enum class MacEventKind { Close, Resize, Focus, MouseButton, MouseWheel, Key, Text };
struct MacWindowEvent {
    MacEventKind kind{};
    double x = 0, y = 0, time = 0;
    unsigned key = 0, text = 0;
    int button = 0, clickCount = 1;
    bool pressed = false, focused = false, minimized = false, repeat = false;
};
struct MacPointerState {
    double x = 0, y = 0;
    bool inside = false;
};
enum class MacCursor {
    Arrow, Hand, Text, Move, Forbidden, ResizeHorizontal, ResizeVertical,
    ResizeNorthEast, ResizeNorthWest, Wait, Hidden
};
struct MacWindowConfig {
    std::string title = "pvz_perf";
    int width = 800, height = 600;
    void* callbackContext = nullptr;
    void (*callback)(void*, const MacWindowEvent&) = nullptr;
};

// AppKit is confined to .mm files. All methods run on the AppKit main thread.
struct MacWindow final {
    explicit MacWindow(const MacWindowConfig& config);
    ~MacWindow();
    MacWindow(const MacWindow&) = delete;
    MacWindow& operator=(const MacWindow&) = delete;
    void PumpEvents();
    void Show();
    void SetTitle(const std::string& title);
    void Resize(int width, int height);
    void SetFullscreen(bool fullscreen);
    void ApplyCursor(MacCursor cursor);
    MacPointerState SamplePointer() const;
    // Common code also asks during message draining; only one poll per update.
    bool BeginMouseSample(std::uint32_t update);
    bool Minimized() const;
    // Content extent and input coordinates are top-left Cocoa points.
    int Width = 0, Height = 0;
    // Metal presentation and QueryNativeClientExtent use backing pixels.
    int DrawableWidth = 0, DrawableHeight = 0;
    // Borrowed CAMetalLayer*. The Objective-C++ Impl retains it until destruction.
    // Backend .mm code casts with (__bridge CAMetalLayer*)metalLayer.
    void* metalLayer = nullptr;
    bool Focused = false, Visible = false;
    void RefreshGeometry();
    void UpdatePresentation();
    // Native responders enqueue only; exceptions cross back through PumpEvents.
    void Emit(const MacWindowEvent& event) noexcept;
    void RethrowCallbackError();
    struct Impl;
private:
    std::unique_ptr<Impl> impl_;
};
}
