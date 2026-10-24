#pragma once
#include "Sexy.TodLib/ExponentialCurve.h"
#include <algorithm>
#include <cmath>
#include <cstdint>
#include <limits>
#include <stdexcept>

struct ZamboniMotionSample
{
    double position;
    double speed;
};

namespace ZamboniMotion
{
inline constexpr std::uint64_t TickNs = 10'000'000;
// Derive from the binary float endpoints used by TodAnimateCurveFloat.
inline constexpr double Slope = (double(.05f) - double(.25f)) / (300.0 - 700.0);
inline constexpr double Intercept = double(.25f) - Slope * 700.0;
inline double Speed(double x)
{
    return double(.25f) + (double(.05f) - double(.25f)) *
        std::clamp((x - 700.0) / (300.0 - 700.0), 0.0, 1.0);
}

template<int Direction>
inline ZamboniMotionSample Sample(double origin, float initialSpeed, std::uint64_t elapsedNs,
    bool flat, bool walking, float additionalSpeed)
{
    const double ticks = double(elapsedNs) / TickNs;
    const double additional = additionalSpeed;
    if (flat)
    {
        constexpr double deceleration = double(.0005f);
        double stop = 0;
        if (initialSpeed > deceleration)
        {
            stop = std::max(1.0, std::ceil((double(initialSpeed) - deceleration) / deceleration));
            if (stop > 1 && initialSpeed - deceleration * (stop - 1) <= deceleration) --stop;
            if (initialSpeed - deceleration * stop > deceleration) ++stop;
        }
        const double active = std::min(ticks, stop);
        const double speed = double(initialSpeed) - deceleration * active;
        const double distance = double(initialSpeed) * active -
            deceleration * active * (active + 1) * .5 + speed * (ticks - active);
        return {origin + (walking ? Direction * distance : 0) + additional * ticks, speed};
    }
    if (!walking)
    {
        // A stopped body's independent additional movement can still change X.
        // Speed updates use the preceding logical tick, as the type action did.
        const double previous = std::max(0.0, ticks - 1);
        const double x = origin + additional * ticks;
        double source = origin + additional * previous;
        if (additional < 0 && origin > 400 && source <= 400)
        {
            const double crossing = std::max(1.0, std::ceil((origin - 400) / -additional));
            source = origin + additional * (crossing - 1);
        }
        return {x, source > 400 ? Speed(source) : double(initialSpeed)};
    }
    constexpr double q = 1.0 + Direction * Slope;
    double x = origin, speed = initialSpeed;
    auto remaining = elapsedNs;
    for (int segment = 0; segment < 8; ++segment)
    {
        const double available = double(remaining) / TickNs;
        if (x <= 400 || x > 700)
        {
            const bool below = x <= 400;
            const double velocity = below ? speed : double(.25f);
            const double rate = Direction * velocity + additional;
            double crossing = std::numeric_limits<double>::infinity();
            if (below && rate > 0)
                crossing = std::max(1.0, std::floor((400 - x) / rate) + 1);
            else if (!below && rate < 0)
                crossing = std::max(1.0, std::ceil((x - 700) / -rate));
            if (crossing > available)
                return {x + rate * available, velocity};
            const auto used = static_cast<std::uint64_t>(crossing) * TickNs;
            x += rate * crossing;
            speed = velocity;
            remaining -= used;
            if (!remaining) return {x, speed};
            continue;
        }
        const double equilibrium = -(Direction * Intercept + additional) / (Direction * Slope);
        const auto positionAt = [&](std::uint64_t ns)
        {
            return equilibrium + (x - equilibrium) * TodExponentialCurve<q>(ns);
        };
        const double rate = Direction * Speed(x) + additional;
        const double boundary = rate < 0 ? 400 : 700;
        double crossing = std::numeric_limits<double>::infinity();
        if (rate != 0)
        {
            const double ratio = (boundary - equilibrium) / (x - equilibrium);
            if (ratio > 0)
            {
                const double root = std::log(ratio) / std::log(q);
                if (root >= 0)
                    crossing = std::max(1.0, rate < 0 ? std::ceil(root) : std::floor(root) + 1);
            }
        }
        if (crossing <= available)
        {
            auto n = static_cast<std::uint64_t>(crossing);
            const auto outside = [&](std::uint64_t tick)
            {
                const double value = positionAt(tick * TickNs);
                return rate < 0 ? value <= 400 : value > 700;
            };
            if (n > 1 && outside(n - 1)) --n;
            if (!outside(n)) ++n;
            const auto used = n * TickNs;
            if (used <= remaining)
            {
                // The first point beyond 400 keeps the speed from the last
                // curve update, not Speed(400) or Speed(the new position).
                speed = Speed(positionAt((n - 1) * TickNs));
                x = positionAt(used);
                remaining -= used;
                if (!remaining) return {x, speed};
                continue;
            }
        }
        const auto previous = remaining > TickNs ? remaining - TickNs : 0;
        return {positionAt(remaining), Speed(positionAt(previous))};
    }
    throw std::logic_error("zamboni motion exceeded its monotone curve segments");
}
} // namespace ZamboniMotion
