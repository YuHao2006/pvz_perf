#include "PoolEffect.h"
#include <stdexcept>
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
        anInterface->SetCausticsFrame(0u);
    } catch (...) {
        delete aImage;
        throw;
    }

    mCausticImage = aImage;
    mApp = aApp;
    mPoolCounter = 0;
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
    RenderInterface* anInterface = aDestImage->mRenderOwner;

    float aGridSquareX = IMAGE_POOL->mWidth / 15.0f;
    float aGridSquareY = IMAGE_POOL->mHeight / 5.0f;
    float aOffsetArray[3][16][6][2] = {{{{ 0 }}}};
    for (int x = 0; x <= 15; x++)
    {
        for (int y = 0; y <= 5; y++)
        {
            aOffsetArray[2][x][y][0] = x / 15.0f;
            aOffsetArray[2][x][y][1] = y / 5.0f;
            if (x != 0 && x != 15 && y != 0 && y != 5)
            {
				// All 1073 wave terms repeat after 158400 ticks.  Reducing the
				// counter before the float conversion preserves the official 2*PI
				// speed while avoiding long-run phase precision loss.
				constexpr uint32_t POOL_PHASE_PERIOD = 158400u;
				float aPoolPhase = static_cast<float>(mPoolCounter % POOL_PHASE_PERIOD) * 2 * PI;
                float aWaveTime1 = aPoolPhase / 800.0;
                float aWaveTime2 = aPoolPhase / 150.0;
                float aWaveTime3 = aPoolPhase / 900.0;
                float aWaveTime4 = aPoolPhase / 800.0;
                float aWaveTime5 = aPoolPhase / 110.0;
                float xPhase = x * 3.0f * 2 * PI / 15.0f;
                float yPhase = y * 3.0f * 2 * PI / 5.0f;

                aOffsetArray[0][x][y][0] = sin(yPhase + aWaveTime2) * 0.002f + sin(yPhase + aWaveTime1) * 0.005f;
                aOffsetArray[0][x][y][1] = sin(xPhase + aWaveTime5) * 0.01f + sin(xPhase + aWaveTime3) * 0.015f + sin(xPhase + aWaveTime4) * 0.005f;
                aOffsetArray[1][x][y][0] = sin(yPhase * 0.2f + aWaveTime2) * 0.015f + sin(yPhase * 0.2f + aWaveTime1) * 0.012f;
                aOffsetArray[1][x][y][1] = sin(xPhase * 0.2f + aWaveTime5) * 0.005f + sin(xPhase * 0.2f + aWaveTime3) * 0.015f + sin(xPhase * 0.2f + aWaveTime4) * 0.02f;
                aOffsetArray[2][x][y][0] += sin(yPhase + aWaveTime1 * 1.5f) * 0.004f + sin(yPhase + aWaveTime2 * 1.5f) * 0.005f;
                aOffsetArray[2][x][y][1] += sin(xPhase * 4.0f + aWaveTime5 * 2.5f) * 0.005f + sin(xPhase * 2.0f + aWaveTime3 * 2.5f) * 0.04f + sin(xPhase * 3.0f + aWaveTime4 * 2.5f) * 0.02f;
            }
            else
            {
                aOffsetArray[0][x][y][0] = 0.0f;
                aOffsetArray[0][x][y][1] = 0.0f;
                aOffsetArray[1][x][y][0] = 0.0f;
                aOffsetArray[1][x][y][1] = 0.0f;
            }
        }
    }

    int aIndexOffsetX[6] = { 0, 0, 1, 0, 1, 1 };
    int aIndexOffsetY[6] = { 0, 1, 1, 0, 1, 0 };
    TriVertex aVertArray[3][150][3];

    for (int x = 0; x < 15; x++)
    {
        for (int y = 0; y < 5; y++)
        {
            for (int aLayer = 0; aLayer < 3; aLayer++)
            {
                TriVertex* pVert = &aVertArray[aLayer][x * 10 + y * 2][0];
                for (int aVertIndex = 0; aVertIndex < 6; aVertIndex++, pVert++)
                {
                    int aIndexX = x + aIndexOffsetX[aVertIndex];
                    int aIndexY = y + aIndexOffsetY[aVertIndex];
                    if (aLayer == 2)
                    {
                        pVert->x = (704.0f / 15.0f) * aIndexX + 45.0f;
                        pVert->y = 30.0f * aIndexY + 288.0f;
                        pVert->u = aOffsetArray[2][aIndexX][aIndexY][0] + aIndexX / 15.0f;
                        pVert->v = aOffsetArray[2][aIndexX][aIndexY][1] + aIndexY / 5.0f;

                        if (!g->mClipRect.Contains(pVert->x, pVert->y))
                        {
                            pVert->color = 0x00FFFFFFUL;
                        }
                        else if (aIndexX == 0 || aIndexX == 15 || aIndexY == 0)
                        {
                            pVert->color = 0x20FFFFFFUL;
                        }
                        else if (theIsNight)
                        {
                            pVert->color = 0x30FFFFFFUL;
                        }
                        else
                        {
                            pVert->color = aIndexX <= 7 ? 0xC0FFFFFFUL : 0x80FFFFFFUL;
                        }
                    }
                    else
                    {
                        pVert->color = 0xFFFFFFFFUL;
                        pVert->x = aIndexX * aGridSquareX + 35.0f;
                        pVert->y = aIndexY * aGridSquareY + 279.0f;
                        pVert->u = aOffsetArray[aLayer][aIndexX][aIndexY][0] + aIndexX / 15.0f;
                        pVert->v = aOffsetArray[aLayer][aIndexX][aIndexY][1] + aIndexY / 5.0f;
                        if (!g->mClipRect.Contains(pVert->x, pVert->y))
                        {
                            pVert->color = 0x00FFFFFFUL;
                        }
                    }
                }
            }
        }
    }

    if (theIsNight)
    {
        g->DrawTrianglesTex(IMAGE_POOL_BASE_NIGHT, aVertArray[0], 150);
        g->DrawTrianglesTex(IMAGE_POOL_SHADING_NIGHT, aVertArray[1], 150);
    }
    else
    {
        g->DrawTrianglesTex(IMAGE_POOL_BASE, aVertArray[0], 150);
        g->DrawTrianglesTex(IMAGE_POOL_SHADING, aVertArray[1], 150);
    }

    // Compute writes the caustics before BeginScene's render pass.
    anInterface->sSamplerAddressWrap = true;
    g->DrawTrianglesTex(mCausticImage, aVertArray[2], 150);
    anInterface->sSamplerAddressWrap = false;
}

void PoolEffect::PoolEffectUpdate()
{
    if (!mCausticGPU || mCausticImage == nullptr || mApp == nullptr ||
        mApp->mDDInterface == nullptr || mApp->mDDInterface->mRenderInterface == nullptr)
        throw std::runtime_error("PoolEffect: updating requires installed GPU caustics");
    ++mPoolCounter;
    RenderInterface* anInterface = mApp->mDDInterface->mRenderInterface;
    anInterface->SetCausticsFrame(mPoolCounter);
}
