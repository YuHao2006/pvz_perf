#pragma once

namespace Sexy
{
    class Image;
    class MemoryImage;
}
using namespace Sexy;

enum FilterEffect
{
    FILTER_EFFECT_NONE = -1,
    FILTER_EFFECT_WASHED_OUT,
    FILTER_EFFECT_LESS_WASHED_OUT,
    FILTER_EFFECT_WHITE,
    NUM_FILTER_EFFECTS
};

void                FilterEffectInitForApp();
void                FilterEffectDisposeForApp();
Image*              FilterEffectCreateImage(Image* theImage, FilterEffect theFilterEffect);
// Main thread, after source textures are loaded. Idempotent; owns no CPU pixels.
void                FilterEffectPrebuildImage(Image* theImage, FilterEffect theFilterEffect);
// Lookup only. Missing entries are loading errors, never draw-time allocations.
Image*              FilterEffectGetImage(Image* theImage, FilterEffect theFilterEffect);
