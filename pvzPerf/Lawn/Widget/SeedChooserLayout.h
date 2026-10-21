#pragma once

namespace SeedChooserLayout {

// Convert a position between widget frames without changing its world position.
constexpr int RebaseX(int x, int fromOrigin, int toOrigin) {
    return x + fromOrigin - toOrigin;
}

constexpr int RightButtonX(int originalX, int viewportWidth) {
    return originalX + viewportWidth - 800;
}

}
