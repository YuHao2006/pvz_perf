#include "Motion.h"
#include "Sexy.TodLib/ReanimClock.h"

#include <cmath>
#include <limits>
#include <stdexcept>

float CheckedPosition(double value)
{
    if (!std::isfinite(value) || std::fabs(value) > std::numeric_limits<float>::max())
        throw std::overflow_error("actor position exceeds float range");
    return static_cast<float>(value);
}

void AdvanceVelocity(float& position, float rate, std::uint64_t deltaNs, std::int64_t nowNs,
    TimedLinearMotion& motion)
{
    if (deltaNs > INT64_MAX)
        throw std::overflow_error("actor movement interval exceeds clock range");
    if (!std::isfinite(position) || !std::isfinite(rate))
        throw std::overflow_error("nonfinite actor movement input");
    if (!motion.bound || motion.rate != rate)
    {
        motion.origin = position;
        motion.startTimeNs = ReanimClock::Subtract(nowNs, static_cast<std::int64_t>(deltaNs));
        motion.rate = rate;
        motion.bound = true;
    }
    const auto elapsedNs = ReanimClock::Subtract(nowNs, motion.startTimeNs);
    position = CheckedPosition(motion.origin +
        static_cast<double>(motion.rate) * static_cast<double>(elapsedNs) / 10'000'000.0);
}
