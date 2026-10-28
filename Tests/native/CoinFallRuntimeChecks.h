#pragma once
// Game-linked checks of Coin::UpdateFall using discrete motion and actual step sizes.
#include "Lawn/Coin.h"
#include "LawnApp.h"
#include "Lawn/Board.h"
#include "Lawn/System/SaveRecordMapping.h"
#include <array>
#include <bit>
#include <cmath>
#include <random>
#include <stdexcept>

namespace CoinFallRuntime
{
inline LawnApp* scheduleApp=nullptr;
inline void Require(bool value, const char* message)
{
    if (!value) throw std::runtime_error(message);
}
inline void Near(float value, float expected, const char* message)
{
    Require(std::abs(value - expected) < .001f, message);
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
        scheduleApp->mEffectSystem->mReanimationHolder->mVisualTimeNs+=end-elapsed;
        step();
        elapsed = end;
    }
}
inline void Initialize(Coin& coin, LawnApp& app, Board& board, CoinMotion motion)
{
    scheduleApp=&app;
    coin.mApp = &app;
    coin.mBoard = &board;
    coin.mX = coin.mY = 0;
    coin.mVisible = true;
    coin.mRow = coin.mRenderOrder = 0;
    coin.mType = CoinType::COIN_SUN;
    coin.mCoinMotion = motion;
    coin.mPosX = 310.125f; coin.mPosY = 100.25f;
    coin.mCollectX = coin.mCollectY = 0;
    coin.mVelX = .125f; coin.mVelY = -2.375f;
    coin.mWidth = coin.mHeight = 60;
    coin.mGroundY = 10000;
    coin.mScale = 1;
    coin.mAttachmentID = AttachmentID::ATTACHMENTID_NULL;
    coin.mNeedsBouncyArrow = coin.mHasBouncyArrow = false;
    coin.mHitGround = false;
    coin.mIsBeingCollected = coin.mDead = false;
    coin.mDisappearStartTimeNs=INT64_MAX;coin.mBirthTimeNs=app.mEffectSystem->mReanimationHolder->mVisualTimeNs;coin.mFadeEndTimeNs=0;
    coin.mCollectionDistance = 0;
    coin.mUsableSeedType = SeedType::SEED_NONE;
    coin.mPottedPlantSpec.InitializePottedPlant(SeedType::SEED_NONE);
    coin.mTimesDropped = 0;
}
inline auto State(const Coin& coin)
{
    return std::array<std::uint64_t, 6>{
        std::bit_cast<std::uint32_t>(coin.mPosX), std::bit_cast<std::uint32_t>(coin.mPosY),
        std::bit_cast<std::uint32_t>(coin.mVelX), std::bit_cast<std::uint32_t>(coin.mVelY),
        static_cast<std::uint64_t>(coin.mDisappearStartTimeNs==INT64_MAX ? 0 : coin.mApp->mEffectSystem->mReanimationHolder->mVisualTimeNs-coin.mDisappearStartTimeNs),
        std::bit_cast<std::uint32_t>(coin.mScale)};
}
inline void Check(LawnApp& app, Board& board)
{
    struct Restore
    {
        LawnApp& app; GameMode mode; unsigned long long interval; double ticks;
        ~Restore() { app.mGameMode = mode; Sexy::gUpdateIntervalNs = interval; Sexy::gUpdateTicks = ticks; }
    } restore{app, app.mGameMode, Sexy::gUpdateIntervalNs, Sexy::gUpdateTicks};
    app.mGameMode = GameMode::GAMEMODE_MINIGAME_WALLNUT_BOWLING;
    for (const auto motion : {CoinMotion::COIN_MOTION_FROM_PLANT, CoinMotion::COIN_MOTION_COIN,
        CoinMotion::COIN_MOTION_FROM_BOSS, CoinMotion::COIN_MOTION_FROM_SKY,
        CoinMotion::COIN_MOTION_FROM_SKY_SLOW, CoinMotion::COIN_MOTION_FROM_PRESENT})
    {
        Coin coin;
        Initialize(coin, app, board, motion);
        Schedule(100, 10'000'000, [&] { coin.UpdateFall(); });
        Near(coin.mPosX, 310.25f, "Legacy 10ms coin x movement changed");
        Near(coin.mPosY, 97.875f, "Legacy 10ms coin y movement changed");
        const bool present = motion == CoinMotion::COIN_MOTION_FROM_PRESENT;
        const float acceleration = motion == CoinMotion::COIN_MOTION_FROM_PLANT ? .09f :
            motion == CoinMotion::COIN_MOTION_COIN || motion == CoinMotion::COIN_MOTION_FROM_BOSS ? .15f : 0;
        Near(coin.mVelX, present ? .11875f : .125f, "Coin horizontal damping changed");
        Near(coin.mVelY, present ? -2.25625f : -2.375f + acceleration,
            "Coin gravity must follow its position update");
        Require(coin.mDisappearStartTimeNs==INT64_MAX, "Airborne coin advanced ground disappearance timer");
        Schedule(400, 2'500'000, [&] { coin.UpdateFall(); });
        const auto saved = SaveRecordMapping::WriteSaveRecord(coin);
        const auto saveVisualTime=app.mEffectSystem->mReanimationHolder->mVisualTimeNs;
        Coin restored;
        Initialize(restored, app, board, motion);
        SaveRecordMapping::ReadSaveRecord(restored, saved.data());
        restored.mApp = &app; restored.mBoard = &board;
        SaveClockProjection::Bind(restored);
        Schedule(240, 81'234'567, [&] { coin.UpdateFall(); });
        app.mEffectSystem->mReanimationHolder->mVisualTimeNs=saveVisualTime;
        Schedule(240, 81'234'567, [&] { restored.UpdateFall(); });
        Require(State(coin) == State(restored), "Discrete coin flight changed after save/reload");
        restored.mPosX = 412.25f; restored.mPosY = 51.5f;
        restored.mVelX = -.25f; restored.mVelY = -1.25f;
        Schedule(400, 2'500'000, [&] { restored.UpdateFall(); });
        Near(restored.mPosX, 412.1875f, "Coin ignored a public horizontal edit");
        Near(restored.mPosY, 51.1875f, "Coin ignored a public vertical edit");
        const auto before = State(restored);
        Sexy::gUpdateIntervalNs = 0; Sexy::gUpdateTicks = 0;
        restored.UpdateFall();
        Require(State(restored) == before, "Zero-step coin motion changed state");
    }
    Coin partial;
    Initialize(partial, app, board, CoinMotion::COIN_MOTION_FROM_PLANT);
    Schedule(400, 2'500'000, [&] { partial.UpdateFall(); });
    Near(partial.mPosX, 310.15625f, "Coin ignored fractional horizontal step");
    Near(partial.mPosY, 99.65625f, "Coin ignored fractional vertical step");
    Near(partial.mVelY, -2.3525f, "Coin gravity ignored fractional step");

    Coin landed;
    Initialize(landed, app, board, CoinMotion::COIN_MOTION_FROM_SKY);
    landed.mPosY = 100; landed.mVelY = 3; landed.mGroundY = 110;
    Schedule(100, 67'123'457, [&] { landed.UpdateFall(); });
    Require(landed.mPosY == 110 && landed.mPosX == 311 && landed.mHitGround &&
        (app.mEffectSystem->mReanimationHolder->mVisualTimeNs-landed.mDisappearStartTimeNs) == 37'123'457,
        "Legacy landing order or ground disappearance nanoseconds changed");
    for (const bool right : {false,true})
    {
        Coin coin;
        Initialize(coin, app, board, CoinMotion::COIN_MOTION_COIN);
        coin.mPosX = right ? 739.75f : .25f;
        coin.mVelX = right ? .5f : -.5f;
        Schedule(100,10'000'000,[&]{coin.UpdateFall();});
        Require(coin.mPosX == (right ? 740.f : 0.f) &&
            (right ? coin.mVelX < 0 : coin.mVelX > 0), "Coin wall clamp/reversal failed");
    }
    Coin boundary;
    Initialize(boundary, app, board, CoinMotion::COIN_MOTION_COIN);
    boundary.mPosX = 739.5f; boundary.mVelX = .5f;
    Schedule(100,10'000'000,[&]{boundary.UpdateFall();});
    Require(boundary.mPosX == 740 && boundary.mVelX == .5f,
        "Coin wall bounced on equality instead of strict crossing");
    Coin tie;
    Initialize(tie, app, board, CoinMotion::COIN_MOTION_COIN);
    tie.mPosX=739.75f; tie.mVelX=.5f; tie.mPosY=100; tie.mVelY=3; tie.mGroundY=103;
    Schedule(100,10'000'000,[&]{tie.UpdateFall();});
    Require(tie.mPosX == 740 && tie.mPosY == 103 && tie.mVelX == .5f && tie.mVelY == 3,
        "Landing did not precede same-step wall movement");
    Coin boss;
    Initialize(boss, app, board, CoinMotion::COIN_MOTION_FROM_BOSS);
    boss.mPosX=750; boss.mVelX=3;
    Schedule(100,10'000'000,[&]{boss.UpdateFall();});
    Require(boss.mPosX==753 && boss.mVelX==3,"Boss coin lost right-wall exemption");
    for (const auto type : {CoinType::COIN_SMALLSUN,CoinType::COIN_SUN,CoinType::COIN_LARGESUN})
    {
        Coin coin;
        Initialize(coin,app,board,CoinMotion::COIN_MOTION_FROM_PLANT);
        coin.mType=type; coin.mScale=.4f*coin.GetSunScale();
        const auto scale=coin.mScale;
        Schedule(400,2'500'000,[&]{coin.UpdateFall();});
        Near(coin.mScale,scale+.005f,"Plant sun growth ignored the actual step");
        Schedule(240,1'000'000'000,[&]{coin.UpdateFall();});
        Require(coin.mScale==coin.GetSunScale(),"Plant sun growth did not clamp to final scale");
        coin.mScale=.25f*coin.GetSunScale();
        Schedule(100,10'000'000,[&]{coin.UpdateFall();});
        Near(coin.mScale,.25f*coin.GetSunScale()+.02f,"Plant sun scale edit was overwritten by old origin");
    }
}
}
