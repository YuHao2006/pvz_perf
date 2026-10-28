#include "Lawn/SlotMachineMotion.h"
#include <algorithm>
#include <cmath>
#include <iostream>
#include <stdexcept>

int main()
{
    try
    {
        float originalPhase = 0, phase = 0;
        int countdown = 400;
        int originalTurns = 0, turns = 0;
        int updates = 0;
        std::int64_t nowNs = 0, endNs = SlotMachineMotion::DurationNs;
        while (countdown != 0)
        {
            --countdown;
            const float age = (countdown - 400) / -400.0f;
            const float originalSpeed = 6.0f + (2.0f - 6.0f) * age;
            originalPhase += originalSpeed * .01f;
            if (originalPhase >= 1.0f)
            {
                ++originalTurns;
                if (countdown == 0) originalPhase = 0;
                else originalPhase -= 1.0f;
            }
            else if (countdown == 0) countdown = 1;

            nowNs += 10'000'000;
            const auto remainingNs = std::max<std::int64_t>(0, endNs - nowNs);
            const float speed = SlotMachineMotion::Speed(remainingNs);
            if (speed != originalSpeed)
                throw std::runtime_error("Source-order speed differs at100Hz");
            phase += speed * static_cast<float>(10'000'000.0 / 1'000'000'000.0);
            if (phase >= 1.0f)
            {
                ++turns;
                if (remainingNs == 0) {phase = 0; endNs = 0;}
                else phase -= 1.0f;
            }
            if (phase != originalPhase || turns != originalTurns ||
                (endNs == 0) != (countdown == 0))
                throw std::runtime_error("Source phase/RNG wrap or activation differs at100Hz");
            ++updates;
            if (updates > 500) throw std::runtime_error("Slot did not finish");
        }
        if (updates != 402 || turns != 16 || phase != 0)
            throw std::runtime_error("Original final wrap changed");
        // An expired deadline stays expired. Re-arming a 10ms tail at each
        // update can otherwise prevent the 144Hz wrap from ever stopping.
        for (const int frequency : {1,30,60,144,200,240,1000})
        {
            const std::int64_t deltaNs = 1'000'000'000LL / frequency;
            std::int64_t now = 0;
            const auto end = SlotMachineMotion::DurationNs;
            float position = 0;
            bool active = false;
            while (now < 6'000'000'000 && !active)
            {
                now += deltaNs;
                const auto remaining = std::max<std::int64_t>(0,end-now);
                position += SlotMachineMotion::Speed(remaining) *
                    static_cast<float>(static_cast<double>(deltaNs)/1'000'000'000.0);
                while (position >= 1)
                {
                    if (remaining == 0) {position=0;active=true;break;}
                    position -= 1;
                }
            }
            if (!active || position != 0)
                throw std::runtime_error("Non100Hz finishing turn failed to activate");
        }
        for (const auto remaining : {-1LL, 0LL, 123'456'789LL, 4'000'000'000LL, 9'000'000'000LL})
        {
            const auto speed = SlotMachineMotion::Speed(remaining);
            if (!std::isfinite(speed) || speed < 2 || speed > 6)
                throw std::runtime_error("Nanosecond speed escaped the authored bounds");
        }
        std::cout << "PASS discrete slot original100Hz float speed/phase/RNG-wrap/activation and bounded nanosecond speed\n";
        return 0;
    }
    catch (const std::exception& error)
    {
        std::cerr << error.what() << '\n';
        return 1;
    }
}
