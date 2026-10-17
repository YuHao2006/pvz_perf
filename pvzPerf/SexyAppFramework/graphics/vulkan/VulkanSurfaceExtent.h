#pragma once
#include <vulkan/vulkan.h>
#include <algorithm>
#include <cstdint>
#include <optional>
#include <stdexcept>

// No fabricated fallback dimensions. Zero means wait for the surface to
// become drawable; UINT32_MAX (on both axes) means use framebuffer pixels.
inline std::optional<VkExtent2D> ChooseVulkanSurfaceExtent(
    const VkSurfaceCapabilitiesKHR& caps, int framebufferWidth, int framebufferHeight) {
    if (framebufferWidth < 0 || framebufferHeight < 0 ||
        caps.minImageExtent.width > caps.maxImageExtent.width ||
        caps.minImageExtent.height > caps.maxImageExtent.height)
        throw std::invalid_argument("Invalid Vulkan surface extent capabilities");
    const bool flexible = caps.currentExtent.width == UINT32_MAX;
    if (flexible != (caps.currentExtent.height == UINT32_MAX))
        throw std::invalid_argument("Vulkan surface extent has a partial variable-size sentinel");
    if (!framebufferWidth || !framebufferHeight ||
        !caps.maxImageExtent.width || !caps.maxImageExtent.height)
        return std::nullopt;
    if (!flexible) {
        if (!caps.currentExtent.width || !caps.currentExtent.height) return std::nullopt;
        if (caps.currentExtent.width < caps.minImageExtent.width ||
            caps.currentExtent.width > caps.maxImageExtent.width ||
            caps.currentExtent.height < caps.minImageExtent.height ||
            caps.currentExtent.height > caps.maxImageExtent.height)
            throw std::invalid_argument("Fixed Vulkan surface extent is outside advertised limits");
        return caps.currentExtent;
    }
    return VkExtent2D{
        std::clamp(uint32_t(framebufferWidth),caps.minImageExtent.width,caps.maxImageExtent.width),
        std::clamp(uint32_t(framebufferHeight),caps.minImageExtent.height,caps.maxImageExtent.height)};
}
