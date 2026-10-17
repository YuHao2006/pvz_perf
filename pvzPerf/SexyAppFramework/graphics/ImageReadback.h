#pragma once
#include <cstdint>
#include <stdexcept>
#include <vector>

namespace Sexy {
// Owned diagnostic/export snapshot. This never becomes MemoryImage backing.
// Pixels are little-endian BGRA bytes (0xAARRGGBB), without filtering or gamma
// conversion. An opaque GPU view exports alpha 255 rather than ignored X bits.
struct ImagePixels {
    int width=0,height=0;
    std::vector<uint32_t> pixels;
    ImagePixels()=default;
    ImagePixels(int w,int h):width(w),height(h) {
        if(w<=0 || h<=0 || uint64_t(w)*uint64_t(h)>pixels.max_size())
            throw std::invalid_argument("Invalid image readback dimensions");
        pixels.resize(size_t(w)*size_t(h));
    }
};

}
