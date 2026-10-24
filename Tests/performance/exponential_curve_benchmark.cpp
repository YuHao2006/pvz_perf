#include "Sexy.TodLib/ExponentialCurve.h"
#define NOMINMAX
#include <windows.h>
#include <algorithm>
#include <array>
#include <chrono>
#include <cmath>
#include <cstdio>

__declspec(noinline) static double Sampled(std::uint64_t ns)
{
    return TodExponentialCurve<20.0 / 21.0>(ns);
}

__declspec(noinline) static double Powered(std::uint64_t ns)
{
    return std::pow(20.0 / 21.0, static_cast<double>(ns) / 10'000'000);
}

template<double (*Evaluate)(std::uint64_t)>
static double Measure(const std::array<std::uint64_t, 8192>& inputs, double& checksum)
{
    const auto start = std::chrono::steady_clock::now();
    for (unsigned n = 0; n < 2'000'000; ++n)
        checksum += Evaluate(inputs[n % inputs.size()]);
    return std::chrono::duration<double, std::nano>(
        std::chrono::steady_clock::now() - start).count() / 2'000'000;
}

int main()
{
    DWORD_PTR allowed = 0, system = 0;
    if (!GetProcessAffinityMask(GetCurrentProcess(), &allowed, &system) || !allowed ||
        !SetThreadAffinityMask(GetCurrentThread(), allowed & (~allowed + 1)))
        return 2;
    std::array<std::uint64_t, 8192> inputs{};
    std::uint64_t seed = 0x60191981;
    double error = 0, checksum = 0;
    for (auto& ns : inputs)
    {
        seed ^= seed << 13;
        seed ^= seed >> 7;
        seed ^= seed << 17;
        ns = seed % 1'200'000'001;
        error = std::max(error, std::abs(Sampled(ns) / Powered(ns) - 1));
    }
    if (error > 0.0003) return 1;
    std::array<double, 5> sampled{}, powered{};
    for (unsigned run = 0; run < 5; ++run)
    {
        if (run & 1)
        {
            powered[run] = Measure<Powered>(inputs, checksum);
            sampled[run] = Measure<Sampled>(inputs, checksum);
        }
        else
        {
            sampled[run] = Measure<Sampled>(inputs, checksum);
            powered[run] = Measure<Powered>(inputs, checksum);
        }
    }
    std::sort(sampled.begin(), sampled.end());
    std::sort(powered.begin(), powered.end());
    std::printf("median ns/eval: 10ms table %.3f, pow %.3f; max relative error %.9g; checksum %.9f\n",
        sampled[2], powered[2], error, checksum);
}
