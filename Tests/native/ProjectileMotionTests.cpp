#include "Lawn/ProjectileMotion.h"
#include <bit>
#include <iostream>
#include <random>
#include <stdexcept>

namespace
{
void Require(bool value, const char* message)
{
    if (!value) throw std::runtime_error(message);
}
void Near(double actual, double expected, double tolerance, const char* message)
{
    Require(std::abs(actual - expected) <= tolerance, message);
}
}

int main()
{
    try
    {
        using namespace ProjectileMotionMath;
        // Independent recurrence checks distinguish semi-implicit integration
        // from the usual continuous t*t/2 ballistic formula.
        for (double acceleration : {double(0.115f), 2.0 * 0.115f, -0.03125})
        {
            double position = 0, velocity = -7.318291f;
            for (int step = 0; step < 180; ++step)
            {
                Near(LobOffset(-7.318291f, acceleration, step), position, 1e-9,
                    "lob formula differs from old 100Hz velocity-before-position recurrence");
                Near(LobVelocity(-7.318291f, acceleration, step), velocity, 1e-11,
                    "lob derivative does not expose the current legacy velocity");
                velocity += acceleration;
                position += velocity;
            }
        }
        for (double initial : {-3.0, 3.0})
        {
            double y = 0, shadow = 0, velocity = initial;
            for (int step = 0; step < 300; ++step)
            {
                Near(DampedOffset(initial, 0.97f, step), y, 1e-10,
                    "threepeater formula differs from the discrete geometric sum");
                Near(0.97f * DampedOffset(initial, 0.97f, step), shadow, 1e-10,
                    "threepeater shadow lost its velocity-after-decay ordering");
                y += velocity;
                velocity *= 0.97f;
                shadow += velocity;
            }
        }
        for (bool highGravity : {false, true})
          for (double initial : {-0.5001, -0.001, 0.2})
        {
            double y = 0, velocity = initial;
            for (int step = 0; step < 400; ++step)
            {
                const auto sample = FloatSample(initial, step, highGravity);
                Near(sample.offset, y, 1e-8, "float-over clipped trajectory changed at a 100Hz knot");
                Near(sample.velocity, velocity, 1e-10, "float-over clipped velocity changed");
                if (velocity < 0) { velocity = std::min(velocity + 0.002, 0.0); y += velocity; }
                if (highGravity) { velocity += 0.004; y += velocity; }
            }
        }
        constexpr std::int64_t duration = 1'234'567'891;
        const auto expectedLob = LobOffset(-7.318291f, 0.115f, Ticks(duration, 0));
        const auto expectedDamped = DampedOffset(-3.0f, 0.97f, Ticks(duration, 0));
        for (int frequency : {30, 60, 100, 144, 200, 240, 1000, 0})
        {
            std::mt19937_64 random(71391);
            double lastLob = 0, lastDamped = 0;
            for (std::int64_t elapsed = 0, n = 1; elapsed < duration; ++n)
            {
                const auto end = frequency ? std::min(duration, n * 1'000'000'000 / frequency) :
                    std::min(duration, elapsed + std::int64_t(random() % 71'000'003 + 1));
                lastLob = LobOffset(-7.318291f, 0.115f, Ticks(end, 0));
                lastDamped = DampedOffset(-3.0f, 0.97f, Ticks(end, 0));
                elapsed = end;
            }
            Require(std::bit_cast<std::uint64_t>(lastLob) == std::bit_cast<std::uint64_t>(expectedLob) &&
                std::bit_cast<std::uint64_t>(lastDamped) == std::bit_cast<std::uint64_t>(expectedDamped),
                "analytic projectile sampling depends on update partition");
        }
        const auto whole = HomingVelocity(2, 0, 100, 80, 20, 2);
        auto split = HomingVelocity(2, 0, 100, 80, 19, 1);
        split = HomingVelocity(split.x, split.y, 100, 80, 20, 1);
        Near(std::hypot(whole.x, whole.y), 2.0, 1e-6, "homing lost its normalized speed");
        Require(whole.x != split.x || whole.y != split.y,
            "homing incorrectly replaced per-update steering with a birth-only trajectory");
        Require(Ticks(150, -100) == 250.0 / TickNs,
            "negative migrated creation timestamp lost elapsed time");
        std::cout << "PASS projectile motion: old 100Hz recurrences, 8 analytic partitions, "
            "clipped float-over and explicitly step-dependent homing\n";
        return 0;
    }
    catch (const std::exception& error)
    {
        std::cerr << "FAIL projectile motion: " << error.what() << '\n';
        return 1;
    }
}
