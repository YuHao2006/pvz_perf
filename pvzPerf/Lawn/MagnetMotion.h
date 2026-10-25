#pragma once
#include <algorithm>
#include <cmath>
#include <cstdint>

namespace MagnetMotion
{
// Acceleration toward the target is K/r^2, in pixels and seconds.
// At 800px the center-arrival time is about 795ms. Extremely distant targets
// receive stronger attraction to enforce the strict sub-second flight limit.
inline constexpr double Strength = 1'000'000'000.0;
inline constexpr std::uint64_t MaxFlightNs = 900'000'000;
inline constexpr float CaptureRadius = 20.0f;
// The sampled endpoint is stored as float. Allow the final rounded point to
// cross the mathematical radius by a few thousandths without keeping the
// item in the top render layer forever.
inline constexpr float CaptureRadiusEpsilon = 0.01f;
inline constexpr double Curve[] = {
#include "MagnetMotionCurve.inc"
};

inline double Fraction(std::uint64_t elapsedNs, std::uint64_t centerDurationNs)
{
    if (elapsedNs >= centerDurationNs) return 0;
    const double index = static_cast<double>(elapsedNs) / centerDurationNs * 4096;
    const auto cell = static_cast<unsigned>(index);
    return Curve[cell] + (double(Curve[cell + 1]) - Curve[cell]) * (index - cell);
}

template<class Item>
inline void Bind(Item& item, float targetX, float targetY)
{
    item.mOriginDeltaX = item.mPosX - targetX;
    item.mOriginDeltaY = item.mPosY - targetY;
    const double squared = double(item.mOriginDeltaX) * item.mOriginDeltaX +
        double(item.mOriginDeltaY) * item.mOriginDeltaY;
    const double radius = std::sqrt(squared);
    item.mCaptureFactor = radius > CaptureRadius ? static_cast<float>(CaptureRadius / radius) : 1.0f;
    const double duration = 1.57079632679489661923 *
        std::sqrt(squared * radius / (2 * Strength)) * 1'000'000'000;
    item.mCenterDurationNs = static_cast<std::uint64_t>(
        std::clamp(std::ceil(duration), 1.0, double(MaxFlightNs)));
}

template<class Item>
inline bool Sample(Item& item, float targetX, float targetY, std::uint64_t elapsedNs)
{
    const double factor = std::max<double>(item.mCaptureFactor,
        Fraction(elapsedNs, item.mCenterDurationNs));
    item.mPosX = static_cast<float>(targetX + item.mOriginDeltaX * factor);
    item.mPosY = static_cast<float>(targetY + item.mOriginDeltaY * factor);
    return factor <= item.mCaptureFactor;
}

inline std::uint64_t Advance(std::uint64_t elapsedNs, std::uint64_t deltaNs)
{
    return elapsedNs + std::min(deltaNs, MaxFlightNs - elapsedNs);
}
}
