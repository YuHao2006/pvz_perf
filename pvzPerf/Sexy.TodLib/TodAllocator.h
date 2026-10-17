#pragma once
#define MAX_GLOBAL_ALLOCATORS 128

// 【TodList 已删（2026-10-02）】本文件原为 TodList.h——TodListNode/TodList
// 模板链表类已随 P3 名册连续化（发射器/粒子两张侧表）+ ImageVariationList
// 定长化 + CalcHash 去重集定长化全部退役，无任何使用方；文件更名回归其
// 唯一存活内容：TodAllocator 定长块池 + 全局注册表（存档原生段分配、
// reanim 轨道实例段等在用）。
struct TodAllocator
{
	void*				mFreeList = nullptr;
	void*				mBlockList = nullptr;
	int					mGrowCount = 0;
	int					mTotalItems = 0;
	int					mItemSize = 0;

	void                Initialize(int theGrowCount, int theItemSize);
	void                Dispose();
	void                FreeAll();
	void*               Alloc(int theItemSize);
	void*               Calloc(int theItemSize);
	void                Free(void* theItem, int theItemSize);
	void                Grow();
	bool                IsPointerFromAllocator(void* theItem);
	bool                IsPointerOnFreeList(void* theItem);
};
extern int gNumGlobalAllocators;
extern TodAllocator gGlobalAllocators[MAX_GLOBAL_ALLOCATORS];
