#pragma once
#include <algorithm>
#include <cstdint>

// Advance the credits roll's finite integer phase. The original 100Hz loop
// displays the exact bottom position, then wraps on the next quarter-pixel
// step, so its period includes one additional 10ms tick.
inline float AdvanceCreditsScroll(std::uint64_t& phaseNs, int startY, int contentHeight,
    std::uint64_t deltaNs)
{
    const auto distance = static_cast<std::uint64_t>(std::max<std::int64_t>(
        0, std::int64_t(startY) + contentHeight + 120));
    const std::uint64_t periodNs = (distance * 4 + 1) * 10'000'000;
    phaseNs %= periodNs;
    const auto increment = deltaNs % periodNs;
    // Modular addition without overflowing even when deltaNs is UINT64_MAX.
    phaseNs = phaseNs >= periodNs - increment ? phaseNs - (periodNs - increment) :
        phaseNs + increment;
    return static_cast<float>(double(startY) - .25 * (double(phaseNs) / 10'000'000));
}
