#pragma once
#include "Sexy.TodLib/Reanimator.h"
#include <cstdint>

struct TimedLinearMotion
{
    double origin = 0;
    std::int64_t startTimeNs = 0; // Absolute beginning of the current constant-rate segment.
    float rate = 0;
    bool bound = false;
};

float CheckedPosition(double value);

// Rebase when an input changes; constant velocity is sampled from total integer
// elapsed time, without feeding a rounded float position back into integration.
void AdvanceVelocity(float& position, float rate, std::uint64_t deltaNs, std::int64_t nowNs,
    TimedLinearMotion& motion);

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
