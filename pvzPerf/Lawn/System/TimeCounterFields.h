#pragma once
#include <type_traits>
#include <cstring>
#include <cstddef>

// Included after the save record classes. This describes native 64-bit time
// members, including durations and time snapshots. Wire encoding is handled by
// Dat64TimeSchema/SaveRecordMapping, never by overwriting native 4-byte slots.
template<class T, class Fn>
void VisitTimeCounterOffsets(Fn&& visit)
{
    using Type = std::remove_cv_t<T>;
#define TIMER(field) visit(offsetof(Type, field), std::is_unsigned_v<typename decltype(Type::field)::Nanoseconds>)
    if constexpr (std::is_same_v<Type, Board>)
    {
        TIMER(mFogBlownCountDown); TIMER(mSunCountDown); TIMER(mShakeCounter);
        visit(offsetof(Type, mLevelTimeNs), true);
        TIMER(mEffectCounter); TIMER(mRiseFromGraveCounter);
        TIMER(mOutOfMoneyCounter); TIMER(mTutorialTimer); TIMER(mZombieCountDown);
        TIMER(mHugeWaveCountDown); TIMER(mCoinBankFadeCount); TIMER(mBoardFadeOutCounter);
        TIMER(mNextSurvivalStageCounter); TIMER(mScoreNextMowerCounter);
        TIMER(mFlagRaiseCounter); TIMER(mIceTrapCounter); TIMER(mFwooshCountDown);
        TIMER(mTimeStopCounter); TIMER(mFinalWaveSoundCounter); TIMER(mCobCannonCursorDelayCounter);
        TIMER(mZombieCountDownStart); TIMER(mPlayTimeActiveLevel); TIMER(mPlayTimeInactiveLevel);
        TIMER(mStartDrawTime); TIMER(mIntervalDrawTime); TIMER(mPreloadTime);
        for (size_t i = 0; i < MAX_GRID_SIZE_Y; ++i)
            visit(offsetof(Type, mIceTimer) + i * sizeof(Sexy::TimeCounter), false);
    }
    else if constexpr (std::is_same_v<Type, Zombie>)
    {
        TIMER(mAnimCounter); TIMER(mGroanCounter); TIMER(mJustGotShotCounter);
        TIMER(mShieldJustGotShotCounter); TIMER(mShieldRecoilCounter); TIMER(mZombieAge);
        TIMER(mPhaseCounter); TIMER(mZombieFade); TIMER(mChilledCounter); TIMER(mButteredCounter);
        TIMER(mIceTrapCounter); TIMER(mYuckyFaceCounter); TIMER(mSummonCounter);
        TIMER(mBossBungeeCounter); TIMER(mBossStompCounter); TIMER(mBossHeadCounter);
        TIMER(mAnimTicksPerFrame);
    }
    else if constexpr (std::is_same_v<Type, Plant>)
    {
        TIMER(mAnimCounter); TIMER(mDisappearCountdown); TIMER(mDoSpecialCountdown);
        TIMER(mStateCountdown); TIMER(mZenProductionCountdown); TIMER(mShootingCounter);
        TIMER(mBlinkCountdown); TIMER(mRecentlyEatenCountdown); TIMER(mEatenFlashCountdown);
        TIMER(mBeghouledFlashCountdown); TIMER(mWakeUpCounter);
        TIMER(mFrameLength); TIMER(mLaunchRate);
    }
    else if constexpr (std::is_same_v<Type, Projectile>)
    {
        // Frozen wire timers are projections; runtime owns absolute timestamps.
    }
    else if constexpr (std::is_same_v<Type, Coin>)
    {
        TIMER(mFadeCount); TIMER(mCoinAge); TIMER(mDisappearCounter);
    }
    else if constexpr (std::is_same_v<Type, LawnMower>)
    {
        TIMER(mChompCounter); TIMER(mRollingInCounter); TIMER(mSquishedCounter);
        TIMER(mAnimTicksPerFrame);
    }
    else if constexpr (std::is_same_v<Type, GridItem>)
    {
        TIMER(mGridItemCounter); TIMER(mTransparentCounter);
    }
    else if constexpr (std::is_same_v<Type, TodParticle>)
    {
        TIMER(mParticleAge); TIMER(mParticleDuration); TIMER(mCrossFadeDuration);
    }
    else if constexpr (std::is_same_v<Type, TodParticleEmitter>)
    {
        TIMER(mSystemAge); TIMER(mEmitterCrossFadeCountDown);
        TIMER(mSystemDuration);
    }
    else if constexpr (std::is_same_v<Type, ReanimatorTrackInstance>)
    {
        TIMER(mBlendCounter); TIMER(mBlendTime);
    }
    else if constexpr (std::is_same_v<Type, CursorObject>)
        TIMER(mHammerDownCounter);
    else if constexpr (std::is_same_v<Type, MessageWidget>)
    {
        TIMER(mDisplayTime); TIMER(mDuration); TIMER(mSlideOffTime);
    }
    else if constexpr (std::is_same_v<Type, SeedPacket>)
    {
        TIMER(mRefreshCounter); TIMER(mSlotMachineCountDown);
        TIMER(mRefreshTime);
    }
    else if constexpr (std::is_same_v<Type, SeedBank>)
    {
        TIMER(mConveyorBeltCounter);
        for (size_t i = 0; i < 10; ++i)
            VisitTimeCounterOffsets<SeedPacket>([&](size_t offset, bool isUnsigned) {
                visit(offsetof(Type, mSeedPackets) + i * sizeof(SeedPacket) + offset, isUnsigned);
            });
    }
    else if constexpr (std::is_same_v<Type, Challenge>)
    {
        TIMER(mChallengeStateCounter); TIMER(mConveyorBeltCounter); TIMER(mRainCounter);
        for (size_t i = 0; i < 6; ++i)
            visit(offsetof(Type, mCloudsCounter) + i * sizeof(Sexy::TimeCounter), false);
    }
    else if constexpr (std::is_same_v<Type, Music>)
    {
        TIMER(mBurstStateCounter); TIMER(mDrumsStateCounter); TIMER(mFadeOutCounter);
        TIMER(mFadeOutDuration);
    }
#undef TIMER
}
