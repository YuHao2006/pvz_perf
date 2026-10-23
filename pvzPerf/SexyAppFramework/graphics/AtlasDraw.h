#pragma once
#include "TextureSource.h"

namespace Sexy {
class Graphics;

void DrawAtlasImage(Graphics* graphics, const TextureSource& texture,
    const Rect& region, float x, float y);
void DrawAtlasImage(Graphics* graphics, const TextureSource& texture,
    const Rect& region, const Rect& destination, const Rect& localSource);
void DrawAtlasImageScaled(Graphics* graphics, const TextureSource& texture,
    const Rect& region, float x, float y, float scaleX, float scaleY);
}
