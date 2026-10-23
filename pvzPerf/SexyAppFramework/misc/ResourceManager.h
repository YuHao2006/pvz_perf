#pragma once
#include "ResourceGroupId.h"
#include "Common.h"
#include "SexyAppBase.h"
#include "ResourceError.h"
#include <array>
#include <bitset>
#include <string>
#include <vector>

namespace Sexy
{
class Image;
class _Font;

class ResourceManager
{
public:
    enum ResType { ResType_Image, ResType_Sound, ResType_Font };
    // Loading metadata is temporary. It never owns a loaded image, font or sound.
    struct BaseRes
    {
        unsigned mRecord=0;
        std::string mPath;
        bool mFromProgram=false, mUnavailable=false;
    };
    struct ImageRes : BaseRes
    {
        std::string mAlphaImage, mAlphaGridImage;
        unsigned mVariant=0;
        bool mAutoFindAlpha=true;
        DWORD mAlphaColor=0xFFFFFF;
    };
    struct SoundRes : BaseRes
    {
        double mVolume=-1;
        int mPanning=0;
    };
    struct FontRes : BaseRes
    {
        std::string mImagePath;
        std::vector<unsigned> mTagIds;
        FontRes* mReference=nullptr;
        _Font* mFont=nullptr; // Borrowed from the named variable during this plan.
    };
    struct LoadPlan
    {
        std::vector<ImageRes> mImages;
        std::vector<SoundRes> mSounds;
        std::vector<FontRes> mFonts;
        std::size_t mNextImage=0, mNextSound=0, mNextFont=0;
    };
    struct GroupPlan
    {
        unsigned mCount=0;
        std::array<unsigned,3> mCounts{};
    };
    using ResGroupBits=std::bitset<RESOURCE_GROUP_COUNT+1>;
    ResourceError mError;
    SexyAppBase* mApp;
    ResourceGroupId mCurResGroup=ResourceGroupId::Invalid;
    ResGroupBits mLoadedGroups, mResGroupPresent;
    std::array<GroupPlan,RESOURCE_GROUP_COUNT+1> mGroups{};
    std::array<LoadPlan*,RESOURCE_GROUP_COUNT+1> mPendingPlans{};
    LoadPlan* mLoadPlan=nullptr; // Borrowed from mPendingPlans while loading.
    unsigned mNextLoadStep=0;

    explicit ResourceManager(SexyAppBase* app);
    virtual ~ResourceManager();
    bool Fail(ResourceError error);
    bool Fail(ResourceFailure reason,unsigned record=~0u,unsigned value=0,std::size_t offset=0);
    bool HadError() const noexcept;
    bool ParseResourcesFile(const std::string& filename);
    bool ParseNumericResourcesFile(const std::string& filename);
    bool DecodeGroup(const unsigned char* bytes,std::size_t size,LoadPlan& plan,
        GroupPlan& summary);
    bool IsGroupLoaded(ResourceGroupId group);
    void SetGroupLoaded(ResourceGroupId group,bool loaded=true);
    void StartLoadResources(ResourceGroupId group);
    virtual bool LoadNextResource();
    bool TodLoadNextResource();
    virtual bool LoadResources(ResourceGroupId group);
    bool TodLoadResources(ResourceGroupId group);
    bool FinishLoadResources(ResourceGroupId group);
    bool LoadImage(ImageRes& metadata,Image*& target,SharedImageRef& owner);
    bool LoadFont(FontRes& metadata,_Font*& target);
    bool LoadSound(SoundRes& metadata,int& target);
    void ReleaseImage(Image*& target,SharedImageRef& owner);
    void ReleaseFont(_Font*& target);
    void ReleaseSound(int& target);
    virtual void DeleteResources();
    virtual void DeleteResources(ResourceGroupId group);
    bool LoadAlphaGridImage(ImageRes* metadata,Image* image);
    bool LoadAlphaImage(ImageRes* metadata,Image* image);
    int GetNumResources(ResType type);
    int GetNumResources(ResourceGroupId group,ResType type);
    int GetNumResources();
    int GetNumResources(ResourceGroupId group);
    int GetNumImages() { return GetNumResources(ResType_Image); }
    int GetNumSounds() { return GetNumResources(ResType_Sound); }
    int GetNumFonts() { return GetNumResources(ResType_Font); }
    int GetNumImages(ResourceGroupId group) { return GetNumResources(group,ResType_Image); }
    int GetNumSounds(ResourceGroupId group) { return GetNumResources(group,ResType_Sound); }
    int GetNumFonts(ResourceGroupId group) { return GetNumResources(group,ResType_Font); }
};
}

namespace ResourceLoadBindings
{
bool LoadStep(Sexy::ResourceManager& manager,Sexy::ResourceManager::LoadPlan& plan,
    ResourceGroupId group,unsigned step);
void ReleaseGroup(Sexy::ResourceManager& manager,ResourceGroupId group);
}
