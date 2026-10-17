#include "DataSync.h"
#include "PlayerInfo.h"
#include "LevelSaveFormat.h"
#include "Lawn/LawnCommon.h"
#include "Lawn/Widget/ChallengeScreen.h"
#include "Sexy.TodLib/TodDebug.h"
#include "Sexy.TodLib/TodCommon.h"
#include "misc/Buffer.h"
#include "SexyAppFramework/SexyAppBase.h"

// v13（2026-10-08 用户裁决"存档值与枚举彻底相等，不留兼容层"）：
// mChallengeRecords 槽序改为 GameMode 直下标（v12 及以前=旧模式值-1 恒等式）；
// 旧 dat64 因版本门拒载（用户重造档；原版 dat 经转换器重转，转换器按
// 旧槽序→新槽序搬值——那是转换器的活，不是运行时兼容层）。
static int gUserVersion = 13;

namespace
{
constexpr size_t kGOTYFixedCoreSize = 820;
constexpr size_t kGOTYFixedTailSize = 66;
constexpr size_t kPottedPlantSize = 88;
constexpr size_t kZombatarSize = 72;
constexpr size_t kPottedPlantCountOffset = kGOTYFixedCoreSize - sizeof(int);

static_assert(sizeof(int) == 4, "GOTY save integers must remain 32-bit");
static_assert(sizeof(PlayerInfo::mPurchases) == 80 * 4, "GOTY purchase entries must remain 32-bit");
static_assert(sizeof(PlayerInfo::mLastStinkyChocolateTime) == 4, "GOTY snail timestamp must remain 32-bit");
static_assert(sizeof(PottedPlant) == kPottedPlantSize, "PottedPlant no longer matches the GOTY save layout");
static_assert(sizeof(Zombatar) == kZombatarSize, "Zombatar no longer matches the GOTY save layout");

bool ReadSaveInt(const Buffer& theBuffer, size_t theOffset, int& theValue)
{
	if (theOffset + sizeof(theValue) > static_cast<size_t>(theBuffer.GetDataLen()))
		return false;

	memcpy(&theValue, static_cast<const unsigned char*>(theBuffer.GetDataPtr()) + theOffset, sizeof(theValue));
	return true;
}

bool IsNativeGOTYDetailsBuffer(const Buffer& theBuffer)
{
	const size_t aDataLen = static_cast<size_t>(theBuffer.GetDataLen());
	if (aDataLen < kGOTYFixedCoreSize + kGOTYFixedTailSize)
		return false;

	int aNumPottedPlants = 0;
	if (!ReadSaveInt(theBuffer, kPottedPlantCountOffset, aNumPottedPlants) ||
		aNumPottedPlants < 0 || aNumPottedPlants > MAX_POTTED_PLANTS)
	{
		return false;
	}

	const size_t aZombatarCountOffset = kGOTYFixedCoreSize +
		static_cast<size_t>(aNumPottedPlants) * kPottedPlantSize + 41;
	int aNumZombatars = 0;
	if (!ReadSaveInt(theBuffer, aZombatarCountOffset, aNumZombatars) ||
		aNumZombatars < 0 || aNumZombatars > MAX_NUM_ZOMBATARS)
	{
		return false;
	}

	const size_t anExpectedSize = kGOTYFixedCoreSize +
		static_cast<size_t>(aNumPottedPlants) * kPottedPlantSize +
		kGOTYFixedTailSize + static_cast<size_t>(aNumZombatars) * kZombatarSize;
	return aDataLen == anExpectedSize;
}
}

PlayerInfo::PlayerInfo()
{
	Reset();
}

//0x468310
void PlayerInfo::SyncSummary(DataSync& theSync)
{
	theSync.SyncString(mName);
	theSync.SyncLong(mUseSeq);
	theSync.SyncLong(mId);
}

//0x468390
// GOTY @Patoke: 0x46BE80
bool PlayerInfo::SyncDetails(DataSync& theSync)
{
	if (theSync.mReader)
	{
		Reset();
	}

	int aVersion = gUserVersion;
	theSync.SyncLong(aVersion);
	theSync.mVersion = aVersion;
	// 版本门（2026-10-08 用户裁决：本体只支持 v13——槽序与 GameMode v3 彻底
	// 相等；v12 及更旧的原版/历史档一律由存档转换工具迁移（dat→dat64 方向
	// 规则不变：存在 dat 即全转 dat64，反向同理），本体不做运行时兼容层。
	if (aVersion != gUserVersion)
	{
		return false;
	}

	theSync.SyncLong(mLevel);
	theSync.SyncLong(mCoins);
	theSync.SyncLong(mFinishedAdventure);
	for (int i = 0; i < 100; i++)
	{
		theSync.SyncLong(mChallengeRecords[i]);
	}
	for (int i = 0; i < 80; i++)
	{
		theSync.SyncLong(mPurchases[i]);
	}
	theSync.SyncLong(mPlayTimeActivePlayer);
	theSync.SyncLong(mPlayTimeInactivePlayer);
	theSync.SyncLong(mHasUsedCheatKeys);
	theSync.SyncLong(mHasWokenStinky);
	theSync.SyncLong(mDidntPurchasePacketUpgrade);
	theSync.SyncLong(mLastStinkyChocolateTime);
	theSync.SyncLong(mStinkyPosX);
	theSync.SyncLong(mStinkyPosY);
	theSync.SyncLong(mHasUnlockedMinigames);
	theSync.SyncLong(mHasUnlockedPuzzleMode);
	theSync.SyncLong(mHasNewMiniGame);
	theSync.SyncLong(mHasNewScaryPotter);
	theSync.SyncLong(mHasNewIZombie);
	theSync.SyncLong(mHasNewSurvival);
	theSync.SyncLong(mHasUnlockedSurvivalMode);
	theSync.SyncLong(mNeedsMessageOnGameSelector);
	theSync.SyncLong(mNeedsMagicTacoReward);
	theSync.SyncLong(mHasSeenStinky);
	theSync.SyncLong(mHasSeenUpsell);
	theSync.SyncLong(mPlaceHolderPlayerStats);
	theSync.SyncLong(mNumPottedPlants);

	if (mNumPottedPlants < 0 || mNumPottedPlants > MAX_POTTED_PLANTS)
	{
		return false;
	}
	for (int i = 0; i < mNumPottedPlants; i++)
	{
		theSync.SyncBytes(&mPottedPlant[i], sizeof(PottedPlant));
	}

	// 1073 0046BE80 serializes earned/shown as a pair for each achievement.
	// The two arrays are separate in memory, not separate blocks on disk.
	for (int i = 0; i < 20; i++)
	{
		theSync.SyncBool(mEarnedAchievements[i]);
		theSync.SyncBool(mShownAchievements[i]);
	}

	theSync.SyncBool(mAcceptedZombatarULA);
	theSync.SyncLong(mNumZombatars);
	if (mNumZombatars < 0 || mNumZombatars > MAX_NUM_ZOMBATARS)
	{
		return false;
	}
	for (int i = 0; i < mNumZombatars; i++)
	{
		// 1073 writes item (+0x24) then color (+0x00) for each page.
		for (int page = 0; page < ZOMBATAR_NUM_ZOMBATAR_CUSTOM_PAGES; ++page)
		{
			theSync.SyncLong(mZombatars[i].mItems[page]);
			theSync.SyncLong(mZombatars[i].mColors[page]);
		}
	}

	for (int i = 0; i < 20; i++)
	{
		theSync.SyncBool(mMiniGamesCompleted[i]);
	}

	theSync.SyncBool(mShownZombatarDesktopMessage);
	return true;
}

//0x469400
bool PlayerInfo::LoadDetails()
{
	// user<ID>.dat64 = 8 字节 PVZUSR64 魔数 + v13 明细字节流。旧版 user<ID>.dat
	//（v12，槽序=旧模式值-1）本体不再读取——迁移一律走独立转换器（铁律：
	// 无运行时兼容层）。
	Buffer aBuffer;
	std::string aFileName = GetAppDataFolder() + StrFormat("user%d.dat64", mId);
	if (!gSexyAppBase->ReadBufferFromFile(aFileName, &aBuffer, false))
	{
		return true;
	}

	const unsigned char* aFileData = static_cast<const unsigned char*>(aBuffer.GetDataPtr());
	const int aFileLen = aBuffer.GetDataLen();
	if (aFileLen < (int)LevelSaveFormat::USER64_HEADER_SIZE ||
		std::memcmp(aFileData, LevelSaveFormat::USER64_MAGIC.data(),
			LevelSaveFormat::USER64_MAGIC.size()) != 0)
	{
		mDetailsLoadRejected = true;
		TodTrace("Rejected unsupported player data without modifying it\n");
		return false;
	}

	Buffer aDetails;
	aDetails.SetData(const_cast<unsigned char*>(aFileData) + LevelSaveFormat::USER64_HEADER_SIZE,
		aFileLen - (int)LevelSaveFormat::USER64_HEADER_SIZE);
	if (!IsNativeGOTYDetailsBuffer(aDetails))
	{
		mDetailsLoadRejected = true;
		TodTrace("Rejected unsupported player data without modifying it\n");
		return false;
	}

	try
	{
		PlayerInfo aLoadedPlayer;
		DataReader aReader;
		aReader.OpenMemory(aDetails.GetDataPtr(), aDetails.GetDataLen(), false);
		DataSync aSync(aReader);
		if (!aLoadedPlayer.SyncDetails(aSync))
		{
			mDetailsLoadRejected = true;
			TodTrace("Rejected unsupported player data without modifying it\n");
			return false;
		}

		aLoadedPlayer.mName = mName;
		aLoadedPlayer.mUseSeq = mUseSeq;
		aLoadedPlayer.mId = mId;
		// 1073's new-avatar path starts the skin swatch at palette entry 0.
		// Preserve the rest of the native record verbatim, but repair a torn or
		// pre-release record whose skin index is -1/out of range; otherwise the
		// renderer intentionally uses its white fallback palette.
		for (int i = 0; i < aLoadedPlayer.mNumZombatars; ++i)
		{
			int& aSkinColor = aLoadedPlayer.mZombatars[i].mColors[ZOMBATAR_CUSTOM_SKIN];
			if (aSkinColor < 0 || aSkinColor >= 12)
				aSkinColor = 0;
		}
		*this = aLoadedPlayer;
		return true;
	}
	catch (DataReaderException&)
	{
		mDetailsLoadRejected = true;
		TodTrace("Rejected unsupported player data without modifying it\n");
		return false;
	}
}

//0x4695F0
// GOTY @Patoke: 0x46D750
void PlayerInfo::SaveDetails()
{
	if (mDetailsLoadRejected)
	{
		TodTrace("Refusing to overwrite unsupported player data\n");
		return;
	}

	DataWriter aWriter;
	aWriter.OpenMemory();
	DataSync aSync(aWriter);
	if (!SyncDetails(aSync))
	{
		TodTrace("Refusing to save out-of-range player data\n");
		return;
	}

	// 魔数前缀 + v13 明细流，与 LoadDetails 的 user<ID>.dat64 布局对称。
	std::vector<unsigned char> aFileBytes(LevelSaveFormat::USER64_MAGIC.begin(),
		LevelSaveFormat::USER64_MAGIC.end());
	const unsigned char* aPayload = static_cast<const unsigned char*>(aWriter.GetDataPtr());
	aFileBytes.insert(aFileBytes.end(), aPayload, aPayload + aWriter.GetDataLen());

	MkDir(GetAppDataFolder());
	std::string aFileName = GetAppDataFolder() + StrFormat("user%d.dat64", mId);
	gSexyAppBase->WriteBytesToFile(aFileName, aFileBytes.data(),
		static_cast<unsigned long>(aFileBytes.size()));
}

//0x469810
void PlayerInfo::DeleteUserFiles()
{
	if (!LoadDetails())
	{
		return;
	}

	std::string aFilename = GetAppDataFolder() + StrFormat("user%d.dat64", mId);
	gSexyAppBase->EraseFile(aFilename);
	// 删号时把该档位的旧版 user<ID>.dat 一并清掉：它是同一玩家的遗留数据，
	// 留在目录里会被批量转换器再度转成 dat64"复活"已删除的档案。
	gSexyAppBase->EraseFile(GetAppDataFolder() + StrFormat("user%d.dat", mId));

	for (int i = 0; i < (int)GameMode::NUM_GAME_MODES; i++)
	{
		std::string aFileName = GetSavedGameName((GameMode)i, mId);
		gSexyAppBase->EraseFile(aFileName);
	}
}

//0x469940
// GOTY @Patoke: 0x46DBF0
void PlayerInfo::Reset()
{
	mLevel = 1;
	mCoins = 0;
	mFinishedAdventure = 0;
	memset(mChallengeRecords, 0, sizeof(mChallengeRecords));
	memset(mPurchases, 0, sizeof(mPurchases));
	mPlayTimeActivePlayer = 0;
	mPlayTimeInactivePlayer = 0;
	mHasUsedCheatKeys = 0;
	mHasWokenStinky = 0;
	mDidntPurchasePacketUpgrade = 0;
	mLastStinkyChocolateTime = 0;
	mStinkyPosX = 0;
	mStinkyPosY = 0;
	mHasUnlockedMinigames = 0;
	mHasUnlockedPuzzleMode = 0;
	mHasNewMiniGame = 0;
	mHasNewScaryPotter = 0;
	mHasNewIZombie = 0;
	mHasNewSurvival = 0;
	mHasUnlockedSurvivalMode = 0;
	mNeedsMessageOnGameSelector = 0;
	mNeedsMagicTacoReward = 0;
	mHasSeenStinky = 0;
	mHasSeenUpsell = 0;
	mAcceptedZombatarULA = false;
	mPlaceHolderPlayerStats = 0;

	for (int i = 0; i < 20; i++)
	{
		mEarnedAchievements[i] = false;
		mShownAchievements[i] = false;
	}

	mNumZombatars = 0;

	memset(mPottedPlant, 0, sizeof(mPottedPlant));
	mNumPottedPlants = 0;
	memset(mMiniGamesCompleted, 0, sizeof(mMiniGamesCompleted));
	mShownZombatarDesktopMessage = false;
	mDetailsLoadRejected = false;
}

void PlayerInfo::AddCoins(int theAmount)
{
	mCoins += theAmount;
	if (mCoins > 99999)
	{
		mCoins = 99999;
	}
	else if (mCoins < 0)
	{
		mCoins = 0;
	}
}

void PlayerInfo::ResetChallengeRecord(GameMode theGameMode)
{
	// 存档 v13：槽位=GameMode 直下标（1073 原式 mode-SURVIVAL_NORMAL_1 在
	// v1 下恰等于 mode-1；v3 枚举重排后该减式错槽，收归直下标）。
	int aGameMode = (int)theGameMode;
	TOD_ASSERT(aGameMode >= 0 && aGameMode < 100);
	mChallengeRecords[aGameMode] = 0;
}

//0x469A00
void PottedPlant::InitializePottedPlant(SeedType theSeedType)
{
	memset(this, 0, sizeof(PottedPlant));
	mSeedType = theSeedType;
	mDrawVariation = DrawVariation::VARIATION_NORMAL;
	mLastWateredTime = 0;
	mFacing = (FacingDirection)RandRangeInt((int)FacingDirection::FACING_RIGHT, (int)FacingDirection::FACING_LEFT);
	mPlantAge = PottedPlantAge::PLANTAGE_SPROUT;
	mTimesFed = 0;
	mWhichZenGarden = GardenType::GARDEN_MAIN;
	mFeedingsPerGrow = RandRangeInt(3, 5);
	mPlantNeed = PottedPlantNeed::PLANTNEED_NONE;
	mLastNeedFulfilledTime = 0;
	mLastFertilizedTime = 0;
	mLastChocolateTime = 0;
}

void PlayerInfo::DeleteZombatarFromIndex(int* theIndex)
{
	if (!theIndex || *theIndex < 0 || *theIndex >= mNumZombatars)
	{
		TodTraceAndLog("Attempting to delete invalid Zombatar at index %d", theIndex ? *theIndex : -1);
		return;
	}

	const int aNumToMove = mNumZombatars - *theIndex - 1;
	if (aNumToMove > 0)
	{
		memmove(
			&mZombatars[*theIndex],
			&mZombatars[*theIndex + 1],
			static_cast<size_t>(aNumToMove) * sizeof(Zombatar));
	}

	--mNumZombatars;
	memset(&mZombatars[mNumZombatars], 0, sizeof(Zombatar));
}
