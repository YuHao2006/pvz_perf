#include "VulkanScaleDds.h"
#include <limits>
#include <stdexcept>

namespace Sexy {
ScaleDdsLayout ParseScaleDds(std::span<const std::byte> file) {
    const auto word = [&](size_t at) {
        if (at > file.size() || file.size()-at < 4) throw std::runtime_error("Truncated scale DDS header");
        uint32_t result = 0;
        for (unsigned i=0;i<4;++i) result |= uint32_t(file[at+i]) << (8*i);
        return result;
    };
    if (file.size()<128 || word(0)!=0x20534444 || word(4)!=124 || word(76)!=32)
        throw std::runtime_error("Invalid scale DDS header");
    if (word(24)>1 || word(28)>1 || word(112)!=0)
        throw std::runtime_error("Scale DDS must be a single-mip 2D image, not a cube/volume");
    const auto w=word(16), h=word(12), flags=word(80);
    VkFormat format=VK_FORMAT_UNDEFINED;
    uint32_t bytes=0;
    if (flags&4) {
        // Historical D3DFMT_A16B16G16R16F disk tag used by Magpie f16 tables.
        if (word(84)==113) { format=VK_FORMAT_R16G16B16A16_SFLOAT; bytes=8; }
    } else if ((flags&0x41)==0x41 && word(88)==32 &&
        word(92)==0xff && word(96)==0xff00 && word(100)==0xff0000 && word(104)==0xff000000) {
        format=VK_FORMAT_R8G8B8A8_UNORM; bytes=4;
    } else if (flags==0x20000 && word(88)==8 && word(92)==0xff &&
        word(96)==0 && word(100)==0 && word(104)==0) {
        format=VK_FORMAT_R8_UNORM; bytes=1;
    }
    if (format==VK_FORMAT_UNDEFINED) throw std::runtime_error("Unsupported scale DDS pixel format");
    if (w==0 || h==0 || size_t(w)>std::numeric_limits<size_t>::max()/bytes ||
        size_t(h)>std::numeric_limits<size_t>::max()/(size_t(w)*bytes))
        throw std::runtime_error("Invalid scale DDS dimensions");
    const auto row=size_t(w)*bytes, count=row*h;
    if ((word(8)&8) && word(20)!=row) throw std::runtime_error("Unsupported scale DDS row padding");
    if (file.size()-128!=count) throw std::runtime_error("Scale DDS payload length does not match header");
    return {format,w,h,128,row,count};
}
}
