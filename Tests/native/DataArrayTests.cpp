#include "Sexy.TodLib/DataArray.h"

#include <bit>
#include <cstdio>
#include <cstdlib>
#include <stdexcept>

void TodTrace(const char*, ...) {}

namespace
{
void Require(bool condition)
{
	if (!condition)
		std::abort();
}

struct Item
{
	int value = 17;
};

struct ByteItem
{
	char value;
};

struct ThrowingItem
{
	ThrowingItem() { throw std::runtime_error("constructor"); }
};

template <typename T>
struct OldSlot
{
	T item;
	unsigned int id;
};

template <typename T>
void CheckLayout()
{
	using Slot = typename DataArray<T>::DataArrayItem;
	static_assert(sizeof(Slot) == sizeof(OldSlot<T>));
	static_assert(alignof(Slot) == alignof(OldSlot<T>));
	static_assert(offsetof(Slot, mIndex) == offsetof(OldSlot<T>, id));
	static_assert(offsetof(Slot, mGeneration) == offsetof(Slot, mIndex) + 2);
}
}

int main()
{
	CheckLayout<Item>();
	CheckLayout<ByteItem>();
	static_assert(std::endian::native == std::endian::little);
	DataArray<Item> pool;
	pool.DataArrayInitialize(8);
	Item* first = pool.DataArrayAlloc();
	Item* second = pool.DataArrayAlloc();
	const unsigned int firstID = pool.DataArrayGetID(first);
	const unsigned int secondID = pool.DataArrayGetID(second);
	Require(firstID == (1001U << 16));
	Require(secondID == ((1002U << 16) | 1U));
	unsigned int bytes;
	std::memcpy(&bytes, &pool.mBlock[1].mIndex, sizeof(bytes));
	Require(bytes == secondID);
	pool.DataArrayFree(first);
	Require(pool.DataArrayTryToGet(firstID) == nullptr);
	Require(pool.mBlock[0].mIndex == 2 && pool.mBlock[0].mGeneration == 0);
	Item* reused = pool.DataArrayAlloc();
	Require(reused == first && reused->value == 17);
	Require(pool.DataArrayGetID(reused) == (1003U << 16));
	Item* current = nullptr;
	Require(pool.IterateNext(current) && current == reused);
	Require(pool.IterateNext(current) && current == second);
	Require(!pool.IterateNext(current));
	pool.mNextKey = 65535;
	Item* lastGeneration = pool.DataArrayAlloc();
	Require(pool.DataArrayGetID(lastGeneration) == 0xffff0002U);
	Require(pool.mNextKey == 1);
	Item* wrapped = pool.DataArrayAlloc();
	Require(pool.DataArrayGetID(wrapped) == 0x00010003U);

	pool.DataArrayFreeAll();
	pool.mMaxUsedCount = 3;
	pool.mFreeListHead = 1;
	pool.mSize = 2;
	Require(pool.DataArrayPrepareItemForLoad(0, 0x12340000U) != nullptr);
	Require(pool.DataArrayPrepareItemForLoad(1, 3U) == nullptr);
	Require(pool.DataArrayPrepareItemForLoad(2, 0xabcd0002U) != nullptr);
	Require(pool.mBlock[0].PackedID() == 0x12340000U);
	Require(pool.mBlock[1].PackedID() == 3U);
	Require(pool.mBlock[2].PackedID() == 0xabcd0002U);
	pool.DataArrayRepairAfterFailedLoad();
	Require(pool.mSize == 2 && pool.mFreeListHead == 1);
	Require(pool.mBlock[1].PackedID() == 3U);
	Require(pool.DataArrayAlloc() == &pool.mBlock[1].mItem);
	pool.DataArrayFreeAll();

	DataArray<ThrowingItem> throwing;
	throwing.DataArrayInitialize(2);
	try
	{
		throwing.DataArrayAlloc();
		std::abort();
	}
	catch (const std::runtime_error&)
	{
		Require(throwing.mSize == 0 && throwing.mMaxUsedCount == 0);
		Require(throwing.mBlock[0].PackedID() == 0);
	}
	std::puts("PASS: slot layout/ID bytes, stale handles, free list, iteration, generation wrap, load and failed construction");
}
