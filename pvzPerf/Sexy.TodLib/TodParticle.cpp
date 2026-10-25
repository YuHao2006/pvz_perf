#include "TodDebug.h"
#include "Definition.h"
#include "TodParticle.h"
#include "EffectSystem.h"
#include "Reanimator.h"
#include "ReanimClock.h"
#include "GameConstants.h"
#include "generated/GeneratedDefinitions.h"
#include "ParticleGpu.h"
#include "graphics/Graphics.h"
#include "graphics/DDInterface.h"
#include "graphics/RenderInterface.h"
#include <stdexcept>
#include <limits>

namespace
{
constexpr unsigned int PARTICLE_POOL_CAPACITY = 1024U;
constexpr std::int64_t ParticleSourceTickNs = 10'000'000;
constexpr std::int64_t ParticleCycle = ParticleClock::Cycle;
double MotionDisplacement(double velocity, double acceleration, double ticks)
{
	// Interpolate the original recurrence v[n+1]=v[n]+a; p[n+1]=p[n]+v[n+1].
	// The +1 preserves its 10ms checkpoints without iterating those checkpoints.
	return ticks * (velocity + acceleration * (ticks + 1) * 0.5);
}
double LifeFraction(std::int64_t age, std::int64_t duration)
{
	return age < 0 ? -1.0 : static_cast<double>(age) /
		std::max<std::int64_t>(1, duration);
}
double ParticleTime(const TodParticle* p) { return LifeFraction(p->mParticleAgeNs, p->mParticleDurationNs); }
double SystemTime(const TodParticleEmitter& e) { return LifeFraction(e.mSystemAgeNs, e.mSystemDurationNs); }
std::uint32_t NextParticleRandom(std::uint32_t& state)
{
	// Explicit state belongs to the effect and is saved with it. No global
	// draws occur during zero-duration or paused updates.
	state = state * 1664525U + 1013904223U;
	return state;
}
float ShakeSample(std::uint32_t seed, std::int64_t age, unsigned axis)
{
	if (age < 0) return 0.0f;
	std::uint32_t value = seed ^ static_cast<std::uint32_t>(age) * 0x9e3779b9U ^
		static_cast<std::uint32_t>(std::uint64_t(age) >> 32) ^ axis * 0x85ebca6bU;
	value ^= value >> 16; value *= 0x7feb352dU;
	value ^= value >> 15; value *= 0x846ca68bU;
	value ^= value >> 16;
	return static_cast<float>(value >> 8) * (2.0f / 16777216.0f) - 1.0f;
}
std::int64_t SampleClockIncrement(float rate, std::uint64_t deltaNs)
{
	// Source rates are per second, independent of the current logic frequency.
	const double units = static_cast<double>(rate) * static_cast<double>(deltaNs) * 1000.0;
	if (!std::isfinite(units) || units >= static_cast<double>(std::numeric_limits<std::int64_t>::max()) ||
		units <= static_cast<double>(std::numeric_limits<std::int64_t>::min()))
		throw std::overflow_error("particle sampled rate exceeds clock range");
	return static_cast<std::int64_t>(std::llround(units));
}
}

float TodParticleEmitter::RandomFloat(float maximum)
{
	return static_cast<float>(NextParticleRandom(mParticleSystem->mRandomState) >> 8) *
		(1.0f / 16777216.0f) * maximum;
}
int TodParticleEmitter::RandomInt(int maximum)
{
	return maximum > 0 ? static_cast<int>(NextParticleRandom(mParticleSystem->mRandomState) %
		static_cast<std::uint32_t>(maximum)) : 0;
}
int gParticleDefCount;                      // [0x6A9F08]
TodParticleDefinition* gParticleDefArray;   // [0x6A9F0C]
std::atomic<bool> gParticleAllDefinitionDataLoaded{false};
static int gParticleParamArraySize;				// [0x6A9F10]
static ParticleParams* gParticleParamArray;		// [0x6A9F14]

ParticleParams gLawnParticleArray[(int)ParticleEffect::NUM_PARTICLES] = {
	{ ParticleEffect::PARTICLE_MELONSPLASH, "particles\\MelonImpact.xml" },
	{ ParticleEffect::PARTICLE_WINTERMELON, "particles\\WinterMelonImpact.xml" },
	{ ParticleEffect::PARTICLE_FUMECLOUD, "particles\\FumeCloud.xml" },
	{ ParticleEffect::PARTICLE_POPCORNSPLASH, "particles\\PopcornSplash.xml" },
	{ ParticleEffect::PARTICLE_POWIE, "particles\\Powie.xml" },
	{ ParticleEffect::PARTICLE_JACKEXPLODE, "particles\\JackExplode.xml" },
	{ ParticleEffect::PARTICLE_ZOMBIE_HEAD, "particles\\ZombieHead.xml" },
	{ ParticleEffect::PARTICLE_ZOMBIE_ARM, "particles\\ZombieArm.xml" },
	{ ParticleEffect::PARTICLE_ZOMBIE_TRAFFIC_CONE, "particles\\ZombieTrafficCone.xml" },
	{ ParticleEffect::PARTICLE_ZOMBIE_PAIL, "particles\\ZombiePail.xml" },
	{ ParticleEffect::PARTICLE_ZOMBIE_HELMET, "particles\\ZombieHelmet.xml" },
	{ ParticleEffect::PARTICLE_ZOMBIE_FLAG, "particles\\ZombieFlag.xml" },
	{ ParticleEffect::PARTICLE_ZOMBIE_DOOR, "particles\\ZombieDoor.xml" },
	{ ParticleEffect::PARTICLE_ZOMBIE_NEWSPAPER, "particles\\ZombieNewspaper.xml" },
	{ ParticleEffect::PARTICLE_ZOMBIE_HEADLIGHT, "particles\\ZombieHeadLight.xml" },
	{ ParticleEffect::PARTICLE_POW, "particles\\Pow.xml" },
	{ ParticleEffect::PARTICLE_ZOMBIE_POGO, "particles\\ZombiePogo.xml" },
	{ ParticleEffect::PARTICLE_ZOMBIE_NEWSPAPER_HEAD, "particles\\ZombieNewspaperHead.xml" },
	{ ParticleEffect::PARTICLE_ZOMBIE_BALLOON_HEAD, "particles\\ZombieBalloonHead.xml" },
	{ ParticleEffect::PARTICLE_SOD_ROLL, "particles\\SodRoll.xml" },
	{ ParticleEffect::PARTICLE_GRAVE_STONE_RISE, "particles\\GraveStoneRise.xml" },
	{ ParticleEffect::PARTICLE_PLANTING, "particles\\Planting.xml" },
	{ ParticleEffect::PARTICLE_PLANTING_POOL, "particles\\PlantingPool.xml" },
	{ ParticleEffect::PARTICLE_ZOMBIE_RISE, "particles\\ZombieRise.xml" },
	{ ParticleEffect::PARTICLE_GRAVE_BUSTER, "particles\\GraveBuster.xml" },
	{ ParticleEffect::PARTICLE_GRAVE_BUSTER_DIE, "particles\\GraveBusterDie.xml" },
	{ ParticleEffect::PARTICLE_POOL_SPLASH, "particles\\PoolSplash.xml" },
	{ ParticleEffect::PARTICLE_ICE_SPARKLE, "particles\\IceSparkle.xml" },
	{ ParticleEffect::PARTICLE_SEED_PACKET, "particles\\SeedPacket.xml" },
	{ ParticleEffect::PARTICLE_TALL_NUT_BLOCK, "particles\\TallNutBlock.xml" },
	{ ParticleEffect::PARTICLE_DOOM, "particles\\Doom.xml" },
	{ ParticleEffect::PARTICLE_DIGGER_RISE, "particles\\DiggerRise.xml" },
	{ ParticleEffect::PARTICLE_DIGGER_TUNNEL, "particles\\DiggerTunnel.xml" },
	{ ParticleEffect::PARTICLE_DANCER_RISE, "particles\\DancerRise.xml" },
	{ ParticleEffect::PARTICLE_POOL_SPARKLY, "particles\\PoolSparkly.xml" },
	{ ParticleEffect::PARTICLE_WALLNUT_EAT_SMALL, "particles\\WallnutEatSmall.xml" },
	{ ParticleEffect::PARTICLE_WALLNUT_EAT_LARGE, "particles\\WallnutEatLarge.xml" },
	{ ParticleEffect::PARTICLE_PEA_SPLAT, "particles\\PeaSplat.xml" },
	{ ParticleEffect::PARTICLE_BUTTER_SPLAT, "particles\\ButterSplat.xml" },
	{ ParticleEffect::PARTICLE_CABBAGE_SPLAT, "particles\\CabbageSplat.xml" },
	{ ParticleEffect::PARTICLE_PUFF_SPLAT, "particles\\PuffSplat.xml" },
	{ ParticleEffect::PARTICLE_STAR_SPLAT, "particles\\StarSplat.xml" },
	{ ParticleEffect::PARTICLE_ICE_TRAP, "particles\\IceTrap.xml" },
	{ ParticleEffect::PARTICLE_SNOWPEA_SPLAT, "particles\\SnowPeaSplat.xml" },
	{ ParticleEffect::PARTICLE_SNOWPEA_PUFF, "particles\\SnowPeaPuff.xml" },
	{ ParticleEffect::PARTICLE_SNOWPEA_TRAIL, "particles\\SnowPeaTrail.xml" },
	{ ParticleEffect::PARTICLE_LANTERN_SHINE, "particles\\LanternShine.xml" },
	{ ParticleEffect::PARTICLE_SEED_PACKET_PICKUP, "particles\\Award.xml" },
	{ ParticleEffect::PARTICLE_POTATO_MINE, "particles\\PotatoMine.xml" },
	{ ParticleEffect::PARTICLE_POTATO_MINE_RISE, "particles\\PotatoMineRise.xml" },
	{ ParticleEffect::PARTICLE_PUFFSHROOM_TRAIL, "particles\\PuffShroomTrail.xml" },
	{ ParticleEffect::PARTICLE_PUFFSHROOM_MUZZLE, "particles\\PuffShroomMuzzle.xml" },
	{ ParticleEffect::PARTICLE_SEED_PACKET_FLASH, "particles\\SeedPacketFlash.xml" },
	{ ParticleEffect::PARTICLE_WHACK_A_ZOMBIE_RISE, "particles\\WhackAZombieRise.xml" },
	{ ParticleEffect::PARTICLE_ZOMBIE_LADDER, "particles\\ZombieLadder.xml" },
	{ ParticleEffect::PARTICLE_UMBRELLA_REFLECT, "particles\\UmbrellaReflect.xml" },
	{ ParticleEffect::PARTICLE_SEED_PACKET_PICK, "particles\\SeedPacketPick.xml" },
	{ ParticleEffect::PARTICLE_ICE_TRAP_ZOMBIE, "particles\\IceTrapZombie.xml" },
	{ ParticleEffect::PARTICLE_ICE_TRAP_RELEASE, "particles\\IceTrapRelease.xml" },
	{ ParticleEffect::PARTICLE_ZAMBONI_SMOKE, "particles\\ZamboniSmoke.xml" },
	{ ParticleEffect::PARTICLE_GLOOMCLOUD, "particles\\GloomCloud.xml" },
	{ ParticleEffect::PARTICLE_ZOMBIE_POGO_HEAD, "particles\\ZombiePogoHead.xml" },
	{ ParticleEffect::PARTICLE_ZAMBONI_TIRE, "particles\\ZamboniTire.xml" },
	{ ParticleEffect::PARTICLE_ZAMBONI_EXPLOSION, "particles\\ZamboniExplosion.xml" },
	{ ParticleEffect::PARTICLE_ZAMBONI_EXPLOSION2, "particles\\ZamboniExplosion2.xml" },
	{ ParticleEffect::PARTICLE_CATAPULT_EXPLOSION, "particles\\CatapultExplosion.xml" },
	{ ParticleEffect::PARTICLE_MOWER_CLOUD, "particles\\MowerCloud.xml" },
	{ ParticleEffect::PARTICLE_BOSS_ICE_BALL, "particles\\BossIceBallTrail.xml" },
	{ ParticleEffect::PARTICLE_BLASTMARK, "particles\\BlastMark.xml" },
	{ ParticleEffect::PARTICLE_COIN_PICKUP_ARROW, "particles\\CoinPickupArrow.xml" },
	{ ParticleEffect::PARTICLE_PRESENT_PICKUP, "particles\\PresentPickup.xml" },
	{ ParticleEffect::PARTICLE_IMITATER_MORPH, "particles\\ImitaterMorph.xml" },
	{ ParticleEffect::PARTICLE_MOWERED_ZOMBIE_HEAD, "particles\\MoweredZombieHead.xml" },
	{ ParticleEffect::PARTICLE_MOWERED_ZOMBIE_ARM, "particles\\MoweredZombieArm.xml" },
	{ ParticleEffect::PARTICLE_ZOMBIE_HEAD_POOL, "particles\\ZombieHeadPool.xml" },
	{ ParticleEffect::PARTICLE_ZOMBIE_BOSS_FIREBALL, "particles\\Zombie_boss_fireball.xml" },
	{ ParticleEffect::PARTICLE_FIREBALL_DEATH, "particles\\FireballDeath.xml" },
	{ ParticleEffect::PARTICLE_ICEBALL_DEATH, "particles\\IceballDeath.xml" },
	{ ParticleEffect::PARTICLE_ICEBALL_TRAIL, "particles\\Iceball_Trail.xml" },
	{ ParticleEffect::PARTICLE_FIREBALL_TRAIL, "particles\\Fireball_Trail.xml" },
	{ ParticleEffect::PARTICLE_BOSS_EXPLOSION, "particles\\BossExplosion.xml" },
	{ ParticleEffect::PARTICLE_SCREEN_FLASH, "particles\\ScreenFlash.xml" },
	{ ParticleEffect::PARTICLE_TROPHY_SPARKLE, "particles\\TrophySparkle.xml" },
	{ ParticleEffect::PARTICLE_PORTAL_CIRCLE, "particles\\PortalCircle.xml" },
	{ ParticleEffect::PARTICLE_PORTAL_SQUARE, "particles\\PortalSquare.xml" },
	{ ParticleEffect::PARTICLE_POTTED_PLANT_GLOW, "particles\\PottedPlantGlow.xml" },
	{ ParticleEffect::PARTICLE_POTTED_WATER_PLANT_GLOW, "particles\\PottedWaterPlantGlow.xml" },
	{ ParticleEffect::PARTICLE_POTTED_ZEN_GLOW, "particles\\PottedZenGlow.xml" },
	{ ParticleEffect::PARTICLE_MIND_CONTROL, "particles\\MindControl.xml" },
	{ ParticleEffect::PARTICLE_VASE_SHATTER, "particles\\VaseShatter.xml" },
	{ ParticleEffect::PARTICLE_VASE_SHATTER_LEAF, "particles\\VaseShatterLeaf.xml" },
	{ ParticleEffect::PARTICLE_VASE_SHATTER_ZOMBIE, "particles\\VaseShatterZombie.xml" },
	{ ParticleEffect::PARTICLE_AWARD_PICKUP_ARROW, "particles\\AwardPickupArrow.xml" },
	{ ParticleEffect::PARTICLE_ZOMBIE_SEAWEED, "particles\\Zombie_seaweed.xml" },
	{ ParticleEffect::PARTICLE_ZOMBIE_MUSTACHE, "particles\\ZombieMustache.xml" },
	{ ParticleEffect::PARTICLE_ZOMBIE_SUNGLASS, "particles\\ZombieFutureGlasses.xml" },
	{ ParticleEffect::PARTICLE_ZOMBIE_PINATA, "particles\\Pinata.xml" },
	{ ParticleEffect::PARTICLE_DUST_SQUASH, "particles\\Dust_Squash.xml" },
	{ ParticleEffect::PARTICLE_DUST_FOOT, "particles\\Dust_Foot.xml" },
	{ ParticleEffect::PARTICLE_ZOMBIE_DAISIES, "particles\\Daisy.xml" },
	{ ParticleEffect::PARTICLE_CREDIT_STROBE, "particles\\Credits_Strobe.xml" },
	{ ParticleEffect::PARTICLE_CREDITS_RAYSWIPE, "particles\\Credits_RaysWipe.xml" },
	{ ParticleEffect::PARTICLE_CREDITS_ZOMBIEHEADWIPE, "particles\\Credits_ZombieHeadWipe.xml" },
	{ ParticleEffect::PARTICLE_STARBURST, "particles\\Starburst.xml" },
	{ ParticleEffect::PARTICLE_CREDITS_FOG, "particles\\Credits_fog.xml" },
	{ ParticleEffect::PARTICLE_PERSENT_PICK_UP_ARROW, "particles\\UpsellArrow.xml" },
};

//0x515CE0
void TodParticleLoadDefinitions(ParticleParams* theParticleParamArray, int theParticleParamArraySize)
{
	if (gParticleParamArray || gParticleDefArray)
		return;
	if (theParticleParamArray != gLawnParticleArray ||
		theParticleParamArraySize != (int)ParticleEffect::NUM_PARTICLES)
		throw std::invalid_argument("invalid static particle catalog");
	gParticleAllDefinitionDataLoaded.store(false,std::memory_order_release);
	gParticleParamArraySize = theParticleParamArraySize;
	gParticleParamArray = theParticleParamArray;
	gParticleDefCount = theParticleParamArraySize;
	gParticleDefArray = GeneratedDefinitions::Particles;

	try
	{
	GeneratedDefinitions::LoadParticleImages();
	if (gSexyAppBase)
		gSexyAppBase->mCompletedLoadingThreadTasks += 6 * gParticleParamArraySize;
	gParticleAllDefinitionDataLoaded.store(true,std::memory_order_release);
	}
	catch (...)
	{
		TodParticleFreeDefinitions();
		throw;
	}
}

//0x515E30
void TodParticleFreeDefinitions()
{
	gParticleAllDefinitionDataLoaded.store(false,std::memory_order_release);
	GeneratedDefinitions::ReleaseParticleImages();
	gParticleDefArray = nullptr;
	gParticleDefCount = 0;
	gParticleParamArray = nullptr;
	gParticleParamArraySize = 0;
}

TodParticleSystem::TodParticleSystem()
{
	mEffectType = ParticleEffect::PARTICLE_NONE;
	mVariant = 0;
	mParticleDef = nullptr;
	mParticleHolder = nullptr;
	mDead = false;
	mDontUpdate = false;
	mIsAttachment = false;
	mRenderOrder = 0;
	mRandomState = 0;
}

TodParticleSystem::~TodParticleSystem()
{
	ParticleSystemDie();  // Die 内已清册（P3 名册化）；退役链表占位随 TodList 删除（2026-10-02）
}

//0x515E90 : (edx = theEffectType, *theDefinition, ecx = theRenderOrder, theY, theX, *this)
void TodParticleSystem::TodParticleInitializeFromDef(float theX, float theY, int theRenderOrder, TodParticleDefinition* theDefinition, ParticleEffect theEffectType, std::uint32_t theVariant)
{
	TOD_ASSERT(mParticleHolder);
	if (!theDefinition || theVariant>=theDefinition->mVariantCount)
		throw std::out_of_range("particle appearance variant out of range");
	// 名册侧表：系统池槽位键天然就位，无需分配器（链表成员已退役）
	mParticleDef = theDefinition;
	mEffectType = theEffectType;
	mVariant = theVariant;
	mRenderOrder = theRenderOrder;
	mRandomState = static_cast<std::uint32_t>(Sexy::Rand(0x7fffffff));

	for (int i = 0; i < theDefinition->mEmitterDefCount; i++)
	{
		TodEmitterDefinition& aDef = theDefinition->mEmitterDefs[i];
		if (!FloatTrackIsSet(aDef.mCrossFadeDuration))
		{
			if (TestBit(aDef.mParticleFlags, (int)ParticleFlags::PARTICLE_DIE_IF_OVERLOADED) && mParticleHolder->IsOverLoaded())
			{
				ParticleSystemDie();
				break;
			}
			TodParticleEmitter* aEmitter = mParticleHolder->mEmitters.DataArrayAlloc();
			aEmitter->TodEmitterInitialize(theX, theY, this, &aDef);
			EmitterRosterAdd(aEmitter);
		}
	}
}

//0x515F70 : (*theEmitterDef, *theSystem, theY, theX, ecx = *this)
void TodParticleEmitter::TodEmitterInitialize(float theX, float theY, TodParticleSystem* theSystem, TodEmitterDefinition* theEmitterDef)
{
	mSpawnRemainder = 0;
	mParticlesSpawned = 0;
	mEmissionElapsedNs = 0;
	mSystemAgeNs = 0;
	mDead = false;
	mColorOverride = Sexy::Color::White;
	mSystemCenter.x = theX;
	mSystemCenter.y = theY;
	mExternalTarget = mSystemCenter;
	mExternalAppliedCenter = mSystemCenter;
	mSystemPositionOriginX = mSystemPositionOriginY = 0;
	mSystemPositionBound = 1;
	mCrossFadeEmitterID = ParticleEmitterID::PARTICLEEMITTERID_NULL;
	mEmitterCrossFadeCountDownNs = 0;
	mFrameOverride = -1;
	mParticleSystem = theSystem;
	mScaleOverride = 1.0f;
	mExtraAdditiveDrawOverride = false;
	mSystemDurationNs = 0;
	mEmitterDef = theEmitterDef;
	// 粒子名册侧表：发射器池槽位键天然就位，无需分配器（链表成员已退役）

	if (FloatTrackIsSet(mEmitterDef->mSystemDuration))
		mSystemDurationNs = Sexy::TimeCounter::Encode(FloatTrackEvaluate(mEmitterDef->mSystemDuration, 0.0f, RandomFloat(1.0f)));
	else
		mSystemDurationNs = Sexy::TimeCounter::Encode(FloatTrackEvaluate(mEmitterDef->mParticleDuration, 0.0f, 1.0f));
	mSystemDurationNs = std::max(ParticleSourceTickNs, mSystemDurationNs);

	for (int i = 0; i < mEmitterDef->mSystemFields.count; i++)
	{
		mSystemFieldInterp[i][0] = RandomFloat(1.0f);
		mSystemFieldInterp[i][1] = RandomFloat(1.0f);
	}
	for (int j = 0; j < 10; j++)
		mTrackInterp[j] = RandomFloat(1.0f);

	// Birth samples offsets and minimum-active births without advancing time.
	SampleSystemPosition(0.0);
	UpdateSpawning(0);
}

//0x5160C0
void TodParticleSystem::ParticleSystemDie()
{
	{
		const int aCount = EmitterRosterCount();
		for (int i = 0; i < aCount; i++)
		{
			TodParticleEmitter* aEmitter = EmitterRosterEmitterAt(i);
			aEmitter->DeleteAll();
			mParticleHolder->mEmitters.DataArrayFree(aEmitter);
		}
	}
	EmitterRosterClear();
	mDead = true;
}


//0x516160
TodParticle* TodParticleEmitter::SpawnParticle(int theIndex, int theSpawnCount)
{
	// TodParticleEmitter::SpawnParticle 发射几何分发表：表内匿名 lambda =
	// 原 case 体逐句迁移（生成器 + 逆变换 token 对拍 0 差异）；圆形三标签
	// 共体具名；default 具名并被越界复用。
	using ParticleSpawnPosCaseFn = void (*)(TodParticleEmitter&, float, float&, float&);

	// 标签共体（匿名 lambda 无法跨槽复用，复用即具名）
	// 原 case EMITTER_CIRCLE, EMITTER_CIRCLE_PATH, EMITTER_CIRCLE_EVEN_SPACING
	static constexpr auto ParticleSpawnPosEmitterCircle = [](TodParticleEmitter& e, float aLaunchAngle, float& aPosX, float& aPosY)
	{
	float aEmitterRadiusInterp = e.RandomFloat(1.0f);
	float aRadius = FloatTrackEvaluate(e.mEmitterDef->mEmitterRadius, SystemTime(e), aEmitterRadiusInterp);
	// ★ 以竖直向下的方向为 0 角度
	aPosX = sin(aLaunchAngle) * aRadius;
	aPosY = cos(aLaunchAngle) * aRadius;
	};

	// 原 default（无 case 的 0 型与表外哨兵共用）
	static constexpr auto ParticleSpawnPosDefault = [](TodParticleEmitter& e, float aLaunchAngle, float& aPosX, float& aPosY)
	{
	TOD_ASSERT(false);
	};

	// 匿名 lambda 函数指针表，行序 = EmitterType 枚举值序（0..4）。
	static constexpr ParticleSpawnPosCaseFn kParticleSpawnPosCases[(int)EmitterType::EMITTER_CIRCLE_EVEN_SPACING + 1] = {
	ParticleSpawnPosEmitterCircle,  // 0 EMITTER_CIRCLE（共体）
	// 原 case EMITTER_BOX
	[](TodParticleEmitter& e, float aLaunchAngle, float& aPosX, float& aPosY)
	{
	float aEmitterBoxXInterp = e.RandomFloat(1.0f);
	float aEmitterBoxYInterp = e.RandomFloat(1.0f);
	aPosX = FloatTrackEvaluate(e.mEmitterDef->mEmitterBoxX, SystemTime(e), aEmitterBoxXInterp);
	aPosY = FloatTrackEvaluate(e.mEmitterDef->mEmitterBoxY, SystemTime(e), aEmitterBoxYInterp);
	},  // 1 EMITTER_BOX
	// 原 case EMITTER_BOX_PATH
	[](TodParticleEmitter& e, float aLaunchAngle, float& aPosX, float& aPosY)
	{
	float aEmitterPathPosition = FloatTrackEvaluate(e.mEmitterDef->mEmitterPath, SystemTime(e), e.mTrackInterp[ParticleSystemTracks::TRACK_EMITTER_PATH]);
	float aMinX = FloatTrackEvaluate(e.mEmitterDef->mEmitterBoxX, SystemTime(e), 0.0f);
	float aMaxX = FloatTrackEvaluate(e.mEmitterDef->mEmitterBoxX, SystemTime(e), 1.0f);
	float aMinY = FloatTrackEvaluate(e.mEmitterDef->mEmitterBoxY, SystemTime(e), 0.0f);
	float aMaxY = FloatTrackEvaluate(e.mEmitterDef->mEmitterBoxY, SystemTime(e), 1.0f);
	float aDistanceX = aMaxX - aMinX;  // 路径矩形的横向宽度
	float aDistanceY = aMaxY - aMinY;  // 路径矩形的纵向高度
	float aPathPos = aEmitterPathPosition * (aDistanceY + aDistanceX + aDistanceY + aDistanceX);  // 发射点位于矩形边上的位置
	// ★ 注释规定：以矩形左上的顶点开始，按逆时针方向依次将矩形的四个顶点标记为 A、B、C、D，并标记发射点为 P
	// ★           如此，aPathPos 即为 P 点与 A 点在矩形路径上的距离。注意，游戏中取横向水平向右和纵向竖直向下为正方向。
	if (aPathPos < aDistanceY)  // 发射点落在矩形 AB 边（左边）上
	{
	aPosX = aMinX;  // 横坐标 = 矩形左端横坐标
	aPosY = aMinY + aPathPos;  // 纵坐标 = 矩形底端坐标 + |PA|
	}
	else if (aPathPos < aDistanceY + aDistanceX)  // 发射点落在矩形 BC 边（顶边）上
	{
	aPosX = aMinX + (aPathPos - aDistanceY);  // 横坐标 = 矩形左端横坐标 + |PB|
	aPosY = aMaxY;
	}
	else if (aPathPos < aDistanceY + aDistanceX + aDistanceY)  // 发射点落在矩形 CD 边（右边）上
	{
	aPosX = aMaxX;
	aPosY = aMaxY - (aPathPos - aDistanceY - aDistanceX);  // 纵坐标 = 矩形顶端纵坐标 - |PC|
	}
	else  // 发射点落在矩形 AD 边（底边）上
	{
	aPosX = aMaxX - (aPathPos - aDistanceY - aDistanceX - aDistanceY);  // 横坐标 = 矩形右端横坐标 - |PD|
	aPosY = aMinY;
	}
	},  // 2 EMITTER_BOX_PATH
	ParticleSpawnPosEmitterCircle,  // 3 EMITTER_CIRCLE_PATH（共体）
	ParticleSpawnPosEmitterCircle,  // 4 EMITTER_CIRCLE_EVEN_SPACING（共体）
	};
	static_assert(sizeof(kParticleSpawnPosCases) / sizeof(kParticleSpawnPosCases[0]) ==
	(int)EmitterType::EMITTER_CIRCLE_EVEN_SPACING + 1, "kParticleSpawnPosCases 槽位数须与 EmitterType 枚举同步");

	DataArray<TodParticle>& aDataArray = mParticleSystem->mParticleHolder->mParticles;
	if (aDataArray.mSize == aDataArray.mMaxSize)
	{
		TodTraceWithoutSpamming("Too many particles (emitter id=%u)\n", static_cast<unsigned>(mEmitterDef->mNameId));
		return nullptr;
	}

	TodParticle* aParticle = aDataArray.DataArrayAlloc();
	TOD_ASSERT(mEmitterDef->mParticleFields.count <= MAX_PARTICLE_FIELDS);
	for (int i = 0; i < mEmitterDef->mParticleFields.count; i++)
	{
		aParticle->mParticleFieldInterp[i][0] = RandomFloat(1.0f);  // 初始化每个粒子场的横向插值
		aParticle->mParticleFieldInterp[i][1] = RandomFloat(1.0f);  // 初始化每个粒子场的纵向插值
	}
	for (int i = 0; i < (int)ParticleTracks::NUM_PARTICLE_TRACKS; i++)
		aParticle->mParticleInterp[i] = RandomFloat(1.0f);  // 初始化每条通道的插值

	float aParticleDurationInterp = RandomFloat(1.0f);
	float aLaunchSpeedInterp = RandomFloat(1.0f);
	float aEmitterOffsetXInterp = RandomFloat(1.0f);
	float aEmitterOffsetYInterp = RandomFloat(1.0f);
	aParticle->mParticleDurationNs = Sexy::TimeCounter::Encode(FloatTrackEvaluate(mEmitterDef->mParticleDuration, SystemTime(*this), aParticleDurationInterp));
	aParticle->mParticleDurationNs = std::max(ParticleSourceTickNs, aParticle->mParticleDurationNs);
	aParticle->mParticleAgeNs = 0;
	aParticle->mParticleEmitter = this;
	aParticle->mRandomSeed = NextParticleRandom(mParticleSystem->mRandomState);
	if (TestBit(mEmitterDef->mParticleFlags, (int)ParticleFlags::PARTICLE_RANDOM_START_TIME))
		aParticle->mParticleAgeNs = static_cast<std::int64_t>(ReanimClock::MulDiv(
			NextParticleRandom(mParticleSystem->mRandomState), aParticle->mParticleDurationNs,
			UINT64_C(1) << 32));
	float aLaunchSpeed = FloatTrackEvaluate(mEmitterDef->mLaunchSpeed, SystemTime(*this), aLaunchSpeedInterp) * 0.01f;
	float aLaunchAngleInterp = RandomFloat(1.0f);

	float aLaunchAngle;
	if (mEmitterDef->mEmitterType == EmitterType::EMITTER_CIRCLE_PATH)
	{
		// 发射角度 = 根据路径定义计算的圆周上的基础角度 + 根据发射角度定义计算的额外偏移的角度
		aLaunchAngle = FloatTrackEvaluate(mEmitterDef->mEmitterPath, SystemTime(*this), mTrackInterp[ParticleSystemTracks::TRACK_EMITTER_PATH]) * 2 * PI;
		aLaunchAngle += DEG_TO_RAD(FloatTrackEvaluate(mEmitterDef->mLaunchAngle, SystemTime(*this), aLaunchAngleInterp));
	}
	else if (mEmitterDef->mEmitterType == EmitterType::EMITTER_CIRCLE_EVEN_SPACING)
		// 基础发射角度要使 theSpawnCount 个粒子平均布满圆周
		aLaunchAngle = 2 * PI * theIndex / theSpawnCount + DEG_TO_RAD(FloatTrackEvaluate(mEmitterDef->mLaunchAngle, SystemTime(*this), aLaunchAngleInterp));
	else if (FloatTrackIsConstantZero(mEmitterDef->mLaunchAngle))
		// 未定义的轨道，发射角度直接取 [0, 2π] 的随机值
		aLaunchAngle = RandomFloat((float)(2 * PI));
	else
		// 其他情况下，根据发射角度的定义值计算
		aLaunchAngle = DEG_TO_RAD(FloatTrackEvaluate(mEmitterDef->mLaunchAngle, SystemTime(*this), aLaunchAngleInterp));

	float aPosX, aPosY;
	// C 形态 -> 匿名 lambda 函数指针表：行序 = EmitterType 枚举序（0..4）。
	// 三种圆形发射器标签共体 → 具名（匿名 lambda 无法跨槽复用）；
	// aPosX/aPosY 经引用直写（分发点之后消费）；发射角经值参直传。
	// default（TOD_ASSERT）具名并被越界分支复用。
	const unsigned aEmitterKindIndex = static_cast<unsigned>(mEmitterDef->mEmitterType);
	if (aEmitterKindIndex <= static_cast<unsigned>(EmitterType::EMITTER_CIRCLE_EVEN_SPACING))
	{
		kParticleSpawnPosCases[aEmitterKindIndex](*this, aLaunchAngle, aPosX, aPosY);
	}
	else
	{
		ParticleSpawnPosDefault(*this, aLaunchAngle, aPosX, aPosY);
	}

	float aEmitterSkewXInterp = RandomFloat(1.0f);
	float aEmitterSkewYInterp = RandomFloat(1.0f);
	float aSkewX = FloatTrackEvaluate(mEmitterDef->mEmitterSkewX, SystemTime(*this), aEmitterSkewXInterp);
	float aSkewY = FloatTrackEvaluate(mEmitterDef->mEmitterSkewY, SystemTime(*this), aEmitterSkewYInterp);
	aParticle->mPosition.x = mSystemCenter.x + aPosX + aPosY * aSkewX;  // 横向（左右）倾斜的幅度受纵坐标影响
	aParticle->mPosition.y = mSystemCenter.y + aPosY + aPosX * aSkewY;  // 纵向（上下）倾斜的幅度受横坐标影响
	aParticle->mVelocity.x = sin(aLaunchAngle) * aLaunchSpeed;
	aParticle->mVelocity.y = cos(aLaunchAngle) * aLaunchSpeed;
	aParticle->mPosition.x += FloatTrackEvaluate(mEmitterDef->mEmitterOffsetX, SystemTime(*this), aEmitterOffsetXInterp);  // 横坐标加上横向偏移值
	aParticle->mPosition.y += FloatTrackEvaluate(mEmitterDef->mEmitterOffsetY, SystemTime(*this), aEmitterOffsetYInterp);  // 纵坐标加上纵向偏移值
	
	aParticle->mAnimationElapsedNs = 0;
	aParticle->mAnimationSampleIntegral = 0;
	aParticle->mLinearOriginX = aParticle->mLinearOriginY = 0;
	aParticle->mLinearElapsedNs = -1;
	aParticle->mLinearAcceleration = SexyVector2(0, 0);
	aParticle->mLinearVelocity = SexyVector2(0, 0);
	aParticle->mLinearSpinOrigin = aParticle->mLinearSpinRate = 0;
	aParticle->mLinearSpinActive = 0;
	if (mEmitterDef->mAnimated || FloatTrackIsSet(mEmitterDef->mAnimationRate))
		aParticle->mImageFrame = 0;  // 如果定义了粒子动态或动画速率，则粒子的当前帧将在后续根据粒子时间值或动画循环率实时计算，此处先初始化为 0
	else
		aParticle->mImageFrame = RandomInt(mEmitterDef->mImageFrames);  // 对于帧固定的粒子，在贴图的所有帧中随机取得一帧，后续一般不再变化

	if (TestBit(mEmitterDef->mParticleFlags, (int)ParticleFlags::PARTICLE_RANDOM_LAUNCH_SPIN))
		aParticle->mSpinPosition = RandomFloat((float)(2 * PI));  // 在 [0, 2π] 之间随机取得一个初始旋转角度
	else if (TestBit(mEmitterDef->mParticleFlags, (int)ParticleFlags::PARTICLE_ALIGN_LAUNCH_SPIN))
		aParticle->mSpinPosition = aLaunchAngle;  // 粒子旋转角度对齐发射角度
	else
		aParticle->mSpinPosition = 0.0f;  // 默认无初始旋转
	aParticle->mSpinVelocity = 0.0f;
	aParticle->mCrossFadeDurationNs = 0;
	aParticle->mCrossFadeParticleID = ParticleID::PARTICLEID_NULL;

	if (!ParticleRosterAdd(aParticle))
	{
		aDataArray.DataArrayFree(aParticle);  // 名册满回滚 = 池满同款（宁可丢不崩）
		return nullptr;
	}
	mParticlesSpawned++;
	// Initialize authored POSITION/SHAKE/angle offsets at birth without giving
	// the newly created particle a hidden physics or lifetime update.
	UpdateParticle(aParticle, 0, -1);
	return aParticle;
}

namespace
{
// TodParticleEmitter::UpdateParticleField 物理场分发表：表内匿名 lambda =
// 原 case 体逐句迁移（生成器 + 逆变换 token 对拍 0 差异）；INVALID 槽空
// 操作；default 具名并被缺槽/越界复用。
using ParticleFieldCaseFn = void (*)(TodParticleEmitter&, TodParticle*, ParticleField*, double, float, float, float, float, double, std::int64_t);

// 原 default（无 case 的 1 型与表外哨兵共用）
void ParticleFieldDefault(TodParticleEmitter& e, TodParticle* theParticle, ParticleField* theParticleField, double theParticleTimeValue, float x, float y, float aInterpX, float aInterpY, double deltaTicks, std::int64_t previousAgeNs)
{
    		TOD_ASSERT(0);
}

// 匿名 lambda 函数指针表，行序 = ParticleFieldType 枚举值序（0..11）。
constexpr ParticleFieldCaseFn kParticleFieldCases[(int)ParticleFieldType::PARTICLE_FIELD_COUNT] = {
    // 原 case FIELD_INVALID
    [](TodParticleEmitter& e, TodParticle* theParticle, ParticleField* theParticleField, double theParticleTimeValue, float x, float y, float aInterpX, float aInterpY, double deltaTicks, std::int64_t previousAgeNs)
    {

    },  // 0 FIELD_INVALID
    // 原 case FIELD_FRICTION
    [](TodParticleEmitter& e, TodParticle* theParticle, ParticleField* theParticleField, double theParticleTimeValue, float x, float y, float aInterpX, float aInterpY, double deltaTicks, std::int64_t previousAgeNs)
    {
    // 摩擦力场
        theParticle->mVelocity.x *= static_cast<float>(std::pow(std::max(0.0f, 1 - x), deltaTicks));
        theParticle->mVelocity.y *= static_cast<float>(std::pow(std::max(0.0f, 1 - y), deltaTicks));
    },  // 1 FIELD_FRICTION
    // 原 case FIELD_ACCELERATION
    [](TodParticleEmitter& e, TodParticle* theParticle, ParticleField* theParticleField, double theParticleTimeValue, float x, float y, float aInterpX, float aInterpY, double deltaTicks, std::int64_t previousAgeNs)
    {
    // 加速度场
        theParticle->mVelocity.x += static_cast<float>(0.01f * x * deltaTicks);
        theParticle->mVelocity.y += static_cast<float>(0.01f * y * deltaTicks);
    },  // 2 FIELD_ACCELERATION
    // 原 case FIELD_ATTRACTOR
    [](TodParticleEmitter& e, TodParticle* theParticle, ParticleField* theParticleField, double theParticleTimeValue, float x, float y, float aInterpX, float aInterpY, double deltaTicks, std::int64_t previousAgeNs)
    {
    // 弹性力场
    		float aDiffX = x - (theParticle->mPosition.x - e.mSystemCenter.x);
    		float aDiffY = y - (theParticle->mPosition.y - e.mSystemCenter.y);
    		// 加速度的方向始终从粒子所在位置指向“标准位置”
        theParticle->mVelocity.x += static_cast<float>(0.01f * aDiffX * deltaTicks);
        theParticle->mVelocity.y += static_cast<float>(0.01f * aDiffY * deltaTicks);
    },  // 3 FIELD_ATTRACTOR
    // 原 case FIELD_MAX_VELOCITY
    [](TodParticleEmitter& e, TodParticle* theParticle, ParticleField* theParticleField, double theParticleTimeValue, float x, float y, float aInterpX, float aInterpY, double deltaTicks, std::int64_t previousAgeNs)
    {
    // 限速场
    		theParticle->mVelocity.x = ClampFloat(theParticle->mVelocity.x, -x, x);
    		theParticle->mVelocity.y = ClampFloat(theParticle->mVelocity.y, -y, y);
    },  // 4 FIELD_MAX_VELOCITY
    // 原 case FIELD_VELOCITY
    [](TodParticleEmitter& e, TodParticle* theParticle, ParticleField* theParticleField, double theParticleTimeValue, float x, float y, float aInterpX, float aInterpY, double deltaTicks, std::int64_t previousAgeNs)
    {
    // 匀速场
        theParticle->mPosition.x += static_cast<float>(0.01 * x * deltaTicks);
        theParticle->mPosition.y += static_cast<float>(0.01 * y * deltaTicks);
    },  // 5 FIELD_VELOCITY
    // 原 case FIELD_POSITION
    [](TodParticleEmitter& e, TodParticle* theParticle, ParticleField* theParticleField, double theParticleTimeValue, float x, float y, float aInterpX, float aInterpY, double deltaTicks, std::int64_t previousAgeNs)
    {
    // 定位场
		float aLastX = FloatTrackEvaluateFromLastTime(theParticleField->mX, LifeFraction(previousAgeNs, theParticle->mParticleDurationNs), aInterpX);
		float aLastY = FloatTrackEvaluateFromLastTime(theParticleField->mY, LifeFraction(previousAgeNs, theParticle->mParticleDurationNs), aInterpY);
    		theParticle->mPosition.x += x - aLastX;
    		theParticle->mPosition.y += y - aLastY;
    },  // 6 FIELD_POSITION
    &ParticleFieldDefault,  // 7 FIELD_SYSTEM_POSITION（原 default）
    // 原 case FIELD_GROUND_CONSTRAINT
    [](TodParticleEmitter& e, TodParticle* theParticle, ParticleField* theParticleField, double theParticleTimeValue, float x, float y, float aInterpX, float aInterpY, double deltaTicks, std::int64_t previousAgeNs)
    {
		if (deltaTicks > 0 && theParticle->mPosition.y > e.mSystemCenter.y + y)
    		{
    			theParticle->mPosition.y = e.mSystemCenter.y + y;  // 将坐标重置至地面
    			float aCollisionReflect = FloatTrackEvaluate(
    				e.mEmitterDef->mCollisionReflect, theParticleTimeValue, theParticle->mParticleInterp[ParticleTracks::TRACK_PARTICLE_COLLISION_REFLECT]
    			);
    			float aCollisionSpin = FloatTrackEvaluate(
    				e.mEmitterDef->mCollisionSpin, theParticleTimeValue, theParticle->mParticleInterp[ParticleTracks::TRACK_PARTICLE_COLLISION_SPIN]
    			) / 1000.0f;
    			theParticle->mSpinVelocity = theParticle->mVelocity.y * aCollisionSpin;
    			theParticle->mVelocity.x *= aCollisionReflect;
    			theParticle->mVelocity.y *= -aCollisionReflect;
    		}
    },  // 8 FIELD_GROUND_CONSTRAINT
    // 原 case FIELD_SHAKE
    [](TodParticleEmitter& e, TodParticle* theParticle, ParticleField* theParticleField, double theParticleTimeValue, float x, float y, float aInterpX, float aInterpY, double deltaTicks, std::int64_t previousAgeNs)
    {
    // 震动
		float aLastX = FloatTrackEvaluateFromLastTime(theParticleField->mX, LifeFraction(previousAgeNs, theParticle->mParticleDurationNs), aInterpX);
		float aLastY = FloatTrackEvaluateFromLastTime(theParticleField->mY, LifeFraction(previousAgeNs, theParticle->mParticleDurationNs), aInterpY);
    		// 先恢复上一次震动效果的影响
		theParticle->mPosition.x -= aLastX * ShakeSample(theParticle->mRandomSeed, previousAgeNs, 0);
		theParticle->mPosition.y -= aLastY * ShakeSample(theParticle->mRandomSeed, previousAgeNs, 1);
		theParticle->mPosition.x += x * ShakeSample(theParticle->mRandomSeed, theParticle->mParticleAgeNs, 0);
		theParticle->mPosition.y += y * ShakeSample(theParticle->mRandomSeed, theParticle->mParticleAgeNs, 1);
    },  // 9 FIELD_SHAKE
    // 原 case FIELD_CIRCLE
    [](TodParticleEmitter& e, TodParticle* theParticle, ParticleField* theParticleField, double theParticleTimeValue, float x, float y, float aInterpX, float aInterpY, double deltaTicks, std::int64_t previousAgeNs)
    {
    // 圆周
    		SexyVector2 aToCenter = theParticle->mPosition - e.mSystemCenter;
    		SexyVector2 aMotion = aToCenter.Perp().Normalize();  // 标准化的法向量
    		float aRadius = aToCenter.Magnitude();
        aMotion *= static_cast<float>(0.01 * (x + aRadius * y) * deltaTicks);
    		theParticle->mPosition += aMotion;
    },  // 10 FIELD_CIRCLE
    // 原 case FIELD_AWAY
    [](TodParticleEmitter& e, TodParticle* theParticle, ParticleField* theParticleField, double theParticleTimeValue, float x, float y, float aInterpX, float aInterpY, double deltaTicks, std::int64_t previousAgeNs)
    {
    // 远离
    		SexyVector2 aToCenter = theParticle->mPosition - e.mSystemCenter;
    		SexyVector2 aMotion = aToCenter.Normalize();  // 标准化的方向向量
    		float aRadius = aToCenter.Magnitude();
        aMotion *= static_cast<float>(0.01 * (x + aRadius * y) * deltaTicks);
    		theParticle->mPosition += aMotion;
    },  // 11 FIELD_AWAY
};
static_assert(sizeof(kParticleFieldCases) / sizeof(kParticleFieldCases[0]) ==
    (int)ParticleFieldType::PARTICLE_FIELD_COUNT, "kParticleFieldCases 槽位数须与 ParticleFieldType 枚举同步");
}  // namespace

//0x516820
void TodParticleEmitter::UpdateParticleField(TodParticle* theParticle, ParticleField* theParticleField, double theParticleTimeValue, int theFieldIndex, double theDeltaTicks, std::int64_t previousAgeNs)
{
	TOD_ASSERT(theFieldIndex < MAX_PARTICLE_FIELDS);
	float aInterpX = theParticle->mParticleFieldInterp[theFieldIndex][0];
	float aInterpY = theParticle->mParticleFieldInterp[theFieldIndex][1];
	float x = FloatTrackEvaluate(theParticleField->mX, theParticleTimeValue, aInterpX);
	float y = FloatTrackEvaluate(theParticleField->mY, theParticleTimeValue, aInterpY);

	// C 形态 -> 匿名 lambda 函数指针表：行序 = ParticleFieldType 枚举序
	// （0..11；SYSTEM_POSITION 为 SampleSystemPosition 专属 → 缺槽走 default）。
	// 场值 x/y 与双插值经值参传入（体只读）；发射器成员经 e 直写。
	// default（TOD_ASSERT）具名并被缺槽与越界分支复用。
	const unsigned aFieldTypeIndex = static_cast<unsigned>(theParticleField->mFieldType);
	if (aFieldTypeIndex < static_cast<unsigned>(ParticleFieldType::PARTICLE_FIELD_COUNT))
	{
		kParticleFieldCases[aFieldTypeIndex](*this, theParticle, theParticleField, theParticleTimeValue, x, y, aInterpX, aInterpY, theDeltaTicks, previousAgeNs);
	}
	else
	{
		ParticleFieldDefault(*this, theParticle, theParticleField, theParticleTimeValue, x, y, aInterpX, aInterpY, theDeltaTicks, previousAgeNs);
	}

}

float TodParticleEmitter::SystemTrackEvaluate(const FloatParameterTrack& theTrack, ParticleSystemTracks theSystemTrack) const
{
	return FloatTrackEvaluate(theTrack, SystemTime(*this), mTrackInterp[(int)theSystemTrack]);
}

//0x516D70
void TodParticleEmitter::SampleSystemPosition(double theTimeValue)
{
	if (mEmitterDef->mSystemFields.count == 0)
	{
		mSystemCenter = mExternalAppliedCenter;
		mSystemPositionBound = 1;
		return;
	}
	double x = 0, y = 0;
	for (int i = 0; i < mEmitterDef->mSystemFields.count; ++i)
	{
		TOD_ASSERT(i < MAX_PARTICLE_FIELDS);
		const auto& field = mEmitterDef->mSystemFields.Fields[i];
		TOD_ASSERT(field.mFieldType == ParticleFieldType::FIELD_SYSTEM_POSITION);
		x += FloatTrackEvaluate(field.mX, theTimeValue, mSystemFieldInterp[i][0]);
		y += FloatTrackEvaluate(field.mY, theTimeValue, mSystemFieldInterp[i][1]);
	}
	if (!mSystemPositionBound)
	{
		// Historical records retain the visible center, not the original
		// external input. Bind once at the saved age, before the next step.
		mSystemPositionOriginX = double(mSystemCenter.x) - mExternalAppliedCenter.x - x;
		mSystemPositionOriginY = double(mSystemCenter.y) - mExternalAppliedCenter.y - y;
		mSystemPositionBound = 1;
	}
	mSystemCenter.x = static_cast<float>(mExternalAppliedCenter.x + mSystemPositionOriginX + x);
	mSystemCenter.y = static_cast<float>(mExternalAppliedCenter.y + mSystemPositionOriginY + y);
}


// IDT3 resolves the first target definition at compile time.
bool TodParticleEmitter::CrossFadeParticleOnDuration(TodParticle* theParticle)
{
	const int aIndex = mEmitterDef->mOnDurationEmitterIndex;
	if (aIndex >= 0 && aIndex < mParticleSystem->mParticleDef->mEmitterDefCount)
	{
		return CrossFadeParticleToDef(theParticle, &mParticleSystem->mParticleDef->mEmitterDefs[aIndex]);
	}
	return false;
}

// 按发射器 def 交叉淡入：分配目标发射器实例、入系统表并转移粒子。
bool TodParticleEmitter::CrossFadeParticleToDef(TodParticle* theParticle, TodEmitterDefinition* theToEmitterDef)
{
	if (mParticleSystem->mParticleHolder->mEmitters.mSize == mParticleSystem->mParticleHolder->mEmitters.mMaxSize)
	{
		TodTraceAndLog("Too many emitters to cross fade\n");
		return false;
	}

	TodParticleEmitter* aEmitter = mParticleSystem->mParticleHolder->mEmitters.DataArrayAlloc();
	aEmitter->TodEmitterInitialize(mSystemCenter.x, mSystemCenter.y, mParticleSystem, theToEmitterDef);
	ParticleEmitterID aEmitterID = (ParticleEmitterID)mParticleSystem->mParticleHolder->mEmitters.DataArrayGetID(aEmitter);
	if (!mParticleSystem->EmitterRosterAdd(aEmitter))
	{
		mParticleSystem->mParticleHolder->mEmitters.DataArrayFree(aEmitter);  // 名册满即整体回滚（防孤儿发射器）
		return false;
	}
	return CrossFadeParticle(theParticle, aEmitter);
}

void TodParticleEmitter::RebaseParticlePosition(TodParticle* particle, const SexyVector2& position)
{
	if (particle->mLinearElapsedNs >= 0)
	{
		const double ticks = static_cast<double>(particle->mLinearElapsedNs) / ParticleSourceTickNs;
		if (position.x != particle->mPosition.x)
			particle->mLinearOriginX = position.x -
				MotionDisplacement(particle->mLinearVelocity.x, particle->mLinearAcceleration.x, ticks);
		if (position.y != particle->mPosition.y)
			particle->mLinearOriginY = position.y -
				MotionDisplacement(particle->mLinearVelocity.y, particle->mLinearAcceleration.y, ticks);
	}
	particle->mPosition = position;
}

void TodParticleEmitter::RebaseParticleSpin(TodParticle* particle, float spin)
{
	if (particle->mLinearElapsedNs >= 0 && particle->mLinearSpinActive)
	{
		const double ticks = static_cast<double>(particle->mLinearElapsedNs) / ParticleSourceTickNs;
		const float angle = FloatTrackEvaluate(mEmitterDef->mParticleSpinAngle, ParticleTime(particle),
			particle->mParticleInterp[ParticleTracks::TRACK_PARTICLE_SPIN_ANGLE]);
		particle->mLinearSpinOrigin = double(spin) - particle->mLinearSpinRate * ticks - DEG_TO_RAD(double(angle));
	}
	particle->mSpinPosition = spin;
}

//0x516F00
bool TodParticleEmitter::UpdateParticle(TodParticle* theParticle, std::uint64_t deltaNs)
{
	return UpdateParticle(theParticle, deltaNs, theParticle->mParticleAgeNs);
}

bool TodParticleEmitter::UpdateParticle(TodParticle* theParticle, std::uint64_t deltaNs, std::int64_t previousAgeNs)
{
	if (deltaNs > INT64_MAX) throw std::overflow_error("particle lifetime interval exceeds clock range");
	if (theParticle->mParticleAgeNs > INT64_MAX - static_cast<std::int64_t>(deltaNs))
		throw std::overflow_error("particle lifetime exceeds clock range");
	theParticle->mParticleAgeNs += static_cast<std::int64_t>(deltaNs);
	if (theParticle->mParticleAgeNs >= theParticle->mParticleDurationNs)  // 粒子的生命周期结束时
	{
		if (TestBit(mEmitterDef->mParticleFlags, (int)ParticleFlags::PARTICLE_PARTICLE_LOOPS))  // 判断粒子是否循环
			theParticle->mParticleAgeNs %= theParticle->mParticleDurationNs;
		else if (theParticle->mCrossFadeDurationNs > 0)  // 判断粒子是否处于交叉混合过程中
			theParticle->mParticleAgeNs = theParticle->mParticleDurationNs;
		else if (mEmitterDef->mOnDurationEmitterIndex < 0 || !CrossFadeParticleOnDuration(theParticle))  // 尝试进行交叉混合（IDT3 下标；无链接即无淡入）
			return false;
	}
	if (theParticle->mParticleAgeNs >= theParticle->mParticleDurationNs &&
		!TestBit(mEmitterDef->mParticleFlags, (int)ParticleFlags::PARTICLE_PARTICLE_LOOPS))
		theParticle->mParticleAgeNs = theParticle->mParticleDurationNs;
	if (theParticle->mCrossFadeParticleID != ParticleID::PARTICLEID_NULL &&
		mParticleSystem->mParticleHolder->mParticles.DataArrayTryToGet(theParticle->mCrossFadeParticleID) == nullptr)
		return false;  // 当粒子不存在交叉混合时，可以删除粒子

	const auto deltaTicks = static_cast<double>(deltaNs) / ParticleSourceTickNs;
	const auto aParticleTime = ParticleTime(theParticle);
	const int aParticleFieldCount = mEmitterDef->mParticleFields.count;  // 装载后 def 只读，场数外提免逐场重载
	bool anchoredMotion = true;
	SexyVector2 acceleration(0, 0);
	for (int i = 0; i < aParticleFieldCount; ++i)
	{
		const auto& field = mEmitterDef->mParticleFields.Fields[i];
		if (field.mFieldType != ParticleFieldType::FIELD_ACCELERATION ||
			field.mX.mCountNodes > 1 || field.mY.mCountNodes > 1)
		{
			anchoredMotion = false;
			break;
		}
	}
	if (anchoredMotion)
		for (int i = 0; i < aParticleFieldCount; ++i)
		{
			// Random ranges are constant per particle, not resampled per step.
			const auto& field = mEmitterDef->mParticleFields.Fields[i];
			acceleration.x += .01f * FloatTrackEvaluate(field.mX, aParticleTime, theParticle->mParticleFieldInterp[i][0]);
			acceleration.y += .01f * FloatTrackEvaluate(field.mY, aParticleTime, theParticle->mParticleFieldInterp[i][1]);
		}
	else
		for (int i = 0; i < aParticleFieldCount; ++i)
			UpdateParticleField(theParticle, &mEmitterDef->mParticleFields.Fields[i], aParticleTime, i, deltaTicks, previousAgeNs);
	const float aSpinSpeed = FloatTrackEvaluate(mEmitterDef->mParticleSpinSpeed, aParticleTime,
		theParticle->mParticleInterp[ParticleTracks::TRACK_PARTICLE_SPIN_SPEED]) * 0.01;
	const float aSpinAngle = FloatTrackEvaluate(mEmitterDef->mParticleSpinAngle, aParticleTime,
		theParticle->mParticleInterp[ParticleTracks::TRACK_PARTICLE_SPIN_ANGLE]);
	// Anchored spin samples the current absolute angle directly. Its previous
	// angle is needed only when binding/editing the origin or using discrete
	// integration; avoid evaluating that same curve again on every stable step.
	const auto previousSpinAngle = [&] {
		return FloatTrackEvaluateFromLastTime(mEmitterDef->mParticleSpinAngle,
			LifeFraction(previousAgeNs, theParticle->mParticleDurationNs), theParticle->mParticleInterp[ParticleTracks::TRACK_PARTICLE_SPIN_ANGLE]);
	};
	bool sampledSpin = true;
	if (anchoredMotion && deltaNs > 0)
	{
		// A velocity change keeps the old segment's double endpoint.
		// Explicit position/spin edits update their origins at the edit itself.
		auto& p = *theParticle;
		// One node is time-invariant even when its low/high range is random:
		// each particle's interpolation value is chosen once at birth.
		const bool anchoredSpin = mEmitterDef->mParticleSpinSpeed.mCountNodes <= 1;
		const double spinRate = anchoredSpin ? DEG_TO_RAD(double(aSpinSpeed)) + p.mSpinVelocity : 0;
		const double oldTicks = p.mLinearElapsedNs < 0 ? 0 :
			static_cast<double>(p.mLinearElapsedNs) / ParticleSourceTickNs;
		const SexyVector2 oldVelocity(
			static_cast<float>(p.mLinearVelocity.x + p.mLinearAcceleration.x * oldTicks),
			static_cast<float>(p.mLinearVelocity.y + p.mLinearAcceleration.y * oldTicks));
		if (p.mLinearElapsedNs < 0)
		{
			p.mLinearOriginX = p.mPosition.x;
			p.mLinearOriginY = p.mPosition.y;
			p.mLinearElapsedNs = 0;
			p.mLinearVelocity = p.mVelocity;
			if (anchoredSpin) p.mLinearSpinOrigin = double(p.mSpinPosition) - DEG_TO_RAD(double(previousSpinAngle()));
		}
		else if (p.mVelocity.x != oldVelocity.x || p.mVelocity.y != oldVelocity.y ||
			acceleration.x != p.mLinearAcceleration.x || acceleration.y != p.mLinearAcceleration.y ||
			(anchoredSpin && (!p.mLinearSpinActive ||
				spinRate != p.mLinearSpinRate)))
		{
			p.mLinearOriginX += MotionDisplacement(p.mLinearVelocity.x, p.mLinearAcceleration.x, oldTicks);
			p.mLinearOriginY += MotionDisplacement(p.mLinearVelocity.y, p.mLinearAcceleration.y, oldTicks);
			if (anchoredSpin)
				p.mLinearSpinOrigin = p.mLinearSpinActive ?
					p.mLinearSpinOrigin + p.mLinearSpinRate * oldTicks :
					double(p.mSpinPosition) - DEG_TO_RAD(double(previousSpinAngle()));
			p.mLinearElapsedNs = 0;
			p.mLinearVelocity = p.mVelocity;
		}
		if (static_cast<std::uint64_t>(p.mLinearElapsedNs) > std::uint64_t(INT64_MAX) - deltaNs)
			throw std::overflow_error("particle linear segment exceeds clock range");
		p.mLinearElapsedNs += static_cast<std::int64_t>(deltaNs);
		p.mLinearAcceleration = acceleration;
		const double ticks = static_cast<double>(p.mLinearElapsedNs) / ParticleSourceTickNs;
		const double x = p.mLinearOriginX + MotionDisplacement(p.mLinearVelocity.x, acceleration.x, ticks);
		const double y = p.mLinearOriginY + MotionDisplacement(p.mLinearVelocity.y, acceleration.y, ticks);
		const double vx = p.mLinearVelocity.x + acceleration.x * ticks;
		const double vy = p.mLinearVelocity.y + acceleration.y * ticks;
		if (!std::isfinite(x) || !std::isfinite(y) ||
			!std::isfinite(vx) || !std::isfinite(vy) ||
			std::fabs(vx) > std::numeric_limits<float>::max() || std::fabs(vy) > std::numeric_limits<float>::max() ||
			std::fabs(x) > std::numeric_limits<float>::max() || std::fabs(y) > std::numeric_limits<float>::max())
			throw std::overflow_error("particle linear position exceeds float range");
		p.mPosition = SexyVector2(static_cast<float>(x), static_cast<float>(y));
		p.mVelocity = SexyVector2(static_cast<float>(vx), static_cast<float>(vy));
		p.mLinearSpinActive = anchoredSpin ? 1u : 0u;
		if (anchoredSpin)
		{
			const double spin = p.mLinearSpinOrigin + spinRate * ticks + DEG_TO_RAD(double(aSpinAngle));
			if (!std::isfinite(spin) || std::fabs(spin) > std::numeric_limits<float>::max())
				throw std::overflow_error("particle linear spin exceeds float range");
			p.mSpinPosition = static_cast<float>(spin);
			p.mLinearSpinRate = spinRate;
			sampledSpin = false;
		}
	}
	else if (!anchoredMotion)
	{
		// Feedback/variable fields remain discrete. A later constant segment must
		// start from their result rather than revive an old analytic origin.
		theParticle->mLinearElapsedNs = -1;
		theParticle->mLinearSpinActive = 0;
		theParticle->mPosition += theParticle->mVelocity * static_cast<float>(deltaTicks);
	}
	if (sampledSpin)
		theParticle->mSpinPosition += static_cast<float>(DEG_TO_RAD(aSpinSpeed * deltaTicks +
			aSpinAngle - previousSpinAngle()) + theParticle->mSpinVelocity * deltaTicks);

	if (FloatTrackIsSet(mEmitterDef->mAnimationRate))  // 如果定义了动画速率
	{
		if (theParticle->mAnimationElapsedNs > std::numeric_limits<std::int64_t>::max() - static_cast<std::int64_t>(deltaNs))
			throw std::overflow_error("particle animation elapsed time exceeds clock range");
		theParticle->mAnimationElapsedNs += static_cast<std::int64_t>(deltaNs);
		if (!TodParticleConstantAnimationRate(mEmitterDef->mAnimationRate))
		{
			const auto increment = SampleClockIncrement(FloatTrackEvaluate(mEmitterDef->mAnimationRate,
				aParticleTime, theParticle->mParticleInterp[ParticleTracks::TRACK_PARTICLE_ANIMATION_RATE]),
				deltaNs) % ParticleCycle;
			theParticle->mAnimationSampleIntegral = (theParticle->mAnimationSampleIntegral + increment) % ParticleCycle;
			if (theParticle->mAnimationSampleIntegral < 0) theParticle->mAnimationSampleIntegral += ParticleCycle;
		}
	}

	return true;
}

//0x517160
void TodParticleEmitter::UpdateSpawning(std::uint64_t deltaNs)
{
	TodParticleEmitter* aCrossFadeEmitter = mParticleSystem->mParticleHolder->mEmitters.DataArrayTryToGet((unsigned int)mCrossFadeEmitterID);
	TodParticleEmitter* aSpawningEmitter = !aCrossFadeEmitter ? this : aCrossFadeEmitter;  // 各项数据的计算均以此“主发射器”为准
	const auto& rateTrack = aSpawningEmitter->mEmitterDef->mSpawnRate;
	const auto rate = aSpawningEmitter->SystemTrackEvaluate(
		aSpawningEmitter->mEmitterDef->mSpawnRate, ParticleSystemTracks::TRACK_SPAWN_RATE);
	std::int64_t whole, fraction;
	if (rateTrack.mCountNodes == 1)
	{
		const auto after = ParticleClock::ConstantRateIntegral(mEmissionElapsedNs, rate);
		const auto before = ParticleClock::ConstantRateIntegral(mEmissionElapsedNs - static_cast<std::int64_t>(deltaNs), rate);
		whole = ReanimClock::Subtract(after.whole, before.whole);
		fraction = after.fraction - before.fraction;
	}
	else
	{
		const auto increment = SampleClockIncrement(rate, deltaNs);
		whole = increment / ParticleCycle;
		fraction = increment % ParticleCycle;
	}
	// Split before adding so even a valid near-int64 sampled rate cannot overflow.
	const auto fractional = mSpawnRemainder + fraction;
	auto count = ReanimClock::Add(whole, fractional / ParticleCycle);
	mSpawnRemainder = fractional % ParticleCycle;
	// A total-time phase can wrap backwards while its whole count increases.
	// Normalize the pair together; C++ truncation alone would emit too early.
	if (count > 0 && mSpawnRemainder < 0)
	{
		--count;
		mSpawnRemainder += ParticleCycle;
	}
	else if (count < 0 && mSpawnRemainder > 0)
	{
		++count;
		mSpawnRemainder -= ParticleCycle;
	}
	int aSpawnCount = static_cast<int>(std::clamp<std::int64_t>(count, 0, MAX_PARTICLES_SIZE));

	int aSpawnMinActive = (int)aSpawningEmitter->SystemTrackEvaluate(aSpawningEmitter->mEmitterDef->mSpawnMinActive, ParticleSystemTracks::TRACK_SPAWN_MIN_ACTIVE);
	if (aSpawnMinActive >= 0 && aSpawnCount < aSpawnMinActive - ParticleRosterCount())
		aSpawnCount = aSpawnMinActive - ParticleRosterCount();  // 至少确保将粒子数量增加至 aSpawnMinActive 个
	int aSpawnMaxActive = (int)aSpawningEmitter->SystemTrackEvaluate(aSpawningEmitter->mEmitterDef->mSpawnMaxActive, ParticleSystemTracks::TRACK_SPAWN_MAX_ACTIVE);
	if (aSpawnMaxActive >= 0 && aSpawnCount > aSpawnMaxActive - ParticleRosterCount())
		aSpawnCount = aSpawnMaxActive - ParticleRosterCount();  // 至多保证粒子数量不会超过 aSpawnMaxActive 个
	if (FloatTrackIsSet(aSpawningEmitter->mEmitterDef->mSpawnMaxLaunched))
	{
		int aSpawnMaxLaunched = aSpawningEmitter->SystemTrackEvaluate(aSpawningEmitter->mEmitterDef->mSpawnMaxLaunched, ParticleSystemTracks::TRACK_SPAWN_MAX_LAUNCHED);
		if (aSpawnCount > aSpawnMaxLaunched - mParticlesSpawned)
			aSpawnCount = aSpawnMaxLaunched - mParticlesSpawned;  // 确保发射数量不超过发射器总共能发射的最大数量
	}

	for (int i = 0; i < aSpawnCount; i++)
	{
		TodParticle* aParticle = SpawnParticle(i, aSpawnCount);
		if (aCrossFadeEmitter != nullptr && aParticle != nullptr)
			CrossFadeParticle(aParticle, aCrossFadeEmitter);
	}
}

//0x5172C0
void TodParticleEmitter::DeleteNonCrossFading()
{
	// 尾存倒序遍历（=原头→尾序）；下标直传 DeleteParticleAt（免逐粒 Find 扫）
	for (int i = ParticleRosterCount() - 1; i >= 0; i--)
	{
		TodParticle* aParticle = ParticleRosterParticleAt(i);
		if (aParticle->mCrossFadeDurationNs <= 0)  // 当粒子不处于交叉混合状态，则删除该粒子
			DeleteParticleAt(i, aParticle);
	}
}

//0x517300
void TodParticleEmitter::DeleteAll()
{
	while (ParticleRosterCount() != 0)
	{
		TodParticle* aParticle = ParticleRosterParticleAt(ParticleRosterCount() - 1);  // 尾=最新=原 RemoveHead
		ParticleRosterRemoveAt(ParticleRosterCount() - 1);
		mParticleSystem->mParticleHolder->mParticles.DataArrayFree(aParticle);
	}
}

//0x517370
// GOTY @Patoke: 0x521A20
void TodParticleSystem::Update()
{
	Update(Sexy::gUpdateIntervalNs);
}

void TodParticleSystem::Update(std::uint64_t deltaNs)
{
	if (mDontUpdate || deltaNs == 0) return;
	if (deltaNs > INT64_MAX) throw std::overflow_error("particle update exceeds clock range");
	bool aEmitterAlive = false;
	const int aEmitterCount = EmitterRosterCount();
	// Capture identities before any emitter can create a crossfade target in
	// another existing emitter. New births receive their first step next time.
	std::array<ParticleID, PARTICLE_POOL_CAPACITY> particles;
	std::array<int, PARTICLE_POOL_CAPACITY + 1> particleOffsets;
	int particleCount = 0;
	for (int i = 0; i < aEmitterCount; ++i)
	{
		particleOffsets[i] = particleCount;
		const auto* emitter = EmitterRosterEmitterAt(i);
		for (int p = 0; p < emitter->ParticleRosterCount(); ++p)
			particles[particleCount++] = emitter->ParticleRosterIDAt(p);
	}
	particleOffsets[aEmitterCount] = particleCount;
	// Attachments supply held input. Apply each change once in this main step;
	// there is no independent simulation clock or pending fraction.
	for (int i = 0; i < aEmitterCount; i++)
	{
		TodParticleEmitter* e = EmitterRosterEmitterAt(i);
		const SexyVector2 change = e->mExternalTarget - e->mExternalAppliedCenter;
		e->mExternalAppliedCenter = e->mExternalTarget;
		e->mSystemCenter += change;
		if ((change.x != 0 || change.y != 0) &&
			!TestBit(e->mEmitterDef->mParticleFlags, (int)ParticleFlags::PARTICLE_PARTICLES_DONT_FOLLOW))
			for (int p = e->ParticleRosterCount() - 1; p >= 0; --p)
			{
				auto& particle = *e->ParticleRosterParticleAt(p);
				if (particle.mLinearElapsedNs >= 0)
				{
					particle.mLinearOriginX += change.x;
					particle.mLinearOriginY += change.y;
				}
				particle.mPosition += change;
			}
	}
	for (int i = 0; i < aEmitterCount; i++)
	{
		TodParticleEmitter* emitter = EmitterRosterEmitterAt(i);
		emitter->Update(deltaNs, std::span<const ParticleID>(particles.data() + particleOffsets[i],
			particleOffsets[i + 1] - particleOffsets[i]));
		if ((FloatTrackIsSet(emitter->mEmitterDef->mCrossFadeDuration) && emitter->ParticleRosterCount() > 0) || !emitter->mDead)
			aEmitterAlive = true;
	}
	if (!aEmitterAlive) mDead = true;
}

//0x5173E0
bool TodParticleEmitter::CrossFadeParticle(TodParticle* theParticle, TodParticleEmitter* theToEmitter)
{
	if (theParticle->mCrossFadeDurationNs > 0)  // 粒子已处于交叉混合的过程中
	{
		TodTrace("We don't support cross fading more than one at a time\n");
		return false;
	}
	if (!FloatTrackIsSet(theToEmitter->mEmitterDef->mCrossFadeDuration))  // 目标发射器未设定交叉混合时长轨道
	{
		TodTrace("Can't cross fade to emitter that doesn't have CrossFadeDuration");
		return false;
	}
	TOD_ASSERT(theToEmitter != this);  // 不能交叉混合至自身

	TodParticle* aToParticle = theToEmitter->SpawnParticle(0, 1);
	if (aToParticle == nullptr)
		return false;
	if (mEmitterCrossFadeCountDownNs > 0)  // 如果源发射器正处于交叉混合过程中
		theParticle->mCrossFadeDurationNs = mEmitterCrossFadeCountDownNs;  // 源粒子的交叉混合的时长即为源发射器交叉混合的剩余时长
	else
	{
		float aCrossFadeDurationInterp = RandomFloat(1.0f);
		theParticle->mCrossFadeDurationNs = Sexy::TimeCounter::Encode(FloatTrackEvaluate(theToEmitter->mEmitterDef->mCrossFadeDuration,
			SystemTime(*this), aCrossFadeDurationInterp));
		theParticle->mCrossFadeDurationNs = std::max(ParticleSourceTickNs, theParticle->mCrossFadeDurationNs);
	}
	if (!FloatTrackIsSet(theToEmitter->mEmitterDef->mParticleDuration))  // 如果目标发射器未定义粒子持续时间
	{
		aToParticle->mParticleDurationNs = theParticle->mCrossFadeDurationNs;  // 目标粒子的持续时间等于交叉混合的时间
	}
	aToParticle->mCrossFadeParticleID = (ParticleID)mParticleSystem->mParticleHolder->mParticles.DataArrayGetID(theParticle);  // 赋值交叉混合来源的粒子编号
	return true;
}

//0x517490
void TodParticleEmitter::DeleteParticle(TodParticle* theParticle)
{
	DeleteParticleAt(ParticleRosterFind(theParticle), theParticle);  // 线性找槽位（交叉源级联等下标未知方）
}

// 下标化删除核心：调用方（更新循环/DeleteNonCrossFading）已知名册下标直入，
// 省 Find 的槽位线性探测。交叉源递归删在移除**之前**发生、且可能经
// A→B→A 链删掉本行更旧条目使下标漂移——递归后槽位一次校验（一载一比），
// 漂移（罕见）才回退 Find。
void TodParticleEmitter::DeleteParticleAt(int theRosterIndex, TodParticle* theParticle)
{
	TodParticle* aCrossFadeParticle = mParticleSystem->mParticleHolder->mParticles.DataArrayTryToGet((unsigned int)theParticle->mCrossFadeParticleID);
	if (aCrossFadeParticle != nullptr)
	{
		aCrossFadeParticle->mParticleEmitter->DeleteParticle(aCrossFadeParticle);  // 同时删除交叉混合的源粒子
		theParticle->mCrossFadeParticleID = ParticleID::PARTICLEID_NULL;
	}

	if (theRosterIndex < 0 || theRosterIndex >= ParticleRosterCount() ||
		ParticleRosterParticleAt(theRosterIndex) != theParticle)  // 级联漂移校验
		theRosterIndex = ParticleRosterFind(theParticle);
	if (theRosterIndex >= 0)
		ParticleRosterRemoveAt(theRosterIndex);
	mParticleSystem->mParticleHolder->mParticles.DataArrayFree(theParticle);
}

//0x517550
void TodParticleEmitter::Update(std::uint64_t deltaNs)
{
	std::array<ParticleID, PARTICLE_POOL_CAPACITY> particles;
	const auto count = ParticleRosterCount();
	for (int i = 0; i < count; ++i) particles[i] = ParticleRosterIDAt(i);
	Update(deltaNs, std::span<const ParticleID>(particles.data(), count));
}

void TodParticleEmitter::Update(std::uint64_t deltaNs, std::span<const ParticleID> particles)
{
	if (mDead || deltaNs == 0)
		return;

	if (!mSystemPositionBound)
		SampleSystemPosition(SystemTime(*this));
	if (deltaNs > INT64_MAX || mSystemAgeNs > INT64_MAX - static_cast<std::int64_t>(deltaNs))
		throw std::overflow_error("particle emitter lifetime exceeds clock range");
	const bool loops = TestBit(mEmitterDef->mParticleFlags, (unsigned int)ParticleFlags::PARTICLE_SYSTEM_LOOPS);
	auto spawnDelta = loops ? deltaNs : std::min<std::uint64_t>(deltaNs,
		mSystemAgeNs >= mSystemDurationNs ? 0 : ReanimClock::Subtract(mSystemDurationNs, mSystemAgeNs));
	if (mCrossFadeEmitterID != ParticleEmitterID::PARTICLEEMITTERID_NULL)
		spawnDelta = std::min<std::uint64_t>(spawnDelta,
			std::max<std::int64_t>(0, mEmitterCrossFadeCountDownNs));
	if (mEmissionElapsedNs > INT64_MAX - static_cast<std::int64_t>(spawnDelta))
		throw std::overflow_error("particle emission lifetime exceeds clock range");
	mEmissionElapsedNs += static_cast<std::int64_t>(spawnDelta);
	mSystemAgeNs += static_cast<std::int64_t>(deltaNs);
	bool aDie = false;
	if (mSystemAgeNs >= mSystemDurationNs)  // 发射器的生命周期结束时
	{
		if (loops)
			mSystemAgeNs %= mSystemDurationNs;
		else
		{
			mSystemAgeNs = mSystemDurationNs;
			aDie = true;
		}
	}

	if (mEmitterCrossFadeCountDownNs > 0)
	{
		mEmitterCrossFadeCountDownNs -= std::min<std::int64_t>(
			static_cast<std::int64_t>(deltaNs), mEmitterCrossFadeCountDownNs);
		if (mEmitterCrossFadeCountDownNs == 0)
			aDie = true;
	}
	if (mCrossFadeEmitterID != ParticleEmitterID::PARTICLEEMITTERID_NULL)
	{
		TodParticleEmitter* aCrossFadeEmitter = mParticleSystem->mParticleHolder->mEmitters.DataArrayTryToGet(mCrossFadeEmitterID);
		if (mEmitterCrossFadeCountDownNs <= 0 || aCrossFadeEmitter == nullptr || aCrossFadeEmitter->mDead)
			aDie = true;
	}

	SampleSystemPosition(mEmitterDef->mSystemFields.count ? SystemTime(*this) : 0.0);
	// 尾存倒序遍历（=原头→尾序）；下标直传 DeleteParticleAt（免逐粒 Find 扫）；
	// DeleteParticle 递归删交叉源可能改本行更低（更旧）下标——memmove 后
	// i-- 恰落到下一个更旧粒子，语义与原"预存 next"逐字一致
	for (int i = static_cast<int>(particles.size()) - 1; i >= 0; i--)
	{
		TodParticle* aParticle = mParticleSystem->mParticleHolder->mParticles.DataArrayTryToGet(
			static_cast<unsigned int>(particles[i]));
		if (!aParticle || aParticle->mParticleEmitter != this) continue;
		if (!UpdateParticle(aParticle, deltaNs))
			DeleteParticleAt(i, aParticle);
	}
	if (spawnDelta != 0) UpdateSpawning(spawnDelta);

	if (aDie)
	{
		DeleteNonCrossFading();
		if (ParticleRosterCount() == 0)
		{
			mDead = true;
			return;
		}
	}
}

//0x518210
void TodParticleEmitter::DrawParticle(Graphics* g, TodParticle* theParticle)
{
	TodParticleDrawGpu(*g, *theParticle);
}

//0x518370
void TodParticleSystem::Draw(Graphics* g)
{
	const int aDrawCount = EmitterRosterCount();
	for (int i = 0; i < aDrawCount; i++)
		EmitterRosterEmitterAt(i)->Draw(g);
}

//0x5183A0
void TodParticleEmitter::Draw(Graphics* g)
{
	if (TestBit(mEmitterDef->mParticleFlags, (int)ParticleFlags::PARTICLE_SOFTWARE_ONLY))
		return;

	// 尾存倒序遍历（=原头→尾序=新→旧叠放序）
	const int aProbeCount = ParticleRosterCount();
	for (int i = aProbeCount - 1; i >= 0; i--)
		DrawParticle(g, ParticleRosterParticleAt(i));
}

//0x518440
void TodParticleSystem::SystemMove(float theX, float theY)
{
	const int aMoveCount = EmitterRosterCount();
	for (int i = 0; i < aMoveCount; i++)
		EmitterRosterEmitterAt(i)->SystemMove(theX, theY);
}

//0x518480
void TodParticleEmitter::SystemMove(float theX, float theY)
{
	mExternalTarget.x = theX;
	mExternalTarget.y = theY;
}

//0x518560
void TodParticleSystem::OverrideColor(ParticleEmitterNameRange theRange, const Color& theColor)
{
	const int aRosterCount = EmitterRosterCount();
	for (int i = 0; i < aRosterCount; i++)
	{
		TodParticleEmitter* aEmitter = EmitterRosterEmitterAt(i);
		if (theRange.Contains(static_cast<ParticleEmitterName>(aEmitter->mEmitterDef->mNameId)))
			aEmitter->mColorOverride = theColor;
	}
}

void TodParticleSystem::OverrideColor(ParticleEmitterName theName, const Color& theColor)
{
	const int aRosterCount = EmitterRosterCount();
	for (int i = 0; i < aRosterCount; i++)
	{
		TodParticleEmitter* aEmitter = EmitterRosterEmitterAt(i);
		if (static_cast<ParticleEmitterName>(aEmitter->mEmitterDef->mNameId) == theName)
			aEmitter->mColorOverride = theColor;
	}
}


//0x5185D0
void TodParticleSystem::OverrideExtraAdditiveDraw(ParticleEmitterNameRange theRange, bool theEnableExtraAdditiveDraw)
{
	const int aRosterCount = EmitterRosterCount();
	for (int i = 0; i < aRosterCount; i++)
	{
		TodParticleEmitter* aEmitter = EmitterRosterEmitterAt(i);
		if (theRange.Contains(static_cast<ParticleEmitterName>(aEmitter->mEmitterDef->mNameId)))
			aEmitter->mExtraAdditiveDrawOverride = theEnableExtraAdditiveDraw;
	}
}

void TodParticleSystem::OverrideExtraAdditiveDraw(ParticleEmitterName theName, bool theEnableExtraAdditiveDraw)
{
	const int aRosterCount = EmitterRosterCount();
	for (int i = 0; i < aRosterCount; i++)
	{
		TodParticleEmitter* aEmitter = EmitterRosterEmitterAt(i);
		if (static_cast<ParticleEmitterName>(aEmitter->mEmitterDef->mNameId) == theName)
			aEmitter->mExtraAdditiveDrawOverride = theEnableExtraAdditiveDraw;
	}
}


//0x518560
void TodParticleSystem::OverrideFrame(ParticleEmitterNameRange theRange, int theFrame)
{
	const int aRosterCount = EmitterRosterCount();
	for (int i = 0; i < aRosterCount; i++)
	{
		TodParticleEmitter* aEmitter = EmitterRosterEmitterAt(i);
		if (theRange.Contains(static_cast<ParticleEmitterName>(aEmitter->mEmitterDef->mNameId)))
			aEmitter->mFrameOverride = theFrame;
	}
}

void TodParticleSystem::OverrideFrame(ParticleEmitterName theName, int theFrame)
{
	const int aRosterCount = EmitterRosterCount();
	for (int i = 0; i < aRosterCount; i++)
	{
		TodParticleEmitter* aEmitter = EmitterRosterEmitterAt(i);
		if (static_cast<ParticleEmitterName>(aEmitter->mEmitterDef->mNameId) == theName)
			aEmitter->mFrameOverride = theFrame;
	}
}


//0x518630
void TodParticleSystem::OverrideScale(ParticleEmitterNameRange theRange, float theScale)
{
	const int aRosterCount = EmitterRosterCount();
	for (int i = 0; i < aRosterCount; i++)
	{
		TodParticleEmitter* aEmitter = EmitterRosterEmitterAt(i);
		if (theRange.Contains(static_cast<ParticleEmitterName>(aEmitter->mEmitterDef->mNameId)))
			aEmitter->mScaleOverride = theScale;
	}
}

void TodParticleSystem::OverrideScale(ParticleEmitterName theName, float theScale)
{
	const int aRosterCount = EmitterRosterCount();
	for (int i = 0; i < aRosterCount; i++)
	{
		TodParticleEmitter* aEmitter = EmitterRosterEmitterAt(i);
		if (static_cast<ParticleEmitterName>(aEmitter->mEmitterDef->mNameId) == theName)
			aEmitter->mScaleOverride = theScale;
	}
}




//0x5186D0
void TodParticleEmitter::CrossFadeEmitter(TodParticleEmitter* theToEmitter)
{
	if (mEmitterCrossFadeCountDownNs > 0)
	{
		TodTraceAndLog("We don't support cross fading emitters more than one at a time\n");
		return;
	}
	if (!FloatTrackIsSet(theToEmitter->mEmitterDef->mCrossFadeDuration))
	{
		TodTrace("Can't cross fade to emitter that doesn't have CrossFadeDuration");
		return;
	}
	TOD_ASSERT(theToEmitter != this);

	float aCrossFadeDurationInterp = RandomFloat(1.0f);
	mEmitterCrossFadeCountDownNs = Sexy::TimeCounter::Encode(FloatTrackEvaluate(theToEmitter->mEmitterDef->mCrossFadeDuration, SystemTime(*this), aCrossFadeDurationInterp));
	mEmitterCrossFadeCountDownNs = std::max(ParticleSourceTickNs, mEmitterCrossFadeCountDownNs);
	mCrossFadeEmitterID = (ParticleEmitterID)mParticleSystem->mParticleHolder->mEmitters.DataArrayGetID(theToEmitter);
	if (!FloatTrackIsSet(theToEmitter->mEmitterDef->mSystemDuration))
		theToEmitter->mSystemDurationNs = mEmitterCrossFadeCountDownNs;

	const int aXFadeParticleCount = ParticleRosterCount();
	for (int i = aXFadeParticleCount - 1; i >= 0; i--)
		CrossFadeParticle(ParticleRosterParticleAt(i), theToEmitter);
}

//0x518790
void TodParticleSystem::CrossFade(ParticleEmitterName theName)
{
	const auto aId = static_cast<std::size_t>(theName);
	const int aIndex = aId < mParticleDef->mEmitterIndexByName.size()
		? mParticleDef->mEmitterIndexByName[aId] : -1;
	TodEmitterDefinition* aEmitterDef = aIndex >= 0
		? &mParticleDef->mEmitterDefs[aIndex] : nullptr;
	if (aEmitterDef == nullptr)
	{
		TodTraceAndLog("Can't find cross fade emitter id %u\n", static_cast<std::uint32_t>(theName));
		return;
	}
	if (!FloatTrackIsSet(aEmitterDef->mCrossFadeDuration))
	{
		TodTraceAndLog("Can't cross fade without duration set\n");
		return;
	}
	const int aXFadeCount = EmitterRosterCount();
	if (mParticleHolder->mEmitters.mSize + aXFadeCount > mParticleHolder->mEmitters.mMaxSize)
	{
		TodTraceAndLog("Too many emitters to cross fade\n");
		ParticleSystemDie();
		return;
	}

	// Appended target emitters do not participate as sources in this call.
	for (int i = 0; i < aXFadeCount; i++)
	{
		TodParticleEmitter* aEmitter = EmitterRosterEmitterAt(i);
		if (aEmitter->mEmitterDef != aEmitterDef)
		{
			TodParticleEmitter* aCrossFadeEmitter = mParticleHolder->mEmitters.DataArrayAlloc();
			aCrossFadeEmitter->TodEmitterInitialize(aEmitter->mSystemCenter.x, aEmitter->mSystemCenter.y, this, aEmitterDef);
			if (!EmitterRosterAdd(aCrossFadeEmitter))
			{
				mParticleHolder->mEmitters.DataArrayFree(aCrossFadeEmitter);
				continue;
			}
			aEmitter->CrossFadeEmitter(aCrossFadeEmitter);
		}
	}
}

void TodParticleSystem::CrossFade(ParticleEmitterNameRange theRange)
{
	// A range resolves one target, in definition declaration order.
	for (int i = 0; i < mParticleDef->mEmitterDefCount; i++)
	{
		const ParticleEmitterName aName = static_cast<ParticleEmitterName>(mParticleDef->mEmitterDefs[i].mNameId);
		if (theRange.Contains(aName))
		{
			CrossFade(aName);
			return;
		}
	}
}

// ── 发射器名册紧凑侧表（2026-10-04 P3 第一步，用户裁决）──
// 按系统池槽位键控（格桶/行段桶同款派生索引先例）；成员 mEmitterList 已
// 退役（保留以钉 sizeof/dat64 分段）。迭代从"链表节点(24B)→ID→池槽"
// 三跳缩为"2B 槽号数组→池槽"一跳；AddTail 序=原链表序逐字保持。
// 清册纪律：ParticleSystemDie/析构/池 free/FreeAll 全挂钩，槽位回收后
// 新系统复用键前必清。
namespace
{
constexpr int EMITTER_ROSTER_MAX = 64;
constexpr int PARTICLE_ROSTER_MAX = 256;
}  // namespace

// Dense slot rows belong to the supplied data, not to an individual holder view.
struct TodParticleRosterStorage
{
	struct EmitterRosterRow
	{
		uint32_t mOwnerKey;
		uint16_t mSlots[EMITTER_ROSTER_MAX];
		uint16_t mCount;
	};

	struct ParticleRosterRow
	{
		uint32_t mOwnerKey;
		uint16_t mSlots[PARTICLE_ROSTER_MAX];
		uint16_t mCount;
	};

	EmitterRosterRow mEmitterRosters[PARTICLE_POOL_CAPACITY];
	ParticleRosterRow mParticleRosters[PARTICLE_POOL_CAPACITY];

	static EmitterRosterRow* EmitterRosterRowFor(const TodParticleSystem* theSystem)
	{
		// Unbound systems are valid during construction and interrupted loads.
		if (theSystem->mParticleHolder == nullptr)
			return nullptr;
		auto& aHolder = *theSystem->mParticleHolder;
		auto& aPool = aHolder.mParticleSystems;
		const unsigned int aSlot = aPool.DataArrayIndexOf(theSystem);
		EmitterRosterRow& aRow = aHolder.mData->mRosterStorage->mEmitterRosters[aSlot];
		const uint32_t aOwnerKey = (uint32_t)aPool.DataArrayGetID(const_cast<TodParticleSystem*>(theSystem));
		if (aRow.mOwnerKey != aOwnerKey)
		{
			aRow.mOwnerKey = aOwnerKey;
			aRow.mCount = 0;
		}
		return &aRow;
	}

	static ParticleRosterRow* ParticleRosterRowFor(const TodParticleEmitter* theEmitter)
	{
		if (theEmitter->mParticleSystem == nullptr || theEmitter->mParticleSystem->mParticleHolder == nullptr)
			return nullptr;
		auto& aHolder = *theEmitter->mParticleSystem->mParticleHolder;
		auto& aPool = aHolder.mEmitters;
		const unsigned int aSlot = aPool.DataArrayIndexOf(theEmitter);
		ParticleRosterRow& aRow = aHolder.mData->mRosterStorage->mParticleRosters[aSlot];
		const uint32_t aOwnerKey = (uint32_t)aPool.DataArrayGetID(const_cast<TodParticleEmitter*>(theEmitter));
		if (aRow.mOwnerKey != aOwnerKey)
		{
			aRow.mOwnerKey = aOwnerKey;
			aRow.mCount = 0;
		}
		return &aRow;
	}
};

TodParticleData::TodParticleData() = default;

//0x518870
TodParticleData::~TodParticleData()
{
	Dispose();
}

TodParticleHolder::TodParticleHolder(TodParticleData* theData)
	: mParticleSystems(theData->mParticleSystems),
	  mEmitters(theData->mEmitters), mParticles(theData->mParticles), mData(theData)
{
}

int TodParticleSystem::EmitterRosterCount() const
{
	auto* aRow = TodParticleRosterStorage::EmitterRosterRowFor(this);
	return aRow ? aRow->mCount : 0;
}

TodParticleEmitter* TodParticleSystem::EmitterRosterEmitterAt(int theIndex) const
{
	auto* aRow = TodParticleRosterStorage::EmitterRosterRowFor(this);
	if (aRow == nullptr || (unsigned)theIndex >= aRow->mCount)
		return nullptr;
	return &mParticleHolder->mEmitters.mBlock[aRow->mSlots[theIndex]].mItem;
}

ParticleEmitterID TodParticleSystem::EmitterRosterIDAt(int theIndex) const
{
	auto* aRow = TodParticleRosterStorage::EmitterRosterRowFor(this);
	if (aRow == nullptr || (unsigned)theIndex >= aRow->mCount)
		return (ParticleEmitterID)0;
	return (ParticleEmitterID)mParticleHolder->mEmitters.DataArrayGetID(&mParticleHolder->mEmitters.mBlock[aRow->mSlots[theIndex]].mItem);
}

bool TodParticleSystem::EmitterRosterAdd(TodParticleEmitter* theEmitter)
{
	auto* aRow = TodParticleRosterStorage::EmitterRosterRowFor(this);
	if (aRow == nullptr)
		return false;
	if (aRow->mCount >= EMITTER_ROSTER_MAX)
	{
		TodTrace("Too many emitters in roster\n");
		return false;
	}
	aRow->mSlots[aRow->mCount++] = (uint16_t)mParticleHolder->mEmitters.DataArrayIndexOf(theEmitter);
	return true;
}

void TodParticleSystem::EmitterRosterClear()
{
	auto* aRow = TodParticleRosterStorage::EmitterRosterRowFor(this);
	if (aRow != nullptr)
		aRow->mCount = 0;
}

// ── 粒子名册紧凑侧表（2026-10-04 P3 第二步，用户裁决）──
// 按发射器池槽位键控 + 世代键行主自失效（发射器侧表同款，装载
// ClearNativeObject memset 不经钩子的防陈旧机制）；尾存倒序遍历保
// AddHead 头→尾序（AddHead 的 O(1) 由尾插达成）；倒序迭代中删除只
// memmove 已遍历过的新侧段。容量 256/发射器，溢界拒生=池满同款。
int TodParticleEmitter::ParticleRosterCount() const
{
	auto* aRow = TodParticleRosterStorage::ParticleRosterRowFor(this);
	return aRow ? aRow->mCount : 0;
}

TodParticle* TodParticleEmitter::ParticleRosterParticleAt(int theIndex) const
{
	auto* aRow = TodParticleRosterStorage::ParticleRosterRowFor(this);
	if (aRow == nullptr || (unsigned)theIndex >= aRow->mCount)
		return nullptr;
	return &mParticleSystem->mParticleHolder->mParticles.mBlock[aRow->mSlots[theIndex]].mItem;
}

ParticleID TodParticleEmitter::ParticleRosterIDAt(int theIndex) const
{
	auto* aRow = TodParticleRosterStorage::ParticleRosterRowFor(this);
	if (aRow == nullptr || (unsigned)theIndex >= aRow->mCount)
		return ParticleID::PARTICLEID_NULL;
	return (ParticleID)mParticleSystem->mParticleHolder->mParticles.DataArrayGetID(
		&mParticleSystem->mParticleHolder->mParticles.mBlock[aRow->mSlots[theIndex]].mItem);
}

bool TodParticleEmitter::ParticleRosterAdd(TodParticle* theParticle)
{
	auto* aRow = TodParticleRosterStorage::ParticleRosterRowFor(this);
	if (aRow == nullptr)
		return false;
	if (aRow->mCount >= PARTICLE_ROSTER_MAX)
	{
		TodTraceWithoutSpamming("Too many particles in roster (emitter id=%u)\n", static_cast<unsigned>(mEmitterDef->mNameId));
		return false;
	}
	aRow->mSlots[aRow->mCount++] = (uint16_t)mParticleSystem->mParticleHolder->mParticles.DataArrayIndexOf(theParticle);
	return true;
}

int TodParticleEmitter::ParticleRosterFind(TodParticle* theParticle) const
{
	auto* aRow = TodParticleRosterStorage::ParticleRosterRowFor(this);
	if (aRow == nullptr)
		return -1;
	const uint16_t aSlot = (uint16_t)mParticleSystem->mParticleHolder->mParticles.DataArrayIndexOf(theParticle);
	for (int i = 0; i < aRow->mCount; i++)
		if (aRow->mSlots[i] == aSlot)
			return i;
	return -1;
}

void TodParticleEmitter::ParticleRosterRemoveAt(int theIndex)
{
	auto* aRow = TodParticleRosterStorage::ParticleRosterRowFor(this);
	if (aRow == nullptr || (unsigned)theIndex >= aRow->mCount)
		return;
	std::memmove(&aRow->mSlots[theIndex], &aRow->mSlots[theIndex + 1],
		(aRow->mCount - theIndex - 1) * sizeof(uint16_t));
	aRow->mCount--;
}

void TodParticleEmitter::ParticleRosterClear()
{
	auto* aRow = TodParticleRosterStorage::ParticleRosterRowFor(this);
	if (aRow != nullptr)
		aRow->mCount = 0;
}

//0x518900
void TodParticleData::Initialize()
{
	mRosterStorage = std::make_unique<TodParticleRosterStorage>();
	mParticleSystems.DataArrayInitialize(PARTICLE_POOL_CAPACITY, DataArrayKind::ParticleSystems);
	mEmitters.DataArrayInitialize(PARTICLE_POOL_CAPACITY, DataArrayKind::ParticleEmitters);
	mParticles.DataArrayInitialize(PARTICLE_POOL_CAPACITY, DataArrayKind::Particles);
}

//0x5189A0
void TodParticleData::Dispose()
{
	mParticleSystems.DataArrayDispose();
	mEmitters.DataArrayDispose();
	mParticles.DataArrayDispose();
	// Pool object destructors must finish before their roster rows are released.
	mRosterStorage.reset();
}

bool TodParticleHolder::IsOverLoaded()
{
	return mParticleSystems.mSize > MAX_PARTICLES_SIZE || mEmitters.mSize > MAX_PARTICLES_SIZE || mParticles.mSize > MAX_PARTICLES_SIZE;
}

TodParticleSystem* TodParticleHolder::AllocParticleSystemFromDef(float theX, float theY, int theRenderOrder, TodParticleDefinition* theDefinition, ParticleEffect theParticleEffect, std::uint32_t theVariant)
{
	if (!theDefinition || theVariant>=theDefinition->mVariantCount)
		throw std::out_of_range("particle appearance variant out of range");
	if (mParticleSystems.mSize == mParticleSystems.mMaxSize)
	{
		TodTrace("Too many particle systems\n");
		return nullptr;
	}
	if (theDefinition->mEmitterDefCount + mEmitters.mSize > mEmitters.mMaxSize)
	{
		TodTrace("Too many particle emitters\n");
		return nullptr;
	}

	TodParticleSystem* aTodParticle = mParticleSystems.DataArrayAlloc();
	aTodParticle->mParticleHolder = this;
	aTodParticle->TodParticleInitializeFromDef(theX, theY, theRenderOrder, theDefinition, theParticleEffect, theVariant);
	return aTodParticle;
}

//0x518A70
TodParticleSystem* TodParticleHolder::AllocParticleSystem(float theX, float theY, int theRenderOrder, ParticleEffect theParticleEffect, std::uint32_t theVariant)
{
	TOD_ASSERT((int)theParticleEffect >= 0 && (int)theParticleEffect < gParticleDefCount);
	return AllocParticleSystemFromDef(theX, theY, theRenderOrder, &gParticleDefArray[(int)theParticleEffect], theParticleEffect, theVariant);
}
