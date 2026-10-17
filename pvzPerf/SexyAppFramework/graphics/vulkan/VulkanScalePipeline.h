#pragma once
#include "VulkanEffectPrograms.h"
#include "SexyAppFramework/effect/ScaleEffectSizing.h"
#include <filesystem>
#include <span>

namespace Sexy {
// Borrowed image. The renderer retains ownership of the 800x600 scene.
struct VulkanScaleImage {
    VkImage image{};
    VkImageView view{};
    VkFormat format{};
    uint32_t width{}, height{};
};
struct VulkanScaleDevice {
    VkPhysicalDevice physical{};
    VkDevice device{};
    VkQueue queue{};
    uint32_t queueFamily{};
};

// One library per device/startup compile batch. Programs and DDS images are
// shared across all pipeline occurrences, including window and fullscreen.
class VulkanScaleLibrary final {
public:
    explicit VulkanScaleLibrary(VulkanScaleDevice device);
    ~VulkanScaleLibrary();
    VulkanScaleLibrary(const VulkanScaleLibrary&) = delete;
    VulkanScaleLibrary& operator=(const VulkanScaleLibrary&) = delete;
    const VulkanEffectProgram& Program(const ScaleEffectRuntimeDesc& effect);
    VulkanScaleImage Lookup(const std::filesystem::path& path);
    size_t ProgramCount() const;
    size_t LookupCount() const;
private:
    friend class VulkanScalePipeline;
    struct Impl;
    std::unique_ptr<Impl> impl_;
};

struct VulkanScaleStep {
    ScaleEffectRuntimeDesc* effect{};
    ScaleEffectScaling scaling{};
};

// Prepared dimensions only: no XML/HLSL reads, compilation, allocation or UBO
// updates in Record(). Each occurrence owns its writable textures/descriptors.
// Call on one graphics+compute queue, outside a render pass, in submission order.
// Caller must finish pending work before destroying the pipeline or its library.
class VulkanScalePipeline final {
    struct Impl;
    std::unique_ptr<Impl> impl_;
public:
    VulkanScalePipeline(VulkanScaleLibrary& library, VulkanScaleImage input,
        std::span<const VulkanScaleStep> steps, uint32_t targetWidth, uint32_t targetHeight);
    ~VulkanScalePipeline();
    VulkanScalePipeline(const VulkanScalePipeline&) = delete;
    VulkanScalePipeline& operator=(const VulkanScalePipeline&) = delete;
    void Record(VkCommandBuffer cmd, VkImageLayout inputLayout,
        VkPipelineStageFlags inputStage, VkAccessFlags inputAccess);
    // After Record, both input and output are SHADER_READ_ONLY_OPTIMAL.
    // Output writes are visible to compute and fragment shader sampling.
    // Borrowed metadata remains in the pipeline's owned image for its lifetime.
    const VulkanScaleImage& output;
    size_t WritableImageCount() const;
    size_t PassCount() const;
};
}
