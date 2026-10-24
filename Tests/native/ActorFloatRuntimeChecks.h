#pragma once
#include "CoinFallRuntimeChecks.h"
#include "MowerMotionRuntimeChecks.h"
#include "ZombieAltitudeRuntimeChecks.h"
#include "CreditsScrollRuntimeChecks.h"
// Included by the game-linked static-definition fixture. These checks execute
// real Plant/Zombie methods, real Board pools/buckets and real source animation.
#include "Lawn/Board.h"
#include "Resources.h"
#include "Lawn/Plant.h"
#include "Lawn/PlantLaunchClock.h"
#include "Lawn/System/PlayerInfo.h"
#include "Lawn/Projectile.h"
#include "Lawn/SeedPacket.h"
#include "Lawn/Coin.h"
#include "Lawn/LawnMower.h"
#include "Lawn/GridItem.h"
#include "Lawn/CursorObject.h"
#include "Lawn/MessageWidget.h"
#include "Lawn/System/Music.h"
#include "Lawn/Challenge.h"
#include "Lawn/GridItem.h"
#include "Lawn/Zombie.h"
#include "Lawn/Motion.h"
#include "Lawn/MagnetMotion.h"
#include "Sexy.TodLib/Attachment.h"
#include "Sexy.TodLib/TodParticle.h"
#include "Sexy.TodLib/EffectSystem.h"
#include "Sexy.TodLib/ExponentialCurve.h"
#include "Sexy.TodLib/generated/SceneAtlasData.h"
#include "Lawn/System/SaveRecordMapping.h"
#include "SexyAppFramework/misc/ResourceManager.h"
#include <array>
#include <bit>
#include <memory>
#include <random>
#include <stdexcept>
#include <vector>

namespace MowerMotionRuntime
{
inline void SaveContinuation(LawnApp& app, Board& board)
{
    const auto scene = app.mGameScene;
    app.mGameScene = GameScenes::SCENE_PLAYING;
    for (const bool poolTransition : {false, true})
    {
        MowerFixture fixture(app, board, LawnMowerType::LAWNMOWER_POOL, 50);
        auto& mower = fixture.mower;
        if (poolTransition)
        {
            mower.mMowerHeight = MowerHeight::MOWER_HEIGHT_DOWN_TO_POOL;
            mower.mPosX = 100;
        }
        const auto update = [&] {
            if (poolTransition) mower.UpdatePool();
            else mower.Update();
        };
        Schedule(144, 73'456'789, update);
        const auto record = SaveRecordMapping::WriteSaveRecord(mower);
        const auto sample = [&] {
            Schedule(1000, 23'456'789, update);
            return std::array<std::uint64_t, 6>{
                Bits(mower.mPosX), Bits(mower.mAltitude),
                std::bit_cast<std::uint64_t>(mower.mMotionOriginX),
                mower.mMotionElapsedNs, mower.mAltitudeElapsedNs,
                static_cast<std::uint64_t>(mower.mChompCounter.mNanoseconds)};
        };
        const auto uninterrupted = sample();
        SaveRecordMapping::ReadSaveRecord(mower, record.data());
        mower.mApp = &app;
        mower.mBoard = &board;
        Require(sample() == uninterrupted,
            "Mower flight/chomp/pool phase changed after actual native save/reload");
    }
    app.mGameScene = scene;
}
}

namespace ActorFloatRuntime
{
inline void Require(bool condition, const char* text)
{
    if (!condition) throw std::runtime_error(text);
}

template<class Step>
void Schedule(int frequency, std::int64_t duration, Step step)
{
    std::mt19937_64 random(0x60191);
    for (std::int64_t elapsed = 0, n = 1; elapsed < duration; ++n)
    {
        const auto end = frequency ? std::min(duration, n * 1'000'000'000 / frequency) :
            std::min(duration, elapsed + static_cast<std::int64_t>(random() % 71'000'003 + 1));
        Sexy::gUpdateIntervalNs = end - elapsed;
        Sexy::gUpdateTicks = static_cast<double>(end - elapsed) / 10'000'000;
        Sexy::gWholeLegacyTicks = 0;
        step(end - elapsed);
        elapsed = end;
    }
}

inline std::uint64_t Bits(float value) { return std::bit_cast<std::uint32_t>(value); }
inline std::uint64_t Bits(double value) { return std::bit_cast<std::uint64_t>(value); }

inline void PublishTime(LawnApp& app, std::int64_t delta)
{
    auto& clocks = *app.mEffectSystem->mReanimationHolder;
    clocks.mBattleTimeNs = ReanimClock::Add(clocks.mBattleTimeNs, delta);
    clocks.mVisualTimeNs = ReanimClock::Add(clocks.mVisualTimeNs, delta);
}

inline void SharedClockConsumers(Board& board)
{
    const auto oldTime = board.mLevelTimeNs;
    const auto oldWave = board.mCurrentWave, oldWaves = board.mNumWaves;
    const auto oldWidth = board.mProgressMeterWidth;
    const auto oldHealth = board.mZombieHealthToNextWave;
    const auto oldCountdown = board.mZombieCountDown, oldStart = board.mZombieCountDownStart;
    const auto oldFlag = board.mFlagRaiseCounter;
    board.mCurrentWave = 2;
    board.mNumWaves = 10;
    board.mZombieHealthToNextWave = -1;
    board.mZombieCountDownStart = 100;
    board.mZombieCountDown = 0;
    board.mFlagRaiseCounter = 0;
    board.mProgressMeterWidth = 0;
    board.mLevelTimeNs = 49'999'999;
    board.UpdateProgressMeter(1);
    Require(board.mProgressMeterWidth == 0, "Progress event fired before its nanosecond boundary");
    board.mLevelTimeNs += 1;
    board.UpdateProgressMeter(1);
    Require(board.mProgressMeterWidth == 1, "Progress event missed an exact nanosecond boundary");
    board.mLevelTimeNs += 1;
    board.UpdateProgressMeter(1);
    board.UpdateProgressMeter(0);
    Require(board.mProgressMeterWidth == 1, "Progress event repeated within the same interval");
    board.mLevelTimeNs += 71'234'567;
    board.UpdateProgressMeter(71'234'567);
    Require(board.mProgressMeterWidth == 2, "Progress event missed a boundary crossed by a variable step");
    board.mLevelTimeNs = oldTime;
    board.mCurrentWave = oldWave;
    board.mNumWaves = oldWaves;
    board.mProgressMeterWidth = oldWidth;
    board.mZombieHealthToNextWave = oldHealth;
    board.mZombieCountDown = oldCountdown;
    board.mZombieCountDownStart = oldStart;
    board.mFlagRaiseCounter = oldFlag;

    GameObject object;
    object.mX = 12.25f;
    object.mY = -3.5f;
    Sexy::Graphics graphics;
    const auto x = graphics.mTransX, y = graphics.mTransY;
    Require(object.BeginDraw(&graphics) && graphics.mTransX == x + object.mX &&
        graphics.mTransY == y + object.mY, "GameObject drawing discarded fractional coordinates");
    object.EndDraw(&graphics);
    Require(graphics.mTransX == x && graphics.mTransY == y,
        "GameObject drawing did not restore its floating-point translation");
    std::cout << "PASS raw level-clock consumers: variable-step boundary events, zero-step stability, float drawing\n";
}

inline void LaunchDeadlines(LawnApp& app, Board& board)
{
    const auto previousMode = app.mGameMode;
    const auto previousScene = app.mGameScene;
    const auto previousProfile = app.mPlayerInfo;
    // Adventure target acquisition calls IsWallnutBowlingLevel, which reads
    // the active profile's level. The definition-only fixture has no profile.
    PlayerInfo profile;
    profile.mLevel = 1;
    app.mPlayerInfo = &profile;
    struct RestoreLaunchContext
    {
        LawnApp& app;
        GameMode mode;
        GameScenes scene;
        PlayerInfo* profile;
        ~RestoreLaunchContext()
        {
            app.mGameMode = mode;
            app.mGameScene = scene;
            app.mPlayerInfo = profile;
        }
    } restoreContext{app, previousMode, previousScene, previousProfile};
    app.mGameMode = GameMode::GAMEMODE_ADVENTURE;
    app.mGameScene = GameScenes::SCENE_PLAYING;
    board.mZombies.DataArrayFreeAll();
    board.RebuildZombieRowBucket();
    const auto run = [&](int frequency) {
        Sexy::SRand(0x601982);
        board.mLevelTimeNs = 0;
        Plant plant;
        plant.mSeedType = SeedType::SEED_PEASHOOTER;
        plant.mRow = 2;
        plant.mShootingCounter = 0;
        plant.mLaunchRate = 150;
        plant.mNextLaunchTimeNs = 123'456'789;
        plant.mLaunchWindowStartNs = 0;
        Schedule(frequency, 12'718'281'829, [&](std::int64_t delta) {
            board.mLevelTimeNs += delta;
            plant.UpdateShooter();
        });
        Require(plant.mNextLaunchTimeNs > board.mLevelTimeNs,
            "Production shooter did not consume elapsed firing periods");
        Require(plant.mNextLaunchTimeNs % PlantLaunchClock::Tick != 0,
            "Production shooter randomized only on legacy tick boundaries");
        return plant.mNextLaunchTimeNs;
    };
    const auto expected = run(100);
    for (int frequency : {30, 60, 144, 200, 240, 1000, 0})
        Require(run(frequency) == expected,
            "Production shooter deadline depends on outer update partition");

    Plant paused;
    paused.mSeedType = SeedType::SEED_PEASHOOTER;
    paused.mState = PlantState::STATE_READY;
    paused.mIsOnBoard = true;
    paused.mIsAsleep = true;
    paused.mSquished = true;
    paused.mDisappearCountdown = 1000;
    paused.mWakeUpCounter = 0;
    paused.mPlantHealth = 300;
    paused.mRecentlyEatenCountdown = 0;
    paused.mEatenFlashCountdown = 0;
    paused.mBeghouledFlashCountdown = 0;
    paused.mBodyReanimID = ReanimationID::REANIMATIONID_NULL;
    paused.mLaunchWindowStartNs = 1'000'000'000;
    paused.mNextLaunchTimeNs = 1'712'345'678;
    board.mLevelTimeNs = 1'237'192'835;
    paused.Update(237'192'835);
    Require(paused.mNextLaunchTimeNs == 1'949'538'513 &&
        paused.mLaunchWindowStartNs == board.mLevelTimeNs,
        "Production paused plant did not preserve its exact remaining launch time");
    const auto frozenDeadline = paused.mNextLaunchTimeNs;
    paused.Update(0);
    Require(paused.mNextLaunchTimeNs == frozenDeadline,
        "Plant shifted a deadline while the level clock was stopped");
    paused.Update(237'192'835);
    Require(paused.mNextLaunchTimeNs == frozenDeadline,
        "Plant newly anchored at this step's endpoint was frozen for time before its creation");
    paused.mIsAsleep = paused.mSquished = false;
    paused.mShootingCounter = 100;
    paused.mLaunchRate = 150;
    board.mLevelTimeNs += 9'000'000'001;
    const auto shooting = paused.mShootingCounter.mNanoseconds;
    paused.UpdateShooter();
    Require(paused.mNextLaunchTimeNs > board.mLevelTimeNs &&
        paused.mShootingCounter.mNanoseconds == shooting,
        "Large update restarted an unfinished shooting action");
    std::cout << "PASS actual Plant launch deadlines: ns randomness, exact partitions, "
        "paused remaining time and unfinished attack gating\n";
}

inline std::array<std::uint64_t, 8> Bowling(LawnApp& app, Board& board,
    int frequency, SeedType seed)
{
    const auto previousGround = board.mGridSquareType[0][1];
    struct RestoreBowlingGround
    {
        Board& board;
        GridSquareType type;
        ~RestoreBowlingGround() { board.mGridSquareType[0][1] = type; }
    } restoreGround{board, previousGround};
    board.mGridSquareType[0][1] = GridSquareType::GRIDSQUARE_HIGH_GROUND;
    board.mPlants.DataArrayFreeAll();
    board.RebuildPlantCellBucket();
    app.mEffectSystem->EffectSystemFreeAll();
    app.mEffectSystem->mReanimationHolder->mBattleTimeNs = 0;
    app.mEffectSystem->mReanimationHolder->mVisualTimeNs = 0;
    auto* plant = board.mPlants.DataArrayAlloc();
    plant->mSeedType = seed;
    plant->mState = PlantState::STATE_BOWLING_UP;
    plant->mRow = 2;
    plant->mPlantCol = 0;
    plant->mX = -500.123413f;
    plant->mY = static_cast<float>(board.GridToPixelY(0, 2));
    plant->mWidth = plant->mHeight = 80;
    plant->mDead = false;
    plant->mIsOnBoard = false;
    board.RebuildPlantCellBucket();
    auto* animation = app.AddReanimation(0, 0, 0, ReanimationType::REANIM_WALLNUT);
    animation->BindTimeDomain(ReanimTimeDomain::Battle);
    animation->SetFramesForLayer(ReanimTrackId::_ground);
    animation->ApplyRate(15.3072289f);
    animation->SeekRatio(0.3372819f);
    plant->mBodyReanimID = app.ReanimationGetID(animation);
    const auto scale = seed == SeedType::SEED_GIANT_WALLNUT ? -2.0f : -1.0f;
    const auto initialRoot = animation->RootMotion(ReanimTrackId::_ground, scale);
    constexpr std::int64_t duration = 1'234'567'891;
    const auto expectedX = CheckedPosition((double(plant->mX) - initialRoot) +
        animation->RootMotion(ReanimTrackId::_ground, scale, duration));
    AdvanceRoot(*plant, *animation, scale, 0);
    Schedule(frequency, duration, [&](std::int64_t delta) {
        PublishTime(app, delta);
        plant->UpdateBowling();
        animation->UpdateAt(app.mEffectSystem->mReanimationHolder->mBattleTimeNs);
        if (app.mEffectSystem->mReanimationHolder->mBattleTimeNs < 10'000'000)
            Require(plant->mY != static_cast<float>(board.GridToPixelY(0, 2)),
                "Production bowling waits for a fixed 10ms vertical substep");
    });
    Require(!plant->mDead && plant->mX == expectedX,
        "Production bowling position differs from anchored root interpolation");
    Require(plant->mRow != 2 && plant->mBowlingRowArrivalTimeNs > duration &&
        plant->mY == CheckedPosition(double(board.GridToPixelY(0, plant->mRow)) +
            (plant->mState == PlantState::STATE_BOWLING_UP ? 1.0 : -1.0) *
            (plant->mBowlingRowArrivalTimeNs - duration) / 5'000'000.0),
        "Production bowling did not interpolate its absolute row-arrival deadline");
    Require(board.GetCellPlant(plant->mRow, plant->mPlantCol, PLANT_CELL_NORMAL) == plant,
        "Production bowling row transition did not update the real plant bucket");
    return {Bits(plant->mX), Bits(plant->mY), std::uint64_t(plant->mRow), std::uint64_t(plant->mState),
        std::uint64_t(plant->mBowlingRowArrivalTimeNs), Bits(plant->mRootOriginX),
        std::uint64_t(animation->SamplePlayback().phaseNs),
        std::uint64_t(animation->SamplePlayback().cycles)};
}

inline void GiantBowlingImpact(LawnApp& app, Board& board)
{
    // The game-linked fixture has renderer/resources but no audio device.
    struct RestoreBowlingMute
    {
        LawnApp& app;
        bool previous;
        ~RestoreBowlingMute() { app.mMuteSoundsForCutscene = previous; }
    } restoreMute{app, app.mMuteSoundsForCutscene};
    app.mMuteSoundsForCutscene = true;
    board.mPlants.DataArrayFreeAll();
    board.RebuildPlantCellBucket();
    board.mZombies.DataArrayFreeAll();
    board.RebuildZombieRowBucket();
    app.mEffectSystem->EffectSystemFreeAll();
    auto* plant = board.mPlants.DataArrayAlloc();
    plant->mApp = &app;
    plant->mBoard = &board;
    plant->mSeedType = SeedType::SEED_GIANT_WALLNUT;
    plant->mState = PlantState::STATE_NOTREADY;
    plant->mRow = 2;
    plant->mPlantCol = 0;
    plant->mX = 300;
    plant->mY = static_cast<float>(board.GridToPixelY(0, 2));
    plant->mWidth = plant->mHeight = 80;
    plant->mIsOnBoard = false;
    board.RebuildPlantCellBucket();
    auto* zombie = board.mZombies.DataArrayAlloc();
    zombie->mApp = &app;
    zombie->mBoard = &board;
    zombie->mZombieType = ZombieType::ZOMBIE_NORMAL;
    zombie->mZombiePhase = ZombiePhase::PHASE_ZOMBIE_NORMAL;
    zombie->mZombieHeight = ZombieHeight::HEIGHT_ZOMBIE_NORMAL;
    zombie->mScaleZombie = 1;
    zombie->mRow = 2;
    zombie->mX = 320;
    zombie->mY = plant->mY;
    zombie->mZombieRect = Rect(0, 0, 40, 100);
    zombie->mWidth = 40;
    zombie->mHeight = 100;
    zombie->mBodyHealth = zombie->mBodyMaxHealth = 10'000'000;
    zombie->mHasHead = true;
    board.RebuildZombieRowBucket();
    Require(plant->FindTargetZombie(2, PlantWeapon::WEAPON_PRIMARY) == zombie,
        "Production giant bowling fixture did not acquire its real collision target");
    for (const std::int64_t delta : {1LL, 1'234'567LL, 900'000'001LL})
    {
        Sexy::gUpdateIntervalNs = delta;
        PublishTime(app, delta);
        const int before = zombie->mBodyHealth;
        plant->UpdateBowling();
        Require(zombie->mBodyHealth == before - 1'000'000 &&
            plant->mState == PlantState::STATE_NOTREADY && plant->mBowlingRowArrivalTimeNs == 0,
            "Production giant bowling damage depends on 100Hz substeps or a hit cooldown");
    }
    board.mPlants.DataArrayFreeAll();
    board.RebuildPlantCellBucket();
    board.mZombies.DataArrayFreeAll();
    board.RebuildZombieRowBucket();
    std::cout << "PASS actual giant bowling collision: one million damage per outer step, "
        "including a one-nanosecond step, without a cooldown\n";
}

inline std::array<std::uint64_t, 6> Walking(LawnApp& app, Board& board, int frequency,
    bool additionalMotion = false)
{
    app.mEffectSystem->EffectSystemFreeAll();
    app.mEffectSystem->mReanimationHolder->mBattleTimeNs = 0;
    app.mEffectSystem->mReanimationHolder->mVisualTimeNs = 0;
    Zombie zombie{};
    zombie.mZombieType = ZombieType::ZOMBIE_NORMAL;
    zombie.mZombiePhase = ZombiePhase::PHASE_ZOMBIE_NORMAL;
    zombie.mZombieHeight = ZombieHeight::HEIGHT_ZOMBIE_NORMAL;
    zombie.mScaleZombie = 1.3372819f;
    zombie.mX = 712.349243f;
    zombie.mY = 200.0f;
    zombie.mFromWave = 0;
    zombie.mBlowingAway = additionalMotion;
    auto* animation = app.AddReanimation(0, 0, 0, ReanimationType::REANIM_ZOMBIE);
    animation->BindTimeDomain(ReanimTimeDomain::Battle);
    animation->PlayReanim(ReanimTrackId::anim_walk, ReanimLoopType::REANIM_LOOP, 0, 13.3072289f);
    animation->SeekRatio(0.3372819f);
    zombie.mBodyReanimID = app.ReanimationGetID(animation);
    const auto initialRoot = animation->RootMotion(ReanimTrackId::_ground, -zombie.mScaleZombie);
    constexpr std::int64_t duration = 2'718'281'829;
    const auto expectedX = CheckedPosition((double(zombie.mX) - initialRoot) +
        animation->RootMotion(ReanimTrackId::_ground, -zombie.mScaleZombie, duration) +
        (additionalMotion ? 9.5 * duration / 10'000'000.0 : 0.0));
    AdvanceRoot(zombie, *animation, -zombie.mScaleZombie, 0);
    Schedule(frequency, duration, [&](std::int64_t delta) {
        PublishTime(app, delta);
        if (additionalMotion) zombie.mPendingAdditionalSpeedX = -0.5f;
        zombie.UpdateZombieWalking();
        animation->UpdateAt(app.mEffectSystem->mReanimationHolder->mBattleTimeNs);
    });
    Require(zombie.mX == expectedX,
        "Production zombie walking differs from anchored root interpolation");
    // A direct teleport invalidates its binding at the write event.
    zombie.mX += 91.123413f;
    zombie.mRootBindingGeneration = 0;
    const auto teleported = zombie.mX;
    Sexy::gUpdateIntervalNs = 0;
    zombie.UpdateZombieWalking();
    Require(zombie.mX == teleported, "Root binding erased an explicit teleport");
    return {Bits(zombie.mX), Bits(zombie.mY), Bits(zombie.mRootOriginX),
        Bits(zombie.mRootScale), std::uint64_t(animation->SamplePlayback().phaseNs),
        std::uint64_t(animation->SamplePlayback().cycles)};
}

inline void Projectiles(LawnApp& app, Board& board)
{
    // Use the production mute switch: impact and chill still execute their real
    // gameplay paths without requiring the fixture to initialize an audio device.
    struct RestoreMute
    {
        LawnApp& app;
        bool previous;
        ~RestoreMute() { app.mMuteSoundsForCutscene = previous; }
    } restoreMute{app, app.mMuteSoundsForCutscene};
    app.mMuteSoundsForCutscene = true;
    Sexy::gUpdateIntervalNs = 10'000'000;
    Sexy::gUpdateTicks = 1.0;
    Sexy::gWholeLegacyTicks = 1;
    const auto originalBackground = board.mBackground;
    const auto originalMode = app.mGameMode;
    const auto run = [&](ProjectileMotion motion, ProjectileType type, int frequency,
        bool roof, bool highGravity) {
        board.mProjectiles.DataArrayFreeAll();
        board.mZombies.DataArrayFreeAll();
        board.RebuildZombieRowBucket();
        app.mEffectSystem->EffectSystemFreeAll();
        board.mLevelTimeNs = 0;
        board.mBackground = roof ? BackgroundType::BACKGROUND_5_ROOF : originalBackground;
        app.mGameMode = highGravity ? GameMode::GAMEMODE_LIMBO_HIGH_GRAVITY : originalMode;
        auto* shot = board.AddProjectile(321, 251, 0, 2, type);
        shot->mMotionType = motion;
        shot->mVelX = 3.312713f;
        shot->mVelY = motion == ProjectileMotion::MOTION_THREEPEATER ? -3.0f : 0.312713f;
        shot->mVelZ = motion == ProjectileMotion::MOTION_FLOAT_OVER ? -0.1317f : -7.318291f;
        shot->mAccZ = 0.115f;
        shot->mOriginRotation = shot->mRotation = 0.312713f;
        shot->mRotationSpeed = 0.037281f;
        if (type == ProjectileType::PROJECTILE_COBBIG)
        {
            shot->mVelX = 0.001f;
            shot->mVelY = 0;
            shot->mVelZ = -8;
            shot->mAccZ = 0;
            shot->mCobTargetX = 600;
            shot->mCobTargetRow = 3;
        }
        const auto duration = type == ProjectileType::PROJECTILE_COBBIG ? 950'000'000LL : 130'123'457LL;
        Schedule(frequency, duration, [&](std::int64_t delta) {
            board.mLevelTimeNs += delta;
            shot->UpdateMotion();
        });
        Require(!shot->mDead && shot->mX == int(shot->mPosX) &&
            shot->mY == int(shot->mPosY + shot->mPosZ),
            "Analytic production projectile lost its collision pixel cache");
        if (type == ProjectileType::PROJECTILE_COBBIG)
            Require(shot->mVelZ == 8 && shot->mRow == 3 &&
                shot->mMotionOriginTimeNs == 890'000'000,
                "Production cob changed its original ascent/teleport/descent event");
        return std::array<std::uint64_t, 8>{Bits(shot->mPosX), Bits(shot->mPosY), Bits(shot->mPosZ),
            Bits(shot->mShadowY), Bits(shot->mRotation), std::uint64_t(shot->mRow),
            std::uint64_t(shot->mCreationTimeNs), std::uint64_t(shot->mMotionOriginTimeNs)};
    };
    const struct { ProjectileMotion motion; ProjectileType type; } cases[]{
        {ProjectileMotion::MOTION_STRAIGHT, ProjectileType::PROJECTILE_SNOWPEA},
        {ProjectileMotion::MOTION_BACKWARDS, ProjectileType::PROJECTILE_PEA},
        {ProjectileMotion::MOTION_STAR, ProjectileType::PROJECTILE_STAR},
        {ProjectileMotion::MOTION_LOBBED, ProjectileType::PROJECTILE_KERNEL},
        {ProjectileMotion::MOTION_THREEPEATER, ProjectileType::PROJECTILE_PEA},
        {ProjectileMotion::MOTION_BEE, ProjectileType::PROJECTILE_PEA},
        {ProjectileMotion::MOTION_BEE_BACKWARDS, ProjectileType::PROJECTILE_PEA},
        {ProjectileMotion::MOTION_FLOAT_OVER, ProjectileType::PROJECTILE_PEA},
        {ProjectileMotion::MOTION_LOBBED, ProjectileType::PROJECTILE_COBBIG}
    };
    for (const auto& item : cases)
      for (bool roof : {false, true})
       for (bool highGravity : {false, true})
    {
        const auto expected = run(item.motion, item.type, 100, roof, highGravity);
        for (int frequency : {30, 60, 144, 200, 240, 1000, 0})
            Require(run(item.motion, item.type, frequency, roof, highGravity) == expected,
                "Production analytic projectile depends on outer update partition");
    }
    board.mBackground = originalBackground;
    app.mGameMode = originalMode;
    for (const auto type : {ProjectileType::PROJECTILE_SNOWPEA,
        ProjectileType::PROJECTILE_KERNEL})
    {
        board.mProjectiles.DataArrayFreeAll();
        board.mZombies.DataArrayFreeAll();
        board.RebuildZombieRowBucket();
        app.mEffectSystem->EffectSystemFreeAll();
        board.mLevelTimeNs = 0;
        auto* projectile = board.AddProjectile(321, 251, 0, 2, type);
        Require(projectile->mX == 321 && projectile->mY == 251,
            "Production projectile birth did not synchronize pixel coordinates");
        if (type == ProjectileType::PROJECTILE_KERNEL)
        {
            projectile->mMotionType = ProjectileMotion::MOTION_LOBBED;
            projectile->mVelX = 3.25f;
            projectile->mVelY = 0.5f;
            projectile->mVelZ = -1.5f;
            projectile->mAccZ = 0.1f;
        }
        projectile->mDamageRangeFlags = 1 << int(DamageRangeFlags::DAMAGES_GROUND);
        const auto initialRect = projectile->GetProjectileRect();
        board.mLevelTimeNs = 10'000'000;
        projectile->UpdateMotion();
        const auto movedRect = projectile->GetProjectileRect();
        Require(!projectile->mDead && projectile->mPosX > 321 &&
            projectile->mX == int(projectile->mPosX) &&
            projectile->mY == int(projectile->mPosY + projectile->mPosZ),
            "Production projectile motion did not synchronize pixel coordinates");
        Require(movedRect.mX - initialRect.mX == projectile->mX - 321 &&
            movedRect.mX > initialRect.mX,
            "Production projectile collision rectangle did not follow motion");

        auto* zombie = board.mZombies.DataArrayAlloc();
        zombie->mZombieType = ZombieType::ZOMBIE_NORMAL;
        zombie->mZombiePhase = ZombiePhase::PHASE_ZOMBIE_NORMAL;
        zombie->mZombieHeight = ZombieHeight::HEIGHT_ZOMBIE_NORMAL;
        zombie->mScaleZombie = 1.0f;
        zombie->mRow = projectile->mRow;
        zombie->mX = static_cast<float>(movedRect.mX);
        zombie->mY = static_cast<float>(movedRect.mY);
        zombie->mZombieRect = Rect(0, 0, 40, 100);
        zombie->mWidth = 40;
        zombie->mHeight = 100;
        zombie->mBodyHealth = zombie->mBodyMaxHealth = 1000;
        zombie->mHasHead = true;
        board.RebuildZombieRowBucket();
        Require(projectile->FindCollisionTarget() == zombie,
            "Production projectile cannot find a target at its moved collision rectangle");
        const auto expectedHealth = zombie->mBodyHealth - projectile->GetProjectileDef().mDamage;
        projectile->DoImpact(zombie);
        Require(projectile->mDead && zombie->mBodyHealth == expectedHealth,
            "Production projectile impact did not retire the shot and apply its damage");
        Require(type != ProjectileType::PROJECTILE_SNOWPEA || zombie->mChilledCounter > 0,
            "Production snowpea impact did not chill its target");
    }
    board.mProjectiles.DataArrayFreeAll();
    board.mZombies.DataArrayFreeAll();
    board.RebuildZombieRowBucket();
    board.mLevelTimeNs = 0;
    auto* portalShot = board.AddProjectile(360, 251, 0, 2, ProjectileType::PROJECTILE_PEA);
    auto* entrance = board.mGridItems.DataArrayAlloc();
    auto* exit = board.mGridItems.DataArrayAlloc();
    entrance->mGridItemType = exit->mGridItemType = GridItemType::GRIDITEM_PORTAL_CIRCLE;
    entrance->mGridX = 4; entrance->mGridY = 2;
    exit->mGridX = 7; exit->mGridY = 3;
    const auto birth = portalShot->mCreationTimeNs;
    const auto motionOrigin = portalShot->mMotionOriginTimeNs;
    board.mChallenge->UpdatePortal(entrance);
    Require(portalShot->mRow == 3 && portalShot->mCreationTimeNs == birth &&
        portalShot->mMotionOriginTimeNs == motionOrigin,
        "Production portal changed the projectile's birth or motion clock");
    const auto teleportedX = portalShot->mPosX;
    board.mLevelTimeNs = 10'000'000;
    portalShot->UpdateMotion();
    Require(portalShot->mPosX == float(double(teleportedX) + portalShot->mVelX),
        "Production portal failed to translate the analytic motion origin");
    board.mGridItems.DataArrayFreeAll();
    board.mProjectiles.DataArrayFreeAll();
    board.mLevelTimeNs = 0;
    auto* homingTarget = board.mZombies.DataArrayAlloc();
    homingTarget->mZombieType = ZombieType::ZOMBIE_NORMAL;
    homingTarget->mZombiePhase = ZombiePhase::PHASE_ZOMBIE_NORMAL;
    homingTarget->mZombieHeight = ZombieHeight::HEIGHT_ZOMBIE_NORMAL;
    homingTarget->mScaleZombie = 1;
    homingTarget->mRow = 2;
    homingTarget->mX = 550;
    homingTarget->mY = 180;
    homingTarget->mZombieRect = Rect(0, 0, 40, 100);
    homingTarget->mWidth = 40;
    homingTarget->mHeight = 100;
    homingTarget->mBodyHealth = homingTarget->mBodyMaxHealth = 1000;
    homingTarget->mHasHead = true;
    board.RebuildZombieRowBucket();
    auto* homing = board.AddProjectile(321, 251, 0, 2, ProjectileType::PROJECTILE_SPIKE);
    homing->mMotionType = ProjectileMotion::MOTION_HOMING;
    homing->mVelX = 2;
    homing->mTargetZombieID = board.ZombieGetID(homingTarget);
    homing->mDamageRangeFlags = 1 << int(DamageRangeFlags::DAMAGES_GROUND);
    Schedule(144, 100'000'000, [&](std::int64_t delta) {
        board.mLevelTimeNs += delta;
        homing->UpdateMotion();
    });
    Require(!homing->mDead && homing->mPosX > 321 && homing->mVelY < 0,
        "Production homing projectile did not steer toward its real target");
    homingTarget->mX = homing->mPosX;
    homingTarget->mY = homing->mPosY - 10;
    homingTarget->mRow = homing->mRow;
    board.RebuildZombieRowBucket();
    const auto homingHealth = homingTarget->mBodyHealth - homing->GetProjectileDef().mDamage;
    homing->CheckForCollision();
    Require(homing->mDead && homingTarget->mBodyHealth == homingHealth,
        "Production homing projectile failed to hit its acquired target");
    board.mProjectiles.DataArrayFreeAll();
    board.mZombies.DataArrayFreeAll();
    board.RebuildZombieRowBucket();
    std::cout << "PASS actual projectile: 9 analytic modes, roofs/high gravity, 8 partitions, "
        "cob segments, portal origins, homing steering/hits, Snowpea/Kernel damage and chill\n";
}

inline void MagnetTransferOrigins(LawnApp& app, Board& board)
{
    using Sprite = MagnetAtlas::Sprite;
    const struct {
        ZombieType zombie;
        ReanimationType animation;
        ReanimTrackId track;
        Sprite sprite;
    } cases[] = {
        {ZOMBIE_PAIL, REANIM_ZOMBIE, ReanimTrackId::anim_bucket, Sprite::REANIM_ZOMBIE_BUCKET1},
        {ZOMBIE_FOOTBALL, REANIM_ZOMBIE_FOOTBALL, ReanimTrackId::zombie_football_helmet,
            Sprite::REANIM_ZOMBIE_FOOTBALL_HELMET},
        {ZOMBIE_DOOR, REANIM_ZOMBIE, ReanimTrackId::anim_screendoor, Sprite::REANIM_ZOMBIE_SCREENDOOR1},
        {ZOMBIE_LADDER, REANIM_LADDER, ReanimTrackId::Zombie_ladder_1, Sprite::REANIM_ZOMBIE_LADDER_1},
        {ZOMBIE_POGO, REANIM_POGO, ReanimTrackId::Zombie_pogo_stick, Sprite::ZOMBIEPOGO_1},
        {ZOMBIE_JACK_IN_THE_BOX, REANIM_JACKINTHEBOX, ReanimTrackId::Zombie_jackbox_box,
            Sprite::REANIM_ZOMBIE_JACKBOX_BOX},
        {ZOMBIE_DIGGER, REANIM_DIGGER, ReanimTrackId::Zombie_digger_pickaxe,
            Sprite::REANIM_ZOMBIE_DIGGER_PICKAXE}
    };
    auto* magnet = app.AddReanimation(0, 0, 0, REANIM_MAGNETSHROOM);
    for (const auto& sample : cases)
    {
        auto* body = app.AddReanimation(0, 0, 0, sample.animation);
        for (const float scale : {0.5f, 1.0f, -1.3f})
        {
            auto plant = std::bit_cast<Plant>(std::array<std::byte, sizeof(Plant)>{});
            plant.mApp = &app;
            plant.mBoard = &board;
            plant.mSeedType = SEED_MAGNETSHROOM;
            plant.mX = 100.25f;
            plant.mY = 200.75f;
            plant.mPlantCol = 1;
            plant.mRow = 2;
            plant.mBodyReanimID = app.ReanimationGetID(magnet);
            Zombie zombie{};
            zombie.mApp = &app;
            zombie.mBoard = &board;
            zombie.mZombieType = sample.zombie;
            zombie.mX = 550.125f;
            zombie.mY = 190.625f;
            zombie.mBodyReanimID = app.ReanimationGetID(body);
            zombie.mScaleZombie = std::abs(scale);
            zombie.mHasArm = zombie.mHasObject = zombie.mHasHead = true;
            zombie.mZombieHeight = HEIGHT_ZOMBIE_NORMAL;
            zombie.mZombiePhase = sample.zombie == ZOMBIE_JACK_IN_THE_BOX ?
                PHASE_JACK_IN_THE_BOX_RUNNING : PHASE_ZOMBIE_NORMAL;
            zombie.mHelmType = sample.zombie == ZOMBIE_PAIL ? HELMTYPE_PAIL :
                sample.zombie == ZOMBIE_FOOTBALL ? HELMTYPE_FOOTBALL : HELMTYPE_NONE;
            zombie.mShieldType = sample.zombie == ZOMBIE_DOOR ? SHIELDTYPE_DOOR :
                sample.zombie == ZOMBIE_LADDER ? SHIELDTYPE_LADDER : SHIELDTYPE_NONE;
            zombie.mHelmHealth = zombie.mHelmMaxHealth = 100;
            zombie.mShieldHealth = zombie.mShieldMaxHealth = 100;
            body->PlayReanim(sample.zombie == ZOMBIE_POGO ? ReanimTrackId::anim_pogo :
                sample.zombie == ZOMBIE_LADDER ? ReanimTrackId::anim_ladderwalk :
                ReanimTrackId::anim_walk, REANIM_LOOP, 0, 12.0f);
            body->SeekRatio(0.3372819f);
            body->mOverlayMatrix.LoadIdentity();
            body->mOverlayMatrix.m00 = scale;
            body->mOverlayMatrix.m11 = std::abs(scale);
            body->mOverlayMatrix.m02 = 21.25f;
            body->mOverlayMatrix.m12 = -17.75f;
            // Independently sample the exact center used by the source draw,
            // before the gameplay method removes equipment or switches pose.
            SexyTransform2D matrix;
            body->GetTrackMatrix(body->FindTrackIndex(sample.track), matrix);
            const float sourceX = zombie.mX + matrix.m02;
            const float sourceY = zombie.mY + matrix.m12;
            plant.MagnetShroomAttactItem(&zombie);
            const auto& item = plant.mMagnetItems[0];
            const auto sprite = static_cast<size_t>(sample.sprite);
            const auto& rect = MagnetAtlas::Images[sprite];
            const float drawScale = MagnetAtlas::Scales[sprite];
            Require(std::abs(item.mPosX + rect.mWidth * drawScale * 0.5f - sourceX) < 0.0001f &&
                std::abs(item.mPosY + PlantDrawHeightOffset(&board, &plant, plant.mSeedType,
                    plant.mPlantCol, plant.mRow) + rect.mHeight * drawScale * 0.5f - sourceY) < 0.0001f,
                "Equipment jumped away from its visible source center on magnet transfer");
            auto firstFrame = item;
            MagnetMotion::Sample(firstFrame, plant.mX + item.mDestOffsetX,
                plant.mY + item.mDestOffsetY, 0);
            Require(std::abs(firstFrame.mPosX - item.mPosX) < 0.0001f &&
                std::abs(firstFrame.mPosY - item.mPosY) < 0.0001f,
                "Magnet curve did not preserve its transferred source position at time zero");
        }
        body->ReanimationDie();
    }
    auto plant = std::bit_cast<Plant>(std::array<std::byte, sizeof(Plant)>{});
    plant.mApp = &app;
    plant.mBoard = &board;
    plant.mSeedType = SEED_MAGNETSHROOM;
    plant.mState = STATE_READY;
    plant.mX = 100;
    plant.mY = 200;
    plant.mPlantCol = 1;
    plant.mRow = 2;
    plant.mBodyReanimID = app.ReanimationGetID(magnet);
    auto* ladder = board.AddALadder(2, 2);
    const float ladderX = board.GridToPixelX(2, 2) + 25.0f;
    const float ladderY = board.GridToPixelY(2, 2) - 4.0f;
    Sexy::gUpdateIntervalNs = 0;
    plant.UpdateMagnetShroom();
    const auto& item = plant.mMagnetItems[0];
    Require(ladder->mDead && item.mItemType == MAGNET_ITEM_LADDER_PLACED &&
        std::abs(item.mPosX - ladderX) < 0.0001f &&
        std::abs(item.mPosY + PlantDrawHeightOffset(&board, &plant,
            plant.mSeedType, plant.mPlantCol, plant.mRow) - ladderY) < 0.0001f,
        "Placed ladder jumped away from GridItem::DrawLadder's top-left on transfer");
    board.mGridItems.DataArrayFree(ladder);
    magnet->ReanimationDie();
    std::cerr << "PASS actual magnet equipment transfer: seven source tracks, scaled/mirrored poses, placed ladder\n";
}

inline void MagnetAttraction(LawnApp& app, Board& board)
{
    const auto oldProfile = app.mPlayerInfo;
    const auto oldMute = app.mMuteSoundsForCutscene;
    const auto oldCollected = board.mCoinsCollected;
    const auto oldLevelCoins = board.mLevelCoinsCollected;
    PlayerInfo profile;
    app.mPlayerInfo = &profile;
    app.mMuteSoundsForCutscene = true;
    struct RestoreMagnet
    {
        LawnApp& app;
        Board& board;
        PlayerInfo* profile;
        bool mute;
        int collected, levelCoins;
        ~RestoreMagnet()
        {
            app.mPlayerInfo = profile;
            app.mMuteSoundsForCutscene = mute;
            board.mCoinsCollected = collected;
            board.mLevelCoinsCollected = levelCoins;
        }
    } restore{app, board, oldProfile, oldMute, oldCollected, oldLevelCoins};
    MagnetTransferOrigins(app, board);
    auto* animation = app.AddReanimation(0, 0, 0, ReanimationType::REANIM_GOLD_MAGNET);
    const auto run = [&](bool gold, int frequency, std::int64_t duration) {
        auto plant = std::bit_cast<Plant>(std::array<std::byte, sizeof(Plant)>{});
        plant.mApp = &app;
        plant.mBoard = &board;
        plant.mX = plant.mY = 100;
        plant.mSeedType = gold ? SeedType::SEED_GOLD_MAGNET : SeedType::SEED_MAGNETSHROOM;
        plant.mState = PlantState::STATE_MAGNETSHROOM_CHARGING;
        plant.mStateCountdown = 100;
        plant.mBodyReanimID = app.ReanimationGetID(animation);
        auto& item = plant.mMagnetItems[0];
        item.mPosX = 900;
        item.mPosY = 100;
        item.mItemType = gold ? MagnetItemType::MAGNET_ITEM_GOLD_COIN : MagnetItemType::MAGNET_ITEM_PAIL_1;
        MagnetMotion::Bind(item, 100, 100);
        profile.mCoins = 0;
        Schedule(frequency, duration, [&](std::int64_t) {
            if (gold) plant.UpdateGoldMagnetShroom();
            else plant.UpdateMagnetShroom();
        });
        if (duration == 900'000'000)
            Require(gold ? item.mItemType == MagnetItemType::MAGNET_ITEM_NONE && profile.mCoins == 5 :
                std::abs(item.mPosX - 120) < 0.001f,
                "Production magnet did not capture its distant item below one second");
        else
        {
            const auto saved = SaveRecordMapping::WriteSaveRecord(plant);
            Sexy::gUpdateIntervalNs = 23'456'789;
            if (gold) plant.UpdateGoldMagnetShroom(); else plant.UpdateMagnetShroom();
            const auto expected = std::array<std::uint64_t, 3>{
                Bits(item.mPosX), Bits(item.mPosY), plant.mMagnetElapsedNs};
            SaveRecordMapping::ReadSaveRecord(plant, saved.data());
            plant.mApp = &app;
            plant.mBoard = &board;
            if (gold) plant.UpdateGoldMagnetShroom(); else plant.UpdateMagnetShroom();
            Require(std::array<std::uint64_t, 3>{Bits(item.mPosX), Bits(item.mPosY),
                plant.mMagnetElapsedNs} == expected, "Magnet flight changed after native save/reload");
        }
        return std::array<std::uint64_t, 4>{
              Bits(item.mPosX), Bits(item.mPosY), plant.mMagnetElapsedNs,
              static_cast<std::uint64_t>(profile.mCoins)};
    };
    for (bool gold : {false, true})
        for (const auto duration : {400'000'000LL, 900'000'000LL})
        {
            const auto expected = run(gold, 100, duration);
            for (int frequency : {1, 30, 60, 144, 200, 240, 1000, 0})
                Require(run(gold, frequency, duration) == expected,
                    "Production magnet flight depends on update partition");
        }
    animation->ReanimationDie();
    std::cerr << "PASS actual magnet inverse-square motion / sub-second capture / save continuation\n";
}

inline void PickupMotion(LawnApp& app, Board& board)
{
    const auto oldProfile = app.mPlayerInfo;
    const auto oldMode = app.mGameMode;
    const auto oldDave = app.mCrazyDaveState;
    const auto oldSun = board.mSunMoney;
    const auto oldCollected = board.mCoinsCollected;
    const auto oldLevelCoins = board.mLevelCoinsCollected;
    PlayerInfo profile;
    app.mPlayerInfo = &profile;
    app.mCrazyDaveState = CrazyDaveState::CRAZY_DAVE_OFF;
    struct RestorePickup
    {
        LawnApp& app;
        Board& board;
        PlayerInfo* profile;
        GameMode mode;
        CrazyDaveState dave;
        int sun, collected, levelCoins;
        ~RestorePickup()
        {
            board.mCoins.DataArrayFreeAll();
            app.mPlayerInfo = profile;
            app.mGameMode = mode;
            app.mCrazyDaveState = dave;
            board.mSunMoney = sun;
            board.mCoinsCollected = collected;
            board.mLevelCoinsCollected = levelCoins;
        }
    } restore{app, board, oldProfile, oldMode, oldDave, oldSun, oldCollected, oldLevelCoins};
    const auto make = [&](CoinType type) {
        board.mCoins.DataArrayFreeAll();
        board.mSunMoney = 100;
        board.mCoinsCollected = 0;
        board.mLevelCoinsCollected = 0;
        profile.mCoins = 0;
        app.mGameMode = GameMode::GAMEMODE_MINIGAME_WALLNUT_BOWLING;
        auto* coin = board.mCoins.DataArrayAlloc();
        coin->mApp = &app;
        coin->mBoard = &board;
        coin->mType = type;
        coin->mAttachmentID = AttachmentID::ATTACHMENTID_NULL;
        coin->mDead = false;
        coin->mIsBeingCollected = true;
        coin->mCollectX = coin->mPosX = type == CoinType::COIN_SUN ? 415.0f : 439.0f;
        coin->mCollectY = coin->mPosY = type == CoinType::COIN_SUN ? 0.0f : 558.0f;
        coin->mDisappearCounter = 0;
        return coin;
    };
    for (const auto type : {CoinType::COIN_SUN, CoinType::COIN_GOLD})
    {
        const auto sample = [&](int frequency) {
            auto* coin = make(type);
            Schedule(frequency, 637'192'835, [&](std::int64_t) { coin->UpdateCollected(); });
            Require(!coin->mDead, "Pickup completed before the original distance threshold");
            return std::array<std::uint64_t, 5>{Bits(coin->mPosX), Bits(coin->mPosY),
                Bits(coin->mCollectionDistance), Bits(coin->mScale),
                static_cast<std::uint64_t>(coin->mDisappearCounter.mNanoseconds)};
        };
        const auto expected = sample(100);
        for (const auto frequency : {1, 30, 60, 144, 200, 240, 1000, 0})
            Require(sample(frequency) == expected, "Pickup interpolation depends on update partition");

        auto* savedCoin = make(type);
        Sexy::gUpdateIntervalNs = 123'456'789;
        savedCoin->UpdateCollected();
        const auto saved = SaveRecordMapping::WriteSaveRecord(*savedCoin);
        const auto continuedState = [&] {
            savedCoin->UpdateCollected();
            return std::array<std::uint64_t, 5>{Bits(savedCoin->mPosX), Bits(savedCoin->mPosY),
                Bits(savedCoin->mCollectionDistance), Bits(savedCoin->mScale),
                static_cast<std::uint64_t>(savedCoin->mDisappearCounter.mNanoseconds)};
        };
        Sexy::gUpdateIntervalNs = 23'456'789;
        const auto continued = continuedState();
        SaveRecordMapping::ReadSaveRecord(*savedCoin, saved.data());
        savedCoin->mApp = &app;
        savedCoin->mBoard = &board;
        Require(continuedState() == continued, "Pickup changed trajectory after native save/reload");
        const auto pausedState = std::array<std::uint64_t, 3>{
            Bits(savedCoin->mPosX), Bits(savedCoin->mPosY),
            static_cast<std::uint64_t>(savedCoin->mDisappearCounter.mNanoseconds)};
        Sexy::gUpdateIntervalNs = 0;
        savedCoin->UpdateCollected();
        Require(std::array<std::uint64_t, 3>{Bits(savedCoin->mPosX), Bits(savedCoin->mPosY),
            static_cast<std::uint64_t>(savedCoin->mDisappearCounter.mNanoseconds)} == pausedState,
            "Zero-step pickup advanced or rebound its origin");

        auto* coin = make(type);
        Sexy::gUpdateIntervalNs = 10'000'000;
        int updates = 0;
        while (!coin->mDead && updates < 200)
        {
            coin->UpdateCollected();
            ++updates;
        }
        Require(updates == (type == CoinType::COIN_SUN ? 82 : 73),
            "400px pickup changed the original 100Hz completion update");
        Require(type == CoinType::COIN_SUN ? board.mSunMoney == 125 : profile.mCoins == 5,
            "Pickup did not award its value exactly once");
    }
    auto* coin = make(CoinType::COIN_GOLD);
    Sexy::gUpdateIntervalNs = 123'456'789;
    coin->UpdateCollected();
    const auto previousX = coin->mPosX, previousY = coin->mPosY;
    app.mGameMode = GameMode::GAMEMODE_LIMBO_ZEN_GARDEN;
    Sexy::gUpdateIntervalNs = 7'192'835;
    coin->UpdateCollected();
    const auto factor = TodExponentialCurve<20.0 / 21.0>(7'192'835);
    Require(coin->mCollectX == previousX && coin->mCollectY == previousY &&
        coin->mPosX == static_cast<float>(442 + (double(previousX) - 442) * factor),
        "Pickup destination switch did not rebind from the current position");
    coin = make(CoinType::COIN_GOLD);
    coin->mDisappearCounter = -1;
    Sexy::gUpdateIntervalNs = 0;
    coin->UpdateCollected();
    Require(!coin->mDead && coin->mDisappearCounter.mNanoseconds == 0 &&
        coin->mPosX == 439.0f && coin->mPosY == 558.0f,
        "Negative historical elapsed time wrapped to a huge unsigned sample");
    std::cerr << "PASS actual pickup time interpolation / 1073 thresholds / destination rebinding\n";
}

inline void SlotMachine(LawnApp& app, Board& board)
{
    const auto oldScene = app.mGameScene;
    const auto oldTime = board.mLevelTimeNs;
    app.mGameScene = GameScenes::SCENE_PLAYING;
    board.mLevelTimeNs = 1;
    const auto sample = [&](int frequency, std::int64_t duration) {
        Sexy::SRand(0x5191);
        SeedPacket packet;
        packet.mApp = &app;
        packet.mBoard = &board;
        packet.mPacketType = SeedType::SEED_PEASHOOTER;
        packet.mIndex = 0;
        packet.mActive = false;
        packet.SlotMachineStart();
        Schedule(frequency, duration, [&](std::int64_t) { packet.Update(); });
        return std::array<std::int64_t, 5>{static_cast<int>(packet.mPacketType),
            static_cast<int>(packet.mSlotMachiningNextSeed),
            packet.mSlotMachineCountDown.mNanoseconds, packet.mActive, Sexy::Rand()};
    };
    Require(SlotMachineMotion::Turns(SlotMachineMotion::DurationNs) == 0 &&
        SlotMachineMotion::Turns(250'000'000) == 10.5 &&
        SlotMachineMotion::Turns(0) == 11,
        "Slot-machine integrated speed endpoints changed");
    for (const auto duration : {1'234'567'891LL, 3'100'000'000LL,
        SlotMachineMotion::DurationNs})
    {
        const auto expected = sample(100, duration);
        for (const int frequency : {1, 30, 60, 144, 200, 240, 1000, 0})
            Require(sample(frequency, duration) == expected,
                "Slot-machine seed events or phase depend on update partition");
        if (duration == SlotMachineMotion::DurationNs)
            Require(expected[2] == 0 && expected[3] == 1,
                "Slot-machine did not activate on the final turn boundary");
    }
    board.mLevelTimeNs = oldTime;
    app.mGameScene = oldScene;
    std::cerr << "PASS actual slot-machine nanosecond phase / seed sequence / final activation\n";
}

inline void Check(LawnApp& app)
{
    for (int frequency : {30, 60, 100, 144, 200, 240, 1000, 0})
    {
        float position = 91.123413f;
        TimedLinearMotion motion;
        constexpr std::int64_t duration = 2'718'281'829;
        Schedule(frequency, duration, [&](std::int64_t delta) {
            AdvanceVelocity(position, -0.7137289f, delta, motion);
        });
        Require(position == CheckedPosition(double(91.123413f) +
            double(-0.7137289f) * duration / 10'000'000.0),
            "Timed float velocity depends on update partition");
        position = 177.283919f;
        AdvanceVelocity(position, 0.3127131f, 1'234'567, motion);
        Require(position == CheckedPosition(double(177.283919f) +
            double(0.3127131f) * 1'234'567 / 10'000'000.0),
            "Timed float velocity ignored an explicit teleport or changed rate");
    }
    struct ResourceGroups
    {
        LawnApp& app;
        bool fonts, images;
        ~ResourceGroups()
        {
            if (images) app.mResourceManager->DeleteResources(ResourceGroupId::LoadingImages);
            if (fonts) app.mResourceManager->DeleteResources(ResourceGroupId::LoadingFonts);
            app.CleanSharedImages();
        }
    } resourceGroups{app,
        !app.mResourceManager->IsGroupLoaded(ResourceGroupId::LoadingFonts),
        !app.mResourceManager->IsGroupLoaded(ResourceGroupId::LoadingImages)};
    Require(app.mResourceManager->LoadResources(ResourceGroupId::LoadingFonts),
        "Cannot load production fonts for the real Board constructor");
    std::cerr << "PASS actor fixture production fonts\n";
    Require(app.mResourceManager->LoadResources(ResourceGroupId::LoadingImages) &&
        Sexy::IMAGE_SEEDBANK, "Cannot load real SeedBank image required by Board construction");
    std::cerr << "PASS actor fixture production Board images\n";
    const auto previousBoard = app.mBoard;
    const auto previousMode = app.mGameMode;
    const auto previousTicks = Sexy::gUpdateTicks;
    const auto previousDelta = Sexy::gUpdateIntervalNs;
    const auto previousWholeTicks = Sexy::gWholeLegacyTicks;
    std::unique_ptr<EffectSystem> ownedEffects;
    if (!app.mEffectSystem)
    {
        ownedEffects = std::make_unique<EffectSystem>();
        ownedEffects->EffectSystemInitialize();
        app.mEffectSystem = ownedEffects.get();
    }
    std::cerr << "PASS actor fixture real effect pools\n";
    struct Restore
    {
        LawnApp& app;
        Board* board;
        GameMode mode;
        double ticks;
        unsigned long long delta;
        int whole;
        bool owned;
        ~Restore()
        {
            app.mBoard = board;
            app.mGameMode = mode;
            if (owned) app.mEffectSystem = nullptr;
            Sexy::gUpdateTicks = ticks;
            Sexy::gUpdateIntervalNs = delta;
            Sexy::gWholeLegacyTicks = whole;
        }
    } restore{app, previousBoard, previousMode, previousTicks, previousDelta,
        previousWholeTicks, bool(ownedEffects)};
    app.mGameMode = GameMode::GAMEMODE_MINIGAME_WALLNUT_BOWLING;
    Board board(&app);
    std::cerr << "PASS actor fixture real Board construction\n";
    SharedClockConsumers(board);
    CreditsScrollRuntime::Check();
    CoinFallRuntime::Check(app,board);
    std::cerr << "PASS actual analytic Coin/Sun falling and wall events\n";
    MowerMotionRuntime::Run(app,board);
    MowerMotionRuntime::SaveContinuation(app,board);
    std::cerr << "PASS actual analytic mower motion, pool height and brain falling\n";
    ZombieAltitudeRuntime::Check(app,board);
    std::cerr << "PASS actual Zombie altitude: 14 paths, roof Imp, combined Balloon, save continuation\n";
    LaunchDeadlines(app, board);
    SlotMachine(app, board);
    PickupMotion(app, board);
    MagnetAttraction(app, board);
    for (const auto seed : {SeedType::SEED_WALLNUT, SeedType::SEED_GIANT_WALLNUT})
    {
        const auto expected = Bowling(app, board, 100, seed);
        std::cerr << "PASS actor bowling reference: seed " << int(seed) << '\n';
        for (int frequency : {1, 30, 60, 144, 200, 240, 1000, 0})
            Require(Bowling(app, board, frequency, seed) == expected,
                "Production bowling depends on outer update partition");
    }
    GiantBowlingImpact(app, board);
    board.mPlants.DataArrayFreeAll();
    board.RebuildPlantCellBucket();
    const auto walking = Walking(app, board, 100);
    std::cerr << "PASS actor walking reference\n";
    for (int frequency : {30, 60, 144, 200, 240, 1000, 0})
        Require(Walking(app, board, frequency) == walking,
            "Production zombie walking depends on outer update partition");
    const auto additionalWalking = Walking(app, board, 100, true);
    for (int frequency : {30, 60, 144, 200, 240, 1000, 0})
        Require(Walking(app, board, frequency, true) == additionalWalking,
            "Production root plus additional movement depends on outer update partition");
    Projectiles(app, board);
    std::cout << "PASS actual Plant bowling / Zombie walking: float coordinates, source roots, "
        "canonical bounce / row bucket, teleport rebinding and exact partition states\n";
}
}
