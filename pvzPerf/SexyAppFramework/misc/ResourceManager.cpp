#include "ResourceManager.h"
#include "Buffer.h"
#include "Sexy.TodLib/generated/NumericResourceBindings.h"
#include "sound/SoundManager.h"
#include "graphics/Image.h"
#include "graphics/ImageFont.h"
#include "imagelib/ImageLib.h"
#include <cmath>
#include <cstring>
#include <limits>
#include <utility>
#include <zlib.h>

using namespace Sexy;
void TodMarkImageForSanding(Image*);
void TodQueueTextureWarm(SharedImageRef);

namespace
{
class NumericResourceReader
{
public:
    const unsigned char* data;
    std::size_t size,pos=0;
    bool valid=true;
    NumericResourceReader(const unsigned char* bytes,std::size_t length):data(bytes),size(length) {}
    const unsigned char* Take(std::size_t length)
    {
        if (!valid || pos>size || length>size-pos) { valid=false; return nullptr; }
        auto* result=data+pos; pos+=length; return result;
    }
    unsigned U32()
    {
        unsigned result=0;
        if (auto* bytes=Take(4)) std::memcpy(&result,bytes,4);
        return result;
    }
    int I32() { return static_cast<int>(U32()); }
    double F64()
    {
        double result=0;
        if (auto* bytes=Take(8)) std::memcpy(&result,bytes,8);
        return result;
    }
    std::string Path()
    {
        auto length=U32();
        if (length>4096) { valid=false; return {}; }
        auto* bytes=Take(length);
        if (!bytes) return {};
        if (std::memchr(bytes,0,length)) { valid=false; return {}; }
        return {reinterpret_cast<const char*>(bytes),length};
    }
    std::vector<int> IntVector()
    {
        auto count=U32();
        if (!valid || count>16384 || count>(size-pos)/4) { valid=false; return {}; }
        std::vector<int> values;
        for (unsigned i=0;i<count;++i) values.push_back(I32());
        return values;
    }
    bool Complete() const { return valid && pos==size; }
};
}

ResourceManager::ResourceManager(SexyAppBase* app):mApp(app) {}
ResourceManager::~ResourceManager() { DeleteResources(); }
bool ResourceManager::Fail(ResourceError error)
{
    if (!HadError()) mError=error;
    return false;
}
bool ResourceManager::Fail(ResourceFailure reason,unsigned record,unsigned value,std::size_t offset)
{
    return Fail(ResourceError{reason,record,value,offset});
}
bool ResourceManager::HadError() const noexcept { return mError.reason!=ResourceFailure::None; }
bool ResourceManager::IsGroupLoaded(ResourceGroupId group)
{
    return IsCanonicalResourceGroupId(group) && mLoadedGroups.test(static_cast<unsigned>(group));
}
void ResourceManager::SetGroupLoaded(ResourceGroupId group,bool loaded)
{
    if (IsCanonicalResourceGroupId(group)) mLoadedGroups.set(static_cast<unsigned>(group),loaded);
}

bool ResourceManager::DecodeGroup(const unsigned char* bytes,std::size_t size,LoadPlan& plan,
    GroupPlan& summary)
{
    NumericResourceReader input(bytes,size);
    // Reserve before linking font metadata so references survive vector growth.
    plan.mImages.reserve(summary.mCount);
    plan.mSounds.reserve(summary.mCount);
    plan.mFonts.reserve(summary.mCount);
    std::vector<FontRes*> previousFonts(summary.mCount,nullptr);
    summary.mCounts={};
    for (unsigned record=0;record<summary.mCount;++record)
    {
        const auto length=input.U32();
        auto* payload=input.Take(length);
        if (!payload) return Fail(ResourceFailure::DescriptorTruncated,record,0,input.pos);
        NumericResourceReader r(payload,length);
        const auto kind=r.U32(),flags=r.U32(),variant=r.U32(),reference=r.U32();
        if (!r.valid || kind>ResType_Font || flags>16383 ||
            (reference!=~0u && (kind!=ResType_Font || reference>=record || !previousFonts[reference])))
            return Fail(ResourceFailure::DescriptorIdentity,record,kind,input.pos-length+r.pos);
        const auto path=r.Path(),alpha=r.Path(),alphaGrid=r.Path(),fontImage=r.Path();
        if (!(flags&(1|8192)) && path.empty() && reference==~0u)
            return Fail(ResourceFailure::DescriptorPath,record,0,input.pos-length+r.pos);
        BaseRes* base=nullptr;
        if (kind==ResType_Image)
        {
            auto& image=plan.mImages.emplace_back();
            base=&image;
            image.mVariant=variant;
            image.mAlphaImage=alpha; image.mAlphaGridImage=alphaGrid;
            image.mAutoFindAlpha=(flags&1024)!=0;
            image.mAlphaColor=r.U32();
        }
        else if (kind==ResType_Sound)
        {
            auto& sound=plan.mSounds.emplace_back();
            base=&sound; sound.mVolume=r.F64(); sound.mPanning=r.I32();
            if (!std::isfinite(sound.mVolume))
                return Fail(ResourceFailure::SoundVolume,record,0,input.pos-length+r.pos);
        }
        else
        {
            auto& font=plan.mFonts.emplace_back();
            base=&font; font.mImagePath=fontImage;
            font.mReference=reference==~0u ? nullptr : previousFonts[reference];
            if (flags&2) return Fail(ResourceFailure::SystemFont,record,flags,input.pos-length+r.pos);
            const auto size=r.I32();
            const auto style=r.U32();
            (void)size; // Bitmap font metrics come from its descriptor.
            for (auto tag:r.IntVector())
            {
                if (tag<=0) return Fail(ResourceFailure::FontTag,record,unsigned(tag),input.pos-length+r.pos);
                font.mTagIds.push_back(unsigned(tag));
            }
            if (style>15) return Fail(ResourceFailure::FontStyle,record,style,input.pos-length+r.pos);
            previousFonts[record]=&font;
        }
        base->mRecord=record; base->mPath=path;
        base->mFromProgram=(flags&1)!=0; base->mUnavailable=(flags&8192)!=0;
        if (!r.Complete()) return Fail(ResourceFailure::DescriptorLength,record,length,input.pos-length+r.pos);
        ++summary.mCounts[kind];
    }
    return input.Complete() || Fail(ResourceFailure::ManifestTrailing,~0u,0,input.pos);
}

bool ResourceManager::ParseResourcesFile(const std::string& filename)
{
    return ParseNumericResourcesFile(filename);
}
bool ResourceManager::ParseNumericResourcesFile(const std::string& filename)
{
    mError={};
    if (mResGroupPresent.any()) return Fail(ResourceFailure::ManifestHeader);
    Buffer buffer;
    if (!mApp->ReadBufferFromFile(filename,&buffer,true)) return Fail(ResourceFailure::ManifestMissing);
    NumericResourceReader input(buffer.GetDataPtr(),std::size_t(buffer.GetDataLen()));
    const auto magic=input.U32(),version=input.U32(),images=input.U32(),groups=input.U32();
    const auto records=input.U32(),bindings=input.U32(),checksum=input.U32(),payloadBytes=input.U32();
    if (!input.valid || magic!=0x4353524Eu || version!=4 || images!=RESOURCE_LOAD_IMAGE_COUNT ||
        groups>RESOURCE_GROUP_COUNT || records!=RESOURCE_LOAD_PLAN_RECORD_COUNT ||
        bindings!=RESOURCE_LOAD_BINDING_CRC || checksum!=RESOURCE_LOAD_PLAN_CRC ||
        payloadBytes!=input.size-input.pos)
        return Fail(ResourceFailure::ManifestHeader,~0u,magic,input.pos);
    const auto actual=crc32(0,input.data+input.pos,payloadBytes);
    if (actual!=checksum) return Fail(ResourceFailure::ManifestChecksum,~0u,actual,input.pos);
    std::array<GroupPlan,RESOURCE_GROUP_COUNT+1> summaries{};
    std::array<LoadPlan*,RESOURCE_GROUP_COUNT+1> plans{};
    ResGroupBits present;
    unsigned total=0,totalImages=0;
    bool parsed=false;
    try
    {
        parsed=[&]() {
            for (unsigned i=0;i<groups;++i)
            {
                const auto group=input.U32(),count=input.U32(),length=input.U32();
                if (!IsCanonicalResourceGroupId(static_cast<ResourceGroupId>(group)) ||
                    present.test(group) || count>records-total)
                    return Fail(ResourceFailure::InvalidGroup,~0u,group,input.pos);
                auto& summary=summaries[group];
                summary.mCount=count;
                auto* bytes=input.Take(length);
                if (!bytes) return Fail(ResourceFailure::DescriptorTruncated,~0u,group,input.pos);
                auto* plan=plans[group]=new LoadPlan;
                if (!DecodeGroup(bytes,length,*plan,summary)) return false;
                totalImages+=static_cast<unsigned>(plan->mImages.size());
                present.set(group); total+=count;
            }
            if (!input.Complete() || total!=records || totalImages!=images)
                return Fail(ResourceFailure::ManifestTrailing,~0u,total,input.pos);
            return true;
        }();
    }
    catch (...)
    {
        for (auto* plan:plans) delete plan;
        throw;
    }
    if (!parsed)
    {
        for (auto* plan:plans) delete plan;
        return false;
    }
    mGroups=summaries; mResGroupPresent=present; mPendingPlans=plans;
    return true;
}

void ResourceManager::StartLoadResources(ResourceGroupId group)
{
    if (mLoadPlan) DeleteResources(mCurResGroup);
    mError={}; mNextLoadStep=0; mCurResGroup=group;
    if (!IsCanonicalResourceGroupId(group) || !mResGroupPresent.test(static_cast<unsigned>(group)))
    {
        Fail(ResourceFailure::InvalidGroup,~0u,static_cast<unsigned>(group)); return;
    }
    if (IsGroupLoaded(group)) return;
    mLoadPlan=mPendingPlans[static_cast<unsigned>(group)];
    if (!mLoadPlan)
    {
        Fail(ResourceFailure::DescriptorTruncated); return;
    }
}
bool ResourceManager::LoadNextResource()
{
    if (HadError() || !mLoadPlan) return false;
    const auto count=mGroups[static_cast<unsigned>(mCurResGroup)].mCount;
    if (mNextLoadStep==count)
    {
        delete std::exchange(mPendingPlans[static_cast<unsigned>(mCurResGroup)],nullptr);
        mLoadPlan=nullptr; SetGroupLoaded(mCurResGroup); return false;
    }
    bool loaded=false;
    try { loaded=ResourceLoadBindings::LoadStep(*this,*mLoadPlan,mCurResGroup,mNextLoadStep++); }
    catch (...)
    {
        DeleteResources(mCurResGroup);
        throw;
    }
    if (!loaded)
    {
        if (!HadError()) Fail(ResourceFailure::DescriptorIdentity,mNextLoadStep-1);
        DeleteResources(mCurResGroup);
        return false;
    }
    return true;
}
bool ResourceManager::FinishLoadResources(ResourceGroupId group)
{
    if (HadError() || group!=mCurResGroup) return false;
    if (IsGroupLoaded(group)) return true;
    if (mLoadPlan && mNextLoadStep==mGroups[static_cast<unsigned>(group)].mCount)
    {
        delete std::exchange(mPendingPlans[static_cast<unsigned>(group)],nullptr);
        mLoadPlan=nullptr; SetGroupLoaded(group); return true;
    }
    return Fail(ResourceFailure::DescriptorTruncated);
}
bool ResourceManager::LoadResources(ResourceGroupId group)
{
    StartLoadResources(group);
    while (LoadNextResource()) {}
    return FinishLoadResources(group);
}
bool ResourceManager::TodLoadNextResource() { return LoadNextResource(); }
void ResourceManager::DeleteResources(ResourceGroupId group)
{
    ResourceLoadBindings::ReleaseGroup(*this,group);
    SetGroupLoaded(group,false);
    if (IsCanonicalResourceGroupId(group))
        delete std::exchange(mPendingPlans[static_cast<unsigned>(group)],nullptr);
    if (mCurResGroup==group) mLoadPlan=nullptr;
}
void ResourceManager::DeleteResources()
{
    mLoadPlan=nullptr;
    for (auto*& plan:mPendingPlans) delete std::exchange(plan,nullptr);
    for (unsigned group=1;group<=RESOURCE_GROUP_COUNT;++group)
        ResourceLoadBindings::ReleaseGroup(*this,static_cast<ResourceGroupId>(group));
    mLoadedGroups.reset();
}

bool ResourceManager::LoadAlphaGridImage(ImageRes* metadata,Image* image)
{
    auto* alpha=ImageLib::GetImage(metadata->mAlphaGridImage,true);
    if (!alpha) return Fail(ResourceFailure::AlphaGridMissing,metadata->mRecord);
    if (alpha->mWidth!=image->mWidth || alpha->mHeight!=image->mHeight)
    {
        delete alpha;
        return Fail(ResourceFailure::AlphaGridSize,metadata->mRecord);
    }
    image->AppendAlphaImage(alpha); // Transfers ownership even if composition throws.
    return true;
}
bool ResourceManager::LoadAlphaImage(ImageRes* metadata,Image* image)
{
    auto* alpha=ImageLib::GetImage(metadata->mAlphaImage,true);
    if (!alpha) return Fail(ResourceFailure::AlphaMissing,metadata->mRecord);
    if (alpha->mWidth!=image->mWidth || alpha->mHeight!=image->mHeight)
    {
        delete alpha;
        return Fail(ResourceFailure::AlphaSize,metadata->mRecord);
    }
    image->AppendAlphaImage(alpha);
    return true;
}
bool ResourceManager::LoadImage(ImageRes& metadata,Image*& target,SharedImageRef& owner)
{
    if (metadata.mFromProgram || metadata.mUnavailable) return true;
    if (owner.mImage) { target=owner.mImage; return true; }
    try
    {
        ImageLib::ScopedAlphaComposeColor automatic(metadata.mAlphaColor);
        auto image=mApp->GetPreparedSharedImage(metadata.mPath,metadata.mVariant,nullptr,
            [&](Image* decoded) {
                ImageLib::ScopedAlphaComposeColor explicitAlpha(0xFFFFFF);
                if ((!metadata.mAlphaImage.empty() && !LoadAlphaImage(&metadata,decoded)) ||
                    (!metadata.mAlphaGridImage.empty() && !LoadAlphaGridImage(&metadata,decoded)))
                    throw ResourceManagerException(mError);
                decoded->CommitBits();
                TodMarkImageForSanding(decoded);
            },metadata.mAutoFindAlpha && metadata.mAlphaImage.empty() && metadata.mAlphaGridImage.empty());
        if (!image.mImage) return Fail(ResourceFailure::ImageMissing,metadata.mRecord);
        owner=image;
        target=image.mImage;
        TodQueueTextureWarm(image);
        return true;
    }
    catch (const ResourceManagerException& error) { return Fail(error.error); }
}
bool ResourceManager::LoadFont(FontRes& metadata,_Font*& target)
{
    if (target) { metadata.mFont=target; return true; }
    if (metadata.mFromProgram || metadata.mUnavailable) return true;
    if (!metadata.mImagePath.empty())
        return Fail(ResourceFailure::FontDescriptorRequired,metadata.mRecord);
    _Font* font=nullptr;
    if (metadata.mReference)
    {
        if (!metadata.mReference->mFont) return Fail(ResourceFailure::FontReferenceMissing,metadata.mRecord);
        font=metadata.mReference->mFont->Duplicate();
    }
    else font=new ImageFont(mApp,metadata.mPath);
    if (!font) return Fail(ResourceFailure::FontMissing,metadata.mRecord);
    try
    {
        if (auto* imageFont=dynamic_cast<ImageFont*>(font))
        {
            if (!imageFont->mFontData || !imageFont->mFontData->mInitialized)
            {
                delete font;
                return Fail(ResourceFailure::FontMissing,metadata.mRecord);
            }
            for (auto tag:metadata.mTagIds)
                if (!imageFont->AddTagNumeric(tag))
                {
                    delete font;
                    return Fail(ResourceFailure::FontTagDuplicate,metadata.mRecord,tag);
                }
            if (!metadata.mTagIds.empty()) imageFont->Prepare();
        }
    }
    catch (...) { delete font; throw; }
    metadata.mFont=target=font;
    return true;
}
bool ResourceManager::LoadSound(SoundRes& metadata,int& target)
{
    if (target>=0 || metadata.mFromProgram || metadata.mUnavailable) return true;
    const int sound=mApp->mSoundManager->GetFreeSoundId();
    if (sound<0) return Fail(ResourceFailure::SoundSlotsExhausted,metadata.mRecord);
    if (!mApp->mSoundManager->LoadSound(sound,metadata.mPath))
    {
        mApp->mSoundManager->ReleaseSound(sound);
        return Fail(ResourceFailure::SoundMissing,metadata.mRecord);
    }
    target=sound; // Publish ownership before optional setup so group rollback releases it.
    if (metadata.mVolume>=0) mApp->mSoundManager->SetBaseVolume(sound,metadata.mVolume);
    if (metadata.mPanning) mApp->mSoundManager->SetBasePan(sound,metadata.mPanning);
    return true;
}
void ResourceManager::ReleaseImage(Image*& target,SharedImageRef& owner)
{
    target=nullptr;
    owner.Release();
}
void ResourceManager::ReleaseFont(_Font*& target) { delete std::exchange(target,nullptr); }
void ResourceManager::ReleaseSound(int& target)
{
    const int sound=std::exchange(target,-1);
    if (sound>=0 && mApp->mSoundManager) mApp->mSoundManager->ReleaseSound(sound);
}
int ResourceManager::GetNumResources(ResourceGroupId group,ResType type)
{
    return IsCanonicalResourceGroupId(group) ? int(mGroups[static_cast<unsigned>(group)].mCounts[type]) : 0;
}
int ResourceManager::GetNumResources(ResType type)
{
    int total=0;
    for (const auto& group:mGroups) total+=int(group.mCounts[type]);
    return total;
}
int ResourceManager::GetNumResources(ResourceGroupId group)
{
    return IsCanonicalResourceGroupId(group) ? int(mGroups[static_cast<unsigned>(group)].mCount) : 0;
}
int ResourceManager::GetNumResources()
{
    int total=0;
    for (const auto& group:mGroups) total+=int(group.mCount);
    return total;
}
