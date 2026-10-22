#pragma once
#include "graphics/ResidentImage.h"
#include <cstdint>
#include <memory>
#include <span>
#include <string>
#include <string_view>

// Inline wire and runtime image rectangle. All six zeros mean no image.
struct DefinitionImageRegion final
{
    int mX=0, mY=0, mWidth=0, mHeight=0, mRows=0, mCols=0;
};
static_assert(sizeof(DefinitionImageRegion)==24);

// Definitions share one resident atlas. Rectangles live directly in frames and
// emitters; no local image table or per-region image object is needed.
struct DefinitionAtlas final
{
    std::shared_ptr<Sexy::ResidentImage> image;
    int width=0, height=0;
};

DefinitionAtlas DefinitionLoadAtlas(std::span<const std::uint8_t> payload,
    std::size_t& position, std::uint32_t magic);
DefinitionImageRegion DefinitionReadImageRegion(std::span<const std::uint8_t> payload,
    std::size_t& position, const DefinitionAtlas& atlas);
// Image paths are compiled into the program's generated binding table.
// Call only after the complete definition body has validated.
void DefinitionBindAtlas(DefinitionAtlas& atlas, const std::string& compiledPath);
