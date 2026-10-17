#include "BoardStateDigest.h"

#include "Board.h"
#include "Challenge.h"
#include "CursorObject.h"
#include "SeedPacket.h"
#include "LawnApp.h"
#include "SexyAppFramework/Common.h"
#include "Sexy.TodLib/StateHasher.h"

#include <array>
#include <cstdint>

namespace pvz
{
namespace legacy
{
namespace
{

using pvz::determinism::StateHasher;

const char* const BOARD_STATE_SCHEMA = "pvz.legacy.board-state.v1";

void AddInt(StateHasher& theHasher, int theValue)
{
	theHasher.add(static_cast<std::int32_t>(theValue));
}

void AddUInt(StateHasher& theHasher, unsigned int theValue)
{
	theHasher.add(static_cast<std::uint32_t>(theValue));
}

void AddRect(StateHasher& theHasher, const Sexy::Rect& theRect)
{
	AddInt(theHasher, theRect.mX);
	AddInt(theHasher, theRect.mY);
	AddInt(theHasher, theRect.mWidth);
	AddInt(theHasher, theRect.mHeight);
}

void AddGameObject(StateHasher& theHasher, const GameObject& theObject)
{
	AddInt(theHasher, theObject.mX);
	AddInt(theHasher, theObject.mY);
	AddInt(theHasher, theObject.mWidth);
	AddInt(theHasher, theObject.mHeight);
	theHasher.add(theObject.mVisible);
	AddInt(theHasher, theObject.mRow);
}

void AddPottedPlant(StateHasher& theHasher, const PottedPlant& thePlant)
{
	theHasher.add_enum(thePlant.mSeedType);
	theHasher.add_enum(thePlant.mWhichZenGarden);
	AddInt(theHasher, thePlant.mX);
	AddInt(theHasher, thePlant.mY);
	theHasher.add_enum(thePlant.mFacing);
	theHasher.add(static_cast<std::int64_t>(thePlant.mLastWateredTime));
	theHasher.add_enum(thePlant.mDrawVariation);
	theHasher.add_enum(thePlant.mPlantAge);
	AddInt(theHasher, thePlant.mTimesFed);
	AddInt(theHasher, thePlant.mFeedingsPerGrow);
	theHasher.add_enum(thePlant.mPlantNeed);
	theHasher.add(static_cast<std::int64_t>(thePlant.mLastNeedFulfilledTime));
	theHasher.add(static_cast<std::int64_t>(thePlant.mLastFertilizedTime));
	theHasher.add(static_cast<std::int64_t>(thePlant.mLastChocolateTime));
	theHasher.add(static_cast<std::int64_t>(thePlant.mFutureAttribute[0]));
}

void AddPlant(StateHasher& theHasher, const Plant& thePlant)
{
	AddGameObject(theHasher, thePlant);
	theHasher.add_enum(thePlant.mSeedType);
	AddInt(theHasher, thePlant.mPlantCol);
	AddInt(theHasher, thePlant.mAnimCounter);
	AddInt(theHasher, thePlant.mFrame);
	AddInt(theHasher, thePlant.mFrameLength);
	AddInt(theHasher, thePlant.mNumFrames);
	theHasher.add_enum(thePlant.mState);
	AddInt(theHasher, thePlant.mPlantHealth);
	AddInt(theHasher, thePlant.mPlantMaxHealth);
	AddInt(theHasher, thePlant.mSubclass);
	AddInt(theHasher, thePlant.mDisappearCountdown);
	AddInt(theHasher, thePlant.mDoSpecialCountdown);
	AddInt(theHasher, thePlant.mStateCountdown);
	AddInt(theHasher, thePlant.mLaunchCounter);
	AddInt(theHasher, thePlant.mLaunchRate);
	AddRect(theHasher, thePlant.mPlantRect);
	AddRect(theHasher, thePlant.mPlantAttackRect);
	AddInt(theHasher, thePlant.mTargetX);
	AddInt(theHasher, thePlant.mTargetY);
	AddInt(theHasher, thePlant.mStartRow);
	AddInt(theHasher, thePlant.mShootingCounter);
	AddInt(theHasher, thePlant.mBlinkCountdown);
	AddInt(theHasher, thePlant.mRecentlyEatenCountdown);
	AddInt(theHasher, thePlant.mEatenFlashCountdown);
	AddInt(theHasher, thePlant.mBeghouledFlashCountdown);
	theHasher.add(thePlant.mShakeOffsetX);
	theHasher.add(thePlant.mShakeOffsetY);
	theHasher.add_sequence_size(MAX_MAGNET_ITEMS);
	for (int i = 0; i < MAX_MAGNET_ITEMS; i++)
	{
		const MagnetItem& anItem = thePlant.mMagnetItems[i];
		theHasher.add(anItem.mPosX);
		theHasher.add(anItem.mPosY);
		theHasher.add(anItem.mDestOffsetX);
		theHasher.add(anItem.mDestOffsetY);
		theHasher.add_enum(anItem.mItemType);
	}
	theHasher.add_enum(thePlant.mTargetZombieID);
	AddInt(theHasher, thePlant.mWakeUpCounter);
	theHasher.add_enum(thePlant.mOnBungeeState);
	theHasher.add_enum(thePlant.mImitaterType);
	AddInt(theHasher, thePlant.mPottedPlantIndex);
	theHasher.add(thePlant.mAnimPing);
	theHasher.add(thePlant.mDead);
	theHasher.add(thePlant.mSquished);
	theHasher.add(thePlant.mIsAsleep);
	theHasher.add(thePlant.mIsOnBoard);
}

void AddZombie(StateHasher& theHasher, const Zombie& theZombie)
{
	AddGameObject(theHasher, theZombie);
	theHasher.add_enum(theZombie.mZombieType);
	theHasher.add_enum(theZombie.mZombiePhase);
	theHasher.add(theZombie.mPosX);
	theHasher.add(theZombie.mPosY);
	theHasher.add(theZombie.mVelX);
	AddInt(theHasher, theZombie.mAnimCounter);
	AddInt(theHasher, theZombie.mGroanCounter);
	AddInt(theHasher, theZombie.mAnimTicksPerFrame);
	AddInt(theHasher, theZombie.mAnimFrames);
	AddInt(theHasher, theZombie.mFrame);
	AddInt(theHasher, theZombie.mPrevFrame);
	theHasher.add(theZombie.mVariant);
	theHasher.add(theZombie.mIsEating);
	AddInt(theHasher, theZombie.mJustGotShotCounter);
	AddInt(theHasher, theZombie.mShieldJustGotShotCounter);
	AddInt(theHasher, theZombie.mShieldRecoilCounter);
	AddInt(theHasher, theZombie.mZombieAge);
	theHasher.add_enum(theZombie.mZombieHeight);
	AddInt(theHasher, theZombie.mPhaseCounter);
	AddInt(theHasher, theZombie.mFromWave);
	theHasher.add(theZombie.mDroppedLoot);
	AddInt(theHasher, theZombie.mZombieFade);
	theHasher.add(theZombie.mFlatTires);
	AddInt(theHasher, theZombie.mUseLadderCol);
	AddInt(theHasher, theZombie.mTargetCol);
	theHasher.add(theZombie.mAltitude);
	theHasher.add(theZombie.mHitUmbrella);
	AddRect(theHasher, theZombie.mZombieRect);
	AddRect(theHasher, theZombie.mZombieAttackRect);
	AddInt(theHasher, theZombie.mChilledCounter);
	AddInt(theHasher, theZombie.mButteredCounter);
	AddInt(theHasher, theZombie.mIceTrapCounter);
	theHasher.add(theZombie.mMindControlled);
	theHasher.add(theZombie.mBlowingAway);
	theHasher.add(theZombie.mHasHead);
	theHasher.add(theZombie.mHasArm);
	theHasher.add(theZombie.mHasObject);
	theHasher.add(theZombie.mInPool);
	theHasher.add(theZombie.mOnHighGround);
	theHasher.add(theZombie.mYuckyFace);
	AddInt(theHasher, theZombie.mYuckyFaceCounter);
	theHasher.add_enum(theZombie.mHelmType);
	AddInt(theHasher, theZombie.mBodyHealth);
	AddInt(theHasher, theZombie.mBodyMaxHealth);
	AddInt(theHasher, theZombie.mHelmHealth);
	AddInt(theHasher, theZombie.mHelmMaxHealth);
	theHasher.add_enum(theZombie.mShieldType);
	AddInt(theHasher, theZombie.mShieldHealth);
	AddInt(theHasher, theZombie.mShieldMaxHealth);
	AddInt(theHasher, theZombie.mFlyingHealth);
	AddInt(theHasher, theZombie.mFlyingMaxHealth);
	theHasher.add(theZombie.mDead);
	theHasher.add_enum(theZombie.mRelatedZombieID);
	theHasher.add_sequence_size(MAX_ZOMBIE_FOLLOWERS);
	for (int i = 0; i < MAX_ZOMBIE_FOLLOWERS; i++)
	{
		theHasher.add_enum(theZombie.mFollowerZombieID[i]);
	}
	theHasher.add(theZombie.mPlayingSong);
	AddInt(theHasher, theZombie.mSummonCounter);
	theHasher.add(theZombie.mScaleZombie);
	theHasher.add(theZombie.mVelZ);
	theHasher.add(theZombie.mOriginalAnimRate);
	theHasher.add_enum(theZombie.mTargetPlantID);
	AddInt(theHasher, theZombie.mBossMode);
	AddInt(theHasher, theZombie.mTargetRow);
	AddInt(theHasher, theZombie.mBossBungeeCounter);
	AddInt(theHasher, theZombie.mBossStompCounter);
	AddInt(theHasher, theZombie.mBossHeadCounter);
	AddInt(theHasher, theZombie.mFireballRow);
	theHasher.add(theZombie.mIsFireBall);
	AddInt(theHasher, theZombie.mLastPortalX);
	theHasher.add(theZombie.mHasZombatar);
	AddInt(theHasher, theZombie.mZombatarIndex);
}

void AddProjectile(StateHasher& theHasher, const Projectile& theProjectile)
{
	AddGameObject(theHasher, theProjectile);
	AddInt(theHasher, theProjectile.mFrame);
	AddInt(theHasher, theProjectile.mNumFrames);
	AddInt(theHasher, theProjectile.mAnimCounter);
	theHasher.add(theProjectile.mPosX);
	theHasher.add(theProjectile.mPosY);
	theHasher.add(theProjectile.mPosZ);
	theHasher.add(theProjectile.mVelX);
	theHasher.add(theProjectile.mVelY);
	theHasher.add(theProjectile.mVelZ);
	theHasher.add(theProjectile.mAccZ);
	theHasher.add(theProjectile.mShadowY);
	theHasher.add(theProjectile.mDead);
	AddInt(theHasher, theProjectile.mAnimTicksPerFrame);
	theHasher.add_enum(theProjectile.mMotionType);
	theHasher.add_enum(theProjectile.mProjectileType);
	AddInt(theHasher, theProjectile.mProjectileAge);
	AddInt(theHasher, theProjectile.mClickBackoffCounter);
	theHasher.add(theProjectile.mRotation);
	theHasher.add(theProjectile.mRotationSpeed);
	theHasher.add(theProjectile.mOnHighGround);
	AddInt(theHasher, theProjectile.mDamageRangeFlags);
	AddInt(theHasher, theProjectile.mHitTorchwoodGridX);
	theHasher.add(theProjectile.mCobTargetX);
	AddInt(theHasher, theProjectile.mCobTargetRow);
	theHasher.add_enum(theProjectile.mTargetZombieID);
	AddInt(theHasher, theProjectile.mLastPortalX);
}

void AddCoin(StateHasher& theHasher, const Coin& theCoin)
{
	AddGameObject(theHasher, theCoin);
	theHasher.add(theCoin.mPosX);
	theHasher.add(theCoin.mPosY);
	theHasher.add(theCoin.mVelX);
	theHasher.add(theCoin.mVelY);
	theHasher.add(theCoin.mScale);
	theHasher.add(theCoin.mDead);
	AddInt(theHasher, theCoin.mFadeCount);
	theHasher.add(theCoin.mCollectX);
	theHasher.add(theCoin.mCollectY);
	AddInt(theHasher, theCoin.mGroundY);
	AddInt(theHasher, theCoin.mCoinAge);
	theHasher.add(theCoin.mIsBeingCollected);
	AddInt(theHasher, theCoin.mDisappearCounter);
	theHasher.add_enum(theCoin.mType);
	theHasher.add_enum(theCoin.mCoinMotion);
	theHasher.add(theCoin.mCollectionDistance);
	theHasher.add_enum(theCoin.mUsableSeedType);
	AddPottedPlant(theHasher, theCoin.mPottedPlantSpec);
	theHasher.add(theCoin.mNeedsBouncyArrow);
	theHasher.add(theCoin.mHasBouncyArrow);
	theHasher.add(theCoin.mHitGround);
	AddInt(theHasher, theCoin.mTimesDropped);
}

void AddLawnMower(StateHasher& theHasher, const LawnMower& theMower)
{
	theHasher.add(theMower.mPosX);
	theHasher.add(theMower.mPosY);
	AddInt(theHasher, theMower.mRow);
	AddInt(theHasher, theMower.mAnimTicksPerFrame);
	AddInt(theHasher, theMower.mChompCounter);
	AddInt(theHasher, theMower.mRollingInCounter);
	AddInt(theHasher, theMower.mSquishedCounter);
	theHasher.add_enum(theMower.mMowerState);
	theHasher.add(theMower.mDead);
	theHasher.add(theMower.mVisible);
	theHasher.add_enum(theMower.mMowerType);
	theHasher.add(theMower.mAltitude);
	theHasher.add_enum(theMower.mMowerHeight);
	AddInt(theHasher, theMower.mLastPortalX);
}

void AddGridItem(StateHasher& theHasher, const GridItem& theItem)
{
	theHasher.add_enum(theItem.mGridItemType);
	theHasher.add_enum(theItem.mGridItemState);
	AddInt(theHasher, theItem.mGridX);
	AddInt(theHasher, theItem.mGridY);
	AddInt(theHasher, theItem.mGridItemCounter);
	theHasher.add(theItem.mDead);
	theHasher.add(theItem.mPosX);
	theHasher.add(theItem.mPosY);
	theHasher.add(theItem.mGoalX);
	theHasher.add(theItem.mGoalY);
	theHasher.add_enum(theItem.mZombieType);
	theHasher.add_enum(theItem.mSeedType);
	theHasher.add_enum(theItem.mScaryPotType);
	theHasher.add(theItem.mHighlighted);
	AddInt(theHasher, theItem.mTransparentCounter);
	AddInt(theHasher, theItem.mSunCount);
	AddInt(theHasher, theItem.mMotionTrailCount);
}

template <typename T, typename AddItem>
void AddDataArray(StateHasher& theHasher, const DataArray<T>& theArray, AddItem theAddItem)
{
	AddUInt(theHasher, theArray.mSize);
	AddUInt(theHasher, theArray.mMaxUsedCount);
	AddUInt(theHasher, theArray.mFreeListHead);
	AddUInt(theHasher, theArray.mNextKey);
	theHasher.add_sequence_size(theArray.mMaxUsedCount);

	for (unsigned int i = 0; i < theArray.mMaxUsedCount; i++)
	{
		const typename DataArray<T>::DataArrayItem& aSlot = theArray.mBlock[i];
		const bool isLive = (aSlot.mID & static_cast<unsigned int>(DATA_ARRAY_KEY_MASK)) != 0;
		theHasher.add(isLive);
		AddUInt(theHasher, aSlot.mID);
		if (isLive)
		{
			theAddItem(theHasher, aSlot.mItem);
		}
	}
}

void AddChallenge(StateHasher& theHasher, const Challenge* theChallenge)
{
	theHasher.add(theChallenge != nullptr);
	if (theChallenge == nullptr)
	{
		return;
	}

	AddInt(theHasher, theChallenge->mBeghouledMouseCapture);
	AddInt(theHasher, theChallenge->mBeghouledMouseDownX);
	AddInt(theHasher, theChallenge->mBeghouledMouseDownY);
	for (int x = 0; x < MAX_GRID_SIZE_X; x++)
	{
		for (int y = 0; y < MAX_GRID_SIZE_Y; y++)
		{
			AddInt(theHasher, theChallenge->mBeghouledEated[x][y]);
		}
	}
	for (int i = 0; i < NUM_BEGHOULED_UPGRADES; i++)
	{
		AddInt(theHasher, theChallenge->mBeghouledPurcasedUpgrade[i]);
	}
	AddInt(theHasher, theChallenge->mBeghouledMatchesThisMove);
	theHasher.add_enum(theChallenge->mChallengeState);
	AddInt(theHasher, theChallenge->mChallengeStateCounter);
	AddInt(theHasher, theChallenge->mConveyorBeltCounter);
	AddInt(theHasher, theChallenge->mChallengeScore);
	AddInt(theHasher, theChallenge->mShowBowlingLine);
	theHasher.add_enum(theChallenge->mLastConveyorSeedType);
	AddInt(theHasher, theChallenge->mSurvivalStage);
	AddInt(theHasher, theChallenge->mSlotMachineRollCount);
	for (int i = 0; i < 6; i++)
	{
		AddInt(theHasher, theChallenge->mCloudsCounter[i]);
	}
	AddInt(theHasher, theChallenge->mChallengeGridX);
	AddInt(theHasher, theChallenge->mChallengeGridY);
	AddInt(theHasher, theChallenge->mScaryPotterPots);
	AddInt(theHasher, theChallenge->mRainCounter);
	AddInt(theHasher, theChallenge->mTreeOfWisdomTalkIndex);
}

void AddSeedBank(StateHasher& theHasher, const SeedBank* theSeedBank)
{
	theHasher.add(theSeedBank != nullptr);
	if (theSeedBank == nullptr)
	{
		return;
	}

	AddGameObject(theHasher, *theSeedBank);
	AddInt(theHasher, theSeedBank->mNumPackets);
	theHasher.add_sequence_size(SEEDBANK_MAX);
	for (int i = 0; i < SEEDBANK_MAX; i++)
	{
		const SeedPacket& aPacket = theSeedBank->mSeedPackets[i];
		AddGameObject(theHasher, aPacket);
		AddInt(theHasher, aPacket.mRefreshCounter);
		AddInt(theHasher, aPacket.mRefreshTime);
		AddInt(theHasher, aPacket.mIndex);
		AddInt(theHasher, aPacket.mOffsetX);
		theHasher.add_enum(aPacket.mPacketType);
		theHasher.add_enum(aPacket.mImitaterType);
		AddInt(theHasher, aPacket.mSlotMachineCountDown);
		theHasher.add_enum(aPacket.mSlotMachiningNextSeed);
		theHasher.add(aPacket.mSlotMachiningPosition);
		theHasher.add(aPacket.mActive);
		theHasher.add(aPacket.mRefreshing);
		AddInt(theHasher, aPacket.mTimesUsed);
	}
	AddInt(theHasher, theSeedBank->mCutSceneDarken);
	AddInt(theHasher, theSeedBank->mConveyorBeltCounter);
}

void AddCursor(StateHasher& theHasher, const CursorObject* theCursor)
{
	theHasher.add(theCursor != nullptr);
	if (theCursor == nullptr)
	{
		return;
	}

	AddGameObject(theHasher, *theCursor);
	AddInt(theHasher, theCursor->mSeedBankIndex);
	theHasher.add_enum(theCursor->mType);
	theHasher.add_enum(theCursor->mImitaterType);
	theHasher.add_enum(theCursor->mCursorType);
	theHasher.add_enum(theCursor->mCoinID);
	theHasher.add_enum(theCursor->mGlovePlantID);
	theHasher.add_enum(theCursor->mDuplicatorPlantID);
	theHasher.add_enum(theCursor->mCobCannonPlantID);
	AddInt(theHasher, theCursor->mHammerDownCounter);
}

void AddAppState(StateHasher& theHasher, const LawnApp* theApp)
{
	theHasher.add(theApp != nullptr);
	if (theApp == nullptr)
	{
		return;
	}

	theHasher.add_enum(theApp->mGameMode);
	theHasher.add_enum(theApp->mGameScene);
	theHasher.add_enum(theApp->mBoardResult);
	AddInt(theHasher, theApp->mAppCounter);
	AddInt(theHasher, theApp->mAppRandSeed);
	AddUInt(theHasher, theApp->mRandSeed);
	theHasher.add(theApp->mEasyPlantingCheat);
	theHasher.add(theApp->mMustacheMode);
	theHasher.add(theApp->mSuperMowerMode);
	theHasher.add(theApp->mFutureMode);
	theHasher.add(theApp->mPinataMode);
	theHasher.add(theApp->mDanceMode);
	theHasher.add(theApp->mDaisyMode);
	theHasher.add(theApp->mSukhbirMode);

	theHasher.add(theApp->mPlayerInfo != nullptr);
	if (theApp->mPlayerInfo != nullptr)
	{
		AddUInt(theHasher, theApp->mPlayerInfo->mId);
		AddInt(theHasher, theApp->mPlayerInfo->mLevel);
		AddInt(theHasher, theApp->mPlayerInfo->mCoins);
	}

	std::array<unsigned int, SEXY_RAND_STATE_WORDS> aRandState{};
	int aRandIndex = 0;
	Sexy::GetRandState(aRandState.data(), aRandIndex);
	AddInt(theHasher, aRandIndex);
	theHasher.add_sequence_size(aRandState.size());
	for (std::size_t i = 0; i < aRandState.size(); i++)
	{
		AddUInt(theHasher, aRandState[i]);
	}
}

void AddBoardState(StateHasher& theHasher, const Board& theBoard)
{
	theHasher.add(theBoard.mPaused);
	for (int x = 0; x < MAX_GRID_SIZE_X; x++)
	{
		for (int y = 0; y < MAX_GRID_SIZE_Y; y++)
		{
			theHasher.add_enum(theBoard.mGridSquareType[x][y]);
			AddInt(theHasher, theBoard.mGridCelFog[x][y]);
		}
		AddInt(theHasher, theBoard.mGridCelFog[x][MAX_GRID_SIZE_Y]);
	}
	theHasher.add(theBoard.mEnableGraveStones);
	AddInt(theHasher, theBoard.mSpecialGraveStoneX);
	AddInt(theHasher, theBoard.mSpecialGraveStoneY);
	theHasher.add(theBoard.mFogOffset);
	AddInt(theHasher, theBoard.mFogBlownCountDown);
	for (int row = 0; row < MAX_GRID_SIZE_Y; row++)
	{
		theHasher.add_enum(theBoard.mPlantRow[row]);
		AddInt(theHasher, theBoard.mWaveRowGotLawnMowered[row]);
		AddInt(theHasher, theBoard.mIceMinX[row]);
		AddInt(theHasher, theBoard.mIceTimer[row]);
		AddInt(theHasher, theBoard.mRowPickingArray[row].mItem);
		theHasher.add(theBoard.mRowPickingArray[row].mWeight);
		theHasher.add(theBoard.mRowPickingArray[row].mLastPicked);
		theHasher.add(theBoard.mRowPickingArray[row].mSecondLastPicked);
	}
	AddInt(theHasher, theBoard.mBonusLawnMowersRemaining);
	for (int wave = 0; wave < MAX_ZOMBIE_WAVES; wave++)
	{
		for (int zombie = 0; zombie < MAX_ZOMBIES_IN_WAVE; zombie++)
		{
			theHasher.add_enum(theBoard.mZombiesInWave[wave][zombie]);
		}
	}
	for (int i = 0; i < 100; i++)
	{
		theHasher.add(theBoard.mZombieAllowed[i]);
	}

	AddInt(theHasher, theBoard.mSunCountDown);
	AddInt(theHasher, theBoard.mNumSunsFallen);
	AddInt(theHasher, theBoard.mShakeCounter);
	AddInt(theHasher, theBoard.mShakeAmountX);
	AddInt(theHasher, theBoard.mShakeAmountY);
	theHasher.add_enum(theBoard.mBackground);
	AddInt(theHasher, theBoard.mLevel);
	AddInt(theHasher, theBoard.mSodPosition);
	AddInt(theHasher, theBoard.mPrevMouseX);
	AddInt(theHasher, theBoard.mPrevMouseY);
	AddInt(theHasher, theBoard.mSunMoney);
	AddInt(theHasher, theBoard.mNumWaves);
	AddInt(theHasher, theBoard.mMainCounter);
	AddInt(theHasher, theBoard.mEffectCounter);
	AddInt(theHasher, theBoard.mDrawCount);
	AddInt(theHasher, theBoard.mRiseFromGraveCounter);
	AddInt(theHasher, theBoard.mOutOfMoneyCounter);
	AddInt(theHasher, theBoard.mCurrentWave);
	AddInt(theHasher, theBoard.mTotalSpawnedWaves);
	theHasher.add_enum(theBoard.mTutorialState);
	AddInt(theHasher, theBoard.mTutorialTimer);
	AddInt(theHasher, theBoard.mLastBungeeWave);
	AddInt(theHasher, theBoard.mZombieHealthToNextWave);
	AddInt(theHasher, theBoard.mZombieHealthWaveStart);
	AddInt(theHasher, theBoard.mZombieCountDown);
	AddInt(theHasher, theBoard.mZombieCountDownStart);
	AddInt(theHasher, theBoard.mHugeWaveCountDown);
	for (int i = 0; i < NUM_ADVICE_TYPES; i++)
	{
		theHasher.add(theBoard.mHelpDisplayed[i]);
	}
	theHasher.add_enum(theBoard.mHelpIndex);
	theHasher.add(theBoard.mFinalBossKilled);
	theHasher.add(theBoard.mShowShovel);
	AddInt(theHasher, theBoard.mCoinBankFadeCount);
	theHasher.add(theBoard.mLevelComplete);
	AddInt(theHasher, theBoard.mBoardFadeOutCounter);
	AddInt(theHasher, theBoard.mNextSurvivalStageCounter);
	AddInt(theHasher, theBoard.mScoreNextMowerCounter);
	theHasher.add(theBoard.mLevelAwardSpawned);
	AddInt(theHasher, theBoard.mProgressMeterWidth);
	AddInt(theHasher, theBoard.mFlagRaiseCounter);
	AddInt(theHasher, theBoard.mIceTrapCounter);
	AddInt(theHasher, theBoard.mBoardRandSeed);
	AddInt(theHasher, theBoard.mFwooshCountDown);
	AddInt(theHasher, theBoard.mTimeStopCounter);
	theHasher.add(theBoard.mDroppedFirstCoin);
	AddInt(theHasher, theBoard.mFinalWaveSoundCounter);
	AddInt(theHasher, theBoard.mCobCannonCursorDelayCounter);
	AddInt(theHasher, theBoard.mCobCannonMouseX);
	AddInt(theHasher, theBoard.mCobCannonMouseY);
	theHasher.add(theBoard.mKilledYeti);
	theHasher.add(theBoard.mMustacheMode);
	theHasher.add(theBoard.mSuperMowerMode);
	theHasher.add(theBoard.mFutureMode);
	theHasher.add(theBoard.mPinataMode);
	theHasher.add(theBoard.mDanceMode);
	theHasher.add(theBoard.mDaisyMode);
	theHasher.add(theBoard.mSukhbirMode);
	theHasher.add_enum(theBoard.mPrevBoardResult);
	theHasher.add(theBoard.mPeaShooterUsed);
	theHasher.add(theBoard.mCatapultPlantsUsed);
	AddInt(theHasher, theBoard.mLevelCoinsCollected);
	AddInt(theHasher, theBoard.mGargantuarsKillsByCornCob);
	theHasher.add(theBoard.mMushroomAndCoffeeBeansOnly);
	theHasher.add(theBoard.mMushroomsUsed);
	AddInt(theHasher, theBoard.mTriggeredLawnMowers);
	AddInt(theHasher, theBoard.mPlayTimeActiveLevel);
	AddInt(theHasher, theBoard.mPlayTimeInactiveLevel);
	AddInt(theHasher, theBoard.mMaxSunPlants);
	AddInt(theHasher, theBoard.mGravesCleared);
	AddInt(theHasher, theBoard.mPlantsEaten);
	AddInt(theHasher, theBoard.mPlantsShoveled);
	AddInt(theHasher, theBoard.mCoinsCollected);
	AddInt(theHasher, theBoard.mDiamondsCollected);
	AddInt(theHasher, theBoard.mPottedPlantsCollected);
	AddInt(theHasher, theBoard.mChocolateCollected);
}

}

std::uint64_t ComputeBoardStateDigest(const Board& theBoard)
{
	StateHasher aHasher;
	aHasher.add_string(BOARD_STATE_SCHEMA);
	AddAppState(aHasher, theBoard.mApp);
	AddBoardState(aHasher, theBoard);
	AddChallenge(aHasher, theBoard.mChallenge);
	AddSeedBank(aHasher, theBoard.mSeedBank);
	AddCursor(aHasher, theBoard.mCursorObject);
	aHasher.add(theBoard.mCursorPreview != nullptr);
	if (theBoard.mCursorPreview != nullptr)
	{
		AddGameObject(aHasher, *theBoard.mCursorPreview);
		AddInt(aHasher, theBoard.mCursorPreview->mGridX);
		AddInt(aHasher, theBoard.mCursorPreview->mGridY);
	}

	AddDataArray(aHasher, theBoard.mPlants, AddPlant);
	AddDataArray(aHasher, theBoard.mZombies, AddZombie);
	AddDataArray(aHasher, theBoard.mProjectiles, AddProjectile);
	AddDataArray(aHasher, theBoard.mCoins, AddCoin);
	AddDataArray(aHasher, theBoard.mLawnMowers, AddLawnMower);
	AddDataArray(aHasher, theBoard.mGridItems, AddGridItem);
	return aHasher.finish().value;
}

}
}
