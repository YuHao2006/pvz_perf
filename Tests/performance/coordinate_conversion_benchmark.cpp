// Standalone /O2 benchmark; includes game headers only to measure actor strides.
// No game initialization, rendering, or changes to the user's saved games.
#include "Lawn/Plant.h"
#include "Lawn/Zombie.h"
#include "Lawn/LawnMower.h"
#include <windows.h>
#include <algorithm>
#include <array>
#include <chrono>
#include <cmath>
#include <cstddef>
#include <cstdio>
#include <cstdlib>
#include <cstdint>
#include <cstring>
#include <vector>

enum class Strategy { AtUse, Local, Persistent };

template<std::size_t Bytes, bool Cached>
struct Actor
{
    float x, y;
    // Model the actual actor stride without constructing a live game actor.
    std::array<std::byte, Bytes - 2 * sizeof(float)> other{};
};

template<std::size_t Bytes>
struct Actor<Bytes, true>
{
    float x, y;
    // Put the cache next to the source, as it would be in GameObject; placing
    // it at the tail would unfairly add a second distant cache-line read.
    int pixelX, pixelY;
    std::array<std::byte, Bytes - 2 * sizeof(float)> other{};
};

static std::uint64_t Consume(int x, int y, unsigned consumer)
{
    return static_cast<std::uint64_t>((x + 13 * consumer) * 31 + y);
}

__declspec(noinline) static std::uint64_t ConsumePixels(int x, int y, unsigned consumer)
{
    return Consume(x, y, consumer);
}

template<class T>
__declspec(noinline) std::uint64_t ConsumePosition(const T& actor, unsigned consumer)
{
    return Consume(static_cast<int>(actor.x), static_cast<int>(actor.y), consumer);
}

template<class T>
__declspec(noinline) std::uint64_t ConsumeCached(const T& actor, unsigned consumer)
{
    return Consume(actor.pixelX, actor.pixelY, consumer);
}

struct Result { double ns; std::uint64_t checksum; };

template<std::size_t Bytes, Strategy Mode, bool SeparateCalls>
Result Run(std::size_t count, unsigned consumers, unsigned movingPercent)
{
    using T = Actor<Bytes, Mode == Strategy::Persistent>;
    std::vector<T> actors(count);
    for (std::size_t i = 0; i < count; ++i)
    {
        actors[i].x = 20.125f + static_cast<float>(i % 700);
        actors[i].y = 20.875f + static_cast<float>(i % 500);
        if constexpr (Mode == Strategy::Persistent)
        {
            actors[i].pixelX = static_cast<int>(actors[i].x);
            actors[i].pixelY = static_cast<int>(actors[i].y);
        }
    }
    const unsigned frames = static_cast<unsigned>(
        std::max<std::size_t>(32, 16'000'000 / (count * (consumers + 1))));
    std::uint64_t checksum = 0;
    const auto start = std::chrono::steady_clock::now();
    for (unsigned frame = 0; frame < frames; ++frame)
    {
        // Sample positions from an integer clock; include cache synchronization
        // whenever a coordinate changes, not just the integer read side.
        for (std::size_t i = 0; i < count; ++i)
            if (i % 100 < movingPercent)
            {
                auto& actor = actors[i];
                actor.x = 20.125f + static_cast<float>((i + frame) % 700);
                actor.y = 20.875f + static_cast<float>((i + frame) % 500);
                if constexpr (Mode == Strategy::Persistent)
                {
                    actor.pixelX = static_cast<int>(actor.x);
                    actor.pixelY = static_cast<int>(actor.y);
                }
            }
        for (const auto& actor : actors)
        {
            int x = 0, y = 0;
            if constexpr (Mode == Strategy::Local)
            {
                x = static_cast<int>(actor.x);
                y = static_cast<int>(actor.y);
            }
            for (unsigned use = 0; use < consumers; ++use)
            {
                if constexpr (SeparateCalls)
                {
                    if constexpr (Mode == Strategy::AtUse)
                        checksum += ConsumePosition(actor, use);
                    else if constexpr (Mode == Strategy::Local)
                        checksum += ConsumePixels(x, y, use);
                    else
                        checksum += ConsumeCached(actor, use);
                }
                else
                {
                    if constexpr (Mode == Strategy::AtUse)
                        checksum += Consume(static_cast<int>(actor.x), static_cast<int>(actor.y), use);
                    else if constexpr (Mode == Strategy::Local)
                        checksum += Consume(x, y, use);
                    else
                        checksum += Consume(actor.pixelX, actor.pixelY, use);
                }
            }
            // A float consumer (e.g. animation placement) still needs the original.
            checksum += static_cast<std::uint64_t>(actor.x * 2.0f + actor.y);
        }
    }
    const auto end = std::chrono::steady_clock::now();
    return {std::chrono::duration<double, std::nano>(end - start).count() /
        (static_cast<double>(frames) * count), checksum};
}

template<std::size_t Bytes, bool SeparateCalls>
void Measure(const char* name)
{
    for (const auto count : {std::size_t{256}, std::size_t{32768}})
        for (const auto consumers : {1u, 8u})
            for (const auto moving : {25u, 100u})
            {
                std::array<std::array<double, 5>, 3> samples{};
                for (unsigned round = 0; round < 5; ++round)
                {
                    std::array<Result, 3> result{};
                    // Rotate measurement order to reduce frequency/order bias.
                    for (unsigned k = 0; k < 3; ++k)
                        switch ((round + k) % 3)
                        {
                        case 0: result[0] = Run<Bytes, Strategy::AtUse, SeparateCalls>(count, consumers, moving); break;
                        case 1: result[1] = Run<Bytes, Strategy::Local, SeparateCalls>(count, consumers, moving); break;
                        case 2: result[2] = Run<Bytes, Strategy::Persistent, SeparateCalls>(count, consumers, moving); break;
                        }
                    if (result[0].checksum != result[1].checksum ||
                        result[0].checksum != result[2].checksum)
                        std::abort();
                    for (unsigned k = 0; k < 3; ++k)
                        samples[k][round] = result[k].ns;
                }
                for (auto& sample : samples) std::sort(sample.begin(), sample.end());
                std::printf("%s,%zu,%zu,%zu,%s,%u,%u,%.3f,%.3f,%.3f\n",
                    name, Bytes, sizeof(Actor<Bytes, true>), count,
                    SeparateCalls ? "calls" : "inline", consumers, moving,
                    samples[0][2], samples[1][2], samples[2][2]);
            }
}

static void DriftSamples()
{
    std::puts("hz,linear_after_2s,linear_from_integer_time,linear_difference,"
        "attraction_after_1s,attraction_100hz_reference");
    for (const unsigned hz : {100u, 200u, 1000u})
    {
        Sexy::gUpdateTicks = 100.0 / hz;
        float linear = 20.0f, attraction = 500.0f;
        for (unsigned step = 0; step < 2 * hz; ++step)
            linear += Sexy::UpdateDelta(3.33f);
        for (unsigned step = 0; step < hz; ++step)
            attraction -= Sexy::UpdateDelta(attraction / 21.0f);
        const auto sampled = static_cast<float>(20.0 +
            static_cast<double>(3.33f) * 2'000'000'000 / 10'000'000.0);
        // Fixed target, original 100 Hz recurrence extended to continuous time.
        const double reference = 500.0 * std::pow(20.0 / 21.0, 100.0);
        std::printf("%u,%.9f,%.9f,%.9f,%.9f,%.9f\n",
            hz, linear, sampled, linear - sampled, attraction, reference);
    }
}

int main(int argc, char** argv)
{
    DWORD_PTR allowed = 0, system = 0;
    if (!GetProcessAffinityMask(GetCurrentProcess(), &allowed, &system) || !allowed ||
        !SetThreadAffinityMask(GetCurrentThread(), allowed & (~allowed + 1)))
        return 2;
    if (argc == 2 && std::strcmp(argv[1], "--drift") == 0)
    {
        DriftSamples();
        return 0;
    }
    if (argc == 2 && std::strcmp(argv[1], "--layout") == 0)
    {
        std::printf("GameObject=%zu Plant=%zu Zombie=%zu TimedLinearMotion=%zu TimeCounter=%zu\n",
            sizeof(GameObject), sizeof(Plant), sizeof(Zombie),
            sizeof(TimedLinearMotion), sizeof(Sexy::TimeCounter));
        std::printf("Plant launch flag span=%zu Zombie pending tail=%zu LawnMower unused timer=%zu\n",
            offsetof(Plant, mLaunchRate) - offsetof(Plant, mLaunchClockActive),
            sizeof(Zombie) - offsetof(Zombie, mPendingAdditionalSpeedX),
            sizeof(LawnMower::mAnimTicksPerFrame));
        return 0;
    }
    std::printf("actor,bytes,cached_bytes,count,boundary,integer_uses,moving_percent,"
        "at_use_ns,local_ns,persistent_ns\n");
    Measure<sizeof(Plant), false>("Plant");
    Measure<sizeof(Plant), true>("Plant");
    Measure<sizeof(Zombie), false>("Zombie");
    Measure<sizeof(Zombie), true>("Zombie");
}
