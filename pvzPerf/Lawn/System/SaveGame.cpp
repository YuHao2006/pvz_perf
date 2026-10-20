#include "Music.h"
#include "SaveGame.h"
#include "LevelSaveFormat.h"
#include "Lawn/Board.h"
#include "Lawn/Challenge.h"
#include "Lawn/SeedPacket.h"
#include "LawnApp.h"
#include "Lawn/CursorObject.h"
#include "Resources.h"
#include "ConstEnums.h"
#include "Lawn/MessageWidget.h"
#include <zlib.h>
#include "Sexy.TodLib/Attachment.h"
#include "Sexy.TodLib/Reanimator.h"
#include "Sexy.TodLib/TodParticle.h"
#include "Sexy.TodLib/TodAllocator.h"
#include "Sexy.TodLib/TodCommon.h"
#include "Sexy.TodLib/EffectSystem.h"
#include "TimeCounterFields.h"

#include <climits>
#include <cstddef>
#include <cstdint>
#include <cstring>
#include <memory>
#include <stdexcept>
#include <vector>

// 1073 stores the CRC32 of this exact, intentionally space-less build string.
// "Feb 16 200923:03:38" belongs to the older executable and produces a
// different header, so a 1073 in-progress save is rejected before its board is
// even inspected if that value leaks into Legacy.
static const char* FILE_COMPILE_TIME_STRING = "Jul  2 201011:47:03";
static const unsigned int SAVE_FILE_MAGIC_NUMBER = 0xFEEDDEAD;
static const unsigned int SAVE_FILE_VERSION = 2U;
static unsigned int SAVE_FILE_DATE = crc32(0, (Bytef*)FILE_COMPILE_TIME_STRING, strlen(FILE_COMPILE_TIME_STRING));  //[0x6AA7EC]

namespace
{
using LegacyByte = unsigned char;

template <typename T>
LegacyByte* ObjectBytes(T& theObject)
{
	return reinterpret_cast<LegacyByte*>(&theObject);
}

template <typename T>
const LegacyByte* ObjectBytes(const T& theObject)
{
	return reinterpret_cast<const LegacyByte*>(&theObject);
}

void CopyFromLegacy(
	void* theNativeDestination,
	const LegacyByte* theLegacySource,
	size_t theLegacyOffset,
	size_t theLength)
{
	std::memcpy(theNativeDestination, theLegacySource + theLegacyOffset, theLength);
}

void CopyToLegacy(
	LegacyByte* theLegacyDestination,
	size_t theLegacyOffset,
	const void* theNativeSource,
	size_t theLength)
{
	std::memcpy(theLegacyDestination + theLegacyOffset, theNativeSource, theLength);
}

template <typename T>
void ClearNativeObject(T& theObject)
{
	std::memset(ObjectBytes(theObject), 0, sizeof(T));
}

template <typename T>
struct Legacy1073Layout;

// GameObject has two pointers in front of 28 bytes of fixed-width state. On
// x64 the derived object starts at 48 rather than 36 because the base has an
// additional four bytes of tail padding. All classes using this helper have a
// pointer-free derived tail in the 1073 save image.
template <typename T>
void ReadGameObjectLayout(
	T& theObject,
	const LegacyByte* theLegacy,
	size_t theLegacySize,
	void* theFirstDerivedField)
{
	ClearNativeObject(theObject);
	CopyFromLegacy(&theObject.mX, theLegacy, 8, 28);
	CopyFromLegacy(theFirstDerivedField, theLegacy, 36, theLegacySize - 36);
}

template <typename T>
void WriteGameObjectLayout(
	LegacyByte* theLegacy,
	size_t theLegacySize,
	const T& theObject,
	const void* theFirstDerivedField)
{
	CopyToLegacy(theLegacy, 8, &theObject.mX, 28);
	CopyToLegacy(theLegacy, 36, theFirstDerivedField, theLegacySize - 36);
}

template <>
struct Legacy1073Layout<Zombie>
{
	static constexpr size_t SIZE = 356;
	static void Read(Zombie& v, const LegacyByte* p)
	{
		ReadGameObjectLayout(v, p, SIZE, &v.mZombieType);
		ImportTimeCounters(v);
	}
	static void Write(LegacyByte* p, const Zombie& v)
	{
		WriteGameObjectLayout(p, SIZE, v, &v.mZombieType);
		const auto& layout = LevelSaveFormat::GetRecordLayout(LevelSaveFormat::RecordKind::Zombie);
		for (size_t i = 0; i < layout.mSegmentCount; ++i)
		{
			const auto& segment = layout.mSegments[i];
			ExportTimeCounters(p, v, segment.mDat64Offset, segment.mLegacyOffset, segment.mSize);
		}
	}
};

template <>
struct Legacy1073Layout<Plant>
{
	static constexpr size_t SIZE = 328;
	static void Read(Plant& v, const LegacyByte* p)
	{
		ReadGameObjectLayout(v, p, SIZE, &v.mSeedType);
		ImportTimeCounters(v);
	}
	static void Write(LegacyByte* p, const Plant& v)
	{
		WriteGameObjectLayout(p, SIZE, v, &v.mSeedType);
		const auto& layout = LevelSaveFormat::GetRecordLayout(LevelSaveFormat::RecordKind::Plant);
		for (size_t i = 0; i < layout.mSegmentCount; ++i)
		{
			const auto& segment = layout.mSegments[i];
			ExportTimeCounters(p, v, segment.mDat64Offset, segment.mLegacyOffset, segment.mSize);
		}
	}
};

template <>
struct Legacy1073Layout<Projectile>
{
	static constexpr size_t SIZE = 144;
	static void Read(Projectile& v, const LegacyByte* p)
	{
		ReadGameObjectLayout(v, p, SIZE, &v.mFrame);
		ImportTimeCounters(v);
	}
	static void Write(LegacyByte* p, const Projectile& v)
	{
		WriteGameObjectLayout(p, SIZE, v, &v.mFrame);
		const auto& layout = LevelSaveFormat::GetRecordLayout(LevelSaveFormat::RecordKind::Projectile);
		for (size_t i = 0; i < layout.mSegmentCount; ++i)
		{
			const auto& segment = layout.mSegments[i];
			ExportTimeCounters(p, v, segment.mDat64Offset, segment.mLegacyOffset, segment.mSize);
		}
	}
};

template <>
struct Legacy1073Layout<Coin>
{
	static constexpr size_t SIZE = 208;
	static void Read(Coin& v, const LegacyByte* p)
	{
		ClearNativeObject(v);
		CopyFromLegacy(&v.mX, p, 8, 28);
		CopyFromLegacy(&v.mPosX, p, 36, 72);
		// PottedPlant is 8-byte aligned in x86 but follows immediately after
		// mUsableSeedType in the x64 class. Its own 88-byte layout is stable.
		CopyFromLegacy(&v.mPottedPlantSpec, p, 112, 96);
		ImportTimeCounters(v);
	}
	static void Write(LegacyByte* p, const Coin& v)
	{
		CopyToLegacy(p, 8, &v.mX, 28);
		CopyToLegacy(p, 36, &v.mPosX, 72);
		CopyToLegacy(p, 112, &v.mPottedPlantSpec, 96);
		const auto& layout = LevelSaveFormat::GetRecordLayout(LevelSaveFormat::RecordKind::Coin);
		for (size_t i = 0; i < layout.mSegmentCount; ++i)
		{
			const auto& segment = layout.mSegments[i];
			ExportTimeCounters(p, v, segment.mDat64Offset, segment.mLegacyOffset, segment.mSize);
		}
	}
};

template <>
struct Legacy1073Layout<LawnMower>
{
	static constexpr size_t SIZE = 68;
	static void Read(LawnMower& v, const LegacyByte* p)
	{
		ClearNativeObject(v);
		CopyFromLegacy(&v.mPosX, p, 8, SIZE - 8);
		ImportTimeCounters(v);
	}
	static void Write(LegacyByte* p, const LawnMower& v)
	{
		CopyToLegacy(p, 8, &v.mPosX, SIZE - 8);
		const auto& layout = LevelSaveFormat::GetRecordLayout(LevelSaveFormat::RecordKind::LawnMower);
		for (size_t i = 0; i < layout.mSegmentCount; ++i)
		{
			const auto& segment = layout.mSegments[i];
			ExportTimeCounters(p, v, segment.mDat64Offset, segment.mLegacyOffset, segment.mSize);
		}
	}
};

template <>
struct Legacy1073Layout<GridItem>
{
	static constexpr size_t SIZE = 232;
	static void Read(GridItem& v, const LegacyByte* p)
	{
		ClearNativeObject(v);
		CopyFromLegacy(&v.mGridItemType, p, 8, SIZE - 8);
		ImportTimeCounters(v);
	}
	static void Write(LegacyByte* p, const GridItem& v)
	{
		CopyToLegacy(p, 8, &v.mGridItemType, SIZE - 8);
		const auto& layout = LevelSaveFormat::GetRecordLayout(LevelSaveFormat::RecordKind::GridItem);
		for (size_t i = 0; i < layout.mSegmentCount; ++i)
		{
			const auto& segment = layout.mSegments[i];
			ExportTimeCounters(p, v, segment.mDat64Offset, segment.mLegacyOffset, segment.mSize);
		}
	}
};

template <>
struct Legacy1073Layout<TodParticleSystem>
{
	static constexpr size_t SIZE = 40;
	static void Read(TodParticleSystem& v, const LegacyByte* p)
	{
		ClearNativeObject(v);
		CopyFromLegacy(&v.mEffectType, p, 0, 4);
		CopyFromLegacy(&v.mDead, p, 28, 12);
		ImportTimeCounters(v);
	}
	static void Write(LegacyByte* p, const TodParticleSystem& v)
	{
		CopyToLegacy(p, 0, &v.mEffectType, 4);
		CopyToLegacy(p, 28, &v.mDead, 12);
		const auto& layout = LevelSaveFormat::GetRecordLayout(LevelSaveFormat::RecordKind::ParticleSystem);
		for (size_t i = 0; i < layout.mSegmentCount; ++i)
		{
			const auto& segment = layout.mSegments[i];
			ExportTimeCounters(p, v, segment.mDat64Offset, segment.mLegacyOffset, segment.mSize);
		}
	}
};

template <>
struct Legacy1073Layout<TodParticleEmitter>
{
	static constexpr size_t SIZE = 172;
	static void Read(TodParticleEmitter& v, const LegacyByte* p)
	{
		ClearNativeObject(v);
		CopyFromLegacy(&v.mSpawnAccum, p, 24, 60);
		CopyFromLegacy(&v.mCrossFadeEmitterID, p, 88, 84);
		ImportTimeCounters(v);
	}
	static void Write(LegacyByte* p, const TodParticleEmitter& v)
	{
		CopyToLegacy(p, 24, &v.mSpawnAccum, 60);
		CopyToLegacy(p, 88, &v.mCrossFadeEmitterID, 84);
		const auto& layout = LevelSaveFormat::GetRecordLayout(LevelSaveFormat::RecordKind::ParticleEmitter);
		for (size_t i = 0; i < layout.mSegmentCount; ++i)
		{
			const auto& segment = layout.mSegments[i];
			ExportTimeCounters(p, v, segment.mDat64Offset, segment.mLegacyOffset, segment.mSize);
		}
	}
};

template <>
struct Legacy1073Layout<TodParticle>
{
	static constexpr size_t SIZE = 156;
	static void Read(TodParticle& v, const LegacyByte* p)
	{
		ClearNativeObject(v);
		CopyFromLegacy(&v.mParticleDuration, p, 4, SIZE - 4);
		// 段外派生量补算：mParticleDurationInv 不入盘（段自 mParticleDuration 起），
		// 读回后按原式重算，供 mParticleTimeValue 由除改乘
		v.mParticleDurationInv = 1.0f / ((float)v.mParticleDuration - 1.0f);
		ImportTimeCounters(v);
	}
	static void Write(LegacyByte* p, const TodParticle& v)
	{
		CopyToLegacy(p, 4, &v.mParticleDuration, SIZE - 4);
		const auto& layout = LevelSaveFormat::GetRecordLayout(LevelSaveFormat::RecordKind::Particle);
		for (size_t i = 0; i < layout.mSegmentCount; ++i)
		{
			const auto& segment = layout.mSegments[i];
			ExportTimeCounters(p, v, segment.mDat64Offset, segment.mLegacyOffset, segment.mSize);
		}
	}
};

template <>
struct Legacy1073Layout<Reanimation>
{
	static constexpr size_t SIZE = 156;
	static void Read(Reanimation& v, const LegacyByte* p)
	{
		ClearNativeObject(v);
		CopyFromLegacy(&v.mReanimationType, p, 0, 12);
		CopyFromLegacy(&v.mLoopType, p, 16, 72);
		CopyFromLegacy(&v.mLoopCount, p, 92, 4);
		CopyFromLegacy(&v.mIsAttachment, p, 100, 56);
		ImportTimeCounters(v);
	}
	static void Write(LegacyByte* p, const Reanimation& v)
	{
		CopyToLegacy(p, 0, &v.mReanimationType, 12);
		CopyToLegacy(p, 16, &v.mLoopType, 72);
		CopyToLegacy(p, 92, &v.mLoopCount, 4);
		CopyToLegacy(p, 100, &v.mIsAttachment, 56);
		const auto& layout = LevelSaveFormat::GetRecordLayout(LevelSaveFormat::RecordKind::Reanimation);
		for (size_t i = 0; i < layout.mSegmentCount; ++i)
		{
			const auto& segment = layout.mSegments[i];
			ExportTimeCounters(p, v, segment.mDat64Offset, segment.mLegacyOffset, segment.mSize);
		}
	}
};

template <>
struct Legacy1073Layout<Attachment>
{
	static constexpr size_t SIZE = 776;
	static void Read(Attachment& v, const LegacyByte* p)
	{
		std::memcpy(&v, p, SIZE);
		ImportTimeCounters(v);
	}
	static void Write(LegacyByte* p, const Attachment& v)
	{
		std::memcpy(p, &v, SIZE);
		const auto& layout = LevelSaveFormat::GetRecordLayout(LevelSaveFormat::RecordKind::Attachment);
		for (size_t i = 0; i < layout.mSegmentCount; ++i)
		{
			const auto& segment = layout.mSegments[i];
			ExportTimeCounters(p, v, segment.mDat64Offset, segment.mLegacyOffset, segment.mSize);
		}
	}
};

template <>
struct Legacy1073Layout<CursorObject>
{
	static constexpr size_t SIZE = 76;
	static void Read(CursorObject& v, const LegacyByte* p)
	{
		ReadGameObjectLayout(v, p, SIZE, &v.mSeedBankIndex);
		ImportTimeCounters(v);
	}
	static void Write(LegacyByte* p, const CursorObject& v)
	{
		WriteGameObjectLayout(p, SIZE, v, &v.mSeedBankIndex);
		const auto& layout = LevelSaveFormat::GetRecordLayout(LevelSaveFormat::RecordKind::CursorObject);
		for (size_t i = 0; i < layout.mSegmentCount; ++i)
		{
			const auto& segment = layout.mSegments[i];
			ExportTimeCounters(p, v, segment.mDat64Offset, segment.mLegacyOffset, segment.mSize);
		}
	}
};

template <>
struct Legacy1073Layout<CursorPreview>
{
	static constexpr size_t SIZE = 44;
	static void Read(CursorPreview& v, const LegacyByte* p)
	{
		ReadGameObjectLayout(v, p, SIZE, &v.mGridX);
		ImportTimeCounters(v);
	}
	static void Write(LegacyByte* p, const CursorPreview& v)
	{
		WriteGameObjectLayout(p, SIZE, v, &v.mGridX);
		const auto& layout = LevelSaveFormat::GetRecordLayout(LevelSaveFormat::RecordKind::CursorPreview);
		for (size_t i = 0; i < layout.mSegmentCount; ++i)
		{
			const auto& segment = layout.mSegments[i];
			ExportTimeCounters(p, v, segment.mDat64Offset, segment.mLegacyOffset, segment.mSize);
		}
	}
};

template <>
struct Legacy1073Layout<MessageWidget>
{
	static constexpr size_t SIZE = 796;
	static void Read(MessageWidget& v, const LegacyByte* p)
	{
		ClearNativeObject(v);
		CopyFromLegacy(&v.mLabel, p, 4, SIZE - 4);
		ImportTimeCounters(v);
	}
	static void Write(LegacyByte* p, const MessageWidget& v)
	{
		CopyToLegacy(p, 4, &v.mLabel, SIZE - 4);
		const auto& layout = LevelSaveFormat::GetRecordLayout(LevelSaveFormat::RecordKind::MessageWidget);
		for (size_t i = 0; i < layout.mSegmentCount; ++i)
		{
			const auto& segment = layout.mSegments[i];
			ExportTimeCounters(p, v, segment.mDat64Offset, segment.mLegacyOffset, segment.mSize);
		}
	}
};

template <>
struct Legacy1073Layout<SeedPacket>
{
	static constexpr size_t SIZE = 80;
	static void Read(SeedPacket& v, const LegacyByte* p)
	{
		ReadGameObjectLayout(v, p, SIZE, &v.mRefreshCounter);
		ImportTimeCounters(v);
	}
	static void Write(LegacyByte* p, const SeedPacket& v)
	{
		WriteGameObjectLayout(p, SIZE, v, &v.mRefreshCounter);
		const auto& layout = LevelSaveFormat::GetRecordLayout(LevelSaveFormat::RecordKind::SeedPacket);
		for (size_t i = 0; i < layout.mSegmentCount; ++i)
		{
			const auto& segment = layout.mSegments[i];
			ExportTimeCounters(p, v, segment.mDat64Offset, segment.mLegacyOffset, segment.mSize);
		}
	}
};

template <>
struct Legacy1073Layout<SeedBank>
{
	static constexpr size_t SIZE = 848;
	static void Read(SeedBank& v, const LegacyByte* p)
	{
		ClearNativeObject(v);
		CopyFromLegacy(&v.mX, p, 8, 28);
		CopyFromLegacy(&v.mNumPackets, p, 36, 4);
		for (int i = 0; i < SEEDBANK_MAX; ++i)
		{
			Legacy1073Layout<SeedPacket>::Read(
				v.mSeedPackets[i],
				p + 40 + i * Legacy1073Layout<SeedPacket>::SIZE);
		}
		CopyFromLegacy(&v.mCutSceneDarken, p, 840, 8);
		ImportTimeCounters(v);
	}
	static void Write(LegacyByte* p, const SeedBank& v)
	{
		CopyToLegacy(p, 8, &v.mX, 28);
		CopyToLegacy(p, 36, &v.mNumPackets, 4);
		for (int i = 0; i < SEEDBANK_MAX; ++i)
		{
			Legacy1073Layout<SeedPacket>::Write(
				p + 40 + i * Legacy1073Layout<SeedPacket>::SIZE,
				v.mSeedPackets[i]);
		}
		CopyToLegacy(p, 840, &v.mCutSceneDarken, 8);
		ExportTimeCounters(p, v, offsetof(SeedBank, mCutSceneDarken), 840, 8);
	}
};

template <>
struct Legacy1073Layout<Challenge>
{
	static constexpr size_t SIZE = 188;
	static void Read(Challenge& v, const LegacyByte* p)
	{
		ClearNativeObject(v);
		CopyFromLegacy(&v.mBeghouledMouseCapture, p, 8, SIZE - 8);
		ImportTimeCounters(v);
	}
	static void Write(LegacyByte* p, const Challenge& v)
	{
		CopyToLegacy(p, 8, &v.mBeghouledMouseCapture, SIZE - 8);
		const auto& layout = LevelSaveFormat::GetRecordLayout(LevelSaveFormat::RecordKind::Challenge);
		for (size_t i = 0; i < layout.mSegmentCount; ++i)
		{
			const auto& segment = layout.mSegments[i];
			ExportTimeCounters(p, v, segment.mDat64Offset, segment.mLegacyOffset, segment.mSize);
		}
	}
};

template <>
struct Legacy1073Layout<Music>
{
	static constexpr size_t SIZE = 76;
	static void Read(Music& v, const LegacyByte* p)
	{
		// Audio availability belongs to this process, not the saved board.
		// Keep the wire field for 1073/dat64 conversion compatibility.
		const bool aRuntimeMusicDisabled = v.IsMusicDisabled();
		ClearNativeObject(v);
		CopyFromLegacy(&v.mCurMusicTune, p, 8, SIZE - 8);
		v.SetMusicDisabled(aRuntimeMusicDisabled);
		ImportTimeCounters(v);
	}
	static void Write(LegacyByte* p, const Music& v)
	{
		CopyToLegacy(p, 8, &v.mCurMusicTune, SIZE - 8);
		const auto& layout = LevelSaveFormat::GetRecordLayout(LevelSaveFormat::RecordKind::Music);
		for (size_t i = 0; i < layout.mSegmentCount; ++i)
		{
			const auto& segment = layout.mSegments[i];
			ExportTimeCounters(p, v, segment.mDat64Offset, segment.mLegacyOffset, segment.mSize);
		}
	}
};

template <>
struct Legacy1073Layout<ReanimatorTrackInstance>
{
	static constexpr size_t SIZE = 96;
	static void Read(ReanimatorTrackInstance& v, const LegacyByte* p)
	{
		ClearNativeObject(v);
		CopyFromLegacy(&v.mBlendCounter, p, 0, 40);
		CopyFromLegacy(&v.mShakeOverride, p, 52, 16);
		CopyFromLegacy(&v.mRenderGroup, p, 72, 24);
		ImportTimeCounters(v);
	}
	static void Write(LegacyByte* p, const ReanimatorTrackInstance& v)
	{
		CopyToLegacy(p, 0, &v.mBlendCounter, 40);
		CopyToLegacy(p, 52, &v.mShakeOverride, 16);
		CopyToLegacy(p, 72, &v.mRenderGroup, 24);
		const auto& layout = LevelSaveFormat::GetRecordLayout(LevelSaveFormat::RecordKind::ReanimatorTrackInstance);
		for (size_t i = 0; i < layout.mSegmentCount; ++i)
		{
			const auto& segment = layout.mSegments[i];
			ExportTimeCounters(p, v, segment.mDat64Offset, segment.mLegacyOffset, segment.mSize);
		}
	}
};

template <typename T>
struct Dat64Layout;

template <typename T, LevelSaveFormat::RecordKind Kind>
struct MappedDat64Layout
{
	static constexpr auto& RECORD = LevelSaveFormat::GetRecordLayout(Kind);
	static constexpr size_t SIZE = RECORD.mDat64Size;
	// 文件槽步长（与原生 sizeof(DataArrayItem) 解耦：Reanimation 原生尾部有
	// 24B 不持久化的动作块缓存，文件槽仍为 184）
	static constexpr size_t SLOT_SIZE = RECORD.mDat64ArraySlotSize;

	static void Read(T& v, const LegacyByte* p)
	{
		ClearNativeObject(v);
		for (size_t i = 0; i < RECORD.mSegmentCount; ++i)
		{
			const auto& aSegment = RECORD.mSegments[i];
			std::memcpy(
				ObjectBytes(v) + aSegment.mDat64Offset,
				p + aSegment.mDat64Offset,
				aSegment.mSize);
		}
		ImportTimeCounters(v);
	}

	static void Write(LegacyByte* p, const T& v)
	{
		for (size_t i = 0; i < RECORD.mSegmentCount; ++i)
		{
			const auto& aSegment = RECORD.mSegments[i];
			std::memcpy(
				p + aSegment.mDat64Offset,
				ObjectBytes(v) + aSegment.mDat64Offset,
				aSegment.mSize);
			ExportTimeCounters(p, v, aSegment.mDat64Offset,
				aSegment.mDat64Offset, aSegment.mSize);
		}
	}
};

#define DECLARE_DAT64_LAYOUT(Type, KindName) \
	template <> \
	struct Dat64Layout<Type> \
		: MappedDat64Layout<Type, LevelSaveFormat::RecordKind::KindName> \
	{};

DECLARE_DAT64_LAYOUT(Zombie, Zombie);
DECLARE_DAT64_LAYOUT(Plant, Plant);
DECLARE_DAT64_LAYOUT(Projectile, Projectile);
DECLARE_DAT64_LAYOUT(Coin, Coin);
DECLARE_DAT64_LAYOUT(LawnMower, LawnMower);
DECLARE_DAT64_LAYOUT(GridItem, GridItem);
DECLARE_DAT64_LAYOUT(TodParticleSystem, ParticleSystem);
DECLARE_DAT64_LAYOUT(TodParticleEmitter, ParticleEmitter);
DECLARE_DAT64_LAYOUT(TodParticle, Particle);
DECLARE_DAT64_LAYOUT(Reanimation, Reanimation);
DECLARE_DAT64_LAYOUT(Attachment, Attachment);
DECLARE_DAT64_LAYOUT(CursorObject, CursorObject);
DECLARE_DAT64_LAYOUT(CursorPreview, CursorPreview);
DECLARE_DAT64_LAYOUT(MessageWidget, MessageWidget);
DECLARE_DAT64_LAYOUT(SeedPacket, SeedPacket);
DECLARE_DAT64_LAYOUT(Challenge, Challenge);
DECLARE_DAT64_LAYOUT(ReanimatorTrackInstance, ReanimatorTrackInstance);

#undef DECLARE_DAT64_LAYOUT

template <>
struct Dat64Layout<Music> : MappedDat64Layout<Music, LevelSaveFormat::RecordKind::Music>
{
	static void Read(Music& v, const LegacyByte* p)
	{
		const bool aRuntimeMusicDisabled = v.IsMusicDisabled();
		MappedDat64Layout<Music, LevelSaveFormat::RecordKind::Music>::Read(v, p);
		v.SetMusicDisabled(aRuntimeMusicDisabled);
	}
};

template <>
struct Dat64Layout<SeedBank>
{
	static constexpr size_t SIZE = LevelSaveFormat::DAT64_SEED_BANK_SIZE;

	static void Read(SeedBank& v, const LegacyByte* p)
	{
		ClearNativeObject(v);
		std::memcpy(ObjectBytes(v) + 16, p + 16, 28);
		std::memcpy(ObjectBytes(v) + 48, p + 48, 4);
		for (size_t i = 0; i < LevelSaveFormat::SEED_BANK_PACKET_COUNT; ++i)
		{
			Dat64Layout<SeedPacket>::Read(
				v.mSeedPackets[i],
				p + LevelSaveFormat::DAT64_SEED_BANK_PACKET_OFFSET +
					i * Dat64Layout<SeedPacket>::SIZE);
		}
		std::memcpy(
			&v.mCutSceneDarken,
			p + LevelSaveFormat::DAT64_SEED_BANK_TAIL_OFFSET,
			LevelSaveFormat::SEED_BANK_TAIL_SIZE);
		ImportTimeCounters(v);
	}

	static void Write(LegacyByte* p, const SeedBank& v)
	{
		std::memcpy(p + 16, ObjectBytes(v) + 16, 28);
		std::memcpy(p + 48, ObjectBytes(v) + 48, 4);
		for (size_t i = 0; i < LevelSaveFormat::SEED_BANK_PACKET_COUNT; ++i)
		{
			Dat64Layout<SeedPacket>::Write(
				p + LevelSaveFormat::DAT64_SEED_BANK_PACKET_OFFSET +
					i * Dat64Layout<SeedPacket>::SIZE,
				v.mSeedPackets[i]);
		}
		std::memcpy(
			p + LevelSaveFormat::DAT64_SEED_BANK_TAIL_OFFSET,
			&v.mCutSceneDarken,
			LevelSaveFormat::SEED_BANK_TAIL_SIZE);
		ExportTimeCounters(p, v, offsetof(SeedBank, mCutSceneDarken),
			LevelSaveFormat::DAT64_SEED_BANK_TAIL_OFFSET, LevelSaveFormat::SEED_BANK_TAIL_SIZE);
	}
};

static_assert(sizeof(GameObject) == 48);
static_assert(offsetof(GameObject, mSaveLayoutPadding) == 44);
static_assert(sizeof(Zombie) == 368);
static_assert(sizeof(Plant) == 344);
static_assert(sizeof(Projectile) == 160);
static_assert(sizeof(Coin) == 216);
static_assert(sizeof(LawnMower) == 80);
static_assert(sizeof(GridItem) == 240);
static_assert(sizeof(TodParticleSystem) == 72);
static_assert(sizeof(TodParticleEmitter) == 208);
// 168 = 原始 160 + 4B 段外倒数 mParticleDurationInv（不入盘，Read 补算）+ 4B 8 对齐垫；
// dat64 裸段仍自 &mParticleDuration 起 152B，与 156B 盘上记录逐字节不变
static_assert(sizeof(TodParticle) == 168);
// Reanimation and track-instance save layouts are unchanged.
static_assert(sizeof(Reanimation) == 216);
static_assert(sizeof(Attachment) == 776);
static_assert(sizeof(CursorObject) == 88);
static_assert(sizeof(CursorPreview) == 56);
static_assert(sizeof(MessageWidget) == 800);
static_assert(sizeof(SeedPacket) == 96);
static_assert(sizeof(SeedBank) == 1024);
static_assert(sizeof(Challenge) == 200);
static_assert(sizeof(Music) == 88);
static_assert(sizeof(ReanimatorTrackInstance) == 112);
static_assert(sizeof(typename DataArray<Zombie>::DataArrayItem) == 376);
static_assert(sizeof(typename DataArray<Plant>::DataArrayItem) == 352);
static_assert(sizeof(typename DataArray<Projectile>::DataArrayItem) == 168);
static_assert(sizeof(typename DataArray<Coin>::DataArrayItem) == 224);
static_assert(sizeof(typename DataArray<LawnMower>::DataArrayItem) == 88);
static_assert(sizeof(typename DataArray<GridItem>::DataArrayItem) == 248);
static_assert(sizeof(typename DataArray<TodParticleSystem>::DataArrayItem) == 80);
static_assert(sizeof(typename DataArray<TodParticleEmitter>::DataArrayItem) == 216);
static_assert(sizeof(typename DataArray<TodParticle>::DataArrayItem) == 176);
static_assert(sizeof(typename DataArray<Reanimation>::DataArrayItem) == 224);  // Reanimation 不内嵌 Transform，不变
static_assert(sizeof(typename DataArray<Attachment>::DataArrayItem) == 780);

template <typename T>
inline constexpr size_t LEGACY_1073_DATA_ARRAY_ITEM_SIZE =
	Legacy1073Layout<T>::SIZE + sizeof(uint32_t);

// Coin contains PottedPlant's 64-bit timestamps. MSVC x86 gives Coin 8-byte
// alignment, so DataArray<Coin>::DataArrayItem has four tail-padding bytes
// after its 32-bit ID. The official game3_13.dat confirms 216-byte slots.
template <>
inline constexpr size_t LEGACY_1073_DATA_ARRAY_ITEM_SIZE<Coin> = 216;
}

//0x4813D0
void SaveGameContext::SyncBytes(void* theDest, int theReadSize)
{
	int aReadSize = theReadSize;
	if (mReading)
	{
		if ((unsigned long)ByteLeftToRead() < 4)
		{
			mFailed = true;
		}

		aReadSize = mFailed ? 0 : mBuffer.ReadLong();
	}
	else
	{
		mBuffer.WriteLong(theReadSize);
	}

	if (mReading)
	{
		if (aReadSize != theReadSize || ByteLeftToRead() < theReadSize)
		{
			mFailed = true;
		}

		if (mFailed)
		{
			memset(theDest, 0, theReadSize);
		}
		else
		{
			mBuffer.ReadBytes((uchar*)theDest, theReadSize);
		}
	}
	else
	{
		mBuffer.WriteBytes((uchar*)theDest, theReadSize);
	}
}

//0x481470
void SaveGameContext::SyncInt(int& theInt)
{
	if (mReading)
	{
		if ((unsigned long)ByteLeftToRead() < 4)
		{
			mFailed = true;
		}

		theInt = mFailed ? 0 : mBuffer.ReadLong();
	}
	else
	{
		mBuffer.WriteLong(theInt);
	}
}

namespace
{
template <typename T>
void SyncLegacy1073Object(SaveGameContext& theContext, T& theObject)
{
	std::vector<LegacyByte> aLegacyBytes(Legacy1073Layout<T>::SIZE, 0);
	if (!theContext.mReading)
	{
		Legacy1073Layout<T>::Write(aLegacyBytes.data(), theObject);
	}

	theContext.SyncBytes(
		aLegacyBytes.data(),
		static_cast<int>(aLegacyBytes.size()));
	if (theContext.mReading && !theContext.mFailed)
	{
		Legacy1073Layout<T>::Read(theObject, aLegacyBytes.data());
	}
}

template <typename T>
void SyncDat64Object(SaveGameContext& theContext, T& theObject)
{
	static_assert(Dat64Layout<T>::SIZE == sizeof(T));
	std::vector<LegacyByte> aDat64Bytes(Dat64Layout<T>::SIZE, 0);
	if (!theContext.mReading)
	{
		Dat64Layout<T>::Write(aDat64Bytes.data(), theObject);
	}

	theContext.SyncBytes(
		aDat64Bytes.data(),
		static_cast<int>(aDat64Bytes.size()));
	if (theContext.mReading && !theContext.mFailed)
	{
		Dat64Layout<T>::Read(theObject, aDat64Bytes.data());
	}
}

// Validate the ID/free-list graph before publishing any loaded pool state.
// A free ID is the next slot index, ending at used-count; active IDs embed
// their slot index in the low 16 bits. No object or pointer is read here.
bool ValidateDataArraySlots(const LegacyByte* theBlock, size_t theStride,
    size_t theIDOffset, unsigned int theUsed, unsigned int theSize,
    unsigned int theFreeHead)
{
    const auto ReadID = [&](unsigned int theIndex)
    {
        unsigned int anID = 0;
        std::memcpy(&anID, theBlock + theIndex * theStride + theIDOffset, sizeof(anID));
        return anID;
    };
    unsigned int anActiveCount = 0;
    for (unsigned int i = 0; i < theUsed; ++i)
    {
        const unsigned int anID = ReadID(i);
        if (anID & DATA_ARRAY_KEY_MASK)
        {
            if ((anID & DATA_ARRAY_INDEX_MASK) != i)
                return false;
            ++anActiveCount;
        }
        else if (anID > theUsed)
            return false;
    }
    if (anActiveCount != theSize)
        return false;

    unsigned int aNext = theFreeHead;
    for (unsigned int i = 0; i < theUsed - theSize; ++i)
    {
        if (aNext >= theUsed)
            return false;
        aNext = ReadID(aNext);
        if (aNext & DATA_ARRAY_KEY_MASK)
            return false;
    }
    // An early end, cycle or unreachable free slot cannot satisfy both the
    // exact number of free links above and this terminal sentinel.
    return aNext == theUsed;
}

template <typename T>
void SyncLegacy1073DataArray(
	SaveGameContext& theContext,
	DataArray<T>& theDataArray)
{
	if (theContext.mFailed)
		return;
	unsigned int aFreeListHead = theDataArray.mFreeListHead;
	unsigned int aMaxUsedCount = theDataArray.mMaxUsedCount;
	unsigned int aSize = theDataArray.mSize;
	theContext.SyncUint(aFreeListHead);
	theContext.SyncUint(aMaxUsedCount);
	theContext.SyncUint(aSize);

	constexpr size_t aLegacyItemSize = LEGACY_1073_DATA_ARRAY_ITEM_SIZE<T>;
	if (theContext.mFailed || aMaxUsedCount > theDataArray.mMaxSize ||
		aSize > aMaxUsedCount || aFreeListHead > aMaxUsedCount ||
		aMaxUsedCount > static_cast<size_t>(INT_MAX) / aLegacyItemSize)
	{
		theContext.mFailed = true;
		return;
	}

	const size_t aLegacyBlockSize =
		static_cast<size_t>(aMaxUsedCount) * aLegacyItemSize;
	std::vector<LegacyByte> aLegacyBlock(aLegacyBlockSize, 0);
	LegacyByte anEmptyBlockByte = 0;
	if (!theContext.mReading)
	{
		for (unsigned int i = 0; i < theDataArray.mMaxUsedCount; ++i)
		{
			auto& aNativeItem = theDataArray.mBlock[i];
			LegacyByte* aLegacyItem = aLegacyBlock.data() + i * aLegacyItemSize;
			if (aNativeItem.mGeneration != 0)
			{
				Legacy1073Layout<T>::Write(aLegacyItem, aNativeItem.mItem);
			}
			const unsigned int anID = aNativeItem.PackedID();
			std::memcpy(
				aLegacyItem + Legacy1073Layout<T>::SIZE,
				&anID,
				sizeof(anID));
		}
	}

	theContext.SyncBytes(
		aLegacyBlock.empty() ? &anEmptyBlockByte : aLegacyBlock.data(),
		static_cast<int>(aLegacyBlock.size()));
	if (!theContext.mReading || theContext.mFailed)
	{
		return;
	}

	if (!ValidateDataArraySlots(aLegacyBlock.data(), aLegacyItemSize,
		Legacy1073Layout<T>::SIZE, aMaxUsedCount, aSize, aFreeListHead))
	{
		theContext.mFailed = true;
		return;
	}
	// Only a fully read, structurally valid block may replace live objects.
	theDataArray.DataArrayFreeAll();
	theDataArray.mFreeListHead = aFreeListHead;
	theDataArray.mMaxUsedCount = aMaxUsedCount;
	theDataArray.mSize = aSize;
	try
	{
		for (unsigned int i = 0; i < aMaxUsedCount; ++i)
		{
			const LegacyByte* aLegacyItem =
				aLegacyBlock.data() + i * aLegacyItemSize;
			unsigned int anID = 0U;
			std::memcpy(
				&anID,
				aLegacyItem + Legacy1073Layout<T>::SIZE,
				sizeof(anID));
			T* aNativeItem = theDataArray.DataArrayPrepareItemForLoad(i, anID);
			if (aNativeItem != nullptr)
				Legacy1073Layout<T>::Read(*aNativeItem, aLegacyItem);
		}
	}
	catch (...)
	{
		theDataArray.DataArrayRepairAfterFailedLoad();
		throw;
	}
}

template <typename T>
void SyncDat64DataArray(
	SaveGameContext& theContext,
	DataArray<T>& theDataArray)
{
	static_assert(Dat64Layout<T>::SIZE <= sizeof(T));  // Reanimation：文件 176B < 原生 200B（尾部缓存不落盘）
	using DataArrayItem = typename DataArray<T>::DataArrayItem;
	if (theContext.mFailed)
		return;
	unsigned int aFreeListHead = theDataArray.mFreeListHead;
	unsigned int aMaxUsedCount = theDataArray.mMaxUsedCount;
	unsigned int aSize = theDataArray.mSize;
	theContext.SyncUint(aFreeListHead);
	theContext.SyncUint(aMaxUsedCount);
	theContext.SyncUint(aSize);

	constexpr size_t aDat64ItemSize = Dat64Layout<T>::SLOT_SIZE;  // 文件步长（非原生步长）
	if (theContext.mFailed || aMaxUsedCount > theDataArray.mMaxSize ||
		aSize > aMaxUsedCount || aFreeListHead > aMaxUsedCount ||
		aMaxUsedCount > static_cast<size_t>(INT_MAX) / aDat64ItemSize)
	{
		theContext.mFailed = true;
		return;
	}

	const size_t aDat64BlockSize =
		static_cast<size_t>(aMaxUsedCount) * aDat64ItemSize;
	std::vector<LegacyByte> aDat64Block(aDat64BlockSize, 0);
	LegacyByte anEmptyBlockByte = 0;
	if (!theContext.mReading)
	{
		for (unsigned int i = 0; i < theDataArray.mMaxUsedCount; ++i)
		{
			auto& aNativeItem = theDataArray.mBlock[i];
			LegacyByte* aDat64Item = aDat64Block.data() + i * aDat64ItemSize;
			if (aNativeItem.mGeneration != 0)
			{
				Dat64Layout<T>::Write(aDat64Item, aNativeItem.mItem);
			}
			const unsigned int anID = aNativeItem.PackedID();
			std::memcpy(
				aDat64Item + Dat64Layout<T>::SIZE,
				&anID,
				sizeof(anID));
		}
	}

	theContext.SyncBytes(
		aDat64Block.empty() ? &anEmptyBlockByte : aDat64Block.data(),
		static_cast<int>(aDat64Block.size()));
	if (!theContext.mReading || theContext.mFailed)
	{
		return;
	}

	if (!ValidateDataArraySlots(aDat64Block.data(), aDat64ItemSize,
		Dat64Layout<T>::SIZE, aMaxUsedCount, aSize, aFreeListHead))
	{
		theContext.mFailed = true;
		return;
	}
	theDataArray.DataArrayFreeAll();
	theDataArray.mFreeListHead = aFreeListHead;
	theDataArray.mMaxUsedCount = aMaxUsedCount;
	theDataArray.mSize = aSize;
	try
	{
		for (unsigned int i = 0; i < aMaxUsedCount; ++i)
		{
			const LegacyByte* aDat64Item =
				aDat64Block.data() + i * aDat64ItemSize;
			unsigned int anID = 0U;
			std::memcpy(
				&anID,
				aDat64Item + Dat64Layout<T>::SIZE,
				sizeof(anID));
			T* aNativeItem = theDataArray.DataArrayPrepareItemForLoad(i, anID);
			if (aNativeItem != nullptr)
				Dat64Layout<T>::Read(*aNativeItem, aDat64Item);
		}
	}
	catch (...)
	{
		theDataArray.DataArrayRepairAfterFailedLoad();
		throw;
	}
}

void SyncLegacy1073BoardState(
	SaveGameContext& theContext,
	Board& theBoard)
{
	static constexpr size_t LEGACY_BOARD_STATE_SIZE = 22108;
	static constexpr size_t LEGACY_GAME_ID_OFFSET = 22076;
	static constexpr size_t LEGACY_AFTER_GAME_ID_OFFSET = 22080;
	static constexpr size_t LEGACY_AFTER_GAME_ID_SIZE = 28;

	std::vector<LegacyByte> aLegacyBytes(LEGACY_BOARD_STATE_SIZE, 0);
	LegacyByte* aNativeStart = reinterpret_cast<LegacyByte*>(&theBoard.mPaused);
	const size_t aNativeSize =
		reinterpret_cast<LegacyByte*>(&theBoard + 1) - aNativeStart;
	if (aNativeSize != 22120)
	{
		theContext.mFailed = true;
		return;
	}

	if (!theContext.mReading)
	{
		std::memcpy(
			aLegacyBytes.data(),
			aNativeStart,
			LEGACY_GAME_ID_OFFSET);
		ExportTimeCounters(aLegacyBytes.data(), theBoard, offsetof(Board, mPaused),
			0, LEGACY_GAME_ID_OFFSET);
		const int32_t aLegacyGameID = static_cast<int32_t>(theBoard.mGameID);
		std::memcpy(
			aLegacyBytes.data() + LEGACY_GAME_ID_OFFSET,
			&aLegacyGameID,
			sizeof(aLegacyGameID));
		std::memcpy(
			aLegacyBytes.data() + LEGACY_AFTER_GAME_ID_OFFSET,
			&theBoard.mGravesCleared,
			LEGACY_AFTER_GAME_ID_SIZE);
	}

	theContext.SyncBytes(
		aLegacyBytes.data(),
		static_cast<int>(aLegacyBytes.size()));
	if (!theContext.mReading || theContext.mFailed)
	{
		return;
	}

	std::memset(aNativeStart, 0, aNativeSize);
	std::memcpy(
		aNativeStart,
		aLegacyBytes.data(),
		LEGACY_GAME_ID_OFFSET);
	int32_t aLegacyGameID = 0;
	std::memcpy(
		&aLegacyGameID,
		aLegacyBytes.data() + LEGACY_GAME_ID_OFFSET,
		sizeof(aLegacyGameID));
	theBoard.mGameID = static_cast<intptr_t>(aLegacyGameID);
	std::memcpy(
		&theBoard.mGravesCleared,
		aLegacyBytes.data() + LEGACY_AFTER_GAME_ID_OFFSET,
		LEGACY_AFTER_GAME_ID_SIZE);
	ImportTimeCounters(theBoard);
}

void SyncDat64BoardState(
	SaveGameContext& theContext,
	Board& theBoard)
{
	LegacyByte* aNativeStart = reinterpret_cast<LegacyByte*>(&theBoard.mPaused);
	const size_t aNativeSize =
		reinterpret_cast<LegacyByte*>(&theBoard + 1) - aNativeStart;
	if (aNativeSize != LevelSaveFormat::DAT64_BOARD_STATE_SIZE)
	{
		theContext.mFailed = true;
		return;
	}

	std::vector<LegacyByte> aDat64Bytes(aNativeSize, 0);
	if (!theContext.mReading)
	{
		std::memcpy(aDat64Bytes.data(), aNativeStart, aNativeSize);
		ExportTimeCounters(aDat64Bytes.data(), theBoard, offsetof(Board, mPaused), 0, aNativeSize);
		// x64 aligns intptr_t mGameID to eight bytes.  The four bytes before it
		// are schema padding, not game state, and must be deterministic so the
		// standalone converter can reject pointer/padding contamination.
		std::memset(
			aDat64Bytes.data() + LevelSaveFormat::LEGACY_BOARD_GAME_ID_OFFSET,
			0,
			LevelSaveFormat::DAT64_BOARD_GAME_ID_OFFSET -
				LevelSaveFormat::LEGACY_BOARD_GAME_ID_OFFSET);
	}

	theContext.SyncBytes(
		aDat64Bytes.data(),
		static_cast<int>(aDat64Bytes.size()));
	if (theContext.mReading && !theContext.mFailed)
	{
		std::memset(aNativeStart, 0, aNativeSize);
		std::memcpy(aNativeStart, aDat64Bytes.data(), aNativeSize);
		ImportTimeCounters(theBoard);
	}
}

void SyncLegacy1073TrackInstances(
	SaveGameContext& theContext,
	ReanimatorTrackInstance* theTrackInstances,
	int theTrackCount)
{
	if (theTrackCount < 0 ||
		static_cast<size_t>(theTrackCount) >
			static_cast<size_t>(INT_MAX) / Legacy1073Layout<ReanimatorTrackInstance>::SIZE)
	{
		theContext.mFailed = true;
		return;
	}

	const size_t aLegacySize = static_cast<size_t>(theTrackCount) *
		Legacy1073Layout<ReanimatorTrackInstance>::SIZE;
	std::vector<LegacyByte> aLegacyBytes(aLegacySize, 0);
	if (!theContext.mReading)
	{
		for (int i = 0; i < theTrackCount; ++i)
		{
			Legacy1073Layout<ReanimatorTrackInstance>::Write(
				aLegacyBytes.data() +
					i * Legacy1073Layout<ReanimatorTrackInstance>::SIZE,
				theTrackInstances[i]);
		}
	}

	theContext.SyncBytes(
		aLegacyBytes.data(),
		static_cast<int>(aLegacyBytes.size()));
	if (!theContext.mReading || theContext.mFailed)
	{
		return;
	}

	for (int i = 0; i < theTrackCount; ++i)
	{
		Legacy1073Layout<ReanimatorTrackInstance>::Read(
			theTrackInstances[i],
			aLegacyBytes.data() +
				i * Legacy1073Layout<ReanimatorTrackInstance>::SIZE);
	}
}

void SyncDat64TrackInstances(
	SaveGameContext& theContext,
	ReanimatorTrackInstance* theTrackInstances,
	int theTrackCount)
{
	if (theTrackCount < 0 ||
		static_cast<size_t>(theTrackCount) >
			static_cast<size_t>(INT_MAX) / Dat64Layout<ReanimatorTrackInstance>::SIZE)
	{
		theContext.mFailed = true;
		return;
	}

	const size_t aDat64Size = static_cast<size_t>(theTrackCount) *
		Dat64Layout<ReanimatorTrackInstance>::SIZE;
	std::vector<LegacyByte> aDat64Bytes(aDat64Size, 0);
	if (!theContext.mReading)
	{
		for (int i = 0; i < theTrackCount; ++i)
		{
			Dat64Layout<ReanimatorTrackInstance>::Write(
				aDat64Bytes.data() +
					i * Dat64Layout<ReanimatorTrackInstance>::SIZE,
				theTrackInstances[i]);
		}
	}

	theContext.SyncBytes(
		aDat64Bytes.data(),
		static_cast<int>(aDat64Bytes.size()));
	if (!theContext.mReading || theContext.mFailed)
	{
		return;
	}

	for (int i = 0; i < theTrackCount; ++i)
	{
		Dat64Layout<ReanimatorTrackInstance>::Read(
			theTrackInstances[i],
			aDat64Bytes.data() +
				i * Dat64Layout<ReanimatorTrackInstance>::SIZE);
	}
}
}

//0x4814C0
void SaveGameContext::SyncReanimationDef(ReanimatorDefinition*& theDefinition)
{
	if (mReading)
	{
		int aReanimType;
		SyncInt(aReanimType);
		// SyncInt returns zero on failure. Do not publish definition zero
		// without tracks: a partially loaded Reanimation must remain destructible.
		if (mFailed)
			return;
		if (aReanimType == (int)ReanimationType::REANIM_NONE)
		{
			theDefinition = nullptr;
		}
		else if (aReanimType >= 0 && aReanimType < (int)ReanimationType::NUM_REANIMS)
		{
			ReanimatorEnsureDefinitionLoaded((ReanimationType)aReanimType, true);
			theDefinition = &gReanimatorDefArray[aReanimType];
		}
		else
		{
			mFailed = true;
		}
	}
	else
	{
		int aReanimType = (int)ReanimationType::REANIM_NONE;
		for (int i = 0; i < (int)ReanimationType::NUM_REANIMS; i++)
		{
			ReanimatorDefinition* aDef = &gReanimatorDefArray[i];
			if (theDefinition == aDef)
			{
				aReanimType = i;
				break;
			}
		}
		SyncInt(aReanimType);
	}
}

//0x481560
void SaveGameContext::SyncParticleDef(TodParticleDefinition*& theDefinition)
{
	if (mReading)
	{
		int aParticleType;
		SyncInt(aParticleType);
		if (mFailed)
			return;
		if (aParticleType == (int)ParticleEffect::PARTICLE_NONE)
		{
			theDefinition = nullptr;
		}
		else if (aParticleType >= 0 && aParticleType < (int)ParticleEffect::NUM_PARTICLES)
		{
			theDefinition = &gParticleDefArray[aParticleType];
		}
		else
		{
			mFailed = true;
		}
	}
	else
	{
		int aParticleType = (int)ParticleEffect::PARTICLE_NONE;
		for (int i = 0; i < (int)ParticleEffect::NUM_PARTICLES; i++)
		{
			TodParticleDefinition* aDef = &gParticleDefArray[i];
			if (theDefinition == aDef)
			{
				aParticleType = i;
				break;
			}
		}
		SyncInt(aParticleType);
	}
}


//0x481690
void SaveGameContext::SyncImage(Image*& theImage)
{
	if (mReading)
	{
		int aResource = 0;
		SyncInt(aResource);
		if (mFailed)
		{
			theImage = nullptr;
			return;
		}
		const auto aResID = static_cast<ResourceId>(aResource);
		if (aResID == Sexy::ResourceId::RESOURCE_ID_MAX)
		{
			theImage = nullptr;
		}
		else if (IsImageResourceId(aResID))
		{
			theImage = GetImageById(aResID);
		}
		else
		{
			mFailed = true;
			theImage = nullptr;
		}
	}
	else
	{
		ResourceId aResID;
		if (theImage != nullptr)
		{
			aResID = GetIdByImage(theImage);
		}
		else
		{
			aResID = Sexy::ResourceId::RESOURCE_ID_MAX;
		}
		SyncInt((int&)aResID);
	}
}

//0x481710
// 【存档层 TodList 三件套已删（2026-10-02）】SwapDataIDLists/SyncDataIDList/
// ValidateOwnedDataIDs 自 P3 名册化起零调用（名册块内联于 SyncParticleSystem/
// SyncParticleEmitter，磁盘格式 count+N×4B 逐字节不变）——随 TodList 模板
// 退役一并删除，防回退参考不再保留。

//0x4817C0
static void SyncParticleEmitter(TodParticleSystem* theParticleSystem, TodParticleEmitter* theParticleEmitter, SaveGameContext& theContext)
{
	if (theContext.mFailed)
		return;
	if (!theParticleSystem || !theParticleEmitter ||
		!theParticleSystem->mParticleDef || !theParticleSystem->mParticleHolder)
	{
		theContext.mFailed = true;
		return;
	}
	int aEmitterDefIndex = 0;
	if (theContext.mReading)
	{
		theContext.SyncInt(aEmitterDefIndex);
		if (theContext.mFailed || aEmitterDefIndex < 0 ||
			aEmitterDefIndex >= theParticleSystem->mParticleDef->mEmitterDefCount)
		{
			theContext.mFailed = true;
			return;
		}
	}
	else
	{
		aEmitterDefIndex = ((intptr_t)theParticleEmitter->mEmitterDef - (intptr_t)theParticleSystem->mParticleDef->mEmitterDefs) / sizeof(TodEmitterDefinition);
		theContext.SyncInt(aEmitterDefIndex);
	}

	Image* anImage = theParticleEmitter->mImageOverride;
	theContext.SyncImage(anImage);
	auto& aHolder = *theParticleSystem->mParticleHolder;
	// 粒子名册（2026-10-04 P3 第二步连续化）：磁盘格式不变——count(int)+
	// N×4B ID 序列逐字节同旧 SyncDataIDList（头→尾序=新→旧）；读写走侧表
	//（尾存=旧→新，边界处倒序折算）；装载先攒局部数组，全部成功后一次
	// 性清册+入册（失败时池自持已建粒子，原册不动——与旧临时链表语义同）
	constexpr int kMaxParticleRoster = 1024;
	ParticleID aRosterScratch[kMaxParticleRoster];
	int aRosterCount = 0;
	if (theContext.mReading)
	{
		int aCountOnDisk = 0;
		theContext.SyncInt(aCountOnDisk);
		if (theContext.mFailed || aCountOnDisk < 0 || aCountOnDisk > kMaxParticleRoster ||
			static_cast<unsigned long>(theContext.ByteLeftToRead()) <
				static_cast<unsigned long>(aCountOnDisk) * 8UL)
		{
			theContext.mFailed = true;
			return;
		}
		// 归属校验对齐原 ValidateOwnedDataIDs 语义：非空且不同才拒
		//（裸恢复粒子 mParticleEmitter 为空，由本循环回填）+同池去重
		static bool aSeenParticles[1024];
		std::memset(aSeenParticles, 0, sizeof(aSeenParticles));
		for (int i = 0; i < aCountOnDisk; ++i)
		{
			unsigned int aDataID = 0;
			theContext.SyncBytes(&aDataID, sizeof(aDataID));
			if (theContext.mFailed)
				return;
			TodParticle* aParticle = aHolder.mParticles.DataArrayTryToGet(aDataID);
			const unsigned int anIndex = aDataID & 0xFFFF;
			if (aParticle == nullptr || anIndex >= 1024 || aSeenParticles[anIndex] ||
				(aParticle->mParticleEmitter != nullptr && aParticle->mParticleEmitter != theParticleEmitter))
			{
				theContext.mFailed = true;
				return;
			}
			aSeenParticles[anIndex] = true;
			aParticle->mParticleEmitter = theParticleEmitter;  // 回指回填（=原循环同位）
			aRosterScratch[i] = static_cast<ParticleID>(aDataID);
		}
		aRosterCount = aCountOnDisk;
	}
	else
	{
		// 写路径：count 恰一次；头→尾序=新→旧=侧表倒序读
		const int aCount = theParticleEmitter->ParticleRosterCount();
		int aCountOnDisk = aCount;
		theContext.SyncInt(aCountOnDisk);
		for (int i = 0; i < aCount; ++i)
		{
			unsigned int aDataID = static_cast<unsigned int>(theParticleEmitter->ParticleRosterIDAt(aCount - 1 - i));
			theContext.SyncBytes(&aDataID, sizeof(aDataID));
			if (theContext.mFailed)
				return;
		}
	}
	if (theContext.mReading)
	{
		theParticleEmitter->mParticleSystem = theParticleSystem;
		theParticleEmitter->mEmitterDef = &theParticleSystem->mParticleDef->mEmitterDefs[aEmitterDefIndex];
		theParticleEmitter->mImageOverride = anImage;
		// 入册：盘上头→尾（新→旧）→侧表尾存（旧→新）= 倒序填
		theParticleEmitter->ParticleRosterClear();
		for (int i = aRosterCount - 1; i >= 0; --i)
		{
			TodParticle* aParticle = aHolder.mParticles.DataArrayTryToGet((unsigned int)aRosterScratch[i]);
			theParticleEmitter->ParticleRosterAdd(aParticle);
		}
	}
}

//0x481880
void SyncParticleSystem(Board* theBoard, TodParticleSystem* theParticleSystem, SaveGameContext& theContext)
{
	if (theContext.mFailed)
		return;
	TodParticleDefinition* aDefinition = theParticleSystem->mParticleDef;
	theContext.SyncParticleDef(aDefinition);
	if (theContext.mFailed || aDefinition == nullptr)
	{
		theContext.mFailed = true;
		return;
	}
	auto* aHolder = theContext.mReading ?
		theBoard->mApp->mEffectSystem->mParticleHolder.get() : theParticleSystem->mParticleHolder;
	// 发射器名册（2026-10-04 P3 连续化）：磁盘格式不变——count(int)+N×4B ID
	// 序列逐字节同旧 SyncDataIDList；读写走侧表（裸槽位），世代 ID 仅在
	// 磁盘边界重建（DataArrayGetID/TryToGet）。装载先攒局部数组，全部发射器
	// 同步成功后一次性清册+入册（失败时池自持已建发射器，原册不动——与旧
	// 临时链表 Swap 语义一致）
	constexpr int kMaxRosterEntries = 1024;
	ParticleEmitterID aRosterScratch[kMaxRosterEntries];
	int aRosterCount = 0;
	if (theContext.mReading)
	{
		int aCountOnDisk = 0;
		theContext.SyncInt(aCountOnDisk);
		if (theContext.mFailed || aCountOnDisk < 0 || aCountOnDisk > kMaxRosterEntries ||
			static_cast<unsigned long>(theContext.ByteLeftToRead()) <
				static_cast<unsigned long>(aCountOnDisk) * 8UL)
		{
			theContext.mFailed = true;
			return;
		}
		// 归属校验对齐原 ValidateOwnedDataIDs 语义（2026-10-04 双写事故后
		// 二次修正）：裸恢复的发射器 mParticleSystem 尚为空（该字段不进
		// 拷贝段，由下方 SyncParticleEmitter 读块回填）——**非空且不同**
		// 才拒，空指针放行；另加同池去重（原 aSeen 位图同款）
		static bool aSeenSlots[1024];
		std::memset(aSeenSlots, 0, sizeof(aSeenSlots));
		for (int i = 0; i < aCountOnDisk; ++i)
		{
			unsigned int aDataID = 0;
			theContext.SyncBytes(&aDataID, sizeof(aDataID));
			if (theContext.mFailed)
				return;
			TodParticleEmitter* aEmitter = aHolder->mEmitters.DataArrayTryToGet(aDataID);
			const unsigned int anIndex = aDataID & 0xFFFF;
			if (aEmitter == nullptr || anIndex >= 1024 || aSeenSlots[anIndex] ||
				(aEmitter->mParticleSystem != nullptr && aEmitter->mParticleSystem != theParticleSystem))
			{
				theContext.mFailed = true;
				return;
			}
			aSeenSlots[anIndex] = true;
			aRosterScratch[i] = static_cast<ParticleEmitterID>(aDataID);
		}
		aRosterCount = aCountOnDisk;
		theParticleSystem->mParticleDef = aDefinition;
		theParticleSystem->mParticleHolder = aHolder;
	}
	else
	{
		// 写路径：count 恰一次（2026-10-04 双写事故修正——曾在此前置一次
		// 无条件 SyncInt，磁盘多 4B 致回读把重复 count 当首 ID 校验失败）
		int aCountOnDisk = theParticleSystem->EmitterRosterCount();
		theContext.SyncInt(aCountOnDisk);
		for (int i = 0; i < aCountOnDisk; ++i)
		{
			unsigned int aDataID = static_cast<unsigned int>(theParticleSystem->EmitterRosterIDAt(i));
			theContext.SyncBytes(&aDataID, sizeof(aDataID));
			if (theContext.mFailed)
				return;
		}
		// 写路径发射器本体走活名册逐个同步（与旧链表遍历同构）
		for (int i = 0; i < aCountOnDisk; ++i)
			SyncParticleEmitter(theParticleSystem, theParticleSystem->EmitterRosterEmitterAt(i), theContext);
		return;
	}
	// 读路径：先按盘上 ID 序同步全部发射器本体，成功后入册
	for (int i = 0; i < aRosterCount; ++i)
	{
		TodParticleEmitter* aEmitter = aHolder->mEmitters.DataArrayTryToGet((unsigned int)aRosterScratch[i]);
		SyncParticleEmitter(theParticleSystem, aEmitter, theContext);
		if (theContext.mFailed)
			return;
	}
	theParticleSystem->EmitterRosterClear();
	for (int i = 0; i < aRosterCount; ++i)
	{
		TodParticleEmitter* aEmitter = aHolder->mEmitters.DataArrayTryToGet((unsigned int)aRosterScratch[i]);
		theParticleSystem->EmitterRosterAdd(aEmitter);
	}
}

//0x4818F0
void SyncReanimation(Board* theBoard, Reanimation* theReanimation, SaveGameContext& theContext)
{
	if (theContext.mFailed)
		return;
	// SyncBoard restores the pool record first; its runtime track pointer is
	// empty. Overwriting a live animation would discard its attachment owner.
	if (theContext.mReading && theReanimation->mTrackInstances != nullptr)
		throw std::logic_error("SyncReanimation: destination already owns tracks");

	ReanimatorDefinition* aDefinition = theReanimation->mDefinition;
	theContext.SyncReanimationDef(aDefinition);
	if (theContext.mFailed || aDefinition == nullptr)
	{
		theContext.mFailed = true;
		return;
	}

	const int aTrackCount = aDefinition->mTracks.count;
	if (aTrackCount < 0 || static_cast<size_t>(aTrackCount) >
		static_cast<size_t>(INT_MAX) / sizeof(ReanimatorTrackInstance))
	{
		theContext.mFailed = true;
		return;
	}
	const int aNativeSize = static_cast<int>(
		static_cast<size_t>(aTrackCount) * sizeof(ReanimatorTrackInstance));
	TodAllocator* anAllocator = nullptr;
	auto aReleaseTracks = [&](ReanimatorTrackInstance* theTracks)
	{
		// Pending IDs are not owned attachments yet. Free only the raw track
		// storage, without running ReanimationDie against partially read IDs.
		anAllocator->Free(theTracks, aNativeSize);
	};
	std::unique_ptr<ReanimatorTrackInstance, decltype(aReleaseTracks)>
		aPendingTracks(nullptr, aReleaseTracks);
	ReanimatorTrackInstance* aTracks = theReanimation->mTrackInstances;

	if (aTrackCount != 0)
	{
		if (theContext.mReading)
		{
			anAllocator = FindGlobalAllocator(aNativeSize);
			aPendingTracks.reset(static_cast<ReanimatorTrackInstance*>(
				anAllocator->Calloc(aNativeSize)));
			aTracks = aPendingTracks.get();
		}
		if (theContext.mEncoding == LevelSaveEncoding::Dat64V1)
			SyncDat64TrackInstances(theContext, aTracks, aTrackCount);
		else
			SyncLegacy1073TrackInstances(theContext, aTracks, aTrackCount);
		if (theContext.mFailed)
			return;

		for (int aTrackIndex = 0; aTrackIndex < aTrackCount; aTrackIndex++)
		{
			ReanimatorTrackInstance& aTrackInstance = aTracks[aTrackIndex];
			theContext.SyncImage(aTrackInstance.mImageOverride);
			if (theContext.mFailed)
				return;

			if (theContext.mReading)
			{
				aTrackInstance.mBlendTransform.mText = nullptr;
				TOD_ASSERT(aTrackInstance.mBlendTransform.mFont == nullptr);
				TOD_ASSERT(aTrackInstance.mBlendTransform.mImage == nullptr);
			}
			else
			{
				TOD_ASSERT(aTrackInstance.mBlendTransform.mText == nullptr);
				TOD_ASSERT(aTrackInstance.mBlendTransform.mFont == nullptr);
				TOD_ASSERT(aTrackInstance.mBlendTransform.mImage == nullptr);
			}
		}
	}
	if (theContext.mReading)
	{
		// Definition, holder and all tracks become visible together only after
		// the complete substream succeeded. Other saved animation fields stay put.
		theReanimation->mDefinition = aDefinition;
		theReanimation->mReanimationHolder = theBoard->mApp->mEffectSystem->mReanimationHolder.get();
		theReanimation->mTrackInstances = aPendingTracks.release();
		theReanimation->RebuildTrackActivityMasks();  // P4：派生掩码随轨道段重建（不入盘）
	}
}

//0x4819D0
void SyncBoard(SaveGameContext& theContext, Board* theBoard)
{
	if (theContext.mFailed)
		return;
	// Pointer-free records deliberately clear process-local owners. Rebind
	// them before ANY read exit, including a later bad field or exception,
	// so normal Board/Zombie cleanup never sees a half-restored null owner.
	struct RuntimeBindings
	{
		Board* board;
		~RuntimeBindings() { if (board) FixBoardAfterLoad(board); }
	} aRuntimeBindings{theContext.mReading ? theBoard : nullptr};

	// 附件池在流序中最后替换，而 ~Attachment 会把 EFFECT_REANIM 引用级联成
	// ReanimationDie。活板流出时旧 reanim 先死并经轨道 AttachmentDie 预先静默
	// 旧附件；失败加载留下的壳态属主（mDefinition 为空）死得安静，带引用的旧
	// 附件活到替换那一刻，级联命中刚恢复的新 reanim——mDead 置位后尾部子流
	// 不再恢复，回滚存档就此漂移。读取前先清空附件池：级联只落在即将整体
	// 替换的旧池上，与 1073 池替换无析构级联的语义一致。
	if (theContext.mReading)
	{
		theBoard->mApp->mEffectSystem->mAttachmentHolder->mAttachments.DataArrayFreeAll();
	}

	if (theContext.mEncoding == LevelSaveEncoding::Dat64V1)
	{
		SyncDat64BoardState(theContext, *theBoard);
		SyncDat64DataArray(theContext, theBoard->mZombies);
		SyncDat64DataArray(theContext, theBoard->mPlants);
		SyncDat64DataArray(theContext, theBoard->mProjectiles);
		SyncDat64DataArray(theContext, theBoard->mCoins);
		SyncDat64DataArray(theContext, theBoard->mLawnMowers);
		SyncDat64DataArray(theContext, theBoard->mGridItems);
		SyncDat64DataArray(theContext, theBoard->mApp->mEffectSystem->mParticleHolder->mParticleSystems);
		SyncDat64DataArray(theContext, theBoard->mApp->mEffectSystem->mParticleHolder->mEmitters);
		SyncDat64DataArray(theContext, theBoard->mApp->mEffectSystem->mParticleHolder->mParticles);
		SyncDat64DataArray(theContext, theBoard->mApp->mEffectSystem->mReanimationHolder->mReanimations);
		SyncDat64DataArray(theContext, theBoard->mApp->mEffectSystem->mAttachmentHolder->mAttachments);
	}
	else
	{
		SyncLegacy1073BoardState(theContext, *theBoard);
		SyncLegacy1073DataArray(theContext, theBoard->mZombies);									//0x482190
		SyncLegacy1073DataArray(theContext, theBoard->mPlants);										//0x482280
		SyncLegacy1073DataArray(theContext, theBoard->mProjectiles);								//0x482370
		SyncLegacy1073DataArray(theContext, theBoard->mCoins);										//0x482460
		SyncLegacy1073DataArray(theContext, theBoard->mLawnMowers);								//0x482550
		SyncLegacy1073DataArray(theContext, theBoard->mGridItems);									//0x482650
		SyncLegacy1073DataArray(theContext, theBoard->mApp->mEffectSystem->mParticleHolder->mParticleSystems);	//0x482740
		SyncLegacy1073DataArray(theContext, theBoard->mApp->mEffectSystem->mParticleHolder->mEmitters);			//0x482830
		SyncLegacy1073DataArray(theContext, theBoard->mApp->mEffectSystem->mParticleHolder->mParticles);			//0x482920
		SyncLegacy1073DataArray(theContext, theBoard->mApp->mEffectSystem->mReanimationHolder->mReanimations);	//0x482920
		SyncLegacy1073DataArray(theContext, theBoard->mApp->mEffectSystem->mAttachmentHolder->mAttachments);		//0x482A10
	}
	if (theContext.mFailed)
	{
		return;
	}

	{
		TodParticleSystem* aParticle = nullptr;
		while (theBoard->mApp->mEffectSystem->mParticleHolder->mParticleSystems.IterateNext(aParticle))
		{
			SyncParticleSystem(theBoard, aParticle, theContext);
			if (theContext.mFailed)
			{
				return;
			}
		}
	}
	{
		Reanimation* aReanimation = nullptr;
		while (theBoard->mApp->mEffectSystem->mReanimationHolder->mReanimations.IterateNext(aReanimation))
		{
			SyncReanimation(theBoard, aReanimation, theContext);
			if (theContext.mFailed)
			{
				return;
			}
		}
	}
	// 装载孤儿修剪已撤（2026-10-05 用户裁决：属回退路径，同"服务器有问题
	// 就定时重启"——根因已修于死亡回收，污染存档经一次性装载清创完毕）

	if (theContext.mEncoding == LevelSaveEncoding::Dat64V1)
	{
		SyncDat64Object(theContext, *theBoard->mCursorObject);
		SyncDat64Object(theContext, *theBoard->mCursorPreview);
		SyncDat64Object(theContext, *theBoard->mAdvice);
		SyncDat64Object(theContext, *theBoard->mSeedBank);
		SyncDat64Object(theContext, *theBoard->mChallenge);
		SyncDat64Object(theContext, *theBoard->mApp->mMusic);

		std::uint64_t anEndMarker = LevelSaveFormat::DAT64_END_MARKER;
		theContext.SyncBytes(&anEndMarker, sizeof(anEndMarker));
		if (theContext.mReading && anEndMarker != LevelSaveFormat::DAT64_END_MARKER)
		{
			theContext.mFailed = true;
		}
	}
	else
	{
		SyncLegacy1073Object(theContext, *theBoard->mCursorObject);
		SyncLegacy1073Object(theContext, *theBoard->mCursorPreview);
		SyncLegacy1073Object(theContext, *theBoard->mAdvice);
		SyncLegacy1073Object(theContext, *theBoard->mSeedBank);
		SyncLegacy1073Object(theContext, *theBoard->mChallenge);
		SyncLegacy1073Object(theContext, *theBoard->mApp->mMusic);

		if (theContext.mReading)
		{
			if ((unsigned long)theContext.ByteLeftToRead() < 4)
			{
				theContext.mFailed = true;
			}

			if (theContext.mFailed || (unsigned int)theContext.mBuffer.ReadLong() != SAVE_FILE_MAGIC_NUMBER)
			{
				theContext.mFailed = true;
			}
		}
		else
		{
			theContext.mBuffer.WriteLong(SAVE_FILE_MAGIC_NUMBER);
		}
	}
}

//0x481CE0
void FixBoardAfterLoad(Board* theBoard)
{
	{
		Plant* aPlant = nullptr;
		while (theBoard->mPlants.IterateNext(aPlant))
		{
			aPlant->mApp = theBoard->mApp;
			aPlant->mBoard = theBoard;
		}
	}
	{
		Zombie* aZombie = nullptr;
		while (theBoard->mZombies.IterateNext(aZombie))
		{
			aZombie->mApp = theBoard->mApp;
			aZombie->mBoard = theBoard;
		}
	}
	{
		Projectile* aProjectile = nullptr;
		while (theBoard->mProjectiles.IterateNext(aProjectile))
		{
			aProjectile->mApp = theBoard->mApp;
			aProjectile->mBoard = theBoard;
		}
	}
	{
		Coin* aCoin = nullptr;
		while (theBoard->mCoins.IterateNext(aCoin))
		{
			aCoin->mApp = theBoard->mApp;
			aCoin->mBoard = theBoard;
		}
	}
	{
		LawnMower* aLawnMower = nullptr;
		while (theBoard->mLawnMowers.IterateNext(aLawnMower))
		{
			aLawnMower->mApp = theBoard->mApp;
			aLawnMower->mBoard = theBoard;
		}
	}
	{
		GridItem* aGridItem = nullptr;
		while (theBoard->mGridItems.IterateNext(aGridItem))
		{
			aGridItem->mApp = theBoard->mApp;
			aGridItem->mBoard = theBoard;
		}
	}

	theBoard->mAdvice->mApp = theBoard->mApp;
	theBoard->mCursorObject->mApp = theBoard->mApp;
	theBoard->mCursorObject->mBoard = theBoard;
	theBoard->mCursorPreview->mApp = theBoard->mApp;
	theBoard->mCursorPreview->mBoard = theBoard;
	theBoard->mSeedBank->mApp = theBoard->mApp;
	theBoard->mSeedBank->mBoard = theBoard;
	for (int i = 0; i < SEEDBANK_MAX; i++)
	{
		theBoard->mSeedBank->mSeedPackets[i].mApp = theBoard->mApp;
		theBoard->mSeedBank->mSeedPackets[i].mBoard = theBoard;
	}
	theBoard->mChallenge->mApp = theBoard->mApp;
	theBoard->mChallenge->mBoard = theBoard;
	theBoard->mApp->mMusic->mApp = theBoard->mApp;
	theBoard->mApp->mMusic->mMusicInterface = theBoard->mApp->mMusicInterface;
}

namespace
{
template <typename T>
bool ValidateNextDat64Pool(const LegacyByte* thePayload, size_t thePayloadSize,
    size_t& theOffset, const DataArray<T>& thePool, DataArrayKind& theFailedPool)
{
    theFailedPool = thePool.mKind;
    if (theOffset > thePayloadSize || thePayloadSize - theOffset < 16)
        return false;
    const auto ReadWord = [&](size_t theRelativeOffset)
    {
        unsigned int aValue = 0;
        std::memcpy(&aValue, thePayload + theOffset + theRelativeOffset, sizeof(aValue));
        return aValue;
    };
    const unsigned int aFreeHead = ReadWord(0);
    const unsigned int aUsed = ReadWord(4);
    const unsigned int aSize = ReadWord(8);
    const unsigned int aBytes = ReadWord(12);
    constexpr size_t aStride = Dat64Layout<T>::SLOT_SIZE;  // 文件槽步长（与原生解耦）
    if (aUsed > thePool.mMaxSize || aSize > aUsed || aFreeHead > aUsed ||
        aUsed > static_cast<size_t>(INT_MAX) / aStride)
        return false;
    const size_t aExpectedBytes = aUsed * aStride;
    if (aBytes != aExpectedBytes || aExpectedBytes > thePayloadSize - theOffset - 16)
        return false;
    if (!ValidateDataArraySlots(thePayload + theOffset + 16, aStride,
        Dat64Layout<T>::SIZE, aUsed, aSize, aFreeHead))
        return false;
    theOffset += 16 + aExpectedBytes;
    return true;
}

// Read-only structural pass: a bad later pool must be discovered before any
// earlier pool (or the Board state) is replaced. This does not instantiate
// objects, consume RNG, copy payload blocks, or alter the on-disk schema.
bool ValidateDat64PoolHeaders(const LegacyByte* thePayload, size_t thePayloadSize,
    const Board& theBoard, DataArrayKind& theFailedPool)
{
    theFailedPool = DataArrayKind::Unknown;
    size_t anOffset = 4 + LevelSaveFormat::DAT64_BOARD_STATE_SIZE;
    if (thePayloadSize < anOffset)
        return false;
    unsigned int aBoardSize = 0;
    std::memcpy(&aBoardSize, thePayload, sizeof(aBoardSize));
    if (aBoardSize != LevelSaveFormat::DAT64_BOARD_STATE_SIZE)
        return false;
    const auto Check = [&](const auto& thePool)
    {
        return ValidateNextDat64Pool(thePayload, thePayloadSize, anOffset, thePool, theFailedPool);
    };
    const auto& effects = *theBoard.mApp->mEffectSystem;
    return Check(theBoard.mZombies) && Check(theBoard.mPlants) &&
        Check(theBoard.mProjectiles) && Check(theBoard.mCoins) &&
        Check(theBoard.mLawnMowers) && Check(theBoard.mGridItems) &&
        Check(effects.mParticleHolder->mParticleSystems) &&
        Check(effects.mParticleHolder->mEmitters) &&
        Check(effects.mParticleHolder->mParticles) &&
        Check(effects.mReanimationHolder->mReanimations) &&
        Check(effects.mAttachmentHolder->mAttachments);
}
}

//0x481FE0
// GOTY @Patoke: 0x48CBC0
// 当前活动状态 → 完整 dat64 文件形态缓冲。
static bool BuildDat64SaveBuffer(Board* theBoard, Buffer& theOutBuffer)
{
	SaveGameContext aContext;
	aContext.mFailed = false;
	aContext.mReading = false;
	aContext.mEncoding = LevelSaveEncoding::Dat64V1;
	SyncBoard(aContext, theBoard);
	if (aContext.mFailed)
	{
		return false;
	}

	const int aPayloadSize = aContext.mBuffer.GetDataLen();
	const std::uint32_t aPayloadCRC = crc32(
		0,
		const_cast<Bytef*>(reinterpret_cast<const Bytef*>(aContext.mBuffer.GetDataPtr())),
		static_cast<uInt>(aPayloadSize));

	const auto WriteU32 = [](Buffer& theBuffer, std::uint32_t theValue)
	{
		LegacyByte aBytes[4] = {
			static_cast<LegacyByte>(theValue),
			static_cast<LegacyByte>(theValue >> 8),
			static_cast<LegacyByte>(theValue >> 16),
			static_cast<LegacyByte>(theValue >> 24)
		};
		theBuffer.WriteBytes(aBytes, sizeof(aBytes));
	};
	const auto WriteU64 = [&WriteU32](Buffer& theBuffer, std::uint64_t theValue)
	{
		WriteU32(theBuffer, static_cast<std::uint32_t>(theValue));
		WriteU32(theBuffer, static_cast<std::uint32_t>(theValue >> 32));
	};

	theOutBuffer.WriteBytes(
		LevelSaveFormat::DAT64_MAGIC.data(),
		static_cast<int>(LevelSaveFormat::DAT64_MAGIC.size()));
	WriteU32(theOutBuffer, LevelSaveFormat::DAT64_VERSION);
	WriteU32(theOutBuffer, LevelSaveFormat::DAT64_HEADER_SIZE);
	WriteU32(theOutBuffer, LevelSaveFormat::DAT64_AUTHORITY_BUILD);
	WriteU32(theOutBuffer, LevelSaveFormat::DAT64_FLAGS);
	WriteU64(theOutBuffer, static_cast<std::uint64_t>(aPayloadSize));
	WriteU32(theOutBuffer, aPayloadCRC);
	WriteU32(theOutBuffer, LevelSaveFormat::DAT64_SCHEMA_ID);
	WriteU64(theOutBuffer, 0);
	TOD_ASSERT(theOutBuffer.GetDataLen() == LevelSaveFormat::DAT64_HEADER_SIZE);
	theOutBuffer.WriteBytes(aContext.mBuffer.GetDataPtr(), aPayloadSize);
	return true;
}

// 缓冲 → 板（原 LawnLoadGame 主体；文件读取与事务回滚在外层）
static bool LoadDat64FromBuffer(Board* theBoard, Buffer& aFileBuffer, const std::string& theFilePath)
{

	const auto ReadU32 = [](const LegacyByte* p) -> std::uint32_t
	{
		return static_cast<std::uint32_t>(p[0]) |
			(static_cast<std::uint32_t>(p[1]) << 8) |
			(static_cast<std::uint32_t>(p[2]) << 16) |
			(static_cast<std::uint32_t>(p[3]) << 24);
	};
	const auto ReadU64 = [&ReadU32](const LegacyByte* p) -> std::uint64_t
	{
		return static_cast<std::uint64_t>(ReadU32(p)) |
			(static_cast<std::uint64_t>(ReadU32(p + 4)) << 32);
	};

	const int aFileSize = aFileBuffer.GetDataLen();
	const LegacyByte* aFileData = aFileBuffer.GetDataPtr();
	if (aFileSize < static_cast<int>(LevelSaveFormat::DAT64_HEADER_SIZE) ||
		std::memcmp(
			aFileData,
			LevelSaveFormat::DAT64_MAGIC.data(),
			LevelSaveFormat::DAT64_MAGIC.size()) != 0)
	{
		TodTraceAndLog("DAT64_HEADER_REJECT file=%s reason=magic-or-size", theFilePath.c_str());
		return false;
	}

	const std::uint32_t aVersion = ReadU32(aFileData + 8);
	const std::uint32_t aHeaderSize = ReadU32(aFileData + 12);
	const std::uint32_t anAuthorityBuild = ReadU32(aFileData + 16);
	const std::uint32_t aFlags = ReadU32(aFileData + 20);
	const std::uint64_t aPayloadSize = ReadU64(aFileData + 24);
	const std::uint32_t aStoredCRC = ReadU32(aFileData + 32);
	const std::uint32_t aSchemaID = ReadU32(aFileData + 36);
	const std::uint64_t aReserved = ReadU64(aFileData + 40);
	if (aVersion != LevelSaveFormat::DAT64_VERSION ||
		aHeaderSize != LevelSaveFormat::DAT64_HEADER_SIZE ||
		anAuthorityBuild != LevelSaveFormat::DAT64_AUTHORITY_BUILD ||
		aFlags != LevelSaveFormat::DAT64_FLAGS ||
		aSchemaID != LevelSaveFormat::DAT64_SCHEMA_ID ||
		aReserved != 0 ||
		aPayloadSize != static_cast<std::uint64_t>(aFileSize - aHeaderSize) ||
		aPayloadSize > static_cast<std::uint64_t>(INT_MAX))
	{
		TodTraceAndLog(
			"DAT64_HEADER_REJECT file=%s version=%u header=%u authority=%u flags=%08X schema=%08X payload=%llu",
			theFilePath.c_str(),
			aVersion,
			aHeaderSize,
			anAuthorityBuild,
			aFlags,
			aSchemaID,
			static_cast<unsigned long long>(aPayloadSize));
		return false;
	}

	const LegacyByte* aPayload = aFileData + aHeaderSize;
	const std::uint32_t anActualCRC = crc32(
		0,
		const_cast<Bytef*>(reinterpret_cast<const Bytef*>(aPayload)),
		static_cast<uInt>(aPayloadSize));
	if (anActualCRC != aStoredCRC)
	{
		TodTraceAndLog(
			"DAT64_CRC_REJECT file=%s stored=%08X actual=%08X",
			theFilePath.c_str(),
			aStoredCRC,
			anActualCRC);
		return false;
	}

	DataArrayKind aFailedPool = DataArrayKind::Unknown;
	if (!ValidateDat64PoolHeaders(aPayload, static_cast<size_t>(aPayloadSize), *theBoard, aFailedPool))
	{
		TodTraceAndLog("DAT64_POOL_REJECT file=%s pool=%llu reason=structure", theFilePath.c_str(),
			static_cast<unsigned long long>(aFailedPool));
		return false;
	}

	SaveGameContext aContext;
	aContext.mFailed = false;
	aContext.mReading = true;
	aContext.mEncoding = LevelSaveEncoding::Dat64V1;
	aContext.mBuffer.SetData(
		const_cast<LegacyByte*>(aPayload),
		static_cast<int>(aPayloadSize));

	SyncBoard(aContext, theBoard);
	if (aContext.mFailed || aContext.ByteLeftToRead() != 0)
	{
		TodTraceAndLog(
			"DAT64_BOARD_REJECT file=%s failed=%d left=%lu",
			theFilePath.c_str(),
			aContext.mFailed ? 1 : 0,
			static_cast<unsigned long>(aContext.ByteLeftToRead()));
		return false;
	}
	TodTrace("Loaded save game");
	theBoard->RebuildPlantCellBucket();  // 格桶为派生索引不进存档，装载验收后重建
	theBoard->RebuildZombieRowBucket();  // 行段桶同款：整池镜像装载不走初始化尾
	// 关卡放行门（与 LawnApp::StartPlaying 同语义，2026-10-09 用户规格
	// "加载界面卡住不放行，首绘路径不得存在"）：存档恢复是另一条进玩游
	// 路径（Continue 继承局不经 StartPlaying），棋盘相关新加载图必须
	// 在此排干+清扫到位，不允许首绘在绘制路径上传。
	TodWarmDrainAll();
	theBoard->mApp->mGameScene = GameScenes::SCENE_PLAYING;
	return true;
}

bool LawnLoadGame(Board* theBoard, const std::string& theFilePath)
{
	Buffer aFileBuffer;
	if (!gSexyAppBase->ReadBufferFromFile(theFilePath, &aFileBuffer, false))
	{
		return false;
	}

	return LoadDat64FromBuffer(theBoard, aFileBuffer, theFilePath);
}

//0x4820D0
bool LawnSaveGame(Board* theBoard, const std::string& theFilePath)
{
	Buffer aFileBuffer;
	if (!BuildDat64SaveBuffer(theBoard, aFileBuffer))
	{
		return false;
	}
	return gSexyAppBase->WriteBufferToFile(theFilePath, &aFileBuffer);
}
