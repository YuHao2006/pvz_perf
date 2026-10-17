#pragma once
#include <cstddef>
#include <cstdint>
#include <span>

namespace Sexy {
struct D3d12ScaleDdsLayout {
    uint32_t format, width, height; // Numeric DXGI_FORMAT.
    size_t pixelOffset, rowPitch, byteSize;
};
// Same single-mip uncompressed 2D layouts as the Vulkan scale DDS reader.
// No pixel conversion; unsupported layouts fail explicitly.
D3d12ScaleDdsLayout ParseD3d12ScaleDds(std::span<const std::byte> file);
}
