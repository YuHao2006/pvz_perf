#pragma once
// Included by the game-linked static-definition fixture. These checks execute
// real Plant/Zombie methods, real Board pools/buckets and real source animation.
#include "Lawn/Board.h"
#include "Resources.h"
#include "Lawn/Plant.h"
#include "Lawn/PlantLaunchClock.h"
#include "Lawn/System/PlayerInfo.h"
#include "Lawn/Projectile.h"
#include "Lawn/Challenge.h"
#include "Lawn/Zombie.h"
#include "Lawn/Motion.h"
#include "Sexy.TodLib/Attachment.h"
#include "Sexy.TodLib/TodParticle.h"
#include "Sexy.TodLib/EffectSystem.h"
#include "SexyAppFramework/misc/ResourceManager.h"
#include <array>
#include <bit>
#include <memory>
#include <random>
#include <stdexcept>
#include <vector>

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
        board.mMainCounter = 0;
        Plant plant;
        plant.mSeedType = SeedType::SEED_PEASHOOTER;
        plant.mRow = 2;
        plant.mShootingCounter = 0;
        plant.mLaunchRate = 150;
        plant.mNextLaunchTimeNs = 123'456'789;
        plant.mLaunchClockSampleNs = plant.mLaunchWindowStartNs = 0;
        Schedule(frequency, 12'718'281'829, [&](std::int64_t delta) {
            board.mMainCounter.AddNanoseconds(delta);
            plant.UpdateShooter();
        });
        Require(plant.mNextLaunchTimeNs > board.mMainCounter.mNanoseconds,
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
    paused.mLaunchClockSampleNs = paused.mLaunchWindowStartNs = 1'000'000'000;
    paused.mNextLaunchTimeNs = 1'712'345'678;
    board.mMainCounter.mNanoseconds = 1'237'192'835;
    paused.Update();
    Require(paused.mNextLaunchTimeNs == 1'949'538'513 &&
        paused.mLaunchWindowStartNs == board.mMainCounter.mNanoseconds &&
        paused.mLaunchClockSampleNs == board.mMainCounter.mNanoseconds,
        "Production paused plant did not preserve its exact remaining launch time");
    paused.mIsAsleep = paused.mSquished = false;
    paused.mShootingCounter = 100;
    paused.mLaunchRate = 150;
    board.mMainCounter.mNanoseconds += 9'000'000'001;
    const auto shooting = paused.mShootingCounter.mNanoseconds;
    paused.UpdateShooter();
    Require(paused.mNextLaunchTimeNs > board.mMainCounter.mNanoseconds &&
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
        board.mMainCounter.mNanoseconds = 0;
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
            board.mMainCounter.mNanoseconds += delta;
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
        board.mMainCounter.mNanoseconds = 0;
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
        board.mMainCounter.mNanoseconds = 10'000'000;
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
    board.mMainCounter.mNanoseconds = 0;
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
    board.mMainCounter.mNanoseconds = 10'000'000;
    portalShot->UpdateMotion();
    Require(portalShot->mPosX == float(double(teleportedX) + portalShot->mVelX),
        "Production portal failed to translate the analytic motion origin");
    board.mGridItems.DataArrayFreeAll();
    board.mProjectiles.DataArrayFreeAll();
    board.mMainCounter.mNanoseconds = 0;
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
        board.mMainCounter.mNanoseconds += delta;
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
    LaunchDeadlines(app, board);
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
