#pragma once
// Coupled speed/position checks through the real type action and walking path.
#include "LawnApp.h"
#include "Lawn/Board.h"
#include "Lawn/Zombie.h"
#include "Lawn/ZamboniMotion.h"
#include "Lawn/SeedPacket.h"
#include "Lawn/SlotMachineMotion.h"
#include "Sexy.TodLib/TodParticle.h"
#include "Sexy.TodLib/Attachment.h"
#include "Lawn/System/SaveRecordMapping.h"
#include <array>
#include <bit>
#include <cmath>
#include <random>
#include <stdexcept>

namespace ZamboniRuntime
{
inline void Require(bool value, const char* message)
{
    if (!value) throw std::runtime_error(message);
}

template<class Step>
void Schedule(int frequency, std::int64_t duration, Step step)
{
    std::mt19937_64 random(0x516397);
    for (std::int64_t elapsed = 0, n = 1; elapsed < duration; ++n)
    {
        const auto end = frequency ? std::min(duration, n * 1'000'000'000 / frequency) :
            std::min(duration, elapsed + static_cast<std::int64_t>(random() % 71'000'003 + 1));
        Sexy::gUpdateIntervalNs = end - elapsed;
        Sexy::gUpdateTicks = double(end - elapsed) / 10'000'000;
        step();
        elapsed = end;
    }
}

inline void Step(Zombie& zombie)
{
    // This is their production ordering in UpdatePlaying: the type action
    // computes speed/ice using the old position, then walking moves the actor.
    zombie.UpdateZamboni();
    zombie.UpdateZombieWalking();
}

inline auto State(const Zombie& zombie)
{
    return std::array<std::uint64_t, 7>{
        std::bit_cast<std::uint32_t>(zombie.mX), std::bit_cast<std::uint32_t>(zombie.mVelX),
        std::bit_cast<std::uint64_t>(zombie.mVelocityX.origin), zombie.mVelocityX.elapsedNs,
        std::bit_cast<std::uint32_t>(zombie.mVelocityX.rate),
        std::uint64_t(zombie.mVelocityX.bound), std::uint64_t(zombie.mMindControlled)};
}

inline void Check(LawnApp& app, Board& board)
{
    const auto oldMode = app.mGameMode;
    const auto oldDelta = Sexy::gUpdateIntervalNs;
    const auto oldTicks = Sexy::gUpdateTicks;
    const auto oldIceX = std::to_array(board.mIceMinX);
    const auto oldIceTimer = std::to_array(board.mIceTimer);
    auto* animation = app.AddReanimation(0, 0, 0, ReanimationType::REANIM_ZOMBIE_ZAMBONI);
    const auto animationId = app.ReanimationGetID(animation);
    struct Restore
    {
        LawnApp& app;
        Board& board;
        GameMode mode;
        unsigned long long delta;
        double ticks;
        std::array<int, MAX_GRID_SIZE_Y> iceX;
        std::array<Sexy::TimeCounter, MAX_GRID_SIZE_Y> iceTimer;
        ReanimationID animation;
        ~Restore()
        {
            app.mGameMode = mode;
            Sexy::gUpdateIntervalNs = delta; Sexy::gUpdateTicks = ticks;
            std::copy(iceX.begin(), iceX.end(), board.mIceMinX);
            std::copy(iceTimer.begin(), iceTimer.end(), board.mIceTimer);
            app.RemoveReanimation(animation);
        }
    } restore{app, board, oldMode, oldDelta, oldTicks, oldIceX, oldIceTimer, animationId};
    app.mGameMode = GameMode::GAMEMODE_MINIGAME_WALLNUT_BOWLING;
    const auto initialize = [&](Zombie& zombie, float x, bool backwards, bool flat)
    {
        zombie.mApp = &app; zombie.mBoard = &board;
        zombie.mZombieType = ZombieType::ZOMBIE_ZAMBONI;
        zombie.mZombiePhase = ZombiePhase::PHASE_ZOMBIE_NORMAL;
        zombie.mZombieHeight = ZombieHeight::HEIGHT_ZOMBIE_NORMAL;
        zombie.mFromWave = Zombie::ZOMBIE_WAVE_CUTSCENE;
        zombie.mScaleZombie = 1;
        zombie.mRow = 2;
        zombie.mX = x; zombie.mY = 200;
        zombie.mVelX = .2317289f;
        zombie.mFlatTires = flat;
        zombie.mMindControlled = backwards;
        zombie.mHasHead = true;
        zombie.mBodyHealth = zombie.mBodyMaxHealth = 1000;
        zombie.mAttachmentID = AttachmentID::ATTACHMENTID_NULL;
        zombie.mBodyReanimID = animationId;
    };
    for (const bool backwards : {false, true})
        for (const bool flat : {false, true})
            for (const float x : {751.123413f, 650.123413f, 401.125f, 399.875f})
            {
                const auto sample = [&](int frequency, std::int64_t duration)
                {
                    Zombie zombie{};
                    initialize(zombie, x, backwards, flat);
                    Schedule(frequency, duration, [&] { Step(zombie); });
                    return State(zombie);
                };
                for (const auto duration : {1'273'192'835LL, 23'319'283'501LL})
                {
                    const auto expected = sample(100, duration);
                    for (const int frequency : {200, 1000, 0})
                        Require(sample(frequency, duration) == expected,
                            "Zamboni coupled speed/position or canonical tail depends on partition");
                }
                // Independent recurrence using the actual float endpoints,
                // without feeding rounded float state back into the oracle.
                long double oracleX = x, speed = .2317289f;
                const long double direction = backwards ? 1 : -1;
                for (int tick = 0; tick < 700; ++tick)
                {
                    if (oracleX > 400 && !flat)
                    {
                        const auto fraction = std::clamp((oracleX - 700) / (300 - 700), 0.0L, 1.0L);
                        speed = static_cast<long double>(.25f) +
                            (static_cast<long double>(.05f) - .25f) * fraction;
                    }
                    else if (flat && speed > static_cast<long double>(.0005f))
                        speed -= static_cast<long double>(.0005f);
                    oracleX += direction * speed;
                }
                Zombie oracle{};
                initialize(oracle, x, backwards, flat);
                Schedule(100, 7'000'000'000, [&] { Step(oracle); });
                Require(std::abs(double(oracle.mX) - double(oracleX)) < .0002 &&
                        std::abs(double(oracle.mVelX) - double(speed)) < .000002,
                    "Zamboni analytic motion differs from the mathematical 1073 recurrence");
                Zombie original{};
                initialize(original, x, backwards, flat);
                Schedule(1000, 137'192'835, [&] { Step(original); });
                const auto saved = SaveRecordMapping::WriteSaveRecord(original);
                Zombie resumed{};
                initialize(resumed, x, backwards, flat);
                SaveRecordMapping::ReadSaveRecord(resumed, saved.data());
                resumed.mApp = &app; resumed.mBoard = &board;
                Require(State(resumed) == State(original), "Zamboni save lost its coupled motion origin");
                Schedule(100, 1'173'192'835, [&] { Step(original); });
                Schedule(1000, 1'173'192'835, [&] { Step(resumed); });
                Require(State(resumed) == State(original), "Saved Zamboni motion continuation diverged");
                original.mX += 37.123413f;
                resumed.mX = original.mX;
                original.mMindControlled = resumed.mMindControlled = !backwards;
                Schedule(200, 137'192'835, [&] { Step(original); });
                Schedule(1000, 137'192'835, [&] { Step(resumed); });
                Require(State(resumed) == State(original), "Zamboni teleport/direction edit failed to rebind");
                original.mFlatTires = resumed.mFlatTires = !flat;
                original.mVelX = resumed.mVelX = .173289f;
                Schedule(200, 137'192'835, [&] { Step(original); });
                Schedule(1000, 137'192'835, [&] { Step(resumed); });
                Require(State(resumed) == State(original), "Zamboni flat-tire/velocity edit failed to rebind");
            }
    for (const auto elapsed : {0ULL, 10'000'000ULL, 9'007'199'254'740'993ULL,
            std::numeric_limits<std::uint64_t>::max()})
    {
        const auto forward = ZamboniMotion::Sample<1>(700, .19f, elapsed, false, true, -.25f);
        const auto backward = ZamboniMotion::Sample<-1>(700, .19f, elapsed, false, true, .25f);
        Require(forward.position == 700 && backward.position == 700 &&
                forward.speed == .25 && backward.speed == .25,
            "Zamboni exact equilibrium overflowed or changed over a long interval");
    }
    const auto additional = [&](int frequency)
    {
        Zombie zombie{};
        initialize(zombie, 650.123413f, false, false);
        zombie.mBlowingAway = true;
        Schedule(frequency, 137'192'835, [&] { Step(zombie); });
        return State(zombie);
    };
    const auto additionalReference = additional(100);
    for (const auto frequency : {200, 1000, 0})
        Require(additional(frequency) == additionalReference,
            "Zamboni source curve plus additional motion depends on partition");
    for (const bool flat : {false, true})
    {
        const auto stopped = [&](int frequency)
        {
            Zombie zombie{};
            initialize(zombie, 650.123413f, false, flat);
            zombie.mIsEating = true;
            Schedule(frequency, 137'192'835, [&] { Step(zombie); });
            Require(zombie.mX == 650.123413f, "Stopped Zamboni still moved its body");
            zombie.mIsEating = false;
            Schedule(frequency, 137'192'835, [&] { Step(zombie); });
            return State(zombie);
        };
        const auto expected = stopped(100);
        for (const auto frequency : {200, 1000, 0})
            Require(stopped(frequency) == expected, "Zamboni stop/resume rebound depends on partition");
    }
}
} // namespace ZamboniRuntime
