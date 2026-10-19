#include "D3d9RendererInternal.h"
#include "Sexy.TodLib/generated/ImageAtlasGroups.h"
#include "Sexy.TodLib/generated/ImageSymbolId.h"
#include <algorithm>
#include <cmath>
#include <limits>

namespace Sexy {
static_assert(OpenGLAtlasCorpus::RegistryHash == IMAGE_SYMBOL_ID_REGISTRY_CRC);
void D3d9Renderer::Impl::RememberAtlasCopy(D3d9Texture* image,
    const std::shared_ptr<D3d9Storage>& storage, int x, int y)
{
    image->atlasCopies.push_back({storage, x, y});
    if (!storage->atlasRegions)
        storage->atlasRegions = std::make_unique<std::array<D3d9AtlasRegion, 4096>>();
    if (image->slot != ~0U) (*storage->atlasRegions)[image->slot] = {image, x, y};
}
void D3d9Renderer::Impl::ForgetAtlasCopies(D3d9Texture* image)
{
    for (const auto& copy : image->atlasCopies)
        if (image->slot != ~0U) {
            auto& region = (*copy.storage->atlasRegions)[image->slot];
            if (region.owner == image) region = {};
        }
    image->atlasCopies.clear(); image->atlased = false;
}
bool D3d9Renderer::Impl::Place(Page& page, int w, int h, int& x, int& y)
{
    const Page::Rect* best = nullptr;
    int shortSide = std::numeric_limits<int>::max(), longSide = shortSide;
    for (const auto& free : page.free) {
        if (w > free.width || h > free.height) continue;
        const int a = std::min(free.width - w, free.height - h);
        const int b = std::max(free.width - w, free.height - h);
        if (a < shortSide || (a == shortSide && b < longSide)) {
            best = &free; shortSide = a; longSide = b;
        }
    }
    if (!best) return false;
    x = best->x; y = best->y;
    std::vector<Page::Rect> next;
    next.reserve(page.free.size() + 4);
    for (const auto& free : page.free) {
        if (x >= free.x + free.width || x + w <= free.x ||
            y >= free.y + free.height || y + h <= free.y) {
            next.push_back(free); continue;
        }
        if (x > free.x) next.push_back({free.x, free.y, x - free.x, free.height});
        if (x + w < free.x + free.width)
            next.push_back({x + w, free.y, free.x + free.width - x - w, free.height});
        if (y > free.y) next.push_back({free.x, free.y, free.width, y - free.y});
        if (y + h < free.y + free.height)
            next.push_back({free.x, y + h, free.width, free.y + free.height - y - h});
    }
    for (size_t i = 0; i < next.size();) {
        bool contained = false;
        for (size_t j = 0; j < next.size(); ++j) {
            if (i == j) continue;
            const auto& a = next[i]; const auto& b = next[j];
            if (a.x >= b.x && a.y >= b.y &&
                a.x + a.width <= b.x + b.width && a.y + a.height <= b.y + b.height) {
                contained = true; break;
            }
        }
        if (contained) next.erase(next.begin() + i); else ++i;
    }
    page.free = std::move(next);
    return true;
}
void D3d9Renderer::Impl::CollectImmutable(D3d9Texture* image)
{
    if (image->render || image->caustic || image->storage->format != D3DFMT_A8R8G8B8 ||
        image->width > std::min(256, pageSize) || image->height > std::min(256, pageSize)) return;
    image->atlasEligible = true;
    if (!atlasFinalized || image->atlased) return;
    // Copying to a distinct page leaves queued batches' original storage valid.
    auto* destination = Allocate(image->width, image->height, D3DFMT_A8R8G8B8, true, false);
    try { Copy(image, destination->storage, destination->x, destination->y); }
    catch (...) { textures.erase(destination); throw; }
    image->storage = destination->storage;
    image->x = destination->x; image->y = destination->y; image->atlased = true;
    RememberAtlasCopy(image, image->storage, image->x, image->y);
    textures.erase(destination);
}
void D3d9Renderer::FinishLoadingTextures()
{
    FinishLoadingTextures(OpenGLAtlasCorpus::GroupOffsets, OpenGLAtlasCorpus::Symbols,
        OpenGLAtlasCorpus::ReanimationGroups);
}
void D3d9Renderer::FinishLoadingTextures(std::span<const unsigned int> offsets,
    std::span<const unsigned int> symbols, unsigned int reanimationGroups)
{
    auto& s = *impl_;
    if (s.atlasFinalized) return;
    if (s.open) throw std::logic_error("Finalize D3D9 atlases between scenes");
    s.Flush();
    if (offsets.empty() || offsets.front() != 0 || offsets.back() != symbols.size() ||
        reanimationGroups > offsets.size() - 1 || !std::is_sorted(offsets.begin(), offsets.end()))
        throw std::invalid_argument("Invalid D3D9 atlas group offsets");
    const auto order = [](const auto* a, const auto* b) {
        const int aa = a->width * a->height, ba = b->width * b->height;
        if (aa != ba) return aa > ba;
        if (a->height != b->height) return a->height > b->height;
        if (a->width != b->width) return a->width > b->width;
        return a->slot < b->slot;
    };
    struct Placement { D3d9Texture* image; size_t page; int x, y; };
    std::vector<Placement> placements;
    std::vector<Impl::Page> plan;
    std::vector<int> edges;
    std::array<bool, 4096> grouped{};
    const auto pack = [&](std::vector<D3d9Texture*> images, unsigned int kind) {
        if (images.empty()) return;
        std::sort(images.begin(), images.end(), order);
        images.erase(std::unique(images.begin(), images.end()), images.end());
        unsigned long long area = 0;
        int largest = 16;
        for (const auto* image : images) {
            area += static_cast<unsigned long long>(image->width) * image->height;
            largest = std::max({largest, image->width, image->height});
        }
        const auto desired = std::max<unsigned long long>(largest,
            static_cast<unsigned long long>(std::ceil(std::sqrt(static_cast<double>(area)))));
        int edge = static_cast<int>(std::min<unsigned long long>(s.pageSize,
            std::max<unsigned long long>(16, (desired + 7) / 8 * 8)));
        std::vector<Impl::Page> local;
        std::vector<Placement> packed;
        for (;;) {
            local.clear(); packed.clear();
            local.push_back({nullptr, {{0, 0, edge, edge}}, kind});
            bool fits = true;
            for (auto* image : images) {
                size_t page = 0; int x = 0, y = 0;
                while (page < local.size() && !s.Place(local[page], image->width, image->height, x, y)) ++page;
                if (page == local.size()) {
                    if (edge < s.pageSize) { fits = false; break; }
                    // Definition groups can span pages on smaller Win7 hardware.
                    local.push_back({nullptr, {{0, 0, edge, edge}}, kind});
                    if (!s.Place(local.back(), image->width, image->height, x, y))
                        throw std::runtime_error("Image exceeds D3D9 atlas page size");
                }
                packed.push_back({image, page, x, y});
            }
            if (fits) break;
            edge = std::min(s.pageSize, ((edge + std::max(8, edge / 8) + 7) / 8) * 8);
        }
        const auto first = plan.size();
        for (auto& page : local) { plan.push_back(std::move(page)); edges.push_back(edge); }
        for (auto placement : packed) { placement.page += first; placements.push_back(placement); }
        if (kind == 2) s.packedPageSize = edge;
    };
    for (size_t group = 0; group + 1 < offsets.size(); ++group) {
        std::vector<D3d9Texture*> members;
        for (auto i = offsets[group]; i < offsets[group + 1]; ++i) {
            const auto symbol = symbols[i];
            if (!symbol || symbol >= 4096 - s.staticBase) continue;
            auto* image = s.slots[s.staticBase + symbol];
            if (!image || !image->atlasEligible) continue;
            members.push_back(image); grouped[image->slot] = true;
        }
        pack(std::move(members), group < reanimationGroups ? 0U : 1U);
    }
    std::vector<D3d9Texture*> others;
    for (const auto& [image, owner] : s.textures)
        if (image->atlasEligible && image->slot < s.slots.size() && !grouped[image->slot]) others.push_back(image);
    pack(std::move(others), 2);
    for (size_t i = 0; i < plan.size(); ++i)
        plan[i].storage = s.Storage(edges[i], edges[i], D3DFMT_A8R8G8B8);
    for (const auto& placement : placements)
        s.Copy(placement.image, plan[placement.page].storage, placement.x, placement.y);
    // All copies use the old mapping; publish only after the complete plan succeeds.
    for (const auto& placement : placements) {
        auto* image = placement.image;
        if (!image->atlased) {
            image->storage = plan[placement.page].storage;
            image->x = placement.x; image->y = placement.y; image->atlased = true;
        }
        s.RememberAtlasCopy(image, plan[placement.page].storage, placement.x, placement.y);
    }
    s.pages = std::move(plan); s.atlasFinalized = true;
}
D3d9Renderer::AtlasCounts D3d9Renderer::GetAtlasCounts() const
{
    AtlasCounts counts{impl_->pages.size(), 0, 0, 0};
    for (const auto& [image, owner] : impl_->textures)
        if (image->atlased) {
            ++counts.images; counts.pixels += static_cast<unsigned long long>(image->width) * image->height;
            counts.copies += image->atlasCopies.size();
        }
    for (const auto& page : impl_->pages) {
        counts.capacity += static_cast<unsigned long long>(page.storage->width) * page.storage->height;
        if (page.kind == 0) ++counts.reanimationPages;
        if (page.kind == 1) ++counts.particlePages;
    }
    return counts;
}
}
