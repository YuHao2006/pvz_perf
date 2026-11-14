#pragma once
#include <vulkan/vulkan.h>
#include <span>

// Only fully compatible devices enter this list, in loader enumeration order.
struct VulkanDeviceCandidate {
    VkPhysicalDevice device = VK_NULL_HANDLE;
    VkPhysicalDeviceProperties properties{};
    uint32_t graphicsFamily = 0;
    uint32_t presentFamily = 0;
};

inline const VulkanDeviceCandidate* SelectPreferredVulkanDevice(
    std::span<const VulkanDeviceCandidate> candidates) noexcept {
    // Windows loaders attempt to put the OS-preferred adapter first. Vendor
    // selection layers and Linux's loader ordering also act on this list.
    // Re-scoring by device type or texture limits would override that choice.
    // CPU implementations remain a last resort if no compatible GPU exists.
    for (const auto& candidate : candidates)
        if (candidate.properties.deviceType != VK_PHYSICAL_DEVICE_TYPE_CPU)
            return &candidate;
    return candidates.empty() ? nullptr : &candidates.front();
}
