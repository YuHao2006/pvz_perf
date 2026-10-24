#pragma once
#include <algorithm>
#include <cstdint>

namespace SlotMachineMotion
{
// Start at 5 turns/s, linearly slow to 2 turns/s over 3 seconds,
// then finish the current turn at 2 turns/s: 10.5 + 0.5 = 11 turns.
inline constexpr std::int64_t DurationNs = 3'250'000'000;

inline double Turns(std::int64_t remainingNs)
{
    const auto elapsedNs = DurationNs - std::clamp(remainingNs, std::int64_t{0}, DurationNs);
    if (elapsedNs <= 3'000'000'000)
    {
        const double seconds = static_cast<double>(elapsedNs) / 1'000'000'000.0;
        return seconds * (5.0 - 0.5 * seconds);
    }
    return 10.5 + static_cast<double>(elapsedNs - 3'000'000'000) / 500'000'000.0;
}

inline double Fraction(std::int64_t remainingNs)
{
    const double turns = Turns(remainingNs);
    return turns - static_cast<int>(turns);
}
}
