#include "../NativeWindow.h"
#include <android/native_window.h>
#include <stdexcept>

namespace Sexy {
namespace { ANativeWindow* gWindow = nullptr; }

void AttachAndroidNativeWindow(ANativeWindow* window) { gWindow = window; }

struct NativeWindow::Impl {};
NativeWindow::NativeWindow(const NativeWindowConfig& config) : impl_(new Impl) {
    if (!gWindow) throw std::runtime_error("Android NativeWindow requires an attached ANativeWindow");
    Width = ANativeWindow_getWidth(gWindow);
    Height = ANativeWindow_getHeight(gWindow);
    if (Width <= 0) Width = config.width;
    if (Height <= 0) Height = config.height;
    Focused = Visible = config.visible;
}
NativeWindow::~NativeWindow() = default;
void NativeWindow::PumpEvents() {}
NativePointerState NativeWindow::SamplePointer() { return {}; }
void NativeWindow::Show() { Visible = true; }
void NativeWindow::ApplyCursor(NativeCursor) {}
void NativeWindow::SetTitle(const std::string&) {}
void NativeWindow::SetFullscreen(bool) {}
void NativeWindow::Resize(int width, int height) { Width = width; Height = height; }
bool NativeWindow::Minimized() const { return Width <= 0 || Height <= 0; }
NativeWindowBackend NativeWindow::Backend() const { return NativeWindowBackend::Android; }
NativeSurfaceHandles NativeWindow::SurfaceHandles() const { return {nullptr, gWindow, 0}; }
}
