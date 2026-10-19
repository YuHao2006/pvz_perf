#pragma once
#include "OpenGLRenderer.h"
#include "OpenGLContext.h"
#include "OpenGLApi.h"
#include <array>
#include <memory>
#include <string_view>
#include <unordered_map>
#include <vector>

namespace Sexy {
struct OpenGLTexture;
struct OpenGLAtlasRegion {
    const OpenGLTexture* owner=nullptr;
    int x=0,y=0;
};
struct OpenGLStorage {
    unsigned int image = 0, framebuffer = 0;
    int width = 0, height = 0;
    unsigned int format = 0;
    std::unique_ptr<std::array<OpenGLAtlasRegion,4096>> atlasRegions;
    ~OpenGLStorage();
};
struct OpenGLTexture {
    struct AtlasCopy { std::shared_ptr<OpenGLStorage> storage; int x,y; };
    std::shared_ptr<OpenGLStorage> storage;
    int x = 0, y = 0, width = 0, height = 0;
    unsigned int slot = ~0U, staticSlot = ~0U, flags = 0;
    bool render = false, caustic = false, atlasEligible = false, atlased = false;
    std::vector<AtlasCopy> atlasCopies;
};
struct OpenGLRenderer::Impl {
    enum Uniform : unsigned int {
        uTargetExtent, uImage, uPremultipliedOutput, uCoverageInput,
        uSourceImage, uAlphaImage, uSourceRect, uAlphaRect, uSourceSlot,
        uOperation, uRectangle, uTint, uPackedColor, uCounter, uCells, uColorOnly,
        uSamplingFlags, uForceWhite, uXRanges, uYRanges, uXTaps, uYTaps,
        uXTapExtent, uYTapExtent, uGlyphSrc, uGlyphDst, uUniformCount
    };
    using UniformLocations=std::array<int,uUniformCount>;
    struct Vertex {
        GpuVertex draw;
        int x, y, width, height;
    };
    struct Batch {
        std::shared_ptr<OpenGLStorage> storage;
        size_t first, count;
        GpuBlend blend;
        GpuClip clip;
        bool coverage;
    };
    struct Page {
        struct Rect { int x, y, width, height; };
        std::shared_ptr<OpenGLStorage> storage;
        std::vector<Rect> free;
        unsigned int kind=2; // 0=reanimation, 1=particle, 2=unowned immutable images.
    };
    OpenGLContext& context;
    int width, height, maximum = 0, pageSize = 0;
    unsigned int staticBase = 4096, vao = 0, stream = 0;
    unsigned int sceneProgram = 0, imageProgram = 0, fontProgram = 0, presentProgram = 0;
    UniformLocations sceneUniforms{}, imageUniforms{}, fontUniforms{}, presentUniforms{};
    bool open = false, mainFrame = false, initialized = false, sceneInitialized = false;
    bool atlasFinalized = false;
    int packedPageSize = 0;
    OpenGLTexture* white = nullptr;
    OpenGLTexture* scene = nullptr;
    OpenGLTexture* selected = nullptr;
    OpenGLTexture* causticSource = nullptr;
    unsigned int causticCounter = 0;
    bool causticsQueued = false;
    OpenGLTexture* causticTarget = nullptr;
    VulkanHdrParams hdr{80, 1000, 150, 1};
    std::array<OpenGLTexture*, 4096> slots{};
    std::unordered_map<OpenGLTexture*, std::unique_ptr<OpenGLTexture>> textures;
    std::vector<Page> pages;
    std::vector<Vertex> vertices;
    std::vector<Batch> batches;
    std::shared_ptr<OpenGLStorage> preferredAtlas;
    Impl(OpenGLContext& context, int width, int height);
    ~Impl();
    void Dimensions(int width, int height) const;
    std::shared_ptr<OpenGLStorage> Storage(int width, int height, unsigned int format);
    OpenGLTexture* Allocate(int width, int height, unsigned int format, bool atlas, bool registerSlot);
    void Register(OpenGLTexture* texture);
    void RememberAtlasCopy(OpenGLTexture* texture,const std::shared_ptr<OpenGLStorage>& storage,int x,int y);
    void ForgetAtlasCopies(OpenGLTexture* texture);
    bool Place(Page& page, int width, int height, int& x, int& y);
    void CollectImmutable(OpenGLTexture* texture);
    void Upload(OpenGLTexture* texture, const void* data, int pitch, unsigned int format);
    void BindTarget();
    void Flush();
    void Submit(std::span<const GpuVertex> input, OpenGLTexture* source,
        GpuBlend blend, const GpuClip* clip, bool coverage);
    unsigned int Program(std::string_view vertex, std::string_view fragment);
    void ImagePass(OpenGLTexture* target, OpenGLTexture* source, OpenGLTexture* alpha,
        int operation, const GpuImageProcessing* processing = nullptr,
        int columns = 1, int rows = 1, unsigned int color = 0, bool colorOnly = false);
    void Quad();
    bool Present();
    std::shared_ptr<OpenGLStorage> Snapshot(OpenGLTexture* texture);
    void Check([[maybe_unused]] const char* operation) const
    {
#if !defined(NDEBUG)
        GL3::CheckError(operation);
#endif
    }
};
}
