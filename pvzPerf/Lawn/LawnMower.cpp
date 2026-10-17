#include "Board.h"
#include "ZombieFlags.h"
#include "Cutscene.h"
#include "LawnMower.h"
#include "LawnApp.h"
#include "System/ReanimationLawn.h"
#include "Sexy.TodLib/TodFoley.h"
#include "Sexy.TodLib/Reanimator.h"

//0x458000
void LawnMower::LawnMowerInitialize(int theRow)
{
    mApp = (LawnApp*)gSexyAppBase;
    mRow = theRow;
    mPosX = -160.0f;
    mBoard = mApp->mBoard;
    mRenderOrder = Board::MakeRenderOrder(RenderLayer::RENDER_LAYER_LAWN_MOWER, theRow, 0);
    mPosY = mBoard->GetPosYBasedOnRow(mPosX + 40.0f, theRow) + 23.0f;
    mDead = false;
    mMowerState = LawnMowerState::MOWER_READY;
    mVisible = true;
    mChompCounter = 0;
    mRollingInCounter = 0;
    mSquishedCounter = 0;
    mLastPortalX = -1;

    ReanimationType aReanimType;
    if (mBoard->StageHasRoof())
    {
        mMowerType = LawnMowerType::LAWNMOWER_ROOF;
        aReanimType = ReanimationType::REANIM_ROOF_CLEANER;
    }
    else if (mBoard->mPlantRow[mRow] == PlantRowType::PLANTROW_POOL && mApp->mPlayerInfo->mPurchases[(int)StoreItem::STORE_ITEM_POOL_CLEANER])
    {
        mMowerType = LawnMowerType::LAWNMOWER_POOL;
        aReanimType = ReanimationType::REANIM_POOL_CLEANER;
    }
    else
    {
        mMowerType = LawnMowerType::LAWNMOWER_LAWN;
        aReanimType = ReanimationType::REANIM_LAWNMOWER;
    }

    Reanimation* aMowerReanim = mApp->AddReanimation(0.0f, 18.0f, mRenderOrder, aReanimType);
    aMowerReanim->mAnimRate = 0.0f;
    aMowerReanim->mLoopType = ReanimLoopType::REANIM_LOOP;
    aMowerReanim->mIsAttachment = true;
    aMowerReanim->mOverlayMatrix.m00 = 0.85f;
    aMowerReanim->mOverlayMatrix.m11 = 0.85f;
    mReanimID = mApp->ReanimationGetID(aMowerReanim);

    if (mMowerType == LawnMowerType::LAWNMOWER_LAWN)
    {
        aMowerReanim->SetFramesForLayer(ReanimTrackId::anim_normal);
    }
    else if (mMowerType == LawnMowerType::LAWNMOWER_POOL)
    {
        aMowerReanim->mOverlayMatrix.m00 = 0.8f;
        aMowerReanim->mOverlayMatrix.m11 = 0.8f;
        aMowerReanim->SetFramesForLayer(ReanimTrackId::anim_land);
        aMowerReanim->SetTruncateDisappearingFramesAll( false);
    }

    if (mBoard->mSuperMowerMode && mMowerType == LawnMowerType::LAWNMOWER_LAWN)
    {
        EnableSuperMower(true);
    }
}

namespace
{
// LawnMower::UpdatePool 分发表：表内匿名 lambda = 原 case 体逐句迁移；
// isPoolRange 与 aMowerReanim 经参传入（原 LAND 支内联 isPoolRange 前置，
// 不满足时原链各支均不命中 = 空操作）。
using MowerPoolFn = void (*)(LawnMower&, bool, Reanimation*);

// 匿名 lambda 函数指针表，行序 = MowerHeight 枚举值序（0..3）。
constexpr MowerPoolFn kMowerPoolCases[(int)MowerHeight::MOWER_HEIGHT_UP_TO_LAND + 1] = {
    // 原 case MOWER_HEIGHT_LAND（isPoolRange 前置）
    [](LawnMower& m, bool isPoolRange, Reanimation* aMowerReanim)
    {
        (void)aMowerReanim;
        if (isPoolRange)
        {
            Reanimation* aSplashReanim = m.mApp->AddReanimation(m.mPosX + 0.0f, m.mPosY + 25.0f, m.mRenderOrder + 1, ReanimationType::REANIM_SPLASH);
            aSplashReanim->mOverlayMatrix.m00 = 1.2f;
            aSplashReanim->mOverlayMatrix.m11 = 0.8f;
            m.mApp->AddTodParticle(m.mPosX + 0.0f + 50.0f, m.mPosY + 0.0f + 42.0f, m.mRenderOrder + 1, ParticleEffect::PARTICLE_PLANTING_POOL);
            m.mApp->PlayFoley(FoleyType::FOLEY_ZOMBIESPLASH);
            m.mMowerHeight = MowerHeight::MOWER_HEIGHT_DOWN_TO_POOL;
        }
    },  // 0 MOWER_HEIGHT_LAND
    // 原 case MOWER_HEIGHT_DOWN_TO_POOL
    [](LawnMower& m, bool isPoolRange, Reanimation* aMowerReanim)
    {
        (void)isPoolRange;
        m.mAltitude -= 2.0f;
        if (m.mAltitude <= -28.0f)
        {
            m.mAltitude = 0.0f;
            m.mMowerHeight = MowerHeight::MOWER_HEIGHT_IN_POOL;
            aMowerReanim->PlayReanim(ReanimTrackId::anim_water, ReanimLoopType::REANIM_LOOP, 0, 0.0f);
        }
    },  // 1 MOWER_HEIGHT_DOWN_TO_POOL
    // 原 case MOWER_HEIGHT_IN_POOL（!isPoolRange 时改上浮）
    [](LawnMower& m, bool isPoolRange, Reanimation* aMowerReanim)
    {
        if (!isPoolRange)
        {
            m.mAltitude = -28.0f;
            m.mMowerHeight = MowerHeight::MOWER_HEIGHT_UP_TO_LAND;
            Reanimation* aSplashReanim = m.mApp->AddReanimation(m.mPosX + 0.0f, m.mPosY + 25.0f, m.mRenderOrder + 1, ReanimationType::REANIM_SPLASH);
            aSplashReanim->mOverlayMatrix.m00 = 1.2f;
            aSplashReanim->mOverlayMatrix.m11 = 0.8f;
            m.mApp->AddTodParticle(m.mPosX + 0.0f + 50.0f, m.mPosY + 0.0f + 42.0f, m.mRenderOrder + 1, ParticleEffect::PARTICLE_PLANTING_POOL);
            m.mApp->PlayFoley(FoleyType::FOLEY_PLANT_WATER);
            aMowerReanim->PlayReanim(ReanimTrackId::anim_land, ReanimLoopType::REANIM_LOOP, 0, 0.0f);
        }
    },  // 2 MOWER_HEIGHT_IN_POOL
    // 原 case MOWER_HEIGHT_UP_TO_LAND
    [](LawnMower& m, bool isPoolRange, Reanimation* aMowerReanim)
    {
        (void)isPoolRange;
        (void)aMowerReanim;
        m.mAltitude += 2.0f;
        if (m.mAltitude >= 0.0f)
        {
            m.mAltitude = 0.0f;
            m.mMowerHeight = MowerHeight::MOWER_HEIGHT_LAND;
        }
    },  // 3 MOWER_HEIGHT_UP_TO_LAND
};
static_assert(sizeof(kMowerPoolCases) / sizeof(kMowerPoolCases[0]) ==
    (int)MowerHeight::MOWER_HEIGHT_UP_TO_LAND + 1, "kMowerPoolCases 槽位数须与 MowerHeight 枚举同步");
}  // namespace

//0x4581E0
void LawnMower::UpdatePool()
{
    bool isPoolRange = false;
    if (mPosX > 26.0f && mPosX < 660.0f)
    {
        isPoolRange = true;
    }

    Reanimation* aMowerReanim = mApp->ReanimationGet(mReanimID);

    // C 形态 -> 匿名 lambda 表（上方 kMowerPoolCases）：行序 = MowerHeight
    // 枚举序（0..3，无 NUM 哨兵=末值 UP_TO_LAND 锚定）；原 LAND 支的
    // isPoolRange 前置保留在 lambda 内（不满足 = 原链四支皆不命中）。
    const unsigned aHeightIndex = static_cast<unsigned>(mMowerHeight);
    if (aHeightIndex <= static_cast<unsigned>(MowerHeight::MOWER_HEIGHT_UP_TO_LAND))
    {
        kMowerPoolCases[aHeightIndex](*this, isPoolRange, aMowerReanim);
    }

    if (mMowerHeight == MowerHeight::MOWER_HEIGHT_IN_POOL && aMowerReanim->mLoopType == ReanimLoopType::REANIM_PLAY_ONCE_AND_HOLD && aMowerReanim->mLoopCount > 0)
    {
        aMowerReanim->PlayReanim(ReanimTrackId::anim_water, ReanimLoopType::REANIM_LOOP, 10, 35.0f);
    }
}

//0x458540
void LawnMower::MowZombie(Zombie* theZombie)
{
    if (mMowerState == LawnMowerState::MOWER_READY)
    {
        StartMower();
        mChompCounter = 25;
    }
    else if (mMowerState == LawnMowerState::MOWER_TRIGGERED)
    {
        mChompCounter = 50;
    }

    if (mMowerType == LawnMowerType::LAWNMOWER_POOL)
    {
        mApp->PlayFoley(FoleyType::FOLEY_SHOOP);
        if (mMowerHeight == MowerHeight::MOWER_HEIGHT_IN_POOL)
        {
            Reanimation* aMowerReanim = mApp->ReanimationGet(mReanimID);
            aMowerReanim->PlayReanim(ReanimTrackId::anim_suck, ReanimLoopType::REANIM_PLAY_ONCE_AND_HOLD, 10, 35.0f);
        }
        else
        {
            Reanimation* aMowerReanim = mApp->ReanimationGet(mReanimID);
            aMowerReanim->PlayReanim(ReanimTrackId::anim_landsuck, ReanimLoopType::REANIM_PLAY_ONCE_AND_HOLD, 10, 35.0f);
        }

        theZombie->DieWithLoot();
    }
    else
    {
        mApp->PlayFoley(FoleyType::FOLEY_SPLAT);
        theZombie->MowDown();
    }
}

//0x4586E0
void LawnMower::Update()
{
    if (mMowerState == LawnMowerState::MOWER_SQUISHED)
    {
        mSquishedCounter--;
        if (mSquishedCounter <= 0)
        {
            Die();
        }
        return;
    }

    if (mMowerState == LawnMowerState::MOWER_ROLLING_IN)
    {
        mRollingInCounter++;
        mPosX = TodAnimateCurveFloat(0, 100, mRollingInCounter, -160.0f, -21.0f, Curves::EaseInOut);
        if (mRollingInCounter == 100)
        {
            mMowerState = LawnMowerState::MOWER_READY;
        }
        return;
    }

    if (mApp->mGameScene != GameScenes::SCENE_PLAYING && !mBoard->mCutScene->ShouldRunUpsellBoard())
    {
        return;
    }

    Rect aAttackRect = GetLawnMowerAttackRect();
    Zombie* aZombie = nullptr;
    // 行段纯行路径（2026-10-04 用户裁决：主动偏离 1073，删 Boss 检测——
    // 割草机不能击杀/伤害僵王；纯行段迭代不吐 Boss，体内 Boss 判定删除）
    while (mBoard->IterateZombiesInRowOnly(mRow, aZombie))
    {
        if (aZombie->mZombiePhase != ZombiePhase::PHASE_ZOMBIE_MOWERED && 
            !aZombie->IsTangleKelpTarget() && 
            aZombie->EffectedByDamage(127U))
        {
            Rect aZombieRect = aZombie->GetZombieRect();
            int aOverlap = GetRectOverlap(aAttackRect, aZombieRect);
            if (aOverlap > (aZombie->mZombieType == ZombieType::ZOMBIE_BALLOON ? 20 : 0))
            {
                // �ļ���ʬ���������Ľ�ʬ������������С�Ƴ�
                if (mMowerState != LawnMowerState::MOWER_READY || (aZombie->mZombieType != ZombieType::ZOMBIE_BUNGEE && aZombie->mHasHead))
                {
                    MowZombie(aZombie);
                }
            }
        }
    }

    if (mMowerState != LawnMowerState::MOWER_TRIGGERED && mMowerState != LawnMowerState::MOWER_SQUISHED)
    {
        return;
    }

    float aSpeed = 3.33f;
    if (mMowerType == LawnMowerType::LAWNMOWER_POOL)
    {
        aSpeed = 2.5f;
    }
    if (mChompCounter > 0)
    {
        mChompCounter--;
        aSpeed = TodAnimateCurveFloat(50, 0, mChompCounter, aSpeed, 1.0f, Curves::BounceSlowMiddle);
    }
    mPosX += aSpeed;
    mPosY = mBoard->GetPosYBasedOnRow(mPosX + 40.0f, mRow) + 23.0f;

    if (mMowerType == LawnMowerType::LAWNMOWER_POOL)
    {
        UpdatePool();
    }
    if (mMowerType == LawnMowerType::LAWNMOWER_LAWN && mBoard->mPlantRow[mRow] == PlantRowType::PLANTROW_POOL && mPosX > 50.0f)
    {
        Reanimation* aSplashReanim = mApp->AddReanimation(mPosX, mPosY + 25.0f, mRenderOrder + 1, ReanimationType::REANIM_SPLASH);
        aSplashReanim->mOverlayMatrix.m00 = 1.2f;
        aSplashReanim->mOverlayMatrix.m11 = 0.8f;
        mApp->AddTodParticle(mPosX + 50.0f, mPosY + 67.0f, mRenderOrder + 1, ParticleEffect::PARTICLE_PLANTING_POOL);
        mApp->PlaySample(SOUND_ZOMBIE_ENTERING_WATER);
        mApp->mSoundSystem->StopFoley(FoleyType::FOLEY_LAWNMOWER);
        Die();
    }
    if (mPosX > WIDE_BOARD_WIDTH)
    {
        Die();
    }

    mApp->ReanimationGet(mReanimID)->Update();
}

//0x458A80
void LawnMower::Draw(Graphics* g)
{
    if (!mVisible)
        return;

    if (mMowerHeight != MowerHeight::MOWER_HEIGHT_UP_TO_LAND && 
        mMowerHeight != MowerHeight::MOWER_HEIGHT_DOWN_TO_POOL && 
        mMowerHeight != MowerHeight::MOWER_HEIGHT_IN_POOL && 
        mMowerState != LawnMowerState::MOWER_SQUISHED)
    {
        int aShadowType = 0;
        float aScaleX = 1.0f;
        float aScaleY = 1.0f;
        if (mBoard->StageIsNight())
        {
            aShadowType = 1;
        }

        float aShadowX = mPosX - 7.0f;
        float aShadowY = mPosY - mAltitude + 47.0f;
        if (mMowerType == LawnMowerType::LAWNMOWER_POOL)
        {
            aShadowX -= 17.0f;
            aShadowY -= 8.0f;
        }
        if (mMowerType == LawnMowerType::LAWNMOWER_ROOF)
        {
            aShadowX -= 9.0f;
            aShadowY -= 36.0f;
            aScaleY = 1.2f;
            if (mMowerState == LawnMowerState::MOWER_TRIGGERED)
            {
                aShadowY += 36.0f;
            }
        }

        if (aShadowType == 0)
        {
            TodDrawImageCelCenterScaledF(g, IMAGE_PLANTSHADOW, aShadowX, aShadowY, 0, aScaleX, aScaleY);
        }
        else
        {
            TodDrawImageCelCenterScaledF(g, IMAGE_PLANTSHADOW2, aShadowX, aShadowY, 0, aScaleX, aScaleY);
        }
    }

    Graphics aMowerGraphics(*g);
    aMowerGraphics.mTransX += mPosX + 6.0f;
    aMowerGraphics.mTransY += mPosY - mAltitude;
    if (mMowerType == LawnMowerType::LAWNMOWER_POOL)
    {
        if (mMowerState == LawnMowerState::MOWER_TRIGGERED)
        {
            aMowerGraphics.mTransY -= 7.0f;
            aMowerGraphics.mTransX -= 10.0f;
        }
        else
        {
            aMowerGraphics.mTransY -= 33.0f;
        }

        if (mMowerHeight == MowerHeight::MOWER_HEIGHT_UP_TO_LAND || mMowerHeight == MowerHeight::MOWER_HEIGHT_DOWN_TO_POOL)
        {
            aMowerGraphics.SetClipRect(-50, -50, 150, 132 + mAltitude);
        }
    }
    else if (mMowerType == LawnMowerType::LAWNMOWER_ROOF)
    {
        if (mMowerState == LawnMowerState::MOWER_TRIGGERED)
        {
            aMowerGraphics.mTransY -= 4.0f;
            aMowerGraphics.mTransX -= 10.0f;
        }
        else
        {
            aMowerGraphics.mTransY -= 40.0f;
        }
    }

    if (mMowerState == LawnMowerState::MOWER_TRIGGERED || mMowerState == LawnMowerState::MOWER_SQUISHED)
    {
        mApp->ReanimationGet(mReanimID)->Draw(&aMowerGraphics);
    }
    else
    {
        LawnMowerType aMowerType = mMowerType;
        if (mMowerType == LawnMowerType::LAWNMOWER_LAWN && mBoard->mSuperMowerMode)
        {
            aMowerType = LawnMowerType::LAWNMOWER_SUPER_MOWER;
        }
        mApp->mReanimatorCache->DrawCachedMower(&aMowerGraphics, 0.0f, 19.0f, aMowerType);
    }
}

//0x458D10
void LawnMower::Die()
{
    mDead = true;
    mApp->RemoveReanimation(mReanimID);
    if (mBoard->mBonusLawnMowersRemaining > 0 && !mBoard->HasLevelAwardDropped())
    {
        LawnMower* aLawnMower = mBoard->mLawnMowers.DataArrayAlloc();
        aLawnMower->LawnMowerInitialize(mRow);
        aLawnMower->mMowerState = LawnMowerState::MOWER_ROLLING_IN;
        mBoard->mBonusLawnMowersRemaining--;
    }
}

//0x458DA0
void LawnMower::StartMower()
{
    if (mMowerState == LawnMowerState::MOWER_TRIGGERED)
    {
        return;
    }

    Reanimation* aMowerReanim = mApp->ReanimationGet(mReanimID);
    if (mMowerType == LawnMowerType::LAWNMOWER_POOL)
    {
        aMowerReanim->mAnimRate = 35.0f;
        mApp->PlayFoley(FoleyType::FOLEY_POOL_CLEANER);
    }
    else
    {
        aMowerReanim->mAnimRate = 70.0f;
        mApp->PlayFoley(FoleyType::FOLEY_LAWNMOWER);
    }

    mBoard->mWaveRowGotLawnMowered[mRow] = mBoard->mCurrentWave;
    mBoard->mTriggeredLawnMowers++;
    mMowerState = LawnMowerState::MOWER_TRIGGERED;
}

//0x458EB0
void LawnMower::SquishMower()
{
    Reanimation* aMowerReanim = mApp->ReanimationGet(mReanimID);
    aMowerReanim->mOverlayMatrix.m00 = 0.85f;
    aMowerReanim->mOverlayMatrix.m11 = 0.22f;
    aMowerReanim->mOverlayMatrix.m02 = -11.0f;
    aMowerReanim->mOverlayMatrix.m12 = 65.0f;

    mMowerState = LawnMowerState::MOWER_SQUISHED;
    mSquishedCounter = 500;
    mApp->PlayFoley(FoleyType::FOLEY_SQUISH);
}

//0x458F60
void LawnMower::EnableSuperMower(bool theEnable) // Is theEnable being unused a bug?
{
    (void)theEnable;
    if (mMowerType == LawnMowerType::LAWNMOWER_LAWN)
    {
        mApp->ReanimationGet(mReanimID)->SetFramesForLayer(ReanimTrackId::anim_tricked);
    }
}
