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
        // Real elapsed time is conserved even when work cannot reach target FPS.
        for (unsigned int fps : {1U, 30U, 60U, 100U, 240U, 10000U})
        {
            const auto timing = FrameTiming::FromTargetFps(fps);
            for (unsigned long long elapsed : {100'000ULL, 6'000'000ULL,
                     10'000'000ULL, 10'000'001ULL, 16'666'666ULL,
                     35'123'456ULL, 250'000'000ULL, 1'000'000'000ULL})
            {
                auto pending = SimulationTimeFromWallTime(elapsed, 1.0);
                unsigned long long total = 0;
                unsigned long long phase = 0;
                while (pending)
                {
                    const auto interval = TakeSimulationStep(pending, timing.mIntervalNs, phase);
                    if (!interval) break;
                    Require(interval > 0,
                        "Actual-time update produced a zero step");
                    ApplySimulationStep(interval);
                    Require(gUpdateIntervalNs == interval &&
                        std::abs(gUpdateTicks - double(interval) / 10'000'000.0) < 1e-12,
                        "Motion scaling differs from the actual simulation interval");
                    total += interval;
                }
                Require(total + pending == elapsed, "Scheduler dropped elapsed wall time");
                const auto quantum = timing.mIntervalNs;
                Require(pending < quantum - phase,
                    "Scheduler deferred a logical interval that was already due");

            }
        }
        Require(SimulationTimeFromWallTime(35'123'456, 2.0) == 70'246'912,
            "Game speed multiplier lost elapsed time");
        unsigned long long simulated = 0;
        for (unsigned int frame = 0; frame < 200; ++frame)
        {
            auto pending = SimulationTimeFromWallTime(5'000'000, 1.0);
            unsigned long long phase = 0;
            while (pending)
            {
                const auto stepNs = TakeSimulationStep(pending, 100'000, phase);
                if (!stepNs) break;
                simulated += stepNs;
            }
        }
        Require(simulated == 1'000'000'000ULL,
            "10000FPS target with 5ms actual frames slowed the game clock");
        {
            unsigned long long pending = 33'345'000, phase = 0;
            Require(TakeSimulationStep(pending, 33'333'333, phase) == 33'345'000 &&
                pending == 0 && phase == 11'667,
                "30Hz actual interval was subdivided or lost its overshoot credit");
            pending = 33'321'666;
            Require(TakeSimulationStep(pending, 33'333'333, phase) == 33'321'666 &&
                pending == 0 && phase == 0,
                "Overshoot did not permit a shorter compensating interval");
            pending = 10'123'456; phase = 0;
            Require(TakeSimulationStep(pending, 10'000'000, phase) == 10'123'456 &&
                pending == 0 && phase == 123'456,
                "100Hz actual interval was truncated");
            pending = 5'123'456; phase = 0;
            Require(TakeSimulationStep(pending, 4'000'000, phase) == 5'123'456 &&
                pending == 0 && phase == 1'123'456,
                "Overrun was truncated to the requested step");
            Require(FrameWaitNs(0, 4'000'000, phase) == 2'876'544 &&
                FrameWaitNs(2'876'544, 4'000'000, phase) == 0 &&
                FrameWaitNs(6'000'000, 4'000'000, phase) == 0,
                "Pacing lost overshoot credit or slept after the deadline");
            pending = 2'876'544;
            Require(TakeSimulationStep(pending, 4'000'000, phase) == 2'876'544 &&
                pending == 0 && phase == 0,
                "Compensating update could not be shorter than the target step");
            pending = 9'000'000; phase = 0;
            Require(TakeSimulationStep(pending, 4'000'000, phase) == 9'000'000 &&
                pending == 0 && phase == 1'000'000,
                "4ms target incorrectly capped actual work at two target intervals");
            Require(FrameWaitNs(0, 4'000'000, phase) == 3'000'000,
                "9ms update did not preserve its next 3ms presentation opportunity");
            pending = 8'000'000;
            Require(TakeSimulationStep(pending, 4'000'000, phase) == 8'000'000,
                "Next update was forced to the 3ms minimum instead of actual elapsed time");

        }
        ApplySimulationStep(FrameTiming::LegacyTickNs);
        constexpr auto stock = FrameTiming::FromTargetFps(100);
        constexpr auto high = FrameTiming::FromTargetFps(240);
        static_assert(stock.mIntervalNs == 10'000'000ULL);
        static_assert(high.mIntervalNs == 4'166'666ULL);
        static_assert(FrameTiming::FromTargetFps(60).mIntervalNs == 16'666'666ULL);
        static_assert(FrameTiming::FromTargetFps(250).mIntervalNs == 4'000'000ULL);
        static_assert(FrameTiming::FromTargetFps(1).mIntervalNs == 33'333'333ULL);
        static_assert(FrameTiming::FromTargetFps(1'000'000'000).mIntervalNs == 1);

        for (double invalid : {0.0, -1.0, 29.999, 239.5, 1'000'000'001.0,
                 std::numeric_limits<double>::infinity(),
                 std::numeric_limits<double>::quiet_NaN()})
            Require(FrameTiming::FromSetting(invalid).mTargetFps == 100,
                "Invalid setting did not fall back to 100 Hz");
        Require(FrameTiming::FromSetting(240).mIntervalNs == high.mIntervalNs,
            "Integer setting was not accepted");
        Require(FrameTiming::FromSetting(100).mIntervalNs == stock.mIntervalNs &&
            FrameTiming::FromSetting(101).mTargetFps == 101,
            "Minimum target FPS boundary changed valid settings");
        Require(FrameTiming::FromSetting(1).mTargetFps == 30 &&
            FrameTiming::FromSetting(29).mTargetFps == 30 &&
            FrameTiming::FromSetting(30).mTargetFps == 30 &&
            FrameTiming::FromSetting(60).mTargetFps == 60,
            "Valid low refresh targets were rejected");
        Require(FrameTiming::FromDisplayRefreshRate(24).mTargetFps == 30 &&
            FrameTiming::FromDisplayRefreshRate(59.94).mTargetFps == 60 &&
            FrameTiming::FromDisplayRefreshRate(119.88).mTargetFps == 120 &&
            FrameTiming::FromDisplayRefreshRate(0).mTargetFps == 100,
            "Display refresh target or 30FPS minimum changed");
        {
            unsigned long long pending = 1'234'567'890, phase = 0;
            Require(TakeSimulationStep(pending,33'333'333,phase) == 1'234'567'890 && pending == 0,
                "Long elapsed interval was subdivided or discarded");
            pending = 0;
            bool invalid = false;
            try { (void)TakeSimulationStep(pending,0,phase); }
            catch (const std::invalid_argument&) { invalid = true; }
            Require(invalid, "Zero simulation target was accepted");
        }
        // Jitter, wake-up overshoot and undershoot conserve every nanosecond.
        for (const auto requested : {33'333'333ULL, 10'000'000ULL, 4'000'000ULL})
        {
            unsigned long long pending=0, phase=0, wall=0, consumed=0;
            for (unsigned int i=0; i<100000; ++i)
            {
                const auto elapsed=1ULL+(i*7919ULL)%70'000'000ULL;
                pending+=elapsed; wall+=elapsed;
                const auto step=TakeSimulationStep(pending,requested,phase);
                consumed+=step;
                Require(consumed+pending==wall && phase==consumed%requested,
                    "Jittered pacing lost time or double-counted overshoot");
            }
        }
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

        for (unsigned int fps : {100u, 144u, 240u, 250u, 1000u})
        {
            const auto timing = FrameTiming::FromTargetFps(fps);
            gUpdateTicks = static_cast<double>(timing.mIntervalNs) / FrameTiming::LegacyTickNs;
            gStepsPerLegacyTick = 1.0 / gUpdateTicks;
            gUpdateIntervalNs = timing.mIntervalNs;
            gLegacyTickPhaseNs = 0;
            TimeCounter countdown = 150;
            const auto initialNanoseconds = countdown.mNanoseconds;
            const auto initialSteps = (initialNanoseconds + timing.mIntervalNs - 1) / timing.mIntervalNs;
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
                velocity *= std::max(0.0f, 1.0f - static_cast<float>(gUpdateIntervalNs * 3.0e-9));
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
                unsigned char bytes[8]{};
                std::memcpy(bytes, &live.mNanoseconds, sizeof(live.mNanoseconds));
                gUpdateTicks = 1;
                gStepsPerLegacyTick = 1;
                TimeCounter restored{};
                std::memcpy(&restored.mNanoseconds, bytes, sizeof(restored.mNanoseconds));
                restored.mPreviousNanoseconds = restored.mNanoseconds;
                Require(restored == wire, "A 100 Hz process could not import the save");
                gUpdateTicks = static_cast<double>(timing.mIntervalNs) / FrameTiming::LegacyTickNs;
                gStepsPerLegacyTick = 1.0 / gUpdateTicks;
            }
        }
        gUpdateTicks = gStepsPerLegacyTick = 1;
        gUpdateIntervalNs = FrameTiming::LegacyTickNs;
        std::cout << "PASS: actual-time unbounded updates, jitter conservation, minimum 30 FPS, display refresh targets, deadlines, 100/144/240/250/1000 Hz timers, motion, nanosecond state\n";
        return EXIT_SUCCESS;
    }
    catch (const std::exception& error)
    {
        std::cerr << error.what() << '\n';
        return EXIT_FAILURE;
    }
}
