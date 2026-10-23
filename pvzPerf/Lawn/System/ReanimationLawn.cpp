#include "Lawn/Plant.h"
#include "Lawn/Zombie.h"
#include "LawnApp.h"
#include "Resources.h"
#include "ReanimationLawn.h"
#include "Sexy.TodLib/TodDebug.h"
#include "Sexy.TodLib/TodCommon.h"
#include "graphics/Color.h"
#include "Sexy.TodLib/Reanimator.h"
#include "graphics/MemoryImage.h"
#include "graphics/Image.h"
#include "graphics/DDInterface.h"
#include "graphics/RenderInterface.h"
#include <memory>
#include <stdexcept>

namespace
{
// ReanimatorCache::UpdateReanimationForVariation 变体分发表：表内匿名
// lambda = 原 case 体逐句迁移（生成器 + 逆变换 token 对拍 0 差异）；
// 滤镜两槽与换层四槽同表；default 具名并被缺槽/越界复用。
using VariationApplyCaseFn = void (*)(Reanimation*);

// 原 default（无 case 的 12 型与表外哨兵共用）
void VariationApplyDefault(Reanimation* theReanim)
{
    			TOD_ASSERT(false);
}

// 匿名 lambda 函数指针表，行序 = DrawVariation 枚举值序（0..17）。
constexpr VariationApplyCaseFn kVariationApplyCases[(int)DrawVariation::VARIATION_AQUARIUM + 1] = {
    &VariationApplyDefault,  // 0 VARIATION_NORMAL（原 default）
    // 原 case VARIATION_IMITATER
    [](Reanimation* theReanim)
    {
    			theReanim->mFilterEffect = FilterEffect::FILTER_EFFECT_WASHED_OUT;
    },  // 1 VARIATION_IMITATER
    &VariationApplyDefault,  // 2 VARIATION_MARIGOLD_WHITE（原 default）
    &VariationApplyDefault,  // 3 VARIATION_MARIGOLD_MAGENTA（原 default）
    &VariationApplyDefault,  // 4 VARIATION_MARIGOLD_ORANGE（原 default）
    &VariationApplyDefault,  // 5 VARIATION_MARIGOLD_PINK（原 default）
    &VariationApplyDefault,  // 6 VARIATION_MARIGOLD_LIGHT_BLUE（原 default）
    &VariationApplyDefault,  // 7 VARIATION_MARIGOLD_RED（原 default）
    &VariationApplyDefault,  // 8 VARIATION_MARIGOLD_BLUE（原 default）
    &VariationApplyDefault,  // 9 VARIATION_MARIGOLD_VIOLET（原 default）
    &VariationApplyDefault,  // 10 VARIATION_MARIGOLD_LAVENDER（原 default）
    &VariationApplyDefault,  // 11 VARIATION_MARIGOLD_YELLOW（原 default）
    &VariationApplyDefault,  // 12 VARIATION_MARIGOLD_LIGHT_GREEN（原 default）
    // 原 case VARIATION_ZEN_GARDEN
    [](Reanimation* theReanim)
    {
    			theReanim->SetFramesForLayer(ReanimTrackId::anim_zengarden);
    },  // 13 VARIATION_ZEN_GARDEN
    // 原 case VARIATION_ZEN_GARDEN_WATER
    [](Reanimation* theReanim)
    {
    			theReanim->SetFramesForLayer(ReanimTrackId::anim_waterplants);
    },  // 14 VARIATION_ZEN_GARDEN_WATER
    // 原 case VARIATION_SPROUT_NO_FLOWER
    [](Reanimation* theReanim)
    {
    			theReanim->SetFramesForLayer(ReanimTrackId::anim_idle_noflower);
    },  // 15 VARIATION_SPROUT_NO_FLOWER
    // 原 case VARIATION_IMITATER_LESS
    [](Reanimation* theReanim)
    {
    			theReanim->mFilterEffect = FilterEffect::FILTER_EFFECT_LESS_WASHED_OUT;
    },  // 16 VARIATION_IMITATER_LESS
    // 原 case VARIATION_AQUARIUM
    [](Reanimation* theReanim)
    {
    			theReanim->SetFramesForLayer(ReanimTrackId::anim_idle_aquarium);
    },  // 17 VARIATION_AQUARIUM
};
static_assert(sizeof(kVariationApplyCases) / sizeof(kVariationApplyCases[0]) ==
    (int)DrawVariation::VARIATION_AQUARIUM + 1, "kVariationApplyCases 槽位数须与 DrawVariation 枚举同步");
}  // namespace

//0x46EF00
void ReanimatorCache::UpdateReanimationForVariation(Reanimation* theReanim, DrawVariation theDrawVariation)
{
	if (theDrawVariation >= DrawVariation::VARIATION_MARIGOLD_WHITE && theDrawVariation <= DrawVariation::VARIATION_MARIGOLD_LIGHT_GREEN)
	{
		size_t aVariationIndex = (size_t)theDrawVariation - (size_t)DrawVariation::VARIATION_MARIGOLD_WHITE;
		Color MARIGOLD_VARIATIONS[] = {
			Color(255, 255, 255),
			Color(230, 30, 195),
			Color(250, 125, 5),
			Color(255, 145, 215),
			Color(160, 255, 245),
			Color(230, 30, 30),
			Color(5, 130, 255),
			Color(195, 55, 235),
			Color(235, 210, 255),
			Color(255, 245, 55),
			Color(180, 255, 105)
		};

		TOD_ASSERT(aVariationIndex >= 0 && aVariationIndex < LENGTH(MARIGOLD_VARIATIONS));
		theReanim->GetTrackInstanceByName(ReanimTrackId::Marigold_petals)->mTrackColor = MARIGOLD_VARIATIONS[aVariationIndex];
	}
	else
	{
		// C 形态 -> 匿名 lambda 函数指针表：行序 = DrawVariation 枚举序（0..17）。
		// MARIGOLD 段已由上方 if 拦截；缺槽（NORMAL、11 个 MARIGOLD 型）与越界
		// = 原 default（TOD_ASSERT(false)）具名复用。
		const unsigned aVariationIndex = static_cast<unsigned>(theDrawVariation);
		if (aVariationIndex <= static_cast<unsigned>(DrawVariation::VARIATION_AQUARIUM))
		{
			kVariationApplyCases[aVariationIndex](theReanim);
		}
		else
		{
			VariationApplyDefault(theReanim);
		}

	}
}

//0x46F100
void ReanimatorCache::DrawReanimatorFrame(Graphics* g, float thePosX, float thePosY, ReanimationType theReanimationType, ReanimTrackId theTrackId, DrawVariation theDrawVariation)
{
	Reanimation aReanim;
	aReanim.ReanimationInitializeType(thePosX, thePosY, theReanimationType);

	if (theTrackId != ReanimTrackId::None && aReanim.TrackExists(theTrackId))
	{
		aReanim.SetFramesForLayer(theTrackId);
	}
	if (theReanimationType == ReanimationType::REANIM_KERNELPULT)
	{
		aReanim.AssignRenderGroupToTrack(ReanimTrackId::Cornpult_butter, RENDER_GROUP_HIDDEN);
	}
	else if (theReanimationType == ReanimationType::REANIM_SUNFLOWER)
	{
		aReanim.mAnimTime = 0.15f;
	}
	aReanim.AssignRenderGroupToTrack(ReanimTrackId::anim_waterline, RENDER_GROUP_HIDDEN);

	if (g->mColorizeImages)
	{
		aReanim.mColorOverride = g->mColor;
	}
	aReanim.mOverlayMatrix.m00 = g->mScaleX;
	aReanim.mOverlayMatrix.m11 = g->mScaleY;
	
	if (theDrawVariation != DrawVariation::VARIATION_NORMAL)
	{
		UpdateReanimationForVariation(&aReanim, theDrawVariation);
	}

	aReanim.Draw(g);
}

//0x46F280
Image* ReanimatorCache::MakeBlankRenderImage(int theWidth, int theHeight)
{
	return mApp->mDDInterface->mRenderInterface->CreateRenderImage(theWidth,theHeight);
}
namespace
{
DrawVariation ImitaterVariation(SeedType seed)
{
	return seed == SEED_HYPNOSHROOM || seed == SEED_SQUASH || seed == SEED_POTATOMINE ||
		seed == SEED_GARLIC || seed == SEED_LILYPAD ? VARIATION_IMITATER_LESS : VARIATION_IMITATER;
}
}

// Main-thread loading barrier: sources must be loaded/uploaded before this call.
// Failure propagates to loading; gameplay never repairs a missing cache entry.
void ReanimatorCache::PrebuildCacheFrames()
{
	if (CurrentNativeThreadIdentity() != mApp->mPrimaryThreadId)
		throw std::logic_error("ReanimatorCache: prebuild requires the main thread");
	for (int seed = static_cast<int>(SeedType::SEED_PEASHOOTER);
		seed < static_cast<int>(SeedType::NUM_SEED_TYPES); ++seed)
	{
		if (mPlantImages[seed] != nullptr) continue;
		if (GetPlantDefinition(static_cast<SeedType>(seed)).mReanimationType == ReanimationType::REANIM_NONE) continue;
		mPlantImages[seed] = MakeCachedPlantFrame(static_cast<SeedType>(seed), DrawVariation::VARIATION_NORMAL);
	}
	const auto prebuildVariation = [this](SeedType seed, DrawVariation variation)
	{
		auto*& image = mImageVariations.At(seed, variation);
		if (image) return;
		image = MakeCachedPlantFrame(seed, variation);
		++mImageVariations.mCount;
	};
	for (int seed = SEED_PEASHOOTER; seed < SEED_GATLINGPEA; ++seed)
		prebuildVariation(static_cast<SeedType>(seed), ImitaterVariation(static_cast<SeedType>(seed)));
	for (int variation = VARIATION_MARIGOLD_WHITE; variation <= VARIATION_MARIGOLD_LIGHT_GREEN; ++variation)
		prebuildVariation(SEED_MARIGOLD, static_cast<DrawVariation>(variation));
	prebuildVariation(SEED_FLOWERPOT, VARIATION_ZEN_GARDEN);
	prebuildVariation(SEED_FLOWERPOT, VARIATION_ZEN_GARDEN_WATER);
	prebuildVariation(SEED_SPROUT, VARIATION_SPROUT_NO_FLOWER);
	prebuildVariation(SEED_TANGLEKELP, VARIATION_AQUARIUM);
	prebuildVariation(SEED_SEASHROOM, VARIATION_AQUARIUM);
	for (int i = 0; i < static_cast<int>(LawnMowerType::NUM_MOWER_TYPES); ++i)
	{
		if (mLawnMowers[i] != nullptr) continue;
		mLawnMowers[i] = MakeCachedMowerFrame(static_cast<LawnMowerType>(i));
	}
	for (int i = 0; i < static_cast<int>(ZombieType::NUM_CACHED_ZOMBIE_TYPES); ++i)
	{
		if (i == static_cast<int>(ZombieType::NUM_ZOMBIE_TYPES)) continue;  // 枚举空洞
		if (mZombieImages[i] != nullptr) continue;
		const auto type = static_cast<ZombieType>(i);
		const auto definitionType = type == ZOMBIE_CACHED_POLEVAULTER_WITH_POLE ? ZOMBIE_POLEVAULTER : type;
		if (GetZombieDefinition(definitionType).mReanimationType == ReanimationType::REANIM_NONE) continue;
		mZombieImages[i] = MakeCachedZombieFrame(static_cast<ZombieType>(i));
	}
	TodLog("cache prebuild: plant-variations=%d", mImageVariations.mCount);
}


void ReanimatorCache::GetPlantImageSize(SeedType theSeedType, int& theOffsetX, int& theOffsetY, int& theWidth, int& theHeight)
{
	theOffsetX = -20;
	theOffsetY = -20;
	theWidth = 120;
	theHeight = 120;

	if (theSeedType == SeedType::SEED_TALLNUT)
	{
		theOffsetY = -40;
		theHeight += 40;
	}
	else if (theSeedType == SeedType::SEED_MELONPULT || theSeedType == SeedType::SEED_WINTERMELON)
	{
		theOffsetX = -40;
		theWidth += 40;
	}
	else if (theSeedType == SeedType::SEED_COBCANNON)
	{
		theWidth += 80;
	}
}

namespace
{
// ReanimatorCache::MakeCachedMowerFrame 割草机帧分发表：表内匿名 lambda =
// 原 case 体逐句迁移（生成器 + 逆变换 token 对拍 0 差异）；四型仅
// 缩放/偏移/轨道/动画型参数差。
using CachedImagePtr = Image*;
using MowerFrameCaseFn = void (*)(ReanimatorCache&, CachedImagePtr&);

// 原 default（无 case 的 0 型与表外哨兵共用）
void MowerFrameDefault(ReanimatorCache& rc, CachedImagePtr& aImage)
{
    		TOD_ASSERT(false);
}

// 匿名 lambda 函数指针表，行序 = LawnMowerType 枚举值序（0..3）。
constexpr MowerFrameCaseFn kMowerFrameCases[(int)LawnMowerType::NUM_MOWER_TYPES] = {
    // 原 case LAWNMOWER_LAWN
    [](ReanimatorCache& rc, CachedImagePtr& aImage)
    {
        aImage = rc.MakeBlankRenderImage(90, 100);
        Graphics aMemoryGraphics(aImage);
            aMemoryGraphics.mLinearBlend = true;
    		aMemoryGraphics.mScaleX = 0.85f;
    		aMemoryGraphics.mScaleY = 0.85f;
    		rc.DrawReanimatorFrame(&aMemoryGraphics, 10.0f, 0.0f, ReanimationType::REANIM_LAWNMOWER, ReanimTrackId::anim_normal, DrawVariation::VARIATION_NORMAL);
    },  // 0 LAWNMOWER_LAWN
    // 原 case LAWNMOWER_POOL
    [](ReanimatorCache& rc, CachedImagePtr& aImage)
    {
        aImage = rc.MakeBlankRenderImage(90, 100);
        Graphics aMemoryGraphics(aImage);
            aMemoryGraphics.mLinearBlend = true;
    		aMemoryGraphics.mScaleX = 0.8f;
    		aMemoryGraphics.mScaleY = 0.8f;
    		rc.DrawReanimatorFrame(&aMemoryGraphics, 10.0f, 25.0f, ReanimationType::REANIM_POOL_CLEANER, ReanimTrackId::None, DrawVariation::VARIATION_NORMAL);
    },  // 1 LAWNMOWER_POOL
    // 原 case LAWNMOWER_ROOF
    [](ReanimatorCache& rc, CachedImagePtr& aImage)
    {
        aImage = rc.MakeBlankRenderImage(90, 100);
        Graphics aMemoryGraphics(aImage);
            aMemoryGraphics.mLinearBlend = true;
    		aMemoryGraphics.mScaleX = 0.85f;
    		aMemoryGraphics.mScaleY = 0.85f;
    		rc.DrawReanimatorFrame(&aMemoryGraphics, 10.0f, 0.0f, ReanimationType::REANIM_ROOF_CLEANER, ReanimTrackId::None, DrawVariation::VARIATION_NORMAL);
    },  // 2 LAWNMOWER_ROOF
    // 原 case LAWNMOWER_SUPER_MOWER
    [](ReanimatorCache& rc, CachedImagePtr& aImage)
    {
        aImage = rc.MakeBlankRenderImage(90, 100);
        Graphics aMemoryGraphics(aImage);
            aMemoryGraphics.mLinearBlend = true;
    		aMemoryGraphics.mScaleX = 0.85f;
    		aMemoryGraphics.mScaleY = 0.85f;
    		rc.DrawReanimatorFrame(&aMemoryGraphics, 10.0f, 0.0f, ReanimationType::REANIM_LAWNMOWER, ReanimTrackId::anim_tricked, DrawVariation::VARIATION_NORMAL);
    },  // 3 LAWNMOWER_SUPER_MOWER
};
static_assert(sizeof(kMowerFrameCases) / sizeof(kMowerFrameCases[0]) ==
    (int)LawnMowerType::NUM_MOWER_TYPES, "kMowerFrameCases 槽位数须与 LawnMowerType 枚举同步");
}  // namespace

//0x46F330
Image* ReanimatorCache::MakeCachedMowerFrame(LawnMowerType theMowerType)
{
	Image* aImage = nullptr;
	try
	{
	GpuImageDrawScope drawing(*mApp->mDDInterface->mRenderInterface,nullptr);

	// C 形态 -> 匿名 lambda 函数指针表：行序 = LawnMowerType 枚举序（0..3，
	// 全覆盖）。裸指针经引用传递；失败时由当前函数清理，成功时
	// 交给缓存持有；越界 = 原 default（TOD_ASSERT）具名复用。
	const unsigned aMowerIndex = static_cast<unsigned>(theMowerType);
	if (aMowerIndex < static_cast<unsigned>(LawnMowerType::NUM_MOWER_TYPES))
	{
		kMowerFrameCases[aMowerIndex](*this, aImage);
	}
	else
	{
		MowerFrameDefault(*this, aImage);
	}

	return aImage;
	}
	catch (...)
	{
		delete aImage;
		throw;
	}
}

//0x46F550
Image* ReanimatorCache::MakeCachedPlantFrame(SeedType theSeedType, DrawVariation theDrawVariation)
{
	int aOffsetX, aOffsetY, aWidth, aHeight;
	GetPlantImageSize(theSeedType, aOffsetX, aOffsetY, aWidth, aHeight);
	Image* aMemoryImage = MakeBlankRenderImage(aWidth, aHeight);
	try
	{
	GpuImageDrawScope drawing(*mApp->mDDInterface->mRenderInterface,
		aMemoryImage);
	Graphics aMemoryGraphics(aMemoryImage);
	aMemoryGraphics.mLinearBlend = true;

	PlantDefinition& aPlantDef = GetPlantDefinition(theSeedType);
	//TOD_ASSERT(aPlantDef.mReanimationType != ReanimationType::REANIM_NONE);

	if (theSeedType == SeedType::SEED_POTATOMINE)
	{
		aMemoryGraphics.mScaleX = 0.85f;
		aMemoryGraphics.mScaleY = 0.85f;
		DrawReanimatorFrame(&aMemoryGraphics, -(int)(aOffsetX - 12.0f), -(int)(aOffsetY - 12.0f), aPlantDef.mReanimationType, ReanimTrackId::anim_armed, theDrawVariation);
	}
	else if (theSeedType == SeedType::SEED_INSTANT_COFFEE)
	{
		aMemoryGraphics.mScaleX = 0.8f;
		aMemoryGraphics.mScaleY = 0.8f;
		DrawReanimatorFrame(&aMemoryGraphics, -(int)(aOffsetX - 12.0f), -(int)(aOffsetY - 12.0f), aPlantDef.mReanimationType, ReanimTrackId::anim_idle, theDrawVariation);
	}
	else if (theSeedType == SeedType::SEED_EXPLODE_O_NUT)
	{
		aMemoryGraphics.mColorizeImages = true;
		aMemoryGraphics.mColor = Color(255, 64, 64);
		DrawReanimatorFrame(&aMemoryGraphics, -aOffsetX, -aOffsetY, aPlantDef.mReanimationType, ReanimTrackId::anim_idle, theDrawVariation);
	}
	else
	{
		DrawReanimatorFrame(&aMemoryGraphics, -aOffsetX, -aOffsetY, aPlantDef.mReanimationType, ReanimTrackId::anim_idle, theDrawVariation);

		if (theSeedType == SeedType::SEED_PEASHOOTER || theSeedType == SeedType::SEED_SNOWPEA || theSeedType == SeedType::SEED_REPEATER ||
			theSeedType == SeedType::SEED_LEFTPEATER || theSeedType == SeedType::SEED_GATLINGPEA)
		{
			DrawReanimatorFrame(&aMemoryGraphics, -aOffsetX, -aOffsetY, aPlantDef.mReanimationType, ReanimTrackId::anim_head_idle, theDrawVariation);
		}
		else if (theSeedType == SeedType::SEED_SPLITPEA)
		{
			DrawReanimatorFrame(&aMemoryGraphics, -aOffsetX, -aOffsetY, aPlantDef.mReanimationType, ReanimTrackId::anim_head_idle, theDrawVariation);
			DrawReanimatorFrame(&aMemoryGraphics, -aOffsetX, -aOffsetY, aPlantDef.mReanimationType, ReanimTrackId::anim_splitpea_idle, theDrawVariation);
		}
		else if (theSeedType == SeedType::SEED_THREEPEATER)
		{
			DrawReanimatorFrame(&aMemoryGraphics, -aOffsetX, -aOffsetY, aPlantDef.mReanimationType, ReanimTrackId::anim_head_idle1, theDrawVariation);
			DrawReanimatorFrame(&aMemoryGraphics, -aOffsetX, -aOffsetY, aPlantDef.mReanimationType, ReanimTrackId::anim_head_idle3, theDrawVariation);
			DrawReanimatorFrame(&aMemoryGraphics, -aOffsetX, -aOffsetY, aPlantDef.mReanimationType, ReanimTrackId::anim_head_idle2, theDrawVariation);
		}
	}

	return aMemoryImage;
	}
	catch (...)
	{
		delete aMemoryImage;
		throw;
	}
}

//0x46F8A0
Image* ReanimatorCache::MakeCachedZombieFrame(ZombieType theZombieType)
{
	Image* aMemoryImage = MakeBlankRenderImage(200, 210);
	try
	{
	GpuImageDrawScope drawing(*mApp->mDDInterface->mRenderInterface,
		aMemoryImage);
	Graphics aMemoryGraphics(aMemoryImage);
	aMemoryGraphics.mLinearBlend = true;

	ZombieType aUseZombieType = theZombieType;
	if (theZombieType == ZombieType::ZOMBIE_CACHED_POLEVAULTER_WITH_POLE)
	{
		aUseZombieType = ZombieType::ZOMBIE_POLEVAULTER;
	}
	ZombieDefinition& aZombieDef = GetZombieDefinition(aUseZombieType);
	TOD_ASSERT(aZombieDef.mReanimationType != ReanimationType::REANIM_NONE);

	float aPosX = 40.0f, aPosY = 40.0f;
	if (aZombieDef.mReanimationType == ReanimationType::REANIM_ZOMBIE)
	{
		Reanimation aReanim;
		aReanim.ReanimationInitializeType(aPosX, aPosY, aZombieDef.mReanimationType);
		aReanim.SetFramesForLayer(ReanimTrackId::anim_idle);
		Zombie::SetupReanimLayers(&aReanim, aUseZombieType);

		if (theZombieType == ZombieType::ZOMBIE_DOOR)
			aReanim.AssignRenderGroupToTrack(ReanimTrackId::anim_screendoor, RENDER_GROUP_NORMAL);
		else if (theZombieType == ZombieType::ZOMBIE_FLAG)
		{
			Reanimation aReanimFlag;
			aReanimFlag.ReanimationInitializeType(aPosX, aPosY, ReanimationType::REANIM_FLAG);
			aReanimFlag.SetFramesForLayer(ReanimTrackId::Zombie_flag);
			aReanimFlag.Draw(&aMemoryGraphics);
		}
		aReanim.Draw(&aMemoryGraphics);
	}
	else if (aZombieDef.mReanimationType == ReanimationType::REANIM_BOSS)
	{
		Reanimation aReanim;
		aReanim.ReanimationInitializeType(-524.0f, -88.0f, aZombieDef.mReanimationType);
		aReanim.SetFramesForLayer(ReanimTrackId::anim_head_idle);
		Reanimation aReanimDriver;
		aReanimDriver.ReanimationInitializeType(46.0f, 22.0f, ReanimationType::REANIM_BOSS_DRIVER);
		aReanimDriver.SetFramesForLayer(ReanimTrackId::anim_idle);

		aReanim.Draw(&aMemoryGraphics);
		aReanimDriver.Draw(&aMemoryGraphics);
		aReanim.AssignRenderGroupToTrack(ReanimTrackId::boss_body1, RENDER_GROUP_HIDDEN);
		aReanim.AssignRenderGroupToTrack(ReanimTrackId::Boss_neck, RENDER_GROUP_HIDDEN);
		aReanim.AssignRenderGroupToTrack(ReanimTrackId::Boss_head2, RENDER_GROUP_HIDDEN);
		aReanim.Draw(&aMemoryGraphics);
	}
	else
	{
		ReanimTrackId aTrackName = ReanimTrackId::anim_idle;
		if (theZombieType == ZombieType::ZOMBIE_POGO)
		{
			aTrackName = ReanimTrackId::anim_pogo;
		}
		else if (theZombieType == ZombieType::ZOMBIE_CACHED_POLEVAULTER_WITH_POLE)
		{
			aTrackName = ReanimTrackId::anim_idle;
		}
		else if (theZombieType == ZombieType::ZOMBIE_POLEVAULTER)
		{
			aTrackName = ReanimTrackId::anim_walk;
		}
		else if (theZombieType == ZombieType::ZOMBIE_GARGANTUAR)
		{
			aPosY = 60.0f;
		}

		DrawReanimatorFrame(&aMemoryGraphics, aPosX, aPosY, aZombieDef.mReanimationType, aTrackName, DrawVariation::VARIATION_NORMAL);
	}
	return aMemoryImage;
	}
	catch (...)
	{
		delete aMemoryImage;
		throw;
	}
}

ReanimatorCache::~ReanimatorCache()
{
	ReanimatorCacheDispose();
}

void ReanimatorCache::ReanimatorCacheInitialize()
{
	ReanimatorCacheDispose();
	mApp = (LawnApp*)gSexyAppBase;
}

//0x46FED0
void ReanimatorCache::ReanimatorCacheDispose()
{
	for (int i = 0; i < SeedType::NUM_SEED_TYPES; i++)
	{
		delete mPlantImages[i];
		mPlantImages[i] = nullptr;
	}
	for (auto& variants : mImageVariations.mImages)
	{
		for (auto*& image : variants)
		{
			delete image;
			image=nullptr;
		}
	}
	mImageVariations.mCount=0;
	for (int i = 0; i < LawnMowerType::NUM_MOWER_TYPES; i++)
	{
		delete mLawnMowers[i];
		mLawnMowers[i] = nullptr;
	}
	for (int i = 0; i < ZombieType::NUM_CACHED_ZOMBIE_TYPES; i++)
	{
		delete mZombieImages[i];
		mZombieImages[i] = nullptr;
	}
}


//0x46FFB0
void ReanimatorCache::DrawCachedPlant(Graphics* g, float thePosX, float thePosY, SeedType theSeedType, DrawVariation theDrawVariation)
{
	TOD_ASSERT(theSeedType >= 0 && theSeedType < SeedType::NUM_SEED_TYPES);

	Image* aImage = nullptr;
	if (theDrawVariation != DrawVariation::VARIATION_NORMAL)
	{
		aImage=mImageVariations.At(theSeedType,theDrawVariation);
	}
	else
	{
		aImage = mPlantImages[(int)theSeedType];
	}
	if (!aImage)
		throw std::logic_error(StrFormat("ReanimatorCache: plant was not prebuilt: seed=%d variation=%d",
			static_cast<int>(theSeedType), static_cast<int>(theDrawVariation)));

	int aOffsetX, aOffsetY, aWidth, aHeight;
	GetPlantImageSize(theSeedType, aOffsetX, aOffsetY, aWidth, aHeight);
	TodDrawImageScaledF(g, aImage, thePosX + (aOffsetX * g->mScaleX), thePosY + (aOffsetY * g->mScaleY), g->mScaleX, g->mScaleY);
}

//0x470110
void ReanimatorCache::DrawCachedMower(Graphics* g, float thePosX, float thePosY, LawnMowerType theMowerType)
{
	TOD_ASSERT(theMowerType >= 0 && theMowerType < LawnMowerType::NUM_MOWER_TYPES);
	
	if (mLawnMowers[(int)theMowerType] == nullptr)
		throw std::logic_error("ReanimatorCache: mower was not prebuilt");
	TodDrawImageScaledF(g, mLawnMowers[(int)theMowerType], thePosX - 20.0f, thePosY, g->mScaleX, g->mScaleY);
}

//0x470170
void ReanimatorCache::DrawCachedZombie(Graphics* g, float thePosX, float thePosY, ZombieType theZombieType)
{
	TOD_ASSERT(theZombieType >= 0 && theZombieType < ZombieType::NUM_CACHED_ZOMBIE_TYPES);
	
	if (mZombieImages[(int)theZombieType] == nullptr)
		throw std::logic_error("ReanimatorCache: zombie was not prebuilt");
	TodDrawImageScaledF(g, mZombieImages[(int)theZombieType], thePosX, thePosY, g->mScaleX, g->mScaleY);
}
