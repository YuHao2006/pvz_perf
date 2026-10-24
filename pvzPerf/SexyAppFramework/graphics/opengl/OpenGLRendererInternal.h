#pragma once
#include "OpenGLRenderer.h"
#include "OpenGLContext.h"
#include "OpenGLApi.h"
#include <array>
#include <memory>
#include <string_view>
#include <unordered_set>
#include <vector>

namespace Sexy {
struct OpenGLTexture {
    unsigned int image = 0, framebuffer = 0;
    int width = 0, height = 0;
    unsigned int format = 0;
    unsigned int slot = ~0U, staticSlot = ~0U, flags = 0;
    bool render = false, caustic = false;
    OpenGLTexture() = default;
    ~OpenGLTexture();
    OpenGLTexture(const OpenGLTexture&) = delete;
    OpenGLTexture& operator=(const OpenGLTexture&) = delete;
};
#if defined(PVZ_OPENGL_REANIM_RESIDENT)
struct OpenGLReanim {
    unsigned int firstTexel = 0, texelCount = 0;
    unsigned int imageSlotCount = 0, variantCount = 0;
    std::vector<GpuReanimTrack> trackInfo;
};
#endif
struct OpenGLRenderer::Impl {
    enum Uniform : unsigned int {
        uTargetExtent, uImage, uPremultipliedOutput, uCoverageInput,
        uSourceImage, uAlphaImage, uSourceRect, uAlphaRect, uSourceSlot,
        uOperation, uRectangle, uTint, uPackedColor, uCounter, uColorOnly,
        uSamplingFlags, uForceWhite, uXRanges, uYRanges, uXTaps, uYTaps,
        uXTapExtent, uYTapExtent, uGlyphSrc, uGlyphDst, uUniformCount
    };
    using UniformLocations=std::array<int,uUniformCount>;
    struct Vertex {
        GpuVertex draw;
    };
    struct Batch {
        unsigned int image;
        size_t first, count;
        GpuBlend blend;
        GpuClip clip;
        bool coverage;
#if defined(PVZ_OPENGL_REANIM_RESIDENT)
        size_t segmentFirst = 0, segmentCount = 0;
#endif
    };
    OpenGLContext& context;
    int width, height, maximum = 0;
    unsigned int staticBase = 4096, vao = 0, stream = 0;
    unsigned int sceneProgram = 0, imageProgram = 0, fontProgram = 0, presentProgram = 0;
    unsigned int poolProgram = 0, poolVao = 0, poolVertices = 0, poolIndices = 0;
    std::array<int, 12> poolUniforms{};
    uint32_t reanimPictureCandidates = 0;
    bool reanimFrameEligible = false;
#if defined(PVZ_OPENGL_REANIM_RESIDENT)
    unsigned int reanimProgram = 0, reanimVao = 0, reanimIndexBuffer = 0;
    unsigned int reanimBlob = 0, reanimBlobTexture = 0, reanimInstanceBuffer = 0, reanimInstanceTexture = 0;
    size_t reanimBlobUsed = 0, reanimBlobCapacity = 0, reanimBlobMaximum = 0;
    struct ReanimRange { size_t first, count; };
    struct ReanimDrawSegment { size_t first, count; bool resident; };
    std::vector<ReanimRange> reanimFreeRanges;
    std::vector<ReanimDrawSegment> reanimDrawSegments;
    using TexBufferFn = void(APIENTRY*)(GLenum, GLenum, GLuint);
    using CopyBufferFn = void(APIENTRY*)(GLenum, GLenum, GLintptr, GLintptr, GLsizeiptr);
    TexBufferFn texBuffer = nullptr;
    CopyBufferFn copyBuffer = nullptr;
#if defined(PVZ_OPENGL_REANIM_DIAGNOSTICS)
    using BeginQueryFn = void(APIENTRY*)(GLenum, GLuint);
    using EndQueryFn = void(APIENTRY*)(GLenum);
    using QueryCounterFn = void(APIENTRY*)(GLuint, GLenum);
    BeginQueryFn beginFrameQuery = nullptr;
    EndQueryFn endFrameQuery = nullptr;
    QueryCounterFn queryCounter = nullptr;
    FrameTiming* frameTiming = nullptr;
#endif
    std::array<int, 6> reanimUniforms{};
    bool reanimChecked = false;
    std::unordered_set<OpenGLReanim*> reanimDefinitions;
    std::vector<OpenGLReanim*> retiredReanims;
    struct ReanimInstanceState {
        OpenGLReanim* definition;
        OpenGLTexture* texture;
        unsigned int image;
        GpuClip clip;
    };
    std::vector<ReanimInstanceState> reanimInstances;
    std::vector<std::array<float,24>> reanimInstanceData;
    std::vector<unsigned int> reanimIndices;
    std::vector<size_t> reanimMarkerOffsets;
    std::vector<ReanimRange> reanimOrdinarySpans;
    bool hasReanimDraws = false;
    unsigned int reanimFrameGeneration = 0;
    uint64_t reanimOrdinaryTriangles = 0;
#endif
    UniformLocations sceneUniforms{}, imageUniforms{}, fontUniforms{}, presentUniforms{};
    bool open = false, mainFrame = false, initialized = false, sceneInitialized = false;
    OpenGLTexture* white = nullptr;
    OpenGLTexture* scene = nullptr;
    OpenGLTexture* selected = nullptr;
    OpenGLTexture* causticSource = nullptr;
    unsigned int causticCounter = 0;
    bool causticsQueued = false;
    OpenGLTexture* causticTarget = nullptr;
    VulkanHdrParams hdr{80, 1000, 150, 1};
    std::array<OpenGLTexture*, 4096> slots{};
    std::unordered_set<OpenGLTexture*> textures;
    // Native names in queued batches remain valid through Flush, even if their
    // public texture was replaced/destroyed. No per-triangle reference counting.
    std::vector<OpenGLTexture*> retired;
    std::vector<Vertex> vertices;
    std::vector<Batch> batches;
    Impl(OpenGLContext& context, int width, int height);
    ~Impl();
    void Dimensions(int width, int height) const;
    void AllocateStorage(OpenGLTexture& texture, int width, int height, unsigned int format);
    OpenGLTexture* Allocate(int width, int height, unsigned int format, bool registerSlot);
    void Register(OpenGLTexture* texture);
    void Upload(OpenGLTexture* texture, const void* data, int pitch, unsigned int format);
    void BindTarget();
    void Flush();
#if defined(PVZ_OPENGL_REANIM_RESIDENT)
    bool InitReanim();
    size_t AllocateReanimRange(size_t count);
    void CollectReanims();
#endif
    void Submit(std::span<const GpuVertex> input, OpenGLTexture* source,
        GpuBlend blend, const GpuClip* clip, bool coverage);
    unsigned int Program(std::string_view vertex, std::string_view fragment);
    void ImagePass(OpenGLTexture* target, OpenGLTexture* source, OpenGLTexture* alpha,
        int operation, const GpuImageProcessing* processing = nullptr,
        unsigned int color = 0, bool colorOnly = false);
    void Quad();
    bool Present();
    void Snapshot(const OpenGLTexture& source, OpenGLTexture& copy);
    void Check([[maybe_unused]] const char* operation) const
    {
#if !defined(NDEBUG)
        GL3::CheckError(operation);
#endif
    }
};
}
