#pragma once
// Actual altitude business methods, including wire save/restore. No rendering.
#include "LawnApp.h"
#include "Lawn/Board.h"
#include "Lawn/Zombie.h"
#include "Lawn/GridItem.h"
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
#include <vector>

namespace ZombieAltitudeRuntime
{
inline Board* scheduleBoard = nullptr;
inline void Require(bool value, const char* message)
{
    if (!value) throw std::runtime_error(message);
}

template<class Step>
void Schedule(int frequency, std::int64_t total, Step step)
{
    std::mt19937_64 random(0x512724);
    for (std::int64_t elapsed = 0, n = 1; elapsed < total; ++n)
    {
        const auto end = frequency ? std::min(total, n * 1'000'000'000 / frequency) :
            std::min(total, elapsed + static_cast<std::int64_t>(random() % 71'000'003 + 1));
        Sexy::gUpdateIntervalNs = end - elapsed;
        Sexy::gUpdateTicks = double(end - elapsed) / 10'000'000;
        scheduleBoard->mLevelTimeNs += end-elapsed;
        step();
        elapsed = end;
    }
}

enum class Path
{
    BungeeDown, BungeeUp, Flyer, PoolOut, SnorkelOut, PoolIn, DraggedUnder,
    HighGroundUp, HighGroundDown, Falling, VaultFalling, Ladder, Imp, CombinedFlyer
};

inline constexpr std::array Paths{
    Path::BungeeDown, Path::BungeeUp, Path::Flyer, Path::PoolOut, Path::SnorkelOut,
    Path::PoolIn, Path::DraggedUnder, Path::HighGroundUp, Path::HighGroundDown,
    Path::Falling, Path::VaultFalling, Path::Ladder, Path::Imp, Path::CombinedFlyer};

inline void Initialize(Zombie& zombie, LawnApp& app, Board& board, Path path)
{
    zombie.mApp = &app;
    zombie.mBoard = &board;
    zombie.mZombieType = ZombieType::ZOMBIE_NORMAL;
    zombie.mZombiePhase = ZombiePhase::PHASE_ZOMBIE_NORMAL;
    zombie.mZombieHeight = ZombieHeight::HEIGHT_ZOMBIE_NORMAL;
    zombie.mFromWave = Zombie::ZOMBIE_WAVE_CUTSCENE;
    zombie.mScaleZombie = 1;
    zombie.mBodyHealth = zombie.mBodyMaxHealth = 1000;
    zombie.mHasHead = true;
    zombie.mRow = 2;
    zombie.mX = 600.123413f;
    zombie.mY = zombie.GetPosYBasedOnRow(zombie.mRow);
    zombie.mVelX = .7137289f;
    zombie.mVelZ = 2.375f;
    zombie.mAltitude = 10000.123f;
    zombie.mAttachmentID = AttachmentID::ATTACHMENTID_NULL;
    app.mGameMode = GameMode::GAMEMODE_MINIGAME_WALLNUT_BOWLING;
    switch (path)
    {
    case Path::BungeeDown:
        zombie.mZombieType = ZombieType::ZOMBIE_BUNGEE;
        zombie.mZombiePhase = ZombiePhase::PHASE_BUNGEE_DIVING;
        break;
    case Path::BungeeUp:
        zombie.mZombieType = ZombieType::ZOMBIE_BUNGEE;
        zombie.mZombiePhase = ZombiePhase::PHASE_BUNGEE_RISING;
        zombie.mAltitude = -10000.123f;
        break;
    case Path::Flyer:
    case Path::CombinedFlyer:
        zombie.mZombieType = ZombieType::ZOMBIE_BALLOON;
        zombie.mZombiePhase = ZombiePhase::PHASE_BALLOON_WALKING;
        app.mGameMode = GameMode::GAMEMODE_LIMBO_HIGH_GRAVITY;
        if (path == Path::CombinedFlyer) zombie.mZombieHeight = ZombieHeight::HEIGHT_FALLING;
        break;
    case Path::SnorkelOut:
        zombie.mZombieType = ZombieType::ZOMBIE_SNORKEL;
        [[fallthrough]];
    case Path::PoolOut:
        zombie.mZombieHeight = ZombieHeight::HEIGHT_OUT_OF_POOL;
        zombie.mAltitude = -10000.123f;
        break;
    case Path::PoolIn:
        zombie.mZombieHeight = ZombieHeight::HEIGHT_IN_TO_POOL;
        break;
    case Path::DraggedUnder:
        zombie.mZombieHeight = ZombieHeight::HEIGHT_DRAGGED_UNDER;
        break;
    case Path::HighGroundUp:
        zombie.mZombieHeight = ZombieHeight::HEIGHT_UP_TO_HIGH_GROUND;
        zombie.mAltitude = -10000.123f;
        break;
    case Path::HighGroundDown:
        zombie.mZombieHeight = ZombieHeight::HEIGHT_DOWN_OFF_HIGH_GROUND;
        break;
    case Path::VaultFalling:
        zombie.mZombiePhase = ZombiePhase::PHASE_POLEVAULTER_PRE_VAULT;
        [[fallthrough]];
    case Path::Falling:
        zombie.mZombieHeight = ZombieHeight::HEIGHT_FALLING;
        break;
    case Path::Ladder:
        zombie.mZombieHeight = ZombieHeight::HEIGHT_UP_LADDER;
        zombie.mAltitude = -10000.123f;
        break;
    case Path::Imp:
        zombie.mZombieType = ZombieType::ZOMBIE_IMP;
        zombie.mZombiePhase = ZombiePhase::PHASE_IMP_GETTING_THROWN;
        break;
    }
}

inline void Step(Zombie& zombie, Path path)
{
    switch (path)
    {
    case Path::BungeeDown: case Path::BungeeUp: zombie.UpdateZombieBungee(); break;
    case Path::Flyer: zombie.UpdateZombieFlyer(); break;
    case Path::PoolOut: case Path::SnorkelOut: case Path::PoolIn: case Path::DraggedUnder:
        zombie.UpdateZombiePool(); break;
    case Path::HighGroundUp: case Path::HighGroundDown: zombie.UpdateZombieHighGround(); break;
    case Path::Falling: case Path::VaultFalling: zombie.UpdateZombieFalling(); break;
    case Path::Ladder: zombie.UpdateClimbingLadder(); break;
    case Path::Imp: zombie.UpdateZombieImp(); break;
    case Path::CombinedFlyer: zombie.UpdateActions(); break;
    }
}

inline auto State(const Zombie& zombie)
{
    return std::array<std::uint64_t, 10>{
        std::bit_cast<std::uint32_t>(zombie.mAltitude), std::bit_cast<std::uint32_t>(zombie.mVelZ),
        std::bit_cast<std::uint32_t>(zombie.mX), std::bit_cast<std::uint32_t>(zombie.mY),
        std::uint64_t(zombie.mZombieHeight), std::uint64_t(zombie.mZombiePhase),
        std::bit_cast<std::uint64_t>(zombie.mAltitudeMotion.origin),
        static_cast<std::uint64_t>(zombie.mAltitudeMotion.startTimeNs), std::bit_cast<std::uint32_t>(zombie.mAltitudeMotion.rate),
        std::uint64_t(zombie.mAltitudeMotion.bound)};
}

inline void Check(LawnApp& app, Board& board)
{
    const auto oldTime = board.mLevelTimeNs;
    struct RestoreClock { Board& board; std::uint64_t time; ~RestoreClock(){board.mLevelTimeNs=time;scheduleBoard=nullptr;} } restoreClock{board,oldTime};
    scheduleBoard=&board;
    const auto oldMode = app.mGameMode;
    const auto oldDelta = Sexy::gUpdateIntervalNs;
    const auto oldTicks = Sexy::gUpdateTicks;
    std::vector<GridItem*> ladders;
    struct Restore
    {
        LawnApp& app;
        Board& board;
        GameMode mode;
        unsigned long long delta;
        double ticks;
        std::vector<GridItem*>& ladders;
        ~Restore()
        {
            app.mGameMode = mode;
            Sexy::gUpdateIntervalNs = delta;
            Sexy::gUpdateTicks = ticks;
            for (auto* ladder : ladders) board.mGridItems.DataArrayFree(ladder);
        }
    } restore{app, board, oldMode, oldDelta, oldTicks, ladders};
    for (int column = 0; column < 9; ++column)
        if (!board.GetLadderAt(column, 2)) ladders.push_back(board.AddALadder(column, 2));
    for (const auto path : Paths)
    {
        const auto sample = [&](int frequency, std::int64_t duration)
        {
            board.mLevelTimeNs=0;
            Zombie zombie{};
            Initialize(zombie, app, board, path);
            Schedule(frequency, duration, [&] { Step(zombie, path); });
            return State(zombie);
        };
        const auto expected = sample(100, 1'273'192'835);
        for (const int frequency : {200, 1000, 30, 144, 0})
            Require(sample(frequency, 1'273'192'835) == expected,
                "Zombie altitude position/velocity or segment depends on update partition");
        if (path != Path::Imp)
        {
            float rate = -1;
            switch (path)
            {
            case Path::BungeeDown: rate = -8; break;
            case Path::BungeeUp: rate = 8; break;
            case Path::Flyer: rate = -.1f; break;
            case Path::PoolOut: case Path::HighGroundUp: rate = 1; break;
            case Path::SnorkelOut: rate = 2; break;
            case Path::VaultFalling: rate = -2; break;
            case Path::Ladder: rate = .8f; break;
            case Path::CombinedFlyer: rate = -1.0f - .1f; break;
            default: break;
            }
            Zombie oracle{};
            Initialize(oracle, app, board, path);
            const auto start = oracle.mAltitude;
            Schedule(100, 700'000'000, [&] { Step(oracle, path); });
            Require(oracle.mAltitude == CheckedPosition(double(start) + double(rate) * 70),
                "Zombie altitude changed the original 10ms branch velocity");
        }
        Zombie original{};
        Initialize(original, app, board, path);
        Schedule(1000, 137'192'835, [&] { Step(original, path); });
        const auto saved = SaveRecordMapping::WriteSaveRecord(original);
        Zombie resumed{};
        Initialize(resumed, app, board, path);
        SaveRecordMapping::ReadSaveRecord(resumed, saved.data());
        resumed.mApp = &app; resumed.mBoard = &board;
        SaveClockProjection::Bind(resumed);
        Require(State(resumed) == State(original), "Zombie save mapping lost its altitude segment");
        const auto resumeTime=board.mLevelTimeNs;
        Schedule(100, 413'192'835, [&] { Step(original, path); });
        board.mLevelTimeNs=resumeTime;
        Schedule(1000, 413'192'835, [&] { Step(resumed, path); });
        Require(State(original) == State(resumed), "Restored Zombie altitude continuation diverged");
        original.mAltitude += 31.123413f;
        resumed.mAltitude = original.mAltitude;
        if (path == Path::Imp) original.mVelZ = resumed.mVelZ = 1.173289f;
        const auto externalEditTime=board.mLevelTimeNs;
        Schedule(200, 37'192'835, [&] { Step(original, path); });
        board.mLevelTimeNs=externalEditTime;
        Schedule(1000, 37'192'835, [&] { Step(resumed, path); });
        Require(State(original) == State(resumed), "External Zombie altitude/velocity edit failed to rebind");
        const auto paused = State(original);
        Sexy::gUpdateIntervalNs = 0; Sexy::gUpdateTicks = 0;
        Step(original, path);
        Require(State(original) == paused, "Zombie altitude advanced during a zero-length step");
    }
    // Independent recurrence oracle: thrown-imp gravity changes velocity
    // before position. This exposes the opposite half-acceleration formula.
    board.mLevelTimeNs=0;
    Zombie imp{};
    Initialize(imp, app, board, Path::Imp);
    const auto initialAltitude = imp.mAltitude;
    const auto initialVelocity = imp.mVelZ;
    const auto initialY = imp.mY;
    Schedule(100, 700'000'000, [&] { imp.UpdateZombieImp(); });
    long double altitude = initialAltitude, velocity = initialVelocity;
    for (int n = 0; n < 70; ++n)
    {
        velocity -= static_cast<long double>(THOWN_ZOMBIE_GRAVITY);
        altitude += velocity;
    }
    Require(std::abs(imp.mAltitude - double(altitude) - (double(imp.mY) - initialY)) < .001 &&
            std::abs(imp.mVelZ - double(velocity)) < .000001,
        "Imp altitude does not preserve the 1073 gravity-before-movement recurrence");
    // Combined falling/flyer must retain the intermediate falling clamp:
    // start at 5, rates -1 then -.1 => landing on tick 5 gives -.1.
    const auto landedFlyer = [&](int frequency)
    {
        board.mLevelTimeNs=0;
        Zombie zombie{};
        Initialize(zombie, app, board, Path::CombinedFlyer);
        zombie.mAltitude = 5;
        Schedule(frequency, 67'123'457, [&] { zombie.UpdateActions(); });
        Require(zombie.mZombieHeight == ZombieHeight::HEIGHT_ZOMBIE_NORMAL,
            "Combined high-gravity balloon did not complete its falling stage");
        const auto expectedAltitude = static_cast<float>(double(-.1f) +
            double(-.1f) * 17'123'457 / 10'000'000);
        Require(zombie.mAltitude == expectedAltitude,
            "Combined balloon lost the legacy falling-before-flyer clamp order");
        return State(zombie);
    };
    const auto landedReference = landedFlyer(100);
    for (const auto frequency : {200, 1000, 0})
        Require(landedFlyer(frequency) == landedReference,
            "Combined balloon ground transition depends on the outer update partition");
    for (const auto path : {Path::PoolOut, Path::SnorkelOut, Path::HighGroundUp,
                            Path::HighGroundDown, Path::Falling, Path::VaultFalling})
    {
        const auto clamped = [&](int frequency)
        {
            board.mLevelTimeNs=0;
            Zombie zombie{};
            Initialize(zombie, app, board, path);
            if (path == Path::PoolOut || path == Path::SnorkelOut) zombie.mAltitude = -3.123413f;
            else if (path == Path::HighGroundUp) zombie.mAltitude = HIGH_GROUND_HEIGHT - 3.123413f;
            else zombie.mAltitude = 3.123413f;
            Schedule(frequency, 137'192'835, [&] { Step(zombie, path); });
            Require(zombie.mAltitude == (path == Path::HighGroundUp ? HIGH_GROUND_HEIGHT : 0) &&
                    zombie.mZombieHeight == ZombieHeight::HEIGHT_ZOMBIE_NORMAL,
                "Zombie altitude clamp lost its exact target or height transition");
            return State(zombie);
        };
        const auto expected = clamped(100);
        for (const auto frequency : {200, 1000, 0})
            Require(clamped(frequency) == expected, "Zombie clamped altitude state depends on partition");
    }
    Zombie longClock{};
    Initialize(longClock, app, board, Path::Flyer);
    longClock.mAltitudeMotion = {1'000'000'000.0, static_cast<std::int64_t>(board.mLevelTimeNs)-9'007'199'254'740'993LL, -.1f, true};
    longClock.mAltitude = CheckedPosition(
        longClock.mAltitudeMotion.origin + double(longClock.mAltitudeMotion.rate) *
        double(ReanimClock::Subtract(static_cast<std::int64_t>(board.mLevelTimeNs), longClock.mAltitudeMotion.startTimeNs)) / 10'000'000);
    const auto longSave = SaveRecordMapping::WriteSaveRecord(longClock);
    Zombie restoredClock{};
    Initialize(restoredClock, app, board, Path::Flyer);
    SaveRecordMapping::ReadSaveRecord(restoredClock, longSave.data());
    restoredClock.mApp = &app; restoredClock.mBoard = &board;
    SaveClockProjection::Bind(restoredClock);
    Sexy::gUpdateIntervalNs = 1; Sexy::gUpdateTicks = 1e-7;
    board.mLevelTimeNs+=1;
    longClock.UpdateZombieFlyer(); restoredClock.UpdateZombieFlyer();
    Require(State(longClock) == State(restoredClock) &&
            ReanimClock::Subtract(static_cast<std::int64_t>(board.mLevelTimeNs), longClock.mAltitudeMotion.startTimeNs) == 9'007'199'254'740'994LL,
        "Saved Zombie altitude lost a nanosecond beyond double's consecutive integer range");
    // The roof's row Y changes continuously as the imp flies horizontally.
    // Integrating rounded differences of row Y would still drift even if
    // those differences were accumulated in a double.
    const auto oldBackground = board.mBackground;
    board.mBackground = BackgroundType::BACKGROUND_5_ROOF;
    const auto roof = [&](int frequency)
    {
        board.mLevelTimeNs=0;
        Zombie zombie{};
        Initialize(zombie, app, board, Path::Imp);
        zombie.mFromWave = 0;
        zombie.mX = 370.123413f;
        zombie.mY = zombie.GetPosYBasedOnRow(zombie.mRow);
        const double initialY = zombie.mY;
        const double initialZ = zombie.mAltitude;
        const double initialVelocity = zombie.mVelZ;
        constexpr std::int64_t duration = 1'273'192'835;
        Schedule(frequency, duration, [&] { zombie.UpdateZombieImp(); });
        const double ticks = double(duration) / 10'000'000;
        const auto expected = static_cast<float>(initialZ - initialY + zombie.mY +
            initialVelocity * ticks - double(THOWN_ZOMBIE_GRAVITY) * ticks * (ticks + 1) * .5);
        Require(zombie.mAltitude == expected, "Roof imp altitude accumulated rounded row-height differences");
        const auto saved = SaveRecordMapping::WriteSaveRecord(zombie);
        Zombie resumed{};
        Initialize(resumed, app, board, Path::Imp);
        SaveRecordMapping::ReadSaveRecord(resumed, saved.data());
        resumed.mApp = &app; resumed.mBoard = &board;
        SaveClockProjection::Bind(resumed);
        const auto roofResumeTime=board.mLevelTimeNs;
        Schedule(200, 37'192'835, [&] { zombie.UpdateZombieImp(); });
        board.mLevelTimeNs=roofResumeTime;
        Schedule(1000, 37'192'835, [&] { resumed.UpdateZombieImp(); });
        Require(State(zombie) == State(resumed), "Saved roof imp lost its relative-row ballistic origin");
        return State(zombie);
    };
    const auto roofReference = roof(100);
    for (const auto frequency : {200, 1000, 0})
        Require(roof(frequency) == roofReference, "Roof imp motion depends on update partition");
    board.mBackground = oldBackground;
}
} // namespace ZombieAltitudeRuntime
