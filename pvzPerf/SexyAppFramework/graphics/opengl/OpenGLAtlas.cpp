#include "OpenGLRendererInternal.h"
#include "Sexy.TodLib/generated/ImageAtlasGroups.h"
#include "Sexy.TodLib/generated/ImageSymbolId.h"
#include <algorithm>
#include <cmath>
#include <limits>
#include <stdexcept>

namespace Sexy {
using namespace GL3;
static_assert(OpenGLAtlasCorpus::RegistryHash==IMAGE_SYMBOL_ID_REGISTRY_CRC);

void OpenGLRenderer::Impl::RememberAtlasCopy(OpenGLTexture* image,
    const std::shared_ptr<OpenGLStorage>& storage,int x,int y)
{
    image->atlasCopies.push_back({storage,x,y});
    if(!storage->atlasRegions)
        storage->atlasRegions=std::make_unique<std::array<OpenGLAtlasRegion,4096>>();
    if(image->slot!=~0U)(*storage->atlasRegions)[image->slot]={image,x,y};
}

void OpenGLRenderer::Impl::ForgetAtlasCopies(OpenGLTexture* image)
{
    for(const auto& copy:image->atlasCopies)
        if(image->slot!=~0U) {
            auto& region=(*copy.storage->atlasRegions)[image->slot];
            if(region.owner==image)region={};
        }
    image->atlasCopies.clear();
    image->atlased=false;
}

bool OpenGLRenderer::Impl::Place(Page& page, int width, int height, int& x, int& y)
{
    const Page::Rect* best = nullptr;
    int shortSide = std::numeric_limits<int>::max(), longSide = shortSide;
    for (const auto& free : page.free) {
        if (width > free.width || height > free.height) continue;
        const int a = std::min(free.width-width,free.height-height);
        const int b = std::max(free.width-width,free.height-height);
        if (a < shortSide || (a == shortSide && b < longSide)) {
            best = &free; shortSide = a; longSide = b;
        }
    }
    if (!best) return false;
    x = best->x; y = best->y;
    std::vector<Page::Rect> next;
    next.reserve(page.free.size()+4);
    for (const auto& free : page.free) {
        if (x >= free.x+free.width || x+width <= free.x ||
            y >= free.y+free.height || y+height <= free.y) {
            next.push_back(free); continue;
        }
        // MaxRects: remove the placed area from every free rectangle, then
        // prune contained rectangles. Free rectangles may overlap each other.
        if (x > free.x) next.push_back({free.x,free.y,x-free.x,free.height});
        if (x+width < free.x+free.width)
            next.push_back({x+width,free.y,free.x+free.width-x-width,free.height});
        if (y > free.y) next.push_back({free.x,free.y,free.width,y-free.y});
        if (y+height < free.y+free.height)
            next.push_back({free.x,y+height,free.width,free.y+free.height-y-height});
    }
    for (size_t i = 0; i < next.size();) {
        bool contained = false;
        for (size_t j = 0; j < next.size(); ++j) {
            if (i == j) continue;
            const auto& a = next[i]; const auto& b = next[j];
            if (a.x >= b.x && a.y >= b.y &&
                a.x+a.width <= b.x+b.width && a.y+a.height <= b.y+b.height) {
                contained = true; break;
            }
        }
        if (contained) next.erase(next.begin()+i); else ++i;
    }
    page.free = std::move(next);
    return true;
}

void OpenGLRenderer::Impl::CollectImmutable(OpenGLTexture* texture)
{
    if (texture->render || texture->caustic || texture->storage->format!=GL_RGBA8 ||
        texture->width>std::min(256,pageSize) || texture->height>std::min(256,pageSize))
        return;
    texture->atlasEligible=true;
    if (!atlasFinalized || texture->atlased) return;
    Flush();
    auto* destination=Allocate(texture->width,texture->height,GL_RGBA8,true,false);
    unsigned int read=0,draw=0;
    try {
        glGenFramebuffers(1,&read); glGenFramebuffers(1,&draw);
        glBindFramebuffer(GL_READ_FRAMEBUFFER,read);
        glFramebufferTexture2D(GL_READ_FRAMEBUFFER,GL_COLOR_ATTACHMENT0,GL_TEXTURE_2D,
            texture->storage->image,0);
        glBindFramebuffer(GL_DRAW_FRAMEBUFFER,draw);
        glFramebufferTexture2D(GL_DRAW_FRAMEBUFFER,GL_COLOR_ATTACHMENT0,GL_TEXTURE_2D,
            destination->storage->image,0);
        glDisable(GL_SCISSOR_TEST);
        glBlitFramebuffer(texture->x,texture->y,texture->x+texture->width,texture->y+texture->height,
            destination->x,destination->y,destination->x+texture->width,destination->y+texture->height,
            GL_COLOR_BUFFER_BIT,GL_NEAREST);
        Check("Append immutable OpenGL atlas image");
        glDeleteFramebuffers(1,&read); glDeleteFramebuffers(1,&draw); read=draw=0;
    } catch (...) {
        if(read) glDeleteFramebuffers(1,&read);
        if(draw) glDeleteFramebuffers(1,&draw);
        textures.erase(destination); throw;
    }
    texture->storage=destination->storage;
    texture->x=destination->x; texture->y=destination->y; texture->atlased=true;
    RememberAtlasCopy(texture,texture->storage,texture->x,texture->y);
    textures.erase(destination);
}

void OpenGLRenderer::FinishLoadingTextures()
{
    FinishLoadingTextures(OpenGLAtlasCorpus::GroupOffsets,OpenGLAtlasCorpus::Symbols,
        OpenGLAtlasCorpus::ReanimationGroups);
}

void OpenGLRenderer::FinishLoadingTextures(std::span<const unsigned int> offsets,
    std::span<const unsigned int> symbols,unsigned int reanimationGroups)
{
    auto& s = *impl_;
    if (s.atlasFinalized) return;
    s.Flush();
    if (s.open) throw std::logic_error("Finalize OpenGL atlas between scenes");
    if(offsets.empty() || offsets.front()!=0 || offsets.back()!=symbols.size() ||
        reanimationGroups>offsets.size()-1 || !std::is_sorted(offsets.begin(),offsets.end()))
        throw std::invalid_argument("Invalid OpenGL atlas group offsets");
    const auto order=[](const auto* a,const auto* b) {
        const int aa=a->width*a->height, ba=b->width*b->height;
        if (aa!=ba) return aa>ba;
        if (a->height!=b->height) return a->height>b->height;
        if (a->width!=b->width) return a->width>b->width;
        return a->slot<b->slot;
    };
    struct Placement { OpenGLTexture* image; size_t page; int x,y; };
    std::vector<Placement> placements;
    std::vector<Impl::Page> plan;
    std::vector<int> edges;
    std::array<bool,4096> grouped{};
    const auto pack=[&](std::vector<OpenGLTexture*> images,unsigned int kind) {
        if(images.empty())return;
        std::sort(images.begin(),images.end(),order);
        images.erase(std::unique(images.begin(),images.end()),images.end());
        unsigned long long area=0;
        int largest=16;
        for(const auto* image:images) {
            area+=static_cast<unsigned long long>(image->width)*image->height;
            largest=std::max({largest,image->width,image->height});
        }
        const auto desired=std::max<unsigned long long>(largest,
            static_cast<unsigned long long>(std::ceil(std::sqrt(static_cast<double>(area)))));
        int edge=static_cast<int>(std::min<unsigned long long>(s.pageSize,
            std::max<unsigned long long>(16,(desired+7)/8*8)));
        std::vector<Impl::Page> local;
        std::vector<Placement> packed;
        for(;;) {
            local.clear();packed.clear();
            local.push_back({nullptr,{{0,0,edge,edge}},kind});
            bool fits=true;
            for(auto* image:images) {
                size_t page=0;int x=0,y=0;
                while(page<local.size() && !s.Place(local[page],image->width,image->height,x,y))++page;
                if(page==local.size()) {
                    if(edge<s.pageSize){fits=false;break;}
                    if(kind!=2)throw std::runtime_error("Definition atlas exceeds the OpenGL texture size limit");
                    local.push_back({nullptr,{{0,0,edge,edge}},kind});
                    if(!s.Place(local.back(),image->width,image->height,x,y))
                        throw std::runtime_error("Immutable image exceeds the OpenGL atlas size limit");
                }
                packed.push_back({image,page,x,y});
            }
            if(fits)break;
            edge=std::min(s.pageSize,((edge+std::max(8,edge/8)+7)/8)*8);
        }
        const auto first=plan.size();
        for(auto& page:local){plan.push_back(std::move(page));edges.push_back(edge);}
        for(auto placement:packed){placement.page+=first;placements.push_back(placement);}
        if(kind==2)s.packedPageSize=edge;
    };
    for(size_t group=0;group+1<offsets.size();++group) {
        std::vector<OpenGLTexture*> members;
        for(auto i=offsets[group];i<offsets[group+1];++i) {
            const auto symbol=symbols[i];
            if(!symbol || symbol>=4096-s.staticBase)continue;
            auto* image=s.slots[s.staticBase+symbol];
            if(!image || !image->atlasEligible)continue;
            members.push_back(image);grouped[image->slot]=true;
        }
        pack(std::move(members),group<reanimationGroups?0U:1U);
    }
    std::vector<OpenGLTexture*> others;
    for(const auto& [image,owner]:s.textures)
        if(image->atlasEligible && image->slot<s.slots.size() && !grouped[image->slot])
            others.push_back(image);
    pack(std::move(others),2);
    for(size_t i=0;i<plan.size();++i)plan[i].storage=s.Storage(edges[i],edges[i],GL_RGBA8);
    unsigned int read=0,draw=0;
    glGenFramebuffers(1,&read); glGenFramebuffers(1,&draw);
    glDisable(GL_SCISSOR_TEST);
    try {
        for (const auto& placement:placements) {
            auto* source=placement.image;
            glBindFramebuffer(GL_READ_FRAMEBUFFER,read);
            glFramebufferTexture2D(GL_READ_FRAMEBUFFER,GL_COLOR_ATTACHMENT0,GL_TEXTURE_2D,
                source->storage->image,0);
            glBindFramebuffer(GL_DRAW_FRAMEBUFFER,draw);
            glFramebufferTexture2D(GL_DRAW_FRAMEBUFFER,GL_COLOR_ATTACHMENT0,GL_TEXTURE_2D,
                plan[placement.page].storage->image,0);
            glBlitFramebuffer(source->x,source->y,source->x+source->width,source->y+source->height,
                placement.x,placement.y,placement.x+source->width,placement.y+source->height,
                GL_COLOR_BUFFER_BIT,GL_NEAREST);
            s.Check("Populate packed OpenGL atlas");
        }
    } catch (...) {
        glDeleteFramebuffers(1,&read); glDeleteFramebuffers(1,&draw); throw;
    }
    glDeleteFramebuffers(1,&read); glDeleteFramebuffers(1,&draw);
    // Publish mappings only after every GPU copy has been issued in order.
    // Previously submitted draws precede these copies on the same GL stream.
    for (const auto& placement:placements) {
        auto* image=placement.image;
        if(!image->atlased) {
            image->storage=plan[placement.page].storage;
            image->x=placement.x;image->y=placement.y;image->atlased=true;
        }
        s.RememberAtlasCopy(image,plan[placement.page].storage,placement.x,placement.y);
    }
    s.pages=std::move(plan);
    s.atlasFinalized=true;
}
OpenGLRenderer::AtlasCounts OpenGLRenderer::GetAtlasCounts() const
{
    AtlasCounts counts{impl_->pages.size(),0,0,0};
    for (const auto& [texture,owner]:impl_->textures)
        if(texture->atlased) {
            ++counts.images;
            counts.pixels+=static_cast<unsigned long long>(texture->width)*texture->height;
            counts.copies+=texture->atlasCopies.size();
        }
    for (const auto& page:impl_->pages) {
        counts.capacity+=static_cast<unsigned long long>(page.storage->width)*page.storage->height;
        if(page.kind==0)++counts.reanimationPages;
        if(page.kind==1)++counts.particlePages;
    }
    return counts;
}
}
