#pragma once
#include "MetalScaleTypes.h"
#include <filesystem>
#include <memory>
#include <span>

namespace Sexy {
// One library per MTLDevice/startup compile batch. Runtime descriptors must
// remain immutable and alive until this library and its pipelines are destroyed.
class MetalScaleLibrary final {
public:
    explicit MetalScaleLibrary(void* device);
    ~MetalScaleLibrary();
    MetalScaleLibrary(const MetalScaleLibrary&) = delete;
    MetalScaleLibrary& operator=(const MetalScaleLibrary&) = delete;
    void Prepare(const ScaleEffectRuntimeDesc& effect);
    MetalScaleImage Lookup(const std::filesystem::path& path);
    size_t ProgramCount() const;
    size_t LookupCount() const;
private:
    friend class MetalScalePipeline;
    struct Impl;
    std::unique_ptr<Impl> impl_;
};

// Device and image handles are borrowed. Image format is the native
// MTLPixelFormat number, not the scale effect's numeric file-format ID.
// Record requires an uncommitted MTLCommandBuffer with no active encoder.
// Submit in order on one queue with tracked resource hazards. Finish GPU work
// before destroying a pipeline, its library, or the borrowed scene texture.
class MetalScalePipeline final {
    struct Impl;
    std::unique_ptr<Impl> impl_;
public:
    MetalScalePipeline(MetalScaleLibrary& library, MetalScaleImage input,
        std::span<const MetalScaleStep> steps, uint32_t targetWidth, uint32_t targetHeight);
    ~MetalScalePipeline();
    MetalScalePipeline(const MetalScalePipeline&) = delete;
    MetalScalePipeline& operator=(const MetalScalePipeline&) = delete;
    void Record(void* commandBuffer);
    const MetalScaleImage& output;
    size_t WritableImageCount() const;
    size_t PassCount() const;
};
}
