#pragma once
#include "ReanimClock.h"
#include <bit>
#include <cmath>
#include <cstdint>
#include <stdexcept>

namespace ParticleClock
{
constexpr std::int64_t Cycle = 1'000'000'000'000LL;

inline std::int64_t ConstantRatePhase(std::int64_t elapsedNs, float rate)
{
    if (!std::isfinite(rate) || elapsedNs < 0)
        throw std::overflow_error("invalid particle animation clock or rate");
    const auto bits = std::bit_cast<std::uint32_t>(rate);
    const auto encodedExponent = (bits >> 23) & 255;
    const std::uint64_t significand = (bits & 0x7fffff) |
        (encodedExponent ? 0x800000 : 0);
    const int exponent = encodedExponent ? int(encodedExponent) - 150 : -149;
    // A float is exactly significand*2^exponent. Compute the 128-bit product
    // elapsedNs*significand*1000 before dividing. The 1000 converts nanoseconds
    // to the existing 10^-12 cycle clock; it never quantizes the source rate.
    const auto a = static_cast<std::uint64_t>(elapsedNs);
    const auto b = significand * 1000;
    const std::uint64_t al = static_cast<std::uint32_t>(a), ah = a >> 32;
    const std::uint64_t bl = static_cast<std::uint32_t>(b), bh = b >> 32;
    const auto p = al * bl;
    const auto middle = ah * bl + (p >> 32);
    const auto middle2 = al * bh + static_cast<std::uint32_t>(middle);
    auto hi = ah * bh + (middle >> 32) + (middle2 >> 32);
    auto lo = (middle2 << 32) | static_cast<std::uint32_t>(p);
    if (exponent < 0)
    {
        const auto shift = -exponent;
        if (shift >= 128) return 0;
        if (shift >= 64) { lo = hi >> (shift - 64); hi = 0; }
        else { lo = (lo >> shift) | (hi << (64 - shift)); hi >>= shift; }
    }
    std::uint64_t phase;
    constexpr auto highWordModulo = UINT64_MAX % Cycle + 1;
    ReanimClock::MulDiv(hi % Cycle, highWordModulo, Cycle, &phase);
    phase = (phase + lo % Cycle) % Cycle;
    for (int bit = 0; bit < exponent; ++bit)
        phase = (phase * 2) % Cycle;
    return bits >> 31 && phase ? -static_cast<std::int64_t>(phase)
        : static_cast<std::int64_t>(phase);
}
}
