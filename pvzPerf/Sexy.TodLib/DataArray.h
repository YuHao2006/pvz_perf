#pragma once
#include <array>
#include <cstddef>
#include <cstdint>
#include <cstring>
#include <memory>
#include <new>
#include "TodDebug.h"
#include "TodCommon.h"

enum
{
	DATA_ARRAY_INDEX_MASK = 65535,
	DATA_ARRAY_KEY_MASK = -65536,
	DATA_ARRAY_KEY_SHIFT = 16,
	DATA_ARRAY_MAX_SIZE = 65536,
	DATA_ARRAY_KEY_FIRST = 1
};

// Diagnostic identity only; keep the former pointer field's size and alignment.
enum class DataArrayKind : std::uintptr_t
{
	Unknown = 0,
	Zombies = 1,
	Plants = 2,
	Projectiles = 3,
	Coins = 4,
	LawnMowers = 5,
	GridItems = 6,
	ParticleSystems = 7,
	ParticleEmitters = 8,
	Particles = 9,
	Reanimations = 10,
	Attachments = 11
};
static_assert(sizeof(DataArrayKind) == sizeof(const char*));
static_assert(alignof(DataArrayKind) == alignof(const char*));

template <typename T> class DataArray
{
public:
	// Keep the exact official slot layout (T followed by a 32-bit ID), while
	// giving the slot itself a real lifetime. The byte storage is active for a
	// free slot; T is constructed only while the slot is allocated.
	class DataArrayItem
	{
	public:
		using Storage = std::array<std::byte, sizeof(T)>;
		union
		{
			T					mItem;
			Storage				mStorage;
		};
		unsigned int			mID;

		DataArrayItem() noexcept : mID(0U)
		{
			// Default-initialize byte storage without clearing the whole pool.
			// A slot is zeroed only when it is actually allocated, matching 1073.
			::new (static_cast<void*>(std::addressof(mStorage))) Storage;
		}
		~DataArrayItem() {}

		DataArrayItem(const DataArrayItem&) = delete;
		DataArrayItem& operator=(const DataArrayItem&) = delete;

		T& ConstructItem()
		{
			std::memset(mStorage.data(), 0, mStorage.size());
			try
			{
				return *std::construct_at(std::addressof(mItem));
			}
			catch (...)
			{
				// T's failed constructor has already destroyed its completed
				// members. Restore byte-storage lifetime, never destroy T again.
				::new (static_cast<void*>(std::addressof(mStorage))) Storage;
				throw;
			}
		}

		void DestroyItem()
		{
			std::destroy_at(std::addressof(mItem));
			// Begin the lifetime of the inactive byte member without clearing it.
			// DataArrayAlloc performs the same zero-before-constructor operation as
			// 1073 when this slot is reused.
			::new (static_cast<void*>(std::addressof(mStorage))) Storage;
		}
	};

public:
	DataArrayItem*			mBlock;
	unsigned int			mMaxUsedCount;
	unsigned int			mMaxSize;
	unsigned int			mFreeListHead;
	unsigned int			mSize;
	unsigned int			mNextKey;
	DataArrayKind			mKind;

public:
	DataArray()
	{
		mBlock = nullptr;
		mMaxUsedCount = 0U;
		mMaxSize = 0U;
		mFreeListHead = 0U;
		mSize = 0U;
		mNextKey = 1U;
		mKind = DataArrayKind::Unknown;
	}

	~DataArray()
	{
		DataArrayDispose();
	}

	DataArray(const DataArray&) = delete;
	DataArray& operator=(const DataArray&) = delete;

	void DataArrayInitialize(unsigned int theMaxSize, DataArrayKind theKind = DataArrayKind::Unknown)
	{
		TOD_ASSERT(mBlock == nullptr);
		TOD_ASSERT(theMaxSize > 0U && theMaxSize <= DATA_ARRAY_MAX_SIZE);
		mBlock = new DataArrayItem[theMaxSize];
		mMaxUsedCount = 0U;
		mMaxSize = theMaxSize;
		mFreeListHead = 0U;
		mSize = 0U;
		mNextKey = 1001U;
		mKind = theKind;
	}

	void DataArrayDispose()
	{
		if (mBlock != nullptr)
		{
			DataArrayFreeAll();
			delete[] mBlock;
			mBlock = nullptr;
			mMaxUsedCount = 0U;
			mMaxSize = 0U;
			mFreeListHead = 0U;
			mSize = 0U;
			mKind = DataArrayKind::Unknown;
		}
	}

	unsigned int DataArrayIndexOf(const T* theItem) const
	{
		const std::uintptr_t aBlockAddress =
			reinterpret_cast<std::uintptr_t>(mBlock);
		const std::uintptr_t anItemAddress =
			reinterpret_cast<std::uintptr_t>(theItem);
		TOD_ASSERT(theItem != nullptr && anItemAddress >= aBlockAddress);
		const std::uintptr_t anOffset = anItemAddress - aBlockAddress;
		TOD_ASSERT(anOffset % sizeof(DataArrayItem) == 0U);
		const unsigned int anIndex =
			static_cast<unsigned int>(anOffset / sizeof(DataArrayItem));
		TOD_ASSERT(anIndex < mMaxSize);
		return anIndex;
	}

	void DataArrayFree(T* theItem)
	{
		const unsigned int anIndex = DataArrayIndexOf(theItem);
		DataArrayItem& aItem = mBlock[anIndex];
		TOD_ASSERT(DataArrayGet(aItem.mID) == theItem,
			"Failed: DataArrayFree(%p) in %llu", static_cast<void*>(theItem),
			static_cast<unsigned long long>(mKind));
		aItem.DestroyItem();
		aItem.mID = mFreeListHead;
		mFreeListHead = anIndex;
		mSize--;
	}

	void DataArrayFreeAll()
	{
		for (unsigned int i = 0; i < mMaxUsedCount; ++i)
		{
			DataArrayItem& aItem = mBlock[i];
			if (aItem.mID & DATA_ARRAY_KEY_MASK)
				aItem.DestroyItem();
			aItem.mID = 0U;
		}

		mFreeListHead = 0U;
		mMaxUsedCount = 0U;
		mSize = 0U;
	}

	inline unsigned int DataArrayGetID(T* theItem)
	{
		DataArrayItem& aItem = mBlock[DataArrayIndexOf(theItem)];
		TOD_ASSERT(DataArrayGet(aItem.mID) == theItem,
			"Failed: DataArrayGetID(%p) for %llu", static_cast<void*>(theItem),
			static_cast<unsigned long long>(mKind));
		return aItem.mID;
	}

	bool IterateNext(T*& theItem)
	{
		DataArrayItem* aSlot = theItem == nullptr
			? mBlock
			: std::launder(reinterpret_cast<DataArrayItem*>(theItem)) + 1;
		DataArrayItem* const anEnd = mBlock + mMaxUsedCount;
		while (aSlot < anEnd)
		{
			if (aSlot->mID & DATA_ARRAY_KEY_MASK)
			{
				theItem = std::addressof(aSlot->mItem);
				return true;
			}
			++aSlot;
		}
		return false;
	}

	T* DataArrayAlloc()
	{
		// TOD_ASSERT 在 Release 下编译为空；满员时若继续分配会越过
		// mMaxSize 写越界（堆损坏）。原版 1073 在动画满 1024 时通过删除
		// 部分僵尸动画避免走到这里；本复刻当前没有会触达该状态的调用方
		// （僵尸生成被 AddZombieInRow 的 1023 上限挡住），这里改为干净
		// 返回空指针 + 一次性日志，把潜在堆损坏变成确定性的可查事件。
		if (mSize >= mMaxSize)
		{
			TodTrace("DataArrayAlloc full: %llu (size=%u)\n",
				static_cast<unsigned long long>(mKind), mSize);
			return nullptr;
		}
		TOD_ASSERT(mFreeListHead <= mMaxUsedCount, "DataArrayAlloc error in %llu",
			static_cast<unsigned long long>(mKind));
		unsigned int aNext = mMaxUsedCount;
		const bool aFromUnusedTail = mFreeListHead == mMaxUsedCount;
		if (aFromUnusedTail)
			mFreeListHead = ++mMaxUsedCount;
		else
		{
			aNext = mFreeListHead;
			mFreeListHead = mBlock[mFreeListHead].mID;
		}

		DataArrayItem& aNewItem = mBlock[aNext];
		T* aValue;
		try
		{
			aValue = std::addressof(aNewItem.ConstructItem());
		}
		catch (...)
		{
			// Keep the successful path's reserve-before-constructor ordering.
			// If the constructor allocated another item in this same pool,
			// retain that item and its key; return only our failed reservation.
			if (aFromUnusedTail && mMaxUsedCount == aNext + 1U &&
				mFreeListHead == mMaxUsedCount)
			{
				mMaxUsedCount = aNext;
				mFreeListHead = aNext;
				aNewItem.mID = 0U;
			}
			else
			{
				aNewItem.mID = mFreeListHead;
				mFreeListHead = aNext;
			}
			throw;
		}
		aNewItem.mID = (mNextKey++ << DATA_ARRAY_KEY_SHIFT) | aNext;
		if (mNextKey == DATA_ARRAY_MAX_SIZE)
			mNextKey = 1U;
		mSize++;
		return aValue;
	}

	// Rebuild one slot while reading dat/dat64. Constructors establish a real
	// T lifetime; layout readers then overwrite the serialized fields exactly
	// as before. Inactive slots keep byte storage active, so stale pointers
	// from another process can never reach a destructor.
	T* DataArrayPrepareItemForLoad(unsigned int theIndex, unsigned int theID)
	{
		TOD_ASSERT(theIndex < mMaxSize);
		DataArrayItem& aItem = mBlock[theIndex];
		if (aItem.mID & DATA_ARRAY_KEY_MASK)
			aItem.DestroyItem();
		// A valid ID must never advertise an object whose constructor failed.
		aItem.mID = 0U;
		if (!(theID & DATA_ARRAY_KEY_MASK))
		{
			aItem.mID = theID;
			return nullptr;
		}
		T* aValue = std::addressof(aItem.ConstructItem());
		aItem.mID = theID;
		return aValue;
	}

	// Only for an interrupted pool load: the header described the intended
	// full block, but only completed items own a live ID. Retain them and
	// rebuild truthful metadata without allocating or calling user destructors.
	// Successful reads retain the exact serialized free-list order.
	void DataArrayRepairAfterFailedLoad() noexcept
	{
		mFreeListHead = mMaxUsedCount;
		mSize = 0U;
		for (unsigned int i = mMaxUsedCount; i-- > 0U;)
		{
			DataArrayItem& aItem = mBlock[i];
			if (aItem.mID & DATA_ARRAY_KEY_MASK)
				++mSize;
			else
			{
				aItem.mID = mFreeListHead;
				mFreeListHead = i;
			}
		}
	}

	T* DataArrayTryToGet(unsigned int theId)
	{
		if (!theId || (theId & DATA_ARRAY_INDEX_MASK) >= mMaxSize)
			return nullptr;

		DataArrayItem& aBlock = mBlock[theId & DATA_ARRAY_INDEX_MASK];
		return (aBlock.mID == theId) ? std::addressof(aBlock.mItem) : nullptr;
	}

	T* DataArrayGet(unsigned int theId)
	{
		TOD_ASSERT(DataArrayTryToGet(theId) != nullptr,
			"Failed: DataArrayGet(0x%x) for %llu", theId,
			static_cast<unsigned long long>(mKind));
		return std::addressof(mBlock[theId & DATA_ARRAY_INDEX_MASK].mItem);
	}
};

