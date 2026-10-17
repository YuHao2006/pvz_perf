#pragma once
#include <vulkan/vulkan.h>
#include <cstddef>
#include <span>

namespace Sexy {
struct ScaleDdsLayout {
    VkFormat format;
    uint32_t width, height;
    size_t pixelOffset, rowPitch, byteSize;
};
// Single-level uncompressed 2D lookup tables. No payload conversion/copy.
// Unsupported layouts fail instead of becoming blank or reinterpreted images.
ScaleDdsLayout ParseScaleDds(std::span<const std::byte> file);
}
