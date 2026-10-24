#pragma once
#include <array>
#include <cstddef>
#include <cstdint>
#include <limits>

// Base is the multiplier per 10ms. All samples and long-range powers are
// constant-initialized. Runtime evaluation has no pow/exp, allocation or state.
template<double Base>
inline double TodExponentialCurve(std::uint64_t elapsedNs)
{
    static_assert(Base > 0.0 && Base <= std::numeric_limits<double>::max(),
        "An exponential curve needs a finite positive base");
    if constexpr (Base == 1.0)
        return 1.0;
    constexpr std::uint64_t sampleNs = 10'000'000;
    constexpr std::size_t blockSize = 256;
    constexpr auto multiply = [](double a, double b) {
        // constexpr overflow is not allowed. Represent the mathematically
        // unrepresentable growing samples explicitly as infinity instead.
        if constexpr (Base > 1.0)
            if (a > std::numeric_limits<double>::max() / b)
                return std::numeric_limits<double>::infinity();
        return a * b;
    };
    static constexpr auto samples = [=]() consteval {
        std::array<double, blockSize + 1> result{};
        result[0] = 1.0;
        for (std::size_t i = 1; i < result.size(); ++i)
            result[i] = multiply(result[i - 1], Base);
        return result;
    }();
    static constexpr auto blocks = [=]() consteval {
        std::array<double, 64> result{};
        result[0] = samples[blockSize];
        for (std::size_t i = 1; i < result.size(); ++i)
            result[i] = multiply(result[i - 1], result[i - 1]);
        return result;
    }();

    const auto index = elapsedNs / sampleNs;
    const auto remainderNs = elapsedNs % sampleNs;
    const auto local = static_cast<std::size_t>(index % blockSize);
    double value;
    if constexpr (Base > 1.0)
    {
        // Avoid infinity-infinity in the interpolant after growing curves
        // exceed double range, including exact sample boundaries.
        if (remainderNs == 0)
            value = samples[local];
        else if (samples[local + 1] == std::numeric_limits<double>::infinity())
            value = std::numeric_limits<double>::infinity();
        else
            value = samples[local] + (samples[local + 1] - samples[local]) *
                (static_cast<double>(remainderNs) / sampleNs);
    }
    else
        value = samples[local] + (samples[local + 1] - samples[local]) *
            (static_cast<double>(remainderNs) / sampleNs);

    auto block = index / blockSize;
    for (std::size_t bit = 0; block; ++bit, block >>= 1)
        if (block & 1)
            value *= blocks[bit];
    return value;
}
