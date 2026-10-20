#include "misc/FrameTiming.h"
#include "misc/TimeCounter.h"
#include <cstring>
#include <cstdlib>
#include <iostream>
#include <limits>
#include <stdexcept>

namespace
{
void Require(bool value, const char* message)
{
    if (!value)
        throw std::runtime_error(message);
}
}

int main()
{
    using namespace Sexy;
    try
    {
        constexpr auto stock = FrameTiming::FromTargetFps(100);
        constexpr auto high = FrameTiming::FromTargetFps(240);
        static_assert(stock.mIntervalNs == 10'000'000ULL);
        static_assert(high.mIntervalNs == 4'166'666ULL);
        static_assert(FrameTiming::FromTargetFps(60).mIntervalNs == 16'666'666ULL);
        static_assert(FrameTiming::FromTargetFps(250).mIntervalNs == 4'000'000ULL);
        static_assert(FrameTiming::FromTargetFps(1).mIntervalNs == 1'000'000'000ULL);
        static_assert(FrameTiming::FromTargetFps(1'000'000'000).mIntervalNs == 1);

        for (double invalid : {0.0, -1.0, 239.5, 1'000'000'001.0,
                 std::numeric_limits<double>::infinity(),
                 std::numeric_limits<double>::quiet_NaN()})
            Require(FrameTiming::FromSetting(invalid).mTargetFps == 100,
                "Invalid setting did not fall back to 100 Hz");
        Require(FrameTiming::FromSetting(240).mIntervalNs == high.mIntervalNs,
            "Integer setting was not accepted");
        bool rejected = false;
        try { (void)FrameTiming::FromTargetFps(0); }
        catch (const std::invalid_argument&) { rejected = true; }
        Require(rejected, "Zero interval divisor was accepted");

        constexpr auto step = UpdateStep::FromNanoseconds(high.mIntervalNs);
        static_assert(step.mNanoseconds == 4'166'666ULL);
        static_assert(UpdateStep::FromNanoseconds(stock.mIntervalNs) == UpdateStep{});
        Require(step.mSeconds > 0.004166665 && step.mSeconds < 0.004166667,
            "Simulation step has the wrong time unit");
        Require(step.mLegacyTicks > 0.4166665 && step.mLegacyTicks < 0.4166667,
            "Legacy tick conversion is incorrect");

        FrameDeadline deadline;
        const FrameDeadline::TimePoint origin{std::chrono::nanoseconds(123456789)};
        deadline.Reset(origin, high);
        for (unsigned int frame = 1; frame < 864'000; ++frame)
            deadline.Advance(high);
        const auto elapsed = (deadline.mNext - origin).count();
        Require(elapsed == 864'000LL * 4'166'666LL,
            "Absolute deadline accumulated wake-up drift");
        Require(3'600'000'000'000LL - elapsed == 576'000,
            "One-hour 240 Hz truncation error changed");
        deadline.Reset(origin, stock);
        const auto lateNow = origin + std::chrono::milliseconds(35);
        while (deadline.mNext <= lateNow)
            deadline.Advance(stock);
        Require(deadline.mNext == origin + std::chrono::milliseconds(40),
            "Overrun was rescheduled from wake-up time");

        static_assert(CrossedTime(26, 24, 25));
        static_assert(!CrossedTime(25, 24, 25));
        static_assert(CrossedTime(26, 25, 25));
        static_assert(!CrossedTime(26, 26, 25));
        static_assert(CrossedTime(0, 3, 1));
        static_assert(CrossedTime(0, 3, 2));
        static_assert(CrossedTime(0, 3, 3));
        static_assert(!CrossedTime(3, 4, 3));
        static_assert(CrossedTime(0.9, 1.1, 1));

        for (unsigned int fps : {60u, 100u, 144u, 240u, 250u, 1000u})
        {
            const auto timing = FrameTiming::FromTargetFps(fps);
            gUpdateTicks = static_cast<double>(timing.mIntervalNs) / FrameTiming::LegacyTickNs;
            gStepsPerLegacyTick = 1.0 / gUpdateTicks;
            gUpdateIntervalNs = timing.mIntervalNs;
            gLegacyTickPhaseNs = 0;
            TimeCounter countdown = 150;
            const int initialSteps = countdown.mSteps;
            int frames = 0, hit25 = 0, hit50 = 0;
            while (countdown > 0)
            {
                --countdown;
                ++frames;
                hit25 += countdown == 25;
                hit50 += countdown == 50;
                Require(frames <= 2 * static_cast<int>(fps), "Countdown did not terminate");
            }
            Require(frames == initialSteps && countdown == 0, "Countdown lost sub-tick state");
            Require(hit25 == 1 && hit50 == 1, "Attack trigger was repeated or skipped");
            Require(std::abs(frames * timing.mIntervalNs / 1e9 - 1.5) <= 1.0 / fps,
                "Countdown changed game speed");

            TimeCounter age = 0;
            int pulses = 0, wholeTicks = 0;
            float position = 0;
            float velocity = 1;
            for (unsigned int frame = 0; frame < fps * 10; ++frame)
            {
                BeginTimedUpdate();
                wholeTicks += gWholeLegacyTicks;
                ++age;
                pulses += age % 5 == 0;
                position += UpdateDelta(3.33f);
                velocity *= UpdateDecay(0.97f);
            }
            Require(std::abs(wholeTicks - 1000) <= 1, "Integer UI motion changed speed");
            Require(std::abs(pulses - 200) <= 1, "Periodic event cadence changed speed");
            Require(std::abs(position - 3330.0f) < 1.0f, "Motion changed speed");
            Require(velocity >= 0 && std::isfinite(velocity), "Damping became invalid");
            for (int legacy : {0, 1, 25, 150, 725, 1200, 229196})
            {
                const TimeCounter live = legacy;
                const int wire = static_cast<int>(live);
                Require(std::abs(wire - legacy) <= (fps < 100 ? 1 : 0),
                    "Save export leaked runtime step units");
                unsigned char bytes[4]{};
                std::memcpy(bytes, &wire, sizeof(wire));
                gUpdateTicks = 1;
                gStepsPerLegacyTick = 1;
                int diskValue = 0;
                std::memcpy(&diskValue, bytes, sizeof(diskValue));
                const TimeCounter restored = diskValue;
                Require(restored == wire, "A 100 Hz process could not import the save");
                gUpdateTicks = static_cast<double>(timing.mIntervalNs) / FrameTiming::LegacyTickNs;
                gStepsPerLegacyTick = 1.0 / gUpdateTicks;
            }
        }
        gUpdateTicks = gStepsPerLegacyTick = 1;
        gUpdateIntervalNs = FrameTiming::LegacyTickNs;
        std::cout << "PASS: integer FPS, deadlines, 60/100/144/240/250/1000 Hz timers, motion, save units\n";
        return EXIT_SUCCESS;
    }
    catch (const std::exception& error)
    {
        std::cerr << error.what() << '\n';
        return EXIT_FAILURE;
    }
}
