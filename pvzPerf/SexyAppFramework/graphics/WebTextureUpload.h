#pragma once
#include <algorithm>
#include <cstddef>
#include <vector>

namespace Sexy {
// Keep only a band of converted pixels alive. Both web upload APIs consume
// their input bytes before returning, so the next band can reuse the buffer.
template <typename Upload>
void UploadWebBgraRows(int width, int height, const void* pixels, int pitch, Upload upload)
{
    constexpr std::size_t scratchBytes = 1024 * 1024;
    const std::size_t rowBytes = static_cast<std::size_t>(width) * 4;
    const int rowsPerBand = std::min(height, static_cast<int>(std::max<std::size_t>(1, scratchBytes / rowBytes)));
    std::vector<unsigned char> rgba(rowBytes * rowsPerBand);
    for (int y = 0; y < height; y += rowsPerBand) {
        const int rows = std::min(rowsPerBand, height - y);
        for (int row = 0; row < rows; ++row) {
            const auto* src = static_cast<const unsigned char*>(pixels) + static_cast<std::size_t>(y + row) * pitch;
            auto* dst = rgba.data() + static_cast<std::size_t>(row) * rowBytes;
            for (int x = 0; x < width; ++x, src += 4, dst += 4) {
                dst[0] = src[2]; dst[1] = src[1]; dst[2] = src[0]; dst[3] = src[3];
            }
        }
        upload(y, rows, rgba.data());
    }
}
}
