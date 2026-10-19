#pragma once
#include "SexyAppFramework/platform/windows/NativeHandles.h"
#include <memory>
#include <string>

namespace Sexy {
// The host owns the HWND. All GL calls use the creating/render thread.
class OpenGLContext final {
public:
    OpenGLContext(NativeWindowHandle hwnd, bool validation, bool hdr = false);
    ~OpenGLContext();
    OpenGLContext(const OpenGLContext&) = delete;
    OpenGLContext& operator=(const OpenGLContext&) = delete;
    void MakeCurrent();
    bool RecreateSwapchain();
    void WaitIdle();
    bool BeginPresent();
    void Present();
    void NotifySurfaceSuspended(bool suspended) { surfaceSuspended = suspended; }

    unsigned int width = 0, height = 0;
    bool surfaceSuspended = false;
    const bool hdr = false;
    bool tearingEnabled = true;
    bool tearingSupported = false;
    unsigned long long swapchainGeneration = 0;
    std::string adapterDescription;
    int majorVersion = 0, minorVersion = 0;
private:
    struct Impl;
    std::unique_ptr<Impl> impl_;
};
}
