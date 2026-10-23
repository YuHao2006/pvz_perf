#pragma once
#include "ConstEnums.h"
#include "Sexy.TodLib/ReanimTrackId.h"
#include <array>
namespace Sexy
{
    class Graphics;
    class Image;
};
using namespace Sexy;

class LawnApp;
inline constexpr size_t IMAGE_VARIATION_COUNT = static_cast<size_t>(VARIATION_AQUARIUM) + 1;
class ImageVariationTable
{
public:
    std::array<std::array<Image*,IMAGE_VARIATION_COUNT>,NUM_SEED_TYPES> mImages{};
    int mCount = 0;
    Image*& At(SeedType seed, DrawVariation variation)
    {
        return mImages.at(static_cast<size_t>(seed)).at(static_cast<size_t>(variation));
    }
};
class Reanimation;
class ReanimatorCache
{
public:
    Image*			mPlantImages[SeedType::NUM_SEED_TYPES]{};
    ImageVariationTable    mImageVariations;
    Image*                mLawnMowers[LawnMowerType::NUM_MOWER_TYPES]{};
    Image*                mZombieImages[ZombieType::NUM_CACHED_ZOMBIE_TYPES]{};
    LawnApp*                mApp = nullptr;

public:
    ReanimatorCache() = default;
    ~ReanimatorCache();
    ReanimatorCache(const ReanimatorCache&) = delete;
    ReanimatorCache& operator=(const ReanimatorCache&) = delete;

    void                    ReanimatorCacheInitialize();
    void                    ReanimatorCacheDispose();
    void                    DrawCachedPlant(Graphics* g, float thePosX, float thePosY, SeedType theSeedType, DrawVariation theDrawVariation);
    void                    DrawCachedMower(Graphics* g, float thePosX, float thePosY, LawnMowerType theMowerType);
    void                    DrawCachedZombie(Graphics* g, float thePosX, float thePosY, ZombieType theZombieType);
    Image*                MakeBlankRenderImage(int theWidth, int theHeight);
    Image*                MakeCachedPlantFrame(SeedType theSeedType, DrawVariation theDrawVariation);
    Image*                MakeCachedMowerFrame(LawnMowerType theMowerType);
    Image*                MakeCachedZombieFrame(ZombieType theZombieType);
    // Main-thread loading barrier, after definitions/resources and source GPU uploads.
    // Includes bounded plant variants and gameplay filters; draw paths require cache hits.
    void                    PrebuildCacheFrames();
    /*inline*/ void         GetPlantImageSize(SeedType theSeedType, int& theOffsetX, int& theOffsetY, int& theWidth, int& theHeight);
    void                    DrawReanimatorFrame(Graphics* g, float thePosX, float thePosY, ReanimationType theReanimationType, ReanimTrackId theTrackId, DrawVariation theDrawVariation);
    void                    UpdateReanimationForVariation(Reanimation* theReanim, DrawVariation theDrawVariation);
};

