#include "MetalContext.h"
#include "SexyAppFramework/platform/macos/MacWindow.h"
#import <Metal/Metal.h>
#import <QuartzCore/CAMetalLayer.h>
#include <cmath>
#include <stdexcept>

namespace Sexy {
struct MetalContext::Impl {
    id<MTLDevice> device;
    id<MTLCommandQueue> queue;
    CAMetalLayer* layer;
    Impl(NativeWindowHandle window, bool hdr) {
        if (hdr) throw std::runtime_error("Metal HDR is not supported in this milestone");
        if (!window || !window->metalLayer)
            throw std::invalid_argument("Metal requires a Cocoa window with a CAMetalLayer");
        layer = (__bridge CAMetalLayer*)window->metalLayer;
        device = MTLCreateSystemDefaultDevice();
        if (!device) throw std::runtime_error("No native Metal device");
        queue = [device newCommandQueue];
        if (!queue) throw std::runtime_error("Cannot create Metal command queue");
        layer.device = device;
        layer.pixelFormat = MTLPixelFormatBGRA8Unorm;
        layer.framebufferOnly = YES;
        layer.opaque = YES;
    }
};
MetalContext::MetalContext(NativeWindowHandle window, bool validate, bool useHdr)
    : impl_(std::make_unique<Impl>(window, useHdr)), hdr(useHdr), validation(validate),
      device((__bridge void*)impl_->device), queue((__bridge void*)impl_->queue),
      layer((__bridge void*)impl_->layer) {
    adapterDescription = [impl_->device.name UTF8String];
    RecreateSwapchain();
}
MetalContext::~MetalContext() {
    // Destructors cannot report GPU errors, but must still drain the queue.
    @autoreleasepool {
        id<MTLCommandBuffer> fence = [impl_->queue commandBuffer];
        [fence commit];
        [fence waitUntilCompleted];
    }
}
void MetalContext::WaitIdle() {
    @autoreleasepool {
        id<MTLCommandBuffer> fence = [impl_->queue commandBuffer];
        if (!fence) throw std::runtime_error("Cannot allocate Metal queue fence");
        [fence commit];
        [fence waitUntilCompleted];
        if (fence.status == MTLCommandBufferStatusError)
            throw std::runtime_error(fence.error.localizedDescription.UTF8String ?: "Metal queue error");
    }
}
bool MetalContext::RecreateSwapchain() {
    // Cocoa publishes backing-pixel dimensions in drawableSize on its thread.
    const CGSize size = impl_->layer.drawableSize;
    if (!std::isfinite(size.width) || !std::isfinite(size.height) ||
        size.width < 1 || size.height < 1) {
        surfaceSuspended = true;
        return false;
    }
    if (size.width > UINT32_MAX || size.height > UINT32_MAX)
        throw std::runtime_error("Metal drawable size exceeds native limits");
    const auto w = static_cast<uint32_t>(size.width);
    const auto h = static_cast<uint32_t>(size.height);
    const bool changed = surfaceSuspended || w != width || h != height;
    if (changed) {
        WaitIdle();
        width = w;
        height = h;
        surfaceSuspended = false;
        ++swapchainGeneration;
    }
    return changed;
}
}
