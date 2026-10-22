#include "graphics/Graphics.h"
#include "TodDebug.h"
#include "TodCommon.h"
#include "Definition.h"
#include "TodAllocator.h"
#include "Reanimator.h"
#include "ReanimRenderSemantics.h"
#include "ReanimTrackMphfGlobal.h"  // 全局单表 MPHF（唯一 MPHF 层）：(type,id) 联合键 -> trackIndex + 语料成员位图（reanimc compile-v2 生成）
#include "generated/ReanimAttacherMasks.h"  // P4：每类型轨道数 + attacher 位掩码（编译期生成，与本 cpp 独占包含）
#include "Attachment.h"
#include "EffectSystem.h"
#include "GameConstants.h"
#include "graphics/Font.h"
#include <bit>
#include <array>
#include <vector>
#include "graphics/MemoryImage.h"
#include "graphics/DDInterface.h"
#include "graphics/RenderInterface.h"
#include "paklib/PakInterface.h"

#include <algorithm>
#include <climits>
#include <cmath>
#include <cstring>
#include <memory>
#include <set>
#include <vector>

static unsigned int gReanimatorDefCount;                     //[0x6A9EE4]
ReanimatorDefinition* gReanimatorDefArray;   //[0x6A9EE8]
static unsigned int gReanimationParamArraySize;              //[0x6A9EEC]
static ReanimationParams* gReanimationParamArray;   //[0x6A9EF0]

std::uint32_t ReanimatorTrackIdAt(ReanimationType theReanimType, int theTrackIndex)
{
	if (gReanimatorDefArray == nullptr || (unsigned)theReanimType >= gReanimatorDefCount)
		return 0;
	const ReanimatorDefinition& aDef = gReanimatorDefArray[(int)theReanimType];
	if (aDef.mTracks.tracks == nullptr || (unsigned)theTrackIndex >= (unsigned)aDef.mTracks.count)
		return 0;
	return static_cast<std::uint32_t>(aDef.mTracks.tracks[theTrackIndex].mTrackId);
}

static int ReanimatorTrackIndexOf(ReanimationType theReanimType, ReanimTrackId theTrackId)
{
	// 单条 memo 已删：实测命中率 5.0%（4870/92094，普通 25s 会话）远低于
	// ~30% 盈亏平衡点（miss 白付比较+回写 ~0.8ns，hit 仅省 ~1.9ns）；实战
	// 查找在几十类型/键间交错，单槽结构接不住。
	if (theReanimType < 0 || theReanimType >= (ReanimationType)gReanimatorDefCount)
	{
		return -1;
	}
	const int aType = (int)theReanimType;
	// 全局单表 MPHF（唯一查找层）：全语料 (type,id) 联合键（(type<<32)|id）
	// 一次查找（ReanimTrackMphfGlobal.h 烘焙；桶/槽均 2 的幂，取模全为掩码零
	// div；函数体与 reanimc 求解器逐运算一致）。键集 = 每类型首见该 id 的轨道
	// 下标。语料已覆盖全部 144 类型（含 Zombie_FlagPole/Disco/Backup/Zombatar），
	// 无兜底第二层：-1 即"该定义确无此轨道"的终答——探测式消费方
	//（TrackExists/AssignRenderGroupToTrack）取 false，直用式消费方经
	// FindTrackIndex 弹错退出，绝不静默回轨道 0。
	const int aIndex = MphfLookupGlobal((std::uint32_t)aType, (std::uint32_t)theTrackId);
	return aIndex;
}


ReanimationParams gLawnReanimationArray[(int)ReanimationType::NUM_REANIMS] = { //0x6A1340
	{ ReanimationType::REANIM_LOADBAR_SPROUT,                       "reanim\\LoadBar_sprout.reanim", 0},
	{ ReanimationType::REANIM_LOADBAR_ZOMBIEHEAD,                   "reanim\\LoadBar_Zombiehead.reanim", 0},
	{ ReanimationType::REANIM_SODROLL,                              "reanim\\SodRoll.reanim",                           0 },
	{ ReanimationType::REANIM_FINAL_WAVE,                           "reanim\\FinalWave.reanim", 0},
	{ ReanimationType::REANIM_PEASHOOTER,                           "reanim\\PeaShooterSingle.reanim",                  0 },
	{ ReanimationType::REANIM_WALLNUT,                              "reanim\\Wallnut.reanim",                           0 },
	{ ReanimationType::REANIM_LILYPAD,                              "reanim\\Lilypad.reanim",                           0 },
	{ ReanimationType::REANIM_SUNFLOWER,                            "reanim\\SunFlower.reanim",                         0 },
	{ ReanimationType::REANIM_LAWNMOWER,                            "reanim\\LawnMower.reanim",                         0 },
	{ ReanimationType::REANIM_READYSETPLANT,                        "reanim\\StartReadySetPlant.reanim", 0},
	{ ReanimationType::REANIM_CHERRYBOMB,                           "reanim\\CherryBomb.reanim",                        0 },
	{ ReanimationType::REANIM_SQUASH,                               "reanim\\Squash.reanim",                            0 },
	{ ReanimationType::REANIM_DOOMSHROOM,                           "reanim\\DoomShroom.reanim",                        0 },
	{ ReanimationType::REANIM_SNOWPEA,                              "reanim\\SnowPea.reanim",                           0 },
	{ ReanimationType::REANIM_REPEATER,                             "reanim\\PeaShooter.reanim",                        0 },
	{ ReanimationType::REANIM_SUNSHROOM,                            "reanim\\SunShroom.reanim",                         0 },
	{ ReanimationType::REANIM_TALLNUT,                              "reanim\\Tallnut.reanim",                           0 },
	{ ReanimationType::REANIM_FUMESHROOM,                           "reanim\\Fumeshroom.reanim",                        0 },
	{ ReanimationType::REANIM_PUFFSHROOM,                           "reanim\\Puffshroom.reanim",                        0 },
	{ ReanimationType::REANIM_HYPNOSHROOM,                          "reanim\\Hypnoshroom.reanim",                       0 },
	{ ReanimationType::REANIM_CHOMPER,                              "reanim\\Chomper.reanim",                           0 },
	{ ReanimationType::REANIM_ZOMBIE,                               "reanim\\Zombie.reanim",                            0 },
	{ ReanimationType::REANIM_SUN,                                  "reanim\\Sun.reanim",                               0 },
	{ ReanimationType::REANIM_POTATOMINE,                           "reanim\\PotatoMine.reanim",                        0 },
	{ ReanimationType::REANIM_SPIKEWEED,                            "reanim\\Caltrop.reanim",                           0 },
	{ ReanimationType::REANIM_SPIKEROCK,                            "reanim\\SpikeRock.reanim",                         0 },
	{ ReanimationType::REANIM_THREEPEATER,                          "reanim\\ThreePeater.reanim",                       0 },
	{ ReanimationType::REANIM_MARIGOLD,                             "reanim\\Marigold.reanim",                          0 },
	{ ReanimationType::REANIM_ICESHROOM,                            "reanim\\IceShroom.reanim",                         0 },
	{ ReanimationType::REANIM_ZOMBIE_FOOTBALL,                      "reanim\\Zombie_football.reanim",                   0 },
	{ ReanimationType::REANIM_ZOMBIE_NEWSPAPER,                     "reanim\\Zombie_paper.reanim",                      0 },
	{ ReanimationType::REANIM_ZOMBIE_ZAMBONI,                       "reanim\\Zombie_zamboni.reanim",                    0 },
	{ ReanimationType::REANIM_SPLASH,                               "reanim\\splash.reanim",                            0 },
	{ ReanimationType::REANIM_JALAPENO,                             "reanim\\Jalapeno.reanim",                          0 },
	{ ReanimationType::REANIM_JALAPENO_FIRE,                        "reanim\\fire.reanim",                              0 },
	{ ReanimationType::REANIM_COIN_SILVER,                          "reanim\\Coin_silver.reanim",                       0 },
	{ ReanimationType::REANIM_ZOMBIE_CHARRED,                       "reanim\\Zombie_charred.reanim",                    0 },
	{ ReanimationType::REANIM_ZOMBIE_CHARRED_IMP,                   "reanim\\Zombie_charred_imp.reanim",                0 },
	{ ReanimationType::REANIM_ZOMBIE_CHARRED_DIGGER,                "reanim\\Zombie_charred_digger.reanim",             0 },
	{ ReanimationType::REANIM_ZOMBIE_CHARRED_ZAMBONI,               "reanim\\Zombie_charred_zamboni.reanim",            0 },
	{ ReanimationType::REANIM_ZOMBIE_CHARRED_CATAPULT,              "reanim\\Zombie_charred_catapult.reanim",           0 },
	{ ReanimationType::REANIM_ZOMBIE_CHARRED_GARGANTUAR,            "reanim\\Zombie_charred_gargantuar.reanim",         0 },
	{ ReanimationType::REANIM_SCRAREYSHROOM,                        "reanim\\ScaredyShroom.reanim",                     0 },
	{ ReanimationType::REANIM_PUMPKIN,                              "reanim\\Pumpkin.reanim",                           0 },
	{ ReanimationType::REANIM_PLANTERN,                             "reanim\\Plantern.reanim",                          0 },
	{ ReanimationType::REANIM_TORCHWOOD,                            "reanim\\Torchwood.reanim",                         0 },
	{ ReanimationType::REANIM_SPLITPEA,                             "reanim\\SplitPea.reanim",                          0 },
	{ ReanimationType::REANIM_SEASHROOM,                            "reanim\\SeaShroom.reanim",                         0 },
	{ ReanimationType::REANIM_BLOVER,                               "reanim\\Blover.reanim",                            0 },
	{ ReanimationType::REANIM_FLOWER_POT,                           "reanim\\Pot.reanim",                               0 },
	{ ReanimationType::REANIM_CACTUS,                               "reanim\\Cactus.reanim",                            0 },
	{ ReanimationType::REANIM_TANGLEKELP,                           "reanim\\Tanglekelp.reanim",                        0 },
	{ ReanimationType::REANIM_STARFRUIT,                            "reanim\\Starfruit.reanim",                         0 },
	{ ReanimationType::REANIM_POLEVAULTER,                          "reanim\\Zombie_polevaulter.reanim",                0 },
	{ ReanimationType::REANIM_BALLOON,                              "reanim\\Zombie_balloon.reanim",                    0 },
	{ ReanimationType::REANIM_GARGANTUAR,                           "reanim\\Zombie_gargantuar.reanim",                 0 },
	{ ReanimationType::REANIM_IMP,                                  "reanim\\Zombie_imp.reanim",                        0 },
	{ ReanimationType::REANIM_DIGGER,                               "reanim\\Zombie_digger.reanim",                     0 },
	{ ReanimationType::REANIM_DIGGER_DIRT,                          "reanim\\Digger_rising_dirt.reanim",                0 },
	{ ReanimationType::REANIM_ZOMBIE_DOLPHINRIDER,                  "reanim\\Zombie_dolphinrider.reanim",               0 },
	{ ReanimationType::REANIM_POGO,                                 "reanim\\Zombie_pogo.reanim",                       0 },
	{ ReanimationType::REANIM_BOBSLED,                              "reanim\\Zombie_bobsled.reanim",                    0 },
	{ ReanimationType::REANIM_JACKINTHEBOX,                         "reanim\\Zombie_jackbox.reanim",                    0 },
	{ ReanimationType::REANIM_SNORKEL,                              "reanim\\Zombie_snorkle.reanim",                    0 },
	{ ReanimationType::REANIM_BUNGEE,                               "reanim\\Zombie_bungi.reanim",                      0 },
	{ ReanimationType::REANIM_CATAPULT,                             "reanim\\Zombie_catapult.reanim",                   0 },
	{ ReanimationType::REANIM_LADDER,                               "reanim\\Zombie_ladder.reanim",                     0 },
	{ ReanimationType::REANIM_PUFF,                                 "reanim\\Puff.reanim",                              0 },
	{ ReanimationType::REANIM_SLEEPING,                             "reanim\\Z.reanim",                                 0 },
	{ ReanimationType::REANIM_GRAVE_BUSTER,                         "reanim\\Gravebuster.reanim",                       0 },
	{ ReanimationType::REANIM_ZOMBIES_WON,                          "reanim\\ZombiesWon.reanim", 0},
	{ ReanimationType::REANIM_MAGNETSHROOM,                         "reanim\\Magnetshroom.reanim",                      0 },
	{ ReanimationType::REANIM_BOSS,                                 "reanim\\Zombie_boss.reanim",                       0 },
	{ ReanimationType::REANIM_CABBAGEPULT,                          "reanim\\Cabbagepult.reanim",                       0 },
	{ ReanimationType::REANIM_KERNELPULT,                           "reanim\\Cornpult.reanim",                          0 },
	{ ReanimationType::REANIM_MELONPULT,                            "reanim\\Melonpult.reanim",                         0 },
	{ ReanimationType::REANIM_COFFEEBEAN,                           "reanim\\Coffeebean.reanim", 0},
	{ ReanimationType::REANIM_UMBRELLALEAF,                         "reanim\\Umbrellaleaf.reanim",                      0 },
	{ ReanimationType::REANIM_GATLINGPEA,                           "reanim\\GatlingPea.reanim",                        0 },
	{ ReanimationType::REANIM_CATTAIL,                              "reanim\\Cattail.reanim",                           0 },
	{ ReanimationType::REANIM_GLOOMSHROOM,                          "reanim\\GloomShroom.reanim",                       0 },
	{ ReanimationType::REANIM_BOSS_ICEBALL,                         "reanim\\Zombie_boss_iceball.reanim", 0},
	{ ReanimationType::REANIM_BOSS_FIREBALL,                        "reanim\\Zombie_boss_fireball.reanim", 0},
	{ ReanimationType::REANIM_COBCANNON,                            "reanim\\CobCannon.reanim",                         0 },
	{ ReanimationType::REANIM_GARLIC,                               "reanim\\Garlic.reanim",                            0 },
	{ ReanimationType::REANIM_GOLD_MAGNET,                          "reanim\\GoldMagnet.reanim",                        0 },
	{ ReanimationType::REANIM_WINTER_MELON,                         "reanim\\WinterMelon.reanim",                       0 },
	{ ReanimationType::REANIM_TWIN_SUNFLOWER,                       "reanim\\TwinSunflower.reanim",                     0 },
	{ ReanimationType::REANIM_POOL_CLEANER,                         "reanim\\PoolCleaner.reanim",                       0 },
	{ ReanimationType::REANIM_ROOF_CLEANER,                         "reanim\\RoofCleaner.reanim",                       0 },
	{ ReanimationType::REANIM_FIRE_PEA,                             "reanim\\FirePea.reanim",                           0 },
	{ ReanimationType::REANIM_IMITATER,                             "reanim\\Imitater.reanim",                          0 },
	{ ReanimationType::REANIM_YETI,                                 "reanim\\Zombie_yeti.reanim",                       0 },
	{ ReanimationType::REANIM_BOSS_DRIVER,                          "reanim\\Zombie_Boss_driver.reanim",                0 },
	{ ReanimationType::REANIM_LAWN_MOWERED_ZOMBIE,                  "reanim\\LawnMoweredZombie.reanim",                 0 },
	{ ReanimationType::REANIM_CRAZY_DAVE,                           "reanim\\CrazyDave.reanim", 0},
	{ ReanimationType::REANIM_TEXT_FADE_ON,                         "reanim\\TextFadeOn.reanim",                        0 },
	{ ReanimationType::REANIM_HAMMER,                               "reanim\\Hammer.reanim",                            0 },
	{ ReanimationType::REANIM_SLOT_MACHINE_HANDLE,                  "reanim\\SlotMachine.reanim",                       0 },
	{ ReanimationType::REANIM_CREDITS_FOOTBALL,                     "reanim\\Credits_Football.reanim", 0},
	{ ReanimationType::REANIM_CREDITS_JACKBOX,                      "reanim\\Credits_Jackbox.reanim", 0},
	{ ReanimationType::REANIM_SELECTOR_SCREEN,                      "reanim\\SelectorScreen.reanim",                    3 },
	{ ReanimationType::REANIM_PORTAL_CIRCLE,                        "reanim\\Portal_Circle.reanim",                     0 },
	{ ReanimationType::REANIM_PORTAL_SQUARE,                        "reanim\\Portal_Square.reanim",                     0 },
	{ ReanimationType::REANIM_ZENGARDEN_SPROUT,                     "reanim\\ZenGarden_sprout.reanim",                  0 },
	{ ReanimationType::REANIM_ZENGARDEN_WATERINGCAN,                "reanim\\ZenGarden_wateringcan.reanim", 0},
	{ ReanimationType::REANIM_ZENGARDEN_FERTILIZER,                 "reanim\\ZenGarden_fertilizer.reanim", 0},
	{ ReanimationType::REANIM_ZENGARDEN_BUGSPRAY,                   "reanim\\ZenGarden_bugspray.reanim", 0},
	{ ReanimationType::REANIM_ZENGARDEN_PHONOGRAPH,                 "reanim\\ZenGarden_phonograph.reanim", 0},
	{ ReanimationType::REANIM_DIAMOND,                              "reanim\\Diamond.reanim",                           0 },
	{ ReanimationType::REANIM_ZOMBIE_HAND,                          "reanim\\Zombie_hand.reanim", 0},
	{ ReanimationType::REANIM_STINKY,                               "reanim\\Stinky.reanim",                            0 },
	{ ReanimationType::REANIM_RAKE,                                 "reanim\\Rake.reanim",                              0 },
	{ ReanimationType::REANIM_RAIN_CIRCLE,                          "reanim\\Rain_circle.reanim",                       0 },
	{ ReanimationType::REANIM_RAIN_SPLASH,                          "reanim\\Rain_splash.reanim",                       0 },
	{ ReanimationType::REANIM_ZOMBIE_SURPRISE,                      "reanim\\Zombie_surprise.reanim",                   0 },
	{ ReanimationType::REANIM_COIN_GOLD,                            "reanim\\Coin_gold.reanim",                         0 },
	{ ReanimationType::REANIM_TREEOFWISDOM,                         "reanim\\TreeOfWisdom.reanim", 0},
	{ ReanimationType::REANIM_TREEOFWISDOM_CLOUDS,                  "reanim\\TreeOfWisdomClouds.reanim", 0},
	{ ReanimationType::REANIM_TREEOFWISDOM_TREEFOOD,                "reanim\\TreeFood.reanim", 0},
	{ ReanimationType::REANIM_CREDITS_MAIN,                         "reanim\\Credits_Main.reanim",                      3 },
	{ ReanimationType::REANIM_CREDITS_MAIN2,                        "reanim\\Credits_Main2.reanim",                     3 },
	{ ReanimationType::REANIM_CREDITS_MAIN3,                        "reanim\\Credits_Main3.reanim",                     3 },
	{ ReanimationType::REANIM_ZOMBIE_CREDITS_DANCE,                 "reanim\\Zombie_credits_dance.reanim",              0 },
	{ ReanimationType::REANIM_CREDITS_STAGE,                        "reanim\\Credits_stage.reanim", 0},
	{ ReanimationType::REANIM_CREDITS_BIGBRAIN,                     "reanim\\Credits_BigBrain.reanim", 0},
	{ ReanimationType::REANIM_CREDITS_FLOWER_PETALS,                "reanim\\Credits_Flower_petals.reanim", 0},
	{ ReanimationType::REANIM_CREDITS_INFANTRY,                     "reanim\\Credits_Infantry.reanim", 0},
	{ ReanimationType::REANIM_CREDITS_THROAT,                       "reanim\\Credits_Throat.reanim", 0},
	{ ReanimationType::REANIM_CREDITS_CRAZYDAVE,                    "reanim\\Credits_CrazyDave.reanim", 0},
	{ ReanimationType::REANIM_CREDITS_BOSSDANCE,                    "reanim\\Credits_Bossdance.reanim", 0},
	{ ReanimationType::REANIM_ZOMBIE_CREDITS_SCREEN_DOOR,           "reanim\\Zombie_Credits_Screendoor.reanim", 0},
	{ ReanimationType::REANIM_ZOMBIE_CREDITS_CONEHEAD,              "reanim\\Zombie_Credits_Conehead.reanim", 0},
	{ ReanimationType::REANIM_CREDITS_ZOMBIEARMY1,                  "reanim\\Credits_ZombieArmy1.reanim", 0},
	{ ReanimationType::REANIM_CREDITS_ZOMBIEARMY2,                  "reanim\\Credits_ZombieArmy2.reanim", 0},
	{ ReanimationType::REANIM_CREDITS_TOMBSTONES,                   "reanim\\Credits_Tombstones.reanim", 0},
	{ ReanimationType::REANIM_CREDITS_SOLARPOWER,                   "reanim\\Credits_SolarPower.reanim", 0},
	{ ReanimationType::REANIM_CREDITS_ANYHOUR,                      "reanim\\Credits_Anyhour.reanim",                   3 },
	{ ReanimationType::REANIM_CREDITS_WEARETHEUNDEAD,               "reanim\\Credits_WeAreTheUndead.reanim", 0},
	{ ReanimationType::REANIM_CREDITS_DISCOLIGHTS,                  "reanim\\Credits_DiscoLights.reanim", 0},
	{ ReanimationType::REANIM_FLAG,                                 "reanim\\Zombie_FlagPole.reanim",                   0 },
	{ ReanimationType::REANIM_DANCER,                               "reanim\\Zombie_disco.reanim",						0 }, // @Patoke: GOTY has different reanim name
	{ ReanimationType::REANIM_BACKUP_DANCER,                        "reanim\\Zombie_backup.reanim",                     0 }, // @Patoke: GOTY has different reanim name
	{ ReanimationType::REANIM_ZOMBATAR_HEAD,                        "reanim\\zombatar_zombie_head.reanim", 0}, // @Patoke: GOTY has different reanim name
};

//0x471540
ReanimatorTransform::ReanimatorTransform() :
	mTransX(DEFAULT_FIELD_PLACEHOLDER),
	mTransY(DEFAULT_FIELD_PLACEHOLDER),
	mSkewX(DEFAULT_FIELD_PLACEHOLDER),
	mSkewY(DEFAULT_FIELD_PLACEHOLDER),
	mScaleX(DEFAULT_FIELD_PLACEHOLDER),
	mScaleY(DEFAULT_FIELD_PLACEHOLDER),
	mFrame(DEFAULT_FIELD_PLACEHOLDER),
	mAlpha(DEFAULT_FIELD_PLACEHOLDER),
	mImageRegion{},
	mFont(nullptr),
	mText(nullptr) { }

inline void ReanimationFillInMissingData(float& thePrev, float& theValue)
{
	if (theValue == DEFAULT_FIELD_PLACEHOLDER)
		theValue = thePrev;  // 若当前帧上的值未设定，则以前一帧的数值赋值当前帧
	else
		thePrev = theValue;  // 否则，将当前帧的数据记录为“前一帧的数据”
}

inline void ReanimationFillInMissingData(void*& thePrev, void*& theValue)
{
	if (theValue == nullptr)
		theValue = thePrev;
	else
		thePrev = theValue;
}

//0x4715F0 : (*def, eax = string& fileName)  //esp -= 0x4
//0x471620
static void ReanimationFillTrackPlaceholders(ReanimatorDefinition* theDefinition)
{
	for (int aTrackIndex = 0; aTrackIndex < theDefinition->mTracks.count; aTrackIndex++)
	{
		ReanimatorTrack* aTrack = &theDefinition->mTracks.tracks[aTrackIndex];
		float aPrevTransX = 0.0f;
		float aPrevTransY = 0.0f;
		float aPrevSkewX = 0.0f;
		float aPrevSkewY = 0.0f;
		float aPrevScaleX = 1.0f;
		float aPrevScaleY = 1.0f;
		float aPrevFrame = 0.0f;
		float aPrevAlpha = 1.0f;
		DefinitionImageRegion aPrevImageRegion{};
		_Font* aPrevFont = nullptr;
		const char* aPrevText = nullptr;

		// 遍历每一帧，依次用前一帧的数据填充后一帧的未定义数据，并重新记录前一帧的数据
		for (int i = 0; i < aTrack->mTransforms.count; i++)
		{
			ReanimatorTransform& aTransform = aTrack->mTransforms.mTransforms[i];
			ReanimationFillInMissingData(aPrevTransX, aTransform.mTransX);
			ReanimationFillInMissingData(aPrevTransY, aTransform.mTransY);
			ReanimationFillInMissingData(aPrevSkewX, aTransform.mSkewX);
			ReanimationFillInMissingData(aPrevSkewY, aTransform.mSkewY);
			ReanimationFillInMissingData(aPrevScaleX, aTransform.mScaleX);
			ReanimationFillInMissingData(aPrevScaleY, aTransform.mScaleY);
			ReanimationFillInMissingData(aPrevFrame, aTransform.mFrame);
			ReanimationFillInMissingData(aPrevAlpha, aTransform.mAlpha);
			if (aTransform.mImageRegion.mWidth == 0)
				aTransform.mImageRegion = aPrevImageRegion;
			else
				aPrevImageRegion = aTransform.mImageRegion;
			ReanimationFillInMissingData((void*&)aPrevFont, (void*&)aTransform.mFont);
			if (aTransform.mText == nullptr)
				aTransform.mText = aPrevText;
			else
				aPrevText = aTransform.mText;
		}
	}
}

// ====================================================================================================
// V5 definitions bind one resident atlas; IDT5 frames carry inline rectangles.
// The outer cookie and atlas prefix reject older records.
// ====================================================================================================
static constexpr std::uint32_t gReanimV5Cookie = 0xDEADFED9u;
static constexpr std::uint32_t gReanimPayloadMagic = 0x35544449u;  // 'IDT5'
static void ReanimationFreeDefinition(ReanimatorDefinition* theDefinition);

namespace
{
// IDT3 段表 side storage：每定义（轨道索引 -> 段列表，按 trackIndex 升序 push）。
struct AttacherSegmentRT final
{
	std::uint32_t trackIndex;    // 所属 attacher 轨道（查找过滤用）
	std::uint32_t startFrame;
	std::uint32_t endFrame;      // 不含
	std::uint32_t targetType;    // ReanimationType 数值（即 gReanimatorDefArray 下标）
	std::uint32_t actionTrackId; // ReanimTrackId（0 = 无动作切换）
	float rate;
	std::uint32_t loop;          // 0=Loop 1=PlayOnceAndHold 2=PlayOnce
	std::uint32_t textRunStart;
	std::uint32_t textRunEnd;    // Exclusive inherited routing-text run, independent of segment visibility.
	// 动作帧域解析缓存：(帧始,帧数) = f(targetType, actionTrackId) 是段的纯函数，
	// 全实例共享。mActionFrameStart=-1 表示未解析（首个使用该段的 tick 解析一次）。
	int mActionFrameStart = -1;
	int mActionFrameCount = -1;
};
}  // namespace
static std::vector<AttacherSegmentRT> gAttacherSegments[(int)ReanimationType::NUM_REANIMS];
// def 级 attacher 位掩码：kReanimAttacherMasks（编译期常量，转写 reanimc
// compile-v2 发射的 kAttacherMaskByType——原始轨道表计算，含同 id 重复轨道；
// 2026-10-06 起不再需要任何装载期补位）

static std::uint32_t ReanimCrc32(const std::uint8_t* theData, const std::size_t theSize)
{
	static std::uint32_t aTable[256];
	static bool aReady = false;
	if (!aReady)
	{
		for (std::uint32_t i = 0; i < 256; i++)
		{
			std::uint32_t aValue = i;
			for (int aBit = 0; aBit < 8; aBit++)
				aValue = (aValue & 1) ? (0xEDB88320u ^ (aValue >> 1)) : (aValue >> 1);
			aTable[i] = aValue;
		}
		aReady = true;
	}
	std::uint32_t aCrc = 0xFFFFFFFFu;
	for (std::size_t i = 0; i < theSize; i++)
		aCrc = aTable[(aCrc ^ theData[i]) & 0xFF] ^ (aCrc >> 8);
	return aCrc ^ 0xFFFFFFFFu;
}

// The compiler's font symbol table currently contains one numeric binding.
static constexpr std::uint32_t kReanimFontSymbolCount = 1;

namespace
{
std::string ReanimationDefinitionV5Path(ReanimationType theReanimType)
{
	return DefinitionCompiledPath(gReanimationParamArray[(int)theReanimType].mReanimFileName);
}

// IDT5 phases: numeric transforms, numeric resources plus optional UI captions,
// then numeric attacher segments with inherited routing-text run bounds.
bool ReanimationTryLoadDefinitionV5(ReanimationType theReanimType, ReanimatorDefinition* theDefinition)
{
	TOD_ASSERT(theReanimType >= 0 && theReanimType < (ReanimationType)gReanimatorDefCount);
	const std::string aV5Path = ReanimationDefinitionV5Path(theReanimType);
	std::unique_ptr<PFILE, decltype(&p_fclose)> aFile(DefinitionOpenCompiledFile(aV5Path.c_str()), &p_fclose);
	if (aFile == nullptr)
	{
		TodErrorMessageBox(StrFormat("reanim v5 record missing for type %u: %s",
			(unsigned)theReanimType, aV5Path.c_str()).c_str(), "Error");
		exit(0);
	}

	ReanimatorDefinition aReady;
	const auto dispose = [](ReanimatorDefinition* def) { ReanimationFreeDefinition(def); };
	std::unique_ptr<ReanimatorDefinition, decltype(dispose)> aOwner(&aReady, dispose);
	const auto fail = [&](const char* why) -> bool {
		aOwner.reset();
		TodErrorMessageBox(StrFormat("reanim v5 record corrupt (%s): %s", why, aV5Path.c_str()).c_str(), "Error");
		exit(0);
	};
	if (p_fseek(aFile.get(), 0, 2) != 0) return fail("seek failed");
	const long aSize = p_ftell(aFile.get());
	if (aSize < 40 || p_fseek(aFile.get(), 0, 0) != 0) return fail("invalid record size or rewind failed");
	std::vector<std::uint8_t> aBytes(static_cast<std::size_t>(aSize));
	if (p_fread(aBytes.data(), 1, aBytes.size(), aFile.get()) != aBytes.size())
		return fail("record unreadable");
	aFile.reset();

	std::uint32_t aCookie = 0, aDeclared = 0, aStoredCrc = 0;
	memcpy(&aCookie, aBytes.data(), 4);
	memcpy(&aDeclared, aBytes.data() + 4, 4);
	memcpy(&aStoredCrc, aBytes.data() + 8, 4);
	if (aCookie != gReanimV5Cookie) return fail("cookie mismatch");
	if (aBytes.size() - 12 != aDeclared) return fail("payload size mismatch");
	const std::uint8_t* p = aBytes.data() + 12;
	const std::size_t aPayloadSize = aBytes.size() - 12;
	if (ReanimCrc32(p, aPayloadSize) != aStoredCrc) return fail("payload crc mismatch");

	std::size_t at = 0;
	try { aReady.mAtlas=DefinitionLoadAtlas({p,aPayloadSize},at,0x35564152u); }
	catch (const std::exception& error) { return fail(error.what()); }
	const auto take32 = [&](std::uint32_t& v) -> bool {
		if (aPayloadSize - at < 4) return false;
		memcpy(&v, p + at, 4);
		at += 4;
		return true;
	};
	std::uint32_t aMagic = 0, aTableHash = 0, aImageHash = 0, aFontHash = 0;
	if (!take32(aMagic) || !take32(aTableHash) || !take32(aImageHash) || !take32(aFontHash))
		return fail("truncated header");
	if (aMagic != gReanimPayloadMagic) return fail("payload magic mismatch (IDT5 required)");
	if (aTableHash != PVZ_REANIM_TRACK_TABLE_HASH) return fail("track table hash mismatch");
	if (aImageHash != 0 || aFontHash != TodFontSymbolRegistryHash())
		return fail("resource registry hash mismatch");

	std::uint32_t aFpsBits = 0, aTrackCount = 0;
	if (!take32(aFpsBits) || !take32(aTrackCount)) return fail("truncated definition header");
	memcpy(&aReady.mFPS, &aFpsBits, 4);
	if (!std::isfinite(aReady.mFPS) || aReady.mFPS <= 0.0f) return fail("invalid fps");
	if (aTrackCount == 0 || aTrackCount > kReanimActiveMaskCapacityBits ||
		aTrackCount > (aPayloadSize - at) / 16 || aTrackCount > INT_MAX / sizeof(ReanimatorTrack))
		return fail("track count outside supported range");
	aReady.mTracks.tracks = (ReanimatorTrack*)DefinitionAlloc(static_cast<int>(aTrackCount * sizeof(ReanimatorTrack)));
	aReady.mTracks.count = static_cast<int>(aTrackCount);
	for (std::uint32_t t = 0; t < aTrackCount; ++t)
		new (&aReady.mTracks.tracks[t]) ReanimatorTrack();
	std::vector<std::uint32_t> aTextModes(aTrackCount);

	// Phase 1: {id, frameCount, elemSize32, textMode} plus unchanged 8xf32 transforms.
	for (std::uint32_t t = 0; t < aTrackCount; ++t)
	{
		ReanimatorTrack& aTrack = aReady.mTracks.tracks[t];
		std::uint32_t aTrackId = 0, aFrameCount = 0, aTransformElement = 0;
		if (!take32(aTrackId) || !take32(aFrameCount) || !take32(aTransformElement) || !take32(aTextModes[t]))
			return fail("truncated track header");
		if (aTrackId > PVZ_REANIM_TRACK_ID_COUNT) return fail("track id out of range");
		if (aTransformElement != 32) return fail("compact transform element size mismatch");
		if (aTextModes[t] > 1) return fail("invalid track text mode");
		aTrack.mTrackId = static_cast<ReanimTrackId>(aTrackId);
		if (ReanimTrackRanges::attacher__.Contains(aTrack.mTrackId) && aTextModes[t] != 0)
			return fail("attacher track cannot contain UI text");
		if (aFrameCount == 0 || aFrameCount > INT_MAX / sizeof(ReanimatorTransform) ||
			aFrameCount > (aPayloadSize - at) / 32)
			return fail("frame count outside supported range");
		aTrack.mTransforms.mTransforms = (ReanimatorTransform*)DefinitionAlloc(static_cast<int>(aFrameCount * sizeof(ReanimatorTransform)));
		aTrack.mTransforms.count = static_cast<int>(aFrameCount);
		for (std::uint32_t f = 0; f < aFrameCount; ++f)
		{
			ReanimatorTransform& aTransform = aTrack.mTransforms.mTransforms[f];
			new (&aTransform) ReanimatorTransform();
			float* const aFields[8] = {
				&aTransform.mTransX, &aTransform.mTransY, &aTransform.mSkewX, &aTransform.mSkewY,
				&aTransform.mScaleX, &aTransform.mScaleY, &aTransform.mFrame, &aTransform.mAlpha};
			for (float* aField : aFields)
			{
				std::uint32_t aValue = 0;
				if (!take32(aValue)) return fail("truncated frame values");
				memcpy(aField, &aValue, 4);
				if (!std::isfinite(*aField)) return fail("nonfinite frame value");
			}
		}
	}

	// Phase 2: inline atlas rectangles and font IDs; mode 1 adds captions.
	for (std::uint32_t t = 0; t < aTrackCount; ++t)
	{
		ReanimatorTrack& aTrack = aReady.mTracks.tracks[t];
		for (int f = 0; f < aTrack.mTransforms.count; ++f)
		{
			ReanimatorTransform& aTransform = aTrack.mTransforms.mTransforms[f];
			try { aTransform.mImageRegion=DefinitionReadImageRegion({p,aPayloadSize},at,aReady.mAtlas); }
			catch (const std::exception& error) { return fail(error.what()); }
			std::uint32_t aFontSymbol = 0;
			if (!take32(aFontSymbol)) return fail("truncated frame font reference");
			if (aFontSymbol > kReanimFontSymbolCount) return fail("font symbol out of range");
			if (aFontSymbol != 0)
			{
				aTransform.mFont = TodDefinitionLoadFontById(aFontSymbol);
				if (aTransform.mFont == nullptr) return fail("font bind failed");
			}
			if (aTextModes[t] == 1)
			{
				std::uint32_t aLength = 0;
				if (!take32(aLength) || aLength >= INT_MAX || aLength > aPayloadSize - at)
					return fail("invalid UI caption length");
				if (aLength != 0)
				{
					if (memchr(p + at, '\0', aLength)) return fail("embedded NUL in UI caption");
					char* aCopy = (char*)DefinitionAlloc(static_cast<int>(aLength + 1));
					memcpy(aCopy, p + at, aLength);
					aCopy[aLength] = '\0';
					aTransform.mText = aCopy;
				}
				at += aLength;
			}
		}
	}

	// Phase 3: ordered attacher tracks, tuple8 {start,end,target,action,rate,loop,runStart,runEnd}.
	std::vector<AttacherSegmentRT> aSegments;
	std::uint32_t aSegmentTrackCount = 0, aPreviousTrack = 0;
	if (!take32(aSegmentTrackCount)) return fail("truncated attacher segment header");
	if (aSegmentTrackCount > aTrackCount || aSegmentTrackCount > (aPayloadSize - at) / 8)
		return fail("attacher segment track count out of range");
	for (std::uint32_t s = 0; s < aSegmentTrackCount; ++s)
	{
		std::uint32_t aTrackIndex = 0, aSegmentCount = 0;
		if (!take32(aTrackIndex) || !take32(aSegmentCount)) return fail("truncated attacher track header");
		if (aTrackIndex >= aTrackCount || (s != 0 && aTrackIndex <= aPreviousTrack))
			return fail("attacher track indices invalid or unordered");
		aPreviousTrack = aTrackIndex;
		const ReanimatorTrack& aTrack = aReady.mTracks.tracks[aTrackIndex];
		if (!ReanimTrackRanges::attacher__.Contains(aTrack.mTrackId) || aTextModes[aTrackIndex] != 0)
			return fail("segment assigned to non-attacher track");
		if (aSegmentCount > (unsigned)aTrack.mTransforms.count || aSegmentCount > (aPayloadSize - at) / 32)
			return fail("attacher segment count out of range");
		std::uint32_t aPreviousEnd = 0;
		for (std::uint32_t g = 0; g < aSegmentCount; ++g)
		{
			AttacherSegmentRT aSeg;
			aSeg.trackIndex = aTrackIndex;
			std::uint32_t aRateBits = 0;
			if (!take32(aSeg.startFrame) || !take32(aSeg.endFrame) || !take32(aSeg.targetType) ||
				!take32(aSeg.actionTrackId) || !take32(aRateBits) || !take32(aSeg.loop) ||
				!take32(aSeg.textRunStart) || !take32(aSeg.textRunEnd))
				return fail("truncated attacher segment");
			memcpy(&aSeg.rate, &aRateBits, 4);
			if (aSeg.startFrame >= aSeg.endFrame || aSeg.endFrame > (unsigned)aTrack.mTransforms.count ||
				(g != 0 && aSeg.startFrame < aPreviousEnd)) return fail("invalid attacher segment bounds");
			if (aSeg.textRunStart > aSeg.startFrame || aSeg.textRunEnd < aSeg.endFrame ||
				aSeg.textRunStart >= aSeg.textRunEnd || aSeg.textRunEnd > (unsigned)aTrack.mTransforms.count)
				return fail("invalid attacher text-run bounds");
			if (aSeg.targetType != (std::uint32_t)ReanimationType::REANIM_NONE && aSeg.targetType >= gReanimatorDefCount)
				return fail("attacher target type out of range");
			if (aSeg.actionTrackId > PVZ_REANIM_TRACK_ID_COUNT || aSeg.loop > 2 || !std::isfinite(aSeg.rate))
				return fail("invalid attacher action, loop or rate");
			aPreviousEnd = aSeg.endFrame;
			aSegments.push_back(aSeg);
		}
	}
	if (at != aPayloadSize) return fail("trailing payload bytes");

	ReanimationFillTrackPlaceholders(&aReady);
	try { DefinitionBindAtlas(aReady.mAtlas,aV5Path); }
	catch (const std::exception& error) { return fail(error.what()); }
	*theDefinition = std::move(aReady);
	aOwner.release();
	gAttacherSegments[(int)theReanimType] = std::move(aSegments);
	return true;
}
}  // namespace


//0x4717D0
static void ReanimationFreeDefinition(ReanimatorDefinition* theDefinition)
{
	for (int aTrackIndex = 0; aTrackIndex < theDefinition->mTracks.count; ++aTrackIndex)
	{
		ReanimatorTrack& aTrack = theDefinition->mTracks.tracks[aTrackIndex];
		const char* aPreviousText = nullptr;
		for (int i = 0; i < aTrack.mTransforms.count; ++i)
		{
			ReanimatorTransform& aTransform = aTrack.mTransforms.mTransforms[i];
			const char* const aText = aTransform.mText;
			// Every explicit caption owns its allocation; placeholder inheritance shares
			// it only with subsequent frames in this run. Compare before dereferencing
			// so inherited pointers are never read after the allocation is freed.
			if (aText != aPreviousText && aText != nullptr && *aText != '\0')
				delete[] const_cast<char*>(aText);
			aPreviousText = aText;
			aTransform.mText = nullptr;
		}
		delete[] reinterpret_cast<char*>(aTrack.mTransforms.mTransforms);
		aTrack.mTransforms = {nullptr, 0};
	}
	delete[] reinterpret_cast<char*>(theDefinition->mTracks.tracks);
	theDefinition->mTracks = {nullptr, 0};
	theDefinition->mAtlas={};
}

//0x471890
ReanimatorTrackInstance::ReanimatorTrackInstance()
{
	mBlendCounter = 0;
	mBlendTime = 0;
	mShakeOverride = 0.0f;
	mShakeX = 0.0f;
	mShakeY = 0.0f;
	mAttachmentID = AttachmentID::ATTACHMENTID_NULL;
	mRenderGroup = RENDER_GROUP_NORMAL;
	mIgnoreClipRect = false;
	mImageOverride = nullptr;
	mTruncateDisappearingFrames = true;
	mTrackColor = Color::White;
	mIgnoreColorOverride = false;
	mIgnoreExtraAdditiveColor = false;
}

//0x471920
// ── P4 掩码位操作（2026-10-02）：位=轨道下标 ──
inline void ReanimSetActiveBit(Reanimation& r, int theTrackIndex)
{
	r.mActiveMask[theTrackIndex >> 6] |= 1ull << (theTrackIndex & 63);
}
inline void ReanimClearActiveBit(Reanimation& r, int theTrackIndex)
{
	r.mActiveMask[theTrackIndex >> 6] &= ~(1ull << (theTrackIndex & 63));
}
// 分组占用：0..31 置位；负值（HIDDEN=-1）不占可绘分组。只置不清——
// 空分组多跑一遍无害，漏位才丢绘制。
inline void ReanimOccupyGroupBit(Reanimation& r, int theRenderGroup)
{
	if ((unsigned)theRenderGroup < 32u)
		r.mGroupOccMask |= 1u << theRenderGroup;
}

// P4 编译期锚：生成表与掩码存储容量一致（改版超限在此编译错，抬升
// Reanimator.h 的 kReanimActiveMaskCapacityBits 即可）
static_assert(kMaxReanimTracks <= kReanimActiveMaskCapacityBits, "reanim tracks exceed activity mask capacity - raise kReanimActiveMaskCapacityBits");
static_assert(kReanimAttacherMaskWords <= kReanimActiveMaskWords, "generated attacher mask wider than storage");

Reanimation::Reanimation()
{
	mAnimTime = 0;
	mAnimRate = 12.0f;
	mDefinition = nullptr;
	mLoopType = ReanimLoopType::REANIM_PLAY_ONCE;
	mLastFrameTime = -1.0f;
	mDead = false;
	mFrameStart = 0;
	mFrameCount = 0;
	mFrameBasePose = -1;
	for (uint64_t& aWord : mActiveMask)
		aWord = 0;
	mGroupOccMask = 0;
	mOverlayMatrix.LoadIdentity();
	mColorOverride = Color::White;
	mExtraAdditiveColor = Color::White;
	mEnableExtraAdditiveDraw = false;
	mExtraOverlayColor = Color::White;
	mEnableExtraOverlayDraw = false;
	mLoopCount = 0;
	mIsAttachment = false;
	mRenderOrder = 0;
	mReanimationHolder = nullptr;
	mTrackInstances = nullptr;
	mFilterEffect = FilterEffect::FILTER_EFFECT_NONE;
	mReanimationType = ReanimationType::REANIM_NONE;
}

//0x471A20
Reanimation::~Reanimation()
{
	ReanimationDie();
	ReanimationDelete();
}

void Reanimation::ReanimationDelete()
{
	TOD_ASSERT(mDead);
	if (mTrackInstances != nullptr)
	{
		int aItemSize = mDefinition->mTracks.count * sizeof(ReanimatorTrackInstance);
		FindGlobalAllocator(aItemSize)->Free(mTrackInstances, aItemSize);  // 由 TodAllocator 回收动画轨道的内存区域
		mTrackInstances = nullptr;
	}
}

//0x471A60
void Reanimation::ReanimationInitializeType(float theX, float theY, ReanimationType theReanimType)
{
	TOD_ASSERT(theReanimType >= 0 && theReanimType < gReanimatorDefCount);
	ReanimatorEnsureDefinitionLoaded(theReanimType, false);
	mReanimationType = theReanimType;
	ReanimationInitialize(theX, theY, &gReanimatorDefArray[(int)theReanimType]);
}

void ReanimationPreload(ReanimationType theReanimationType)
{
	TOD_ASSERT(theReanimationType >= 0 && theReanimationType < gReanimatorDefCount);

	ReanimatorEnsureDefinitionLoaded(theReanimationType,true);
}

void Reanimation::ReanimationInitialize(float theX, float theY, ReanimatorDefinition* theDefinition)
{
	TOD_ASSERT(mTrackInstances == nullptr);
	mDead = false;
	mOverlayMatrix.m02 = theX;
	mOverlayMatrix.m12 = theY;
	mDefinition = theDefinition;
	mAnimRate = theDefinition->mFPS;
	mLastFrameTime = -1.0f;

	if (theDefinition->mTracks.count != 0)
	{
		mFrameCount = mDefinition->mTracks.tracks[0].mTransforms.count;
		int aItemSize = theDefinition->mTracks.count * sizeof(ReanimatorTrackInstance);
		mTrackInstances = (ReanimatorTrackInstance*)FindGlobalAllocator(aItemSize)->Calloc(aItemSize);  // 申请动画轨道实例数组所需的内存
		for (int aTrackIndex = 0; aTrackIndex < mDefinition->mTracks.count; aTrackIndex++)  // 遍历初始化数组中每个轨道实例
		{
			ReanimatorTrackInstance* aTrack = &mTrackInstances[aTrackIndex];
			if (aTrack != nullptr)
				new (aTrack)ReanimatorTrackInstance();
		}
	}
	else
		mFrameCount = 0;

	// P4 派生掩码：新实例全零活动；轨道 ctor 全 RENDER_GROUP_NORMAL → 组 0 占位。
	// 超 256 轨（掩码字宽外）：全 1 高估——Update 自愈首帧收敛为精确位，
	// 行为等价原全扫（mod 超大 reanim 不破，仅退回全扫性能）
	if (theDefinition->mTracks.count > 256)
	{
		for (uint64_t& aWord : mActiveMask)
			aWord = ~0ull;
	}
	else
	{
		for (uint64_t& aWord : mActiveMask)
			aWord = 0;
	}
	mGroupOccMask = (theDefinition->mTracks.count != 0) ? (1u << 0) : 0u;
}

//0x471BC0
// GOTY @Patoke: 0x4761C0
void Reanimation::Update()
{
	if (mFrameCount == 0 || mDead)
		return;

	TOD_ASSERT(_finite(mAnimRate));
	mLastFrameTime = mAnimTime;  // 更新上一帧的循环率
	mAnimTime += SECONDS_PER_UPDATE * Sexy::gUpdateTicks * mAnimRate / mFrameCount;

	// 循环推进：模式按 ReanimLoopType 槽位直查（行序 = 枚举序 0..5），
	// 正放/倒放归一为边界方向参数——原两段镜像 switch 合并为单路径。
	static constexpr uint8_t kLoopMode[] = {
		0,  // REANIM_LOOP                               回卷循环
		0,  // REANIM_LOOP_FULL_LAST_FRAME               回卷循环
		1,  // REANIM_PLAY_ONCE                          截断置亡
		2,  // REANIM_PLAY_ONCE_AND_HOLD                 截断保持
		1,  // REANIM_PLAY_ONCE_FULL_LAST_FRAME          截断置亡
		2,  // REANIM_PLAY_ONCE_FULL_LAST_FRAME_AND_HOLD 截断保持
	};
	static_assert(sizeof(kLoopMode) / sizeof(kLoopMode[0]) == (int)ReanimLoopType::REANIM_PLAY_ONCE_FULL_LAST_FRAME_AND_HOLD + 1,
		"循环模式槽位须与 ReanimLoopType 枚举同步");
	const bool aForward = mAnimRate > 0;
	const float aBoundary = aForward ? 1.0f : 0.0f;
	const bool aPast = aForward ? mAnimTime >= aBoundary : mAnimTime < aBoundary;
	switch (kLoopMode[mLoopType])
	{
	case 0:  // 回卷循环
		while (aForward ? mAnimTime >= aBoundary : mAnimTime < aBoundary)
		{
			mLoopCount++;
			mAnimTime += aForward ? -1.0f : 1.0f;
		}
		break;
	case 1:  // 截断置亡
		if (aPast)
		{
			mLoopCount = 1;
			mAnimTime = aBoundary;
			mDead = true;
		}
		break;
	case 2:  // 截断保持
		if (aPast)
		{
			mLoopCount = 1;
			mAnimTime = aBoundary;
		}
		break;
	default:
		TOD_ASSERT(false);
		break;
	}

	// P4 掩码轨道环：活动位（blend/shake/attach）与 def 级 attacher 位求或
	// 驱动；零即整实体跳过（bench_reanim_trackwalk：112B×N 步长全扫的
	// 11%~22%）。按位索引访问，体与原全量环逐字同序；访问发现三值全零则
	// 自愈清本位（attacher 常量位在生成表，不受影响；陈旧
	// 置位仅浪费一次空访，方向安全）。
	{
		TOD_ASSERT((unsigned)mReanimationType < (unsigned)kReanimAttacherTypeCount);
		const std::uint64_t* aAttacher = kReanimAttacherMasks[(int)mReanimationType];
		uint64_t aWords[kReanimActiveMaskWords];
		for (int w = 0; w < kReanimActiveMaskWords; w++)
			aWords[w] = mActiveMask[w] | (w < kReanimAttacherMaskWords ? aAttacher[w] : 0);
		for (int aWordIdx = 0; aWordIdx < 4; aWordIdx++)
		while (aWords[aWordIdx] != 0)
		{
			const int aTrackIndex = aWordIdx * 64 + (int)std::countr_zero(aWords[aWordIdx]);
			aWords[aWordIdx] &= aWords[aWordIdx] - 1;
			ReanimatorTrackInstance* aTrack = &mTrackInstances[aTrackIndex];
			bool aAnyActive = false;
			if (aTrack->mBlendCounter > 0)
			{
				aTrack->mBlendCounter--;  // 更新轨道的混合倒计时
				aAnyActive = true;
			}

			if (aTrack->mShakeOverride != 0.0f)  // 更新轨道震动
			{
				aTrack->mShakeX = RandRangeFloat(-aTrack->mShakeOverride, aTrack->mShakeOverride);
				aTrack->mShakeY = RandRangeFloat(-aTrack->mShakeOverride, aTrack->mShakeOverride);
				aAnyActive = true;
			}

			if (ReanimTrackRanges::attacher__.Contains(static_cast<ReanimTrackId>(ReanimatorTrackIdAt(mReanimationType, aTrackIndex))))  // IsAttacher：编译期 id 区间，两次整数比较
				UpdateAttacherTrack(aTrackIndex);

			if (aTrack->mAttachmentID != AttachmentID::ATTACHMENTID_NULL)
			{
				SexyTransform2D aOverlayMatrix;
				GetAttachmentOverlayMatrix(aTrackIndex, aOverlayMatrix);
				AttachmentUpdateAndSetMatrix(aTrack->mAttachmentID, aOverlayMatrix);
				aAnyActive = true;
			}

			if (!aAnyActive)
				ReanimClearActiveBit(*this, aTrackIndex);  // 自愈：陈旧位收敛
		}
	}
}

// P4 掩码联动：Attachment.cpp 的 CreateEffectAttachment 漏斗调用——引用
// 多直指某 reanim 轨道实例的 mAttachmentID 字段（Zombie.cpp 头盔/旗帜/
// 盾牌等 17 处直挂），按"池=真值"反查引用归属并置活动位；局部变量引用
//（smoke 夹具）无归属则空过。清位方向由 Update 自愈承担。
void ReanimMarkAttachmentIdRefOwner(AttachmentID& theAttachmentID)
{
	if (gEffectSystem == nullptr || gEffectSystem->mReanimationHolder == nullptr)
		return;
	Reanimation* aReanim = nullptr;
	auto& aPool = gEffectSystem->mReanimationHolder->mReanimations;
	while (aPool.IterateNext(aReanim))
	{
		if (aReanim->mTrackInstances == nullptr || aReanim->mDefinition == nullptr)
			continue;
		const int aCount = aReanim->mDefinition->mTracks.count;
		for (int i = 0; i < aCount; i++)
			if (&aReanim->mTrackInstances[i].mAttachmentID == &theAttachmentID)
			{
				ReanimSetActiveBit(*aReanim, i);
				return;
			}
	}
}

// P4：按轨道字段现值精确重建两掩码（存档读回 / 夹具直写字段后调用；
// 派生态不入盘）。分组位只收 0..31，HIDDEN(-1) 天然不占。
void Reanimation::RebuildTrackActivityMasks()
{
	for (uint64_t& aWord : mActiveMask)
		aWord = 0;
	mGroupOccMask = 0;
	if (mTrackInstances == nullptr)
		return;
	const int aCount = mDefinition->mTracks.count;
	for (int i = 0; i < aCount; i++)
	{
		const ReanimatorTrackInstance& aTrack = mTrackInstances[i];
		if (aTrack.mBlendCounter > 0 || aTrack.mShakeOverride != 0.0f ||
			aTrack.mAttachmentID != AttachmentID::ATTACHMENTID_NULL)
			ReanimSetActiveBit(*this, i);
		ReanimOccupyGroupBit(*this, aTrack.mRenderGroup);
	}
}

//0x471E50
static void BlendTransform(ReanimatorTransform* theResult, const ReanimatorTransform& theTransform1, const ReanimatorTransform& theTransform2, float theBlendFactor)
{
	theResult->mTransX = FloatLerp(theTransform1.mTransX, theTransform2.mTransX, theBlendFactor);
	theResult->mTransY = FloatLerp(theTransform1.mTransY, theTransform2.mTransY, theBlendFactor);
	theResult->mScaleX = FloatLerp(theTransform1.mScaleX, theTransform2.mScaleX, theBlendFactor);
	theResult->mScaleY = FloatLerp(theTransform1.mScaleY, theTransform2.mScaleY, theBlendFactor);
	theResult->mAlpha = FloatLerp(theTransform1.mAlpha, theTransform2.mAlpha, theBlendFactor);

	float aSkewX2 = theTransform2.mSkewX;
	float aSkewY2 = theTransform2.mSkewY;
	// 推测这里原意是为了确保从两个变换之间的倾斜角度不超过 π（WP 版），
	// 原版（以及内测版）实际为，倾斜超过 π 时 theTransform2 变换无效
	while (aSkewX2 > theTransform1.mSkewX + 180.0f)
		aSkewX2 = theTransform1.mSkewX;  // （aSkewX2 -= 360.0f）
	while (aSkewX2 < theTransform1.mSkewX - 180.0f)
		aSkewX2 = theTransform1.mSkewX;  // （aSkewX2 += 360.0f）
	while (aSkewY2 > theTransform1.mSkewY + 180.0f)
		aSkewY2 = theTransform1.mSkewY;  // （aSkewY2 -= 360.0f）
	while (aSkewY2 < theTransform1.mSkewY - 180.0f)
		aSkewY2 = theTransform1.mSkewY;  // （aSkewY2 += 360.0f）

	theResult->mSkewX = FloatLerp(theTransform1.mSkewX, aSkewX2, theBlendFactor);
	theResult->mSkewY = FloatLerp(theTransform1.mSkewY, aSkewY2, theBlendFactor);
	theResult->mFrame = theTransform1.mFrame;
	theResult->mFont = theTransform1.mFont;
	theResult->mText = theTransform1.mText;
	theResult->mImageRegion = theTransform1.mImageRegion;
}

//0x471F90
// GOTY @Patoke: 0x476580
void Reanimation::GetCurrentTransform(int theTrackIndex, ReanimatorTransform* theTransformCurrent, const ReanimatorFrameTime* theFrameTime)
{
	ReanimatorFrameTime aFrameTime;
	if (theFrameTime == nullptr)
	{
		GetFrameTime(&aFrameTime);
		theFrameTime = &aFrameTime;
	}
	GetTransformAtTime(theTrackIndex, theTransformCurrent, theFrameTime);  // 结合两帧之间的自然补间取得基础变换
	
	ReanimatorTrackInstance* aTrack = &mTrackInstances[theTrackIndex];
	if (FloatRoundToInt(theTransformCurrent->mFrame) >= 0 && aTrack->mBlendCounter > 0)  // 若当前不为空白帧且轨道处于变换混合过程中
	{
		float aBlendFactor = aTrack->mBlendCounter.LegacyTicks() / (float)aTrack->mBlendTime;
		BlendTransform(theTransformCurrent, *theTransformCurrent, aTrack->mBlendTransform, aBlendFactor);  // 结合覆写变换计算混合后的实际变换
	}
}

//0x472020
void Reanimation::GetTransformAtTime(int theTrackIndex, ReanimatorTransform* theTransform, const ReanimatorFrameTime* theFrameTime)
{
	TOD_ASSERT(theTrackIndex >= 0 && theTrackIndex < mDefinition->mTracks.count);
	ReanimatorTrack* aTrack = &mDefinition->mTracks.tracks[theTrackIndex];
	TOD_ASSERT(aTrack->mTransforms.count == mDefinition->mTracks.tracks[0].mTransforms.count);
	ReanimatorTransform& aTransBefore = aTrack->mTransforms.mTransforms[theFrameTime->mAnimFrameBeforeInt];  // 前一帧的变换定义
	ReanimatorTransform& aTransAfter = aTrack->mTransforms.mTransforms[theFrameTime->mAnimFrameAfterInt];  // 后一帧的变换定义

	theTransform->mTransX = FloatLerp(aTransBefore.mTransX, aTransAfter.mTransX, theFrameTime->mFraction);
	theTransform->mTransY = FloatLerp(aTransBefore.mTransY, aTransAfter.mTransY, theFrameTime->mFraction);
	theTransform->mSkewX = FloatLerp(aTransBefore.mSkewX, aTransAfter.mSkewX, theFrameTime->mFraction);
	theTransform->mSkewY = FloatLerp(aTransBefore.mSkewY, aTransAfter.mSkewY, theFrameTime->mFraction);
	theTransform->mScaleX = FloatLerp(aTransBefore.mScaleX, aTransAfter.mScaleX, theFrameTime->mFraction);
	theTransform->mScaleY = FloatLerp(aTransBefore.mScaleY, aTransAfter.mScaleY, theFrameTime->mFraction);
	theTransform->mAlpha = FloatLerp(aTransBefore.mAlpha, aTransAfter.mAlpha, theFrameTime->mFraction);
	theTransform->mImageRegion = aTransBefore.mImageRegion;
	theTransform->mFont = aTransBefore.mFont;
	theTransform->mText = aTransBefore.mText;

	if (aTransBefore.mFrame != -1.0f && aTransAfter.mFrame == -1.0f && theFrameTime->mFraction > 0.0f && mTrackInstances[theTrackIndex].mTruncateDisappearingFrames)
		theTransform->mFrame = -1.0f;  // 当从一个非空白帧过渡至空白帧时，若轨道设置了截断消失帧，则删去过渡的过程
	else
		theTransform->mFrame = aTransBefore.mFrame;
}

//0x4720F0
void Reanimation::MatrixFromTransform(const ReanimatorTransform& theTransform, SexyMatrix3& theMatrix)
{
	// 将倾斜的角度转化为弧度（P5-⑥：Fast 三角，域 ±60° 天然在 [-π,π]）。
	// P5-② 零倾斜短路曾落于此：⑥ FastSin（1.05ns）落地后交替 A/B 三轮
	// （ON 459.9/472.0 vs OFF 458.7 p50）带内重合——短路分支已被更通用的
	// 快三角覆盖，撤除（省一个分支，全输入单一路径）
	float aSkewX = -DEG_TO_RAD(theTransform.mSkewX);
	float aSkewY = -DEG_TO_RAD(theTransform.mSkewY);

	theMatrix.m00 = FastCos(aSkewX) * theTransform.mScaleX;
	theMatrix.m10 = -FastSin(aSkewX) * theTransform.mScaleX;
	theMatrix.m20 = 0.0f;
	theMatrix.m01 = FastSin(aSkewY) * theTransform.mScaleY;
	theMatrix.m11 = FastCos(aSkewY) * theTransform.mScaleY;
	theMatrix.m21 = 0.0f;
	theMatrix.m02 = theTransform.mTransX;
	theMatrix.m12 = theTransform.mTransY;
	theMatrix.m22 = 1.0f;
}

//0x472190
void Reanimation::ReanimBltMatrix(Graphics* g, Image* theImage, SexyMatrix3& theTransform, const Rect& theClipRect, const Color& theColor, int theDrawMode, const Rect& theSrcRect)
{
	if (!gSexyAppBase->mDDInterface->mIs3D &&  // 未开启 3D 硬件加速
		TestBit(gReanimationParamArray[(int)mReanimationType].mReanimParamFlags, ReanimFlags::FastDrawInSwModeBit) &&  // 动画允许使用软件渲染
		FloatApproxEqual(theTransform.m01, 0.0f) && FloatApproxEqual(theTransform.m10, 0.0f) &&  // 横向和纵向的倾斜值均为 0
		theTransform.m00 > 0.0f && theTransform.m11 > 0.0f &&  // 横向和纵向的拉伸值均大于 0
		theColor == Color::White)
	{
		float aScaleX = theTransform.m00;
		float aScaleY = theTransform.m11;
		int aPosX = FloatRoundToInt(theTransform.m02 - aScaleX * theSrcRect.mWidth * 0.5f);
		int aPosY = FloatRoundToInt(theTransform.m12 - aScaleY * theSrcRect.mHeight * 0.5f);
		int aOldMode = g->mDrawMode;  // 备份原绘制模式
		g->mDrawMode = theDrawMode;
		Rect aOldClipRect = g->mClipRect;  // 备份原裁剪矩形
		float aOldTransX = g->mTransX;
		float aOldTransY = g->mTransY;
		// The transform already contains the Graphics translation.  DrawImage
		// applies that translation again, so temporarily remove it here to avoid
		// double-shifting large axis-aligned reanim images during a page slide.
		g->mTransX = 0.0f;
		g->mTransY = 0.0f;
		g->mClipRect = theClipRect;

		if (FloatApproxEqual(aScaleX, 1.0f) && FloatApproxEqual(aScaleY, 1.0f))  // 如果无拉伸
			g->DrawImage(theImage, aPosX, aPosY, theSrcRect);
		else
		{
			int aWidth = FloatRoundToInt(aScaleX * theSrcRect.mWidth);
			int aHeight = FloatRoundToInt(aScaleY * theSrcRect.mHeight);
			Rect aDestRect(aPosX, aPosY, aWidth, aHeight);
			g->DrawImage(theImage, aDestRect, theSrcRect);
		}

		g->mDrawMode = aOldMode;  // 还原绘制模式
		g->mTransX = aOldTransX;
		g->mTransY = aOldTransY;
		g->mClipRect = aOldClipRect;  // 还原裁剪矩形
	}
	else
		TodBltMatrix(g, theImage, theTransform, theClipRect, theColor, theDrawMode, theSrcRect);
}

//0x4723B0
// GOTY @Patoke: 0x4769B0
bool Reanimation::DrawTrack(Graphics* g, int theTrackIndex, int theRenderGroup, const ReanimatorFrameTime* theFrameTime)
{
	(void)theRenderGroup;
	ReanimatorTransform aTransform;
	ReanimatorTrackInstance* aTrackInstance = &mTrackInstances[theTrackIndex];  // 目标轨道的指针
	GetCurrentTransform(theTrackIndex, &aTransform, theFrameTime);  // 取得当前动画变换
	int aImageFrame = FloatRoundToInt(aTransform.mFrame);  // 图像在贴图中所处的份数
	if (aImageFrame < 0)  // 不存在图像时，返回
		return false;

	Color aColor = aTrackInstance->mTrackColor;
	if (!aTrackInstance->mIgnoreColorOverride)  // 除非轨道无视动画的覆写颜色
	{
		aColor = ColorsMultiply(aColor, mColorOverride);  // 将轨道颜色与动画的覆写颜色进行正片叠底混合
	}
	if (g->mColorizeImages)  // 若 Graphics 着色
	{
		aColor = ColorsMultiply(aColor, g->mColor);  // 将颜色再与 Graphics 的颜色进行正片叠底混合
	}
	int aImageAlpha = ClampInt(FloatRoundToInt(aTransform.mAlpha * aColor.mAlpha), 0, 255);
	if (aImageAlpha <= 0)  // 当图像完全透明时，返回
	{
		return false;
	}
	aColor.mAlpha = aImageAlpha;

	Color aExtraAdditiveColor;
	if (mEnableExtraAdditiveDraw)  // 如果动画启用额外叠加颜色（高亮）
	{
		aExtraAdditiveColor = mExtraAdditiveColor;
		aExtraAdditiveColor.mAlpha = ColorComponentMultiply(mExtraAdditiveColor.mAlpha, aImageAlpha);
	}
	Color aExtraOverlayColor;
	if (mEnableExtraOverlayDraw)
	{
		aExtraOverlayColor = mExtraOverlayColor;
		aExtraOverlayColor.mAlpha = ColorComponentMultiply(mExtraOverlayColor.mAlpha, aImageAlpha);
	}

	Rect aClipRect = g->mClipRect;
	if (aTrackInstance->mIgnoreClipRect)  // 如果轨道无视裁剪矩形
	{
		aClipRect = Rect(0, 0, BOARD_WIDTH, BOARD_HEIGHT);  // 裁剪矩形重置为屏幕矩形
	}

	const auto& aRegion = aTransform.mImageRegion;
	Image* aImage = aRegion.mWidth ? mDefinition->mAtlas.image.get() : nullptr;
	int aCelWidth = 0, aCelHeight = 0;
	SexyMatrix3 aMatrix;
	bool aFullScreen = false;
	if (aImage != nullptr)
	{
		aCelWidth = aRegion.mWidth / aRegion.mCols;
		aCelHeight = aRegion.mHeight / aRegion.mRows;
		aMatrix.LoadIdentity();
		SexyMatrix3Translation(aMatrix, aCelWidth * 0.5f, aCelHeight * 0.5f);  // 将矩阵变换的坐标设定在贴图的中心位置
	}
	else if (aTransform.mFont != nullptr && aTransform.mText != nullptr)  // 如果存在字体且文本不为空
	{
		aMatrix.LoadIdentity();
		int aWidth = aTransform.mFont->StringWidth(aTransform.mText);
		SexyMatrix3Translation(aMatrix, -aWidth * 0.5f, aTransform.mFont->mAscent);
	}
	else
	{
		if (!ReanimRenderSemantics::IsFullscreenTrack(
		        static_cast<ReanimTrackId>(ReanimatorTrackIdAt(mReanimationType, theTrackIndex))))  // 原版为完整名称比较，不匹配 fullscreen2
			return false;  // 无需绘制
		aFullScreen = true;  // 标记全屏轨道，后续会填充一个屏幕大小的矩形
	}

	SexyMatrix3 aTransformMatrix;
	MatrixFromTransform(aTransform, aTransformMatrix);
	SexyMatrix3Multiply(aMatrix, aTransformMatrix, aMatrix);  // 以动画变换矩阵作用 aMatrix
	SexyMatrix3Multiply(aMatrix, mOverlayMatrix, aMatrix);  // 以动画覆写矩阵作用 aMatrix
	SexyMatrix3Translation(aMatrix, aTrackInstance->mShakeX + g->mTransX - 0.5f, aTrackInstance->mShakeY + g->mTransY - 0.5f);  // 轨道震动及 g 的影响

	if (aImage != nullptr)
	{
		int aColumns = aRegion.mCols;
		int aSourceX = aRegion.mX, aSourceY = aRegion.mY;
		if (aTrackInstance->mImageOverride != nullptr)  // 如果轨道存在覆写贴图
		{
			aImage = aTrackInstance->mImageOverride;  // 将贴图替换为覆写贴图
			aColumns = aImage->mNumCols;
			aCelWidth = aImage->GetCelWidth();
			aCelHeight = aImage->GetCelHeight();
			aSourceX = aSourceY = 0;
		}
		if (mFilterEffect != FilterEffect::FILTER_EFFECT_NONE)  // 如果动画存在滤镜
		{
			aImage = FilterEffectGetImage(aImage, mFilterEffect);  // 将贴图替换为滤镜后的贴图
		}
		while (aImageFrame >= aColumns)
		{
			aImageFrame -= aColumns;  // 确保绘制的列数不会超过贴图最后一列
		}

		Rect aSrcRect(aSourceX + aImageFrame * aCelWidth, aSourceY, aCelWidth, aCelHeight);
		ReanimBltMatrix(g, aImage, aMatrix, aClipRect, aColor, g->mDrawMode, aSrcRect);  // 带矩阵绘制轨道图像
		if (mEnableExtraAdditiveDraw)
		{
			ReanimBltMatrix(g, aImage, aMatrix, aClipRect, aExtraAdditiveColor, Graphics::DRAWMODE_ADDITIVE, aSrcRect);
		}
		if (mEnableExtraOverlayDraw)
		{
			Image* aOverlayImage = FilterEffectGetImage(aImage, FilterEffect::FILTER_EFFECT_WHITE);
			ReanimBltMatrix(g, aOverlayImage, aMatrix, aClipRect, aExtraOverlayColor, Graphics::DRAWMODE_NORMAL, aSrcRect);
		}
	}
	else if (aTransform.mFont != nullptr && aTransform.mText != nullptr)  // 如果不存在图像但存在文本
	{
		TodDrawStringMatrix(g, aTransform.mFont, aMatrix, aTransform.mText, aColor);
		if (mEnableExtraAdditiveDraw)
		{
			int aOldMode = g->mDrawMode;  // 备份绘制模式
			g->mDrawMode = Graphics::DRAWMODE_ADDITIVE;
			TodDrawStringMatrix(g, aTransform.mFont, aMatrix, aTransform.mText, aExtraAdditiveColor);
			g->mDrawMode = aOldMode;  // 还原绘制模式
		}
	}
	else if (aFullScreen)  // 不存在图像和文本，但是全屏
	{
		Color aOldColor = g->mColor;  // 备份颜色
		g->mColor = aColor;
		// Fullscreen is a destination-space fill, like fullscreen particles.
		// FillRect applies translation and the effective clip itself.
		g->FillRect(-g->mTransX, -g->mTransY,
			g->mDestImage->mWidth, g->mDestImage->mHeight);
		g->mColor = aOldColor;  // 还原颜色
	}
	return true;
}

//0x472C00
void Reanimation::GetTrackMatrix(int theTrackIndex, SexyTransform2D& theMatrix)
{
	ReanimatorTrackInstance* aTrackInstance = &mTrackInstances[theTrackIndex];
	ReanimatorTransform aTransform;
	GetCurrentTransform(theTrackIndex, &aTransform);
	int aImageFrame = FloatRoundToInt(aTransform.mFrame);
	const auto* aRegion = &aTransform.mImageRegion;

	theMatrix.LoadIdentity();
	if (aRegion->mWidth != 0 && aImageFrame >= 0)
	{
		int aCelWidth = aRegion->mWidth / aRegion->mCols;
		int aCelHeight = aRegion->mHeight / aRegion->mRows;
		SexyMatrix3Translation(theMatrix, aCelWidth * 0.5f, aCelHeight * 0.5f);  // 将矩阵变换的坐标设定在贴图的中心位置
	}
	else if (aTransform.mFont != nullptr && aTransform.mText != nullptr)
		SexyMatrix3Translation(theMatrix, 0.0f, aTransform.mFont->mAscent);

	SexyTransform2D aTransformMatrix;
	MatrixFromTransform(aTransform, aTransformMatrix);
	SexyMatrix3Multiply(theMatrix, aTransformMatrix, theMatrix);  // 以动画变换矩阵作用 theMatrix
	SexyMatrix3Multiply(theMatrix, mOverlayMatrix, theMatrix);  // 以动画覆写矩阵作用 theMatrix
	SexyMatrix3Translation(theMatrix, aTrackInstance->mShakeX - 0.5f, aTrackInstance->mShakeY - 0.5f);  // 轨道震动的影响
}

//0x472D90
void Reanimation::GetFrameTime(ReanimatorFrameTime* theFrameTime)
{
	TOD_ASSERT(mFrameStart + mFrameCount <= mDefinition->mTracks.tracks[0].mTransforms.count);
	int aFrameCount;
	if (mLoopType == ReanimLoopType::REANIM_PLAY_ONCE_FULL_LAST_FRAME || mLoopType == ReanimLoopType::REANIM_LOOP_FULL_LAST_FRAME ||
		mLoopType == ReanimLoopType::REANIM_PLAY_ONCE_FULL_LAST_FRAME_AND_HOLD)
		aFrameCount = mFrameCount;
	else
		aFrameCount = mFrameCount - 1;
	float aAnimPosition = mFrameStart + mAnimTime * aFrameCount;
	float aAnimFrameBefore = floor(aAnimPosition);
	theFrameTime->mFraction = aAnimPosition - aAnimFrameBefore;
	theFrameTime->mAnimFrameBeforeInt = FloatRoundToInt(aAnimFrameBefore);
	if (theFrameTime->mAnimFrameBeforeInt >= mFrameStart + mFrameCount - 1)  // 如果当前处于结束的一帧
	{
		theFrameTime->mAnimFrameBeforeInt = mFrameStart + mFrameCount - 1;
		theFrameTime->mAnimFrameAfterInt = theFrameTime->mAnimFrameBeforeInt;  // 将前、后的整数帧均赋值为最后一帧
	}
	else
		theFrameTime->mAnimFrameAfterInt = theFrameTime->mAnimFrameBeforeInt + 1;  // 后一整数帧等于前一整数帧的后一帧
	TOD_ASSERT(theFrameTime->mAnimFrameBeforeInt >= 0 && theFrameTime->mAnimFrameAfterInt < mDefinition->mTracks.tracks[0].mTransforms.count);
}

//0x472E40

void Reanimation::DrawRenderGroup(Graphics* g, int theRenderGroup)
{
	if (mDead)
		return;

	ReanimatorFrameTime aFrameTime;
	bool aHasFrameTime = false;
	for (int aTrackIndex = 0; aTrackIndex < mDefinition->mTracks.count; aTrackIndex++)
	{
		ReanimatorTrackInstance* aTrackInstance = &mTrackInstances[aTrackIndex];
		if (aTrackInstance->mRenderGroup == theRenderGroup)
		{
			// Every matching track in this draw uses the same animation clock.
			// Keep this lazy: an empty/nonmatching group never indexed frame data
			// in 1073 either. Attachments calculate their own independent time.
			if (!aHasFrameTime)
			{
				GetFrameTime(&aFrameTime);
				aHasFrameTime = true;
			}
			bool aTrackDrawn = DrawTrack(g, aTrackIndex, theRenderGroup, &aFrameTime);
			if (aTrackInstance->mAttachmentID != AttachmentID::ATTACHMENTID_NULL)
			{
				AttachmentDraw(aTrackInstance->mAttachmentID, g, !aTrackDrawn);
			}
		}
	}
}

void Reanimation::Draw(Graphics* g)
{
	// GOTY 1073 FUN_00477490 draws every supported render group in order.
	// The older reconstructed path drew only group zero, which made attached
	// Zombatar heads lose every selected component: their tracks intentionally
	// occupy groups 2, 4, 6, 8, 10 and 12 to preserve layer ordering.
	// P4：按分组占用掩码遍历（原 0..17 全扫；空分组整遍跳过——GOTY 18 组
	// 仅 Zombatar 部件用 2..12，常态仅组 0 占用，bench 2.1×）
	uint32_t aGroups = mGroupOccMask & ((1u << 18) - 1u);
	while (aGroups != 0)
	{
		const unsigned aRenderGroup = (unsigned)std::countr_zero(aGroups);
		aGroups &= aGroups - 1;
		DrawRenderGroup(g, (int)aRenderGroup);
	}
}

//0x472F30
// GOTY @Patoke: 0x477640
int Reanimation::FindTrackIndex(ReanimTrackId theTrackId)
{
	const int aTrackIndex = ReanimatorTrackIndexOf(mReanimationType, theTrackId);
	if (aTrackIndex < 0)
	{
		// 1073 原版此处 TodTrace 后返回 0（静默回轨道 0），是查错轨道这类
		// bug 的掩盖器；现改为硬错退出。正确性由 bench 全域穷举对拍背书
		//（全部已装载定义的合法 (type,id) 查询零 miss）。需要"查不到则
		// 无操作"语义的调用点应使用 TrackExists 预判。
		TodErrorMessageBox(StrFormat(
				"FindTrackIndex: track id=%u not in reanim type %d ('%s')\n"
				"Caller bug — no silent fallback to track 0 anymore.",
				(unsigned)theTrackId, (int)mReanimationType,
			(int)mReanimationType >= 0 && (int)mReanimationType < (int)gReanimatorDefCount
				? gReanimationParamArray[(int)mReanimationType].mReanimFileName
				: "<def freed>").c_str(), "Error");
		exit(0);
	}
	return aTrackIndex;
}

// GOTY @Patoke: 0x464B18
ReanimatorTrackInstance* Reanimation::GetTrackInstanceByName(ReanimTrackId theTrackId)
{
	return &mTrackInstances[FindTrackIndex(theTrackId)];
}

ReanimTrackId Reanimation::GetTrackId(int theTrackIndex) const
{
	if (mDefinition == nullptr || mDefinition->mTracks.tracks == nullptr ||
		(unsigned)theTrackIndex >= (unsigned)mDefinition->mTracks.count)
		return ReanimTrackId::None;
	return mDefinition->mTracks.tracks[theTrackIndex].mTrackId;
}

//0x472F80
void Reanimation::AttachToAnotherReanimation(Reanimation* theAttachReanim, ReanimTrackId theTrackId)
{
	if (theAttachReanim->mDefinition->mTracks.count <= 0)
		return;

	if (theAttachReanim->mFrameBasePose == -1)
		theAttachReanim->mFrameBasePose = theAttachReanim->mFrameStart;  // 将当前动作的起始帧作为变换基准帧
	const int aTrackIndex = theAttachReanim->FindTrackIndex(theTrackId);
	AttachReanim(theAttachReanim->mTrackInstances[aTrackIndex].mAttachmentID, this, 0.0f, 0.0f);
	ReanimSetActiveBit(*theAttachReanim, aTrackIndex);  // P4：挂附件置位
}

void Reanimation::SetBasePoseFromAnim(ReanimTrackId theTrackId)
{
	int aFrameStart, aFrameCount;
	GetFramesForLayer(theTrackId, aFrameStart, aFrameCount);
	mFrameBasePose = aFrameStart;  // 将当前轨道动画的起始帧作为变换基准帧
}

//0x472FD0
void Reanimation::GetTrackBasePoseMatrix(int theTrackIndex, SexyTransform2D& theBasePosMatrix)
{
	if (mFrameBasePose == NO_BASE_POSE)
	{
		theBasePosMatrix.LoadIdentity();
		return;
	}

	int aBasePos = mFrameBasePose == -1 ? mFrameStart : mFrameBasePose;
	ReanimatorFrameTime aStartTime = { 0.0f, aBasePos, aBasePos + 1 };
	ReanimatorTransform aTransformStart;
	GetTransformAtTime(theTrackIndex, &aTransformStart, &aStartTime);
	MatrixFromTransform(aTransformStart, theBasePosMatrix);
}

//0x473070
AttachEffect* Reanimation::AttachParticleToTrack(ReanimTrackId theTrackId, TodParticleSystem* theParticleSystem, float thePosX, float thePosY)
{
	int aTrackIndex = FindTrackIndex(theTrackId);
	ReanimatorTrackInstance* aTrackInstance = &mTrackInstances[aTrackIndex];
	SexyTransform2D aBasePoseMatrix;
	GetTrackBasePoseMatrix(aTrackIndex, aBasePoseMatrix);  // 取得轨道基础形态的变换矩阵
	SexyVector2 aPosition = aBasePoseMatrix * SexyVector2(thePosX, thePosY);  // 以基础形态的矩阵变换位置向量
	AttachEffect* aEffect = AttachParticle(aTrackInstance->mAttachmentID, theParticleSystem, aPosition.x, aPosition.y);
	ReanimSetActiveBit(*this, aTrackIndex);  // P4：挂附件置位（空挂失败由自愈收敛）
	return aEffect;
}

//0x473110
// GOTY @Patoke: 0x477810
void Reanimation::GetAttachmentOverlayMatrix(int theTrackIndex, SexyTransform2D& theOverlayMatrix)
{
	ReanimatorTransform aTransform;
	GetCurrentTransform(theTrackIndex, &aTransform);  // 取得含混合、不含覆写的自然变换
	SexyTransform2D aTransformMatrix;
	MatrixFromTransform(aTransform, aTransformMatrix);
	SexyMatrix3Multiply(aTransformMatrix, mOverlayMatrix, aTransformMatrix);  // 以动画覆写矩阵作用于动画变换矩阵

	SexyTransform2D aBasePoseMatrix;
	GetTrackBasePoseMatrix(theTrackIndex, aBasePoseMatrix);  // 取得轨道基础形态的变换矩阵
	SexyTransform2D aBasePoseMatrixInv;
	SexyMatrix3Inverse(aBasePoseMatrix, aBasePoseMatrixInv);  // 取得基础形态矩阵的逆
	theOverlayMatrix = aTransformMatrix * aBasePoseMatrixInv;
}

//0x4731D0
void Reanimation::GetFramesForLayer(ReanimTrackId theTrackId, int& theFrameStart, int& theFrameCount)
{
	// 原版对 0 轨道定义先回 (0,0)：现语料全部 144 定义均非空（smoke:
	// defs=144 tracks=2641），空定义上的层查询按调用点 bug 硬错（FindTrackIndex）。
	GetFramesForTrackIndex(FindTrackIndex(theTrackId), theFrameStart, theFrameCount);
}

void Reanimation::GetFramesForTrackIndex(int theTrackIndex, int& theFrameStart, int& theFrameCount)
{
	TOD_ASSERT(theTrackIndex >= 0 && theTrackIndex < mDefinition->mTracks.count);
	ReanimatorTrack* aTrack = &mDefinition->mTracks.tracks[theTrackIndex];
	theFrameStart = 0;
	theFrameCount = 1;
	for (int i = 0; i < aTrack->mTransforms.count; i++)
		if (aTrack->mTransforms.mTransforms[i].mFrame >= 0.0f)
		{
			theFrameStart = i;  // 取轨道上的首个非空白帧作为起始帧
			break;
		}
	for (int j = theFrameStart; j < aTrack->mTransforms.count; j++)
		if (aTrack->mTransforms.mTransforms[j].mFrame >= 0.0f)
			theFrameCount = j - theFrameStart + 1;  // 取从起始帧至轨道最后一个非空白帧之间为帧数量
}

//0x473280
void Reanimation::SetFramesForLayer(ReanimTrackId theTrackId)
{
	// 原 0 轨道定义传 0 的分支已删（"count==0 ? 0 : FindTrackIndex"）：
	// 空定义上的层查询是调用点 bug，miss 由 FindTrackIndex 硬错。
	SetFramesForLayerIndex(FindTrackIndex(theTrackId));
}

// index 直达版：时间复位逻辑自 SetFramesForLayer 原样抽出，id 版内部共用。
void Reanimation::SetFramesForLayerIndex(int theTrackIndex)
{
	if (mAnimRate >= 0)
		mAnimTime = 0.0f;
	else
		mAnimTime = 0.9999999f;
	mLastFrameTime = -1.0f;
	if (mDefinition->mTracks.count == 0)  // 如果动画没有轨道
	{
		mFrameStart = 0;
		mFrameCount = 0;
		return;
	}
	GetFramesForTrackIndex(theTrackIndex, mFrameStart, mFrameCount);
}

//0x4732C0
bool Reanimation::TrackExists(ReanimTrackId theTrackId)
{
	return ReanimatorTrackIndexOf(mReanimationType, theTrackId) >= 0;
}

//0x473310
void Reanimation::StartBlend(int theBlendTime)
{
	for (int aTrackIndex = 0; aTrackIndex < mDefinition->mTracks.count; aTrackIndex++)
	{
		ReanimatorTransform aTransform;
		GetCurrentTransform(aTrackIndex, &aTransform);
		if (FloatRoundToInt(aTransform.mFrame) >= 0)  // 若当前轨道当前不处于空白帧
		{
			ReanimatorTrackInstance* aTrackInstance = &mTrackInstances[aTrackIndex];
			aTrackInstance->mBlendTransform = aTransform;  // 记录当前变换为混合的初始（源）变换
			aTrackInstance->mBlendTime = theBlendTime;
			aTrackInstance->mBlendCounter = theBlendTime;
			ReanimSetActiveBit(*this, aTrackIndex);  // P4：混合置位；归零后由 Update 自愈清位
			aTrackInstance->mBlendTransform.mFont = nullptr;
			aTrackInstance->mBlendTransform.mText = nullptr;
			aTrackInstance->mBlendTransform.mImageRegion = {};
		}
	}
}

//0x4733F0
void Reanimation::ReanimationDie()
{
	if (!mDead)
	{
		mDead = true;
		if (mDefinition == nullptr)
			return;
		for (int aTrackIndex = 0; aTrackIndex < mDefinition->mTracks.count; aTrackIndex++)
		{
			TOD_ASSERT(mTrackInstances);
			AttachmentDie(mTrackInstances[aTrackIndex].mAttachmentID);
		}
	}
}

void Reanimation::SetShakeOverride(ReanimTrackId theTrackId, float theShakeAmount)
{
	const int aTrackIndex = FindTrackIndex(theTrackId);
	mTrackInstances[aTrackIndex].mShakeOverride = theShakeAmount;
	ReanimSetActiveBit(*this, aTrackIndex);  // P4：置位；归零由 Update 自愈
}

//0x473470
Image* Reanimation::GetImageOverride(ReanimTrackId theTrackId)
{
	return GetTrackInstanceByName(theTrackId)->mImageOverride;
}

//0x473490
// GOTY @Patoke: 0x477BB0
void Reanimation::SetImageOverride(ReanimTrackId theTrackId, Image* theImage)
{
	GetTrackInstanceByName(theTrackId)->mImageOverride = theImage;
}

//0x4734B0
void Reanimation::SetTruncateDisappearingFrames(ReanimTrackId theTrackId, bool theTruncateDisappearingFrames)
{
	GetTrackInstanceByName(theTrackId)->mTruncateDisappearingFrames = theTruncateDisappearingFrames;
}

void Reanimation::SetTruncateDisappearingFramesAll(bool theTruncateDisappearingFrames)
{
	for (int aTrackIndex = 0; aTrackIndex < mDefinition->mTracks.count; aTrackIndex++)  // 依次设置每一轨道
		mTrackInstances[aTrackIndex].mTruncateDisappearingFrames = theTruncateDisappearingFrames;
}

void ReanimationHolder::DisposeHolder()
{
	mReanimations.DataArrayDispose();
}

//0x473500
ReanimationHolder::~ReanimationHolder()
{
	DisposeHolder();
}

void ReanimationHolder::InitializeHolder()
{
	mReanimations.DataArrayInitialize(1024U, DataArrayKind::Reanimations);
}

//0x473590
Reanimation* ReanimationHolder::AllocReanimation(float theX, float theY, int theRenderOrder, ReanimationType theReanimationType)
{
	TOD_ASSERT(mReanimations.mSize != mReanimations.mMaxSize);
	Reanimation* aReanim = mReanimations.DataArrayAlloc();
	aReanim->mRenderOrder = theRenderOrder;
	aReanim->mReanimationHolder = this;
	aReanim->ReanimationInitializeType(theX, theY, theReanimationType);
	return aReanim;
}

//0x4735E0
void ReanimatorEnsureDefinitionLoaded(ReanimationType theReanimType, bool theIsPreloading)
{
	TOD_ASSERT(theReanimType >= 0 && theReanimType < gReanimatorDefCount);
	ReanimatorDefinition* aReanimDef = &gReanimatorDefArray[(int)theReanimType];
	if (aReanimDef->mTracks.tracks != nullptr)  // 如果轨道指针不为空指针，说明定义数据已经加载
		return;
	ReanimationParams* aReanimParams = &gReanimationParamArray[(int)theReanimType];
	if (theIsPreloading)
	{
		if (gSexyAppBase->mShutdown || gAppCloseRequest())  // 预加载时若程序退出，则取消加载
			return;
	}
	// V5 records are required for every definition; missing/corrupt data is fatal.
	if (!ReanimationTryLoadDefinitionV5(theReanimType, aReanimDef))
	{
		TodErrorMessageBox(StrFormat(
			"reanim definition unavailable without v5 record: type=%d ('%s')",
			(int)theReanimType, aReanimParams->mReanimFileName).c_str(), "Error");
		exit(0);
	}
}

//0x473750
void ReanimatorLoadDefinitions(ReanimationParams* theReanimationParamArray, int theReanimationParamArraySize)
{
	TOD_ASSERT(!gReanimationParamArray && !gReanimatorDefArray);
	// Do not publish a nonzero count/null array if allocation throws.
	auto* aDefinitions = new ReanimatorDefinition[theReanimationParamArraySize];
	gReanimationParamArraySize = theReanimationParamArraySize;
	gReanimationParamArray = theReanimationParamArray;
	gReanimatorDefCount = theReanimationParamArraySize;
	gReanimatorDefArray = aDefinitions;

	// P4：attacher 位掩码已前移编译期（generated/ReanimAttacherMasks.h，
	// 由 MPHF 头 + attacher__ 区间生成；reanimc 重跑经 CMake 依赖联动再生）
	TOD_ASSERT(theReanimationParamArraySize <= kReanimAttacherTypeCount);

	// 2026-10-09 锁核黑屏案拆分：全量 def 装载（以下原循环）挪到装载线程的
	// ReanimatorLoadAllDefinitionData——原在此处同步跑（1GHz 单核 100-600ms
	// ×N，主线程跑完前画不出任何帧=装载屏黑 7-9 秒）。本函数现只做分配，
	// 调用方（LawnApp::Init）随后单独预载装载条那一个 def（sprout）。
}

// Decode definitions and their owned atlas PNGs on the loading thread.
// 就绪门（原子）：UploadAll（主线程 gate）在装载线程写 def 条目期间
// 禁止遍历，防数据竞争（tracks 指针半写窗口）。
static std::atomic<bool> gReanimatorAllDefinitionDataLoaded{false};

void ReanimatorLoadAllDefinitionData()
{
	if (gReanimatorDefArray == nullptr || gReanimationParamArray == nullptr)
		return;

	for (unsigned int i = 0; i < gReanimatorDefCount; i++)
	{
		ReanimationParams* aReanimationParams = &gReanimationParamArray[i];
		TOD_ASSERT(aReanimationParams->mReanimationType == i);
		const std::string aV5Path = ReanimationDefinitionV5Path(aReanimationParams->mReanimationType);
		std::unique_ptr<PFILE, decltype(&p_fclose)> aFile(p_fopen(aV5Path.c_str(), "rb"), &p_fclose);
		if (aFile == nullptr)
			continue;
		aFile.reset();
		ReanimatorEnsureDefinitionLoaded(aReanimationParams->mReanimationType, true);
	}
	gReanimatorAllDefinitionDataLoaded.store(true, std::memory_order_release);

}

void ReanimatorPreloadAll()
{
	if (gReanimatorDefArray == nullptr || gReanimationParamArray == nullptr)
		return;

	for (unsigned int i = 0; i < gReanimatorDefCount; ++i)
	{
		const ReanimationType aType = (ReanimationType)i;
		ReanimatorEnsureDefinitionLoaded(aType, true);
		ReanimationPreload(aType);
	}
}

int ReanimatorUploadAllTexturesToGPU()
{
	if (gSexyAppBase == nullptr || gSexyAppBase->mDDInterface == nullptr ||
		gSexyAppBase->mDDInterface->mRenderInterface == nullptr ||
		gSexyAppBase->mDDInterface->mRenderInterface->mRenderer == nullptr ||
		gReanimatorDefArray == nullptr)
		return -1;
	// 就绪门：全量定义装载（装载线程）未完成前禁止遍历（tracks 半写窗口）
	if (!gReanimatorAllDefinitionDataLoaded.load(std::memory_order_acquire) ||
		!gParticleAllDefinitionDataLoaded.load(std::memory_order_acquire))
		return -1;

	std::set<Sexy::ResidentImage*> aImages;
	for (unsigned int i = 0; i < gReanimatorDefCount; ++i)
	{
		ReanimatorDefinition& aDefinition = gReanimatorDefArray[i];
		if (aDefinition.mAtlas.image)
			aImages.insert(aDefinition.mAtlas.image.get());
	}
	for (int i=0;i<gParticleDefCount;++i)
		if (gParticleDefArray[i].mAtlas.image)
			aImages.insert(gParticleDefArray[i].mAtlas.image.get());

	Sexy::RenderInterface* aD3D = gSexyAppBase->mDDInterface->mRenderInterface;
	int aUploaded = 0;
	for (Sexy::ResidentImage* aImage : aImages)
	{
		if (aImage == nullptr)
			continue;
		if (aImage->mWidth <= 0 || aImage->mHeight <= 0)
		{
			continue;
		}
		// Source textures remain resident on the GPU; upload releases CPU pixels.
		if (aD3D->CreateImageTexture(aImage))
			++aUploaded;
	}

	return aUploaded;
}

//0x473870
void ReanimatorFreeDefinitions()
{
	for (auto& segs : gAttacherSegments)
		segs.clear();
	for (unsigned int i = 0; i < gReanimatorDefCount; i++)
		ReanimationFreeDefinition(&gReanimatorDefArray[i]);

	delete[] gReanimatorDefArray;
	gReanimatorDefArray = nullptr;
	gReanimatorDefCount = 0;
	gReanimationParamArray = nullptr;
	gReanimationParamArraySize = 0;
}

//0x4738D0
float Reanimation::GetTrackVelocity(ReanimTrackId theTrackId)
{
	ReanimatorFrameTime aFrameTime;
	GetFrameTime(&aFrameTime);
	int aTrackIndex = FindTrackIndex(theTrackId);
	TOD_ASSERT(aTrackIndex >= 0 && aTrackIndex < mDefinition->mTracks.count);

	ReanimatorTrack* aTrack = &mDefinition->mTracks.tracks[aTrackIndex];
	float aDis = aTrack->mTransforms.mTransforms[aFrameTime.mAnimFrameAfterInt].mTransX - aTrack->mTransforms.mTransforms[aFrameTime.mAnimFrameBeforeInt].mTransX;
	return aDis * SECONDS_PER_UPDATE * mAnimRate;  // 瞬时速率 = 两帧间的横坐标之差 * 一帧的时长 * 动画速率
}

//0x473930
bool Reanimation::IsTrackShowing(ReanimTrackId theTrackId)
{
	ReanimatorFrameTime aFrameTime;
	GetFrameTime(&aFrameTime);
	int aTrackIndex = FindTrackIndex(theTrackId);
	TOD_ASSERT(aTrackIndex >= 0 && aTrackIndex < mDefinition->mTracks.count);

	return mDefinition->mTracks.tracks[aTrackIndex].mTransforms.mTransforms[aFrameTime.mAnimFrameAfterInt].mFrame >= 0.0f;  // 返回下一整数帧是否存在图像
}

//0x473980
void Reanimation::ShowOnlyTrack(ReanimTrackId theTrackId)
{
	// Duplicate IDs retain the original all-matching-tracks behavior.
	for (int i = 0; i < mDefinition->mTracks.count; i++)
		mTrackInstances[i].mRenderGroup = mDefinition->mTracks.tracks[i].mTrackId == theTrackId
			? RENDER_GROUP_NORMAL : RENDER_GROUP_HIDDEN;
	ReanimOccupyGroupBit(*this, RENDER_GROUP_NORMAL);  // P4：目标轨占组 0（其余 HIDDEN 不占）
}

//0x4739E0
// GOTY @Patoke: 0x478120
void Reanimation::AssignRenderGroupToTrack(ReanimTrackId theTrackId, int theRenderGroup)
{
	const int aTrackIndex = ReanimatorTrackIndexOf(mReanimationType, theTrackId);
	if (aTrackIndex >= 0)  // 找不到时保持原行为：静默无操作
	{
		mTrackInstances[aTrackIndex].mRenderGroup = theRenderGroup;
		ReanimOccupyGroupBit(*this, theRenderGroup);  // P4：占用置位（只置不清，方向安全）
	}
}

void Reanimation::AssignRenderGroupToRange(const ReanimTrackIdRange& theRange, int theRenderGroup)
{
	for (int i = 0; i < mDefinition->mTracks.count; i++)
	{
		if (theRange.Contains(mDefinition->mTracks.tracks[i].mTrackId))
			mTrackInstances[i].mRenderGroup = theRenderGroup;
	}
	ReanimOccupyGroupBit(*this, theRenderGroup);  // P4：占用置位（只置不清，方向安全）
}

//0x473AE0
void Reanimation::PropogateColorToAttachments()
{
	for (int i = 0; i < mDefinition->mTracks.count; i++)
		AttachmentPropogateColor(
			mTrackInstances[i].mAttachmentID, mColorOverride, mEnableExtraAdditiveDraw, mExtraAdditiveColor, mEnableExtraOverlayDraw, mExtraOverlayColor
		);
}

//0x473B70
bool Reanimation::ShouldTriggerTimedEvent(float theEventTime)
{
	TOD_ASSERT(theEventTime >= 0.0f && theEventTime <= 1.0f);
	if (mFrameCount == 0 || mLastFrameTime <= 0.0f || mAnimRate <= 0.0f)  // 没有动画或倒放或未播放
		return false;

	if (mAnimTime >= mLastFrameTime)  // 一般情况下，可触发的范围为 [mLastFrameTime, mAnimTime]
		return theEventTime >= mLastFrameTime && theEventTime < mAnimTime;
	else  // 若动画正好完成一次循环而重新进入下一次循环，则可触发的范围为 [0, mAnimTime] ∪ [mLastFrameTime, 1]
		return theEventTime >= mLastFrameTime || theEventTime < mAnimTime;
}
//0x473BF0
// GOTY @Patoke: 0x478310
void Reanimation::PlayReanim(ReanimTrackId theTrackId, ReanimLoopType theLoopType, int theBlendTime, float theAnimRate)
{
	if (theBlendTime > 0)  // 当需要补间过渡时，开始混合
		StartBlend(theBlendTime);
	if (theAnimRate != 0.0f)  // 当指定的速率为 0 时，表示不改变原有动画速率
		mAnimRate = theAnimRate;

	mLoopType = theLoopType;
	mLoopCount = 0;
	SetFramesForLayer(theTrackId);
}

//0x473C60
//0x473EB0
void Reanimation::AttacherSynchWalkSpeed(int theTrackIndex, Reanimation* theAttachReanim, int theTextRunStart, int theTextRunEnd)
{
	ReanimatorTrack* aTrack = &mDefinition->mTracks.tracks[theTrackIndex];
	const std::int64_t aParentEnd = static_cast<std::int64_t>(mFrameStart) + mFrameCount;
	const int aPlaceHolderFrameStart = std::max(theTextRunStart, mFrameStart);
	const std::int64_t aRunEnd = std::min<std::int64_t>(theTextRunEnd, aParentEnd);
	if (aPlaceHolderFrameStart < 0 || aRunEnd <= aPlaceHolderFrameStart ||
		aRunEnd > aTrack->mTransforms.count)
	{
		theAttachReanim->mAnimRate = 0.0f;
		return;
	}
	const int aPlaceHolderFrameEnd = static_cast<int>(aRunEnd) - 1;
	int aPlaceHolderFrameCount = aPlaceHolderFrameEnd - aPlaceHolderFrameStart;
	ReanimatorTransform& aPlaceHolderStartTrans = aTrack->mTransforms.mTransforms[aPlaceHolderFrameStart];
	ReanimatorTransform& aPlaceHolderEndTrans = aTrack->mTransforms.mTransforms[aPlaceHolderFrameEnd];
	if (FloatApproxEqual(mAnimRate, 0.0f))  // 如果动画自身的速率为 0
	{
		theAttachReanim->mAnimRate = 0.0f;  // 附属动画的速率也为 0
		return;
	}
	float aPlaceHolderDistance = -(aPlaceHolderEndTrans.mTransX - aPlaceHolderStartTrans.mTransX);  // 占位轨道在当前区间内的位移
	float aPlaceHolderSeconds = aPlaceHolderFrameCount / mAnimRate;  // 占位轨道在当前区间内的时长
	if (FloatApproxEqual(aPlaceHolderSeconds, 0.0f))  // 如果当前所在区间不存在任何帧
	{
		theAttachReanim->mAnimRate = 0.0f;  // 附属动画的速率为 0
		return;
	}

	int aGroundTrackIndex = theAttachReanim->FindTrackIndex(ReanimTrackId::_ground);
	ReanimatorTrack* aGroundTrack = &theAttachReanim->mDefinition->mTracks.tracks[aGroundTrackIndex];
	ReanimatorTransform& aTransformGuyStart = aGroundTrack->mTransforms.mTransforms[theAttachReanim->mFrameStart];
	ReanimatorTransform& aTransformGuyEnd = aGroundTrack->mTransforms.mTransforms[theAttachReanim->mFrameStart + theAttachReanim->mFrameCount - 1];
	float aGuyDistance = aTransformGuyEnd.mTransX - aTransformGuyStart.mTransX;  // 实际动画在完整动作周期内的位移
	if (aGuyDistance < FLT_EPSILON || aPlaceHolderDistance < FLT_EPSILON)  // 如果占位位移为 0 或实际动画周期位移为 0，则附属动画无法移动
	{
		theAttachReanim->mAnimRate = 0.0f;  // 附属动画的速率为 0
		return;
	}

	float aLoops = aPlaceHolderDistance / aGuyDistance;  // 以附属动画目标位移（占位位移）除以其周期位移，得到附属动画需要循环的周期数
	ReanimatorTransform aTransformGuyCurrent;
	theAttachReanim->GetCurrentTransform(aGroundTrackIndex, &aTransformGuyCurrent);
	AttachEffect* aAttachEffect = FindFirstAttachment(mTrackInstances[theTrackIndex].mAttachmentID);
	if (aAttachEffect != nullptr)
	{
		float aGuyCurrentDistance = aTransformGuyCurrent.mTransX - aTransformGuyStart.mTransX;  // 附属动画在其周期内当前已经过的位移
		float aGuyExpectedDistance = aGuyDistance * theAttachReanim->mAnimTime;  // 以匀速运动的占位轨道计算的、附属动画当前的理论位移
		aAttachEffect->mOffset.m02 = aGuyExpectedDistance - aGuyCurrentDistance;  // 调整附属效果的横向变换以使附属动画的位移保持与占位动画一致
	}
	theAttachReanim->mAnimRate = aLoops * theAttachReanim->mFrameCount / aPlaceHolderSeconds;  // 速率 = 需要播放的帧数 ÷ 可以播放的时长
}

//0x4740B0
void Reanimation::UpdateAttacherTrack(int theTrackIndex)
{
	ReanimatorTrackInstance* aTrackInstance = &mTrackInstances[theTrackIndex];
	ReanimatorTransform aTransform;
	GetCurrentTransform(theTrackIndex, &aTransform);  // 供段尾颜色合成的 alpha

	// IDT3：编译期链接的段表。当前帧号 -> 段（少量段线性查找），全部整数。
	ReanimatorFrameTime aFrameTime;
	GetFrameTime(&aFrameTime);
	const std::uint32_t aFrame = static_cast<std::uint32_t>(aFrameTime.mAnimFrameBeforeInt);

	// 1073 FUN_004787D0 的第一判定：GetTransformAtTime 产出的 mFrame 含截断消失帧
	// 规则（before 可见 → after 隐藏且 fraction>0 即强制 -1），解析前先查它。
	// 段表路径必须同样先查：只按整数帧号入段销毁会晚整整一个源帧的插值区间
	// （credits 7fps 下 ≈143ms 残留）。v1 legacy 路径同款检查在函数首。
	// 注意：隐藏帧上的 kill/respawn 循环是 1073 原生编舞（credits 开场 one two
	// three four 每个数一个僵尸在不同挂点弹出），不可保活抑制。
	// 2026-10-06 复审回退：段表驱动生死的版本在 credits 终场产生附件重影
	//（undead 歌手/Zombie12/Zombie22 的 125 拍、大军 217/300 眨拍按整数帧
	// 杀旧挂新，旧子动画未即逝→双歌手+双气泡+红字重影，比大军缺失更糟，
	// 用户裁决回退本判定）。
	if (aTransform.mFrame == -1.0f)
	{
		AttachmentDie(aTrackInstance->mAttachmentID);
		return;
	}

	// 段表空窗 = 继承：源数据里 attacher 编码文本在占位区间内连续重复，
	// 折叠段表内部的空窗是编码过渡的伪影，不是“清除附件”指令；
	// 只有显式 targetType=REANIM_NONE 的段才代表原版的名字解析失败。
	// （与 v1 运行时对拍：v1 在这些帧重复解析同一编码，附件保持。）
	AttacherSegmentRT* aSeg = nullptr;
	for (AttacherSegmentRT& seg : gAttacherSegments[(int)mReanimationType])
		if (seg.trackIndex == static_cast<std::uint32_t>(theTrackIndex) &&
		    seg.startFrame <= aFrame && aFrame < seg.endFrame)
		{
			aSeg = &seg;
			break;
		}
	if (aSeg == nullptr)
		return;  // 继承：保持现有附件不变

	const ReanimationType aReanimationType = static_cast<ReanimationType>(aSeg->targetType);
	if (aReanimationType == ReanimationType::REANIM_NONE)
	{
		AttachmentDie(aTrackInstance->mAttachmentID);  // 清除附件
		return;
	}
	const ReanimTrackId aActionId = static_cast<ReanimTrackId>(aSeg->actionTrackId);
	const float aAnimRate = aSeg->rate;
	const ReanimLoopType aLoopType =
	    aSeg->loop == 1 ? ReanimLoopType::REANIM_PLAY_ONCE_AND_HOLD
	    : aSeg->loop == 2 ? ReanimLoopType::REANIM_PLAY_ONCE
	                      : ReanimLoopType::REANIM_LOOP;

	Reanimation* aAttachReanim = FindReanimAttachment(aTrackInstance->mAttachmentID);
	if (aAttachReanim == nullptr || aAttachReanim->mReanimationType != aReanimationType)  // 如果原先没有附属动画，或原附属动画不是上述设定的动画
	{
		AttachmentDie(aTrackInstance->mAttachmentID);  // 清除原有附件
		aAttachReanim = gEffectSystem->mReanimationHolder->AllocReanimation(0.0f, 0.0f, 0, aReanimationType);  // 重新创建一个指定的动画
		aAttachReanim->mLoopType = aLoopType;
		aAttachReanim->mAnimRate = aAnimRate;
		AttachReanim(aTrackInstance->mAttachmentID, aAttachReanim, 0.0f, 0.0f);
		ReanimSetActiveBit(*this, theTrackIndex);  // P4：attacher 挂附件置位
		mFrameBasePose = NO_BASE_POSE;  // 设定附属动画后，自身不再存在基准帧
	}

	if (aActionId != ReanimTrackId::None)  // 如果定义了附属动画的动作轨道
	{
		int aAnimFrameStart, aAnimFrameCount;
		if (aSeg->mActionFrameStart >= 0)
		{
			// 段级缓存命中：f(targetType, actionTrackId) 是段纯函数，全实例共享
			aAnimFrameStart = aSeg->mActionFrameStart;
			aAnimFrameCount = aSeg->mActionFrameCount;
		}
		else
		{
			aAttachReanim->GetFramesForLayer(aActionId, aAnimFrameStart, aAnimFrameCount);
			aSeg->mActionFrameStart = aAnimFrameStart;
			aSeg->mActionFrameCount = aAnimFrameCount;
		}
		if (aAttachReanim->mFrameStart != aAnimFrameStart || aAttachReanim->mFrameCount != aAnimFrameCount)  // if (!aAttachReanim->IsAnimPlaying(……))
		{
			aAttachReanim->StartBlend(20);
			aAttachReanim->SetFramesForLayer(aActionId);  // 播放指定轨道上的动作
		}

		if (aAttachReanim->mAnimRate == 12.0f && aActionId == ReanimTrackId::anim_walk && aAttachReanim->TrackExists(ReanimTrackId::_ground))
		{
			AttacherSynchWalkSpeed(theTrackIndex, aAttachReanim,
				static_cast<int>(aSeg->textRunStart), static_cast<int>(aSeg->textRunEnd));
		}
		else
			aAttachReanim->mAnimRate = aAnimRate;
		aAttachReanim->mLoopType = aLoopType;
	}

	Color aColor = ColorsMultiply(mColorOverride, aTrackInstance->mTrackColor);
	aColor.mAlpha = ClampInt(FloatRoundToInt(aTransform.mAlpha * aColor.mAlpha), 0, 255);
	AttachmentPropogateColor(aTrackInstance->mAttachmentID, aColor, mEnableExtraAdditiveDraw, mExtraAdditiveColor, mEnableExtraOverlayDraw, mExtraOverlayColor);
}

//0x4745B0
bool Reanimation::IsAnimPlaying(ReanimTrackId theTrackId)
{
	int aFrameStart, aFrameCount;
	GetFramesForLayer(theTrackId, aFrameStart, aFrameCount);
	return mFrameStart == aFrameStart && mFrameCount == aFrameCount;
}

//0x4745F0
Reanimation* Reanimation::FindSubReanim(ReanimationType theReanimType)
{
	if (mReanimationType == theReanimType)
		return this;

	for (int i = 0; i < mDefinition->mTracks.count; i++)
	{
		Reanimation* aReanimation = FindReanimAttachment(mTrackInstances[i].mAttachmentID);
		if (aReanimation != nullptr)
		{
			Reanimation* aSubReanim = aReanimation->FindSubReanim(theReanimType);
			if (aSubReanim != nullptr)
				return aSubReanim;
		}
	}

	return nullptr;
}
