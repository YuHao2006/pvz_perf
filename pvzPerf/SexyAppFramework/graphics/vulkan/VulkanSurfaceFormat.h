#pragma once
#include <vulkan/vulkan.h>
#include <span>
#include <stdexcept>
#include <string>
// Preserve precision/transfer function. Only RGBA memory order may differ.
inline VkSurfaceFormatKHR ChooseVulkanSurfaceFormat(std::span<const VkSurfaceFormatKHR> formats,
    VkFormat wanted, VkColorSpaceKHR space) {
    if (wanted==VK_FORMAT_UNDEFINED) wanted=VK_FORMAT_B8G8R8A8_SRGB;
    for (auto format:formats)
        if ((format.format==wanted || format.format==VK_FORMAT_UNDEFINED) && format.colorSpace==space)
            return {wanted,space};
    VkFormat equivalent=VK_FORMAT_UNDEFINED;
    switch(wanted) {
    case VK_FORMAT_B8G8R8A8_UNORM: equivalent=VK_FORMAT_R8G8B8A8_UNORM; break;
    case VK_FORMAT_R8G8B8A8_UNORM: equivalent=VK_FORMAT_B8G8R8A8_UNORM; break;
    case VK_FORMAT_B8G8R8A8_SRGB: equivalent=VK_FORMAT_R8G8B8A8_SRGB; break;
    case VK_FORMAT_R8G8B8A8_SRGB: equivalent=VK_FORMAT_B8G8R8A8_SRGB; break;
    case VK_FORMAT_A2B10G10R10_UNORM_PACK32: equivalent=VK_FORMAT_A2R10G10B10_UNORM_PACK32; break;
    case VK_FORMAT_A2R10G10B10_UNORM_PACK32: equivalent=VK_FORMAT_A2B10G10R10_UNORM_PACK32; break;
    default: break;
    }
    for (auto format:formats)
        if (equivalent!=VK_FORMAT_UNDEFINED && format.format==equivalent && format.colorSpace==space) return format;
    throw std::runtime_error("Requested Vulkan surface encoding is unsupported: format="+
        std::to_string(wanted)+" colorSpace="+std::to_string(space));
}
