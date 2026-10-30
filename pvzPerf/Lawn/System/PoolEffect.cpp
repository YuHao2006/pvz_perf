#include "PoolEffect.h"
#include <stdexcept>
#include <limits>
#include "LawnApp.h"
#include "Resources.h"
#include "GameConstants.h"
#include "Sexy.TodLib/TodDebug.h"
#include "graphics/Image.h"
#include "graphics/Graphics.h"
#include "graphics/DDInterface.h"
#include "graphics/RenderInterface.h"

//0x469A60
void PoolEffect::PoolEffectInitialize()
{
    auto* aSource = IMAGE_POOL_CAUSTIC_EFFECT;
    if (aSource == nullptr || aSource->mWidth != 256 || aSource->mHeight != 256)
        throw std::runtime_error("PoolEffect: caustic source must be a 256x256 GPU texture");

    auto* aApp = gLawnApp;
    if (aApp == nullptr || aApp->mDDInterface == nullptr ||
        aApp->mDDInterface->mRenderInterface == nullptr)
        throw std::runtime_error("PoolEffect: GPU caustics renderer is required");
    RenderInterface* anInterface = aApp->mDDInterface->mRenderInterface;

    // The output has metadata only; compute owns all of its pixels.
    auto* aImage = new Image(aApp);
    aImage->mWidth = CAUSTIC_IMAGE_WIDTH;
    aImage->mHeight = CAUSTIC_IMAGE_HEIGHT;
    aImage->mForcedMode = true;
    aImage->mHasTrans = true;
    aImage->mHasAlpha = true;

    PoolEffectDispose();
    try {
        if (!anInterface->InstallCausticsCompute(aImage, aSource))
            throw std::runtime_error("PoolEffect: GPU caustics compute installation failed");
        anInterface->SetCausticsTimeNs(0u);
    } catch (...) {
        delete aImage;
        throw;
    }

    mCausticImage = aImage;
    mApp = aApp;
    mPoolTimeNs = 0;
    mCausticGPU = true;
}

PoolEffect::~PoolEffect()
{
    PoolEffectDispose();
}

void PoolEffect::PoolEffectDispose()
{
    delete mCausticImage;
    mCausticImage = nullptr;
    mCausticGPU = false;
}

//0x469DE0

void PoolEffect::PoolEffectDraw(Sexy::Graphics* g, bool theIsNight)
{
    if (!mCausticGPU || mCausticImage == nullptr || mApp == nullptr)
        throw std::runtime_error("PoolEffect: drawing requires installed GPU caustics");
    auto* aDestImage = g != nullptr ? g->mDestImage : nullptr;
    if (aDestImage == nullptr || aDestImage->mRenderOwner == nullptr)
        throw std::runtime_error("PoolEffect: drawing requires a GPU destination");
    auto& render=*aDestImage->mRenderOwner;
    render.SelectDrawSurface(aDestImage);
    // Keep the bounded 1073 phase. Vulkan evaluates the wave mesh on the CPU;
    // the draw parameters retain the existing phase and clock behavior.
    const double phase=static_cast<double>(mPoolTimeNs % 1'584'000'000'000ull)*2*PI;
    Sexy::GpuPoolParams params{};
    params.width=float(IMAGE_POOL->mWidth);
    params.height=float(IMAGE_POOL->mHeight);
    params.transX=g->mTransX;
    params.transY=g->mTransY;
    params.time1=float(phase/8'000'000'000.0);
    params.time2=float(phase/1'500'000'000.0);
    params.time3=float(phase/9'000'000'000.0);
    params.time5=float(phase/1'100'000'000.0);
    params.clip={g->mClipRect.mX,g->mClipRect.mY,g->mClipRect.mWidth,g->mClipRect.mHeight};
    params.night=theIsNight;
    params.sampler=g->mLinearBlend ? 1u : 0u;
    params.blend=static_cast<Sexy::GpuBlend>(g->mDrawMode);
    render.DrawPool(theIsNight ? IMAGE_POOL_BASE_NIGHT : IMAGE_POOL_BASE,params);
    params.layer=1;
    render.DrawPool(theIsNight ? IMAGE_POOL_SHADING_NIGHT : IMAGE_POOL_SHADING,params);
    params.layer=2;
    params.sampler|=2u;
    render.DrawPool(mCausticImage,params);
}

void PoolEffect::PoolEffectUpdate(unsigned long long elapsedNs)
{
    if (!mCausticGPU || mCausticImage == nullptr || mApp == nullptr ||
        mApp->mDDInterface == nullptr || mApp->mDDInterface->mRenderInterface == nullptr)
        throw std::runtime_error("PoolEffect: updating requires installed GPU caustics");
    if (elapsedNs > std::numeric_limits<unsigned long long>::max()-mPoolTimeNs)
        throw std::overflow_error("PoolEffect time overflow");
    mPoolTimeNs += elapsedNs;
    RenderInterface* anInterface = mApp->mDDInterface->mRenderInterface;
    anInterface->SetCausticsTimeNs(mPoolTimeNs);
}
