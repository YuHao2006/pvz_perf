#pragma once
// Game-linked checks of Coin::UpdateFall; no rendering or real save files.
#include "Lawn/Coin.h"
#include "LawnApp.h"
#include "Lawn/Board.h"
#include "Sexy.TodLib/ExponentialCurve.h"
#include "Sexy.TodLib/TodParticle.h"
#include "Sexy.TodLib/Attachment.h"
#include "Lawn/SeedPacket.h"
#include "Lawn/SlotMachineMotion.h"
#include "Lawn/System/SaveRecordMapping.h"
#include <array>
#include <bit>
#include <cmath>
#include <random>
#include <stdexcept>

namespace CoinFallRuntime
{
inline void Require(bool value, const char* message)
{
    if (!value) throw std::runtime_error(message);
}

template<class Step>
void Schedule(int frequency, std::int64_t total, Step step)
{
    std::mt19937_64 random(0x510165);
    for (std::int64_t elapsed = 0, n = 1; elapsed < total; ++n)
    {
        const auto end = frequency ? std::min(total, n * 1'000'000'000 / frequency) :
            std::min(total, elapsed + static_cast<std::int64_t>(random() % 71'000'003 + 1));
        Sexy::gUpdateIntervalNs = end - elapsed;
        Sexy::gUpdateTicks = double(end - elapsed) / 10'000'000;
        step();
        elapsed = end;
    }
}

inline void Initialize(Coin& coin, LawnApp& app, Board& board, CoinMotion motion)
{
    coin.mApp = &app;
    coin.mBoard = &board;
    coin.mX = coin.mY = 0;
    coin.mVisible = true;
    coin.mRow = coin.mRenderOrder = 0;
    coin.mType = CoinType::COIN_SUN;
    coin.mCoinMotion = motion;
    coin.mPosX = coin.mCollectX = 310.125f;
    coin.mPosY = coin.mCollectY = 100.25f;
    coin.mVelX = coin.mFallVelocityX = 0.125f;
    coin.mVelY = coin.mFallVelocityY = -2.375f;
    coin.mWidth = coin.mHeight = 60;
    coin.mGroundY = 10000;
    coin.mScale = 1;
    coin.mFallScaleOrigin = 1;
    coin.mFallScaleElapsedNs = 0;
    coin.mAttachmentID = AttachmentID::ATTACHMENTID_NULL;
    coin.mNeedsBouncyArrow = coin.mHasBouncyArrow = false;
    // Sun landing has no audio effect; exercise the actual first-landing path.
    coin.mHitGround = false;
    coin.mIsBeingCollected = coin.mDead = false;
    coin.mDisappearCounter = 0;
    coin.mCoinAge = 0;
    coin.mFadeCount = 0;
    coin.mCollectionDistance = 0;
    coin.mUsableSeedType = SeedType::SEED_NONE;
    coin.mPottedPlantSpec.InitializePottedPlant(SeedType::SEED_NONE);
    coin.mTimesDropped = 0;
}

inline auto State(const Coin& coin)
{
    return std::array<std::uint64_t, 5>{
        std::bit_cast<std::uint32_t>(coin.mPosX), std::bit_cast<std::uint32_t>(coin.mPosY),
        std::bit_cast<std::uint32_t>(coin.mVelX), std::bit_cast<std::uint32_t>(coin.mVelY),
        static_cast<std::uint64_t>(coin.mDisappearCounter.mNanoseconds)};
}

inline auto ScaleState(const Coin& coin)
{
    return std::array<std::uint64_t, 3>{std::bit_cast<std::uint32_t>(coin.mScale),
        std::bit_cast<std::uint32_t>(coin.mFallScaleOrigin), coin.mFallScaleElapsedNs};
}

inline void Check(LawnApp& app, Board& board)
{
    const auto oldMode = app.mGameMode;
    const auto oldInterval = Sexy::gUpdateIntervalNs;
    const auto oldTicks = Sexy::gUpdateTicks;
    struct Restore
    {
        LawnApp& app;
        GameMode mode;
        unsigned long long interval;
        double ticks;
        ~Restore() { app.mGameMode = mode; Sexy::gUpdateIntervalNs = interval; Sexy::gUpdateTicks = ticks; }
    } restore{app, oldMode, oldInterval, oldTicks};
    app.mGameMode = GameMode::GAMEMODE_MINIGAME_WALLNUT_BOWLING;
    for (auto motion : {CoinMotion::COIN_MOTION_FROM_PLANT, CoinMotion::COIN_MOTION_COIN,
                        CoinMotion::COIN_MOTION_FROM_BOSS, CoinMotion::COIN_MOTION_FROM_SKY,
                        CoinMotion::COIN_MOTION_FROM_SKY_SLOW, CoinMotion::COIN_MOTION_FROM_PRESENT})
    {
        const auto sample = [&](int frequency, std::int64_t duration)
        {
            Coin coin;
            Initialize(coin, app, board, motion);
            Schedule(frequency, duration, [&] { coin.UpdateFall(); });
            return State(coin);
        };
        const auto expected = sample(100, 1'273'192'835);
        for (const int frequency : {200, 1000, 30, 144, 0})
            Require(sample(frequency, 1'273'192'835) == expected,
                "Coin airborne position/velocity depends on update partition");
        Coin coin;
        Initialize(coin, app, board, motion);
        Schedule(100, 700'000'000, [&] { coin.UpdateFall(); });
        const double acceleration = motion == CoinMotion::COIN_MOTION_FROM_PLANT ? double(0.09f) :
            motion == CoinMotion::COIN_MOTION_COIN || motion == CoinMotion::COIN_MOTION_FROM_BOSS ?
                double(0.15f) : 0;
        // Independent 1073 recurrence oracle, evaluated without float feedback.
        long double x = 310.125L, y = 100.25L, vx = .125L, vy = -2.375L;
        for (int n = 0; n < 70; ++n)
        {
            x += vx; y += vy;
            if (motion == CoinMotion::COIN_MOTION_FROM_PRESENT)
            {
                vx *= static_cast<long double>(0.95f); vy *= static_cast<long double>(0.95f);
            }
            else vy += acceleration;
        }
        Require(std::abs(coin.mPosX - double(x)) < 0.00005 &&
                std::abs(coin.mPosY - double(y)) < 0.00005 &&
                std::abs(coin.mVelY - double(vy)) < 0.00001,
            "Coin analytic flight no longer matches the 1073 10ms recurrence");
        // Exercise the production wire mapping, then continue at a different
        // partition. This catches omitted origin velocities in the save tail.
        const auto saved = SaveRecordMapping::WriteSaveRecord(coin);
        Coin resumed;
        Initialize(resumed, app, board, motion);
        SaveRecordMapping::ReadSaveRecord(resumed, saved.data());
        resumed.mApp = &app;
        resumed.mBoard = &board;
        Require(State(resumed) == State(coin) && resumed.mCollectX == coin.mCollectX &&
                resumed.mCollectY == coin.mCollectY &&
                resumed.mFallVelocityX == coin.mFallVelocityX &&
                resumed.mFallVelocityY == coin.mFallVelocityY,
            "Coin save mapping lost airborne segment fields");
        Schedule(100, 312'345'679, [&] { coin.UpdateFall(); });
        Schedule(1000, 312'345'679, [&] { resumed.UpdateFall(); });
        Require(State(coin) == State(resumed), "Restored Coin flight lost its segment origin");
        resumed.mPosX = 412.25f; resumed.mPosY = 51.5f;
        resumed.mVelX = -.25f; resumed.mVelY = -1.25f;
        Coin relocated;
        Initialize(relocated, app, board, motion);
        relocated.mCollectX = relocated.mPosX = resumed.mPosX;
        relocated.mCollectY = relocated.mPosY = resumed.mPosY;
        relocated.mFallVelocityX = relocated.mVelX = resumed.mVelX;
        relocated.mFallVelocityY = relocated.mVelY = resumed.mVelY;
        Schedule(200, 111'111'111, [&] { resumed.UpdateFall(); });
        Schedule(1000, 111'111'111, [&] { relocated.UpdateFall(); });
        Require(State(resumed) == State(relocated), "External Coin relocation/velocity edit did not rebase");
        const auto paused = State(resumed);
        Sexy::gUpdateIntervalNs = 0; Sexy::gUpdateTicks = 0;
        resumed.UpdateFall();
        Require(State(resumed) == paused, "Coin moved during a zero-length update");
    }
    // At n=4 the original pre-move y+v test lands. X keeps n=3's
    // displacement and is rounded once; ground lifetime starts at that tick.
    const auto landed = [&](int frequency)
    {
        Coin coin;
        Initialize(coin, app, board, CoinMotion::COIN_MOTION_FROM_SKY);
        coin.mPosY = coin.mCollectY = 100;
        coin.mVelY = coin.mFallVelocityY = 3;
        coin.mGroundY = 110;
        Schedule(frequency, 67'123'457, [&] { coin.UpdateFall(); });
        Require(coin.mPosY == 110 && coin.mPosX == 311 &&
                coin.mHitGround && coin.mDisappearCounter.mNanoseconds == 37'123'457,
            "Coin landing changed its legacy x position or exact lifetime origin");
        return State(coin);
    };
    const auto expectedLanding = landed(100);
    for (const auto frequency : {200, 1000, 0})
        Require(landed(frequency) == expectedLanding, "Coin landing depends on update partition");
    for (const bool right : {false, true})
    {
        const auto bounced = [&](int frequency)
        {
            Sexy::SRand(0x50166);
            Coin coin;
            Initialize(coin, app, board, CoinMotion::COIN_MOTION_COIN);
            coin.mCollectX = coin.mPosX = right ? 739.75f : .25f;
            coin.mFallVelocityX = coin.mVelX = right ? .5f : -.5f;
            Schedule(frequency, 511'111'111, [&] { coin.UpdateFall(); });
            Require(coin.mPosX >= 0 && coin.mPosX <= 740 &&
                    (right ? coin.mVelX < 0 : coin.mVelX > 0),
                "Coin wall event failed to clamp and reverse velocity");
            return State(coin);
        };
        const auto expectedBounce = bounced(100);
        for (const auto frequency : {200, 1000, 0})
            Require(bounced(frequency) == expectedBounce,
                "Coin wall collision or its random velocity depends on update partition");
    }
    Coin boundary;
    Initialize(boundary, app, board, CoinMotion::COIN_MOTION_COIN);
    boundary.mCollectX = boundary.mPosX = 739.5f;
    boundary.mFallVelocityX = boundary.mVelX = .5f;
    Schedule(100, 10'000'000, [&] { boundary.UpdateFall(); });
    Require(boundary.mPosX == 740 && boundary.mVelX == .5f,
        "Coin wall bounced at equality instead of the original strict boundary");
    Schedule(1000, 10'000'000, [&] { boundary.UpdateFall(); });
    Require(boundary.mPosX == 740 && boundary.mVelX < 0,
        "Coin wall failed to bounce on the first legacy tick past the boundary");
    Coin tie;
    Initialize(tie, app, board, CoinMotion::COIN_MOTION_COIN);
    tie.mCollectX = tie.mPosX = 739.75f;
    tie.mFallVelocityX = tie.mVelX = .5f;
    tie.mCollectY = tie.mPosY = 100;
    tie.mFallVelocityY = tie.mVelY = 3;
    tie.mGroundY = 103;
    Schedule(1000, 10'000'000, [&] { tie.UpdateFall(); });
    Require(tie.mPosX == 740 && tie.mPosY == 103 && tie.mVelX == .5f && tie.mVelY == 3,
        "Coin landing did not take precedence over same-tick wall movement");
    Coin boss;
    Initialize(boss, app, board, CoinMotion::COIN_MOTION_FROM_BOSS);
    boss.mCollectX = boss.mPosX = 750;
    boss.mFallVelocityX = boss.mVelX = 3;
    Schedule(1000, 10'000'000, [&] { boss.UpdateFall(); });
    Require(boss.mPosX == 753 && boss.mVelX == 3,
        "Boss award coin lost its original right-wall exemption");
    // Counter precision survives clocks beyond double's consecutive-integer
    // range. A stationary sky coin isolates elapsed-time preservation.
    Coin longClock;
    Initialize(longClock, app, board, CoinMotion::COIN_MOTION_FROM_SKY);
    longClock.mVelX = longClock.mFallVelocityX = 0;
    longClock.mVelY = longClock.mFallVelocityY = 0;
    longClock.mDisappearCounter.mNanoseconds = 9'007'199'254'740'993LL;
    Sexy::gUpdateIntervalNs = 1; Sexy::gUpdateTicks = 1e-7;
    longClock.UpdateFall();
    Require(longClock.mDisappearCounter.mNanoseconds == 9'007'199'254'740'994LL &&
            longClock.mPosX == 310.125f && longClock.mPosY == 100.25f,
        "Coin flight lost a nanosecond on a long-running clock");
    for (const auto type : {CoinType::COIN_SMALLSUN, CoinType::COIN_SUN, CoinType::COIN_LARGESUN})
    {
        const auto initializeScale = [&](Coin& coin)
        {
            Initialize(coin, app, board, CoinMotion::COIN_MOTION_FROM_PLANT);
            coin.mType = type;
            coin.mScale = coin.mFallScaleOrigin = 0.4f * coin.GetSunScale();
        };
        for (const std::int64_t duration : {143'123'457LL, 312'345'679LL, 1'000'000'000LL})
        {
            const auto grown = [&](int frequency)
            {
                Coin coin;
                initializeScale(coin);
                Schedule(frequency, duration, [&] { coin.UpdateFall(); });
                Require(coin.mScale <= coin.GetSunScale(), "Plant sun growth overshot its final scale");
                if (duration == 1'000'000'000)
                    Require(coin.mScale == coin.GetSunScale(), "Plant sun failed to reach its scale cap");
                return ScaleState(coin);
            };
            const auto expected = grown(100);
            for (const int frequency : {200, 1000, 0})
                Require(grown(frequency) == expected, "Plant sun growth or capped clock depends on partition");
        }
        Coin original;
        initializeScale(original);
        Schedule(1000, 143'123'457, [&] { original.UpdateFall(); });
        const auto saved = SaveRecordMapping::WriteSaveRecord(original);
        Coin restored;
        initializeScale(restored);
        SaveRecordMapping::ReadSaveRecord(restored, saved.data());
        restored.mApp = &app;
        restored.mBoard = &board;
        Require(State(restored) == State(original) && ScaleState(restored) == ScaleState(original),
            "Coin save mapping lost the active scale segment");
        Schedule(100, 181'234'567, [&] { original.UpdateFall(); });
        Schedule(1000, 181'234'567, [&] { restored.UpdateFall(); });
        Require(State(restored) == State(original) && ScaleState(restored) == ScaleState(original),
            "Restored Coin flight/growth differs from uninterrupted simulation");
        Coin paused;
        initializeScale(paused);
        Schedule(200, 81'234'567, [&] { paused.UpdateFall(); });
        const auto beforePause = State(paused);
        const auto scaleBeforePause = ScaleState(paused);
        const auto previousScene = app.mGameScene;
        app.mGameScene = GameScenes::SCENE_MENU;
        Schedule(1000, 5'000'000'000LL, [&] { paused.Update(); });
        app.mGameScene = previousScene;
        Require(State(paused) == beforePause && ScaleState(paused) == scaleBeforePause &&
                paused.mCoinAge.mNanoseconds == 5'000'000'000LL,
            "Scene freeze advanced Coin flight/growth or failed to exercise the independent age clock");
        Coin reference;
        initializeScale(reference);
        Schedule(100, 81'234'567, [&] { reference.UpdateFall(); });
        Schedule(200, 41'234'567, [&] { paused.UpdateFall(); });
        Schedule(1000, 41'234'567, [&] { reference.UpdateFall(); });
        Require(State(paused) == State(reference) && ScaleState(paused) == ScaleState(reference),
            "Plant sun growth jumped after resuming a scene freeze");
        paused.mScale = .25f * paused.GetSunScale();
        reference.mScale = paused.mScale;
        Schedule(200, 81'234'567, [&] { paused.UpdateFall(); });
        Schedule(1000, 81'234'567, [&] { reference.UpdateFall(); });
        Require(ScaleState(paused) == ScaleState(reference) &&
                paused.mFallScaleOrigin == .25f * paused.GetSunScale(),
            "External Coin scale edit did not rebase its analytic growth");
        const auto zeroScale = ScaleState(paused);
        Sexy::gUpdateIntervalNs = 0; Sexy::gUpdateTicks = 0;
        paused.UpdateFall();
        Require(ScaleState(paused) == zeroScale, "Plant sun growth advanced during zero-length update");
    }
}
} // namespace CoinFallRuntime
