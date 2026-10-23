#pragma once
#include <cstdint>
#include <limits>
#include <stdexcept>

namespace PlantLaunchClock
{
constexpr std::int64_t Tick = 10'000'000;
constexpr int MaxEventsPerUpdate = 4096;

inline std::int64_t Add(std::int64_t time, std::int64_t duration)
{
    if (duration < 0 || time > INT64_MAX - duration)
        throw std::overflow_error("plant launch deadline overflow");
    return time + duration;
}

// Each draw is the game's existing uniform 31-bit MT output. Build a uniform
// 64-bit word, then reject the short residue prefix before taking a modulus.
// Both duration endpoints are included; no legacy-tick quantization remains.
template<class Draw31>
std::int64_t Uniform(std::int64_t low, std::int64_t high, Draw31 draw)
{
    if (low < 0 || high < low)
        throw std::overflow_error("invalid plant launch interval");
    const auto width = std::uint64_t(high - low) + 1;
    const auto rejectBelow = (std::uint64_t(0) - width) % width;
    for (;;)
    {
        const auto upper = std::uint64_t(draw());
        const auto middle = std::uint64_t(draw());
        const auto lower = std::uint64_t(draw());
        const auto word = (upper << 33) | (middle << 2) | (lower & 3);
        if (word >= rejectBelow)
            return low + static_cast<std::int64_t>(word % width);
    }
}

inline bool Crossed(std::int64_t start, std::int64_t end, std::int64_t event)
{
    return start < event && event <= end;
}
}
