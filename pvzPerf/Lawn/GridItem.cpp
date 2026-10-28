#include "EffectSystem.h"
#include "Board.h"
#include "GridItem.h"
#include "Challenge.h"
#include "ZenGarden.h"
#include "LawnApp.h"
#include "SeedPacket.h"
#include "CursorObject.h"
#include "Resources.h"
#include "MessageWidget.h"
#include "System/ReanimationLawn.h"
#include "Sexy.TodLib/TodFoley.h"
#include "Sexy.TodLib/Reanimator.h"
#include "Sexy.TodLib/TodParticle.h"
#include "widget/WidgetManager.h"
#include "graphics/AtlasDraw.h"
#include "Sexy.TodLib/generated/SceneAtlasData.h"

using namespace Sexy;

//0x44CFA0
GridItem::GridItem()
{
    mApp = (LawnApp*)gSexyAppBase;
    mPosX = 0.0f;
    mPosY = 0.0f;
    mBoard = mApp->mBoard;
    mGoalX = 0.0f;
    mGoalY = 0.0f;
    mGridItemType = GridItemType::GRIDITEM_NONE;
    mGridX = 0;
    mGridY = 0;
    mStateEndTimeNs = 0;
    mRenderOrder = 0;
    mDead = false;
    mGridItemReanimID = ReanimationID::REANIMATIONID_NULL;
    mGridItemParticleID = ParticleSystemID::PARTICLESYSTEMID_NULL;
    mZombieType = ZombieType::ZOMBIE_INVALID;
    mSeedType = SeedType::SEED_NONE;
    mScaryPotType = ScaryPotType::SCARYPOT_NONE;
    mHighlighted = false;
    mTransparencyTimeNs = 0;
    mTransparencyIncreasing = false;
    mSunCount = 0;
    mMotionTrailCount = 0;
}

//0x44D000
void GridItem::GridItemDie()
{
    mDead = true;
    
    Reanimation* aGridItemReanim = mApp->ReanimationTryToGet(mGridItemReanimID);
    if (aGridItemReanim)
    {
        aGridItemReanim->ReanimationDie();
        mGridItemReanimID = ReanimationID::REANIMATIONID_NULL;
    }

    TodParticleSystem* aGridItemParticle = mApp->ParticleTryToGet(mGridItemParticleID);
    if (aGridItemParticle)
    {
        aGridItemParticle->ParticleSystemDie();
    }
}

//0x44D070
void GridItem::DrawGridItemOverlay(Graphics* g)
{
    if (mGridItemType == GridItemType::GRIDITEM_STINKY)
    {
        if (mBoard->mCursorObject->mCursorType == CursorType::CURSOR_TYPE_CHOCOLATE && !mApp->mZenGarden->IsStinkyHighOnChocolate())
        {
            g->DrawImage(IMAGE_PLANTSPEECHBUBBLE, mPosX + 50.0f, mPosY - 36.0f);
            TodDrawImageScaledF(g, IMAGE_CHOCOLATE, mPosX + 63.0f, mPosY - 28.0f, 0.44f, 0.44f);
        }
    }
}

//0x44D140
void GridItem::DrawGridItem(Graphics* g)
{
    // 原版 switch 保留（对拍 2026-10-03：成员函数指针表 +14~19% 回归——
    // 双重间接调用且阻断内联，13 case 直接调用可被内联折叠；间接调用惩罚
    // 边界又一实证，见账本裁剪函数行）。
    switch (mGridItemType)
    {
    case GridItemType::GRIDITEM_GRAVESTONE:         DrawGraveStone(g);                              break;
    case GridItemType::GRIDITEM_CRATER:             DrawCrater(g);                                  break;
    case GridItemType::GRIDITEM_LADDER:             DrawLadder(g);                                  break;
    case GridItemType::GRIDITEM_PORTAL_CIRCLE:                                                      break;
    case GridItemType::GRIDITEM_PORTAL_SQUARE:                                                      break;
    case GridItemType::GRIDITEM_ZEN_TOOL:                                                           break;
    case GridItemType::GRIDITEM_RAKE:                                                               break;
    case GridItemType::GRIDITEM_BRAIN:              g->DrawImageF(IMAGE_BRAIN, mPosX, mPosY);       break;
    case GridItemType::GRIDITEM_SCARY_POT:          DrawScaryPot(g);                                break;
    // 1073 004503F0 has no squirrel sprite draw; keep the gameplay object invisible.
    case GridItemType::GRIDITEM_SQUIRREL:                                                          break;
    case GridItemType::GRIDITEM_STINKY:             DrawStinky(g);                                  break;
    case GridItemType::GRIDITEM_IZOMBIE_BRAIN:      DrawIZombieBrain(g);                            break;
    default:                                        TOD_ASSERT(false);                                   break;
    }

    Reanimation* aGridItemReanim = mApp->ReanimationTryToGet(mGridItemReanimID);
    if (aGridItemReanim)
    {
        aGridItemReanim->Draw(g);
    }

    TodParticleSystem* aGridItemParticle = mApp->ParticleTryToGet(mGridItemParticleID);
    if (aGridItemParticle)
    {
        aGridItemParticle->Draw(g);
    }
}

//0x44D250
void GridItem::DrawIZombieBrain(Graphics* g)
{
    const auto nowNs=static_cast<std::int64_t>(mBoard->mLevelTimeNs);
    const auto transparencyNs=mTransparencyIncreasing
        ? std::clamp<std::int64_t>(nowNs-mTransparencyTimeNs,0,500'000'000)
        : std::max<std::int64_t>(0,mTransparencyTimeNs-nowNs);
    if (mGridItemState == GridItemState::GRIDITEM_STATE_BRAIN_SQUISHED)
    {
        TodDrawImageScaledF(g, IMAGE_BRAIN, mPosX, mPosY + 20.0f, 1.0f, 0.25f);
        return;
    }

    if (mBoard->mAdvice->mEndTimeNs > static_cast<std::int64_t>(mBoard->mLevelTimeNs) && mBoard->mHelpIndex == AdviceType::ADVICE_I_ZOMBIE_EAT_ALL_BRAINS)
    {
        Color aFlashingColor = GetFlashingColorNs(mBoard->mLevelTimeNs, 750'000'000);
        g->mColorizeImages = true;
        g->mColor = aFlashingColor;
    }

    g->DrawImageF(IMAGE_BRAIN, mPosX, mPosY);
    if (transparencyNs > 0)
    {
        g->mDrawMode = Graphics::DRAWMODE_ADDITIVE;
        g->mColorizeImages = true;
        g->mColor = Color(255, 255, 255, ClampInt(static_cast<int>(transparencyNs * 3 / 10'000'000), 0, 255));
        g->DrawImageF(IMAGE_BRAIN, mPosX, mPosY);
        g->mDrawMode = Graphics::DRAWMODE_NORMAL;
        g->mColorizeImages = false;
    }

    g->mColorizeImages = false;
}

//0x44D3A0
// GOTY @Patoke: 0x450673
void GridItem::DrawGraveStone(Graphics* g)
{
    const auto ageNs=static_cast<std::int64_t>(mBoard->mLevelTimeNs)-mStateStartTimeNs;
    if (ageNs <= 0)
        return;

    int aHeightPosition = TodAnimateCurveNs(0, 1'000'000'000, ageNs, 1000, 0, Curves::EaseInOut);
    int aGridCelLook = mBoard->mGridCelLook[mGridX][mGridY];
    int aGridCelOffsetX = mBoard->mGridCelOffset[mGridX][mGridY][0];
    int aGridCelOffsetY = mBoard->mGridCelOffset[mGridX][mGridY][1];
    constexpr int aCelWidth = 86;
    constexpr int aCelHeight = 91;
    int aGraveCol = aGridCelLook % 5;
    int aGraveRow;
    if (mGridY == 0)
    {
        aGraveRow = 1;
    }
    else if (mGridItemState == GridItemState::GRIDITEM_STATE_GRAVESTONE_SPECIAL)
    {
        aGraveRow = 0;
    }
    else
    {
        aGraveRow = 2 + aGridCelLook % 2;
    }

    int aVisibleHeight = TodAnimateCurve(0, 1000, aHeightPosition, aCelHeight, 0, Curves::EaseInOut);
    int aExtraBottomClip = TodAnimateCurve(0, 50, aHeightPosition, 0, 14, Curves::EaseInOut);
    int aVisibleHeightDirt = TodAnimateCurve(500, 1000, aHeightPosition, aCelHeight, 0, Curves::EaseInOut);
    int aExtraTopClip = 0;
    Plant* aPlant = mBoard->GetTopPlantAt(mGridX, mGridY, PlantPriority::TOPPLANT_ONLY_NORMAL_POSITION);
    if (aPlant && aPlant->mState == PlantState::STATE_GRAVEBUSTER_EATING)
    {
        aExtraTopClip = TodAnimateCurveNs(4'000'000'000LL, 0, aPlant->mStateCountdown.mNanoseconds, 10.0f, 40.0f, Curves::Linear);
    }

    Rect aSrcRect(aCelWidth * aGraveCol, aCelHeight * aGraveRow + aExtraTopClip, aCelWidth, aVisibleHeight - aExtraBottomClip - aExtraTopClip);
    Rect aSrcRectDirt(aCelWidth * aGraveCol, aCelHeight * aGraveRow, aCelWidth, aVisibleHeightDirt);
    int x = mBoard->GridToPixelX(mGridX, mGridY) + aGridCelOffsetX - 4;
    int y = mBoard->GridToPixelY(mGridX, mGridY) + aCelHeight + aGridCelOffsetY - 9;
    g->DrawImage(IMAGE_TOMBSTONES, x, y - aVisibleHeight + aExtraTopClip, aSrcRect);
    g->DrawImage(IMAGE_TOMBSTONE_MOUNDS, x, y - aVisibleHeightDirt, aSrcRectDirt);
}

//0x44D690
void GridItem::DrawStinky(Graphics* g)
{
    Reanimation* aStinkyReanim = mApp->ReanimationGet(mGridItemReanimID);
    const auto aOriginalFrame = aStinkyReanim->mCurrentFrame;
    const auto aOriginalStart = aStinkyReanim->mStartTimeNs;
    const float aOriginalTransX = g->mTransX;
    const float aOriginalTransY = g->mTransY;

    TOD_ASSERT(mMotionTrailCount <= NUM_MOTION_TRAIL_FRAMES);
    for (int i = mMotionTrailCount - 1; i >= 0; i--)
    {
        if (i % 2)
        {
            MotionTrailFrame& aFrame = mMotionTrailFrames[i];
            float aDiffX = aFrame.mPosX - mPosX;
            float aDiffY = aFrame.mPosY - mPosY;

            int anAlpha = TodAnimateCurve(0, 11, i, 64, 16, Curves::Linear);
            g->mColor = Color(255, 255, 255, anAlpha);
            g->mColorizeImages = true;
            const auto phase = ReanimClock::SignedMulDiv(aFrame.mAnimClock,
                aStinkyReanim->mPeriodNs, aStinkyReanim->mFrameCount * ReanimClock::Frame);
            const auto q = aStinkyReanim->mFramePeriodNs;
            const auto remainder = phase % q;
            const bool reverse = aStinkyReanim->mAnimRate < 0;
            aStinkyReanim->mCurrentFrame = int(phase / q + (reverse && remainder != 0));
            const auto age = reverse && remainder != 0 ? q - remainder : remainder;
            const auto now = aStinkyReanim->mAnimRate == 0 ? aStinkyReanim->mLastUpdateTimeNs :
                aStinkyReanim->mTimeDomain == ReanimTimeDomain::Battle ?
                    aStinkyReanim->mReanimationHolder->mBattleTimeNs :
                    aStinkyReanim->mReanimationHolder->mVisualTimeNs;
            aStinkyReanim->mStartTimeNs = ReanimClock::Subtract(now, age);

            g->mTransX = aOriginalTransX + aDiffX;
            g->mTransY = aOriginalTransY + aDiffY;
            aStinkyReanim->Draw(g);

            g->mColorizeImages = false;
            // Floating-point addition/subtraction need not restore the input.
            g->mTransX = aOriginalTransX;
            g->mTransY = aOriginalTransY;
        }
    }
    aStinkyReanim->mCurrentFrame = aOriginalFrame;
    aStinkyReanim->mStartTimeNs = aOriginalStart;

    if (mGridItemType == GridItemType::GRIDITEM_STINKY && mHighlighted)
    {
        aStinkyReanim->mEnableExtraAdditiveDraw = true;
        aStinkyReanim->mExtraAdditiveColor = Color(255, 255, 255, 196);
    }
    aStinkyReanim->Draw(g);
    aStinkyReanim->mEnableExtraAdditiveDraw = false;
}

//0x44D860
// GOTY @Patoke: 0x450B39
void GridItem::DrawCrater(Graphics* g)
{
    const auto remainingNs=std::max<std::int64_t>(0,mStateEndTimeNs-static_cast<std::int64_t>(mBoard->mLevelTimeNs));
    float aXPos = mBoard->GridToPixelX(mGridX, mGridY) - 8.0f;
    float aYPos = mBoard->GridToPixelY(mGridX, mGridY) + 40.0f;
    if (remainingNs < 250'000'000)
    {
        int anAlpha = TodAnimateCurveNs(250'000'000, 0, remainingNs, 255, 0, Curves::Linear);
        g->mColor = Color(255, 255, 255, anAlpha);
        g->mColorizeImages = true;
    }

    bool fading = remainingNs < 90'000'000'000;
    Image* aImage = IMAGE_CRATER;
    Rect aSource(0, 0, 90, 61);

    if (mBoard->IsPoolSquare(mGridX, mGridY))
    {
        if (mBoard->StageIsNight())
        {
            aImage = IMAGE_CRATER_WATER_NIGHT;
        }
        else
        {
            aImage = IMAGE_CRATER_WATER_DAY;
        }
        aSource = Rect(0, 0, 85, 53);

        if (fading)
        {
            aSource.mX = 85;
        }

		constexpr std::uint64_t CRATER_WAVE_PERIOD_NS = 2'000'000'000;
        float aPos = mGridY * PI + mGridX * PI * 0.25f;
		float aTime = static_cast<float>(double(mBoard->mLevelTimeNs % CRATER_WAVE_PERIOD_NS) /
			CRATER_WAVE_PERIOD_NS) * PI * 2.0f;
        aYPos += sin(aPos + aTime) * 2.0f;
    }
    else if (mBoard->StageHasRoof())
    {
        if (mGridX < 5)
        {
            aImage = IMAGE_CRATER_ROOF_LEFT;
            aSource = Rect(0, 0, 75, 87);
            aXPos += 16.0f;
            aYPos += -16.0f;
        }
        else
        {
            aImage = IMAGE_CRATER_ROOF_CENTER;
            aSource = Rect(0, 0, 75, 77);
            aXPos += 18.0f;
            aYPos += -9.0f;
        }

        if (fading)
        {
            aSource.mX = 75;
        }
    }
    else if (mBoard->StageIsNight())
    {
        aSource.mX = 90;
        if (fading)
        {
            aImage = IMAGE_CRATER_FADING;
        }
    }
    else if (fading)
    {
        aImage = IMAGE_CRATER_FADING;
    }

    TodDrawImageRectF(g, aImage, aXPos, aYPos, aSource);
    g->mColorizeImages = false;
}

//0x44DB00
void GridItem::DrawScaryPot(Graphics* g)
{
    const auto nowNs=static_cast<std::int64_t>(mBoard->mLevelTimeNs);
    const auto transparencyNs=mTransparencyIncreasing
        ? std::clamp<std::int64_t>(nowNs-mTransparencyTimeNs,0,500'000'000)
        : std::max<std::int64_t>(0,mTransparencyTimeNs-nowNs);
    int aImageCol = (int)mGridItemState - (int)GridItemState::GRIDITEM_STATE_SCARY_POT_QUESTION;
    TOD_ASSERT(aImageCol >= 0 && aImageCol < 3);

    int aXPos = mBoard->GridToPixelX(mGridX, mGridY) - 5;
    int aYPos = mBoard->GridToPixelY(mGridX, mGridY) - 15;
    TodDrawImageRectCenterScaledF(g, IMAGE_PLANTSHADOW2, aXPos - 5.0f, aYPos + 72.0f, Rect(0, 0, IMAGE_PLANTSHADOW2->mWidth, IMAGE_PLANTSHADOW2->mHeight), 1.3f, 1.3f);

    if (transparencyNs > 0)
    {
        g->DrawImage(IMAGE_SCARY_POT, aXPos, aYPos, Rect(aImageCol * 80, 0, 80, 101));

        Graphics aInsideGraphics(*g);
        if (mScaryPotType == ScaryPotType::SCARYPOT_SEED)
        {
            aInsideGraphics.mScaleX = 0.7f;
            aInsideGraphics.mScaleY = 0.7f;
            DrawSeedPacket(&aInsideGraphics, aXPos + 23.0f, aYPos + 33.0f, mSeedType, SeedType::SEED_NONE, 0.0f, 255, false, false);
        }
        else if (mScaryPotType == ScaryPotType::SCARYPOT_ZOMBIE)
        {
            aInsideGraphics.mScaleX = 0.4f;
            aInsideGraphics.mScaleY = 0.4f;
            float aOffsetX = 6.0f;
            float aOffsetY = 19.0f;
            if (mZombieType == ZombieType::ZOMBIE_FOOTBALL)
            {
                aInsideGraphics.mScaleX = 0.4f;
                aInsideGraphics.mScaleY = 0.4f;
                aOffsetX = 1.0f;
                aOffsetY = 16.0f;
            }
            if (mZombieType == ZombieType::ZOMBIE_GARGANTUAR)
            {
                aInsideGraphics.mScaleX = 0.3f;
                aInsideGraphics.mScaleY = 0.3f;
                aOffsetX += 9.0f;
                aOffsetY += 7.0f;
            }
            mApp->mReanimatorCache->DrawCachedZombie(&aInsideGraphics, aXPos + aOffsetX, aYPos + aOffsetY, mZombieType);
        }
        else if (mScaryPotType == ScaryPotType::SCARYPOT_SUN)
        {
            int aSuns = mSunCount;

            Reanimation aReanim;
            aReanim.ReanimationInitializeType(0.0f, 0.0f, ReanimationType::REANIM_SUN);
            aReanim.mOverlayMatrix.m00 = 0.5f;
            aReanim.mOverlayMatrix.m11 = 0.5f;

            for (int i = 0; i < aSuns; i++)
            {
                float aOffsetX = 42.0f;
                float aOffsetY = 62.0f;
                switch (i)
                {
                case 1:     aOffsetX += 3.0f;       aOffsetY -= 20.0f;          break;
                case 2:     aOffsetX -= 6.0f;       aOffsetY -= 10.0f;          break;
                case 3:     aOffsetX += 6.0f;       aOffsetY -= 5.0f;           break;
                case 4:     aOffsetX += 5.0f;       aOffsetY -= 15.0f;          break;
                }

                aReanim.mOverlayMatrix.m02 = aXPos + aOffsetX;
                aReanim.mOverlayMatrix.m12 = aYPos + aOffsetY;
                aReanim.Draw(g);
            }
        }

        int aAlpha = TodAnimateCurveNs(0, 500'000'000, transparencyNs, 255, 58, Curves::Linear);
        g->mColorizeImages = true;
        g->mColor = Color(255, 255, 255, aAlpha);
    }

    g->DrawImage(IMAGE_SCARY_POT, aXPos, aYPos, Rect(aImageCol * 80, 101, 80, 101));
    if (mHighlighted)
    {
        g->mDrawMode = Graphics::DRAWMODE_ADDITIVE;
        g->mColorizeImages = true;
        if (transparencyNs == 0)
        {
            g->mColor = Color(255, 255, 255, 196);
        }
        g->DrawImage(IMAGE_SCARY_POT, aXPos, aYPos, Rect(aImageCol * 80, 101, 80, 101));
        g->mDrawMode = Graphics::DRAWMODE_NORMAL;
    }

    g->mColorizeImages = false;
}

//0x44DFD0
void GridItem::DrawLadder(Graphics* g)
{
    int aXPos = mBoard->GridToPixelX(mGridX, mGridY);
    int aYPos = mBoard->GridToPixelY(mGridX, mGridY);
    const Sexy::TextureSource texture{MagnetAtlas::Texture, 0};
    Sexy::DrawAtlasImageScaled(g, texture,
        MagnetAtlas::Images[size_t(MagnetAtlas::Sprite::REANIM_ZOMBIE_LADDER_5)],
        aXPos + 25.0f, aYPos - 4.0f, 0.8f, 0.8f);
}

/*
void GridItem::DrawSquirrel(Graphics* g)
{
    int aXPos = mBoard->GridToPixelX(mGridX, mGridY);
    int aYPos = mBoard->GridToPixelY(mGridX, mGridY);
    if (mGridItemState == GridItemState::GRIDITEM_STATE_SQUIRREL_PEEKING)
    {
        aYPos += TodAnimateCurveNs(500'000'000, 0, mStateEndTimeNs-static_cast<std::int64_t>(mBoard->mLevelTimeNs), 0, -40, Curves::BounceSlowMiddle);
    }
    else if (mGridItemState == GridItemState::GRIDITEM_STATE_SQUIRREL_RUNNING_UP)
    {
        aYPos += TodAnimateCurveNs(500'000'000, 0, mStateEndTimeNs-static_cast<std::int64_t>(mBoard->mLevelTimeNs), 100, 0, Curves::EaseIn);
    }
    else if (mGridItemState == GridItemState::GRIDITEM_STATE_SQUIRREL_RUNNING_DOWN)
    {
        aYPos += TodAnimateCurveNs(500'000'000, 0, mStateEndTimeNs-static_cast<std::int64_t>(mBoard->mLevelTimeNs), -100, 0, Curves::EaseIn);
    }
    else if (mGridItemState == GridItemState::GRIDITEM_STATE_SQUIRREL_RUNNING_LEFT)
    {
        aXPos += TodAnimateCurveNs(500'000'000, 0, mStateEndTimeNs-static_cast<std::int64_t>(mBoard->mLevelTimeNs), 80, 0, Curves::EaseIn);
    }
    else if (mGridItemState == GridItemState::GRIDITEM_STATE_SQUIRREL_RUNNING_RIGHT)
    {
        aXPos += TodAnimateCurveNs(500'000'000, 0, mStateEndTimeNs-static_cast<std::int64_t>(mBoard->mLevelTimeNs), -80, 0, Curves::EaseIn);
    }

    // @Patoke: assets, removed, perhaps add back?
    //g->DrawImage(IMAGE_SQUIRREL, aXPos, aYPos);
}
*/

//0x44E090
void GridItem::AddGraveStoneParticles()
{
    int aXOffset = mBoard->mGridCelOffset[mGridX][mGridY][0];
    int aYOffset = mBoard->mGridCelOffset[mGridX][mGridY][1];
    int aXPos = mBoard->GridToPixelX(mGridX, mGridY) + 14 + aXOffset;
    int aYPos = mBoard->GridToPixelY(mGridX, mGridY) + 78 + aYOffset;
    mApp->AddTodParticle(aXPos, aYPos, mRenderOrder + 1, ParticleEffect::PARTICLE_GRAVE_STONE_RISE);
    mApp->PlayFoley(FoleyType::FOLEY_DIRT_RISE);
}

//0x44E1B0
void GridItem::OpenPortal()
{
    float aXPos = mGridX * 80.0f - 6.0f;
    float aYPos = mBoard->GridToPixelY(0, mGridY) - 65.0f;
    Reanimation* aPortalReanim = mApp->ReanimationTryToGet(mGridItemReanimID);
    if (aPortalReanim == nullptr)
    {
        ReanimationType aReanimType = ReanimationType::REANIM_PORTAL_CIRCLE;
        if (mGridItemType == GridItemType::GRIDITEM_PORTAL_SQUARE)
        {
            aYPos += 25.0f;
            aXPos -= 4.0f;
            aReanimType = ReanimationType::REANIM_PORTAL_SQUARE;
        }
        aPortalReanim = mApp->AddReanimation(aXPos, aYPos, 0, aReanimType);
        aPortalReanim->mIsAttachment = true;
        mGridItemReanimID = mApp->ReanimationGetID(aPortalReanim);
    }
    else
    {
        aPortalReanim->mOverlayMatrix.m02 = aXPos;
        aPortalReanim->mOverlayMatrix.m12 = aYPos;
    }

    TodParticleSystem* aPortalParticle = mApp->ParticleTryToGet(mGridItemParticleID);
    if (aPortalParticle)
    {
        aPortalParticle->ParticleSystemDie();
        mGridItemParticleID = ParticleSystemID::PARTICLESYSTEMID_NULL;
    }

    aPortalReanim->PlayReanim(ReanimTrackId::anim_appear, ReanimLoopType::REANIM_PLAY_ONCE_AND_HOLD, 0, 12.0f);
    mApp->PlayFoley(FoleyType::FOLEY_PORTAL);
}

//0x44E360
void GridItem::ClosePortal()
{
    Reanimation* aPortalReanim = mApp->ReanimationTryToGet(mGridItemReanimID);
    if (aPortalReanim)
    {
        // 1073 0045167B passes "anim_dissapear"; this is a live closing track.
        aPortalReanim->PlayReanim(ReanimTrackId::anim_dissapear, ReanimLoopType::REANIM_PLAY_ONCE_AND_HOLD, 0, 12.0f);
    }

    TodParticleSystem* aPortalParticle = mApp->ParticleTryToGet(mGridItemParticleID);
    if (aPortalParticle)
    {
        aPortalParticle->ParticleSystemDie();
        mGridItemParticleID = ParticleSystemID::PARTICLESYSTEMID_NULL;
    }

    mGridItemState = GridItemState::GRIDITEM_STATE_PORTAL_CLOSED;
}

bool GridItem::IsOpenPortal()
{
	return mGridItemState != GridItemState::GRIDITEM_STATE_PORTAL_CLOSED && 
		(mGridItemType == GridItemType::GRIDITEM_PORTAL_CIRCLE || mGridItemType == GridItemType::GRIDITEM_PORTAL_SQUARE);
}

//0x44E400
void GridItem::UpdatePortal()
{
    Reanimation* aPortalReanim = mApp->ReanimationGet(mGridItemReanimID);
    if (mGridItemState == GridItemState::GRIDITEM_STATE_PORTAL_CLOSED)
    {
        if (aPortalReanim->mLoopCount > 0)
        {
            GridItemDie();
        }
    }
    else if (aPortalReanim->mLoopType == ReanimLoopType::REANIM_PLAY_ONCE_AND_HOLD && aPortalReanim->mLoopCount > 0)
    {
        aPortalReanim->PlayReanim(ReanimTrackId::anim_pulse, ReanimLoopType::REANIM_LOOP, 0, 12.0f);

        ParticleEffect aEffect = ParticleEffect::PARTICLE_PORTAL_CIRCLE;
        float aXPos = mGridX * 80.0f + 13.0f;
        float aYPos = mBoard->GridToPixelY(0, mGridY) - 39.0f;
        if (mGridItemType == GridItemType::GRIDITEM_PORTAL_SQUARE)
        {
            aEffect = ParticleEffect::PARTICLE_PORTAL_SQUARE;
            aXPos -= 8.0f;
            aYPos += 15.0f;
        }

        TodParticleSystem* aParticle = mApp->AddTodParticle(aXPos, aYPos, 0, aEffect);
        mGridItemParticleID = mApp->ParticleGetID(aParticle);
    }
}

//0x44E520
void GridItem::UpdateScaryPot()
{
    bool revealed=mApp->mTodCheatKeys && mApp->mWidgetManager->mKeyDown[(int)KeyCode::KEYCODE_SHIFT];
    if (!revealed)
    {
        Plant* plant=nullptr;
        while(mBoard->IteratePlants(plant))
            if(plant->mSeedType==SeedType::SEED_PLANTERN && !plant->NotOnGround() &&
                std::max(abs(plant->mPlantCol-mGridX),abs(plant->mRow-mGridY))<=1)
            { revealed=true;break; }
    }
    if(revealed!=mTransparencyIncreasing)
    {
        const auto previousNow=static_cast<std::int64_t>(mBoard->mLevelTimeNs)-
            static_cast<std::int64_t>(Sexy::gUpdateIntervalNs);
        const auto value=mTransparencyIncreasing
            ? std::clamp<std::int64_t>(previousNow-mTransparencyTimeNs,0,500'000'000)
            : std::max<std::int64_t>(0,mTransparencyTimeNs-previousNow);
        mTransparencyTimeNs=revealed ? previousNow-value : previousNow+value;
        mTransparencyIncreasing=revealed;
    }
}

void GridItem::UpdateBrain()
{
    if(mGridItemState==GridItemState::GRIDITEM_STATE_BRAIN_SQUISHED &&
        static_cast<std::int64_t>(mBoard->mLevelTimeNs)>=mStateEndTimeNs)
        GridItemDie();
}

//0x44E5E0
void GridItem::Update()
{
    Reanimation* aGridItemReanim = mApp->ReanimationTryToGet(mGridItemReanimID);
    if (aGridItemReanim)
    {
        aGridItemReanim->Update();
    }

    TodParticleSystem* aGridItemParticle = mApp->ParticleTryToGet(mGridItemParticleID);
    if (aGridItemParticle)
    {
        aGridItemParticle->Update(Sexy::gUpdateIntervalNs, mApp->mEffectSystem->mReanimationHolder->mVisualTimeNs);
    }

    if (mGridItemType == GridItemType::GRIDITEM_PORTAL_CIRCLE || mGridItemType == GridItemType::GRIDITEM_PORTAL_SQUARE)
    {
        UpdatePortal();
    }
    if (mGridItemType == GridItemType::GRIDITEM_SCARY_POT)
    {
        UpdateScaryPot();
    }
    if (mGridItemType == GridItemType::GRIDITEM_RAKE)
    {
        UpdateRake();
    }
    if (mGridItemType == GridItemType::GRIDITEM_IZOMBIE_BRAIN)
    {
        UpdateBrain();
    }
}

//0x44E6A0
Zombie* GridItem::RakeFindZombie()
{
    Rect aRakeRect(mPosX, mPosY, 63, 80);

    Zombie* aZombie = nullptr;
    // 行段纯行路径（2026-10-04 用户裁决：主动偏离 1073，删 Boss 检测——
    // 钉耙不能击杀/伤害僵王；纯行段迭代不吐 Boss。1073 中右列+同行钉耙
    // 理论可被僵王巨型碰撞盒触发，此偏离有意为之）
    while (mBoard->IterateZombiesInRowOnly(mGridY, aZombie))
    {
        if (!aZombie->IsDeadOrDying() && !aZombie->IsBobsledTeamWithSled() && aZombie->mRow - mGridY == 0 && aZombie->EffectedByDamage(1U))
        {
            Rect aZombieRect = aZombie->GetZombieRect();
            if (GetRectOverlap(aRakeRect, aZombieRect) >= 0)
            {
                return aZombie;
            }
        }
    }

    return nullptr;
}

//0x44E780
void GridItem::UpdateRake()
{
    if (mGridItemState == GridItemState::GRIDITEM_STATE_RAKE_ATTRACTING || mGridItemState == GridItemState::GRIDITEM_STATE_RAKE_WAITING)
    {
        if (RakeFindZombie())
        {
            Reanimation* aRakeReanim = mApp->ReanimationGet(mGridItemReanimID);
            aRakeReanim->ApplyRate(20.0f);
            mStateEndTimeNs = static_cast<std::int64_t>(mBoard->mLevelTimeNs)+2'000'000'000;
            mGridItemState = GridItemState::GRIDITEM_STATE_RAKE_TRIGGERED;
            mApp->PlayFoley(FoleyType::FOLEY_SWING);
        }
    }
    else if (mGridItemState == GridItemState::GRIDITEM_STATE_RAKE_TRIGGERED)
    {
        Reanimation* aRakeReanim = mApp->ReanimationGet(mGridItemReanimID);
        if (aRakeReanim && aRakeReanim->ShouldTriggerTimedEvent(0.8f))
        {
            Zombie* aZombie = RakeFindZombie();
            if (aZombie)
            {
                aZombie->TakeDamage(1800, 0U);
                mApp->PlayFoley(FoleyType::FOLEY_BONK);
            }
        }

        if (static_cast<std::int64_t>(mBoard->mLevelTimeNs)>=mStateEndTimeNs)
        {
            GridItemDie();
        }
    }
}
