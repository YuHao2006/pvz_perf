#pragma once
#include <limits>
#include <stdexcept>
#include <utility>

namespace Sexy {
struct RenderResolution {
    int height = 600;

    constexpr std::pair<int, int> ScenePixels(int logicalWidth, int logicalHeight) const {
        const auto pixels = [this](int dimension) {
            const auto extent = (static_cast<long long>(dimension) * height + 300) / 600;
            if (extent > (std::numeric_limits<int>::max)())
                throw std::overflow_error("Scene extent exceeds the renderer's integer range");
            return extent > 0 ? static_cast<int>(extent) : 1;
        };
        return {pixels(logicalWidth), pixels(logicalHeight)};
    }
};
}
