#pragma once

#include <algorithm>
#include <stdexcept>

namespace Sexy {

// Presentation coordinates only. The board and save coordinates stay 800x600.
// Odd widths give the spare pixel to the right margin. Menus extend 300
// pixels on each side; battle views stay inside their original backdrop.
struct GameViewport {
    static constexpr int MaximumWidth = 1400;
    int width = 800;
    int height = 600;
    int left = 0;

    static constexpr GameViewport Fit(int clientWidth, int clientHeight) {
        if (clientWidth <= 0 || clientHeight <= 0)
            throw std::invalid_argument("Empty game viewport");
        const auto width = std::clamp(
            (600LL * clientWidth + clientHeight / 2) / clientHeight, 800LL,
            static_cast<long long>(MaximumWidth));
        return {int(width), 600, (800 - int(width)) / 2};
    }

    constexpr GameViewport WithinWorld(int minimumLeft, int maximumRight) const {
        if (maximumRight - minimumLeft < width)
            throw std::invalid_argument("Viewport wider than world artwork");
        return {width, height, std::clamp(left, minimumLeft, maximumRight - width)};
    }
};

// Use the prepared output height, never a size inferred from a resize proposal.
// A missing startup scale output uses the native 600-pixel client height.
struct WindowTrackLimits {
    int minimumWidth;
    int maximumWidth;
    int height;

    static constexpr WindowTrackLimits FromScaleOutputHeight(int outputHeight) {
        const int height = outputHeight > 0 ? outputHeight : 600;
        return {int((800LL * height + 300) / 600),
            int((GameViewport::MaximumWidth * 1LL * height + 300) / 600), height};
    }

    constexpr int ConstrainWidth(int requestedWidth) const {
        const int logicalWidth = GameViewport::Fit(std::max(1, requestedWidth), height).width;
        return int((logicalWidth * 1LL * height + 300) / 600);
    }
};

}
