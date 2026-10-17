#pragma once

#include "SexyAppFramework/effect/ScaleEffectSizing.h"
#include <cstddef>
#include <cstdint>
#include <filesystem>
#include <memory>
#include <span>

struct ID3D12Device;
struct ID3D12Resource;
struct ID3D12GraphicsCommandList;

namespace Sexy {
// Borrowed scene resource; format is a numeric DXGI_FORMAT.
struct D3d12ScaleImage {
    ID3D12Resource* resource{};
    uint32_t format{}, width{}, height{};
};
struct D3d12ScaleDevice {
    ID3D12Device* device{};
};

// One library per device/compile batch. Descriptors must stay immutable at
// stable addresses, and this library must outlive every pipeline using it.
class D3d12ScaleLibrary final {
public:
    explicit D3d12ScaleLibrary(D3d12ScaleDevice device);
    ~D3d12ScaleLibrary();
    D3d12ScaleLibrary(const D3d12ScaleLibrary&) = delete;
    D3d12ScaleLibrary& operator=(const D3d12ScaleLibrary&) = delete;
    // Prepares a cached lookup; its upload is recorded by the first pipeline
    // that consumes it. The returned resource is borrowed.
    D3d12ScaleImage Lookup(const std::filesystem::path& path);
    size_t ProgramCount() const;
    size_t LookupCount() const;
private:
    friend class D3d12ScalePipeline;
    struct Impl;
    std::unique_ptr<Impl> impl_;
};

struct D3d12ScaleStep {
    ScaleEffectRuntimeDesc* effect{};
    ScaleEffectScaling scaling{};
};

// Construction prepares all resources from compiled DXIL and numeric metadata.
// Record performs no compilation, file reads, allocation or constant updates.
// Use one render thread and one direct queue in recording/submission order.
// Submit every recorded list: abandoning a list invalidates tracked states and
// deferred uploads. Caller owns submission/fences, and must wait for all work
// before destroying/replacing a pipeline, its library or the borrowed input.
// Record replaces compute bindings and shader-visible descriptor heaps.
class D3d12ScalePipeline final {
public:
    D3d12ScalePipeline(D3d12ScaleLibrary& library, D3d12ScaleImage input,
        std::span<const D3d12ScaleStep> steps, uint32_t targetWidth, uint32_t targetHeight);
    ~D3d12ScalePipeline();
    D3d12ScalePipeline(const D3d12ScalePipeline&) = delete;
    D3d12ScalePipeline& operator=(const D3d12ScalePipeline&) = delete;
    void Record(ID3D12GraphicsCommandList* cmd, uint32_t inputStateBeforeRecord);
    size_t WritableImageCount() const;
    size_t PassCount() const;
private:
    struct Impl;
    std::unique_ptr<Impl> impl_;

public:
    const D3d12ScaleImage output;
    // Numeric D3D12_RESOURCE_STATES, bound to the tracked images in Impl.
    // After Record both are pixel/nonpixel SRV. Caller-recorded output
    // transitions must assign their final state to outputState.
    uint32_t& inputState;
    uint32_t& outputState;
};
}
