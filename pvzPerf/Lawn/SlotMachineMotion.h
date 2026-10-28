#pragma once
#include <cstdint>

namespace SlotMachineMotion
{
// Initial 1073 slowdown duration; the caller extends expiry until a whole turn.
inline constexpr std::int64_t DurationNs = 4'000'000'000;
float Speed(std::int64_t remainingNs);
}
