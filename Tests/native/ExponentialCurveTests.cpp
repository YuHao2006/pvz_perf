#include "Sexy.TodLib/ExponentialCurve.h"
#include <algorithm>
#include <cmath>
#include <cstdio>
#include <stdexcept>

static void Require(bool condition, const char* message)
{
    if (!condition) throw std::runtime_error(message);
}

template<double Base>
static void CheckDecay()
{
    Require(TodExponentialCurve<Base>(0) == 1, "Exponential curve does not start at one");
    double previous = 1;
    for (std::uint64_t n = 0; n < 2048; ++n)
    {
        const auto ns = n * 10'000'000;
        const auto left = TodExponentialCurve<Base>(ns);
        const auto right = TodExponentialCurve<Base>(ns + 10'000'000);
        const auto reference = std::pow(Base, static_cast<double>(n));
        Require(std::abs(left - reference) <= reference * 1e-12,
            "10ms sample differs from exponential reference");
        for (const auto fraction : {1ULL, 1'000'000ULL, 5'000'000ULL, 9'999'999ULL})
        {
            const auto value = TodExponentialCurve<Base>(ns + fraction);
            const auto expected = left + (right - left) * (double(fraction) / 10'000'000);
            Require(std::abs(value - expected) <= left * 1e-13,
                "Sub-10ms value is not linear interpolation of its adjacent samples");
            Require(value <= previous && value >= 0, "Decay is not monotonic");
            previous = value;
        }
    }
    Require(TodExponentialCurve<Base>(UINT64_MAX) == 0,
        "Long decay was clamped at the end of the small table");
}

int main()
{
    try
    {
        CheckDecay<20.0 / 21.0>();
        CheckDecay<0.95>();
        CheckDecay<0.98>();
        Require(TodExponentialCurve<1.0>(UINT64_MAX) == 1, "Unit base changed");
        Require(TodExponentialCurve<2.0>(15'000'000) == 3,
            "Growing curve did not interpolate its two exponential samples");
        Require(std::isinf(TodExponentialCurve<2.0>(10'245'000'000)),
            "Growing curve overflow did not produce infinity");
        Require(std::isinf(TodExponentialCurve<2.0>(UINT64_MAX)),
            "Long growing curve produced NaN or wrapped");
        // Typical pickups use <1s; the maximum midpoint relative interpolation
        // error for this base is about 0.03%, not exact fractional exponentiation.
        const double midpoint = TodExponentialCurve<20.0 / 21.0>(5'000'000);
        Require(std::abs(midpoint / std::sqrt(20.0 / 21.0) - 1) < 0.0003,
            "Pickup interpolation error exceeds its documented bound");
        std::puts("PASS exponential 10ms samples, linear interpolation, block boundaries and extreme time");
        return 0;
    }
    catch (const std::exception& error)
    {
        std::fprintf(stderr, "%s\n", error.what());
        return 1;
    }
}
