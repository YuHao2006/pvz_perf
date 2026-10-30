#include "FrameTiming.h"
#include "TimeCounter.h"
#include <limits>

namespace Sexy
{
FrameTiming FrameTiming::FromSetting(double targetFps)
{
    if (!std::isfinite(targetFps) || targetFps <= 0 ||
        targetFps > NanosecondsPerSecond || std::floor(targetFps) != targetFps)
        return {};
    return FromTargetFps(static_cast<unsigned int>(targetFps));
}

FrameTiming FrameTiming::FromDisplayRefreshRate(double refreshRate)
{
    if (!std::isfinite(refreshRate) || refreshRate <= 0 || refreshRate > NanosecondsPerSecond)
        return {};
    return FromTargetFps(static_cast<unsigned int>(std::max<double>(MinimumTargetFps,std::round(refreshRate))));
}

unsigned long long SimulationTimeFromWallTime(unsigned long long elapsedNs, double multiplier)
{
    if (!(multiplier > 0) || !std::isfinite(multiplier))
        throw std::invalid_argument("simulation multiplier must be finite and positive");
    const long double scaled = std::round(static_cast<long double>(elapsedNs) * multiplier);
    if (scaled > std::numeric_limits<unsigned long long>::max())
        throw std::overflow_error("simulation time exceeds nanosecond range");
    return static_cast<unsigned long long>(scaled);
}

unsigned long long TakeSimulationStep(unsigned long long& pendingNs,
    unsigned long long requestedNs, unsigned long long& phaseNs)
{
    if (requestedNs == 0)
        throw std::invalid_argument("simulation target interval must be positive");
    const auto quantumNs = requestedNs;
    phaseNs %= quantumNs;
    if (pendingNs < quantumNs - phaseNs) return 0;
    const auto stepNs = pendingNs;
    pendingNs = 0;
    phaseNs = (phaseNs + stepNs % quantumNs) % quantumNs;
    return stepNs;
}

unsigned long long FrameWaitNs(unsigned long long elapsedNs,
    unsigned long long intervalNs, unsigned long long phaseNs)
{
    if (intervalNs == 0) throw std::invalid_argument("frame interval must be positive");
    const auto remainingNs = intervalNs - phaseNs % intervalNs;
    return elapsedNs >= remainingNs ? 0 : remainingNs - elapsedNs;
}

void ApplySimulationStep(unsigned long long intervalNs)
{
    gUpdateIntervalNs = intervalNs;
    gUpdateTicks = static_cast<double>(intervalNs) / FrameTiming::LegacyTickNs;
    gStepsPerLegacyTick = intervalNs ? 1.0 / gUpdateTicks : 0;
}
}
