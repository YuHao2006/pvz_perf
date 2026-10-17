#pragma once
#define MAX_NUM_ZOMBATARS 100
#define MAX_POTTED_PLANTS 200
// 购买量编码哨兵：mPurchases[] 存 PURCHASE_COUNT_OFFSET+n 表剩余 n 次；
// >= OFFSET 即已购（消耗品）/一次性购入（否则）。宏转 constexpr（伪枚举普查卫生项）
constexpr int PURCHASE_COUNT_OFFSET = 1000;

#include <ctime>
#include <cstdint>
#include "ConstEnums.h"
#include "SexyAppFramework/Common.h"

class PottedPlant
{
public:
    enum FacingDirection
    {
        FACING_RIGHT,
        FACING_LEFT
    };

public:
    SeedType            mSeedType;                  //+0x0
    GardenType          mWhichZenGarden;            //+0x4
    int                 mX;                         //+0x8
    int                 mY;                         //+0xC
    FacingDirection     mFacing;                    //+0x10

    std::int64_t        mLastWateredTime;           //+0x18
    DrawVariation       mDrawVariation;             //+0x20
    PottedPlantAge      mPlantAge;                  //+0x24
    int                 mTimesFed;                  //+0x28
    int                 mFeedingsPerGrow;           //+0x2C
    PottedPlantNeed     mPlantNeed;                 //+0x30

    std::int64_t        mLastNeedFulfilledTime;     //+0x38
    std::int64_t        mLastFertilizedTime;        //+0x40
    std::int64_t        mLastChocolateTime;         //+0x48
    std::int64_t        mFutureAttribute[1];        //+0x50

public:
    void                InitializePottedPlant(SeedType theSeedType);
};

class Zombatar
{
public:
    // In-memory layout: colors then items, each indexed by customization page.
    // The 1073 FILE layout is different: nine (item, color) pairs (0046BE80).
    // PlayerInfo::SyncDetails performs that mapping; never dump this struct.
    int mColors[ZOMBATAR_NUM_ZOMBATAR_CUSTOM_PAGES];
    int mItems[ZOMBATAR_NUM_ZOMBATAR_CUSTOM_PAGES];
};

class DataSync;
class PlayerInfo
{
public:
    SexyString          mName;                              //+GOTY @Patoke: 0x0
    unsigned int               mUseSeq = 0;                        //+GOTY @Patoke: 0x1C
    unsigned int               mId = 0;                            //+GOTY @Patoke: 0x20
	bool                mEarnedAchievements[20];            //+GOTY @Patoke: 0x24
	bool                mShownAchievements[20];             //+GOTY @Patoke: 0x38
	int                 mLevel;                             //+GOTY @Patoke: 0x4C
	int                 mCoins;                             //+GOTY @Patoke: 0x50
	int                 mFinishedAdventure;                 //+GOTY @Patoke: 0x54
	int                 mChallengeRecords[100];             //+GOTY @Patoke: 0x58
	std::int32_t        mPurchases[80];                     //+GOTY @Patoke: 0x1E8
	int                 mPlayTimeActivePlayer;              //+GOTY @Patoke: 0x328
	int                 mPlayTimeInactivePlayer;            //+GOTY @Patoke: 0x32C
	int                 mHasUsedCheatKeys;                  //+GOTY @Patoke: 0x330
	int                 mHasWokenStinky;                    //+GOTY @Patoke: 0x334
	int                 mDidntPurchasePacketUpgrade;        //+GOTY @Patoke: 0x338
	std::int32_t        mLastStinkyChocolateTime;           //+GOTY @Patoke: 0x33C
	int                 mStinkyPosX;                        //+GOTY @Patoke: 0x340
	int                 mStinkyPosY;                        //+GOTY @Patoke: 0x344
	int                 mHasUnlockedMinigames;              //+GOTY @Patoke: 0x348
	int                 mHasUnlockedPuzzleMode;             //+GOTY @Patoke: 0x34C
	int                 mHasNewMiniGame;                    //+GOTY @Patoke: 0x350
	int                 mHasNewScaryPotter;                 //+GOTY @Patoke: 0x354
	int                 mHasNewIZombie;                     //+GOTY @Patoke: 0x358
	int                 mHasNewSurvival;                    //+GOTY @Patoke: 0x35C
	int                 mHasUnlockedSurvivalMode;           //+GOTY @Patoke: 0x360
	int                 mNeedsMessageOnGameSelector;        //+GOTY @Patoke: 0x364
	int                 mNeedsMagicTacoReward;              //+GOTY @Patoke: 0x368
	int                 mHasSeenStinky;                     //+GOTY @Patoke: 0x36C
	int                 mHasSeenUpsell;                     //+GOTY @Patoke: 0x370
	int                 mPlaceHolderPlayerStats;            //+GOTY @Patoke: 0x374
	int                 mNumPottedPlants;                   //+GOTY @Patoke: 0x378
	// Serialized for byte-compatible 1073 detail saves. Legacy intentionally
	// does not show the one-time desktop message or gate Zombatar behind a ULA.
	bool                mShownZombatarDesktopMessage;       //+GOTY @Patoke: 0x37C
	bool                mAcceptedZombatarULA;               //+GOTY @Patoke: 0x37D
    PottedPlant         mPottedPlant[MAX_POTTED_PLANTS];    //+GOTY @Patoke: 0x380
    int                 mNumZombatars;                      //+GOTY @Patoke: 0x4840
    Zombatar            mZombatars[MAX_NUM_ZOMBATARS]{};    //+GOTY @Patoke: 0x4844
    bool                mMiniGamesCompleted[20];            //+GOTY @Patoke: 0x6464

    // Not serialized. An unsupported detail file must never be overwritten.
    bool                mDetailsLoadRejected;

public:
    PlayerInfo();

    void                Reset();
    /*inline*/ void     AddCoins(int theAmount);
    void                SyncSummary(DataSync& theSync);
    bool                SyncDetails(DataSync& theSync);
    void                DeleteUserFiles();
    bool                LoadDetails();
    void                SaveDetails();
    /*inline*/ void     ResetChallengeRecord(GameMode theGameMode);
    void                DeleteZombatarFromIndex(int* theIndex);
};

