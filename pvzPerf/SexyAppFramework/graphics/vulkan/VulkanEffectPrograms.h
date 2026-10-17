#pragma once
#include "SexyAppFramework/effect/ScaleEffectCompiler.h"
#include <vulkan/vulkan.h>
#include <array>
#include <memory>
#include <unordered_map>

namespace Sexy {
// Immutable native compute programs. Multiple occurrences of the same compiled
// effect (including the two screen-mode pipelines) share this one object.
// Per-occurrence images, constants and descriptor sets belong to the executor.
class VulkanEffectProgram final {
public:
    struct Pass {
        std::array<VkDescriptorSetLayout,4> sets{};
        VkPipelineLayout layout = VK_NULL_HANDLE;
        VkPipeline pipeline = VK_NULL_HANDLE;
    };
    ~VulkanEffectProgram();
    VulkanEffectProgram(const VulkanEffectProgram&) = delete;
    VulkanEffectProgram& operator=(const VulkanEffectProgram&) = delete;
    std::vector<Pass> passes_;
    std::vector<VkSampler> samplers_;
private:
    friend class VulkanEffectPrograms;
    VulkanEffectProgram(VkDevice device,VkPipelineCache cache,const ScaleEffectRuntimeDesc& effect);
    void Release() noexcept;
    VkDevice device_;
};
class VulkanEffectPrograms final {
public:
    explicit VulkanEffectPrograms(VkDevice device);
    ~VulkanEffectPrograms();
    VulkanEffectPrograms(const VulkanEffectPrograms&) = delete;
    VulkanEffectPrograms& operator=(const VulkanEffectPrograms&) = delete;
    // Effect descriptors must remain at stable addresses and immutable for the
    // library lifetime. The app's startup compile batch provides that lifetime.
    const VulkanEffectProgram& Get(const ScaleEffectRuntimeDesc& effect);
    size_t Size() const { return effects_.size(); }
private:
    VkDevice device_;
    VkPipelineCache cache_ = VK_NULL_HANDLE;
    std::unordered_map<const ScaleEffectRuntimeDesc*, std::unique_ptr<VulkanEffectProgram>> effects_;
};
}
