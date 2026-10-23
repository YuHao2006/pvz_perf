#pragma once
#include "graphics/GpuBackend.h"
#include "misc/Rect.h"
#include "Sexy.TodLib/generated/ZombatarImage.h"
#include <array>
#include <cstddef>

namespace Sexy { class Graphics; }

struct ZombatarAtlasDefinition
{
    int mWidth = 0;
    int mHeight = 0;
    std::array<Sexy::Rect, static_cast<std::size_t>(ZombatarImage::Count)> mImages{};
    Sexy::GpuTexture* mTexture = nullptr;
};

extern ZombatarAtlasDefinition gZombatarAtlas;

void ZombatarLoadResources();
void ZombatarFreeResources();
void DrawZombatarImage(Sexy::Graphics* graphics, ZombatarImage image, float x, float y);
void DrawZombatarImage(Sexy::Graphics* graphics, ZombatarImage image,
    float x, float y, int width, int height);
void DrawZombatarImage(Sexy::Graphics* graphics, ZombatarImage image,
    const Sexy::Rect& destination, const Sexy::Rect& source);
