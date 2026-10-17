#pragma once

#include <cstdint>
#include "ConstEnums.h"

// 植物标志字（2026-10-04 用户方案：SeedType 绑定布尔谓词 → uint64 位字
// 稠密表；掩码各位为命名空间内 constexpr 变量）。
// 六个原 OR 链谓词（IsNocturnal/IsFungus/IsAquatic/IsFlying/IsUpgrade/
// IsSpiky）的函数体换为表读取，60 个调用点签名零改动。
// 改版扩展：加植物 = kPlantFlags 表加一行；加新维度 = 本命名空间加一位
// constexpr + 表行补位。SeedType 键域即完美哈希（≤64 有 static_assert）。
namespace PlantFlags
{
	constexpr uint64_t Nocturnal = 1ull << 0;   // 夜行（蘑菇族，白天睡觉）
	constexpr uint64_t Fungus    = 1ull << 1;   // 真菌（成就/统计）
	constexpr uint64_t Aquatic   = 1ull << 2;   // 水生（CanPlantAt 水格判定，热路径）
	constexpr uint64_t Flying    = 1ull << 3;   // 飞行（咖啡豆；桶飞行层）
	constexpr uint64_t Upgrade   = 1ull << 4;   // 升级紫卡
	constexpr uint64_t Spiky     = 1ull << 5;   // 地刺族（压路/啃食豁免）
	constexpr uint64_t Short     = 1ull << 6;   // 矮个（僵尸豌豆免击名单）
}

// SeedType → 标志字（行序 = SeedType 枚举序，53 槽稠密直查）。
// 模仿者不在表内特殊化：查表方按解析后类型调用（与原谓词同口径）。
constexpr uint64_t kPlantFlags[(int)SeedType::NUM_SEED_TYPES] = {
	/* SEED_PEASHOOTER        = 0  */ 0,
	/* SEED_SUNFLOWER         = 1  */ 0,
	/* SEED_CHERRYBOMB        = 2  */ 0,
	/* SEED_WALLNUT           = 3  */ 0,
	/* SEED_POTATOMINE        = 4  */ PlantFlags::Short,  // 矮个（2026-10-06 B 树实机抓获：fdbc23a9 收编时抄丢 Short——豌豆僵尸的豌豆应从头顶飞过；原链 6 成员名单见 Projectile FindCollisionTargetPlant 注）
	/* SEED_SNOWPEA           = 5  */ 0,
	/* SEED_CHOMPER           = 6  */ 0,
	/* SEED_REPEATER          = 7  */ 0,
	/* SEED_PUFFSHROOM        = 8  */ PlantFlags::Nocturnal | PlantFlags::Fungus | PlantFlags::Short,
	/* SEED_SUNSHROOM         = 9  */ PlantFlags::Nocturnal | PlantFlags::Fungus | PlantFlags::Short,
	/* SEED_FUMESHROOM        = 10 */ PlantFlags::Nocturnal | PlantFlags::Fungus,
	/* SEED_GRAVEBUSTER       = 11 */ 0,
	/* SEED_HYPNOSHROOM       = 12 */ PlantFlags::Nocturnal | PlantFlags::Fungus,
	/* SEED_SCAREDYSHROOM     = 13 */ PlantFlags::Nocturnal | PlantFlags::Fungus,
	/* SEED_ICESHROOM         = 14 */ PlantFlags::Nocturnal | PlantFlags::Fungus,  // 无 Short（原链名单不含——fdbc23a9 误收，2026-10-06 修）
	/* SEED_DOOMSHROOM        = 15 */ PlantFlags::Nocturnal | PlantFlags::Fungus,
	/* SEED_LILYPAD           = 16 */ PlantFlags::Aquatic | PlantFlags::Short,
	/* SEED_SQUASH            = 17 */ 0,
	/* SEED_THREEPEATER       = 18 */ 0,
	/* SEED_TANGLEKELP        = 19 */ PlantFlags::Aquatic,
	/* SEED_JALAPENO          = 20 */ 0,
	/* SEED_SPIKEWEED         = 21 */ PlantFlags::Spiky | PlantFlags::Short,
	/* SEED_TORCHWOOD         = 22 */ 0,
	/* SEED_TALLNUT           = 23 */ 0,
	/* SEED_SEASHROOM         = 24 */ PlantFlags::Nocturnal | PlantFlags::Fungus | PlantFlags::Aquatic,  // 无 Short（原链名单不含——fdbc23a9 误收，2026-10-06 修）
	/* SEED_PLANTERN          = 25 */ 0,
	/* SEED_CACTUS            = 26 */ 0,
	/* SEED_BLOVER            = 27 */ 0,
	/* SEED_SPLITPEA          = 28 */ 0,
	/* SEED_STARFRUIT         = 29 */ 0,
	/* SEED_PUMPKINSHELL      = 30 */ 0,
	/* SEED_MAGNETSHROOM      = 31 */ PlantFlags::Nocturnal | PlantFlags::Fungus,
	/* SEED_CABBAGEPULT       = 32 */ 0,
	/* SEED_FLOWERPOT         = 33 */ 0,
	/* SEED_KERNELPULT        = 34 */ 0,
	/* SEED_INSTANT_COFFEE    = 35 */ PlantFlags::Flying,
	/* SEED_GARLIC            = 36 */ 0,
	/* SEED_UMBRELLA          = 37 */ 0,
	/* SEED_MARIGOLD          = 38 */ 0,
	/* SEED_MELONPULT         = 39 */ 0,
	/* SEED_GATLINGPEA        = 40 */ PlantFlags::Upgrade,
	/* SEED_TWINSUNFLOWER     = 41 */ PlantFlags::Upgrade,
	/* SEED_GLOOMSHROOM       = 42 */ PlantFlags::Nocturnal | PlantFlags::Fungus | PlantFlags::Upgrade,
	/* SEED_CATTAIL           = 43 */ PlantFlags::Aquatic | PlantFlags::Upgrade,
	/* SEED_WINTERMELON       = 44 */ PlantFlags::Upgrade,
	/* SEED_GOLD_MAGNET       = 45 */ PlantFlags::Upgrade,  // 原链不属夜行/真菌（不睡觉；对拍程序抓获初版误抄）
	/* SEED_SPIKEROCK         = 46 */ PlantFlags::Spiky | PlantFlags::Upgrade | PlantFlags::Short,  // Short 同土豆雷：fdbc23a9 抄丢（2026-10-06 修）
	/* SEED_COBCANNON         = 47 */ PlantFlags::Upgrade,
	/* SEED_IMITATER          = 48 */ 0,
	/* SEED_EXPLODE_O_NUT     = 49 */ 0,
	/* SEED_GIANT_WALLNUT     = 50 */ 0,
	/* SEED_SPROUT            = 51 */ 0,
	/* SEED_LEFTPEATER        = 52 */ 0,
};
static_assert(sizeof(kPlantFlags) / sizeof(kPlantFlags[0]) == (int)SeedType::NUM_SEED_TYPES,
	"kPlantFlags 槽位须与 SeedType 枚举同步");
static_assert((int)SeedType::NUM_SEED_TYPES <= 64,
	"SeedType 超 64 位需换双字/bitset");
// 六谓词成员锚（防行错位）：原 OR 链成员的标志逐位断言
static_assert((kPlantFlags[(int)SeedType::SEED_INSTANT_COFFEE] & PlantFlags::Flying) != 0 &&
	(kPlantFlags[(int)SeedType::SEED_LILYPAD] & PlantFlags::Aquatic) != 0 &&
	(kPlantFlags[(int)SeedType::SEED_TANGLEKELP] & PlantFlags::Aquatic) != 0 &&
	(kPlantFlags[(int)SeedType::SEED_SEASHROOM] & PlantFlags::Aquatic) != 0 &&
	(kPlantFlags[(int)SeedType::SEED_CATTAIL] & PlantFlags::Aquatic) != 0 &&
	(kPlantFlags[(int)SeedType::SEED_SPIKEWEED] & PlantFlags::Spiky) != 0 &&
	(kPlantFlags[(int)SeedType::SEED_SPIKEROCK] & PlantFlags::Spiky) != 0 &&
	(kPlantFlags[(int)SeedType::SEED_GATLINGPEA] & PlantFlags::Upgrade) != 0 &&
	(kPlantFlags[(int)SeedType::SEED_COBCANNON] & PlantFlags::Upgrade) != 0 &&
	(kPlantFlags[(int)SeedType::SEED_PUFFSHROOM] & PlantFlags::Nocturnal) != 0,
	"kPlantFlags 关键槽位错位");
// Short 位成员集锚（2026-10-06 土豆雷可被豌豆僵尸打到案 B 树实机抓获：
// fdbc23a9 收编漏 2 多 2——对拍只覆盖六谓词、Short 名单无成员集断言）。
// 原版免击名单 = 小喷菇/阳光菇/土豆雷/地刺/地刺王/睡莲，恰好 6 个：
static_assert((kPlantFlags[(int)SeedType::SEED_PUFFSHROOM] & PlantFlags::Short) != 0 &&
	(kPlantFlags[(int)SeedType::SEED_SUNSHROOM] & PlantFlags::Short) != 0 &&
	(kPlantFlags[(int)SeedType::SEED_POTATOMINE] & PlantFlags::Short) != 0 &&
	(kPlantFlags[(int)SeedType::SEED_SPIKEWEED] & PlantFlags::Short) != 0 &&
	(kPlantFlags[(int)SeedType::SEED_SPIKEROCK] & PlantFlags::Short) != 0 &&
	(kPlantFlags[(int)SeedType::SEED_LILYPAD] & PlantFlags::Short) != 0 &&
	(kPlantFlags[(int)SeedType::SEED_ICESHROOM] & PlantFlags::Short) == 0 &&
	(kPlantFlags[(int)SeedType::SEED_SEASHROOM] & PlantFlags::Short) == 0,
	"Short 名单成员集与原版免击名单不一致");
// Short 位全量计数锚：成员恰 6（改版加矮植物 = 名单+计数同步改）
static_assert([] {
	int n = 0;
	for (uint64_t f : kPlantFlags)
		if (f & PlantFlags::Short)
			++n;
	return n;
}() == 6, "Short 名单成员数须为 6（增删成员时与上一断言同步改）");

// 查表口（唯一入口）：越界回落 0 = 原 else 兜底
constexpr uint64_t PlantFlagsOf(SeedType theSeedType)
{
	return (unsigned)theSeedType < (int)SeedType::NUM_SEED_TYPES
		? kPlantFlags[(int)theSeedType]
		: 0;
}
