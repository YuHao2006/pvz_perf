#include "MagnetMotion.h"

namespace MagnetMotion
{
float SizeAt(std::uint64_t ageNs)
{
    constexpr std::uint64_t durationNs = 15'000'000'000;
    if (ageNs >= durationNs) return 0;
    return 1.0f - static_cast<float>(ageNs) / static_cast<float>(durationNs);
}
}
