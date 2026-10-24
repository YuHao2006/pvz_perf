#include "Board.h"
#include "Plant.h"
#include "Zombie.h"
#include "ZombieFlags.h"
#include "Cutscene.h"
#include "Projectile.h"
#include "ProjectileMotion.h"
#include "PlantFlags.h"
#include "LawnApp.h"
#include "Resources.h"
#include "GameConstants.h"
#include "Sexy.TodLib/TodFoley.h"
#include "Sexy.TodLib/TodDebug.h"
#include "Sexy.TodLib/Reanimator.h"
#include "Sexy.TodLib/Attachment.h"
#include "Sexy.TodLib/EffectSystem.h"
#include "Widget/AchievementsWidget.h"
#include "ProjectileResources.h"
#include "Sexy.TodLib/DefinitionImageRegion.h"
#include "Sexy.TodLib/generated/GeneratedDefinitions.h"
#include "graphics/RenderInterface.h"
#include "graphics/TextureSource.h"

namespace
{
auto& gProjectileResources = GeneratedDefinitions::Projectiles;
static_assert((int)ProjectileType::NUM_PROJECTILES == 14);

std::int64_t ProjectileNow(const Projectile& projectile)
{
	const auto now = projectile.mBoard->mLevelTimeNs;
	if (now > INT64_MAX) throw std::overflow_error("projectile timestamp exceeds clock range");
	return static_cast<std::int64_t>(now);
}
double ProjectileAge(const Projectile& projectile)
{
	return ProjectileMotionMath::Ticks(ProjectileNow(projectile), projectile.mCreationTimeNs);
}
double MotionTime(const Projectile& projectile)
{
	return ProjectileMotionMath::Ticks(ProjectileNow(projectile), projectile.mMotionOriginTimeNs);
}
double LobAcceleration(const Projectile& projectile)
{
	return projectile.mAccZ * (projectile.mApp->mGameMode == GameMode::GAMEMODE_LIMBO_HIGH_GRAVITY ? 2.0 : 1.0);
}
double RoofOffset(const Projectile& projectile)
{
	return projectile.mBoard->GetPosYBasedOnRow(projectile.mPosX, projectile.mRow) -
		projectile.mBoard->GetPosYBasedOnRow(projectile.mOriginX, projectile.mRow);
}
}

void ProjectileLoadResources()
{
	GeneratedDefinitions::LoadProjectileImages();
}

void ProjectileFreeResources()
{
	GeneratedDefinitions::ReleaseProjectileImages();
}

static ProjectileDefinition gProjectileDefinition[] = {  //0x69F1C0
	{ ProjectileType::PROJECTILE_PEA,           20  },
	{ ProjectileType::PROJECTILE_SNOWPEA,       20  },
	{ ProjectileType::PROJECTILE_CABBAGE,       40  },
	{ ProjectileType::PROJECTILE_MELON,         80  },
	{ ProjectileType::PROJECTILE_PUFF,          20  },
	{ ProjectileType::PROJECTILE_WINTERMELON,   80  },
	{ ProjectileType::PROJECTILE_FIREBALL,      40  },
	{ ProjectileType::PROJECTILE_STAR,          20  },
	{ ProjectileType::PROJECTILE_SPIKE,         20  },
	{ ProjectileType::PROJECTILE_BASKETBALL,    75  },
	{ ProjectileType::PROJECTILE_KERNEL,        20  },
	{ ProjectileType::PROJECTILE_COBBIG,        300 },
	{ ProjectileType::PROJECTILE_BUTTER,        40  },
	{ ProjectileType::PROJECTILE_ZOMBIE_PEA,    20  }
};

Projectile::Projectile()
{
}

Projectile::~Projectile()
{
	AttachmentDie(mAttachmentID);
}

//0x46C730
void Projectile::ProjectileInitialize(int theX, int theY, int theRenderOrder, int theRow, ProjectileType theProjectileType)
{
	int aGridX = mBoard->PixelToGridXKeepOnBoard(theX, theY);
	mProjectileType = theProjectileType;
	mPosX = theX;
	mPosY = theY;
	mPosZ = 0.0f;
	mVelX = 3.33f;
	mVelY = 0.0f;
	mVelZ = 0.0f;
	mAccZ = 0.0f;
	mShadowY = mBoard->GridToPixelY(aGridX, theRow) + 67.0f;
	mHitTorchwoodGridX = -1;
	mMotionType = ProjectileMotion::MOTION_STRAIGHT;
	mRow = theRow;
	mCobTargetX = 0.0f;
	mDamageRangeFlags = 0;
	mDead = false;
	mAttachmentID = AttachmentID::ATTACHMENTID_NULL;
	mCobTargetRow = 0;
	mTargetZombieID = ZombieID::ZOMBIEID_NULL;
	mOnHighGround = mBoard->mGridSquareType[aGridX][theRow] == GridSquareType::GRIDSQUARE_HIGH_GROUND;
	// GOTY 1.2.0.1073 only raises the projectile shadow on the left roof slope.
	if (mBoard->StageHasRoof() && theX < 480)
	{
		mShadowY -= 12.0f;
	}
	mRenderOrder = theRenderOrder;
	mRotation = 0.0f;
	mRotationSpeed = 0.0f;
	mWidth = mProjectileType == ProjectileType::PROJECTILE_COBBIG ?
		gProjectileResources.mProjectiles[mProjectileType].mSource.mWidth : 40;
	mHeight = mProjectileType == ProjectileType::PROJECTILE_COBBIG ?
		gProjectileResources.mProjectiles[mProjectileType].mSource.mHeight : 40;

	// B 形态 -> 常量表 kProjInitRows（原 9 支链合并；行序 = ProjectileType 枚举序
	// 0..13，NUM_PROJECTILES 锚定）。mSpeedLo/mSpeedHi 双 0 槽 = 原链不改角速度
	// （亦不消耗 RNG）；FIREBALL 断言在表外，COBBIG 尺寸来自编译后的源矩形；零槽 =
	// 原链不匹配。
	static constexpr struct {
		float mRotation;            // 初始角（mRandomRot 时忽略）
		float mSpeedLo;             // 角速度区间；双 0 = 不赋值
		float mSpeedHi;
		float mShadowDY;            // mShadowY 修正；0 = 不修正
		ParticleEffect mTrail;      // 附加尾迹粒子；PARTICLE_NONE = 无
		float mTrailOffX;
		float mTrailOffY;
		bool mRandomRot;            // 初始角随机取 [0,2PI)
		bool mFlipSpeed;            // 50% 概率角速度取反
	} kProjInitRows[(int)ProjectileType::NUM_PROJECTILES] = {
		{ 0.0f,              0.0f,   0.0f,   0.0f, ParticleEffect::PARTICLE_NONE,       0.0f,  0.0f, false, false },  // 0 PEA
		{ 0.0f,              0.0f,   0.0f,   0.0f, ParticleEffect::PARTICLE_SNOWPEA_TRAIL, 8.0f, 13.0f, false, false },  // 1 SNOWPEA
		{ (float)(-7 * PI / 25), -0.08f, -0.02f,  0.0f, ParticleEffect::PARTICLE_NONE,       0.0f,  0.0f, false, false },  // 2 CABBAGE
		{ (float)(-2 * PI / 5),  -0.08f, -0.02f,  0.0f, ParticleEffect::PARTICLE_NONE,       0.0f,  0.0f, false, false },  // 3 MELON
		{ 0.0f,              0.0f,   0.0f,   0.0f, ParticleEffect::PARTICLE_PUFFSHROOM_TRAIL, 13.0f, 13.0f, false, false },  // 4 PUFF
		{ (float)(-2 * PI / 5),  -0.08f, -0.02f,  0.0f, ParticleEffect::PARTICLE_NONE,       0.0f,  0.0f, false, false },  // 5 WINTERMELON
		{ 0.0f,              0.0f,   0.0f,   0.0f, ParticleEffect::PARTICLE_NONE,       0.0f,  0.0f, false, false },  // 6 FIREBALL
		{ 0.0f,              0.05f,  0.1f,  15.0f, ParticleEffect::PARTICLE_NONE,       0.0f,  0.0f, false, true  },  // 7 STAR
		{ 0.0f,              0.0f,   0.0f,   0.0f, ParticleEffect::PARTICLE_NONE,       0.0f,  0.0f, false, false },  // 8 SPIKE
		{ 0.0f,              0.05f,  0.1f,   0.0f, ParticleEffect::PARTICLE_NONE,       0.0f,  0.0f, true,  false },  // 9 BASKETBALL
		{ 0.0f,             -0.2f,  -0.08f,  0.0f, ParticleEffect::PARTICLE_NONE,       0.0f,  0.0f, false, false },  // 10 KERNEL
		{ (float)(PI / 2),   0.0f,   0.0f,   0.0f, ParticleEffect::PARTICLE_NONE,       0.0f,  0.0f, false, false },  // 11 COBBIG
		{ (float)(-7 * PI / 25), -0.08f, -0.02f,  0.0f, ParticleEffect::PARTICLE_NONE,       0.0f,  0.0f, false, false },  // 12 BUTTER
		{ 0.0f,              0.0f,   0.0f,   0.0f, ParticleEffect::PARTICLE_NONE,       0.0f,  0.0f, false, false },  // 13 ZOMBIE_PEA
	};
	static_assert(sizeof(kProjInitRows) / sizeof(kProjInitRows[0]) == (int)ProjectileType::NUM_PROJECTILES,
		"kProjInitRows 槽位须与 ProjectileType 枚举同步");

	if ((unsigned)mProjectileType < sizeof(kProjInitRows) / sizeof(kProjInitRows[0]))
	{
		const auto& aRow = kProjInitRows[(int)mProjectileType];
		mRotation = aRow.mRandomRot ? RandRangeFloat(0.0f, 2 * PI) : aRow.mRotation;
		if (aRow.mSpeedLo != 0.0f || aRow.mSpeedHi != 0.0f)
		{
			mRotationSpeed = RandRangeFloat(aRow.mSpeedLo, aRow.mSpeedHi);
			if (aRow.mFlipSpeed && Rand(2) == 0)
			{
				mRotationSpeed = -mRotationSpeed;
			}
		}
		if (aRow.mShadowDY != 0.0f)
		{
			mShadowY += aRow.mShadowDY;
		}
		if (aRow.mTrail != ParticleEffect::PARTICLE_NONE)
		{
			TodParticleSystem* aParticle = mApp->AddTodParticle(mPosX + aRow.mTrailOffX, mPosY + aRow.mTrailOffY, 400000, aRow.mTrail);
			AttachParticle(mAttachmentID, aParticle, aRow.mTrailOffX, aRow.mTrailOffY);
		}
	}

	// 表外特例：FIREBALL 不应经 ProjectileInitialize 产生（原链内联断言）
	if (mProjectileType == ProjectileType::PROJECTILE_FIREBALL)
	{
		TOD_ASSERT(false);
	}

	mCreationTimeNs = mMotionOriginTimeNs = ProjectileNow(*this);
	mOriginX = mPosX;
	mOriginY = mPosY;
	mOriginZ = mPosZ;
	mOriginRotation = mRotation;
	mOriginShadowY = mShadowY;
	mX = (int)mPosX;
	mY = (int)mPosY;
}

//0x46CAA0
Plant* Projectile::FindCollisionTargetPlant()
{
	Rect aProjectileRect = GetProjectileRect();

	Plant* aPlant = nullptr;
	while (mBoard->IteratePlants(aPlant))
	{
		if (aPlant->mRow != mRow)
			continue;

		if (mProjectileType == ProjectileType::PROJECTILE_ZOMBIE_PEA)
		{
			// 矮个名单 → PlantFlags::Short 位（2026-10-04 收编进类型标志字表
			// kPlantFlags 单一真相；原链裸 mSeedType 判定——模仿者不在名单
			// =同语义；改版加低矮植物 = PlantFlags.h 表行加位）。
			if ((PlantFlagsOf(aPlant->mSeedType) & PlantFlags::Short) != 0)
				continue;
		}

		Rect aPlantRect = aPlant->GetPlantRect();
		if (GetRectOverlap(aProjectileRect, aPlantRect) > 8)
		{
			if (mProjectileType == ProjectileType::PROJECTILE_ZOMBIE_PEA)
			{
				return mBoard->GetTopPlantAt(aPlant->mPlantCol, aPlant->mRow, PlantPriority::TOPPLANT_EATING_ORDER);
			}
			else
			{
				return mBoard->GetTopPlantAt(aPlant->mPlantCol, aPlant->mRow, PlantPriority::TOPPLANT_CATAPULT_ORDER);
			}
		}
	}

	return nullptr;
}

//0x46CC30
bool Projectile::PeaAboutToHitTorchwood()
{
	if (mMotionType != ProjectileMotion::MOTION_STRAIGHT)
		return false;

	if (mProjectileType != ProjectileType::PROJECTILE_PEA && mProjectileType != ProjectileType::PROJECTILE_SNOWPEA)
		return false;

	// 格桶链枚举（2026-10-03 第二批）：原为全池扫同行找火炬
	// （mSeedType==TORCHWOOD && mRow==mRow && !NotOnGround &&
	// mHitTorchwoodGridX!=mPlantCol + 矩形相交>10）——行过滤改本行
	// 9 格×4 层链全成员（含影子株=原池可见集），其余条件逐字保留：
	// 类型判定裸 mSeedType（模仿者火炬不认=原语义，4 层都查、判类型）。
	// 布尔结果，次序无关；火炬无玉米炮式双格注册，无去重问题。
	for (int aCol = 0; aCol < MAX_GRID_SIZE_X; aCol++)
	{
		for (int aLayer = 0; aLayer < PLANT_CELL_COUNT; aLayer++)
		{
            Plant* aPlant = mBoard->GetCellPlant(mRow, aCol, aLayer);
            while (aPlant != nullptr)
            {
                if (aPlant->mSeedType == SeedType::SEED_TORCHWOOD && !aPlant->NotOnGround() && mHitTorchwoodGridX != aPlant->mPlantCol)
                {
                    Rect aPlantAttackRect = aPlant->GetPlantAttackRect(PlantWeapon::WEAPON_PRIMARY);
                    Rect aProjectileRect = GetProjectileRect();
                    aProjectileRect.mX += 40;

                    if (GetRectOverlap(aPlantAttackRect, aProjectileRect) > 10)
                    {
                        return true;
                    }
                }
                aPlant = mBoard->NextCellPlant(aPlant);
            }
		}
	}

	return false;
}

//0x46CD40
Zombie* Projectile::FindCollisionTarget()
{
	if (PeaAboutToHitTorchwood())  // ������桱��ԭ������δ����������ڲ���о�������
		return nullptr;

	Rect aProjectileRect = GetProjectileRect();
	Zombie* aBestZombie = nullptr;
	int aMinX = 0;

	Zombie* aZombie = nullptr;
	// 行段路径（2026-10-04 用户方案）：行段∪Boss 按槽位归并 = 原
	// (Boss||row==mRow) 过滤集的升序全序，评估序与全池扫逐字一致，
	// 主体链零改动
	while (mBoard->IterateZombiesInRow(mRow, aZombie))
	{
		if (aZombie->EffectedByDamage((unsigned int)mDamageRangeFlags))
		{
			if (aZombie->mZombiePhase == ZombiePhase::PHASE_SNORKEL_WALKING_IN_POOL && mPosZ <= 45.0f)
			{
				continue;
			}

			if (mProjectileType == ProjectileType::PROJECTILE_STAR && ProjectileAge(*this) < 25 && mVelX >= 0.0f && aZombie->mZombieType == ZombieType::ZOMBIE_DIGGER)
			{
				continue;
			}

			Rect aZombieRect = aZombie->GetZombieRect();
			if (GetRectOverlap(aProjectileRect, aZombieRect) >= 0)
			{
				if (aBestZombie == nullptr || (aZombie->mX) < aMinX)
				{
					aBestZombie = aZombie;
					aMinX = (aZombie->mX);
				}
			}
		}
	}

	return aBestZombie;
}

//0x46CE80
void Projectile::CheckForCollision()
{
	if (mMotionType == ProjectileMotion::MOTION_PUFF && ProjectileAge(*this) >= 75)
	{
		Die();
		return;
	}

	if (mPosX > WIDE_BOARD_WIDTH || mPosX + mWidth < 0.0f)
	{
		Die();
		return;
	}

	if (mMotionType == ProjectileMotion::MOTION_HOMING)
	{
		Zombie* aZombie = mBoard->ZombieTryToGet(mTargetZombieID);
		if (aZombie && aZombie->EffectedByDamage((unsigned int)mDamageRangeFlags))
		{
			Rect aProjectileRect = GetProjectileRect();
			Rect aZombieRect = aZombie->GetZombieRect();
			if (GetRectOverlap(aProjectileRect, aZombieRect) >= 0 && mPosY > aZombieRect.mY&& mPosY < aZombieRect.mY + aZombieRect.mHeight)
			{
				DoImpact(aZombie);
			}
		}
		return;
	}

	if (mProjectileType == ProjectileType::PROJECTILE_STAR && (mPosY > 600.0f || mPosY < 40.0f))
	{
		Die();
		return;
	}

	if ((mProjectileType == ProjectileType::PROJECTILE_PEA || mProjectileType == ProjectileType::PROJECTILE_STAR) && mShadowY - mPosY > 90.0f)
	{
		return;
	}

	if (mMotionType == ProjectileMotion::MOTION_FLOAT_OVER)
	{
		return;
	}

	if (mProjectileType == ProjectileType::PROJECTILE_ZOMBIE_PEA)
	{
		Plant* aPlant = FindCollisionTargetPlant();
		if (aPlant)
		{
			const ProjectileDefinition& aProjectileDef = GetProjectileDef();
			aPlant->mPlantHealth -= aProjectileDef.mDamage;
			aPlant->mEatenFlashCountdown = std::max<Sexy::TimeCounter>(aPlant->mEatenFlashCountdown, 25);

			mApp->PlayFoley(FoleyType::FOLEY_SPLAT);
			mApp->AddTodParticle(mPosX - 3.0f, mPosY + 17.0f, mRenderOrder + 1, ParticleEffect::PARTICLE_PEA_SPLAT);
			Die();
		}
		return;
	}

	Zombie* aZombie = FindCollisionTarget();
	if (aZombie)
	{
		if (aZombie->mOnHighGround && CantHitHighGround())
		{
			return;
		}

		DoImpact(aZombie);
	}
}

//0x46D090
bool Projectile::CantHitHighGround()
{
	if (mMotionType == ProjectileMotion::MOTION_BACKWARDS || mMotionType == ProjectileMotion::MOTION_HOMING)
		return false;

	return (
		mProjectileType == ProjectileType::PROJECTILE_PEA ||
		mProjectileType == ProjectileType::PROJECTILE_SNOWPEA ||
		mProjectileType == ProjectileType::PROJECTILE_STAR ||
		mProjectileType == ProjectileType::PROJECTILE_PUFF ||
		mProjectileType == ProjectileType::PROJECTILE_FIREBALL
		) && !mOnHighGround;
}

//0x46D0D0
void Projectile::CheckForHighGround()
{
	float aShadowDelta = mShadowY - mPosY;

	if (mProjectileType == ProjectileType::PROJECTILE_PEA ||
		mProjectileType == ProjectileType::PROJECTILE_SNOWPEA ||
		mProjectileType == ProjectileType::PROJECTILE_FIREBALL ||
		mProjectileType == ProjectileType::PROJECTILE_SPIKE ||
		mProjectileType == ProjectileType::PROJECTILE_COBBIG)
	{
		if (aShadowDelta < 28.0f)
		{
			DoImpact(nullptr);
			return;
		}
	}

	if (mProjectileType == ProjectileType::PROJECTILE_PUFF && aShadowDelta < 0.0f)
	{
		DoImpact(nullptr);
		return;
	}

	if (mProjectileType == ProjectileType::PROJECTILE_STAR && aShadowDelta < 23.0f)
	{
		DoImpact(nullptr);
		return;
	}

	if (CantHitHighGround())
	{
		int aGridX = mBoard->PixelToGridXKeepOnBoard(mPosX + 30, mPosY);
		if (mBoard->mGridSquareType[aGridX][mRow] == GridSquareType::GRIDSQUARE_HIGH_GROUND)
		{
			DoImpact(nullptr);
		}
	}
}

//0x46D1F0
bool Projectile::IsSplashDamage(Zombie* theZombie)
{
	if (mProjectileType == ProjectileType::PROJECTILE_FIREBALL && theZombie && theZombie->IsFireResistant())
		return false;

	return
		mProjectileType == ProjectileType::PROJECTILE_MELON ||
		mProjectileType == ProjectileType::PROJECTILE_WINTERMELON ||
		mProjectileType == ProjectileType::PROJECTILE_FIREBALL;
}

//0x46D230
unsigned int Projectile::GetDamageFlags(Zombie* theZombie)
{
	unsigned int aDamageFlags = 0U;

	if (IsSplashDamage(theZombie))
	{
		SetBit(aDamageFlags, (int)DamageFlags::DAMAGE_HITS_SHIELD_AND_BODY, true);
	}
	else if (mMotionType == ProjectileMotion::MOTION_LOBBED || mMotionType == ProjectileMotion::MOTION_BACKWARDS)
	{
		SetBit(aDamageFlags, (int)DamageFlags::DAMAGE_BYPASSES_SHIELD, true);
	}
	else if (mMotionType == ProjectileMotion::MOTION_STAR && mVelX < 0.0f)
	{
		SetBit(aDamageFlags, (int)DamageFlags::DAMAGE_BYPASSES_SHIELD, true);
	}

	if (mProjectileType == ProjectileType::PROJECTILE_SNOWPEA || mProjectileType == ProjectileType::PROJECTILE_WINTERMELON)
	{
		SetBit(aDamageFlags, (int)DamageFlags::DAMAGE_FREEZE, true);
	}

	return aDamageFlags;
}

//0x46D2B0
bool Projectile::IsZombieHitBySplash(Zombie* theZombie)
{
	Rect aProjectileRect = GetProjectileRect();
	if (mProjectileType == ProjectileType::PROJECTILE_FIREBALL)
	{
		aProjectileRect.mWidth = 100;
	}

	int aRowDeviation = theZombie->mRow - mRow;
	Rect aZombieRect = theZombie->GetZombieRect();
	if (theZombie->IsFireResistant() && mProjectileType == ProjectileType::PROJECTILE_FIREBALL)
	{
		return false;
	}

	if (((ZombieFlagsOf(theZombie->mZombieType) & ZombieFlags::Boss) != 0))
	{
		aRowDeviation = 0;
	}
	if (mProjectileType == ProjectileType::PROJECTILE_FIREBALL)
	{
		if (aRowDeviation != 0)
		{
			return false;
		}
	}
	else if (aRowDeviation > 1 || aRowDeviation < -1)
	{
		return false;
	}

	return theZombie->EffectedByDamage((unsigned int)mDamageRangeFlags) && GetRectOverlap(aProjectileRect, aZombieRect) >= 0;
}

//0x46D390
void Projectile::DoSplashDamage(Zombie* theZombie)
{
	const ProjectileDefinition& aProjectileDef = GetProjectileDef();

	int aZombiesGetSplashed = 0;
	Zombie* aZombie = nullptr;
	// 行段区间路径（2026-10-04 全量转换）：±1 行+Boss 归零候选集（超集，
	// IsZombieHitBySplash 内部行门照旧收窄）；计数与 apply-all 均与序无关
	while (mBoard->IterateZombiesInRowRange(mRow - 1, mRow + 1, aZombie))
	{
		if (aZombie != theZombie && IsZombieHitBySplash(aZombie))
		{
			aZombiesGetSplashed++;
		}
	}

	int aOriginalDamage = aProjectileDef.mDamage;
	int aSplashDamage = aProjectileDef.mDamage / 3;
	int aMaxSplashDamageAmount = aOriginalDamage * 7;
	if (mProjectileType == ProjectileType::PROJECTILE_FIREBALL)
	{
		aMaxSplashDamageAmount = aOriginalDamage;
	}
	int aSplashDamageAmount = aSplashDamage * aZombiesGetSplashed;
	if (aSplashDamageAmount > aMaxSplashDamageAmount)
	{
		//aSplashDamage *= aMaxSplashDamageAmount / aSplashDamage;
		aSplashDamage = aOriginalDamage * aMaxSplashDamageAmount / (aSplashDamageAmount * 3);
		aSplashDamage = std::max(aSplashDamage, 1);
	}

	aZombie = nullptr;
	while (mBoard->IterateZombiesInRowRange(mRow - 1, mRow + 1, aZombie))
	{
		if (IsZombieHitBySplash(aZombie))
		{
			unsigned int aDamageFlags = GetDamageFlags(aZombie);
			if (aZombie == theZombie)
			{
				aZombie->TakeDamage(aOriginalDamage, aDamageFlags);
			}
			else
			{
				aZombie->TakeDamage(aSplashDamage, aDamageFlags);
			}
		}
	}
}

//0x46D490
// GOTY @Patoke: 0x471B41
void Projectile::UpdateLobMotion()
{
	const auto now = ProjectileNow(*this);
	auto ticks = MotionTime(*this);
	if (mProjectileType == ProjectileType::PROJECTILE_COBBIG && mVelZ < 0.0f)
	{
		// The old threshold is tested before movement. At birth z=0,vz=-8,
		// step 88 ends at -704; step 89 teleports and ends at -696.
		const auto ascentSteps = std::max(0.0, std::floor((mOriginZ + 700.0) / -mVelZ) + 1.0);
		const auto transition = ascentSteps + 1.0;
		if (ticks >= transition)
		{
			const auto eventNs = static_cast<std::int64_t>(transition * ProjectileMotionMath::TickNs);
			mMotionOriginTimeNs = ReanimClock::Add(mMotionOriginTimeNs, eventNs);
			mOriginX = mCobTargetX + mVelX;
			mRow = mCobTargetRow;
			const auto column = mBoard->PixelToGridXKeepOnBoard(mCobTargetX, 0);
			mOriginY = static_cast<float>(mBoard->GridToPixelY(column, mRow));
			mOriginZ += static_cast<float>(mVelZ * ascentSteps + 8.0);
			mOriginShadowY = mOriginY + 67.0f;
			mOriginRotation = -PI / 2;
			mVelZ = 8.0f;
			ticks = ProjectileMotionMath::Ticks(now, mMotionOriginTimeNs);
		}
	}

	mPosX = static_cast<float>(mOriginX + mVelX * ticks);
	mPosY = static_cast<float>(mOriginY + mVelY * ticks);
	mPosZ = static_cast<float>(mOriginZ + ProjectileMotionMath::LobOffset(mVelZ, LobAcceleration(*this), ticks));
	const auto roof = mProjectileType == ProjectileType::PROJECTILE_COBBIG ? 0.0 : RoofOffset(*this);
	mPosY += static_cast<float>(roof);
	mPosZ -= static_cast<float>(roof);
	mShadowY = static_cast<float>(mOriginShadowY + roof);
	mRotation = static_cast<float>(mOriginRotation + mRotationSpeed * ticks);

	bool isRising = ProjectileMotionMath::LobVelocity(mVelZ, LobAcceleration(*this), ticks) < 0.0;
	if (isRising && (mProjectileType == ProjectileType::PROJECTILE_BASKETBALL || mProjectileType == ProjectileType::PROJECTILE_COBBIG))
	{
		return;
	}
	if (ProjectileAge(*this) > 20)
	{
		if (isRising)
		{
			return;
		}

		float aMinCollisionZ = 0.0f;

		// B 形态 -> 常量表 kProjMinCollisionZ（原 5 支链合并；行序 =
		// ProjectileType 枚举序 0..13，NUM_PROJECTILES 锚定；0 槽 = 原默认 0）
		static constexpr float kProjMinCollisionZ[(int)ProjectileType::NUM_PROJECTILES] = {
			0.0f,    // 0 PEA（原默认）
			0.0f,    // 1 SNOWPEA（原默认）
			-30.0f,  // 2 CABBAGE
			-35.0f,  // 3 MELON
			0.0f,    // 4 PUFF（原默认）
			-35.0f,  // 5 WINTERMELON（共体）
			0.0f,    // 6 FIREBALL（原默认）
			0.0f,    // 7 STAR（原默认）
			0.0f,    // 8 SPIKE（原默认）
			60.0f,   // 9 BASKETBALL
			-30.0f,  // 10 KERNEL（共体）
			-60.0f,  // 11 COBBIG
			-32.0f,  // 12 BUTTER
			0.0f,    // 13 ZOMBIE_PEA（原默认）
		};
		static_assert(sizeof(kProjMinCollisionZ) / sizeof(kProjMinCollisionZ[0]) == (int)ProjectileType::NUM_PROJECTILES,
			"kProjMinCollisionZ 槽位须与 ProjectileType 枚举同步");

		if ((unsigned)mProjectileType < sizeof(kProjMinCollisionZ) / sizeof(kProjMinCollisionZ[0]))
		{
			aMinCollisionZ = kProjMinCollisionZ[(int)mProjectileType];
		}
		if (mBoard->mPlantRow[mRow] == PlantRowType::PLANTROW_POOL)
		{
			aMinCollisionZ += 40.0f;
		}

		if (mPosZ <= aMinCollisionZ)
		{
			return;
		}
	}

	Plant* aPlant = nullptr;
	Zombie* aZombie = nullptr;
	if (mProjectileType == ProjectileType::PROJECTILE_BASKETBALL || mProjectileType == ProjectileType::PROJECTILE_ZOMBIE_PEA)
	{
		aPlant = FindCollisionTargetPlant();
	}
	else
	{
		aZombie = FindCollisionTarget();
	}

	float aGroundZ = 80.0f;
	if (mProjectileType == ProjectileType::PROJECTILE_COBBIG)
	{
		aGroundZ = -40.0f;
	}
	bool hitGround = mPosZ > aGroundZ;
	if (aZombie == nullptr && aPlant == nullptr && !hitGround)
	{
		return;
	}

	if (aPlant)
	{
		Plant* aUmbrellaPlant = mBoard->FindUmbrellaPlant(aPlant->mPlantCol, aPlant->mRow);
		if (aUmbrellaPlant)
		{
			if (aUmbrellaPlant->mState == PlantState::STATE_UMBRELLA_REFLECTING)
			{
				mApp->PlayFoley(FoleyType::FOLEY_SPLAT);
				int aRenderPosition = Board::MakeRenderOrder(RenderLayer::RENDER_LAYER_TOP, 0, 1);
				mApp->AddTodParticle(mPosX + 20.0f, mPosY + 20.0f, aRenderPosition, ParticleEffect::PARTICLE_UMBRELLA_REFLECT);
				Die();
			}
			else if (aUmbrellaPlant->mState != PlantState::STATE_UMBRELLA_TRIGGERED)
			{
				mApp->PlayFoley(FoleyType::FOLEY_UMBRELLA);
				aUmbrellaPlant->DoSpecial();
			}
		}
		else
		{
			aPlant->mPlantHealth -= GetProjectileDef().mDamage;
			aPlant->mEatenFlashCountdown = std::max<Sexy::TimeCounter>(aPlant->mEatenFlashCountdown, 25);
			mApp->PlayFoley(FoleyType::FOLEY_SPLAT);
			Die();
		}
	}
	else if (mProjectileType == ProjectileType::PROJECTILE_COBBIG)
	{
		// @Patoke: implemented
		int aBeforeGargantuarCount = mBoard->GetLiveGargantuarCount();
		mBoard->KillAllZombiesInRadius(mRow, mPosX + 80, mPosY + 40, 115, 1, true, mDamageRangeFlags);
		int aAfterGargantuarCount = mBoard->GetLiveGargantuarCount();
		mBoard->mGargantuarsKillsByCornCob += aBeforeGargantuarCount - aAfterGargantuarCount;
		if (mBoard->mGargantuarsKillsByCornCob >= 2)
			ReportAchievement::GiveAchievement(mApp, PopcornParty, true);

		DoImpact(nullptr);
	}
	else
	{
		DoImpact(aZombie);
	}
}

namespace
{
// Projectile::UpdateNormalMotion 分发表：表内匿名 lambda = 原 case 体逐句迁移；
// default（STRAIGHT/LOBBED/PUFF 直进）具名并被缺槽/越界复用。
using ProjMotionFn = void (*)(Projectile&);

// 原 else（无 case 的 0/1/5 型与表外值共用）
void ProjMotionDefault(Projectile& p)
{
	p.mPosX = static_cast<float>(p.mOriginX + p.mVelX * MotionTime(p));
}

// 匿名 lambda 函数指针表，行序 = ProjectileMotion 枚举值序（0..9）。
constexpr ProjMotionFn kProjMotionCases[(int)ProjectileMotion::MOTION_HOMING + 1] = {
    &ProjMotionDefault,  // 0 MOTION_STRAIGHT（原 else）
    &ProjMotionDefault,  // 1 MOTION_LOBBED（原 else）
    // 原 case MOTION_THREEPEATER
    [](Projectile& p)
    {
        const auto ticks = MotionTime(p);
        p.mPosX = static_cast<float>(p.mOriginX + p.mVelX * ticks);
        const auto drift = ProjectileMotionMath::DampedOffset(p.mVelY, 0.97f, ticks);
        p.mPosY = static_cast<float>(p.mOriginY + drift);
        p.mShadowY = static_cast<float>(p.mOriginShadowY + 0.97f * drift);
    },  // 2 MOTION_THREEPEATER
    // 原 case MOTION_BEE
    [](Projectile& p)
    {
        const auto ticks = MotionTime(p);
        const auto ageAtOrigin = ProjectileMotionMath::Ticks(p.mMotionOriginTimeNs, p.mCreationTimeNs);
        p.mPosY = static_cast<float>(p.mOriginY - 0.5 * std::min(ticks, std::max(0.0, 59.0 - ageAtOrigin)));
        p.mPosX = static_cast<float>(p.mOriginX + p.mVelX * ticks);
    },  // 3 MOTION_BEE
    // 原 case MOTION_BEE_BACKWARDS
    [](Projectile& p)
    {
        const auto ticks = MotionTime(p);
        const auto ageAtOrigin = ProjectileMotionMath::Ticks(p.mMotionOriginTimeNs, p.mCreationTimeNs);
        p.mPosY = static_cast<float>(p.mOriginY - 0.5 * std::min(ticks, std::max(0.0, 59.0 - ageAtOrigin)));
        p.mPosX = static_cast<float>(p.mOriginX - std::fabs(p.mVelX) * ticks);
    },  // 4 MOTION_BEE_BACKWARDS
    &ProjMotionDefault,  // 5 MOTION_PUFF（原 else）
    // 原 case MOTION_BACKWARDS
    [](Projectile& p)
    {
        p.mPosX = static_cast<float>(p.mOriginX - std::fabs(p.mVelX) * MotionTime(p));
    },  // 6 MOTION_BACKWARDS
    // 原 case MOTION_STAR
    [](Projectile& p)
    {
        const auto ticks = MotionTime(p);
        p.mPosY = static_cast<float>(p.mOriginY + p.mVelY * ticks);
        p.mPosX = static_cast<float>(p.mOriginX + p.mVelX * ticks);
        p.mShadowY = static_cast<float>(p.mOriginShadowY + p.mVelY * ticks);

        if (p.mVelY != 0.0f)
        {
            p.mRow = p.mBoard->PixelToGridYKeepOnBoard(p.mPosX, p.mPosY);
        }
    },  // 7 MOTION_STAR
    // 原 case MOTION_FLOAT_OVER
    [](Projectile& p)
    {
        const auto ticks = MotionTime(p);
        const auto sample = ProjectileMotionMath::FloatSample(p.mVelZ, ticks,
            p.mApp->mGameMode == GameMode::GAMEMODE_LIMBO_HIGH_GRAVITY);
        p.mPosY = static_cast<float>(p.mOriginY + sample.offset);
        if (p.mVelZ < 0.0f && ticks > 0)
        {
            p.mRotation = static_cast<float>(0.3f - 0.7f * sample.rotationVelocity * PI * 0.25f);
        }
        p.mPosX = static_cast<float>(p.mOriginX + 0.4f * ticks);
    },  // 8 MOTION_FLOAT_OVER
    // 原 case MOTION_HOMING
    [](Projectile& p)
    {
        Zombie* aZombie = p.mBoard->ZombieTryToGet(p.mTargetZombieID);
        if (aZombie && aZombie->EffectedByDamage((unsigned int)p.mDamageRangeFlags))
        {
            Rect aZombieRect = aZombie->GetZombieRect();
            SexyVector2 aTargetCenter(aZombie->ZombieTargetLeadX(0.0f), aZombieRect.mY + aZombieRect.mHeight / 2);
            SexyVector2 aProjectileCenter(p.mPosX + p.mWidth / 2, p.mPosY + p.mHeight / 2);
            const auto motion = ProjectileMotionMath::HomingVelocity(p.mVelX, p.mVelY,
                aTargetCenter.x - aProjectileCenter.x, aTargetCenter.y - aProjectileCenter.y,
                ProjectileAge(p), Sexy::gUpdateTicks);
            p.mVelX = motion.x;
            p.mVelY = motion.y;
            p.mRotation = -atan2(p.mVelY, p.mVelX);
        }

        p.mPosY += Sexy::UpdateDelta(p.mVelY);
        p.mPosX += Sexy::UpdateDelta(p.mVelX);
        p.mShadowY += Sexy::UpdateDelta(p.mVelY);
        p.mRow = p.mBoard->PixelToGridYKeepOnBoard(p.mPosX, p.mPosY);
    },  // 9 MOTION_HOMING
};
static_assert(sizeof(kProjMotionCases) / sizeof(kProjMotionCases[0]) ==
    (int)ProjectileMotion::MOTION_HOMING + 1, "kProjMotionCases 槽位数须与 ProjectileMotion 枚举同步");
}  // namespace

//0x46D890
void Projectile::UpdateNormalMotion()
{
	const bool homing = mMotionType == ProjectileMotion::MOTION_HOMING;
	const auto oldX = mPosX;
	const auto oldRow = mRow;
	if (!homing)
	{
		mPosY = mOriginY;
		mPosZ = mOriginZ;
		mShadowY = mOriginShadowY;
		mRotation = static_cast<float>(mOriginRotation + mRotationSpeed * MotionTime(*this));
	}
    // C 形态 -> 匿名 lambda 表（上方 kProjMotionCases）：行序 = ProjectileMotion
    // 枚举序（0..9，无 NUM 哨兵=末值 MOTION_HOMING 锚定）；default 具名并被
    // 缺槽/越界复用。
    const unsigned aMotionIndex = static_cast<unsigned>(mMotionType);
    if (aMotionIndex <= static_cast<unsigned>(ProjectileMotion::MOTION_HOMING))
    {
        kProjMotionCases[aMotionIndex](*this);
    }
    else
    {
        ProjMotionDefault(*this);
    }

	if (mApp->mGameMode == GameMode::GAMEMODE_LIMBO_HIGH_GRAVITY)
	{
		if (homing)
		{
			mVelZ += Sexy::UpdateDelta(0.2f);
			mPosY += Sexy::UpdateDelta(mVelZ);
		}
		else if (mMotionType != ProjectileMotion::MOTION_FLOAT_OVER)
		{
			mPosY += static_cast<float>(ProjectileMotionMath::LobOffset(mVelZ, 0.2f, MotionTime(*this)));
		}
	}
	const auto roof = homing ? mBoard->GetPosYBasedOnRow(mPosX, oldRow) -
		mBoard->GetPosYBasedOnRow(oldX, oldRow) : RoofOffset(*this);
	if (mMotionType == ProjectileMotion::MOTION_FLOAT_OVER)
		mPosY += static_cast<float>(roof);
	mShadowY += static_cast<float>(roof);

	CheckForCollision();
	CheckForHighGround();
}

//0x46DC70
void Projectile::UpdateMotion()
{
	if (mMotionType == ProjectileMotion::MOTION_LOBBED)
	{
		UpdateLobMotion();
	}
	else
	{
		UpdateNormalMotion();
	}

	mX = (int)mPosX;
	mY = (int)(mPosY + mPosZ);
}

//0x46DD30
void Projectile::PlayImpactSound(Zombie* theZombie)
{
	bool aPlayHelmSound = true;
	bool aPlaySplatSound = true;
	if (mProjectileType == ProjectileType::PROJECTILE_KERNEL)
	{
		mApp->PlayFoley(FoleyType::FOLEY_KERNEL_SPLAT);
		aPlayHelmSound = false;
		aPlaySplatSound = false;
	}
	else if (mProjectileType == ProjectileType::PROJECTILE_BUTTER)
	{
		mApp->PlayFoley(FoleyType::FOLEY_BUTTER);
		aPlaySplatSound = false;
	}
	else if (mProjectileType == ProjectileType::PROJECTILE_FIREBALL && IsSplashDamage(theZombie))
	{
		mApp->PlayFoley(FoleyType::FOLEY_IGNITE);
		aPlayHelmSound = false;
		aPlaySplatSound = false;
	}
	else if (mProjectileType == ProjectileType::PROJECTILE_MELON || mProjectileType == ProjectileType::PROJECTILE_WINTERMELON)
	{
		mApp->PlayFoley(FoleyType::FOLEY_MELONIMPACT);
		aPlaySplatSound = false;
	}

	if (aPlayHelmSound && theZombie)
	{
		if (theZombie->mHelmType == HELMTYPE_PAIL)
		{
			mApp->PlayFoley(FoleyType::FOLEY_SHIELD_HIT);
			aPlaySplatSound = false;
		}
		else if (theZombie->mHelmType == HELMTYPE_TRAFFIC_CONE || theZombie->mHelmType == HELMTYPE_DIGGER || theZombie->mHelmType == HELMTYPE_FOOTBALL)
		{
			mApp->PlayFoley(FoleyType::FOLEY_PLASTIC_HIT);
		}
	}

	if (aPlaySplatSound)
	{
		mApp->PlayFoley(FoleyType::FOLEY_SPLAT);
	}
}

//0x46E000
void Projectile::DoImpact(Zombie* theZombie)
{
	PlayImpactSound(theZombie);

	if (IsSplashDamage(theZombie))
	{
		if (mProjectileType == ProjectileType::PROJECTILE_FIREBALL && theZombie)
		{
			theZombie->RemoveColdEffects();
		}

		DoSplashDamage(theZombie);
	}
	else if (theZombie)
	{
		unsigned int aDamageFlags = GetDamageFlags(theZombie);
		theZombie->TakeDamage(GetProjectileDef().mDamage, aDamageFlags);
	}

	float aLastPosX = mPosX - mVelX;
	const auto verticalVelocity = mMotionType == ProjectileMotion::MOTION_LOBBED ?
		ProjectileMotionMath::LobVelocity(mVelZ, LobAcceleration(*this), MotionTime(*this)) : mVelZ;
	float aLastPosY = static_cast<float>(mPosY + mPosZ - mVelY - verticalVelocity);
	ParticleEffect aEffect = ParticleEffect::PARTICLE_NONE;
	float aSplatPosX = mPosX + 12.0f;
	float aSplatPosY = mPosY + 12.0f;

	// B 形态 -> 常量表 kProjSplatRows（原 10 支链中 6 支同构溅落合并；行序 =
	// ProjectileType 枚举序 0..13，NUM_PROJECTILES 锚定）。mFromLastPos = true
	// 时以 aLastPos 为基绝对改写（原 CABBAGE/BUTTER 支），否则以默认 aSplatPos
	// 为基做增量；NONE 槽 = 表外特例或原链不溅落。
	static constexpr struct { ParticleEffect mEffect; float mOffX; float mOffY; bool mFromLastPos; } kProjSplatRows[(int)ProjectileType::NUM_PROJECTILES] = {
		{ ParticleEffect::PARTICLE_PEA_SPLAT,      -15.0f,   0.0f, false },  // 0 PEA
		{ ParticleEffect::PARTICLE_SNOWPEA_SPLAT, -15.0f,   0.0f, false },  // 1 SNOWPEA
		{ ParticleEffect::PARTICLE_CABBAGE_SPLAT, -38.0f,  23.0f, true  },  // 2 CABBAGE
		{ ParticleEffect::PARTICLE_NONE,           0.0f,   0.0f, false },  // 3 MELON（表外直加）
		{ ParticleEffect::PARTICLE_PUFF_SPLAT,    -20.0f,   0.0f, false },  // 4 PUFF
		{ ParticleEffect::PARTICLE_NONE,           0.0f,   0.0f, false },  // 5 WINTERMELON（表外直加）
		{ ParticleEffect::PARTICLE_NONE,           0.0f,   0.0f, false },  // 6 FIREBALL（表外加火苗）
		{ ParticleEffect::PARTICLE_STAR_SPLAT,     0.0f,   0.0f, false },  // 7 STAR
		{ ParticleEffect::PARTICLE_NONE,           0.0f,   0.0f, false },  // 8 SPIKE（原链不匹配）
		{ ParticleEffect::PARTICLE_NONE,           0.0f,   0.0f, false },  // 9 BASKETBALL（原链不匹配）
		{ ParticleEffect::PARTICLE_NONE,           0.0f,   0.0f, false },  // 10 KERNEL（原链不匹配）
		{ ParticleEffect::PARTICLE_NONE,           0.0f,   0.0f, false },  // 11 COBBIG（表外爆记）
		{ ParticleEffect::PARTICLE_BUTTER_SPLAT, -20.0f,  63.0f, true  },  // 12 BUTTER（ApplyButter 见表外）
		{ ParticleEffect::PARTICLE_NONE,           0.0f,   0.0f, false },  // 13 ZOMBIE_PEA（原链不匹配）
	};
	static_assert(sizeof(kProjSplatRows) / sizeof(kProjSplatRows[0]) == (int)ProjectileType::NUM_PROJECTILES,
		"kProjSplatRows 槽位须与 ProjectileType 枚举同步");

	if ((unsigned)mProjectileType < sizeof(kProjSplatRows) / sizeof(kProjSplatRows[0]))
	{
		const auto& aRow = kProjSplatRows[(int)mProjectileType];
		if (aRow.mEffect != ParticleEffect::PARTICLE_NONE)
		{
			aEffect = aRow.mEffect;
			if (aRow.mFromLastPos)
			{
				aSplatPosX = aLastPosX + aRow.mOffX;
				aSplatPosY = aLastPosY + aRow.mOffY;
			}
			else
			{
				aSplatPosX += aRow.mOffX;
				aSplatPosY += aRow.mOffY;
			}
		}
	}

	// 表外特例：MELON/WINTERMELON 无条件直加溅落；COBBIG 爆记 + 爆米花 + 音效 +
	// 震屏；FIREBALL 溅射命中时加火苗 reanim；BUTTER 命中僵尸上黄油。
	if (mProjectileType == ProjectileType::PROJECTILE_MELON)
	{
		mApp->AddTodParticle(aLastPosX + 30.0f, aLastPosY + 30.0f, mRenderOrder + 1, ParticleEffect::PARTICLE_MELONSPLASH);
	}
	else if (mProjectileType == ProjectileType::PROJECTILE_WINTERMELON)
	{
		mApp->AddTodParticle(aLastPosX + 30.0f, aLastPosY + 30.0f, mRenderOrder + 1, ParticleEffect::PARTICLE_WINTERMELON);
	}
	else if (mProjectileType == ProjectileType::PROJECTILE_COBBIG)
	{
		int aRenderOrder = Board::MakeRenderOrder(RenderLayer::RENDER_LAYER_GROUND, mCobTargetRow, 2);
		mApp->AddTodParticle(mPosX + 80.0f, mPosY + 40.0f, aRenderOrder, ParticleEffect::PARTICLE_BLASTMARK);
		mApp->AddTodParticle(mPosX + 80.0f, mPosY + 40.0f, mRenderOrder + 1, ParticleEffect::PARTICLE_POPCORNSPLASH);
		mApp->PlaySample(SOUND_DOOMSHROOM);
		mBoard->mShakeCounter = 12;
		mBoard->mShakeAmountX = 3;
		mBoard->mShakeAmountY = -4;
	}
	else if (mProjectileType == ProjectileType::PROJECTILE_FIREBALL)
	{
		if (IsSplashDamage(theZombie))
		{
			Reanimation* aFireReanim = mApp->AddReanimation(mPosX + 38.0f, mPosY - 20.0f, mRenderOrder + 1, ReanimationType::REANIM_JALAPENO_FIRE);
			aFireReanim->Seek(250);
			aFireReanim->ApplyRate(24.0f);
			aFireReanim->mOverlayMatrix.m00 = 0.7f;
			aFireReanim->mOverlayMatrix.m11 = 0.4f;
		}
	}

	if (mProjectileType == ProjectileType::PROJECTILE_BUTTER && theZombie)
	{
		theZombie->ApplyButter();
	}

	if (aEffect != ParticleEffect::PARTICLE_NONE)
	{
		if (theZombie)
		{
			float aPosX = aSplatPosX + 52.0f - (theZombie->mX);
			float aPosY = aSplatPosY - (theZombie->mY);
			if (theZombie->mZombiePhase == ZombiePhase::PHASE_SNORKEL_WALKING_IN_POOL || theZombie->mZombiePhase == ZombiePhase::PHASE_DOLPHIN_WALKING_IN_POOL)
			{
				aPosY += 60.0f;
			}
			if (mMotionType == ProjectileMotion::MOTION_BACKWARDS)
			{
				aPosX -= 80.0f;
			}
			else if (mPosX > (theZombie->mX) + 40 && mMotionType != ProjectileMotion::MOTION_LOBBED)
			{
				aPosX -= 60.0f;
			}

			aPosY = ClampFloat(aPosY, 20.0f, 100.0f);
			theZombie->AddAttachedParticle(aPosX, aPosY, aEffect);
		}
		else
		{
			mApp->AddTodParticle(aSplatPosX, aSplatPosY, mRenderOrder + 1, aEffect);
		}
	}

	Die();
}

//0x46E460
void Projectile::Update()
{
	if (mApp->mGameScene != GameScenes::SCENE_PLAYING && !mBoard->mCutScene->ShouldRunUpsellBoard())
		return;

	// 直飞弹种（出生即入弹道渲染层，无 20cs 延迟）：按 ProjectileType 槽位直查。
	// 行序 = 枚举序 0..13；原 10 连比较 OR 链退役。
	static constexpr bool kImmediateRender[] = {
		true,   // PROJECTILE_PEA          豌豆
		true,   // PROJECTILE_SNOWPEA      冰豌豆
		true,   // PROJECTILE_CABBAGE      卷心菜
		true,   // PROJECTILE_MELON        西瓜
		false,  // PROJECTILE_PUFF         孢子
		true,   // PROJECTILE_WINTERMELON  冰瓜
		false,  // PROJECTILE_FIREBALL     火豌豆
		false,  // PROJECTILE_STAR         星星
		true,   // PROJECTILE_SPIKE        尖刺
		false,  // PROJECTILE_BASKETBALL   篮球
		true,   // PROJECTILE_KERNEL       玉米粒
		true,   // PROJECTILE_COBBIG       玉米加农炮
		true,   // PROJECTILE_BUTTER       黄油
		true,   // PROJECTILE_ZOMBIE_PEA   僵尸豌豆
	};
	static_assert(sizeof(kImmediateRender) / sizeof(kImmediateRender[0]) == (int)ProjectileType::NUM_PROJECTILES,
		"直飞槽位须与 ProjectileType 枚举同步");
	int aTime = kImmediateRender[mProjectileType] ? 0 : 20;
	if (ProjectileAge(*this) > aTime)
	{
		mRenderOrder = Board::MakeRenderOrder(RenderLayer::RENDER_LAYER_PROJECTILE, mRow, 0);
	}

	if (mMotionType == ProjectileMotion::MOTION_HOMING)
		mRotation += Sexy::UpdateDelta(mRotationSpeed);

	UpdateMotion();
	const auto domain = mBoard ? mBoard->AnimationTimeDomain() : ReanimTimeDomain::Visual;
	const auto& clocks = *mApp->mEffectSystem->mReanimationHolder;
	AttachmentUpdateAndMoveAt(mAttachmentID, mPosX, mPosY + mPosZ,
		domain == ReanimTimeDomain::Battle ? clocks.mBattleTimeNs : clocks.mVisualTimeNs, domain);
}

//0x46E540
void Projectile::Draw(Graphics* g)
{
	const auto& aVisual = gProjectileResources.mProjectiles[mProjectileType];
	float aScale = aVisual.mScale;
	if (mProjectileType == ProjectileType::PROJECTILE_PUFF)
	{
		aScale = TodAnimateCurveNs(0, 300'000'000,
			ReanimClock::Subtract(ProjectileNow(*this), mCreationTimeNs), 0.3f, 1.0f, Curves::Linear) *
			(aVisual.mScale / 0.3f);
	}

	bool aMirror = false;
	if (mMotionType == ProjectileMotion::MOTION_BEE_BACKWARDS)
	{
		aMirror = true;
	}

	if (aVisual.mSource.mWidth != 0)
	{
		const TextureRegion& aSrcRect = aVisual.mSource;
		const TextureSource aTexture{gProjectileResources.mTexture, 0};
		if (FloatApproxEqual(mRotation, 0.0f) && FloatApproxEqual(aScale, 1.0f))
		{
			SexyTransform2D aTransform;
			TodScaleRotateTransformMatrix(aTransform,
				(int)g->mTransX + aSrcRect.mWidth * 0.5f,
				(int)g->mTransY + aSrcRect.mHeight * 0.5f,
				0.0f, aMirror ? -1.0f : 1.0f, 1.0f);
			const Color& aColor = g->mColorizeImages ? g->mColor : Color::White;
			if (!g->mDestImage || !g->mDestImage->IsGpuDrawTarget())
				throw NonScreenDrawError(DrawOperation::StretchBlt);
			auto& aRender = *g->mDestImage->mRenderOwner;
			aRender.SelectDrawSurface(g->mDestImage);
			aRender.BltTransformed(aTexture, &g->mClipRect, aColor, g->mDrawMode,
				aSrcRect, aTransform, !g->mFastStretch, 0.0f, 0.0f, true);
		}
		else
		{
			// TodBltMatrix takes absolute coordinates; BeginDraw already translated g by mX/mY.
			float aOffsetX = mPosX - mX + aSrcRect.mWidth * 0.5f + g->mTransX;
			float aOffsetY = mPosZ + mPosY - mY + aSrcRect.mHeight * 0.5f + g->mTransY;
			SexyTransform2D aTransform;
			TodScaleRotateTransformMatrix(aTransform, aOffsetX, aOffsetY, mRotation, aScale, aScale);
			TodBltMatrix(g, aTexture, aTransform, g->mClipRect, Color::White, g->mDrawMode, aSrcRect);
		}
	}

	if (mAttachmentID != AttachmentID::ATTACHMENTID_NULL)
	{
		Graphics theParticleGraphics(*g);
		MakeParentGraphicsFrame(&theParticleGraphics);
		AttachmentDraw(mAttachmentID, &theParticleGraphics, false);
	}
}

//0x46E8C0
void Projectile::DrawShadow(Graphics* g)
{
	int aShadowFrame = 0;
	float aScale = 1.0f;
	float aStretch = 1.0f;
	float aOffsetX = mPosX - mX;
	float aOffsetY = mPosY - mY;

	int aGridX = mBoard->PixelToGridXKeepOnBoard(mX, mY);
	bool isHighGround = false;
	if (mBoard->mGridSquareType[aGridX][mRow] == GridSquareType::GRIDSQUARE_HIGH_GROUND)
	{
		isHighGround = true;
	}
	if (mOnHighGround && !isHighGround)
	{
		aOffsetY += HIGH_GROUND_HEIGHT;
	}
	else if (!mOnHighGround && isHighGround)
	{
		aOffsetY -= HIGH_GROUND_HEIGHT;
	}

	if (mBoard->StageIsNight())
	{
		aShadowFrame = 1;
	}

	// 阴影参数：按 ProjectileType 槽位直查 {dx, dy, 缩放, 拉伸, 跳过}，行序 = 枚举序。
	// 孢子无影（skip）；缺省行 = 无修正。
	static constexpr struct { float mDX, mDY, mScale, mStretch; bool mSkip; } kShadowParams[] = {
		{  3,  0, 1.0f, 1.0f, false },  // PROJECTILE_PEA          豌豆
		{ -1,  0, 1.3f, 1.0f, false },  // PROJECTILE_SNOWPEA      冰豌豆
		{  3, 10, 1.6f, 1.0f, false },  // PROJECTILE_CABBAGE      卷心菜
		{  3, 10, 1.6f, 1.0f, false },  // PROJECTILE_MELON        西瓜
		{  0,  0, 1.0f, 1.0f, true  },  // PROJECTILE_PUFF         孢子（无影）
		{  3, 10, 1.6f, 1.0f, false },  // PROJECTILE_WINTERMELON  冰瓜
		{  0,  0, 1.4f, 1.0f, false },  // PROJECTILE_FIREBALL     火豌豆
		{  7,  0, 1.0f, 1.0f, false },  // PROJECTILE_STAR         星星
		{  0,  0, 1.0f, 1.0f, false },  // PROJECTILE_SPIKE        尖刺
		{  0,  0, 1.0f, 1.0f, false },  // PROJECTILE_BASKETBALL   篮球
		{  3, 10, 1.6f, 1.0f, false },  // PROJECTILE_KERNEL       玉米粒
		{ 57,  0, 1.0f, 3.0f, false },  // PROJECTILE_COBBIG       玉米加农炮
		{  3, 10, 1.6f, 1.0f, false },  // PROJECTILE_BUTTER       黄油
		{  3,  0, 1.0f, 1.0f, false },  // PROJECTILE_ZOMBIE_PEA   僵尸豌豆
	};
	static_assert(sizeof(kShadowParams) / sizeof(kShadowParams[0]) == (int)ProjectileType::NUM_PROJECTILES,
		"阴影槽位须与 ProjectileType 枚举同步");
	{
		const auto& aShadow = kShadowParams[mProjectileType];
		if (aShadow.mSkip)
			return;
		aOffsetX += aShadow.mDX;
		aOffsetY += aShadow.mDY;
		aScale = aShadow.mScale;
		aStretch = aShadow.mStretch;
	}

	if (mMotionType == ProjectileMotion::MOTION_LOBBED)
	{
		float aHeight = ClampFloat(-mPosZ, 0.0f, 200.0f);
		aScale *= 200.0f / (aHeight + 200.0f);
	}

	const TextureRegion& aSource = gProjectileResources.mShadows[aShadowFrame];
	const TextureSource aTexture{gProjectileResources.mTexture, 0};
	SexyTransform2D aTransform;
	TodScaleRotateTransformMatrix(aTransform,
		aOffsetX + g->mTransX + aSource.mWidth * 0.5f * aScale * aStretch,
		mShadowY - mPosY + aOffsetY + g->mTransY + aSource.mHeight * 0.5f * aScale,
		0.0f, aScale * aStretch, aScale);
	const Color& aColor = g->mColorizeImages ? g->mColor : Color::White;
	if (aScale * aStretch == 1.0f && aScale == 1.0f)
	{
		// The old unscaled shadow uses DrawImageF's linear sampling even
		// when the graphics object's transformed-image filter is nearest.
		if (!g->mDestImage || !g->mDestImage->IsGpuDrawTarget())
			throw NonScreenDrawError(DrawOperation::BltF);
		auto& aRender = *g->mDestImage->mRenderOwner;
		aRender.SelectDrawSurface(g->mDestImage);
		aRender.BltTransformed(aTexture, &g->mClipRect, aColor, g->mDrawMode,
			aSource, aTransform, true, 0.0f, 0.0f, true);
	}
	else
		TodBltMatrix(g, aTexture, aTransform, g->mClipRect, aColor, g->mDrawMode, aSource);
}

//0x46EB20
void Projectile::Die()
{
	mDead = true;

	if (mProjectileType == ProjectileType::PROJECTILE_PUFF || mProjectileType == ProjectileType::PROJECTILE_SNOWPEA)
	{
		AttachmentCrossFade(mAttachmentID, ParticleEmitterName::fadeout);
		AttachmentDetach(mAttachmentID);
	}
	else
	{
		AttachmentDie(mAttachmentID);
	}
}

//0x46EBC0

//0x46ECB0
void Projectile::ConvertToFireball(int theGridX)
{
	if (mHitTorchwoodGridX == theGridX)
		return;

	mProjectileType = ProjectileType::PROJECTILE_FIREBALL;
	mHitTorchwoodGridX = theGridX;
	mApp->PlayFoley(FoleyType::FOLEY_FIREPEA);

	float aOffsetX = -25.0f;
	float aOffsetY = -25.0f;
	Reanimation* aFirePeaReanim = mApp->AddReanimation(0.0f, 0.0f, 0, ReanimationType::REANIM_FIRE_PEA);
	if (mMotionType == ProjectileMotion::MOTION_BACKWARDS)
	{
		aFirePeaReanim->mOverlayMatrix.m00 = -1.0f;
		aFirePeaReanim->mOverlayMatrix.m11 = 1.0f;
		aOffsetX += 80.0f;
	}

	aFirePeaReanim->mOverlayMatrix.m02 = mPosX + aOffsetX;
	aFirePeaReanim->mOverlayMatrix.m12 = mPosY + aOffsetY;
	aFirePeaReanim->ChangeLoopType(ReanimLoopType::REANIM_LOOP);
	aFirePeaReanim->ApplyRate(RandRangeFloat(50.0f, 80.0f));
	AttachReanim(mAttachmentID, aFirePeaReanim, aOffsetX, aOffsetY);
}

//0x46EE00
void Projectile::ConvertToPea(int theGridX)
{
	if (mHitTorchwoodGridX == theGridX)
		return;

	AttachmentDie(mAttachmentID);
	mProjectileType = ProjectileType::PROJECTILE_PEA;
	mHitTorchwoodGridX = theGridX;
	mApp->PlayFoley(FoleyType::FOLEY_THROW);
}

ProjectileDefinition& Projectile::GetProjectileDef()
{
	ProjectileDefinition& aProjectileDef = gProjectileDefinition[(int)mProjectileType];
	TOD_ASSERT(aProjectileDef.mProjectileType == mProjectileType);

	return aProjectileDef;
}
