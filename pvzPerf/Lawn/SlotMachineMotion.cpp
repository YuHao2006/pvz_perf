#include "SlotMachineMotion.h"
#include <algorithm>

namespace SlotMachineMotion
{
float Speed(std::int64_t remainingNs)
{
    // Convert the current nanosecond interval to the original authored unit
    // before the float arithmetic, preserving its exact 100Hz evaluation order.
    const float authoredRemaining = static_cast<float>(static_cast<double>(
        std::clamp(remainingNs, std::int64_t{0}, DurationNs)) / 10'000'000.0);
    const float age = (authoredRemaining - 400.0f) / -400.0f;
    return 6.0f + (2.0f - 6.0f) * age;
}
}
