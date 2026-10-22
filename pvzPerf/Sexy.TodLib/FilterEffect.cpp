#include "FilterEffect.h"
#include "TodCommon.h"
#include "graphics/Graphics.h"
#include "graphics/MemoryImage.h"
#include "graphics/ResidentImage.h"
#include "graphics/DDImage.h"
#include "graphics/DDInterface.h"
#include "graphics/RenderInterface.h"
#include <array>
#include <memory>
#include <stdexcept>
#include <vector>

void FilterEffectInitForApp() {}

void FilterEffectDisposeForApp()
{
    std::vector<MemoryImage*> sources;
    for(auto* image:gSexyAppBase->mMemoryImageSet)
        if(image->mFilterOwner==nullptr) sources.push_back(image);
    for(auto* source:sources)
        for(auto& image:source->mFilterImages) image.reset();
    if (gSexyAppBase->mDDInterface && gSexyAppBase->mDDInterface->mRenderInterface)
    {
        auto& render=*gSexyAppBase->mDDInterface->mRenderInterface;
        std::vector<ResidentImage*> atlases;
        for (auto* image:render.mResidentImageSet)
            if (!image->mFilterOwner) atlases.push_back(image);
        for (auto* source:atlases)
            for (auto& image:source->mFilterImages) image.reset();
    }
}

Image* FilterEffectCreateImage(Image* source, FilterEffect effect)
{
    static constexpr std::array filters{
        GpuImageColorFilter::WashedOut, GpuImageColorFilter::LessWashedOut,
        GpuImageColorFilter::White};
    auto& render=*gSexyAppBase->mDDInterface->mRenderInterface;
    const auto filter=effect==FILTER_EFFECT_NONE ? GpuImageColorFilter::None :
        filters.at(static_cast<size_t>(effect));
    if (auto* resident=AsResidentImage(source))
        return render.CreateResidentFilterImage(resident,filter);
    if (!AsMemoryImage(source))
        throw std::invalid_argument("FilterEffect requires a native source image");
    std::unique_ptr<DDImage> image(render.CreateRenderImage(source->mWidth,source->mHeight));
    GpuImageDrawScope drawing(render,image.get());
    GpuImageSamplingScope sampling(render,static_cast<unsigned int>(filter));
    Graphics graphics(image.get());
    graphics.mDrawMode = Graphics::DRAWMODE_OPAQUE;
    graphics.DrawImage(source,0,0);
    image->mNumCols=source->mNumCols;
    image->mNumRows=source->mNumRows;
    return image.release();
}

void FilterEffectPrebuildImage(Image* image, FilterEffect effect)
{
    if (CurrentNativeThreadIdentity() != gSexyAppBase->mPrimaryThreadId)
        throw std::logic_error("FilterEffect: prebuild requires the main thread");
    if (auto* source=AsResidentImage(image))
    {
        auto& cached=source->mFilterImages.at(static_cast<unsigned int>(effect));
        if (!cached)
            cached.reset(static_cast<ResidentImage*>(FilterEffectCreateImage(image,effect)));
        return;
    }
    auto* source=AsMemoryImage(image);
    if (!source)
        throw std::invalid_argument("FilterEffect: prebuild requires a source image");
    auto& cached=source->mFilterImages.at(static_cast<unsigned int>(effect));
    if(!cached)
    {
        std::unique_ptr<MemoryImage,ImageDeleter> candidate(
            static_cast<MemoryImage*>(FilterEffectCreateImage(image,effect)));
        candidate->mFilterOwner=source;
        cached=std::move(candidate);
    }
}

Image* FilterEffectGetImage(Image* image, FilterEffect effect)
{
    if (auto* source=AsResidentImage(image))
    {
        auto* owner=source;
        // White replaces a prior wash filter, so resolve against the original
        // atlas cache instead of OR-ing mutually exclusive shader filter bits.
        while (owner->mFilterOwner) owner=owner->mFilterOwner;
        const auto& cached=owner->mFilterImages.at(static_cast<unsigned int>(effect));
        if (!cached)
            throw std::logic_error("FilterEffect: resident atlas filter was not prebuilt: "+owner->mFilePath);
        return cached.get();
    }
    auto* source=AsMemoryImage(image);
    if (!source)
        throw std::invalid_argument("FilterEffect: lookup requires a source image");
    const auto& cached=source->mFilterImages.at(static_cast<unsigned int>(effect));
    if (!cached)
        throw std::logic_error(StrFormat(
            "FilterEffect: image was not prebuilt: effect=%d source='%s' size=%dx%d",
            static_cast<int>(effect), source->mFilePath.c_str(), source->mWidth, source->mHeight));
    return cached.get();
}
