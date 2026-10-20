#pragma once
#include <algorithm>
#include <compare>
#include <cmath>
#include <limits>
#include <type_traits>

namespace Sexy
{
// Counter payloads keep their four-byte save layout. Runtime units are update
// steps; integer constants and save files retain the original 100 Hz units.
inline double gUpdateTicks = 1.0;
inline double gStepsPerLegacyTick = 1.0;
inline unsigned long long gUpdateIntervalNs = 10'000'000ULL;
inline unsigned long long gLegacyTickPhaseNs = 0;
inline int gWholeLegacyTicks = 1;
inline void BeginTimedUpdate()
{
    gLegacyTickPhaseNs += gUpdateIntervalNs;
    gWholeLegacyTicks = static_cast<int>(gLegacyTickPhaseNs / 10'000'000ULL);
    gLegacyTickPhaseNs %= 10'000'000ULL;
}
inline float UpdateDelta(float value)
{
    return value * static_cast<float>(gUpdateTicks);
}
inline float UpdateDecay(float value)
{
    return gUpdateTicks == 1.0 ? value : std::pow(value, static_cast<float>(gUpdateTicks));
}

template<class Storage = int>
struct BasicTimeCounter
{
    Storage mSteps;

    BasicTimeCounter() = default;
    template<class T> requires std::is_arithmetic_v<T>
    BasicTimeCounter(T value) : mSteps(Encode(value)) {}

    template<class T> requires std::is_arithmetic_v<T>
    static Storage Encode(T value)
    {
        if (gStepsPerLegacyTick == 1.0)
            return static_cast<Storage>(value);
        const double scaled = static_cast<double>(value) * gStepsPerLegacyTick;
        if constexpr (std::is_unsigned_v<Storage>)
        {
            const double rounded = scaled >= 0 ? scaled + 0.5 : scaled - 0.5;
            if (rounded >= 0 && rounded < 4294967296.0)
                return static_cast<Storage>(rounded);
            double wrapped = std::fmod(std::trunc(rounded), 4294967296.0);
            if (wrapped < 0) wrapped += 4294967296.0;
            return static_cast<Storage>(wrapped);
        }
        else
        {
            const double rounded = scaled >= 0 ? scaled + 0.5 : scaled - 0.5;
            return static_cast<Storage>(std::clamp(rounded,
                static_cast<double>(std::numeric_limits<Storage>::min()),
                static_cast<double>(std::numeric_limits<Storage>::max())));
        }
    }

    operator Storage() const
    {
        if (gUpdateTicks == 1.0) return mSteps;
        const double ticks = mSteps * gUpdateTicks;
        return static_cast<Storage>(ticks >= 0 ? ticks + 0.5 : ticks - 0.5);
    }
    explicit operator bool() const { return mSteps != 0; }
    double LegacyTicks() const { return mSteps * gUpdateTicks; }
    BasicTimeCounter& operator++() { ++mSteps; return *this; }
    BasicTimeCounter& operator--() { --mSteps; return *this; }
    BasicTimeCounter operator++(int) { const auto old = *this; ++*this; return old; }
    BasicTimeCounter operator--(int) { const auto old = *this; --*this; return old; }
    BasicTimeCounter& operator+=(double value) { mSteps += Encode(value); return *this; }
    BasicTimeCounter& operator-=(double value) { mSteps -= Encode(value); return *this; }
    BasicTimeCounter& operator*=(double value) { mSteps = static_cast<Storage>(mSteps * value); return *this; }
    BasicTimeCounter& operator/=(double value) { mSteps = static_cast<Storage>(mSteps / value); return *this; }
    void Advance(int steps) { mSteps += steps; }

    bool operator==(const BasicTimeCounter& rhs) const = default;
    auto operator<=>(const BasicTimeCounter& rhs) const = default;
    template<class T> requires std::is_arithmetic_v<T>
    bool operator==(T value) const { return mSteps == Encode(value); }
    template<class T> requires std::is_arithmetic_v<T>
    std::strong_ordering operator<=>(T value) const { return mSteps <=> Encode(value); }

    template<class T> requires std::is_integral_v<T>
    int operator%(T period) const
    {
        if (period == 1 || period == -1) return 0;
        if (!period) return 0;
        if (gUpdateTicks == 1.0) return static_cast<int>(mSteps % period);
        const double ticks = LegacyTicks();
        const double before = ticks - gUpdateTicks;
        if (std::floor(ticks / period) != std::floor(before / period)) return 0;
        const double remainder = std::fmod(ticks, static_cast<double>(period));
        const int legacy = static_cast<int>(remainder);
        return legacy ? legacy : (remainder > 0 ? 1 : -1);
    }
};
using TimeCounter = BasicTimeCounter<int>;
using UnsignedTimeCounter = BasicTimeCounter<unsigned int>;
static_assert(sizeof(TimeCounter) == sizeof(int));
static_assert(alignof(TimeCounter) == alignof(int));
static_assert(std::is_trivially_copyable_v<TimeCounter>);
static_assert(sizeof(UnsignedTimeCounter) == sizeof(unsigned int));
}
