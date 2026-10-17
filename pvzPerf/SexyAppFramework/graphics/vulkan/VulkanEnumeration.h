#pragma once
#include <vulkan/vulkan.h>
#include <cstdint>
#include <stdexcept>
#include <string>
#include <vector>

struct VulkanCallError : std::runtime_error {
    VkResult result;
    VulkanCallError(VkResult r, const std::string& operation)
        : std::runtime_error(operation + " failed: " + std::to_string(r)), result(r) {}
};

// Count and contents are separate Vulkan calls, not an atomic snapshot. Only
// VK_INCOMPLETE requests a fresh query; genuine errors must retain their code.
// Used during initialization/WSI rebuild, never as a per-frame polling loop.
template<class T, class Query>
std::vector<T> EnumerateVulkan(const char* operation, Query&& query) {
    constexpr unsigned maxAttempts = 8;
    for (unsigned attempt = 0; attempt < maxAttempts; ++attempt) {
        uint32_t count = 0;
        VkResult result = query(&count, nullptr);
        if (result == VK_INCOMPLETE) continue;
        if (result != VK_SUCCESS) throw VulkanCallError(result, std::string(operation) + " (count)");
        if (!count) return {};

        std::vector<T> values(count);
        result = query(&count, values.data());
        if (result == VK_INCOMPLETE) continue; // Never expose a truncated list.
        if (result != VK_SUCCESS) throw VulkanCallError(result, std::string(operation) + " (data)");
        if (count > values.size())
            throw std::runtime_error(std::string(operation) + " returned a count larger than the supplied capacity");
        values.resize(count); // A successful snapshot may be smaller, including zero.
        return values;
    }
    // A continuously changing/broken provider must not trap startup in a busy
    // loop. Report failure explicitly; do not return the last partial result.
    throw VulkanCallError(VK_INCOMPLETE, std::string(operation) + " (no complete snapshot after 8 attempts)");
}
