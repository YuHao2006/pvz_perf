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
inline Board* scheduleBoard=nullptr;
inline LawnApp* scheduleApp=nullptr;
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
        scheduleBoard->mLevelTimeNs+=end-elapsed;
        scheduleApp->mEffectSystem->mReanimationHolder->mVisualTimeNs+=end-elapsed;
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
        scheduleBoard=&board;scheduleApp=&app;
        mower.mApp = &app;
        mower.mBoard = &board;
        mower.mRow = 2;
        mower.mPosX = -2000.25f; // No accidental pool-edge/board-exit side effects.
        mower.mPosY = 100;
        mower.mMowerState = LawnMowerState::MOWER_TRIGGERED;
        mower.mMowerType = type;
        mower.mMowerHeight = MowerHeight::MOWER_HEIGHT_LAND;
        mower.mChompEndTimeNs = chomp ? static_cast<std::int64_t>(board.mLevelTimeNs)+std::int64_t(chomp)*10'000'000 : 0;
        auto* animation = app.AddReanimation(0, 0, 0, type == LawnMowerType::LAWNMOWER_POOL ?
            ReanimationType::REANIM_POOL_CLEANER : ReanimationType::REANIM_LAWNMOWER);
        animation->ChangeLoopType(ReanimLoopType::REANIM_LOOP);
        mower.mReanimID = app.ReanimationGetID(animation);
    }
    ~MowerFixture() { app.RemoveReanimation(mower.mReanimID); }
};

inline void Travel(LawnApp& app, Board& board,
    int frequency, LawnMowerType type, int chomp)
{
    MowerFixture fixture(app, board, type, chomp);
    auto& mower = fixture.mower;
    const float base = type == LawnMowerType::LAWNMOWER_POOL ? 2.5f : 3.33f;
    float expected = mower.mPosX;
    std::int64_t remaining = std::int64_t(chomp) * 10'000'000;
    const auto update = [&] {
        float speed = base;
        if (remaining > 0)
        {
            remaining = std::uint64_t(remaining) > Sexy::gUpdateIntervalNs
                ? remaining - static_cast<std::int64_t>(Sexy::gUpdateIntervalNs) : 0;
            speed = TodAnimateCurveNs(500'000'000, 0, remaining, base, 1.0f, Curves::BounceSlowMiddle);
        }
        expected += speed * static_cast<float>(Sexy::gUpdateTicks);
        mower.Update();
        Require(Bits(mower.mPosX) == Bits(expected),
            "Mower did not accumulate the current step's chomp speed");
        Require(std::max<std::int64_t>(0,mower.mChompEndTimeNs-static_cast<std::int64_t>(board.mLevelTimeNs)) == remaining,
            "Mower collision countdown did not consume the actual step");
    };
    Schedule(frequency, 712'345'679, update);
    mower.mChompEndTimeNs = static_cast<std::int64_t>(board.mLevelTimeNs)+500'000'000;
    remaining = 500'000'000;
    Schedule(frequency, 423'456'789, update);
    mower.mPosX = expected = -1500.125f;
    Schedule(frequency, 864'197'532, update);
    Require(!mower.mDead, "Mower fixture unexpectedly died");
}

inline void Source100Hz(LawnApp& app, Board& board, LawnMowerType type, int chomp)
{
    MowerFixture fixture(app, board, type, chomp);
    const float base = type == LawnMowerType::LAWNMOWER_POOL ? 2.5f : 3.33f;
    float expected = fixture.mower.mPosX;
    int counter = chomp;
    for (int tick = 0; tick < 100; ++tick)
    {
        float speed = base;
        if (counter > 0)
            speed = TodAnimateCurveNs(500'000'000, 0, std::int64_t(--counter) * 10'000'000,
                base, 1.0f, Curves::BounceSlowMiddle);
        expected += speed;
        Schedule(100, 10'000'000, [&] { fixture.mower.Update(); });
        Require(Bits(fixture.mower.mPosX) == Bits(expected),
            "Production mower changed the 100Hz source chomp speed sequence");
    }
    if (chomp == 50)
    {
        const double loss = double(fixture.mower.mPosX) -
            (-2000.25 + 100.0 * base);
        const double expectedLoss = type == LawnMowerType::LAWNMOWER_POOL ?
            -49.98 : -77.6356;
        Require(std::fabs(loss - expectedLoss) < .02,
            "Mower slowdown distance no longer matches the original 0.5 second curve");
    }
}

inline void PoolAltitude(LawnApp& app, Board& board)
{
    for (bool rising : {false, true})
        for (int frequency : {1, 30, 60, 100, 144, 200, 240, 1000, 0})
        {
            MowerFixture fixture(app, board, LawnMowerType::LAWNMOWER_POOL, 0);
            auto& mower = fixture.mower;
            mower.mPosX = rising ? 700.f : 100.f;
            mower.mMowerHeight = rising ? MowerHeight::MOWER_HEIGHT_UP_TO_LAND :
                MowerHeight::MOWER_HEIGHT_DOWN_TO_POOL;
            mower.mAltitude = rising ? -28.f : 0.f;
            float expected = mower.mAltitude;
            bool complete = false;
            Schedule(frequency, 200'000'000, [&] {
                if (!complete)
                {
                    expected += (rising ? 2.0f : -2.0f) * static_cast<float>(Sexy::gUpdateTicks);
                    complete = rising ? expected >= 0 : expected <= -28;
                    if (complete) expected = 0;
                }
                mower.UpdatePool();
                Require(Bits(mower.mAltitude) == Bits(expected),
                    "Mower pool altitude did not accumulate the current step");
            });
            Require(complete && mower.mAltitude == 0 && mower.mMowerHeight ==
                (rising ? MowerHeight::MOWER_HEIGHT_LAND : MowerHeight::MOWER_HEIGHT_IN_POOL),
                "Mower pool transition missed its altitude boundary");
        }
}

inline void RepeatedChomp(LawnApp& app, Board& board)
{
    for (auto type : {LawnMowerType::LAWNMOWER_LAWN, LawnMowerType::LAWNMOWER_POOL})
    {
        MowerFixture fixture(app, board, type, 0);
        const float base = type == LawnMowerType::LAWNMOWER_POOL ? 2.5f : 3.33f;
        const float speed = TodAnimateCurveNs(500'000'000, 0, 490'000'000,
            base, 1.0f, Curves::BounceSlowMiddle);
        Require(speed > .9f * base, "Repeated collisions should stay near base speed");
        for (int tick = 0; tick < 20; ++tick)
        {
            const float expected = fixture.mower.mPosX + speed;
            fixture.mower.mChompEndTimeNs = static_cast<std::int64_t>(board.mLevelTimeNs)+500'000'000;
            Schedule(100, 10'000'000, [&] { fixture.mower.Update(); });
            Require(Bits(fixture.mower.mPosX) == Bits(expected) && fixture.mower.mChompEndTimeNs-static_cast<std::int64_t>(board.mLevelTimeNs)==490'000'000,
                "Repeated collision did not refresh the start of the 500ms slowdown");
        }
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
            for (int frequency : {1, 30, 60, 100, 144, 200, 240, 1000, 0})
                Travel(app, board, frequency, type, chomp);
        }
    }
    RepeatedChomp(app, board);
    PoolAltitude(app, board);
    Brain(app, board);
    app.mGameScene = scene;
    std::cout << "PASS actual mower/brain motion: original 100Hz chomp samples, actual-step accumulation, "
        "repeated-collision resets, direct reposition, pool altitude boundaries and brain behavior; "
        "1/30/60/100/144/200/240/1000Hz/random\n";
}
}
