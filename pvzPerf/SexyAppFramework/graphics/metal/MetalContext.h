#pragma once
#include "SexyAppFramework/platform/NativeHandles.h"
#include <cstdint>
#include <memory>
#include <string>

namespace Sexy {
// Cocoa owns the window and layer. All GPU calls use the render thread.
class MetalContext final {
    struct Impl;
    std::unique_ptr<Impl> impl_;
public:
    explicit MetalContext(NativeWindowHandle window, bool validation = false, bool hdr = false);
    ~MetalContext();
    MetalContext(const MetalContext&) = delete;
    MetalContext& operator=(const MetalContext&) = delete;
    MetalContext(MetalContext&&) = delete;
    MetalContext& operator=(MetalContext&&) = delete;

    uint32_t width = 0, height = 0;
    bool surfaceSuspended = false;
    uint64_t swapchainGeneration = 0;
    const bool hdr;
    const bool validation;
    std::string adapterDescription;
    // Borrowed Objective-C objects; retained by Impl. Cast only in .mm files.
    void* const device;
    void* const queue;
    void* const layer;
    bool RecreateSwapchain();
    void WaitIdle();
};
}
