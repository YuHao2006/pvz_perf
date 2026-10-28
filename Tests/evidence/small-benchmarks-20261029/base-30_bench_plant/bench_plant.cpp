// bench_plant.cpp — Plant.cpp 8 目标段表性能对拍（第二轮补测）
//   FormA = 403c1968^ 原函数；FormB = HEAD 逐字还原（表声明照抄：static constexpr /
//   裸 constexpr / 命名空间级均与源一致）。大函数两侧统一 __declspec(noinline)。
#include "r2_stub.h"

inline unsigned Rand(unsigned n) { MixCk(0x1090ULL, n); return n ? RngNext() % n : 0u; }

// ================================================================= FormA
namespace FA {

struct Plant
{
    SeedType mSeedType = SEED_PEASHOOTER;
    PlantState mState = STATE_READY;
    int mStateCountdown = 0;
    int mRow = 2, mX = 100, mY = 200, mWidth = 80, mHeight = 80;
    int mLaunchCounter = 1, mLaunchRate = 150;
    int mShootingCounter = 0;
    int mRenderOrder = 0;
    int mHeadReanimID = 1, mHeadReanimID2 = 2, mBodyReanimID = 3;
    LawnApp* mApp = &g_app;
    Board* mBoard = &g_board;
    int mPlantCol = 3;
    int mPlantHealth = 300;
    int mEatenFlashCountdown = 0;

    // ---- 桩成员（编号入 checksum；两形态实现一致）
    Zombie* FindTargetZombie(int row, PlantWeapon w) { MixCk(0x3000ULL, (uint64_t)row + (uint64_t)w); return g_zHitFlag ? &g_zombiePool[g_zIdx & 15] : nullptr; }
    void PlayIdleAnim(float r) { MixCk(0x3001ULL, (uint64_t)(int)r); }
    void PlayBodyReanim(ReanimTrackId t, ReanimLoopType l, int i, float r) { MixCk(0x3002ULL, (uint64_t)t + (uint64_t)l + (uint64_t)i + (uint64_t)(int)r); }
    void LaunchThreepeater() { MixCk(0x3003ULL); }
    void LaunchStarFruit() { MixCk(0x3004ULL); }
    void FindTargetAndFire(int row, PlantWeapon w) { MixCk(0x3005ULL, (uint64_t)row + (uint64_t)w); }
    bool IsInPlay() { MixCk(0x3006ULL); return g_plantInPlay; }
    void Die() { MixCk(0x3007ULL); }
    unsigned GetDamageRangeFlags(PlantWeapon w) { MixCk(0x3008ULL, (uint64_t)w); return 3u; }
    int CalcRenderOrder() { MixCk(0x3009ULL); return 77; }

    // ---- 目标（verbatim，403c1968^）
    __declspec(noinline) void UpdateShooter();
    __declspec(noinline) void UpdateProductionPlant();
    __declspec(noinline) void UpdateScaredyShroom();
    __declspec(noinline) void UpdateCobCannon();
    __declspec(noinline) void UpdateCactus();
    __declspec(noinline) void UpdateChomper();
    __declspec(noinline) void UpdateBowling();
    __declspec(noinline) Reanimation* AttachBlinkAnim(Reanimation* theReanimBody);
};

// ---- #2 UpdateShooter（A：if-else 链）
void Plant::UpdateShooter()
{
    mLaunchCounter--;
    if (mLaunchCounter <= 0)
    {
        mLaunchCounter = mLaunchRate - Sexy::Rand(15);

        if (mSeedType == SeedType::SEED_THREEPEATER)
        {
            LaunchThreepeater();
        }
        else if (mSeedType == SeedType::SEED_STARFRUIT)
        {
            LaunchStarFruit();
        }
        else if (mSeedType == SeedType::SEED_SPLITPEA)
        {
            FindTargetAndFire(mRow, PlantWeapon::WEAPON_SECONDARY);

            // 1073 00463200: the second back shot must not reuse the front
            // head's previous shooting state. Keep the 25-tick front trigger.
            Reanimation* aHeadReanim = mApp->ReanimationGet(mHeadReanimID);
            Reanimation* aBodyReanim = mApp->ReanimationGet(mBodyReanimID);
            aHeadReanim->StartBlend(20);
            aHeadReanim->mLoopType = ReanimLoopType::REANIM_LOOP;
            aHeadReanim->SetFramesForLayer(ReanimTrackId::anim_head_idle);
            aHeadReanim->mAnimRate = aBodyReanim->mAnimRate;
            aHeadReanim->mAnimTime = aBodyReanim->mAnimTime;
        }
        else if (mSeedType == SeedType::SEED_CACTUS)
        {
            if (mState == PlantState::STATE_CACTUS_HIGH)
            {
                FindTargetAndFire(mRow, PlantWeapon::WEAPON_PRIMARY);
            }
            else if (mState == PlantState::STATE_CACTUS_LOW)
            {
                FindTargetAndFire(mRow, PlantWeapon::WEAPON_SECONDARY);
            }
        }
        else
        {
            FindTargetAndFire(mRow, PlantWeapon::WEAPON_PRIMARY);
        }
    }

    if (mLaunchCounter == 50 && mSeedType == SeedType::SEED_CATTAIL)
    {
        FindTargetAndFire(mRow, PlantWeapon::WEAPON_PRIMARY);
    }
    if (mLaunchCounter == 25)
    {
        if (mSeedType == SeedType::SEED_REPEATER || mSeedType == SeedType::SEED_LEFTPEATER)
        {
            FindTargetAndFire(mRow, PlantWeapon::WEAPON_PRIMARY);
        }
        else if (mSeedType == SeedType::SEED_SPLITPEA)
        {
            FindTargetAndFire(mRow, PlantWeapon::WEAPON_PRIMARY);
            FindTargetAndFire(mRow, PlantWeapon::WEAPON_SECONDARY);
        }
    }
}

// ---- #3 UpdateProductionPlant（A：if-else 链）
void Plant::UpdateProductionPlant()
{
    if (!IsInPlay() || mApp->IsIZombieLevel() || mApp->mGameMode == GameMode::GAMEMODE_INTRO)
        return;

    if (mBoard->HasLevelAwardDropped())
        return;

    if (mSeedType == SeedType::SEED_MARIGOLD && mBoard->mCurrentWave == mBoard->mNumWaves)
    {
        if (mState != PlantState::STATE_MARIGOLD_ENDING)
        {
            mState = PlantState::STATE_MARIGOLD_ENDING;
            mStateCountdown = 6000;
        }
        else if (mStateCountdown <= 0)
            return;
    }

    if (mApp->mGameMode == GameMode::GAMEMODE_CHALLENGE_LAST_STAND && mBoard->mChallenge->mChallengeState != ChallengeState::STATECHALLENGE_LAST_STAND_ONSLAUGHT)
        return;

    mLaunchCounter--;
    if (mLaunchCounter <= 100)
    {
        int aFlashCountdown = TodAnimateCurve(100, 0, mLaunchCounter, 0, 100, Curves::Linear);
        mEatenFlashCountdown = std::max(mEatenFlashCountdown, aFlashCountdown);
    }
    if (mLaunchCounter <= 0)
    {
        mLaunchCounter = RandRangeInt(mLaunchRate - 150, mLaunchRate);
        mApp->PlayFoley(FoleyType::FOLEY_SPAWN_SUN);

        if (mSeedType == SeedType::SEED_SUNSHROOM)
        {
            if (mState == PlantState::STATE_SUNSHROOM_SMALL)
            {
                mBoard->AddCoin(mX, mY, CoinType::COIN_SMALLSUN, CoinMotion::COIN_MOTION_FROM_PLANT);
            }
            else
            {
                mBoard->AddCoin(mX, mY, CoinType::COIN_SUN, CoinMotion::COIN_MOTION_FROM_PLANT);
            }
        }
        else if (mSeedType == SeedType::SEED_SUNFLOWER)
        {
            mBoard->AddCoin(mX, mY, CoinType::COIN_SUN, CoinMotion::COIN_MOTION_FROM_PLANT);
        }
        else if (mSeedType == SeedType::SEED_TWINSUNFLOWER)
        {
            mBoard->AddCoin(mX, mY, CoinType::COIN_SUN, CoinMotion::COIN_MOTION_FROM_PLANT);
            mBoard->AddCoin(mX, mY, CoinType::COIN_SUN, CoinMotion::COIN_MOTION_FROM_PLANT);
        }
        else if (mSeedType == SeedType::SEED_MARIGOLD)
        {
            mBoard->AddCoin(mX, mY, (Sexy::Rand(100) < 10) ? CoinType::COIN_GOLD : CoinType::COIN_SILVER, CoinMotion::COIN_MOTION_COIN);
        }

        if (mApp->mGameMode == GameMode::GAMEMODE_CHALLENGE_BIG_TIME)
        {
            if (mSeedType == SeedType::SEED_SUNFLOWER)
            {
                mBoard->AddCoin(mX, mY, CoinType::COIN_SUN, CoinMotion::COIN_MOTION_FROM_PLANT);
            }
            else if (mSeedType == SeedType::SEED_MARIGOLD)
            {
                mBoard->AddCoin(mX, mY, CoinType::COIN_SILVER, CoinMotion::COIN_MOTION_COIN);
            }
        }
    }
}

// ---- #4 UpdateScaredyShroom（A：if-else 链）
void Plant::UpdateScaredyShroom()
{
    if (mShootingCounter > 0)
        return;

    bool aHasZombieNearby = false;

    Zombie* aZombie = nullptr;
    while (mBoard->IterateZombies(aZombie))
    {
        Rect aZombieRect = aZombie->GetZombieRect();
        int aDiffY = (aZombie->mZombieType == ZombieType::ZOMBIE_BOSS) ? 0 : (aZombie->mRow - mRow);
        if (!aZombie->mMindControlled && !aZombie->IsDeadOrDying() && aDiffY <= 1 && aDiffY >= -1 && GetCircleRectOverlap(mX, mY + 20.0f, 120, aZombieRect))
        {
            aHasZombieNearby = true;
            break;
        }
    }

    Reanimation* aBodyReanim = mApp->ReanimationGet(mBodyReanimID);
    if (mState == PlantState::STATE_READY)
    {
        if (aHasZombieNearby)
        {
            mState = PlantState::STATE_SCAREDYSHROOM_LOWERING;
            PlayBodyReanim(ReanimTrackId::anim_scared, ReanimLoopType::REANIM_PLAY_ONCE_AND_HOLD, 10, 10.0f);
        }
    }
    else if (mState == PlantState::STATE_SCAREDYSHROOM_LOWERING)
    {
        if (aBodyReanim->mLoopCount > 0)
        {
            mState = PlantState::STATE_SCAREDYSHROOM_SCARED;
            PlayBodyReanim(ReanimTrackId::anim_scaredidle, ReanimLoopType::REANIM_LOOP, 10, 0.0f);
        }
    }
    else if (mState == PlantState::STATE_SCAREDYSHROOM_SCARED)
    {
        if (!aHasZombieNearby)
        {
            mState = PlantState::STATE_SCAREDYSHROOM_RAISING;

            float aAnimRate = RandRangeFloat(7.0f, 12.0f);
            PlayBodyReanim(ReanimTrackId::anim_grow, ReanimLoopType::REANIM_PLAY_ONCE_AND_HOLD, 10, aAnimRate);
        }
    }
    else if (mState == PlantState::STATE_SCAREDYSHROOM_RAISING)
    {
        if (aBodyReanim->mLoopCount > 0)
        {
            mState = PlantState::STATE_READY;

            float aAnimRate = RandRangeFloat(10.0f, 15.0f);
            PlayIdleAnim(aAnimRate);
        }
    }

    if (mState != PlantState::STATE_READY)
    {
        mLaunchCounter = mLaunchRate;
    }
}

// ---- #5 UpdateCobCannon（A：if-else 链）
void Plant::UpdateCobCannon()
{
    if (mState == PlantState::STATE_COBCANNON_ARMING)
    {
        if (mStateCountdown == 0)
        {
            mState = PlantState::STATE_COBCANNON_LOADING;
            PlayBodyReanim(ReanimTrackId::anim_charge, ReanimLoopType::REANIM_PLAY_ONCE_AND_HOLD, 20, 12.0f);
        }
    }
    else if (mState == PlantState::STATE_COBCANNON_LOADING)
    {
        Reanimation* aBodyReanim = mApp->ReanimationGet(mBodyReanimID);
        if (aBodyReanim->ShouldTriggerTimedEvent(0.5f))
        {
            mApp->PlayFoley(FoleyType::FOLEY_SHOOP);
        }
        if (aBodyReanim->mLoopCount > 0)
        {
            mState = PlantState::STATE_COBCANNON_READY;
            PlayIdleAnim(12.0f);
        }
    }
    else if (mState == PlantState::STATE_COBCANNON_READY)
    {
        Reanimation* aBodyReanim = mApp->ReanimationGet(mBodyReanimID);
        ReanimatorTrackInstance* aCobTrack = aBodyReanim->GetTrackInstanceByName(ReanimTrackId::CobCannon_cob);
        aCobTrack->mTrackColor = GetFlashingColor(mBoard->mMainCounter, 75);
    }
    else if (mState == PlantState::STATE_COBCANNON_FIRING)
    {
        Reanimation* aBodyReanim = mApp->ReanimationGet(mBodyReanimID);
        if (aBodyReanim->ShouldTriggerTimedEvent(0.48f))
        {
            mApp->PlayFoley(FoleyType::FOLEY_COB_LAUNCH);
        }
    }
}

// ---- #6 UpdateCactus（A：if-else 链）
void Plant::UpdateCactus()
{
    if (mShootingCounter > 0)
        return;

    Reanimation* aBodyReanim = mApp->ReanimationGet(mBodyReanimID);
    if (mState == PlantState::STATE_CACTUS_RISING)
    {
        if (aBodyReanim->mLoopCount > 0)
        {
            mState = PlantState::STATE_CACTUS_HIGH;
            PlayBodyReanim(ReanimTrackId::anim_idlehigh, ReanimLoopType::REANIM_LOOP, 20, 0.0f);
            if (mApp->IsIZombieLevel())
            {
                aBodyReanim->mAnimRate = 0;
            }

            mLaunchCounter = 1;
        }
    }
    else if (mState == PlantState::STATE_CACTUS_HIGH)
    {
        if (FindTargetZombie(mRow, PlantWeapon::WEAPON_PRIMARY) == nullptr)
        {
            mState = PlantState::STATE_CACTUS_LOWERING;
            PlayBodyReanim(ReanimTrackId::anim_lower, ReanimLoopType::REANIM_PLAY_ONCE_AND_HOLD, 20, aBodyReanim->mDefinition->mFPS);
        }
    }
    else if (mState == PlantState::STATE_CACTUS_LOWERING)
    {
        if (aBodyReanim->mLoopCount > 0)
        {
            mState = PlantState::STATE_CACTUS_LOW;
            PlayIdleAnim(0.0f);
        }
    }
    else if (FindTargetZombie(mRow, PlantWeapon::WEAPON_PRIMARY))
    {
        mState = PlantState::STATE_CACTUS_RISING;
        PlayBodyReanim(ReanimTrackId::anim_rise, ReanimLoopType::REANIM_PLAY_ONCE_AND_HOLD, 20, aBodyReanim->mDefinition->mFPS);
        mApp->PlayFoley(FoleyType::FOLEY_PLANTGROW);
    }
}

// ---- #1 UpdateChomper（A：if-else 链）
void Plant::UpdateChomper()
{
    Reanimation* aBodyReanim = mApp->ReanimationTryToGet(mBodyReanimID);
    if (mState == PlantState::STATE_READY)
    {
        if (FindTargetZombie(mRow, PlantWeapon::WEAPON_PRIMARY))
        {
            PlayBodyReanim(ReanimTrackId::anim_bite, ReanimLoopType::REANIM_PLAY_ONCE_AND_HOLD, 20, 24.0f);
            mState = PlantState::STATE_CHOMPER_BITING;
            mStateCountdown = 70;
        }
    }
    else if (mState == PlantState::STATE_CHOMPER_BITING)
    {
        if (mStateCountdown == 0)
        {
            mApp->PlayFoley(FoleyType::FOLEY_BIGCHOMP);

            Zombie* aZombie = FindTargetZombie(mRow, PlantWeapon::WEAPON_PRIMARY);
            bool doBite = false;
            if (aZombie)
            {
                if (aZombie->mZombieType == ZombieType::ZOMBIE_GARGANTUAR || aZombie->mZombieType == ZombieType::ZOMBIE_REDEYE_GARGANTUAR ||
                    aZombie->mZombieType == ZombieType::ZOMBIE_BOSS)
                {
                    doBite = true;
                }
            }
            bool doMiss = false;
            if (aZombie == nullptr)
            {
                doMiss = true;
            }
            else if (!aZombie->IsImmobilizied())
            {
                if (aZombie->IsBouncingPogo() ||
                    aZombie->mZombiePhase == ZombiePhase::PHASE_POLEVAULTER_IN_VAULT || aZombie->mZombiePhase == ZombiePhase::PHASE_POLEVAULTER_PRE_VAULT)
                {
                    doMiss = true;
                }
            }

            if (doBite)
            {
                mApp->PlayFoley(FoleyType::FOLEY_SPLAT);
                aZombie->TakeDamage(40, 0U);
                mState = PlantState::STATE_CHOMPER_BITING_MISSED;
            }
            else if (doMiss)
            {
                mState = PlantState::STATE_CHOMPER_BITING_MISSED;
            }
            else
            {
                aZombie->DieWithLoot();
                mState = PlantState::STATE_CHOMPER_BITING_GOT_ONE;
            }
        }
    }
    else if (mState == PlantState::STATE_CHOMPER_BITING_GOT_ONE)
    {
        if (aBodyReanim->mLoopCount > 0)
        {
            PlayBodyReanim(ReanimTrackId::anim_chew, ReanimLoopType::REANIM_LOOP, 0, 15.0f);
            if (mApp->IsIZombieLevel())
            {
                aBodyReanim->mAnimRate = 0;
            }

            mState = PlantState::STATE_CHOMPER_DIGESTING;
            mStateCountdown = 4000;
        }
    }
    else if (mState == PlantState::STATE_CHOMPER_DIGESTING)
    {
        if (mStateCountdown == 0)
        {
            PlayBodyReanim(ReanimTrackId::anim_swallow, ReanimLoopType::REANIM_PLAY_ONCE_AND_HOLD, 20, 12.0f);
            mState = PlantState::STATE_CHOMPER_SWALLOWING;
        }
    }
    else if ((mState == PlantState::STATE_CHOMPER_SWALLOWING || mState == PlantState::STATE_CHOMPER_BITING_MISSED) && aBodyReanim->mLoopCount > 0)
    {
        PlayIdleAnim(aBodyReanim->mDefinition->mFPS);
        mState = PlantState::STATE_READY;
    }
}

// ---- #7 UpdateBowling（A：if-else 链，币支链 4 支）
void Plant::UpdateBowling()
{
    Reanimation* aBodyReanim = mApp->ReanimationTryToGet(mBodyReanimID);
    if (aBodyReanim && aBodyReanim->TrackExists(ReanimTrackId::_ground))
    {
        float aSpeed = aBodyReanim->GetTrackVelocity(ReanimTrackId::_ground);
        if (mSeedType == SeedType::SEED_GIANT_WALLNUT)
        {
            aSpeed *= 2;
        }

        mX -= aSpeed;
        if (mX > 800)
            Die();
    }

    if (mState == PlantState::STATE_BOWLING_UP)
    {
        mY -= 2;
    }
    else if (mState == PlantState::STATE_BOWLING_DOWN)
    {
        mY += 2;
    }
    int aDistToGrid = mBoard->GridToPixelY(0, mRow) - mY;
    if (aDistToGrid < -2 || aDistToGrid > 2)
        return;

    PlantState aNewState = mState;
    if (mState == PlantState::STATE_BOWLING_UP && mRow <= 0)
    {
        aNewState = PlantState::STATE_BOWLING_DOWN;
    }
    else if (mState == PlantState::STATE_BOWLING_DOWN && mRow >= 4)
    {
        aNewState = PlantState::STATE_BOWLING_UP;
    }

    Zombie* aZombie = FindTargetZombie(mRow, PlantWeapon::WEAPON_PRIMARY);
    if (aZombie)
    {
        int aPosX = mX + mWidth / 2;
        int aPosY = mY + mHeight / 2;

        if (mSeedType == SeedType::SEED_EXPLODE_O_NUT)
        {
            mApp->PlayFoley(FoleyType::FOLEY_CHERRYBOMB);
            mApp->PlaySample(SOUND_BOWLINGIMPACT2);

            int aDamageRangeFlags = GetDamageRangeFlags(PlantWeapon::WEAPON_PRIMARY) | 32U;
            mBoard->KillAllZombiesInRadius(mRow, aPosX, aPosY, 90, 1, true, aDamageRangeFlags);
            mApp->AddTodParticle(aPosX, aPosY, (int)RenderLayer::RENDER_LAYER_TOP, ParticleEffect::PARTICLE_POWIE);
            mBoard->ShakeBoard(3, -4);

            Die();

            return;
        }

        mApp->PlayFoley(FoleyType::FOLEY_BOWLINGIMPACT);
        mBoard->ShakeBoard(1, -2);

        if (mSeedType == SeedType::SEED_GIANT_WALLNUT)
        {
            aZombie->TakeDamage(1800, 0U);
        }
        else if (aZombie->mShieldType == ShieldType::SHIELDTYPE_DOOR && mState != PlantState::STATE_NOTREADY)
        {
            aZombie->TakeDamage(1800, 0U);
        }
        else if (aZombie->mShieldType != ShieldType::SHIELDTYPE_NONE)
        {
            aZombie->TakeShieldDamage(400, 0U);
        }
        else if (aZombie->mHelmType != HelmType::HELMTYPE_NONE)
        {
            if (aZombie->mHelmType == HelmType::HELMTYPE_PAIL)
            {
                mApp->PlayFoley(FoleyType::FOLEY_SHIELD_HIT);
            }
            else if (aZombie->mHelmType == HelmType::HELMTYPE_TRAFFIC_CONE)
            {
                mApp->PlayFoley(FoleyType::FOLEY_PLASTIC_HIT);
            }

            aZombie->TakeHelmDamage(900, 0U);
        }
        else
        {
            aZombie->TakeDamage(1800, 0U);
        }

        if ((!mApp->IsFirstTimeAdventureMode() || mApp->mPlayerInfo->GetLevel() > 10) && mSeedType == SeedType::SEED_WALLNUT)
        {
            mLaunchCounter++;
            if (mLaunchCounter == 2)
            {
                mApp->PlayFoley(FoleyType::FOLEY_SPAWN_SUN);
                mBoard->AddCoin(aPosX, aPosY, CoinType::COIN_SILVER, CoinMotion::COIN_MOTION_COIN);
            }
            else if (mLaunchCounter == 3)
            {
                mApp->PlayFoley(FoleyType::FOLEY_SPAWN_SUN);
                mBoard->AddCoin(aPosX - 5.0f, aPosY, CoinType::COIN_SILVER, CoinMotion::COIN_MOTION_COIN);
                mBoard->AddCoin(aPosX + 5.0f, aPosY, CoinType::COIN_SILVER, CoinMotion::COIN_MOTION_COIN);
            }
            else if (mLaunchCounter == 4)
            {
                mApp->PlayFoley(FoleyType::FOLEY_SPAWN_SUN);
                mBoard->AddCoin(aPosX - 10.0f, aPosY, CoinType::COIN_SILVER, CoinMotion::COIN_MOTION_COIN);
                mBoard->AddCoin(aPosX, aPosY, CoinType::COIN_SILVER, CoinMotion::COIN_MOTION_COIN);
                mBoard->AddCoin(aPosX + 10.0f, aPosY, CoinType::COIN_SILVER, CoinMotion::COIN_MOTION_COIN);
            }
            else if (mLaunchCounter >= 5)
            {
                mApp->PlayFoley(FoleyType::FOLEY_SPAWN_SUN);
                mBoard->AddCoin(aPosX, aPosY, CoinType::COIN_GOLD, CoinMotion::COIN_MOTION_COIN);
                ReportAchievement::GiveAchievement(mApp, RollSomeHeads, true); // @Patoke: add achievement
            }
        }

        if (mSeedType != SeedType::SEED_GIANT_WALLNUT)
        {
            if (mRow == 4 || mState == PlantState::STATE_BOWLING_DOWN)
            {
                aNewState = PlantState::STATE_BOWLING_UP;
            }
            else if (mRow == 0 || mState == PlantState::STATE_BOWLING_UP)
            {
                aNewState = PlantState::STATE_BOWLING_DOWN;
            }
            else
            {
                aNewState = Sexy::Rand(2) ? PlantState::STATE_BOWLING_UP : PlantState::STATE_BOWLING_DOWN;
            }
        }
    }

    if (aNewState == PlantState::STATE_BOWLING_UP)
    {
        mRow--;
        mState = PlantState::STATE_BOWLING_UP;
        mRenderOrder = CalcRenderOrder();
    }
    else if (aNewState == PlantState::STATE_BOWLING_DOWN)
    {
        mState = PlantState::STATE_BOWLING_DOWN;
        mRenderOrder = CalcRenderOrder();
        mRow++;
    }
}

// ---- #8 AttachBlinkAnim（A：if-else 链）
Reanimation* Plant::AttachBlinkAnim(Reanimation* theReanimBody)
{
    const PlantDefinition& aPlantDef = GetPlantDefinition(mSeedType);
    LawnApp* aApp = (LawnApp*)gSexyAppBase;
    Reanimation* aAnimToAttach = theReanimBody;
    ReanimTrackId aTrackToPlay = ReanimTrackId::anim_blink;
    ReanimTrackId aTrackToAttach = ReanimTrackId::None;

    if (mSeedType == SeedType::SEED_WALLNUT || mSeedType == SeedType::SEED_TALLNUT ||
        mSeedType == SeedType::SEED_EXPLODE_O_NUT || mSeedType == SeedType::SEED_GIANT_WALLNUT)
    {
        int aHit = Rand(10);
        if (aHit < 1 && theReanimBody->TrackExists(ReanimTrackId::anim_blink_twitch))
        {
            aTrackToPlay = ReanimTrackId::anim_blink_twitch;
        }
        else
        {
            aTrackToPlay = aHit < 7 ? ReanimTrackId::anim_blink_twice : ReanimTrackId::anim_blink_thrice;
        }
    }
    else if (mSeedType == SeedType::SEED_THREEPEATER)
    {
        int aHit = Rand(3);
        if (aHit == 0)
        {
            aTrackToPlay = ReanimTrackId::anim_blink1;
            aTrackToAttach = ReanimTrackId::anim_face1;
            ReanimatorTrackInstance* aTrackInstance = theReanimBody->GetTrackInstanceByName(ReanimTrackId::anim_head1);
            aAnimToAttach = FindReanimAttachment(aTrackInstance->mAttachmentID);
        }
        else if (aHit == 1)
        {
            aTrackToPlay = ReanimTrackId::anim_blink2;
            aTrackToAttach = ReanimTrackId::anim_face2;
            ReanimatorTrackInstance* aTrackInstance = theReanimBody->GetTrackInstanceByName(ReanimTrackId::anim_head2);
            aAnimToAttach = FindReanimAttachment(aTrackInstance->mAttachmentID);
        }
        else
        {
            aTrackToPlay = ReanimTrackId::anim_blink3;
            aTrackToAttach = ReanimTrackId::anim_face3;
            ReanimatorTrackInstance* aTrackInstance = theReanimBody->GetTrackInstanceByName(ReanimTrackId::anim_head3);
            aAnimToAttach = FindReanimAttachment(aTrackInstance->mAttachmentID);
        }
    }
    else if (mSeedType == SeedType::SEED_SPLITPEA)
    {
        if (Rand(2) == 0)
        {
            aTrackToPlay = ReanimTrackId::anim_blink;
            aTrackToAttach = ReanimTrackId::anim_face;
            aAnimToAttach = mApp->ReanimationTryToGet(mHeadReanimID);
        }
        else
        {
            aTrackToPlay = ReanimTrackId::anim_blink2;
            aTrackToAttach = ReanimTrackId::anim_face2;
            aAnimToAttach = mApp->ReanimationTryToGet(mHeadReanimID2);
        }
    }
    else if (mSeedType == SeedType::SEED_TWINSUNFLOWER)
    {
        if (Rand(2) == 0)
        {
            aTrackToPlay = ReanimTrackId::anim_blink;
            aTrackToAttach = ReanimTrackId::anim_face;
        }
        else
        {
            aTrackToPlay = ReanimTrackId::anim_blink2;
            aTrackToAttach = ReanimTrackId::anim_face2;
        }
    }
    else if (mSeedType == SeedType::SEED_PEASHOOTER || mSeedType == SeedType::SEED_SNOWPEA || mSeedType == SeedType::SEED_REPEATER || mSeedType == SeedType::SEED_LEFTPEATER || mSeedType == SeedType::SEED_GATLINGPEA)
    {
        if (theReanimBody->TrackExists(ReanimTrackId::anim_stem))
        {
            ReanimatorTrackInstance* aTrackInstance = theReanimBody->GetTrackInstanceByName(ReanimTrackId::anim_stem);
            aAnimToAttach = FindReanimAttachment(aTrackInstance->mAttachmentID);
        }
        else if (theReanimBody->TrackExists(ReanimTrackId::anim_idle))
        {
            ReanimatorTrackInstance* aTrackInstance = theReanimBody->GetTrackInstanceByName(ReanimTrackId::anim_idle);
            aAnimToAttach = FindReanimAttachment(aTrackInstance->mAttachmentID);
        }
    }

    if (aAnimToAttach == nullptr)
    {
        TodTrace("Missing head anim");
        return nullptr;
    }

    if (!theReanimBody->TrackExists(aTrackToPlay))
        return nullptr;

    Reanimation* aBlinkReanim = aApp->mEffectSystem->mReanimationHolder->AllocReanimation(0.0f, 0.0f, 0, aPlantDef.mReanimationType);
    aBlinkReanim->SetFramesForLayer(aTrackToPlay);
    aBlinkReanim->mLoopType = ReanimLoopType::REANIM_PLAY_ONCE_FULL_LAST_FRAME_AND_HOLD;
    aBlinkReanim->mAnimRate = 15.0f;
    aBlinkReanim->mColorOverride = theReanimBody->mColorOverride;

    if (aTrackToAttach != ReanimTrackId::None && aAnimToAttach->TrackExists(aTrackToAttach))
    {
        aBlinkReanim->AttachToAnotherReanimation(aAnimToAttach, aTrackToAttach);
    }
    else if (aAnimToAttach->TrackExists(ReanimTrackId::anim_face))
    {
        aBlinkReanim->AttachToAnotherReanimation(aAnimToAttach, ReanimTrackId::anim_face);
    }
    else if (aAnimToAttach->TrackExists(ReanimTrackId::anim_idle))
    {
        aBlinkReanim->AttachToAnotherReanimation(aAnimToAttach, ReanimTrackId::anim_idle);
    }
    else
    {
        TodTrace("Missing anim_idle for blink");
    }

    aBlinkReanim->mFilterEffect = theReanimBody->mFilterEffect;
    return aBlinkReanim;
}

} // namespace FA

// ================================================================= FormB
namespace FB {

struct Plant
{
    SeedType mSeedType = SEED_PEASHOOTER;
    PlantState mState = STATE_READY;
    int mStateCountdown = 0;
    int mRow = 2, mX = 100, mY = 200, mWidth = 80, mHeight = 80;
    int mLaunchCounter = 1, mLaunchRate = 150;
    int mShootingCounter = 0;
    int mRenderOrder = 0;
    int mHeadReanimID = 1, mHeadReanimID2 = 2, mBodyReanimID = 3;
    LawnApp* mApp = &g_app;
    Board* mBoard = &g_board;
    int mPlantCol = 3;
    int mPlantHealth = 300;
    int mEatenFlashCountdown = 0;

    Zombie* FindTargetZombie(int row, PlantWeapon w) { MixCk(0x3000ULL, (uint64_t)row + (uint64_t)w); return g_zHitFlag ? &g_zombiePool[g_zIdx & 15] : nullptr; }
    void PlayIdleAnim(float r) { MixCk(0x3001ULL, (uint64_t)(int)r); }
    void PlayBodyReanim(ReanimTrackId t, ReanimLoopType l, int i, float r) { MixCk(0x3002ULL, (uint64_t)t + (uint64_t)l + (uint64_t)i + (uint64_t)(int)r); }
    void LaunchThreepeater() { MixCk(0x3003ULL); }
    void LaunchStarFruit() { MixCk(0x3004ULL); }
    void FindTargetAndFire(int row, PlantWeapon w) { MixCk(0x3005ULL, (uint64_t)row + (uint64_t)w); }
    bool IsInPlay() { MixCk(0x3006ULL); return g_plantInPlay; }
    void Die() { MixCk(0x3007ULL); }
    unsigned GetDamageRangeFlags(PlantWeapon w) { MixCk(0x3008ULL, (uint64_t)w); return 3u; }
    int CalcRenderOrder() { MixCk(0x3009ULL); return 77; }

    __declspec(noinline) void UpdateShooter();
    __declspec(noinline) void UpdateProductionPlant();
    __declspec(noinline) void UpdateScaredyShroom();
    __declspec(noinline) void UpdateCobCannon();
    __declspec(noinline) void UpdateCactus();
    __declspec(noinline) void UpdateChomper();
    __declspec(noinline) void UpdateBowling();
    __declspec(noinline) Reanimation* AttachBlinkAnim(Reanimation* theReanimBody);
};

// ---- #2 UpdateShooter（B：kShooterFireCases 53 槽，HEAD 为裸 constexpr 函数内表——照抄）
void Plant::UpdateShooter()
{
    mLaunchCounter--;
    if (mLaunchCounter <= 0)
    {
        mLaunchCounter = mLaunchRate - Sexy::Rand(15);

        // C 形态 -> 匿名 lambda 函数指针表 kShooterFireCases（仿 kSeedTypeUpdates
        // 范式）：行序 = SeedType 枚举序 0..52；无 case 槽 = 原 else 支（正面
        // 开火，constexpr 指针变量填满）。SPLITPEA/CACTUS 两支体积较大整体入槽。
        static constexpr auto kShooterDefaultFire = [](Plant* p)
        {
            p->FindTargetAndFire(p->mRow, PlantWeapon::WEAPON_PRIMARY);
        };
        constexpr void (*kShooterFireCases[])(Plant*) = {
            // 0..14 默认开火（PEASHOOTER..DOOMSHROOM 前 15 槽）
            kShooterDefaultFire, kShooterDefaultFire, kShooterDefaultFire, kShooterDefaultFire, kShooterDefaultFire,
            kShooterDefaultFire, kShooterDefaultFire, kShooterDefaultFire, kShooterDefaultFire, kShooterDefaultFire,
            kShooterDefaultFire, kShooterDefaultFire, kShooterDefaultFire, kShooterDefaultFire, kShooterDefaultFire,
            // 15..17 LILYPAD/SQUASH/（17 空）
            kShooterDefaultFire, kShooterDefaultFire, kShooterDefaultFire,
            [](Plant* p) { p->LaunchThreepeater(); },  // 18 SEED_THREEPEATER
            // 19..25 TANGLEKELP..SEASHROOM 默认
            kShooterDefaultFire, kShooterDefaultFire, kShooterDefaultFire, kShooterDefaultFire, kShooterDefaultFire,
            kShooterDefaultFire, kShooterDefaultFire,
            [](Plant* p)   // 26 SEED_CACTUS
            {
                if (p->mState == PlantState::STATE_CACTUS_HIGH)
                {
                    p->FindTargetAndFire(p->mRow, PlantWeapon::WEAPON_PRIMARY);
                }
                else if (p->mState == PlantState::STATE_CACTUS_LOW)
                {
                    p->FindTargetAndFire(p->mRow, PlantWeapon::WEAPON_SECONDARY);
                }
            },
            kShooterDefaultFire,  // 27 SEED_BLOVER
            [](Plant* p)   // 28 SEED_SPLITPEA
            {
                p->FindTargetAndFire(p->mRow, PlantWeapon::WEAPON_SECONDARY);

                // 1073 00463200: the second back shot must not reuse the front
                // head's previous shooting state. Keep the 25-tick front trigger.
                Reanimation* aHeadReanim = p->mApp->ReanimationGet(p->mHeadReanimID);
                Reanimation* aBodyReanim = p->mApp->ReanimationGet(p->mBodyReanimID);
                aHeadReanim->StartBlend(20);
                aHeadReanim->mLoopType = ReanimLoopType::REANIM_LOOP;
                aHeadReanim->SetFramesForLayer(ReanimTrackId::anim_head_idle);
                aHeadReanim->mAnimRate = aBodyReanim->mAnimRate;
                aHeadReanim->mAnimTime = aBodyReanim->mAnimTime;
            },
            [](Plant* p) { p->LaunchStarFruit(); },  // 29 SEED_STARFRUIT
            // 30..39 PUMPKINSHELL..MELONPULT 默认
            kShooterDefaultFire, kShooterDefaultFire, kShooterDefaultFire, kShooterDefaultFire, kShooterDefaultFire,
            kShooterDefaultFire, kShooterDefaultFire, kShooterDefaultFire, kShooterDefaultFire, kShooterDefaultFire,
            // 40..52 GATLINGPEA..LEFTPEATER 默认
            kShooterDefaultFire, kShooterDefaultFire, kShooterDefaultFire, kShooterDefaultFire, kShooterDefaultFire,
            kShooterDefaultFire, kShooterDefaultFire, kShooterDefaultFire, kShooterDefaultFire, kShooterDefaultFire,
            kShooterDefaultFire, kShooterDefaultFire, kShooterDefaultFire,
        };
        static_assert(sizeof(kShooterFireCases) / sizeof(kShooterFireCases[0]) == (int)SeedType::NUM_SEED_TYPES,
            "射手开火槽位须与 SeedType 枚举同步");

        if ((unsigned)mSeedType < sizeof(kShooterFireCases) / sizeof(kShooterFireCases[0]))
        {
            kShooterFireCases[mSeedType](this);
        }
        else
        {
            kShooterDefaultFire(this);  // 原 else 支（哨兵越界等价）
        }
    }

    if (mLaunchCounter == 50 && mSeedType == SeedType::SEED_CATTAIL)
    {
        FindTargetAndFire(mRow, PlantWeapon::WEAPON_PRIMARY);
    }
    if (mLaunchCounter == 25)
    {
        if (mSeedType == SeedType::SEED_REPEATER || mSeedType == SeedType::SEED_LEFTPEATER)
        {
            FindTargetAndFire(mRow, PlantWeapon::WEAPON_PRIMARY);
        }
        else if (mSeedType == SeedType::SEED_SPLITPEA)
        {
            FindTargetAndFire(mRow, PlantWeapon::WEAPON_PRIMARY);
            FindTargetAndFire(mRow, PlantWeapon::WEAPON_SECONDARY);
        }
    }
}

// ---- #3 UpdateProductionPlant（B：kProductionCoins 53 槽，HEAD 为裸 constexpr——照抄）
void Plant::UpdateProductionPlant()
{
    if (!IsInPlay() || mApp->IsIZombieLevel() || mApp->mGameMode == GameMode::GAMEMODE_INTRO)
        return;

    if (mBoard->HasLevelAwardDropped())
        return;

    if (mSeedType == SeedType::SEED_MARIGOLD && mBoard->mCurrentWave == mBoard->mNumWaves)
    {
        if (mState != PlantState::STATE_MARIGOLD_ENDING)
        {
            mState = PlantState::STATE_MARIGOLD_ENDING;
            mStateCountdown = 6000;
        }
        else if (mStateCountdown <= 0)
            return;
    }

    if (mApp->mGameMode == GameMode::GAMEMODE_CHALLENGE_LAST_STAND && mBoard->mChallenge->mChallengeState != ChallengeState::STATECHALLENGE_LAST_STAND_ONSLAUGHT)
        return;

    mLaunchCounter--;
    if (mLaunchCounter <= 100)
    {
        int aFlashCountdown = TodAnimateCurve(100, 0, mLaunchCounter, 0, 100, Curves::Linear);
        mEatenFlashCountdown = std::max(mEatenFlashCountdown, aFlashCountdown);
    }
    if (mLaunchCounter <= 0)
    {
        mLaunchCounter = RandRangeInt(mLaunchRate - 150, mLaunchRate);
        mApp->PlayFoley(FoleyType::FOLEY_SPAWN_SUN);

        // B 形态 -> 常量表 kProductionCoins（原 4 支链合并）：行序 = SeedType
        enum class ProductionCoinPick : unsigned char
        {
            NONE,
            FIXED,
            SMALL_STATE,
            RANDOM10
        };
        constexpr struct
        {
            ProductionCoinPick mPick;
            CoinType mCoinA;
            CoinType mCoinB;
            CoinMotion mMotion;
            int mCount;
        } kProductionCoins[(int)SeedType::NUM_SEED_TYPES] = {
            { ProductionCoinPick::NONE, CoinType::COIN_SUN, CoinType::COIN_SUN, CoinMotion::COIN_MOTION_FROM_PLANT, 0 },  // 0
            { ProductionCoinPick::FIXED, CoinType::COIN_SUN, CoinType::COIN_SUN, CoinMotion::COIN_MOTION_FROM_PLANT, 1 },  // 1 SUNFLOWER
            { ProductionCoinPick::NONE, CoinType::COIN_SUN, CoinType::COIN_SUN, CoinMotion::COIN_MOTION_FROM_PLANT, 0 },
            { ProductionCoinPick::NONE, CoinType::COIN_SUN, CoinType::COIN_SUN, CoinMotion::COIN_MOTION_FROM_PLANT, 0 },
            { ProductionCoinPick::NONE, CoinType::COIN_SUN, CoinType::COIN_SUN, CoinMotion::COIN_MOTION_FROM_PLANT, 0 },
            { ProductionCoinPick::NONE, CoinType::COIN_SUN, CoinType::COIN_SUN, CoinMotion::COIN_MOTION_FROM_PLANT, 0 },
            { ProductionCoinPick::NONE, CoinType::COIN_SUN, CoinType::COIN_SUN, CoinMotion::COIN_MOTION_FROM_PLANT, 0 },
            { ProductionCoinPick::NONE, CoinType::COIN_SUN, CoinType::COIN_SUN, CoinMotion::COIN_MOTION_FROM_PLANT, 0 },
            { ProductionCoinPick::NONE, CoinType::COIN_SUN, CoinType::COIN_SUN, CoinMotion::COIN_MOTION_FROM_PLANT, 0 },
            { ProductionCoinPick::SMALL_STATE, CoinType::COIN_SMALLSUN, CoinType::COIN_SUN, CoinMotion::COIN_MOTION_FROM_PLANT, 1 },  // 9 SUNSHROOM
            { ProductionCoinPick::NONE, CoinType::COIN_SUN, CoinType::COIN_SUN, CoinMotion::COIN_MOTION_FROM_PLANT, 0 },
            { ProductionCoinPick::NONE, CoinType::COIN_SUN, CoinType::COIN_SUN, CoinMotion::COIN_MOTION_FROM_PLANT, 0 },
            { ProductionCoinPick::NONE, CoinType::COIN_SUN, CoinType::COIN_SUN, CoinMotion::COIN_MOTION_FROM_PLANT, 0 },
            { ProductionCoinPick::NONE, CoinType::COIN_SUN, CoinType::COIN_SUN, CoinMotion::COIN_MOTION_FROM_PLANT, 0 },
            { ProductionCoinPick::NONE, CoinType::COIN_SUN, CoinType::COIN_SUN, CoinMotion::COIN_MOTION_FROM_PLANT, 0 },
            { ProductionCoinPick::NONE, CoinType::COIN_SUN, CoinType::COIN_SUN, CoinMotion::COIN_MOTION_FROM_PLANT, 0 },
            { ProductionCoinPick::NONE, CoinType::COIN_SUN, CoinType::COIN_SUN, CoinMotion::COIN_MOTION_FROM_PLANT, 0 },
            { ProductionCoinPick::NONE, CoinType::COIN_SUN, CoinType::COIN_SUN, CoinMotion::COIN_MOTION_FROM_PLANT, 0 },
            { ProductionCoinPick::NONE, CoinType::COIN_SUN, CoinType::COIN_SUN, CoinMotion::COIN_MOTION_FROM_PLANT, 0 },
            { ProductionCoinPick::NONE, CoinType::COIN_SUN, CoinType::COIN_SUN, CoinMotion::COIN_MOTION_FROM_PLANT, 0 },
            { ProductionCoinPick::NONE, CoinType::COIN_SUN, CoinType::COIN_SUN, CoinMotion::COIN_MOTION_FROM_PLANT, 0 },
            { ProductionCoinPick::NONE, CoinType::COIN_SUN, CoinType::COIN_SUN, CoinMotion::COIN_MOTION_FROM_PLANT, 0 },
            { ProductionCoinPick::NONE, CoinType::COIN_SUN, CoinType::COIN_SUN, CoinMotion::COIN_MOTION_FROM_PLANT, 0 },
            { ProductionCoinPick::NONE, CoinType::COIN_SUN, CoinType::COIN_SUN, CoinMotion::COIN_MOTION_FROM_PLANT, 0 },
            { ProductionCoinPick::NONE, CoinType::COIN_SUN, CoinType::COIN_SUN, CoinMotion::COIN_MOTION_FROM_PLANT, 0 },
            { ProductionCoinPick::NONE, CoinType::COIN_SUN, CoinType::COIN_SUN, CoinMotion::COIN_MOTION_FROM_PLANT, 0 },
            { ProductionCoinPick::NONE, CoinType::COIN_SUN, CoinType::COIN_SUN, CoinMotion::COIN_MOTION_FROM_PLANT, 0 },
            { ProductionCoinPick::NONE, CoinType::COIN_SUN, CoinType::COIN_SUN, CoinMotion::COIN_MOTION_FROM_PLANT, 0 },
            { ProductionCoinPick::NONE, CoinType::COIN_SUN, CoinType::COIN_SUN, CoinMotion::COIN_MOTION_FROM_PLANT, 0 },
            { ProductionCoinPick::NONE, CoinType::COIN_SUN, CoinType::COIN_SUN, CoinMotion::COIN_MOTION_FROM_PLANT, 0 },
            { ProductionCoinPick::NONE, CoinType::COIN_SUN, CoinType::COIN_SUN, CoinMotion::COIN_MOTION_FROM_PLANT, 0 },
            { ProductionCoinPick::NONE, CoinType::COIN_SUN, CoinType::COIN_SUN, CoinMotion::COIN_MOTION_FROM_PLANT, 0 },
            { ProductionCoinPick::NONE, CoinType::COIN_SUN, CoinType::COIN_SUN, CoinMotion::COIN_MOTION_FROM_PLANT, 0 },
            { ProductionCoinPick::NONE, CoinType::COIN_SUN, CoinType::COIN_SUN, CoinMotion::COIN_MOTION_FROM_PLANT, 0 },
            { ProductionCoinPick::NONE, CoinType::COIN_SUN, CoinType::COIN_SUN, CoinMotion::COIN_MOTION_FROM_PLANT, 0 },
            { ProductionCoinPick::NONE, CoinType::COIN_SUN, CoinType::COIN_SUN, CoinMotion::COIN_MOTION_FROM_PLANT, 0 },
            { ProductionCoinPick::NONE, CoinType::COIN_SUN, CoinType::COIN_SUN, CoinMotion::COIN_MOTION_FROM_PLANT, 0 },
            { ProductionCoinPick::NONE, CoinType::COIN_SUN, CoinType::COIN_SUN, CoinMotion::COIN_MOTION_FROM_PLANT, 0 },
            { ProductionCoinPick::RANDOM10, CoinType::COIN_GOLD, CoinType::COIN_SILVER, CoinMotion::COIN_MOTION_COIN, 1 },  // 38 MARIGOLD
            { ProductionCoinPick::NONE, CoinType::COIN_SUN, CoinType::COIN_SUN, CoinMotion::COIN_MOTION_FROM_PLANT, 0 },
            { ProductionCoinPick::NONE, CoinType::COIN_SUN, CoinType::COIN_SUN, CoinMotion::COIN_MOTION_FROM_PLANT, 0 },
            { ProductionCoinPick::FIXED, CoinType::COIN_SUN, CoinType::COIN_SUN, CoinMotion::COIN_MOTION_FROM_PLANT, 2 },  // 41 TWINSUNFLOWER
            { ProductionCoinPick::NONE, CoinType::COIN_SUN, CoinType::COIN_SUN, CoinMotion::COIN_MOTION_FROM_PLANT, 0 },
            { ProductionCoinPick::NONE, CoinType::COIN_SUN, CoinType::COIN_SUN, CoinMotion::COIN_MOTION_FROM_PLANT, 0 },
            { ProductionCoinPick::NONE, CoinType::COIN_SUN, CoinType::COIN_SUN, CoinMotion::COIN_MOTION_FROM_PLANT, 0 },
            { ProductionCoinPick::NONE, CoinType::COIN_SUN, CoinType::COIN_SUN, CoinMotion::COIN_MOTION_FROM_PLANT, 0 },
            { ProductionCoinPick::NONE, CoinType::COIN_SUN, CoinType::COIN_SUN, CoinMotion::COIN_MOTION_FROM_PLANT, 0 },
            { ProductionCoinPick::NONE, CoinType::COIN_SUN, CoinType::COIN_SUN, CoinMotion::COIN_MOTION_FROM_PLANT, 0 },
            { ProductionCoinPick::NONE, CoinType::COIN_SUN, CoinType::COIN_SUN, CoinMotion::COIN_MOTION_FROM_PLANT, 0 },
            { ProductionCoinPick::NONE, CoinType::COIN_SUN, CoinType::COIN_SUN, CoinMotion::COIN_MOTION_FROM_PLANT, 0 },
            { ProductionCoinPick::NONE, CoinType::COIN_SUN, CoinType::COIN_SUN, CoinMotion::COIN_MOTION_FROM_PLANT, 0 },
            { ProductionCoinPick::NONE, CoinType::COIN_SUN, CoinType::COIN_SUN, CoinMotion::COIN_MOTION_FROM_PLANT, 0 },
        };
        static_assert(sizeof(kProductionCoins) / sizeof(kProductionCoins[0]) == (int)SeedType::NUM_SEED_TYPES,
            "产币槽位须与 SeedType 枚举同步");

        if ((unsigned)mSeedType < sizeof(kProductionCoins) / sizeof(kProductionCoins[0]))
        {
            const auto& aRow = kProductionCoins[mSeedType];
            if (aRow.mPick != ProductionCoinPick::NONE)
            {
                CoinType aCoin = aRow.mCoinA;
                if (aRow.mPick == ProductionCoinPick::SMALL_STATE)
                {
                    aCoin = (mState == PlantState::STATE_SUNSHROOM_SMALL) ? aRow.mCoinA : aRow.mCoinB;
                }
                else if (aRow.mPick == ProductionCoinPick::RANDOM10)
                {
                    aCoin = (Sexy::Rand(100) < 10) ? aRow.mCoinA : aRow.mCoinB;
                }
                for (int i = 0; i < aRow.mCount; i++)
                {
                    mBoard->AddCoin(mX, mY, aCoin, aRow.mMotion);
                }
            }
        }

        if (mApp->mGameMode == GameMode::GAMEMODE_CHALLENGE_BIG_TIME)
        {
            if (mSeedType == SeedType::SEED_SUNFLOWER)
            {
                mBoard->AddCoin(mX, mY, CoinType::COIN_SUN, CoinMotion::COIN_MOTION_FROM_PLANT);
            }
            else if (mSeedType == SeedType::SEED_MARIGOLD)
            {
                mBoard->AddCoin(mX, mY, CoinType::COIN_SILVER, CoinMotion::COIN_MOTION_COIN);
            }
        }
    }
}

// ---- #4 UpdateScaredyShroom（B：kScaredyStateCases 49 槽 static constexpr——照抄）
void Plant::UpdateScaredyShroom()
{
    if (mShootingCounter > 0)
        return;

    bool aHasZombieNearby = false;

    Zombie* aZombie = nullptr;
    while (mBoard->IterateZombies(aZombie))
    {
        Rect aZombieRect = aZombie->GetZombieRect();
        int aDiffY = (aZombie->mZombieType == ZombieType::ZOMBIE_BOSS) ? 0 : (aZombie->mRow - mRow);
        if (!aZombie->mMindControlled && !aZombie->IsDeadOrDying() && aDiffY <= 1 && aDiffY >= -1 && GetCircleRectOverlap(mX, mY + 20.0f, 120, aZombieRect))
        {
            aHasZombieNearby = true;
            break;
        }
    }

    Reanimation* aBodyReanim = mApp->ReanimationGet(mBodyReanimID);
    using ScaredyStateFn = void (*)(Plant&, Reanimation*, bool);
    static constexpr ScaredyStateFn kScaredyStateCases[(int)PlantState::STATE_LILYPAD_INVULNERABLE + 1] = {
        nullptr,  // 0
        [](Plant& p, Reanimation* aBodyReanim, bool aHasZombieNearby)   // 1 STATE_READY
        {
            if (aHasZombieNearby)
            {
                p.mState = PlantState::STATE_SCAREDYSHROOM_LOWERING;
                p.PlayBodyReanim(ReanimTrackId::anim_scared, ReanimLoopType::REANIM_PLAY_ONCE_AND_HOLD, 10, 10.0f);
            }
        },
        nullptr, nullptr, nullptr, nullptr, nullptr, nullptr, nullptr, nullptr,  // 2..9
        nullptr, nullptr, nullptr, nullptr, nullptr, nullptr, nullptr, nullptr, nullptr, nullptr,  // 10..19
        [](Plant& p, Reanimation* aBodyReanim, bool aHasZombieNearby)   // 20 LOWERING
        {
            if (aBodyReanim->mLoopCount > 0)
            {
                p.mState = PlantState::STATE_SCAREDYSHROOM_SCARED;
                p.PlayBodyReanim(ReanimTrackId::anim_scaredidle, ReanimLoopType::REANIM_LOOP, 10, 0.0f);
            }
        },
        [](Plant& p, Reanimation* aBodyReanim, bool aHasZombieNearby)   // 21 SCARED
        {
            if (!aHasZombieNearby)
            {
                p.mState = PlantState::STATE_SCAREDYSHROOM_RAISING;

                float aAnimRate = RandRangeFloat(7.0f, 12.0f);
                p.PlayBodyReanim(ReanimTrackId::anim_grow, ReanimLoopType::REANIM_PLAY_ONCE_AND_HOLD, 10, aAnimRate);
            }
        },
        [](Plant& p, Reanimation* aBodyReanim, bool aHasZombieNearby)   // 22 RAISING
        {
            if (aBodyReanim->mLoopCount > 0)
            {
                p.mState = PlantState::STATE_READY;

                float aAnimRate = RandRangeFloat(10.0f, 15.0f);
                p.PlayIdleAnim(aAnimRate);
            }
        },
        nullptr, nullptr, nullptr, nullptr, nullptr, nullptr, nullptr, nullptr, nullptr, nullptr,  // 23..32
        nullptr, nullptr, nullptr, nullptr, nullptr, nullptr, nullptr, nullptr, nullptr, nullptr,  // 33..42
        nullptr, nullptr, nullptr, nullptr, nullptr, nullptr,  // 43..48
    };
    static_assert(sizeof(kScaredyStateCases) / sizeof(kScaredyStateCases[0]) ==
        (int)PlantState::STATE_LILYPAD_INVULNERABLE + 1, "kScaredyStateCases 槽位须与 PlantState 枚举尾同步");

    const unsigned aStateIndex = static_cast<unsigned>(mState);
    if (aStateIndex < sizeof(kScaredyStateCases) / sizeof(kScaredyStateCases[0]) &&
        kScaredyStateCases[aStateIndex] != nullptr)
    {
        kScaredyStateCases[aStateIndex](*this, aBodyReanim, aHasZombieNearby);
    }

    if (mState != PlantState::STATE_READY)
    {
        mLaunchCounter = mLaunchRate;
    }
}

// ---- #5 UpdateCobCannon（B：kCobCannonStateCases 4 槽 static constexpr——照抄）
void Plant::UpdateCobCannon()
{
    using CobCannonStateFn = void (*)(Plant&);
    static constexpr CobCannonStateFn kCobCannonStateCases[(int)PlantState::STATE_COBCANNON_FIRING - (int)PlantState::STATE_COBCANNON_ARMING + 1] = {
        [](Plant& p)
        {
            if (p.mStateCountdown == 0)
            {
                p.mState = PlantState::STATE_COBCANNON_LOADING;
                p.PlayBodyReanim(ReanimTrackId::anim_charge, ReanimLoopType::REANIM_PLAY_ONCE_AND_HOLD, 20, 12.0f);
            }
        },
        [](Plant& p)
        {
            Reanimation* aBodyReanim = p.mApp->ReanimationGet(p.mBodyReanimID);
            if (aBodyReanim->ShouldTriggerTimedEvent(0.5f))
            {
                p.mApp->PlayFoley(FoleyType::FOLEY_SHOOP);
            }
            if (aBodyReanim->mLoopCount > 0)
            {
                p.mState = PlantState::STATE_COBCANNON_READY;
                p.PlayIdleAnim(12.0f);
            }
        },
        [](Plant& p)
        {
            Reanimation* aBodyReanim = p.mApp->ReanimationGet(p.mBodyReanimID);
            ReanimatorTrackInstance* aCobTrack = aBodyReanim->GetTrackInstanceByName(ReanimTrackId::CobCannon_cob);
            aCobTrack->mTrackColor = GetFlashingColor(p.mBoard->mMainCounter, 75);
        },
        [](Plant& p)
        {
            Reanimation* aBodyReanim = p.mApp->ReanimationGet(p.mBodyReanimID);
            if (aBodyReanim->ShouldTriggerTimedEvent(0.48f))
            {
                p.mApp->PlayFoley(FoleyType::FOLEY_COB_LAUNCH);
            }
        },
    };
    static_assert(sizeof(kCobCannonStateCases) / sizeof(kCobCannonStateCases[0]) ==
        (int)PlantState::STATE_COBCANNON_FIRING - (int)PlantState::STATE_COBCANNON_ARMING + 1,
        "kCobCannonStateCases 槽位须与 PlantState COBCANNON 段同步");

    const unsigned aStateIndex = static_cast<unsigned>(mState) - static_cast<unsigned>(PlantState::STATE_COBCANNON_ARMING);
    if (aStateIndex < sizeof(kCobCannonStateCases) / sizeof(kCobCannonStateCases[0]))
    {
        kCobCannonStateCases[aStateIndex](*this);
    }
}

// ---- #6 UpdateCactus（B：kCactusStateCases 3 槽 static constexpr + 具名默认支——照抄）
void Plant::UpdateCactus()
{
    if (mShootingCounter > 0)
        return;

    Reanimation* aBodyReanim = mApp->ReanimationGet(mBodyReanimID);
    using CactusStateFn = void (*)(Plant&, Reanimation*);
    static constexpr CactusStateFn kCactusRiseOnTarget = [](Plant& p, Reanimation* aBodyReanim)
    {
        if (p.FindTargetZombie(p.mRow, PlantWeapon::WEAPON_PRIMARY))
        {
            p.mState = PlantState::STATE_CACTUS_RISING;
            p.PlayBodyReanim(ReanimTrackId::anim_rise, ReanimLoopType::REANIM_PLAY_ONCE_AND_HOLD, 20, aBodyReanim->mDefinition->mFPS);
            p.mApp->PlayFoley(FoleyType::FOLEY_PLANTGROW);
        }
    };
    static constexpr CactusStateFn kCactusStateCases[(int)PlantState::STATE_CACTUS_LOWERING - (int)PlantState::STATE_CACTUS_RISING + 1] = {
        [](Plant& p, Reanimation* aBodyReanim)
        {
            if (aBodyReanim->mLoopCount > 0)
            {
                p.mState = PlantState::STATE_CACTUS_HIGH;
                p.PlayBodyReanim(ReanimTrackId::anim_idlehigh, ReanimLoopType::REANIM_LOOP, 20, 0.0f);
                if (p.mApp->IsIZombieLevel())
                {
                    aBodyReanim->mAnimRate = 0;
                }

                p.mLaunchCounter = 1;
            }
        },
        [](Plant& p, Reanimation* aBodyReanim)
        {
            if (p.FindTargetZombie(p.mRow, PlantWeapon::WEAPON_PRIMARY) == nullptr)
            {
                p.mState = PlantState::STATE_CACTUS_LOWERING;
                p.PlayBodyReanim(ReanimTrackId::anim_lower, ReanimLoopType::REANIM_PLAY_ONCE_AND_HOLD, 20, aBodyReanim->mDefinition->mFPS);
            }
        },
        [](Plant& p, Reanimation* aBodyReanim)
        {
            if (aBodyReanim->mLoopCount > 0)
            {
                p.mState = PlantState::STATE_CACTUS_LOW;
                p.PlayIdleAnim(0.0f);
            }
        },
    };
    static_assert(sizeof(kCactusStateCases) / sizeof(kCactusStateCases[0]) ==
        (int)PlantState::STATE_CACTUS_LOWERING - (int)PlantState::STATE_CACTUS_RISING + 1,
        "kCactusStateCases 槽位须与 PlantState CACTUS 段同步");

    const unsigned aStateIndex = static_cast<unsigned>(mState) - static_cast<unsigned>(PlantState::STATE_CACTUS_RISING);
    if (aStateIndex < sizeof(kCactusStateCases) / sizeof(kCactusStateCases[0]))
    {
        kCactusStateCases[aStateIndex](*this, aBodyReanim);
    }
    else
    {
        kCactusRiseOnTarget(*this, aBodyReanim);  // 原 else 支（CACTUS_LOW 及未列状态）
    }
}

// ---- #1 UpdateChomper（B：kChomperStateCases 49 槽 static constexpr——照抄）
void Plant::UpdateChomper()
{
    Reanimation* aBodyReanim = mApp->ReanimationTryToGet(mBodyReanimID);
    using ChomperStateFn = void (*)(Plant&, Reanimation*);
    static constexpr ChomperStateFn kChomperSwallowDone = [](Plant& p, Reanimation* aBodyReanim)
    {
        if (aBodyReanim->mLoopCount > 0)
        {
            p.PlayIdleAnim(aBodyReanim->mDefinition->mFPS);
            p.mState = PlantState::STATE_READY;
        }
    };
    static constexpr ChomperStateFn kChomperStateCases[(int)PlantState::STATE_LILYPAD_INVULNERABLE + 1] = {
        nullptr,  // 0 STATE_NOTREADY
        [](Plant& p, Reanimation* aBodyReanim)   // 1 STATE_READY
        {
            if (p.FindTargetZombie(p.mRow, PlantWeapon::WEAPON_PRIMARY))
            {
                p.PlayBodyReanim(ReanimTrackId::anim_bite, ReanimLoopType::REANIM_PLAY_ONCE_AND_HOLD, 20, 24.0f);
                p.mState = PlantState::STATE_CHOMPER_BITING;
                p.mStateCountdown = 70;
            }
        },
        nullptr, nullptr, nullptr, nullptr, nullptr, nullptr, nullptr, nullptr,  // 2..9
        [](Plant& p, Reanimation* aBodyReanim)   // 10 STATE_CHOMPER_BITING
        {
            if (p.mStateCountdown == 0)
            {
                p.mApp->PlayFoley(FoleyType::FOLEY_BIGCHOMP);

                Zombie* aZombie = p.FindTargetZombie(p.mRow, PlantWeapon::WEAPON_PRIMARY);
                bool doBite = false;
                if (aZombie)
                {
                    if (aZombie->mZombieType == ZombieType::ZOMBIE_GARGANTUAR || aZombie->mZombieType == ZombieType::ZOMBIE_REDEYE_GARGANTUAR ||
                        aZombie->mZombieType == ZombieType::ZOMBIE_BOSS)
                    {
                        doBite = true;
                    }
                }
                bool doMiss = false;
                if (aZombie == nullptr)
                {
                    doMiss = true;
                }
                else if (!aZombie->IsImmobilizied())
                {
                    if (aZombie->IsBouncingPogo() ||
                        aZombie->mZombiePhase == ZombiePhase::PHASE_POLEVAULTER_IN_VAULT || aZombie->mZombiePhase == ZombiePhase::PHASE_POLEVAULTER_PRE_VAULT)
                    {
                        doMiss = true;
                    }
                }

                if (doBite)
                {
                    p.mApp->PlayFoley(FoleyType::FOLEY_SPLAT);
                    aZombie->TakeDamage(40, 0U);
                    p.mState = PlantState::STATE_CHOMPER_BITING_MISSED;
                }
                else if (doMiss)
                {
                    p.mState = PlantState::STATE_CHOMPER_BITING_MISSED;
                }
                else
                {
                    aZombie->DieWithLoot();
                    p.mState = PlantState::STATE_CHOMPER_BITING_GOT_ONE;
                }
            }
        },
        [](Plant& p, Reanimation* aBodyReanim)   // 11 STATE_CHOMPER_BITING_GOT_ONE
        {
            if (aBodyReanim->mLoopCount > 0)
            {
                p.PlayBodyReanim(ReanimTrackId::anim_chew, ReanimLoopType::REANIM_LOOP, 0, 15.0f);
                if (p.mApp->IsIZombieLevel())
                {
                    aBodyReanim->mAnimRate = 0;
                }

                p.mState = PlantState::STATE_CHOMPER_DIGESTING;
                p.mStateCountdown = 4000;
            }
        },
        kChomperSwallowDone,  // 12 STATE_CHOMPER_BITING_MISSED（末支共体）
        [](Plant& p, Reanimation* aBodyReanim)   // 13 STATE_CHOMPER_DIGESTING
        {
            if (p.mStateCountdown == 0)
            {
                p.PlayBodyReanim(ReanimTrackId::anim_swallow, ReanimLoopType::REANIM_PLAY_ONCE_AND_HOLD, 20, 12.0f);
                p.mState = PlantState::STATE_CHOMPER_SWALLOWING;
            }
        },
        kChomperSwallowDone,  // 14 STATE_CHOMPER_SWALLOWING（末支共体）
        nullptr, nullptr, nullptr, nullptr, nullptr, nullptr, nullptr, nullptr, nullptr, nullptr,  // 15..24
        nullptr, nullptr, nullptr, nullptr, nullptr, nullptr, nullptr, nullptr, nullptr, nullptr,  // 25..34
        nullptr, nullptr, nullptr, nullptr, nullptr, nullptr, nullptr, nullptr, nullptr, nullptr,  // 35..44
        nullptr, nullptr, nullptr, nullptr,  // 45..48
    };
    static_assert(sizeof(kChomperStateCases) / sizeof(kChomperStateCases[0]) ==
        (int)PlantState::STATE_LILYPAD_INVULNERABLE + 1, "kChomperStateCases 槽位须与 PlantState 枚举尾同步");

    const unsigned aStateIndex = static_cast<unsigned>(mState);
    if (aStateIndex < sizeof(kChomperStateCases) / sizeof(kChomperStateCases[0]) &&
        kChomperStateCases[aStateIndex] != nullptr)
    {
        kChomperStateCases[aStateIndex](*this, aBodyReanim);
    }
}

// ---- #7 UpdateBowling（B：kBowlingBounceCoins 4 槽，HEAD 为裸 constexpr——照抄）
void Plant::UpdateBowling()
{
    Reanimation* aBodyReanim = mApp->ReanimationTryToGet(mBodyReanimID);
    if (aBodyReanim && aBodyReanim->TrackExists(ReanimTrackId::_ground))
    {
        float aSpeed = aBodyReanim->GetTrackVelocity(ReanimTrackId::_ground);
        if (mSeedType == SeedType::SEED_GIANT_WALLNUT)
        {
            aSpeed *= 2;
        }

        mX -= aSpeed;
        if (mX > 800)
            Die();
    }

    if (mState == PlantState::STATE_BOWLING_UP)
    {
        mY -= 2;
    }
    else if (mState == PlantState::STATE_BOWLING_DOWN)
    {
        mY += 2;
    }
    int aDistToGrid = mBoard->GridToPixelY(0, mRow) - mY;
    if (aDistToGrid < -2 || aDistToGrid > 2)
        return;

    PlantState aNewState = mState;
    if (mState == PlantState::STATE_BOWLING_UP && mRow <= 0)
    {
        aNewState = PlantState::STATE_BOWLING_DOWN;
    }
    else if (mState == PlantState::STATE_BOWLING_DOWN && mRow >= 4)
    {
        aNewState = PlantState::STATE_BOWLING_UP;
    }

    Zombie* aZombie = FindTargetZombie(mRow, PlantWeapon::WEAPON_PRIMARY);
    if (aZombie)
    {
        int aPosX = mX + mWidth / 2;
        int aPosY = mY + mHeight / 2;

        if (mSeedType == SeedType::SEED_EXPLODE_O_NUT)
        {
            mApp->PlayFoley(FoleyType::FOLEY_CHERRYBOMB);
            mApp->PlaySample(SOUND_BOWLINGIMPACT2);

            int aDamageRangeFlags = GetDamageRangeFlags(PlantWeapon::WEAPON_PRIMARY) | 32U;
            mBoard->KillAllZombiesInRadius(mRow, aPosX, aPosY, 90, 1, true, aDamageRangeFlags);
            mApp->AddTodParticle(aPosX, aPosY, (int)RenderLayer::RENDER_LAYER_TOP, ParticleEffect::PARTICLE_POWIE);
            mBoard->ShakeBoard(3, -4);

            Die();

            return;
        }

        mApp->PlayFoley(FoleyType::FOLEY_BOWLINGIMPACT);
        mBoard->ShakeBoard(1, -2);

        if (mSeedType == SeedType::SEED_GIANT_WALLNUT)
        {
            aZombie->TakeDamage(1800, 0U);
        }
        else if (aZombie->mShieldType == ShieldType::SHIELDTYPE_DOOR && mState != PlantState::STATE_NOTREADY)
        {
            aZombie->TakeDamage(1800, 0U);
        }
        else if (aZombie->mShieldType != ShieldType::SHIELDTYPE_NONE)
        {
            aZombie->TakeShieldDamage(400, 0U);
        }
        else if (aZombie->mHelmType != HelmType::HELMTYPE_NONE)
        {
            if (aZombie->mHelmType == HelmType::HELMTYPE_PAIL)
            {
                mApp->PlayFoley(FoleyType::FOLEY_SHIELD_HIT);
            }
            else if (aZombie->mHelmType == HelmType::HELMTYPE_TRAFFIC_CONE)
            {
                mApp->PlayFoley(FoleyType::FOLEY_PLASTIC_HIT);
            }

            aZombie->TakeHelmDamage(900, 0U);
        }
        else
        {
            aZombie->TakeDamage(1800, 0U);
        }

        if ((!mApp->IsFirstTimeAdventureMode() || mApp->mPlayerInfo->GetLevel() > 10) && mSeedType == SeedType::SEED_WALLNUT)
        {
            mLaunchCounter++;
            constexpr struct
            {
                int mCount;
                CoinType mCoin;
                int mOffsets[3];
                bool mAchv;
            } kBowlingBounceCoins[] = {
                { 1, CoinType::COIN_SILVER, { 0, 0, 0 }, false },
                { 2, CoinType::COIN_SILVER, { -5, 5, 0 }, false },
                { 3, CoinType::COIN_SILVER, { -10, 0, 10 }, false },
                { 1, CoinType::COIN_GOLD, { 0, 0, 0 }, true },
            };
            static_assert(sizeof(kBowlingBounceCoins) / sizeof(kBowlingBounceCoins[0]) == 4, "kBowlingBounceCoins 槽位（2/3/4/>=5）");

            if (mLaunchCounter >= 2)
            {
                const unsigned aBounceSlot = mLaunchCounter >= 5 ? 3u : static_cast<unsigned>(mLaunchCounter) - 2u;
                const auto& aRow = kBowlingBounceCoins[aBounceSlot];
                mApp->PlayFoley(FoleyType::FOLEY_SPAWN_SUN);
                for (int i = 0; i < aRow.mCount; i++)
                {
                    mBoard->AddCoin(aPosX + aRow.mOffsets[i], aPosY, aRow.mCoin, CoinMotion::COIN_MOTION_COIN);
                }
                if (aRow.mAchv)
                {
                    ReportAchievement::GiveAchievement(mApp, RollSomeHeads, true); // @Patoke: add achievement
                }
            }
        }

        if (mSeedType != SeedType::SEED_GIANT_WALLNUT)
        {
            if (mRow == 4 || mState == PlantState::STATE_BOWLING_DOWN)
            {
                aNewState = PlantState::STATE_BOWLING_UP;
            }
            else if (mRow == 0 || mState == PlantState::STATE_BOWLING_UP)
            {
                aNewState = PlantState::STATE_BOWLING_DOWN;
            }
            else
            {
                aNewState = Sexy::Rand(2) ? PlantState::STATE_BOWLING_UP : PlantState::STATE_BOWLING_DOWN;
            }
        }
    }

    if (aNewState == PlantState::STATE_BOWLING_UP)
    {
        mRow--;
        mState = PlantState::STATE_BOWLING_UP;
        mRenderOrder = CalcRenderOrder();
    }
    else if (aNewState == PlantState::STATE_BOWLING_DOWN)
    {
        mState = PlantState::STATE_BOWLING_DOWN;
        mRenderOrder = CalcRenderOrder();
        mRow++;
    }
}

// ---- #8 AttachBlinkAnim（B：kBlinkCases 53 槽 static constexpr——照抄）
Reanimation* Plant::AttachBlinkAnim(Reanimation* theReanimBody)
{
    const PlantDefinition& aPlantDef = GetPlantDefinition(mSeedType);
    LawnApp* aApp = (LawnApp*)gSexyAppBase;
    Reanimation* aAnimToAttach = theReanimBody;
    ReanimTrackId aTrackToPlay = ReanimTrackId::anim_blink;
    ReanimTrackId aTrackToAttach = ReanimTrackId::None;

    struct BlinkSelection
    {
        Reanimation* mAnimToAttach;
        ReanimTrackId mTrackToPlay;
        ReanimTrackId mTrackToAttach;
    };
    using BlinkCaseFn = void (*)(Plant&, Reanimation*, BlinkSelection&);
    static constexpr BlinkCaseFn kBlinkWallnutFamily = [](Plant& p, Reanimation* theReanimBody, BlinkSelection& aSel)
    {
        int aHit = Rand(10);
        if (aHit < 1 && theReanimBody->TrackExists(ReanimTrackId::anim_blink_twitch))
        {
            aSel.mTrackToPlay = ReanimTrackId::anim_blink_twitch;
        }
        else
        {
            aSel.mTrackToPlay = aHit < 7 ? ReanimTrackId::anim_blink_twice : ReanimTrackId::anim_blink_thrice;
        }
    };
    static constexpr BlinkCaseFn kBlinkThreepeater = [](Plant& p, Reanimation* theReanimBody, BlinkSelection& aSel)
    {
        int aHit = Rand(3);
        if (aHit == 0)
        {
            aSel.mTrackToPlay = ReanimTrackId::anim_blink1;
            aSel.mTrackToAttach = ReanimTrackId::anim_face1;
            ReanimatorTrackInstance* aTrackInstance = theReanimBody->GetTrackInstanceByName(ReanimTrackId::anim_head1);
            aSel.mAnimToAttach = FindReanimAttachment(aTrackInstance->mAttachmentID);
        }
        else if (aHit == 1)
        {
            aSel.mTrackToPlay = ReanimTrackId::anim_blink2;
            aSel.mTrackToAttach = ReanimTrackId::anim_face2;
            ReanimatorTrackInstance* aTrackInstance = theReanimBody->GetTrackInstanceByName(ReanimTrackId::anim_head2);
            aSel.mAnimToAttach = FindReanimAttachment(aTrackInstance->mAttachmentID);
        }
        else
        {
            aSel.mTrackToPlay = ReanimTrackId::anim_blink3;
            aSel.mTrackToAttach = ReanimTrackId::anim_face3;
            ReanimatorTrackInstance* aTrackInstance = theReanimBody->GetTrackInstanceByName(ReanimTrackId::anim_head3);
            aSel.mAnimToAttach = FindReanimAttachment(aTrackInstance->mAttachmentID);
        }
    };
    static constexpr BlinkCaseFn kBlinkSplitPea = [](Plant& p, Reanimation* theReanimBody, BlinkSelection& aSel)
    {
        if (Rand(2) == 0)
        {
            aSel.mTrackToPlay = ReanimTrackId::anim_blink;
            aSel.mTrackToAttach = ReanimTrackId::anim_face;
            aSel.mAnimToAttach = p.mApp->ReanimationTryToGet(p.mHeadReanimID);
        }
        else
        {
            aSel.mTrackToPlay = ReanimTrackId::anim_blink2;
            aSel.mTrackToAttach = ReanimTrackId::anim_face2;
            aSel.mAnimToAttach = p.mApp->ReanimationTryToGet(p.mHeadReanimID2);
        }
    };
    static constexpr BlinkCaseFn kBlinkTwinSunflower = [](Plant& p, Reanimation* theReanimBody, BlinkSelection& aSel)
    {
        if (Rand(2) == 0)
        {
            aSel.mTrackToPlay = ReanimTrackId::anim_blink;
            aSel.mTrackToAttach = ReanimTrackId::anim_face;
        }
        else
        {
            aSel.mTrackToPlay = ReanimTrackId::anim_blink2;
            aSel.mTrackToAttach = ReanimTrackId::anim_face2;
        }
    };
    static constexpr BlinkCaseFn kBlinkPeaFamily = [](Plant& p, Reanimation* theReanimBody, BlinkSelection& aSel)
    {
        if (theReanimBody->TrackExists(ReanimTrackId::anim_stem))
        {
            ReanimatorTrackInstance* aTrackInstance = theReanimBody->GetTrackInstanceByName(ReanimTrackId::anim_stem);
            aSel.mAnimToAttach = FindReanimAttachment(aTrackInstance->mAttachmentID);
        }
        else if (theReanimBody->TrackExists(ReanimTrackId::anim_idle))
        {
            ReanimatorTrackInstance* aTrackInstance = theReanimBody->GetTrackInstanceByName(ReanimTrackId::anim_idle);
            aSel.mAnimToAttach = FindReanimAttachment(aTrackInstance->mAttachmentID);
        }
    };
    static constexpr BlinkCaseFn kBlinkCases[(int)SeedType::NUM_SEED_TYPES] = {
        kBlinkPeaFamily, nullptr, nullptr, kBlinkWallnutFamily, nullptr,
        kBlinkPeaFamily, nullptr, kBlinkPeaFamily, nullptr, nullptr,
        nullptr, nullptr, nullptr, nullptr, nullptr,
        nullptr, nullptr, nullptr, kBlinkThreepeater, nullptr,
        nullptr, nullptr, nullptr, kBlinkWallnutFamily, nullptr,
        nullptr, nullptr, nullptr, kBlinkSplitPea, nullptr,
        nullptr, nullptr, nullptr, nullptr, nullptr,
        nullptr, nullptr, nullptr, nullptr, nullptr,
        kBlinkPeaFamily, kBlinkTwinSunflower, nullptr, nullptr, nullptr,
        nullptr, nullptr, nullptr, nullptr, kBlinkWallnutFamily,
        kBlinkWallnutFamily, nullptr, kBlinkPeaFamily,
    };
    static_assert(sizeof(kBlinkCases) / sizeof(kBlinkCases[0]) == (int)SeedType::NUM_SEED_TYPES,
        "眨眼槽位须与 SeedType 枚举同步");

    BlinkSelection aSelection{aAnimToAttach, aTrackToPlay, aTrackToAttach};
    if ((unsigned)mSeedType < sizeof(kBlinkCases) / sizeof(kBlinkCases[0]) &&
        kBlinkCases[mSeedType] != nullptr)
    {
        kBlinkCases[mSeedType](*this, theReanimBody, aSelection);
    }
    aAnimToAttach = aSelection.mAnimToAttach;
    aTrackToPlay = aSelection.mTrackToPlay;
    aTrackToAttach = aSelection.mTrackToAttach;

    if (aAnimToAttach == nullptr)
    {
        TodTrace("Missing head anim");
        return nullptr;
    }

    if (!theReanimBody->TrackExists(aTrackToPlay))
        return nullptr;

    Reanimation* aBlinkReanim = aApp->mEffectSystem->mReanimationHolder->AllocReanimation(0.0f, 0.0f, 0, aPlantDef.mReanimationType);
    aBlinkReanim->SetFramesForLayer(aTrackToPlay);
    aBlinkReanim->mLoopType = ReanimLoopType::REANIM_PLAY_ONCE_FULL_LAST_FRAME_AND_HOLD;
    aBlinkReanim->mAnimRate = 15.0f;
    aBlinkReanim->mColorOverride = theReanimBody->mColorOverride;

    if (aTrackToAttach != ReanimTrackId::None && aAnimToAttach->TrackExists(aTrackToAttach))
    {
        aBlinkReanim->AttachToAnotherReanimation(aAnimToAttach, aTrackToAttach);
    }
    else if (aAnimToAttach->TrackExists(ReanimTrackId::anim_face))
    {
        aBlinkReanim->AttachToAnotherReanimation(aAnimToAttach, ReanimTrackId::anim_face);
    }
    else if (aAnimToAttach->TrackExists(ReanimTrackId::anim_idle))
    {
        aBlinkReanim->AttachToAnotherReanimation(aAnimToAttach, ReanimTrackId::anim_idle);
    }
    else
    {
        TodTrace("Missing anim_idle for blink");
    }

    aBlinkReanim->mFilterEffect = theReanimBody->mFilterEffect;
    return aBlinkReanim;
}

} // namespace FB

// ================================================================= 驱动
static FA::Plant g_objA[NOBJ], g_pristineA[NOBJ];
static FB::Plant g_objB[NOBJ], g_pristineB[NOBJ];
static In g_in[NIN];

void A_Shooter(FA::Plant* p) { p->UpdateShooter(); }
void B_Shooter(FB::Plant* p) { p->UpdateShooter(); }
void A_Prod(FA::Plant* p) { p->UpdateProductionPlant(); }
void B_Prod(FB::Plant* p) { p->UpdateProductionPlant(); }
void A_Scaredy(FA::Plant* p) { p->UpdateScaredyShroom(); }
void B_Scaredy(FB::Plant* p) { p->UpdateScaredyShroom(); }
void A_Cob(FA::Plant* p) { p->UpdateCobCannon(); }
void B_Cob(FB::Plant* p) { p->UpdateCobCannon(); }
void A_Cactus(FA::Plant* p) { p->UpdateCactus(); }
void B_Cactus(FB::Plant* p) { p->UpdateCactus(); }
void A_Chomper(FA::Plant* p) { p->UpdateChomper(); }
void B_Chomper(FB::Plant* p) { p->UpdateChomper(); }
void A_Bowling(FA::Plant* p) { p->UpdateBowling(); }
void B_Bowling(FB::Plant* p) { p->UpdateBowling(); }
Reanimation* dummyR = nullptr;
void A_Blink(FA::Plant* p) { dummyR = p->AttachBlinkAnim(&g_reanimPool[p->mBodyReanimID & 7]); }
void B_Blink(FB::Plant* p) { dummyR = p->AttachBlinkAnim(&g_reanimPool[p->mBodyReanimID & 7]); }

int main()
{
    InitZombiePool();
    gSexyAppBase = &g_app;

    printf("%-28s | %19s | %19s | %8s | %s\n", "target(Plant)", "A ns r1/r2", "B ns r1/r2", "diff%", "checksum A/B");

    // ---- #1 Chomper：mState 0..48 全宽 + 倒计时 + 僵尸命中混合
    GenInputs(g_in, NIN, 0x1111, 49, 4, 16, 3);
    {
        auto prepA = [](FA::Plant& p, const In& in) {
            p.mState = (PlantState)in.a; p.mStateCountdown = in.b; p.mRow = in.d;
            g_zHitFlag = (in.c & 3) != 0; g_zIdx = in.c >> 2;
        };
        auto prepB = [](FB::Plant& p, const In& in) {
            p.mState = (PlantState)in.a; p.mStateCountdown = in.b; p.mRow = in.d;
            g_zHitFlag = (in.c & 3) != 0; g_zIdx = in.c >> 2;
        };
        RunTarget("1 kChomperStateCases 49", A_Chomper, B_Chomper,
            g_objA, g_pristineA, prepA, g_objB, g_pristineB, prepB, g_in, NIN);
    }

    // ---- #2 Shooter：mSeedType 0..52 全宽，mLaunchCounter=1 保证每迭代开火
    GenInputs(g_in, NIN, 0x2222, 53, 61, 4, 5);
    {
        auto prepA = [](FA::Plant& p, const In& in) {
            p.mSeedType = (SeedType)in.a; p.mLaunchRate = in.b; p.mLaunchCounter = 1;
            p.mState = (PlantState)(30 + in.c); p.mRow = in.d;
            g_zHitFlag = 1; g_zIdx = in.c;
        };
        auto prepB = [](FB::Plant& p, const In& in) {
            p.mSeedType = (SeedType)in.a; p.mLaunchRate = in.b; p.mLaunchCounter = 1;
            p.mState = (PlantState)(30 + in.c); p.mRow = in.d;
            g_zHitFlag = 1; g_zIdx = in.c;
        };
        RunTarget("2 kShooterFireCases 53", A_Shooter, B_Shooter,
            g_objA, g_pristineA, prepA, g_objB, g_pristineB, prepB, g_in, NIN);
    }

    // ---- #3 Production：mSeedType 0..52，SUNSHROOM 体型态覆盖 + BIG_TIME 混排
    GenInputs(g_in, NIN, 0x3333, 53, 49, 4, 2);
    {
        auto prepA = [](FA::Plant& p, const In& in) {
            p.mSeedType = (SeedType)in.a; p.mState = (PlantState)in.b; p.mLaunchCounter = 1;
            p.mLaunchRate = 250 + in.d; p.mX = 300; p.mY = 300;
            g_app.mGameMode = (GameMode)(in.c == 0 ? GAMEMODE_CHALLENGE_BIG_TIME : GAMEMODE_ADVENTURE);
        };
        auto prepB = [](FB::Plant& p, const In& in) {
            p.mSeedType = (SeedType)in.a; p.mState = (PlantState)in.b; p.mLaunchCounter = 1;
            p.mLaunchRate = 250 + in.d; p.mX = 300; p.mY = 300;
            g_app.mGameMode = (GameMode)(in.c == 0 ? GAMEMODE_CHALLENGE_BIG_TIME : GAMEMODE_ADVENTURE);
        };
        RunTarget("3 kProductionCoins 53", A_Prod, B_Prod,
            g_objA, g_pristineA, prepA, g_objB, g_pristineB, prepB, g_in, NIN);
    }

    // ---- #4 Scaredy：mState 0..48 全宽（迭代僵尸链前导两形态同体）
    GenInputs(g_in, NIN, 0x4444, 49, 8, 16, 5);
    {
        auto prepA = [](FA::Plant& p, const In& in) {
            p.mState = (PlantState)in.a; p.mShootingCounter = 0; p.mRow = in.d;
            p.mX = 100 + in.b; p.mY = 100 + in.c; p.mLaunchRate = 150; g_zIterIdx = in.b;
        };
        auto prepB = [](FB::Plant& p, const In& in) {
            p.mState = (PlantState)in.a; p.mShootingCounter = 0; p.mRow = in.d;
            p.mX = 100 + in.b; p.mY = 100 + in.c; p.mLaunchRate = 150; g_zIterIdx = in.b;
        };
        RunTarget("4 kScaredyStateCases 49", A_Scaredy, B_Scaredy,
            g_objA, g_pristineA, prepA, g_objB, g_pristineB, prepB, g_in, NIN);
    }

    // ---- #5 CobCannon：mState 0..48 全宽（表覆盖 35..38 段）
    GenInputs(g_in, NIN, 0x5555, 49, 4, 8, 5);
    {
        auto prepA = [](FA::Plant& p, const In& in) {
            p.mState = (PlantState)in.a; p.mStateCountdown = in.b; p.mBodyReanimID = in.c;
        };
        auto prepB = [](FB::Plant& p, const In& in) {
            p.mState = (PlantState)in.a; p.mStateCountdown = in.b; p.mBodyReanimID = in.c;
        };
        RunTarget("5 kCobCannonStateCases 4", A_Cob, B_Cob,
            g_objA, g_pristineA, prepA, g_objB, g_pristineB, prepB, g_in, NIN);
    }

    // ---- #6 Cactus：mState 0..48 全宽（表覆盖 31..33 段，其余落默认支）
    GenInputs(g_in, NIN, 0x6666, 49, 4, 16, 5);
    {
        auto prepA = [](FA::Plant& p, const In& in) {
            p.mState = (PlantState)in.a; p.mShootingCounter = 0; p.mRow = in.d; p.mBodyReanimID = in.b;
            g_zHitFlag = (in.c & 1); g_zIdx = in.c >> 1;
        };
        auto prepB = [](FB::Plant& p, const In& in) {
            p.mState = (PlantState)in.a; p.mShootingCounter = 0; p.mRow = in.d; p.mBodyReanimID = in.b;
            g_zHitFlag = (in.c & 1); g_zIdx = in.c >> 1;
        };
        RunTarget("6 kCactusStateCases 3", A_Cactus, B_Cactus,
            g_objA, g_pristineA, prepA, g_objB, g_pristineB, prepB, g_in, NIN);
    }

    // ---- #7 Bowling：mLaunchCounter 0..7 覆盖 4 币支 + WALLNUT 主导
    GenInputs(g_in, NIN, 0x7777, 8, 5, 16, 3);
    {
        auto prepA = [](FA::Plant& p, const In& in) {
            p.mSeedType = in.b == 0 ? SeedType::SEED_WALLNUT : (in.b == 1 ? SeedType::SEED_GIANT_WALLNUT : (in.b == 2 ? SeedType::SEED_EXPLODE_O_NUT : SeedType::SEED_SQUASH));
            p.mLaunchCounter = in.a; p.mState = (in.d & 1) ? PlantState::STATE_BOWLING_UP : PlantState::STATE_BOWLING_DOWN;
            p.mRow = in.d; p.mWidth = 80; p.mHeight = 80; p.mX = 400; p.mY = p.mRow * 100 + 50 + (int)(in.c & 7) - 3;
            p.mBodyReanimID = 1; g_zHitFlag = (in.c & 15) != 0; g_zIdx = in.c >> 2;
        };
        auto prepB = [](FB::Plant& p, const In& in) {
            p.mSeedType = in.b == 0 ? SeedType::SEED_WALLNUT : (in.b == 1 ? SeedType::SEED_GIANT_WALLNUT : (in.b == 2 ? SeedType::SEED_EXPLODE_O_NUT : SeedType::SEED_SQUASH));
            p.mLaunchCounter = in.a; p.mState = (in.d & 1) ? PlantState::STATE_BOWLING_UP : PlantState::STATE_BOWLING_DOWN;
            p.mRow = in.d; p.mWidth = 80; p.mHeight = 80; p.mX = 400; p.mY = p.mRow * 100 + 50 + (int)(in.c & 7) - 3;
            p.mBodyReanimID = 1; g_zHitFlag = (in.c & 15) != 0; g_zIdx = in.c >> 2;
        };
        RunTarget("7 kBowlingBounceCoins 4", A_Bowling, B_Bowling,
            g_objA, g_pristineA, prepA, g_objB, g_pristineB, prepB, g_in, NIN);
    }

    // ---- #8 Blink：mSeedType 0..52 全宽
    GenInputs(g_in, NIN, 0x8888, 53, 8, 8, 5);
    {
        auto prepA = [](FA::Plant& p, const In& in) {
            p.mSeedType = (SeedType)in.a; p.mHeadReanimID = in.b; p.mHeadReanimID2 = in.c; p.mBodyReanimID = in.d;
        };
        auto prepB = [](FB::Plant& p, const In& in) {
            p.mSeedType = (SeedType)in.a; p.mHeadReanimID = in.b; p.mHeadReanimID2 = in.c; p.mBodyReanimID = in.d;
        };
        RunTarget("8 kBlinkCases 53", A_Blink, B_Blink,
            g_objA, g_pristineA, prepA, g_objB, g_pristineB, prepB, g_in, NIN);
    }

    return 0;
}
