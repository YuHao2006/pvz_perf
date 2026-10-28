#pragma once
// Actual-step movement and absolute-time tire speed checks.
#include "LawnApp.h"
#include "Lawn/Board.h"
#include "Lawn/Zombie.h"
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
    zombie.mBoard->mLevelTimeNs += Sexy::gUpdateIntervalNs;
    zombie.UpdateZamboni();
    zombie.UpdateZombieWalking();
}

inline auto State(const Zombie& zombie)
{
    return std::array<std::uint64_t, 7>{
        std::bit_cast<std::uint32_t>(zombie.mX), std::bit_cast<std::uint32_t>(zombie.mVelX),
        std::bit_cast<std::uint64_t>(zombie.mVelocityX.origin), static_cast<std::uint64_t>(zombie.mVelocityX.startTimeNs),
        std::bit_cast<std::uint32_t>(zombie.mVelocityX.rate),
        std::uint64_t(zombie.mVelocityX.bound), std::uint64_t(zombie.mMindControlled)};
}

inline void Check(LawnApp& app, Board& board)
{
    const auto oldMode = app.mGameMode;
    const auto oldDelta = Sexy::gUpdateIntervalNs;
    const auto oldTicks = Sexy::gUpdateTicks;
    const auto oldTime = board.mLevelTimeNs;
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
        unsigned long long time;
        std::array<int, MAX_GRID_SIZE_Y> iceX;
        std::array<Sexy::TimeCounter, MAX_GRID_SIZE_Y> iceTimer;
        ReanimationID animation;
        ~Restore()
        {
            app.mGameMode = mode;
            board.mLevelTimeNs = time;
            Sexy::gUpdateIntervalNs = delta; Sexy::gUpdateTicks = ticks;
            std::copy(iceX.begin(), iceX.end(), board.mIceMinX);
            std::copy(iceTimer.begin(), iceTimer.end(), board.mIceTimer);
            app.RemoveReanimation(animation);
        }
    } restore{app, board, oldMode, oldDelta, oldTicks, oldTime, oldIceX, oldIceTimer, animationId};
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
    // Normal speed is selected from the pre-move integer X, then integrated
    // once using the actual nanosecond step. Different partitions may differ.
    for (const bool backwards : {false, true})
        for (const float x : {751.123413f, 650.123413f, 401.125f, 399.875f})
            for (const int frequency : {100, 200, 1000, 0})
            {
                board.mLevelTimeNs = 0;
                Zombie zombie{};
                initialize(zombie, x, backwards, false);
                float expectedX = x, expectedSpeed = zombie.mVelX;
                Schedule(frequency, 1'273'192'835, [&]
                {
                    if (expectedX > 400.0f)
                    {
                        const double fraction = std::clamp(
                            double(static_cast<int>(expectedX) - 700) / -400.0, 0.0, 1.0);
                        expectedSpeed = static_cast<float>(.25 + (double(.05f) - .25) * fraction);
                    }
                    expectedX += static_cast<float>(double(backwards ? expectedSpeed : -expectedSpeed) *
                        double(Sexy::gUpdateIntervalNs) / 10'000'000.0);
                    Step(zombie);
                    Require(std::abs(zombie.mVelX - expectedSpeed) < .0000001f &&
                        std::abs(zombie.mX - expectedX) < .0001f,
                        "Zamboni differs from actual-step original speed recurrence");
                });
                Require(!zombie.mVelocityX.bound, "Normal Zamboni retained a trajectory anchor");
            }
    // Only flat-tire speed is time-valued. Position remains step integration.
    float referenceSpeed = 0;
    for (const int frequency : {100, 200, 1000, 0})
    {
        board.mLevelTimeNs = 0;
        Zombie zombie{};
        initialize(zombie, 650.125f, false, true);
        zombie.mVelocityX.rate = zombie.mVelX;
        zombie.mVelocityX.startTimeNs = 0;
        zombie.mVelocityX.bound = true;
        Schedule(frequency, 1'273'192'835, [&] { Step(zombie); });
        if (frequency == 100) referenceSpeed = zombie.mVelX;
        Require(zombie.mVelX == referenceSpeed,
            "Flat-tire speed depends on the step partition");
        Schedule(frequency, 5'000'000'000, [&] { Step(zombie); });
        Require(zombie.mVelX == 0, "Flat-tire speed did not clamp to rest");
    }
    for (const bool flat : {false, true})
    {
        board.mLevelTimeNs = 0;
        Zombie original{};
        initialize(original, 650.125f, false, flat);
        Schedule(200, 137'192'835, [&] { Step(original); });
        const auto savedTime = board.mLevelTimeNs;
        const auto saved = SaveRecordMapping::WriteSaveRecord(original);
        Zombie resumed{};
        initialize(resumed, 0, false, flat);
        SaveRecordMapping::ReadSaveRecord(resumed, saved.data());
        resumed.mApp = &app; resumed.mBoard = &board;
        Require(State(resumed) == State(original), "Zamboni save lost its speed anchor");
        Schedule(200, 1'173'192'835, [&] { Step(original); });
        board.mLevelTimeNs = savedTime;
        Schedule(200, 1'173'192'835, [&] { Step(resumed); });
        Require(State(resumed) == State(original), "Zamboni identical-step save continuation diverged");
        resumed.mIsEating = true;
        const float stoppedX = resumed.mX;
        Schedule(200, 137'192'835, [&] { Step(resumed); });
        Require(resumed.mX == stoppedX, "Stopped Zamboni moved");
        resumed.mIsEating = false;
        resumed.mX += 37.125f;
        Sexy::gUpdateIntervalNs = 0;
        const float editedX = resumed.mX;
        Step(resumed);
        Require(resumed.mX == editedX, "Zero-step Zamboni snapped to an obsolete trajectory");
    }
    // Pending movement is consumed even when ordinary walking is stopped;
    // blowing-away displacement remains additive and uses the current step.
    {
        Zombie additional{};
        initialize(additional, 650, false, false);
        additional.mIsEating = true;
        additional.mPendingAdditionalSpeedX = 2;
        additional.mBlowingAway = true;
        Sexy::gUpdateIntervalNs = 5'000'000;
        Step(additional);
        Require(additional.mX == 656 && additional.mPendingAdditionalSpeedX == 0,
            "Stopped Zamboni lost additive displacement or failed to consume it");
    }
    board.mLevelTimeNs = 7'000'000'000;
    Zombie lazy{};
    initialize(lazy, 650, false, true);
    Sexy::gUpdateIntervalNs = 10'000'000;
    Step(lazy);
    Require(lazy.mVelocityX.bound && lazy.mVelocityX.startTimeNs == board.mLevelTimeNs &&
        lazy.mVelX == .2317289f, "Loaded flat-tire speed failed to bind lazily");
    lazy.mVelocityX.rate = 0;
    lazy.mVelX = 0;
    Schedule(1000, 1'000'000'000, [&] { Step(lazy); });
    Require(lazy.mVelX == 0, "Spike-stopped Zamboni regained speed");
}
} // namespace ZamboniRuntime
