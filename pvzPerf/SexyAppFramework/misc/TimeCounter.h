#pragma once
#include <algorithm>
#include <compare>
#include <cmath>
#include <cstdint>
#include <limits>
#include <stdexcept>
#include <type_traits>

namespace Sexy
{
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
inline float UpdateDelta(float value) { return value * static_cast<float>(gUpdateTicks); }
inline float UpdateDecay(float value)
{
    return gUpdateTicks == 1.0 ? value : std::pow(value, static_cast<float>(gUpdateTicks));
}

// Numeric constants retain their documented unit. State stores nanoseconds,
// independent of target FPS; legacy conversion is confined to explicit I/O.
template<class Storage = int, std::int64_t UnitNs = 10'000'000>
struct BasicTimeCounter
{
    using Nanoseconds = std::conditional_t<std::is_unsigned_v<Storage>, std::uint64_t, std::int64_t>;
    Nanoseconds mNanoseconds;
    Nanoseconds mPreviousNanoseconds;

    BasicTimeCounter() = default;
    template<class T> requires std::is_arithmetic_v<T>
    BasicTimeCounter(T value) : mNanoseconds(Encode(value)), mPreviousNanoseconds(mNanoseconds) {}
    template<class T> requires std::is_arithmetic_v<T>
    static Nanoseconds Encode(T value)
    {
        if constexpr (std::is_integral_v<T>)
        {
            if constexpr (std::is_unsigned_v<Storage>)
            {
                if constexpr (sizeof(Storage) <= 4)
                    // Legacy unsigned values wrap at 2^32 units, including -1.
                    return std::uint64_t(static_cast<std::uint32_t>(value)) * UnitNs;
                else
                {
                    if constexpr (std::is_signed_v<T>)
                        if (value < 0) throw std::overflow_error("negative simulation clock");
                    if (static_cast<std::uint64_t>(value) > UINT64_MAX / UnitNs)
                        throw std::overflow_error("simulation clock overflow");
                    return static_cast<std::uint64_t>(value) * UnitNs;
                }
            }
            else
            {
                if (value > std::numeric_limits<std::int64_t>::max() / UnitNs)
                    return std::numeric_limits<std::int64_t>::max();
                if constexpr (std::is_signed_v<T>)
                    if (value < std::numeric_limits<std::int64_t>::min() / UnitNs)
                        return std::numeric_limits<std::int64_t>::min();
                return static_cast<std::int64_t>(value) * UnitNs;
            }
        }
        const long double rounded = std::round(static_cast<long double>(value) * UnitNs);
        if constexpr (std::is_unsigned_v<Storage>)
        {
            if constexpr (sizeof(Storage) <= 4)
            {
                constexpr std::uint64_t modulus = (std::uint64_t(1) << 32) * UnitNs;
                long double wrapped = std::fmod(rounded, static_cast<long double>(modulus));
                if (wrapped < 0) wrapped += modulus;
                return static_cast<Nanoseconds>(wrapped);
            }
            else
            {
                if (!std::isfinite(rounded) || rounded < 0 ||
                    rounded >= 18'446'744'073'709'551'616.0L)
                    throw std::overflow_error("simulation clock overflow");
                return static_cast<Nanoseconds>(rounded);
            }
        }
        if (rounded >= static_cast<long double>(std::numeric_limits<Nanoseconds>::max()))
            return std::numeric_limits<Nanoseconds>::max();
        if (rounded <= static_cast<long double>(std::numeric_limits<Nanoseconds>::min()))
            return std::numeric_limits<Nanoseconds>::min();
        return static_cast<Nanoseconds>(rounded);
    }
    operator Storage() const
    {
        if constexpr (std::is_unsigned_v<Storage>)
        {
            const std::uint64_t units = mNanoseconds / UnitNs +
                (mNanoseconds % UnitNs >= (UnitNs + 1) / 2);
            if constexpr (sizeof(Storage) <= 4)
                return static_cast<Storage>(units & 0xffffffffULL);
            else return static_cast<Storage>(units);
        }
        else
        {
            const std::int64_t units = mNanoseconds / UnitNs;
            const std::int64_t remainder = mNanoseconds % UnitNs;
            const std::int64_t rounded = units + (remainder >= (UnitNs + 1) / 2)
                - (remainder <= -(UnitNs + 1) / 2);
            return static_cast<Storage>(std::clamp(rounded,
                std::int64_t(std::numeric_limits<Storage>::min()),
                std::int64_t(std::numeric_limits<Storage>::max())));
        }
    }
    explicit operator bool() const { return mNanoseconds != 0; }
    double LegacyTicks() const { return static_cast<double>(mNanoseconds) / UnitNs; }
    void AddNanoseconds(std::int64_t delta)
    {
        mPreviousNanoseconds = mNanoseconds;
        if constexpr (std::is_unsigned_v<Storage>)
        {
            const std::uint64_t magnitude = delta < 0
                ? std::uint64_t(0) - static_cast<std::uint64_t>(delta)
                : static_cast<std::uint64_t>(delta);
            if constexpr (sizeof(Storage) <= 4)
            {
                constexpr std::uint64_t modulus = (std::uint64_t(1) << 32) * UnitNs;
                const std::uint64_t base = mNanoseconds % modulus;
                const auto change = magnitude % modulus;
                mNanoseconds = delta < 0 ? (base >= change ? base - change : modulus - (change - base))
                    : (base >= modulus - change ? base - (modulus - change) : base + change);
            }
            else
            {
                if ((delta < 0 && magnitude > mNanoseconds) ||
                    (delta >= 0 && magnitude > UINT64_MAX - mNanoseconds))
                    throw std::overflow_error("simulation clock overflow");
                mNanoseconds = delta < 0 ? mNanoseconds - magnitude : mNanoseconds + magnitude;
            }
        }
        else
        {
            const auto maximum = std::numeric_limits<std::int64_t>::max();
            const auto minimum = std::numeric_limits<std::int64_t>::min();
            const std::int64_t next = delta > 0 && mNanoseconds > maximum - delta ? maximum
                : delta < 0 && mNanoseconds < minimum - delta ? minimum : mNanoseconds + delta;
            mNanoseconds = next;
        }
    }
    void Advance(int steps)
    {
        const auto magnitude = steps < 0 ? std::uint64_t(0) - std::uint64_t(steps) : std::uint64_t(steps);
        const auto maximum = std::uint64_t(std::numeric_limits<std::int64_t>::max());
        const auto delta = magnitude && gUpdateIntervalNs > maximum / magnitude
            ? maximum : magnitude * gUpdateIntervalNs;
        AddNanoseconds(steps < 0 ? -static_cast<std::int64_t>(delta) : static_cast<std::int64_t>(delta));
        if constexpr (!std::is_unsigned_v<Storage>)
        {
            // Countdown users test == 0; expiry cannot skip over zero.
            if ((mPreviousNanoseconds > 0 && mNanoseconds < 0) ||
                (mPreviousNanoseconds < 0 && mNanoseconds > 0))
                mNanoseconds = 0;
        }
    }
    BasicTimeCounter& operator++() { Advance(1); return *this; }
    BasicTimeCounter& operator--() { Advance(-1); return *this; }
    BasicTimeCounter operator++(int) { auto old = *this; ++*this; return old; }
    BasicTimeCounter operator--(int) { auto old = *this; --*this; return old; }
    BasicTimeCounter& operator+=(double value) { AddNanoseconds(BasicTimeCounter<int, UnitNs>::Encode(value)); return *this; }
    BasicTimeCounter& operator-=(double value) { AddNanoseconds(BasicTimeCounter<int, UnitNs>::Encode(-value)); return *this; }
    BasicTimeCounter& operator*=(double value) { mPreviousNanoseconds = mNanoseconds; if (value != 1) mNanoseconds = Encode(LegacyTicks() * value); return *this; }
    BasicTimeCounter& operator/=(double value) { mPreviousNanoseconds = mNanoseconds; if (value != 1) mNanoseconds = Encode(LegacyTicks() / value); return *this; }
    bool operator==(const BasicTimeCounter& rhs) const { return mNanoseconds == rhs.mNanoseconds; }
    auto operator<=>(const BasicTimeCounter& rhs) const { return mNanoseconds <=> rhs.mNanoseconds; }
    template<class T> requires std::is_arithmetic_v<T>
    bool operator==(T value) const
    {
        const auto target = Encode(value);
        return mNanoseconds == target ||
            (mPreviousNanoseconds < target && mNanoseconds > target) ||
            (mPreviousNanoseconds > target && mNanoseconds < target);
    }
    template<class T> requires std::is_arithmetic_v<T>
    std::strong_ordering operator<=>(T value) const { return mNanoseconds <=> Encode(value); }
    template<class T> requires std::is_integral_v<T>
    int operator%(T period) const
    {
        if (!period || period == 1 || period == -1) return 0;
        const auto p = static_cast<std::int64_t>(period);
        const auto magnitude = p < 0 ? std::uint64_t(0) - std::uint64_t(p) : std::uint64_t(p);
        if (magnitude > std::uint64_t(std::numeric_limits<std::int64_t>::max()) / UnitNs)
            return mNanoseconds ? 1 : 0;
        const auto duration = static_cast<std::int64_t>(magnitude * UnitNs);
        if constexpr (std::is_unsigned_v<Storage>)
        {
            const auto divisor = static_cast<std::uint64_t>(duration);
            const auto quotient = [&](std::uint64_t ns) {
                return ns / divisor + (mNanoseconds < mPreviousNanoseconds && ns % divisor != 0);
            };
            if (quotient(mNanoseconds) != quotient(mPreviousNanoseconds)) return 0;
            const auto remainder = mNanoseconds % divisor;
            const int legacy = static_cast<int>(remainder / UnitNs);
            return legacy ? legacy : remainder ? 1 : 0;
        }
        else
        {
            const auto quotient = [&](std::int64_t ns) {
                const auto q = ns / duration, r = ns % duration;
                return mNanoseconds >= mPreviousNanoseconds ? q - (r < 0) : q + (r > 0);
            };
            if (quotient(mNanoseconds) != quotient(mPreviousNanoseconds)) return 0;
            const auto remainder = mNanoseconds % duration;
            const int legacy = static_cast<int>(remainder / UnitNs);
            return legacy ? legacy : remainder > 0 ? 1 : remainder < 0 ? -1 : 0;
        }
    }
};
using TimeCounter = BasicTimeCounter<int>;
using UnsignedTimeCounter = BasicTimeCounter<unsigned int>;
using MonotonicTimeCounter = BasicTimeCounter<std::uint64_t>;
using MillisecondCounter = BasicTimeCounter<int, 1'000'000>;
using UnsignedMillisecondCounter = BasicTimeCounter<unsigned int, 1'000'000>;
using SecondCounter = BasicTimeCounter<int, 1'000'000'000>;
static_assert(sizeof(TimeCounter) == 16 && sizeof(UnsignedTimeCounter) == 16);
static_assert(std::is_trivially_copyable_v<TimeCounter>);
}
