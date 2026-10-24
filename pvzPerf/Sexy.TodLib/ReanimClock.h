#pragma once
#include <cstdint>
#include <limits>
#include <stdexcept>
#include <numeric>
#include <cmath>
#if defined(_MSC_VER) && defined(_M_X64)
#include <intrin.h>
#endif

namespace ReanimClock
{
// Original-speed phase: each authored frame spans one second in nanoseconds.
constexpr std::int64_t Frame = 1'000'000'000LL;

// Exact unsigned 64 x 64 / 64. Native wide arithmetic avoids both a separate
// overflow-test division and the bit-by-bit fallback for ordinary phase samples.
inline std::uint64_t MulDiv(std::uint64_t a, std::uint64_t b, std::uint64_t d,
                            std::uint64_t* remainder = nullptr)
{
    if (!d) throw std::overflow_error("zero animation divisor");
#if defined(_MSC_VER) && defined(_M_X64)
    std::uint64_t high, rem;
    const auto low = _umul128(a, b, &high);
    if (high >= d) throw std::overflow_error("animation quotient overflow");
    const auto quotient = _udiv128(high, low, d, &rem);
    if (remainder) *remainder = rem;
    return quotient;
#elif defined(__SIZEOF_INT128__)
    const auto product = static_cast<unsigned __int128>(a) * b;
    const auto high = static_cast<std::uint64_t>(product >> 64);
    if (high >= d) throw std::overflow_error("animation quotient overflow");
    if (high == 0)
    {
        const auto low = static_cast<std::uint64_t>(product);
        if (remainder) *remainder = low % d;
        return low / d;
    }
    if (remainder) *remainder = static_cast<std::uint64_t>(product % d);
    return static_cast<std::uint64_t>(product / d);
#else
    if (!b || a <= UINT64_MAX / b)
    {
        const auto product = a * b;
        if (remainder) *remainder = product % d;
        return product / d;
    }
    const std::uint64_t al = static_cast<std::uint32_t>(a), ah = a >> 32;
    const std::uint64_t bl = static_cast<std::uint32_t>(b), bh = b >> 32;
    const auto p = al * bl;
    const auto middle = ah * bl + (p >> 32);
    const auto middle2 = al * bh + static_cast<std::uint32_t>(middle);
    const auto hi = ah * bh + (middle >> 32) + (middle2 >> 32);
    const auto lo = (middle2 << 32) | static_cast<std::uint32_t>(p);
    if (hi >= d) throw std::overflow_error("animation quotient overflow");
    std::uint64_t rem = hi, quotient = 0;
    for (int bit = 63; bit >= 0; --bit)
    {
        const bool carry = (rem >> 63) != 0;
        rem = (rem << 1) | ((lo >> bit) & 1);
        if (carry || rem >= d) { rem -= d; quotient |= UINT64_C(1) << bit; }
    }
    if (remainder) *remainder = rem;
    return quotient;
#endif
}

inline std::int64_t SignedMulDiv(std::int64_t a, std::int64_t b, std::int64_t d)
{
    if (d <= 0) throw std::overflow_error("invalid animation divisor");
    const auto magnitude = [](std::int64_t value) {
        return value < 0 ? std::uint64_t(-(value + 1)) + 1 : std::uint64_t(value);
    };
    const auto q = MulDiv(magnitude(a), magnitude(b), std::uint64_t(d));
    const bool negative = (a < 0) != (b < 0);
    if (q > std::uint64_t(INT64_MAX) + negative)
        throw std::overflow_error("animation result overflow");
    return negative ? (q == (UINT64_C(1) << 63) ? INT64_MIN : -std::int64_t(q)) : std::int64_t(q);
}

inline std::int64_t Add(std::int64_t a, std::int64_t b)
{
    if ((b > 0 && a > INT64_MAX - b) || (b < 0 && a < INT64_MIN - b))
        throw std::overflow_error("animation clock overflow");
    return a + b;
}

inline std::int64_t Subtract(std::int64_t a, std::int64_t b)
{
    if ((b > 0 && a < INT64_MIN + b) || (b < 0 && a > INT64_MAX + b))
        throw std::overflow_error("animation difference overflow");
    return a - b;
}

inline std::int64_t Product(std::int64_t a, std::int64_t b)
{
    return SignedMulDiv(a, b, 1);
}

inline std::int64_t PeriodFromRate(int frameCount, float rate)
{
    if (!std::isfinite(rate)) throw std::overflow_error("nonfinite animation rate");
    if (frameCount <= 0 || rate == 0) return 1;
    const double duration = std::floor(static_cast<double>(frameCount) * 1'000'000'000.0 /
        std::fabs(static_cast<double>(rate)));
    if (duration < 1 || duration >= 9223372036854775808.0)
        throw std::overflow_error("animation period out of range");
    return static_cast<std::int64_t>(duration);
}

inline std::int64_t CeilMulDiv(std::int64_t a, std::int64_t b, std::int64_t denominator)
{
    if (a < 0 || b < 0 || denominator <= 0)
        throw std::overflow_error("invalid animation event ratio");
    std::uint64_t remainder;
    auto result = MulDiv(a, b, denominator, &remainder);
    if (result > std::uint64_t(INT64_MAX) - (remainder != 0))
        throw std::overflow_error("animation event ratio overflow");
    return static_cast<std::int64_t>(result + (remainder != 0));
}

// Source endpoints remain floats in pixels. This absolute sample never rounds
// position or feeds a floating increment back into authoritative playback state.
inline double RootSampleFloat(int count, bool fullLast, std::int64_t period,
    std::int64_t cycles, float first, float before, float after, float last,
    std::uint64_t fraction, float scale)
{
    if (count <= 1 || scale == 0) return 0;
    const double cycle = static_cast<double>(last) - static_cast<double>(first);
    const double local = static_cast<double>(before) - static_cast<double>(first) +
        (static_cast<double>(after) - static_cast<double>(before)) *
        (static_cast<double>(fraction) / static_cast<double>(period));
    const double compatibility = fullLast ? 1.0 : static_cast<double>(count) / (count - 1);
    return (static_cast<double>(cycles) * cycle + local) *
        compatibility * static_cast<double>(scale);
}

inline double ClippedRootSampleFloat(std::int64_t cycles, std::int64_t period,
    std::uint64_t fraction, double cyclePixels, double prefixPixels, double selectedPixels)
{
    return static_cast<double>(cycles) * cyclePixels + prefixPixels +
        selectedPixels * (static_cast<double>(fraction) / static_cast<double>(period));
}

inline void Advance(std::int64_t& phase, std::int64_t& cycles,
                    std::int64_t period, int direction, std::int64_t deltaNs)
{
    if (!direction || !deltaNs) return;
    if (direction < -1 || direction > 1)
        throw std::overflow_error("invalid animation direction");
    if (period <= 0 || phase < 0 || phase > period)
        throw std::overflow_error("invalid animation clock");
    if (phase == period) { phase = 0; cycles = Add(cycles, 1); }
    const bool backwards = (direction < 0) != (deltaNs < 0);
    const auto magnitude = [](std::int64_t value) {
        return value < 0 ? std::uint64_t(-(value + 1)) + 1 : std::uint64_t(value);
    };
    const auto count = magnitude(deltaNs) / period;
    const auto remainder = magnitude(deltaNs) % period;
    if (count > INT64_MAX) throw std::overflow_error("animation cycle overflow");
    cycles = Add(cycles, backwards ? -std::int64_t(count) : std::int64_t(count));
    if (backwards)
    {
        phase -= std::int64_t(remainder);
        if (phase < 0) { phase += period; cycles = Add(cycles, -1); }
    }
    else if (remainder >= std::uint64_t(period - phase))
    {
        phase = std::int64_t(remainder) - (period - phase);
        cycles = Add(cycles, 1);
    }
    else phase += std::int64_t(remainder);
}

inline void SampleAt(std::int64_t nowNs, std::int64_t startTimeNs,
    std::int64_t originPhaseNs, std::int64_t originCycles, std::int64_t period,
    int direction, std::int64_t& phase, std::int64_t& cycles)
{
    phase = originPhaseNs;
    cycles = originCycles;
    if (direction != 0)
        Advance(phase, cycles, period, direction, Subtract(nowNs, startTimeNs));
}

// Move the logical phase-zero timestamp, rather than accumulating phase.
// A held exact endpoint keeps its endpoint representation at the anchor time.
inline std::int64_t StartTimeAt(std::int64_t nowNs, std::int64_t phase,
    std::int64_t period, int direction, std::int64_t& originPhase)
{
    if (period <= 0 || phase < 0 || phase > period || direction < -1 || direction > 1)
        throw std::overflow_error("invalid animation time anchor");
    if (direction > 0 && phase < period)
    {
        originPhase = 0;
        return Subtract(nowNs, phase);
    }
    if (direction < 0 && phase > 0)
    {
        originPhase = period;
        return Subtract(nowNs, period - phase);
    }
    originPhase = phase;
    return nowNs;
}

inline std::int64_t EventCount(std::int64_t previousPhase, std::int64_t previousCycles,
    std::int64_t phase, std::int64_t cycles, std::int64_t period, std::int64_t threshold)
{
    const auto floorDiv = [period](std::int64_t n) { auto q = n / period; return q - (n % period < 0); };
    const auto ceilDiv = [period](std::int64_t n) { auto q = n / period; return q + (n % period > 0); };
    const auto delta = Subtract(cycles, previousCycles);
    if (delta > 0 || (delta == 0 && phase >= previousPhase))
        return Add(delta, ceilDiv(phase - threshold) - ceilDiv(previousPhase - threshold));
    return Add(delta, floorDiv(phase - threshold) - floorDiv(previousPhase - threshold));
}
}
