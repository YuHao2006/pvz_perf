#pragma once
#include <algorithm>

namespace SelectorLayout {
// The main menu occupies the first 800 world units; the original editor
// backdrop occupies [800,1600]. Align its right edge to the visible right edge.
inline constexpr int ZombatarSlideDistance(int viewportLeft, int viewportWidth) {
    return std::clamp(1600 - viewportLeft - viewportWidth, 0, 800);
}
}
