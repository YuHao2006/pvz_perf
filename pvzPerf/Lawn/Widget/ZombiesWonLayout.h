#pragma once
#include <algorithm>

namespace ZombiesWonLayout
{
// Backdrop bounds and the 800-pixel animation canvas stay in world space.
constexpr int CameraX(int requested, int left, int width)
{
    return std::clamp(requested, left + width - 1180, left + 220);
}

constexpr int CanvasX(int left, int width, int boardX)
{
    return left + (width - 800) / 2 - boardX;
}

constexpr int DialogX(int left, int width, int dialogWidth)
{
    return left + (width - dialogWidth) / 2;
}

constexpr int MenuX(int left, int width, int dialogX)
{
    return left + width - 165 - dialogX;
}
}
