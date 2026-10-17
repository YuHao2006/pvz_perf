// 僵尸行查询基准（2026-10-04，修正 P1 关闭理由的事实错误后量化）
// 问题：高水位 ~1000 僵尸时，"全池扫+行比较"与"行桶"每查询真实差多少。
// 口径：MSVC x64 /O2；三种形态同池对比——
//   A 全池线性扫（现状：IterateZombies 到高水位，mRow 比较近免费，成本
//     在带宽：1024 × 168B = 172KB/查询）
//   B 行段连续数组（桶方案 1：按行聚拢的连续槽位号段，预取友好）
//   C 行链（植物格桶同款 next 链：依赖加载不可预取——170 长链是否还成立）
// 注意：172KB 池反复扫会驻留 L2/L3，测得的是扫描的下界（乐观）；实盘与
// Reanim/特效竞争缓存时 A 更差。B/C 每查询仅触本行僵尸。
#include <algorithm>
#include <chrono>
#include <cstdint>
#include <cstdio>

using Clock = std::chrono::steady_clock;

static const int POOL = 1024;         // 僵尸池容量（Board.cpp:68 原值）
static const int STRIDE = 168;        // sizeof(Zombie) 量级
static const int ROWS = 6;
static const int QUERY_ROW = 3;

struct BigZ
{
	char mPad[STRIDE - 8];
	int32_t mRow;
	int32_t mPhase;
};
static_assert(sizeof(BigZ) == STRIDE, "");

static BigZ gPool[POOL];
static BigZ gSeg[POOL / ROWS + 2];              // 行段方案：本行僵尸连续副本
static uint16_t gNext[POOL];                    // 链方案
static uint16_t gHead;
static int gSegCount;
static volatile uint64_t gSink;

static void BuildWorld()
{
	uint16_t aSegIdx = 0;
	int aChainTail = -1;
	gHead = 0xFFFF;
	for (int i = 0; i < POOL; i++)
	{
		gPool[i].mRow = i % ROWS;
		gPool[i].mPhase = i % 8;
		gNext[i] = 0xFFFF;
		if (gPool[i].mRow == QUERY_ROW)
		{
			gSeg[aSegIdx] = gPool[i];
			aSegIdx++;
			// 头插链（与格桶降序一致）
			gNext[i] = gHead;
			gHead = (uint16_t)i;
			(void)aChainTail;
		}
	}
	gSegCount = aSegIdx;
}

template <typename F>
static double Measure(F&& fn, int nIter)
{
	double best = 1e9;
	for (int round = 0; round < 5; round++)
	{
		uint64_t acc = 0;
		auto t0 = Clock::now();
		for (int n = 0; n < nIter; n++)
			acc += fn();
		auto t1 = Clock::now();
		gSink ^= acc;
		double ns = std::chrono::duration<double, std::nano>(t1 - t0).count() / nIter;
		best = std::min(best, ns);
	}
	return best;
}

int main()
{
	BuildWorld();
	const int N_SCAN = 200'000;    // 全池扫每查询 172KB，控总时长
	const int N_BUCKET = 2'000'000;

	const double nsScan = Measure([]{
		uint64_t hit = 0;
		for (int i = 0; i < POOL; i++)
			if (gPool[i].mRow == QUERY_ROW)
				hit++;
		return hit;
	}, N_SCAN);

	const double nsSeg = Measure([]{
		uint64_t hit = 0;
		for (int i = 0; i < gSegCount; i++)
			if (gSeg[i].mRow == QUERY_ROW)
				hit++;
		return hit;
	}, N_BUCKET);

	const double nsChain = Measure([]{
		uint64_t hit = 0;
		for (uint16_t i = gHead; i != 0xFFFF; i = gNext[i])
			if (gPool[i].mRow == QUERY_ROW)
				hit++;
		return hit;
	}, N_BUCKET);

	printf("zombie row-query bench: pool=%d stride=%dB row=%d members=%d\n",
		POOL, STRIDE, QUERY_ROW, gSegCount);
	printf("  A full-pool scan (172KB/query) : %8.1f ns/query\n", nsScan);
	printf("  B row segment  (contiguous)    : %8.1f ns/query\n", nsSeg);
	printf("  C row chain    (next[] hops)   : %8.1f ns/query\n", nsChain);
	printf("sink=%llu\n", (unsigned long long)gSink);
	return 0;
}
