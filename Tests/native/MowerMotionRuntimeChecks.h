#pragma once
// Game-linked checks: actual LawnMower::Update/UpdatePool and
// Challenge::ZombiquariumUpdate, using the fixture's real Board and reanimations.
#include "Lawn/Board.h"
#include "Lawn/LawnMower.h"
#include "Lawn/Challenge.h"
#include "Lawn/GridItem.h"
#include "Lawn/Zombie.h"
#include "Sexy.TodLib/Reanimator.h"
#include <array>
#include <bit>
#include <cmath>
#include <iostream>
#include <stdexcept>

namespace MowerMotionRuntime
{
inline void Require(bool ok, const char* text)
{
    if (!ok) throw std::runtime_error(text);
}

template<class Step>
void Schedule(int frequency, std::int64_t duration, Step step)
{
    std::uint64_t random = 0x61d15e;
    for (std::int64_t elapsed = 0, index = 1; elapsed < duration; ++index)
    {
        random ^= random << 13; random ^= random >> 7; random ^= random << 17;
        const auto end = frequency ? std::min(duration, index * 1'000'000'000 / frequency) :
            std::min(duration, elapsed + std::int64_t(random % 71'000'003 + 1));
        Sexy::gUpdateIntervalNs = end - elapsed;
        Sexy::gUpdateTicks = double(end - elapsed) / 10'000'000;
        Sexy::gWholeLegacyTicks = 0;
        step();
        elapsed = end;
    }
}

inline std::uint32_t Bits(float value) { return std::bit_cast<std::uint32_t>(value); }

struct MowerFixture
{
    LawnApp& app;
    LawnMower mower{};
    MowerFixture(LawnApp& a, Board& board, LawnMowerType type, int chomp) : app(a)
    {
        mower.mApp = &app;
        mower.mBoard = &board;
        mower.mRow = 2;
        mower.mPosX = -2000.25f; // No accidental pool-edge/board-exit side effects.
        mower.mPosY = 100;
        mower.mMowerState = LawnMowerState::MOWER_TRIGGERED;
        mower.mMowerType = type;
        mower.mMowerHeight = MowerHeight::MOWER_HEIGHT_LAND;
        mower.mChompCounter = chomp;
        auto* animation = app.AddReanimation(0, 0, 0, type == LawnMowerType::LAWNMOWER_POOL ?
            ReanimationType::REANIM_POOL_CLEANER : ReanimationType::REANIM_LAWNMOWER);
        animation->ChangeLoopType(ReanimLoopType::REANIM_LOOP);
        mower.mReanimID = app.ReanimationGetID(animation);
    }
    ~MowerFixture() { app.RemoveReanimation(mower.mReanimID); }
};

inline std::array<std::uint32_t, 3> Travel(LawnApp& app, Board& board,
    int frequency, LawnMowerType type, int chomp)
{
    MowerFixture fixture(app, board, type, chomp);
    auto& mower = fixture.mower;
    Schedule(frequency, 712'345'679, [&] { mower.Update(); });
    const auto first = Bits(mower.mPosX);
    mower.mChompCounter = 50; // Real collision writes this same public countdown.
    Schedule(frequency, 423'456'789, [&] { mower.Update(); });
    const auto second = Bits(mower.mPosX);
    mower.mPosX = -1500.125f; // Explicit movement reset starts a new segment.
    Schedule(frequency, 864'197'532, [&] { mower.Update(); });
    Require(!mower.mDead, "Mower fixture unexpectedly died");
    return {first, second, Bits(mower.mPosX)};
}

inline void Source100Hz(LawnApp& app, Board& board, LawnMowerType type, int chomp)
{
    MowerFixture fixture(app, board, type, chomp);
    const float base = type == LawnMowerType::LAWNMOWER_POOL ? 2.5f : 3.33f;
    double expected = fixture.mower.mPosX;
    int counter = chomp;
    for (int tick = 0; tick < 100; ++tick)
    {
        float speed = base;
        if (counter > 0)
            speed = TodAnimateCurveNs(500'000'000, 0, std::int64_t(--counter) * 10'000'000,
                base, 1.0f, Curves::BounceSlowMiddle);
        expected += speed;
        Schedule(100, 10'000'000, [&] { fixture.mower.Update(); });
        Require(std::fabs(double(fixture.mower.mPosX) - expected) < .0002,
            "Production mower changed the 100Hz source chomp speed sequence");
    }
    if (chomp == 50)
    {
        const double loss = double(fixture.mower.mPosX) -
            (-2000.25 + 100.0 * base);
        const double expectedLoss = type == LawnMowerType::LAWNMOWER_POOL ?
            -49.98 : -77.6356;
        Require(std::fabs(loss - expectedLoss) < .002,
            "Mower slowdown distance no longer matches the original 0.5 second curve");
    }
}

inline void PoolAltitude(LawnApp& app, Board& board)
{
    for (bool rising : {false, true})
    {
        const auto run = [&](int frequency) {
            MowerFixture fixture(app, board, LawnMowerType::LAWNMOWER_POOL, 0);
            auto& mower = fixture.mower;
            mower.mPosX = rising ? 700.f : 100.f;
            mower.mMowerHeight = rising ? MowerHeight::MOWER_HEIGHT_UP_TO_LAND :
                MowerHeight::MOWER_HEIGHT_DOWN_TO_POOL;
            mower.mAltitude = rising ? -28.f : 0.f;
            Schedule(frequency, 123'456'789, [&] { mower.UpdatePool(); });
            const auto sample = Bits(mower.mAltitude);
            Schedule(frequency, 16'543'210, [&] { mower.UpdatePool(); });
            Require(mower.mMowerHeight == (rising ? MowerHeight::MOWER_HEIGHT_UP_TO_LAND :
                MowerHeight::MOWER_HEIGHT_DOWN_TO_POOL),
                "Mower altitude transitioned before its integer deadline");
            Schedule(100, 1, [&] { mower.UpdatePool(); });
            Require(mower.mAltitude == 0 && mower.mMowerHeight ==
                (rising ? MowerHeight::MOWER_HEIGHT_LAND : MowerHeight::MOWER_HEIGHT_IN_POOL),
                "Mower altitude missed the 140ms endpoint");
            return sample;
        };
        const auto expected = run(100);
        for (int frequency : {1, 30, 60, 144, 200, 240, 1000, 0})
            Require(run(frequency) == expected, "Production mower altitude depends on step partition");
    }
}

inline void Brain(LawnApp& app, Board& board)
{
    const auto money = board.mSunMoney;
    const auto tutorial = board.mTutorialState;
    const bool help = board.mHelpDisplayed[AdviceType::ADVICE_ZOMBIQUARIUM_COLLECT_SUN];
    const auto meter = board.mProgressMeterWidth;
    board.mSunMoney = 0;
    board.mTutorialState = TutorialState::TUTORIAL_OFF;
    board.mHelpDisplayed[AdviceType::ADVICE_ZOMBIQUARIUM_COLLECT_SUN] = true;
    // ZombiquariumUpdate only checks this pool's count; no zombie update is run.
    board.mZombies.DataArrayAlloc();
    const auto run = [&](int frequency) {
        auto* brain = board.mGridItems.DataArrayAlloc();
        brain->mGridItemType = GridItemType::GRIDITEM_BRAIN;
        brain->mPosY = -100.125f;
        Schedule(frequency, 1'234'567'891, [&] { board.mChallenge->ZombiquariumUpdate(); });
        const auto first = Bits(brain->mPosY);
        brain->mPosY = 100.25f;
        Schedule(frequency, 765'432'109, [&] { board.mChallenge->ZombiquariumUpdate(); });
        const auto second = Bits(brain->mPosY);
        brain->mPosY = 499.9375f;
        Schedule(frequency, 5'000'000, [&] { board.mChallenge->ZombiquariumUpdate(); });
        Require(brain->mDead, "Zombiquarium brain did not expire at the bottom");
        board.mGridItems.DataArrayFreeAll();
        return std::array{first, second};
    };
    const auto expected = run(100);
    for (int frequency : {1, 30, 60, 144, 200, 240, 1000, 0})
        Require(run(frequency) == expected, "Production brain falling depends on outer update partition");
    board.mZombies.DataArrayFreeAll();
    board.RebuildZombieRowBucket();
    board.mSunMoney = money;
    board.mTutorialState = tutorial;
    board.mHelpDisplayed[AdviceType::ADVICE_ZOMBIQUARIUM_COLLECT_SUN] = help;
    board.mProgressMeterWidth = meter;
    (void)app;
}

inline void Run(LawnApp& app, Board& board)
{
    const auto scene = app.mGameScene;
    app.mGameScene = GameScenes::SCENE_PLAYING;
    board.mZombies.DataArrayFreeAll();
    board.RebuildZombieRowBucket();
    for (auto type : {LawnMowerType::LAWNMOWER_LAWN, LawnMowerType::LAWNMOWER_POOL,
        LawnMowerType::LAWNMOWER_ROOF})
    {
        for (int chomp : {0, 25, 50})
        {
            Source100Hz(app, board, type, chomp);
            const auto expected = Travel(app, board, 100, type, chomp);
            for (int frequency : {1, 30, 60, 144, 200, 240, 1000, 0})
                Require(Travel(app, board, frequency, type, chomp) == expected,
                    "Production mower travel/chomp/reset/reposition depends on update partition");
        }
    }
    PoolAltitude(app, board);
    Brain(app, board);
    app.mGameScene = scene;
    std::cout << "PASS actual mower/brain motion: 100Hz speed samples, chomp resets, explicit segment reset, "
        "pool integer endpoints, brain fall/reposition/death; 1/30/60/100/144/200/240/1000Hz/random\n";
}
}
