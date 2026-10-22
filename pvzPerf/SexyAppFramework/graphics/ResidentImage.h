#pragma once
#include "Image.h"
#include <array>
#include <cstdint>
#include <memory>

namespace ImageLib { class Image; }

namespace Sexy
{
struct TextureData;
class RenderInterface;

// One GPU image, with an optional decode awaiting main-thread upload.
// It has no bitmap, software buffers, palette, or MemoryImage registration.
class ResidentImage final : public Image
{
public:
    std::unique_ptr<TextureData> mTextureData;
    std::unique_ptr<ImageLib::Image> mPendingDecoded;
    std::array<std::unique_ptr<ResidentImage>,3> mFilterImages;
    ResidentImage* mFilterOwner = nullptr;
    RenderInterface* mRenderOwner = nullptr;
    std::uint32_t mGpuSamplingFlags = 0;

    ResidentImage();
    ~ResidentImage();
    ResidentImage(const ResidentImage&) = delete;
    ResidentImage& operator=(const ResidentImage&) = delete;

    // Decode only. The shared definition cache ensures this happens once.
    static std::unique_ptr<ResidentImage> DecodePng(const std::string& path);
};
}
