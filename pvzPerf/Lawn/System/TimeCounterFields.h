#pragma once
#include <type_traits>
#include <cstring>
#include <cstddef>

// Included after the save record classes. The lists describe only elapsed time;
// counts, frame indices, durations and entity IDs keep their existing encoding.
template<class T, class Fn>
void VisitTimeCounterOffsets(Fn&& visit)
{
    using Type = std::remove_cv_t<T>;
#define TIMER(field) visit(offsetof(Type, field), std::is_same_v<decltype(Type::field), Sexy::UnsignedTimeCounter>)
    if constexpr (std::is_same_v<Type, Board>)
    {
        TIMER(mFogBlownCountDown); TIMER(mSunCountDown); TIMER(mShakeCounter);
        TIMER(mMainCounter); TIMER(mEffectCounter); TIMER(mRiseFromGraveCounter);
        TIMER(mOutOfMoneyCounter); TIMER(mTutorialTimer); TIMER(mZombieCountDown);
        TIMER(mHugeWaveCountDown); TIMER(mCoinBankFadeCount); TIMER(mBoardFadeOutCounter);
        TIMER(mNextSurvivalStageCounter); TIMER(mScoreNextMowerCounter);
        TIMER(mFlagRaiseCounter); TIMER(mIceTrapCounter); TIMER(mFwooshCountDown);
        TIMER(mTimeStopCounter); TIMER(mFinalWaveSoundCounter); TIMER(mCobCannonCursorDelayCounter);
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
    }
    else if constexpr (std::is_same_v<Type, Plant>)
    {
        TIMER(mAnimCounter); TIMER(mDisappearCountdown); TIMER(mDoSpecialCountdown);
        TIMER(mStateCountdown); TIMER(mLaunchCounter); TIMER(mShootingCounter);
        TIMER(mBlinkCountdown); TIMER(mRecentlyEatenCountdown); TIMER(mEatenFlashCountdown);
        TIMER(mBeghouledFlashCountdown); TIMER(mWakeUpCounter);
    }
    else if constexpr (std::is_same_v<Type, Projectile>)
    {
        TIMER(mAnimCounter); TIMER(mProjectileAge); TIMER(mClickBackoffCounter);
    }
    else if constexpr (std::is_same_v<Type, Coin>)
    {
        TIMER(mFadeCount); TIMER(mCoinAge); TIMER(mDisappearCounter);
    }
    else if constexpr (std::is_same_v<Type, LawnMower>)
    {
        TIMER(mChompCounter); TIMER(mRollingInCounter); TIMER(mSquishedCounter);
    }
    else if constexpr (std::is_same_v<Type, GridItem>)
    {
        TIMER(mGridItemCounter); TIMER(mTransparentCounter);
    }
    else if constexpr (std::is_same_v<Type, TodParticle>)
        TIMER(mParticleAge);
    else if constexpr (std::is_same_v<Type, TodParticleEmitter>)
    {
        TIMER(mSystemAge); TIMER(mEmitterCrossFadeCountDown);
    }
    else if constexpr (std::is_same_v<Type, ReanimatorTrackInstance>)
        TIMER(mBlendCounter);
    else if constexpr (std::is_same_v<Type, CursorObject>)
        TIMER(mHammerDownCounter);
    else if constexpr (std::is_same_v<Type, MessageWidget>)
    {
        TIMER(mDisplayTime); TIMER(mDuration); TIMER(mSlideOffTime);
    }
    else if constexpr (std::is_same_v<Type, SeedPacket>)
    {
        TIMER(mRefreshCounter); TIMER(mSlotMachineCountDown);
    }
    else if constexpr (std::is_same_v<Type, SeedBank>)
        TIMER(mConveyorBeltCounter);
    else if constexpr (std::is_same_v<Type, Challenge>)
    {
        TIMER(mChallengeStateCounter); TIMER(mConveyorBeltCounter); TIMER(mRainCounter);
        for (size_t i = 0; i < 6; ++i)
            visit(offsetof(Type, mCloudsCounter) + i * sizeof(Sexy::TimeCounter), false);
    }
    else if constexpr (std::is_same_v<Type, Music>)
    {
        TIMER(mBurstStateCounter); TIMER(mDrumsStateCounter); TIMER(mFadeOutCounter);
    }
#undef TIMER
}

template<class T>
void ImportTimeCounters(unsigned char* record)
{
    VisitTimeCounterOffsets<T>([&](size_t offset, bool isUnsigned) {
        const auto import = [&]<class Storage>() {
            Storage legacy;
            std::memcpy(&legacy, record + offset, sizeof(legacy));
            const Sexy::BasicTimeCounter<Storage> live = legacy;
            std::memcpy(record + offset, &live, sizeof(live));
        };
        if (isUnsigned) import.template operator()<unsigned int>();
        else import.template operator()<int>();
    });
}

template<class T>
void ImportTimeCounters(T& value)
{
    ImportTimeCounters<T>(reinterpret_cast<unsigned char*>(&value));
}

template<class T>
void ExportTimeCounters(unsigned char* bytes, const unsigned char* record,
    size_t nativeOffset, size_t wireOffset, size_t length)
{
    VisitTimeCounterOffsets<T>([&](size_t offset, bool isUnsigned) {
        if (offset >= nativeOffset && offset + sizeof(int) <= nativeOffset + length)
        {
            const auto exportValue = [&]<class Storage>() {
                Sexy::BasicTimeCounter<Storage> live;
                std::memcpy(&live, record + offset, sizeof(live));
                const Storage legacy = static_cast<Storage>(live);
                std::memcpy(bytes + wireOffset + offset - nativeOffset, &legacy, sizeof(legacy));
            };
            if (isUnsigned) exportValue.template operator()<unsigned int>();
            else exportValue.template operator()<int>();
        }
    });
}

template<class T>
void ExportTimeCounters(unsigned char* bytes, const T& value,
    size_t nativeOffset, size_t wireOffset, size_t length)
{
    ExportTimeCounters<T>(bytes, reinterpret_cast<const unsigned char*>(&value),
        nativeOffset, wireOffset, length);
}
