#pragma once
#include "Sexy.TodLib/Reanimator.h"
#include <cmath>
#include <cstdint>
#include <limits>
#include <stdexcept>

struct TimedLinearMotion
{
    double origin = 0;
    std::uint64_t elapsedNs = 0;
    float rate = 0;
    float lastOutput = 0;
    bool bound = false;
};

inline float CheckedPosition(double value)
{
    if (!std::isfinite(value) || std::fabs(value) > std::numeric_limits<float>::max())
        throw std::overflow_error("actor position exceeds float range");
    return static_cast<float>(value);
}

// Rebase when an input changes; constant velocity is sampled from total integer
// elapsed time, without feeding a rounded float position back into integration.
inline void AdvanceVelocity(float& position, float rate, std::uint64_t deltaNs,
    TimedLinearMotion& motion)
{
    if (!std::isfinite(position) || !std::isfinite(rate))
        throw std::overflow_error("nonfinite actor movement input");
    if (!motion.bound || motion.lastOutput != position)
    {
        motion.origin = position;
        motion.elapsedNs = 0;
        motion.rate = rate;
        motion.bound = true;
    }
    else if (motion.rate != rate)
    {
        const double previous = motion.origin +
            double(motion.rate) * double(motion.elapsedNs) / 10'000'000.0;
        // Rate changes retain the old linear segment's unrounded endpoint.
        // Some callers also store nonlinear models in this struct: preserve
        // their existing float rebase when the linear sample does not match.
        // This check protects those handoffs; it does not identify every model.
        motion.origin = std::isfinite(previous) &&
            std::fabs(previous) <= std::numeric_limits<float>::max() &&
            static_cast<float>(previous) == position ? previous : double(position);
        motion.elapsedNs = 0;
        motion.rate = rate;
    }
    if (deltaNs > UINT64_MAX - motion.elapsedNs)
        throw std::overflow_error("actor movement interval exceeds clock range");
    motion.elapsedNs += deltaNs;
    position = CheckedPosition(motion.origin +
        static_cast<double>(motion.rate) * static_cast<double>(motion.elapsedNs) / 10'000'000.0);
    motion.lastOutput = position;
}

template<class Actor>
inline void AdvanceRoot(Actor& actor, const Reanimation& animation,
    float signedScale, std::int64_t offsetNs)
{
    const auto root = animation.RootMotion(ReanimTrackId::_ground, signedScale, offsetNs);
    if (!actor.mRootBindingGeneration ||
        actor.mRootBindingGeneration != animation.mPlaybackGeneration ||
        actor.mRootScale != signedScale)
    {
        actor.mRootOriginX = actor.mX - (offsetNs == 0 ? root :
            animation.RootMotion(ReanimTrackId::_ground, signedScale));
        actor.mRootBindingGeneration = animation.mPlaybackGeneration;
        actor.mRootScale = signedScale;
    }
    actor.mX = CheckedPosition(actor.mRootOriginX + root);
}
