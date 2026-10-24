#pragma once
#include "Lawn/Widget/CreditsScroll.h"
#include <array>
#include <bit>
#include <random>
#include <stdexcept>

namespace CreditsScrollRuntime
{
inline void Require(bool condition, const char* message)
{
    if (!condition) throw std::runtime_error(message);
}

inline void Check()
{
    constexpr int start = 504, height = 1023, distance = start + height + 120;
    constexpr std::uint64_t period = (4ULL * distance + 1) * 10'000'000;
    const auto sample = [&](int frequency, std::uint64_t total)
    {
        std::uint64_t phase = 0;
        float position = start;
        std::mt19937_64 random(0x515627);
        for (std::uint64_t elapsed = 0, n = 1; elapsed < total; ++n)
        {
            const auto end = frequency ? std::min(total, n * 1'000'000'000 / frequency) :
                std::min(total, elapsed + random() % 71'000'003 + 1);
            position = AdvanceCreditsScroll(phase, start, height, end - elapsed);
            elapsed = end;
        }
        Require(phase == total % period && position == static_cast<float>(
            double(start) - double(total % period) / 40'000'000),
            "Credits roll differs from its finite elapsed-time phase");
        return std::array<std::uint64_t, 2>{phase, std::bit_cast<std::uint32_t>(position)};
    };
    for (const auto duration : {137'192'835ULL, period - 1, period,
                               period + 37'192'835, period * 3 + 127'192'835})
    {
        const auto expected = sample(100, duration);
        for (const int frequency : {200, 1000, 0})
            Require(sample(frequency, duration) == expected,
                "Credits roll position or wrap depends on update partition");
    }
    // Direct 1073 recurrence oracle, including the strict '< bottom' test.
    std::uint64_t phase = 0;
    float position = start, reference = start;
    for (int tick = 0; tick < 2 * (4 * distance + 1) + 17; ++tick)
    {
        reference -= .25f;
        if (reference < -(height + 120)) reference = start;
        position = AdvanceCreditsScroll(phase, start, height, 10'000'000);
        Require(position == reference, "Credits roll changed its 1073 10ms wrap cadence");
    }
    phase = std::uint64_t(4 * distance) * 10'000'000;
    Require(AdvanceCreditsScroll(phase, start, height, 0) == -(height + 120),
        "Credits roll wrapped at equality instead of the strict lower boundary");
    AdvanceCreditsScroll(phase, start, height, 9'999'999);
    Require(phase == period - 1, "Credits roll lost the fractional last tick");
    Require(AdvanceCreditsScroll(phase, start, height, 1) == start && phase == 0,
        "Credits roll missed its exact canonical wrap nanosecond");
    // Paused / DontSync / JumpToFrame paths retain this public phase by not
    // calling the advance routine. Resuming adds only new scrolling time.
    phase = 137'192'835;
    const auto before = phase;
    Require(AdvanceCreditsScroll(phase, start, height, 0) ==
                static_cast<float>(double(start) - double(before) / 40'000'000) && phase == before,
        "Credits roll advanced during a zero-length interval");
    const auto expected = (phase + UINT64_MAX % period) % period;
    AdvanceCreditsScroll(phase, start, height, UINT64_MAX);
    Require(phase == expected && phase < period,
        "Long-running credits roll overflowed its finite integer phase");
}
} // namespace CreditsScrollRuntime
