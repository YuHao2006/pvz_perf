#include "TodCommon.h"
#include "TodParticle.h"
#include <algorithm>
#include <stdexcept>
#include "Definition.h"
#include "DefinitionImageRegion.h"
#include "generated/GeneratedDefinitions.h"
#include "Lawn/Widget/ZombatarResources.h"
#include "graphics/DDInterface.h"
#include "graphics/RenderInterface.h"
#include "imagelib/ImageLib.h"
#include "SexyAppBase.h"
#include <mutex>
#include <atomic>
#include <unordered_map>
#include <string>
#include <utility>
#include <vector>

namespace
{
std::mutex gDefinitionAtlasMutex;
std::atomic<bool> gImageResourcesPublished{false};
// Loading/lifetime bookkeeping, never referenced by drawing code.
struct AtlasResource
{
    Sexy::GpuTexture* texture;
    ImageLib::Image* decoded;
    int width,height;
};
std::unordered_map<std::string,AtlasResource> gDefinitionAtlasImages;
struct PendingAtlasBinding
{
    Sexy::GpuTexture** destination;
    AtlasResource* resource;
    unsigned count=1;
};
std::vector<PendingAtlasBinding> gPendingAtlasBindings;
struct PendingImageBinding {Sexy::GpuTexture** destination;Sexy::Image** image;};
std::vector<PendingImageBinding> gPendingImageBindings;

AtlasResource& LoadSharedDefinitionAtlas(const std::string& path,
    unsigned width,unsigned height)
{
    // Caller holds the registry lock. Publish only a fully decoded image,
    // once per live path, including atlases shared across definition kinds.
    const auto found=gDefinitionAtlasImages.find(path);
    if (found!=gDefinitionAtlasImages.end())
    {
        auto& image=found->second;
        if (image.width!=int(width) || image.height!=int(height))
            throw std::runtime_error("shared definition atlas dimensions disagree: "+path);
        return image;
    }
    if (!path.ends_with(".png"))
        throw std::invalid_argument("Definition atlas requires a PNG path");
    ImageLib::Image* decoded=ImageLib::GetImage(path,false);
    try
    {
        if (!decoded || !decoded->mBits || decoded->HasComposition() ||
            decoded->mWidth!=int(width) || decoded->mHeight!=int(height))
            throw std::runtime_error("definition atlas PNG dimensions mismatch: "+path);
        const auto [entry,inserted]=gDefinitionAtlasImages.emplace(
            path,AtlasResource{nullptr,decoded,int(width),int(height)});
        if (!inserted)
            throw std::runtime_error("duplicate definition atlas registration: "+path);
        decoded=nullptr;
        return entry->second;
    }
    catch (...)
    {
        delete decoded;
        throw;
    }
}
}

void DefinitionFreeAtlasImages()
{
    ZombatarFreeResources();
    GeneratedDefinitions::ReleaseImages();
    std::unordered_map<std::string,AtlasResource> images;
    {
        std::lock_guard lock(gDefinitionAtlasMutex);
        std::vector<PendingAtlasBinding>().swap(gPendingAtlasBindings);
        images.swap(gDefinitionAtlasImages);
        gPendingImageBindings.clear();
        gImageResourcesPublished.store(false,std::memory_order_relaxed);
    }
    for (const auto& entry:images)
        delete entry.second.decoded;
    if (gSexyAppBase && gSexyAppBase->mDDInterface &&
        gSexyAppBase->mDDInterface->mRenderInterface)
        gSexyAppBase->mDDInterface->mRenderInterface->FreeAtlasTextures();
}

void DefinitionBindAtlasPath(Sexy::GpuTexture*& texture,int width,int height,
    const char* path)
{
    DefinitionBindAtlasRange(&texture,1,width,height,path);
}
void DefinitionBindAtlasRange(Sexy::GpuTexture** textures,unsigned count,int width,int height,const char* path)
{
    if(!count)return;
    auto& texture=*textures;
    if (width==0)
    {
        texture=nullptr;
        return;
    }
    std::lock_guard lock(gDefinitionAtlasMutex);
    auto& image=LoadSharedDefinitionAtlas(path,width,height);
    // Early loading-screen definitions are loaded on the primary thread.
    // Bind them before their first draw; worker-loaded definitions wait for
    // the loading barrier and never call the graphics API.
    if (!image.texture && gSexyAppBase &&
        CurrentNativeThreadIdentity()==gSexyAppBase->mPrimaryThreadId &&
        gSexyAppBase->mDDInterface && gSexyAppBase->mDDInterface->mRenderInterface &&
        gSexyAppBase->mDDInterface->mRenderInterface->mRenderer)
        image.texture=gSexyAppBase->mDDInterface->mRenderInterface->UploadAtlasTexture(image.decoded);
    if (image.texture)
        std::fill_n(textures,count,image.texture);
    else if (std::none_of(gPendingAtlasBindings.begin(),gPendingAtlasBindings.end(),
        [&](const auto& binding) { return binding.destination==&texture; }))
        gPendingAtlasBindings.push_back({&texture,&image,count});
}

int DefinitionUploadAtlasImages()
{
    if (!gSexyAppBase || CurrentNativeThreadIdentity()!=gSexyAppBase->mPrimaryThreadId ||
        !gSexyAppBase->mDDInterface || !gSexyAppBase->mDDInterface->mRenderInterface)
        throw std::logic_error("Definition atlas upload requires the primary renderer thread");
    auto& render=*gSexyAppBase->mDDInterface->mRenderInterface;
    std::lock_guard lock(gDefinitionAtlasMutex);
    // Do not read globals still being assigned by the resource loading thread.
    if(!gPendingImageBindings.empty()&&!gImageResourcesPublished.load(std::memory_order_acquire))return -1;
    int uploaded=0;
    for (auto& [path,image]:gDefinitionAtlasImages)
    {
        if (!image.texture)
        {
            image.texture=render.UploadAtlasTexture(image.decoded);
            ++uploaded;
        }
    }
    for (const auto& binding:gPendingAtlasBindings)
        std::fill_n(binding.destination,binding.count,binding.resource->texture);
    std::vector<PendingAtlasBinding>().swap(gPendingAtlasBindings);
    for(const auto& binding:gPendingImageBindings) {
        if(!*binding.image)throw std::logic_error("Shared definition image resource is not loaded");
        *binding.destination=render.CreateImageTexture(*binding.image);
    }
    std::vector<PendingImageBinding>().swap(gPendingImageBindings);
    return uploaded;
}

void DefinitionUnbindAtlas(Sexy::GpuTexture*& texture)
{
    std::lock_guard lock(gDefinitionAtlasMutex);
    std::erase_if(gPendingAtlasBindings,[&](const PendingAtlasBinding& binding) {
        return binding.destination==&texture;
    });
    std::erase_if(gPendingImageBindings,[&](const auto& binding){return binding.destination==&texture;});
    texture=nullptr;
}
void DefinitionBindImageResource(Sexy::GpuTexture*& texture,Sexy::Image** image) {
    std::lock_guard lock(gDefinitionAtlasMutex);
    if(gSexyAppBase&&CurrentNativeThreadIdentity()==gSexyAppBase->mPrimaryThreadId&&*image&&
        gSexyAppBase->mDDInterface&&gSexyAppBase->mDDInterface->mRenderInterface) {
        texture=gSexyAppBase->mDDInterface->mRenderInterface->CreateImageTexture(*image);return;
    }
    if(std::none_of(gPendingImageBindings.begin(),gPendingImageBindings.end(),
        [&](const auto& binding){return binding.destination==&texture;}))
        gPendingImageBindings.push_back({&texture,image});
}

//0x4448E0
float FloatTrackEvaluate(const FloatParameterTrack& theTrack, double theTimeValue, float theInterp)
{
    if (theTrack.mCountNodes == 0)
        return 0.0f;

    // 常值轨快路：单节点 low==high 时，任何分布曲线在任何 t 下恒返 low
    //（Curves 族全部经 EvalFull(t,a,b,...)=a+(b-a)*warp(t) 或端点钳制，
    // a==b ⇒ 代数上逐位等于 low）——省一次间接调用，热路径常打。
    if (theTrack.mCountNodes == 1 && theTrack.mNodes[0].mLow == theTrack.mNodes[0].mHigh)
        return theTrack.mNodes[0].mLow;

    const auto value = [theInterp](const FloatParameterTrackNode& node) {
        return kCurveEvals[node.mDistribution](theInterp,
            node.mLow, node.mHigh);
    };
    if (theTimeValue < theTrack.mNodes[0].mTime)
        return value(theTrack.mNodes[0]);

    const FloatParameterTrackNode* aNodeCur = &theTrack.mNodes[0];
    for (int i = 1; i < theTrack.mCountNodes; i++)
    {
        const FloatParameterTrackNode* aNodeNxt = &theTrack.mNodes[i];
        if (theTimeValue <= aNodeNxt->mTime)
        {
            // 计算当前时间在〔当前节点至下一节点〕的过程中的进度
            const double span = aNodeNxt->mTime - aNodeCur->mTime;
            const double aTimeFraction = span > 0.0
                ? (theTimeValue - aNodeCur->mTime) / span : 1.0;
            return kCurveEvals[aNodeCur->mCurveType](aTimeFraction,
                value(*aNodeCur), value(*aNodeNxt));
        }
        aNodeCur = aNodeNxt;
    }

    return value(theTrack.mNodes[theTrack.mCountNodes - 1]);
}

bool FloatTrackIsSet(const FloatParameterTrack& theTrack)
{
    // Constant marks an omitted/default track. Historical curve slot 8 aliases
    // Constant too; retain the original default-track behavior for that slot.
    return theTrack.mCountNodes != 0 && theTrack.mNodes[0].mCurveType != 0 &&
        theTrack.mNodes[0].mCurveType != 8;
}

bool FloatTrackIsConstantZero(const FloatParameterTrack& theTrack)
{
    // 当轨道无节点，或仅存在一个节点且该节点的最大、最小值均为 0 时，认为该轨道上的值恒为零
    return theTrack.mCountNodes == 0 || (theTrack.mCountNodes == 1 && theTrack.mNodes[0].mLow == 0 && theTrack.mNodes[0].mHigh == 0);
}

//0x5167F0
float FloatTrackEvaluateFromLastTime(const FloatParameterTrack& theTrack, double theTimeValue, float theInterp)
{
    return theTimeValue < 0.0f ? 0.0f : FloatTrackEvaluate(theTrack, theTimeValue, theInterp);
}

void DefinitionUnbindAtlasRange(Sexy::GpuTexture** textures,unsigned count) {
    std::lock_guard lock(gDefinitionAtlasMutex);
    const auto first=reinterpret_cast<std::uintptr_t>(textures),last=first+sizeof(*textures)*count;
    const auto contains=[&](auto* pointer){const auto p=reinterpret_cast<std::uintptr_t>(pointer);return p>=first&&p<last;};
    std::erase_if(gPendingAtlasBindings,[&](const auto& b){return contains(b.destination);});
    std::erase_if(gPendingImageBindings,[&](const auto& b){return contains(b.destination);});
    std::fill_n(textures,count,nullptr);
}

void DefinitionPublishImageResources(){gImageResourcesPublished.store(true,std::memory_order_release);}
