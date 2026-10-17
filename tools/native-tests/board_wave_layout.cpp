#include "Lawn/Board.h"
#include "LawnApp.h"
#include "Lawn/Zombie.h"
#include "Lawn/System/LevelSaveFormat.h"
#include "Sexy.TodLib/Reanimator.h"
#include <cstddef>
#include <cstdio>

int main()
{
    const auto state = offsetof(Board, mPaused);
    std::printf("{\"boardSize\":%zu,\"stateOffset\":%zu,\"appBoard\":%zu",
        sizeof(Board), state, offsetof(LawnApp, mBoard));
#define FIELD(member) std::printf(",\"" #member "\":%zu", offsetof(Board, member) - state)
    FIELD(mPaused);
    FIELD(mLevel);
    FIELD(mBackground);
    FIELD(mSunMoney);
    FIELD(mNumWaves);
    FIELD(mMainCounter);
    FIELD(mCurrentWave);
    FIELD(mTotalSpawnedWaves);
    FIELD(mTutorialState);
    FIELD(mTutorialTimer);
    FIELD(mZombieHealthToNextWave);
    FIELD(mZombieHealthWaveStart);
    FIELD(mZombieCountDown);
    FIELD(mZombieCountDownStart);
    FIELD(mHugeWaveCountDown);
    FIELD(mLevelComplete);
    FIELD(mBoardFadeOutCounter);
    FIELD(mNextSurvivalStageCounter);
    FIELD(mLevelAwardSpawned);
    FIELD(mTimeStopCounter);
    FIELD(mZombiesInWave);
#undef FIELD
    std::printf(",\"zombieSize\":%zu,\"zombieSlotSize\":%zu,\"zombieFields\":{",
        sizeof(Zombie), sizeof(DataArray<Zombie>::DataArrayItem));
    std::printf("\"mPosX\":%zu,\"mPosY\":%zu,\"mVelX\":%zu,\"mZombieAge\":%zu,"
        "\"mZombiePhase\":%zu,\"mFromWave\":%zu,\"mBodyHealth\":%zu,\"mDead\":%zu,\"mVisible\":%zu,"
        "\"mBodyReanimID\":%zu,\"mIceTrapCounter\":%zu,\"mButteredCounter\":%zu,"
        "\"mYuckyFace\":%zu,\"mYuckyFaceCounter\":%zu,\"mOriginalAnimRate\":%zu,"
        "\"mScaleZombie\":%zu,\"mIsEating\":%zu},\"reanimFields\":{",
        offsetof(Zombie, mPosX), offsetof(Zombie, mPosY), offsetof(Zombie, mVelX),
        offsetof(Zombie, mZombieAge), offsetof(Zombie, mZombiePhase),
        offsetof(Zombie, mFromWave), offsetof(Zombie, mBodyHealth),
        offsetof(Zombie, mDead), offsetof(Zombie, mVisible), offsetof(Zombie, mBodyReanimID),
        offsetof(Zombie, mIceTrapCounter), offsetof(Zombie, mButteredCounter),
        offsetof(Zombie, mYuckyFace), offsetof(Zombie, mYuckyFaceCounter),
        offsetof(Zombie, mOriginalAnimRate), offsetof(Zombie, mScaleZombie),
        offsetof(Zombie, mIsEating));
    std::printf("\"mAnimTime\":%zu,\"mAnimRate\":%zu,\"mLoopType\":%zu,\"mLoopCount\":%zu,"
        "\"mFrameStart\":%zu,\"mFrameCount\":%zu,\"mDead\":%zu},\"poolLayouts\":[",
        offsetof(Reanimation, mAnimTime), offsetof(Reanimation, mAnimRate),
        offsetof(Reanimation, mLoopType), offsetof(Reanimation, mLoopCount),
        offsetof(Reanimation, mFrameStart), offsetof(Reanimation, mFrameCount),
        offsetof(Reanimation, mDead));
    for (int i = 0; i < 11; ++i) {
        const auto& item = LevelSaveFormat::RECORD_LAYOUTS[i];
        std::printf("%s{\"size\":%u,\"slot\":%u}", i ? "," : "", item.mDat64Size, item.mDat64ArraySlotSize);
    }
    std::puts("]}");
}
