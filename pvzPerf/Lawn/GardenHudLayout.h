#pragma once
#include <array>

namespace GardenHudLayout {

struct Frame {
    int left;
    int right;
    int top;
};

constexpr Frame ViewportInBoard(int viewportLeft, int viewportWidth, int boardX, int boardY) {
    return {viewportLeft - boardX, viewportLeft + viewportWidth - boardX, -boardY};
}

constexpr int RightButtonX(int originalX, const Frame& frame) {
    return frame.right - (800 - originalX);
}

constexpr int CursorInBoard(int mouseWorld, int boardOrigin, int grabOffset) {
    return mouseWorld - boardOrigin - grabOffset;
}

// Slots follow WATERING_CAN..NEXT_GARDEN; tree food does not affect the
// ordinary garden's fully unlocked bank alignment.
struct ToolButtons {
    std::array<int, 10> x;
    int y;
};

constexpr ToolButtons LayoutTools(const std::array<bool, 10>& available,
    const Frame& frame, bool treeOfWisdom, int fadeOffset) {
    ToolButtons positions{{}, frame.top + fadeOffset};
    bool allUnlocked = true;
    for (int slot = 0; slot < 10; ++slot) {
        if (slot != 8 && !available[slot])
            allUnlocked = false;
    }
    int x = frame.left + (allUnlocked ? 0 : 30);
    for (int slot = 0; slot < 10; ++slot) {
        positions.x[slot] = x;
        if (available[slot])
            x += 70;
    }
    if (treeOfWisdom)
        positions.x[8] = frame.left + 30;
    positions.x[9] = frame.left + 564;
    return positions;
}

}
