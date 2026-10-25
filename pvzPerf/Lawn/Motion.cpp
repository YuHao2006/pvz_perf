#include "Motion.h"

#include <cmath>
#include <limits>
#include <stdexcept>

float CheckedPosition(double value)
{
    if (!std::isfinite(value) || std::fabs(value) > std::numeric_limits<float>::max())
        throw std::overflow_error("actor position exceeds float range");
    return static_cast<float>(value);
}

void AdvanceVelocity(float& position, float rate, std::uint64_t deltaNs,
    TimedLinearMotion& motion)
{
    if (!std::isfinite(position) || !std::isfinite(rate))
        throw std::overflow_error("nonfinite actor movement input");
    if (!motion.bound || motion.rate != rate)
    {
        motion.origin = position;
        motion.elapsedNs = 0;
        motion.rate = rate;
        motion.bound = true;
    }
    if (deltaNs > UINT64_MAX - motion.elapsedNs)
        throw std::overflow_error("actor movement interval exceeds clock range");
    motion.elapsedNs += deltaNs;
    position = CheckedPosition(motion.origin +
        static_cast<double>(motion.rate) * static_cast<double>(motion.elapsedNs) / 10'000'000.0);
}
