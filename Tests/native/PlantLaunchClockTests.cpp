#include "../../pvzPerf/Lawn/PlantLaunchClock.h"
#include <array>
#include <cassert>
#include <cstdio>

int main()
{
    // Width four divides 2^64: both closed endpoints are directly observable.
    auto zero = [] { return std::uint32_t(0); };
    auto ones = [] { return std::uint32_t(0x7fffffff); };
    assert(PlantLaunchClock::Uniform(100, 103, zero) == 100);
    assert(PlantLaunchClock::Uniform(100, 103, ones) == 103);
    // Width three rejects word zero. The following word one selects low+1.
    const std::array<std::uint32_t, 6> words{0, 0, 0, 0, 0, 1};
    std::size_t index = 0;
    assert(PlantLaunchClock::Uniform(10, 12, [&] { return words.at(index++); }) == 11);
    assert(index == 6);
    assert(!PlantLaunchClock::Crossed(100, 110, 100));
    assert(PlantLaunchClock::Crossed(100, 110, 110));
    assert(PlantLaunchClock::Add(100, 23) == 123);
    bool overflow = false;
    try { (void)PlantLaunchClock::Add(INT64_MAX, 1); }
    catch (const std::overflow_error&) { overflow = true; }
    assert(overflow);
    std::puts("plant launch uniform closed endpoints, rejection, crossing and overflow passed");
}
