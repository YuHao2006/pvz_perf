#pragma once

#include <cstdint>
#include "ConstEnums.h"

// 僵尸标志字（2026-10-04 用户方案，与 PlantFlags.h 同构）：
// ZombieType 绑定的类型级布尔谓词 → uint64 位字稠密表。只收编**有读者的**
// 类型属性（Boss/火抗/植物头族）；状态谓词不收（依赖相位/运行时字段），
// 零读者位不立（CanFly/Gargantuar/Jumper 三案教训，见 ns 内注释与台账）。
// 改版扩展：加僵尸 = kZombieFlags 表加行；加新维度 = 命名空间加一位
// constexpr + 表行补位 + **同时落读者**。特别是 Boss 位——改版做多 Boss
// 时，把新 Boss 类型的表行打上 Boss 位即全库 33 处 Boss 特判自动生效。
// 注：ZOMBIE_TARGET/TRASH_CAN/GRAVESTONE 在 ConstEnums.h 块注释内（不算枚举值）。
namespace ZombieFlags
{
	constexpr uint64_t Boss       = 1ull << 0;   // Boss（全行判定/特殊结算/独立渲染）
	constexpr uint64_t FireResistant = 1ull << 1; // 火抗（投石车/冰车；盾火抗在 IsFireResistant 的盾半边）
	constexpr uint64_t Zombotany  = 1ull << 2;   // 植物头族（Zombotany 关卡判定）
	// 位纪律（2026-10-04 基准校准后确立，bench_phase_query 实证）：每位须有
	// 读者——裸 == 换位读是负优化（+1 次依赖加载），链换位读才是正收益。
	// 曾立三位已删：CanFly（前置过滤基准否决 0.89→1.17ns）；Gargantuar/
	// Jumper（零读者——巨人族 22 处与窝瓜链的裸比较未转换，位成死 API）。
	// 三层分类法（类型属性/种族特征/运行时状态）记录在 perf-fix-ledger。
}

// ZombieType → 标志字（行序 = ConstEnums.h ZombieType 枚举序 0..33）
constexpr uint64_t kZombieFlags[(int)ZombieType::NUM_ZOMBIE_TYPES] = {
	/*  0 ZOMBIE_NORMAL            */ 0,
	/*  1 ZOMBIE_FLAG              */ 0,
	/*  2 ZOMBIE_TRAFFIC_CONE      */ 0,
	/*  3 ZOMBIE_POLEVAULTER       */ 0,
	/*  4 ZOMBIE_PAIL              */ 0,
	/*  5 ZOMBIE_NEWSPAPER         */ 0,
	/*  6 ZOMBIE_DOOR              */ 0,
	/*  7 ZOMBIE_FOOTBALL          */ 0,
	/*  8 ZOMBIE_DANCER            */ 0,
	/*  9 ZOMBIE_BACKUP_DANCER     */ 0,
	/* 10 ZOMBIE_DUCKY_TUBE        */ 0,
	/* 11 ZOMBIE_SNORKEL           */ 0,
	/* 12 ZOMBIE_ZAMBONI           */ ZombieFlags::FireResistant,
	/* 13 ZOMBIE_BOBSLED           */ 0,
	/* 14 ZOMBIE_DOLPHIN_RIDER     */ 0,
	/* 15 ZOMBIE_JACK_IN_THE_BOX   */ 0,
	/* 16 ZOMBIE_BALLOON           */ 0,
	/* 17 ZOMBIE_DIGGER            */ 0,
	/* 18 ZOMBIE_POGO              */ 0,
	/* 19 ZOMBIE_YETI              */ 0,
	/* 20 ZOMBIE_BUNGEE            */ 0,
	/* 21 ZOMBIE_LADDER            */ 0,
	/* 22 ZOMBIE_CATAPULT          */ ZombieFlags::FireResistant,
	/* 23 ZOMBIE_GARGANTUAR        */ 0,
	/* 24 ZOMBIE_IMP               */ 0,
	/* 25 ZOMBIE_BOSS              */ ZombieFlags::Boss,
	/* 26 ZOMBIE_PEA_HEAD          */ ZombieFlags::Zombotany,
	/* 27 ZOMBIE_WALLNUT_HEAD      */ ZombieFlags::Zombotany,
	/* 28 ZOMBIE_JALAPENO_HEAD     */ ZombieFlags::Zombotany,
	/* 29 ZOMBIE_GATLING_HEAD      */ ZombieFlags::Zombotany,
	/* 30 ZOMBIE_SQUASH_HEAD       */ ZombieFlags::Zombotany,
	/* 31 ZOMBIE_TALLNUT_HEAD      */ ZombieFlags::Zombotany,
	/* 32 ZOMBIE_REDEYE_GARGANTUAR */ 0,
	/* 33 ZOMBIE_ZOMBATAR          */ 0,
};
static_assert(sizeof(kZombieFlags) / sizeof(kZombieFlags[0]) == (int)ZombieType::NUM_ZOMBIE_TYPES,
	"kZombieFlags 槽位须与 ZombieType 枚举同步");
static_assert((int)ZombieType::NUM_ZOMBIE_TYPES <= 64,
	"ZombieType 超 64 位需换双字/bitset");
// 关键槽锚（防行错位）
static_assert((kZombieFlags[(int)ZombieType::ZOMBIE_BOSS] & ZombieFlags::Boss) != 0 &&
	(kZombieFlags[(int)ZombieType::ZOMBIE_ZAMBONI] & ZombieFlags::FireResistant) != 0 &&
	(kZombieFlags[(int)ZombieType::ZOMBIE_CATAPULT] & ZombieFlags::FireResistant) != 0 &&
	(kZombieFlags[(int)ZombieType::ZOMBIE_PEA_HEAD] & ZombieFlags::Zombotany) != 0 &&
	(kZombieFlags[(int)ZombieType::ZOMBIE_SQUASH_HEAD] & ZombieFlags::Zombotany) != 0,
	"kZombieFlags 关键槽位错位");
// 负向锚（金蘑菇教训：只断"该有的有"抓不住"多给的位"）
static_assert(kZombieFlags[(int)ZombieType::ZOMBIE_NORMAL] == 0 &&
	kZombieFlags[(int)ZombieType::ZOMBIE_DANCER] == 0 &&
	kZombieFlags[(int)ZombieType::ZOMBIE_YETI] == 0 &&
	kZombieFlags[(int)ZombieType::ZOMBIE_BUNGEE] == 0 &&
	kZombieFlags[(int)ZombieType::ZOMBIE_ZOMBATAR] == 0,
	"普通僵尸不应有任何标志位");
// 活行计数锚：Boss 1 + 火抗 2 + 植物头 6 = 9 行非零
static_assert([]{
	unsigned n = 0;
	for (auto f : kZombieFlags) n += (f != 0);
	return n == 9; }(),
	"kZombieFlags 活行数须为 9（Boss 1+火抗 2+植物头 6）");

// 查表口（唯一入口）：越界回落 0
constexpr uint64_t ZombieFlagsOf(ZombieType theZombieType)
{
	return (unsigned)theZombieType < (int)ZombieType::NUM_ZOMBIE_TYPES
		? kZombieFlags[(int)theZombieType]
		: 0;
}
