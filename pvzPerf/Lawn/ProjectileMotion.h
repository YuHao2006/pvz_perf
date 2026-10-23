#pragma once
#include <algorithm>
#include <cmath>
#include <cstdint>
#include <limits>
#include <stdexcept>

namespace ProjectileMotionMath
{
constexpr std::int64_t TickNs = 10'000'000;

inline double Ticks(std::int64_t now, std::int64_t origin)
{
    if (origin < 0 && now > INT64_MAX + origin)
        throw std::overflow_error("projectile clock interval exceeds range");
    return std::max(0.0, static_cast<double>(now - origin) / TickNs);
}

// Exact real-time extension of the original semi-implicit 100 Hz recurrence:
// velocity is advanced before position, so the correction is t*(t+1)/2.
inline double LobOffset(double initialVelocity, double acceleration, double ticks)
{
    return initialVelocity * ticks + acceleration * ticks * (ticks + 1.0) * 0.5;
}
inline double LobVelocity(double initialVelocity, double acceleration, double ticks)
{
    return initialVelocity + acceleration * ticks;
}
inline double DampedVelocity(double initialVelocity, double decay, double ticks)
{
    return initialVelocity * std::pow(decay, ticks);
}
inline double DampedOffset(double initialVelocity, double decay, double ticks)
{
    return decay == 1.0 ? initialVelocity * ticks :
        initialVelocity * (-std::expm1(std::log(decay) * ticks)) / (1.0 - decay);
}

struct FloatState { double offset, velocity, rotationVelocity; };
inline FloatState FloatAtTick(double velocity, double ticks, bool highGravity)
{
    if (!highGravity)
    {
        if (velocity >= 0) return {0, velocity, velocity};
        const auto negativeSteps = std::max(0.0, std::ceil(-velocity / 0.002) - 1.0);
        const auto moving = std::min(ticks, negativeSteps);
        const auto current = std::min(velocity + 0.002 * ticks, 0.0);
        return {LobOffset(velocity, 0.002, moving), current, current};
    }
    if (velocity >= 0)
        return {LobOffset(velocity, 0.004, ticks), velocity + 0.004 * ticks, velocity};
    const auto risingSteps = std::ceil(-velocity / 0.006);
    const auto rising = std::min(ticks, risingSteps);
    auto offset = 2 * velocity * rising + 0.006 * rising * (rising + 1) - 0.004 * rising;
    const auto lastBefore = velocity + 0.006 * (risingSteps - 1);
    const auto lastFirstVelocity = std::min(lastBefore + 0.002, 0.0);
    const auto afterRise = lastFirstVelocity + 0.004;
    if (rising == risingSteps && lastBefore + 0.002 > 0)
        offset += 0.004 - (2 * lastBefore + 0.008);
    const auto falling = std::max(0.0, ticks - risingSteps);
    offset += LobOffset(afterRise, 0.004, falling);
    return {offset, ticks < risingSteps ? velocity + 0.006 * ticks : afterRise + 0.004 * falling,
        ticks > 0 ? std::min(velocity + 0.006 * (std::min(ticks, risingSteps) - 1) + 0.002, 0.0) : velocity};
}
inline FloatState FloatSample(double velocity, double ticks, bool highGravity)
{
    // Clamped branches retain their exact integer-step knots; interpolate the
    // last partial step without feeding that display sample back into state.
    const auto whole = std::floor(ticks);
    const auto before = FloatAtTick(velocity, whole, highGravity);
    const auto after = FloatAtTick(velocity, whole + 1, highGravity);
    const auto fraction = ticks - whole;
    return {before.offset + (after.offset - before.offset) * fraction,
        before.velocity + (after.velocity - before.velocity) * fraction,
        before.rotationVelocity + (after.rotationVelocity - before.rotationVelocity) * fraction};
}

struct Velocity2 { float x, y; };
inline Velocity2 HomingVelocity(float vx, float vy, float targetDx, float targetDy,
    double ageTicks, double deltaTicks)
{
    const float targetLength = std::sqrt(targetDx * targetDx + targetDy * targetDy);
    if (targetLength != 0) { targetDx /= targetLength; targetDy /= targetLength; }
    const auto steering = static_cast<float>(0.001f * static_cast<float>(ageTicks) * deltaTicks);
    vx += targetDx * steering;
    vy += targetDy * steering;
    const auto length = std::sqrt(vx * vx + vy * vy);
    if (length != 0) { vx /= length; vy /= length; }
    return {vx * 2.0f, vy * 2.0f};
}
}
