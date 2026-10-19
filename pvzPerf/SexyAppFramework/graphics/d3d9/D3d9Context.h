#pragma once
#include "SexyAppFramework/platform/windows/NativeHandles.h"
#include <memory>
#include <string>

struct IDirect3DDevice9Ex;
struct IDirect3DSurface9;

namespace Sexy {
struct D3d9Capabilities {
    unsigned int maxTextureWidth = 0, maxTextureHeight = 0;
    unsigned int maxSimultaneousTextures = 0;
    unsigned int maxPixelShaderInstructionSlots = 0;
    unsigned int maxPixelShaderInstructionsExecuted = 0;
    int pixelShaderDynamicFlowControlDepth = 0;
    unsigned int maxPrimitiveCount = 0;
};
class D3d9Context final {
public:
    D3d9Context(NativeWindowHandle hwnd, bool validation, bool hdr = false);
    ~D3d9Context();
    D3d9Context(const D3d9Context&) = delete;
    D3d9Context& operator=(const D3d9Context&) = delete;
    void MakeCurrent();
    bool RecreateSwapchain();
    void WaitIdle();
    bool BeginPresent();
    void Present();
    void NotifySurfaceSuspended(bool suspended) { surfaceSuspended = suspended; }
    IDirect3DDevice9Ex* device = nullptr;
    IDirect3DSurface9* backBuffer = nullptr;
    D3d9Capabilities caps{};
    unsigned int width = 0, height = 0;
    bool surfaceSuspended = false;
    const bool hdr = false;
    bool tearingEnabled = true;
    bool tearingSupported = true;
    unsigned long long swapchainGeneration = 0;
    std::string adapterDescription;
    int majorVersion = 9, minorVersion = 0;
private:
    struct Impl;
    std::unique_ptr<Impl> impl_;
};
}
