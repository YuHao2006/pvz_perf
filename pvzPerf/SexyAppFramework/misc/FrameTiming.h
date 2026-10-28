#pragma once

#include <chrono>
#include <cmath>
#include <stdexcept>

namespace Sexy
{
struct FrameTiming
{
    static constexpr unsigned int DefaultTargetFps = 100;
    static constexpr unsigned long long NanosecondsPerSecond = 1'000'000'000ULL;
    static constexpr unsigned long long LegacyTickNs = 10'000'000ULL;

    unsigned int mTargetFps = DefaultTargetFps;
    unsigned long long mIntervalNs = LegacyTickNs;

    static constexpr FrameTiming FromTargetFps(unsigned int targetFps)
    {
        if (targetFps == 0 || targetFps > NanosecondsPerSecond)
            throw std::invalid_argument("targetFps must produce an interval of at least one nanosecond");
        return {targetFps, NanosecondsPerSecond / targetFps};
    }

    static FrameTiming FromSetting(double targetFps)
    {
        if (!std::isfinite(targetFps) || targetFps < 1 ||
            targetFps > NanosecondsPerSecond || std::floor(targetFps) != targetFps)
            return {};
        return FromTargetFps(static_cast<unsigned int>(targetFps));
    }
};

// A simulation update consumes its actual elapsed interval, capped at 10ms.
struct UpdateStep
{
    unsigned long long mNanoseconds = FrameTiming::LegacyTickNs;
    double mSeconds = 0.01;
    double mLegacyTicks = 1.0;

    static constexpr UpdateStep FromNanoseconds(unsigned long long nanoseconds)
    {
        return {
            nanoseconds,
            static_cast<double>(nanoseconds) / FrameTiming::NanosecondsPerSecond,
            static_cast<double>(nanoseconds) / FrameTiming::LegacyTickNs
        };
    }

    constexpr bool operator==(const UpdateStep&) const = default;
};

unsigned long long SimulationTimeFromWallTime(unsigned long long elapsedNs, double multiplier);
unsigned long long TakeSimulationStep(unsigned long long& pendingNs,
    unsigned long long requestedNs, unsigned long long& phaseNs);
unsigned long long FrameWaitNs(unsigned long long elapsedNs,
    unsigned long long intervalNs, unsigned long long phaseNs);
void ApplySimulationStep(unsigned long long intervalNs);

// Keep the deadline anchored to the previous deadline, including after overruns.
struct FrameDeadline
{
    using Clock = std::chrono::steady_clock;
    using TimePoint = std::chrono::time_point<Clock, std::chrono::nanoseconds>;

    TimePoint mNext{};

    void Reset(TimePoint now, const FrameTiming& timing)
    {
        mNext = now + std::chrono::nanoseconds(timing.mIntervalNs);
    }

    void Advance(const FrameTiming& timing)
    {
        mNext += std::chrono::nanoseconds(timing.mIntervalNs);
    }
};

// Endpoints are exclusive at the old value and inclusive at the new value.
// This allows a coarse update to visit every event it crosses exactly once.
constexpr bool CrossedTime(double previous, double current, double event)
{
    return current >= previous
        ? previous < event && event <= current
        : current <= event && event < previous;
}
}
