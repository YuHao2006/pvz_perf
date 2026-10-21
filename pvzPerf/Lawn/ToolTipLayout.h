#pragma once

namespace ToolTipLayout {

constexpr int LegacyX(int anchor, int extent, bool centered, int lower, int upper, float translation) {
    int position = anchor - (centered ? extent / 2 : 0);
    if (lower - translation > position)
        position = lower - static_cast<int>(translation);
    else if (position + extent + translation > upper)
        position = static_cast<int>(upper - translation - extent);
    return position;
}

constexpr int LegacyY(int anchor, int extent, int bottom, float translation) {
    if (-translation > anchor)
        return static_cast<int>(-translation);
    if (bottom < anchor + extent + translation)
        return bottom - static_cast<int>(translation) - extent;
    return anchor;
}

// Keep the original left-first clipping order, including oversized tooltips.
constexpr int Position(int anchor, int extent, bool centered, int lower, int upper) {
    const int position = anchor - (centered ? extent / 2 : 0);
    if (position < lower)
        return lower;
    if (position + extent > upper)
        return upper - extent;
    return position;
}

}
