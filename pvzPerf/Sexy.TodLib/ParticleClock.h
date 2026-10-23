#pragma once
#include "ReanimClock.h"
#include <algorithm>
#include <bit>
#include <cmath>
#include <cstdint>
#include <stdexcept>

namespace ParticleClock
{
constexpr std::int64_t Cycle = 1'000'000'000'000LL;

struct RateProduct
{
    std::uint64_t hi, lo;
    int exponent;
    bool negative;
};

inline RateProduct ProductAtTime(std::int64_t elapsedNs, float rate)
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
        if (shift >= 128) return {0, 0, 0, bool(bits >> 31)};
        if (shift >= 64) { lo = hi >> (shift - 64); hi = 0; }
        else { lo = (lo >> shift) | (hi << (64 - shift)); hi >>= shift; }
    }
    return {hi, lo, std::max(0, exponent), bool(bits >> 31)};
}

inline std::int64_t ConstantRatePhase(std::int64_t elapsedNs, float rate)
{
    const auto product = ProductAtTime(elapsedNs, rate);
    std::uint64_t phase;
    constexpr auto highWordModulo = UINT64_MAX % Cycle + 1;
    ReanimClock::MulDiv(product.hi % Cycle, highWordModulo, Cycle, &phase);
    phase = (phase + product.lo % Cycle) % Cycle;
    for (int bit = 0; bit < product.exponent; ++bit)
        phase = (phase * 2) % Cycle;
    return product.negative && phase ? -static_cast<std::int64_t>(phase)
        : static_cast<std::int64_t>(phase);
}

struct RateIntegral { std::int64_t whole, fraction; };

inline RateIntegral ConstantRateIntegral(std::int64_t elapsedNs, float rate)
{
    auto product = ProductAtTime(elapsedNs, rate);
    for (int bit = 0; bit < product.exponent; ++bit)
    {
        if (product.hi >> 63) throw std::overflow_error("particle rate total exceeds clock range");
        product.hi = (product.hi << 1) | (product.lo >> 63);
        product.lo <<= 1;
    }
    if (product.hi >= Cycle) throw std::overflow_error("particle rate total exceeds clock range");
    std::uint64_t quotient, remainder;
    if (product.hi == 0)
    {
        quotient = product.lo / Cycle;
        remainder = product.lo % Cycle;
    }
    else
    {
        quotient = 0;
        remainder = product.hi;
        for (int bit = 63; bit >= 0; --bit)
        {
            remainder = (remainder << 1) | ((product.lo >> bit) & 1);
            if (remainder >= Cycle) { remainder -= Cycle; quotient |= UINT64_C(1) << bit; }
        }
    }
    if (quotient > std::uint64_t(INT64_MAX) + product.negative)
        throw std::overflow_error("particle rate total exceeds signed clock range");
    return {product.negative ? (quotient == (UINT64_C(1) << 63) ? INT64_MIN : -std::int64_t(quotient))
        : std::int64_t(quotient), product.negative ? -std::int64_t(remainder) : std::int64_t(remainder)};
}
}
