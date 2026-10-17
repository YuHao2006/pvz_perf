// 相位查询微基准（2026-10-04，用户指令"看看相位查询的性能消耗有多大"）
// 口径与 perf-fix-ledger 既定基准一致：MSVC x64 /O2，N=2M，min-of-5，ns/op。
// 场景池 64 僵尸：类型按真实出怪分布（多数普通/路障/铁桶，特化各 1-2 只），
// 相位以 NORMAL 为主掺少量 EATING/DYING——模拟"绝大多数比较落空"的真实形态
// （反向短路链的最坏情况）。表用真实 kZombieFlags（include ZombieFlags.h）。
#include "Lawn/ZombieFlags.h"

#include <algorithm>
#include <chrono>
#include <cstdint>
#include <cstdio>

using Clock = std::chrono::steady_clock;

static const int N_ITER = 2'000'000;
static const int POOL = 64;

struct BenchZombie
{
	ZombieType mType;
	int mPhase;
	bool mDead;
};

static BenchZombie gPool[POOL];
static volatile uint64_t gSink;

// 真实相位值锚（ConstEnums.h ZombiePhase；本地取值防头拖拽，值错则首行
// static_assert 拒编）
static_assert((int)ZombieType::NUM_ZOMBIE_TYPES == 34, "表域变动须同步本基准");

__declspec(noinline) uint64_t KernelSingleCompare(const BenchZombie* z, int i)
{
	// 代表性单比较（如 PHASE_RISING_FROM_GRAVE 查询）
	return z[i].mPhase == 107 ? 1u : 0u;
}

__declspec(noinline) uint64_t KernelIsFlyingOld(const BenchZombie* z, int i)
{
	// Zombie::IsFlying 前置过滤前形态：两趟相位比较
	return (z[i].mPhase == 60 || z[i].mPhase == 61) ? 1u : 0u;
}

__declspec(noinline) uint64_t KernelIsFlyingNew(const BenchZombie* z, int i)
{
	// Zombie::IsFlying 现形态（5ea09390）：CanFly 位测短路 + 相位确认
	if ((ZombieFlagsOf(z[i].mType) & ZombieFlags::CanFly) == 0)
		return 0u;
	return (z[i].mPhase == 60 || z[i].mPhase == 61) ? 1u : 0u;
}

__declspec(noinline) uint64_t KernelBitTestOnly(const BenchZombie* z, int i)
{
	// 纯前置位测（若黑名单链配位，普通僵尸付的就是这个）
	return (ZombieFlagsOf(z[i].mType) & (ZombieFlags::CanFly | ZombieFlags::Jumper)) != 0 ? 1u : 0u;
}

__declspec(noinline) uint64_t KernelChain6(const BenchZombie* z, int i)
{
	// FindSquashTarget 黑名单 6 连 !=（Plant.cpp:1821-1826 同构）：
	// 普通僵尸 6 比较全付（反向短路最坏情况）
	const int p = z[i].mPhase;
	return (p != 40 && p != 41 && p != 80 && p != 71 && p != 72 && p != 73) ? 1u : 0u;
}

__declspec(noinline) uint64_t KernelDeadOrDying(const BenchZombie* z, int i)
{
	// Zombie::IsDeadOrDying：bool + 三比较
	return (z[i].mDead || z[i].mPhase == 2 || z[i].mPhase == 3 || z[i].mPhase == 4) ? 1u : 0u;
}

template <typename F>
static double Measure(F&& fn)
{
	double best = 1e9;
	for (int round = 0; round < 5; round++)
	{
		uint64_t acc = 0;
		auto t0 = Clock::now();
		int idx = 0;
		for (int n = 0; n < N_ITER; n++)
		{
			acc += fn(gPool, idx);
			idx = (idx + 1) & (POOL - 1);
		}
		auto t1 = Clock::now();
		gSink ^= acc;
		double ns = std::chrono::duration<double, std::nano>(t1 - t0).count() / N_ITER;
		best = std::min(best, ns);
	}
	return best;
}

int main()
{
	// 类型混合：多数普通族 + 特化各少量（含 2 气球——CanFly 命中行）
	const ZombieType mix[] = {
		ZombieType::ZOMBIE_NORMAL, ZombieType::ZOMBIE_TRAFFIC_CONE, ZombieType::ZOMBIE_PAIL,
		ZombieType::ZOMBIE_NORMAL, ZombieType::ZOMBIE_FLAG, ZombieType::ZOMBIE_NEWSPAPER,
		ZombieType::ZOMBIE_DOOR, ZombieType::ZOMBIE_FOOTBALL, ZombieType::ZOMBIE_NORMAL,
		ZombieType::ZOMBIE_TRAFFIC_CONE, ZombieType::ZOMBIE_NORMAL, ZombieType::ZOMBIE_PAIL,
		ZombieType::ZOMBIE_DANCER, ZombieType::ZOMBIE_NORMAL, ZombieType::ZOMBIE_DUCKY_TUBE,
		ZombieType::ZOMBIE_SNORKEL, ZombieType::ZOMBIE_NORMAL, ZombieType::ZOMBIE_BALLOON,
		ZombieType::ZOMBIE_DIGGER, ZombieType::ZOMBIE_POGO, ZombieType::ZOMBIE_NORMAL,
		ZombieType::ZOMBIE_BUNGEE, ZombieType::ZOMBIE_LADDER, ZombieType::ZOMBIE_CATAPULT,
		ZombieType::ZOMBIE_GARGANTUAR, ZombieType::ZOMBIE_IMP, ZombieType::ZOMBIE_NORMAL,
		ZombieType::ZOMBIE_PEA_HEAD, ZombieType::ZOMBIE_WALLNUT_HEAD, ZombieType::ZOMBIE_NORMAL,
		ZombieType::ZOMBIE_TRAFFIC_CONE, ZombieType::ZOMBIE_PAIL, ZombieType::ZOMBIE_NORMAL,
		ZombieType::ZOMBIE_NORMAL, ZombieType::ZOMBIE_TRAFFIC_CONE, ZombieType::ZOMBIE_FOOTBALL,
		ZombieType::ZOMBIE_NORMAL, ZombieType::ZOMBIE_PAIL, ZombieType::ZOMBIE_DOOR,
		ZombieType::ZOMBIE_NEWSPAPER, ZombieType::ZOMBIE_NORMAL, ZombieType::ZOMBIE_BALLOON,
		ZombieType::ZOMBIE_NORMAL, ZombieType::ZOMBIE_TRAFFIC_CONE, ZombieType::ZOMBIE_PAIL,
		ZombieType::ZOMBIE_NORMAL, ZombieType::ZOMBIE_JACK_IN_THE_BOX,
		ZombieType::ZOMBIE_YETI, ZombieType::ZOMBIE_NORMAL, ZombieType::ZOMBIE_POLEVAULTER,
		ZombieType::ZOMBIE_DOLPHIN_RIDER, ZombieType::ZOMBIE_NORMAL, ZombieType::ZOMBIE_PAIL,
		ZombieType::ZOMBIE_ZAMBONI, ZombieType::ZOMBIE_BOBSLED,
		ZombieType::ZOMBIE_TRAFFIC_CONE, ZombieType::ZOMBIE_NORMAL, ZombieType::ZOMBIE_PAIL,
		ZombieType::ZOMBIE_BACKUP_DANCER, ZombieType::ZOMBIE_NORMAL, ZombieType::ZOMBIE_BOSS,
		ZombieType::ZOMBIE_REDEYE_GARGANTUAR, ZombieType::ZOMBIE_NORMAL, ZombieType::ZOMBIE_ZOMBATAR,
	};
	static_assert(sizeof(mix) / sizeof(mix[0]) == POOL, "混合池须为 64（迭代掩码 2 的幂）");
	for (int i = 0; i < POOL; i++)
	{
		gPool[i].mType = mix[i];
		// 相位：60 段以下为主（普通/吃食/走)，6/64 概率落 DYING 段
		gPool[i].mPhase = (i % 16 == 3) ? (2 + (i % 3)) : (i % 8);
		gPool[i].mDead = false;
	}

	struct { const char* name; double ns; } results[] = {
		{"single ==          ", Measure(KernelSingleCompare)},
		{"IsFlying old(2 cmp)", Measure(KernelIsFlyingOld)},
		{"IsFlying new(bit)  ", Measure(KernelIsFlyingNew)},
		{"bit test only      ", Measure(KernelBitTestOnly)},
		{"chain6 != (squash) ", Measure(KernelChain6)},
		{"dead-or-dying(3+1) ", Measure(KernelDeadOrDying)},
	};

	printf("phase-query bench: MSVC x64 /O2, N=%d min-of-5, pool=%d (mixed types, mostly-miss phases)\n", N_ITER, POOL);
	for (auto& r : results)
		printf("  %s : %6.2f ns/op\n", r.name, r.ns);
	printf("sink=%llu\n", (unsigned long long)gSink);
	return 0;
}
