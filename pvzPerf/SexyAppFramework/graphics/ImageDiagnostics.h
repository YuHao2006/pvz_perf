#pragma once
#include "ImageReadback.h"
#include <filesystem>
#include <limits>
#include <optional>
#include <sstream>
#include <string>
#include <vector>

namespace Sexy {
inline uint64_t AddImageBytes(uint64_t a,uint64_t b) {
    if(b>(std::numeric_limits<uint64_t>::max)()-a)throw std::overflow_error("Image diagnostic byte count overflow");
    return a+b;
}
inline uint64_t ImageTexelBytes(int width,int height) {
    if(width<0 || height<0)throw std::invalid_argument("Negative diagnostic image dimensions");
    return uint64_t(width)*uint64_t(height)*4;
}
struct ImageCpuUsage {
    uint64_t bits=0,palette=0,indices=0,nativeAlpha=0,rlAlpha=0,rlAdditive=0;
    uint64_t Total() const {
        uint64_t total=0;for(auto size:{bits,palette,indices,nativeAlpha,rlAlpha,rlAdditive})total=AddImageBytes(total,size);
        return total;
    }
};
// Reads metadata only; the caller must own the image lifetime and exclude writes.
template<class Image> ImageCpuUsage MeasureImageCpuUsage(const Image& image) {
    const auto bytes=ImageTexelBytes(image.mWidth,image.mHeight),pixels=bytes/4;
    return {image.mBits?AddImageBytes(bytes,4):0, image.mColorTable?1024u:0u,
        image.mColorIndices?pixels:0, image.mNativeAlphaData?(image.mColorTable?1024u:bytes):0,
        image.mRLAlphaData?pixels:0, image.mRLAdditiveData?pixels:0};
}
struct ImageDiagnosticRecord {
    std::string path,traits,pixelStatus;
    int width=0,height=0;
    ImageCpuUsage cpu;
    // Texel payload of resident whole-image textures.
    // Not the driver's allocation size, resident VRAM budget, or whole-renderer memory.
    uint64_t gpuTexels=0;
    std::optional<ImagePixels> pixels;
    uint64_t Total() const {return AddImageBytes(cpu.Total(),gpuTexels);}
};
struct ImageDiagnosticTotals {
    uint64_t cpu=0,gpuTexels=0,images=0,texturedImages=0;
};
inline ImageDiagnosticTotals CountImageDiagnostics(const std::vector<ImageDiagnosticRecord>& records) {
    ImageDiagnosticTotals totals;
    for(const auto& image:records) {
        ++totals.images;totals.texturedImages+=image.gpuTexels!=0;
        totals.cpu=AddImageBytes(totals.cpu,image.cpu.Total());
        totals.gpuTexels=AddImageBytes(totals.gpuTexels,image.gpuTexels);
    }
    return totals;
}
std::string DescribeImageDiagnostics(const std::vector<ImageDiagnosticRecord>& records);
std::filesystem::path WriteImageDiagnosticDump(const std::filesystem::path& root,
    const std::vector<ImageDiagnosticRecord>& records);
struct ImageDiagnosticActivity {
    bool& active;
    explicit ImageDiagnosticActivity(bool& flag):active(flag){active=true;}
    ~ImageDiagnosticActivity(){active=false;}
    ImageDiagnosticActivity(const ImageDiagnosticActivity&)=delete;
    ImageDiagnosticActivity& operator=(const ImageDiagnosticActivity&)=delete;
};
}
