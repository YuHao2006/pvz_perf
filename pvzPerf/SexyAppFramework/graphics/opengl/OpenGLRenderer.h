#pragma once
#include "graphics/GpuTypes.h"
#include "graphics/GpuPool.h"
#include "graphics/ImageReadback.h"
#include "graphics/vulkan/VulkanHdr.h"
#include "OpenGLScaleTypes.h"
#include <cstddef>
#include <filesystem>
#include <memory>
#include <span>
#include <vector>

namespace Sexy {
class OpenGLContext;
struct OpenGLTexture;
class OpenGLRenderer final {
    struct Impl;
    std::unique_ptr<Impl> impl_;
public:
    OpenGLRenderer(OpenGLContext& context, int width, int height,
        const std::filesystem::path& shaderDirectory, const VulkanHdrParams* hdr = nullptr);
    ~OpenGLRenderer();
    OpenGLRenderer(const OpenGLRenderer&) = delete;
    OpenGLRenderer& operator=(const OpenGLRenderer&) = delete;
    void PrepareLoadingPipelines();
    OpenGLTexture* CreateTexture(int width, int height, const void* bgra, int pitch, bool opaque = false);
    OpenGLTexture* CreateTextureStatic(int width, int height, const void* bgra,
        int pitch, bool opaque, unsigned int slot);
    OpenGLTexture* CreateRawTexture(int width, int height, const void* bgra, int pitch);
    OpenGLTexture* ReplaceTexture(OpenGLTexture* previous, int width, int height,
        const void* bgra, int pitch, bool opaque = false);
    void ReserveStaticTextureSlots(unsigned int count);
    void BindStaticTexture(OpenGLTexture* texture, unsigned int slot);
    OpenGLTexture* CreateCoverageMask(int width, int height,
        std::span<const unsigned char> coverage, int pitch);
    OpenGLTexture* CreateRenderImage(int width, int height);
    void SetRenderImage(OpenGLTexture* texture);
    OpenGLTexture* CopyTextureRegion(OpenGLTexture* source, int x, int y, int width, int height);
    OpenGLTexture* ProcessImage(OpenGLTexture* source, const GpuImageProcessing& processing);
    OpenGLTexture* ComposeAlphaRaw(OpenGLTexture* base, OpenGLTexture* alpha,
        unsigned int color, bool colorOnly);
    OpenGLTexture* AdoptComposedTexture(OpenGLTexture* texture);
    OpenGLTexture* ComposeAlpha(OpenGLTexture* base, OpenGLTexture* alpha,
        unsigned int color, bool colorOnly);
    void RenderFontAtlas(OpenGLTexture* target, OpenGLTexture* source,
        std::span<const GpuFontGlyph> glyphs, unsigned int samplingFlags, bool forceWhite);
    void DestroyTexture(OpenGLTexture* texture);
    OpenGLTexture* const& whiteTexture;
    static unsigned int SlotOf(const OpenGLTexture* texture);
    OpenGLTexture* CreateCausticsTexture(int width, int height, OpenGLTexture* source);
    void UseCausticsTexture(OpenGLTexture* output, OpenGLTexture* source);
    void SetCausticsFrame(unsigned int counter);
    OpenGLTexture* const& causticsTexture;
    bool HasCausticsCompute() const;
    bool BeginScene();
    const bool& sceneOpen;
    void SubmitTriangles(std::span<const GpuVertex> vertices, OpenGLTexture* texture,
        bool linear, bool wrap, GpuBlend blend, const GpuClip* clip = nullptr);
    void SubmitQuads(std::span<const GpuVertex> vertices, OpenGLTexture* texture,
        bool linear, bool wrap, GpuBlend blend, const GpuClip* clip = nullptr);
    void SubmitPool(OpenGLTexture* texture, const GpuPoolParams& params);
    void SubmitCoverageTriangles(std::span<const GpuVertex> vertices, OpenGLTexture* texture,
        GpuBlend blend, const GpuClip* clip = nullptr);
    void EndSceneAndPresent();
    bool PresentRetainedScene();
    bool ResizePresent();
    void ResizeScene(int width, int height);
    void SetHdrParams(const VulkanHdrParams& params);
    VulkanHdrParams HdrParams() const;
    void PrepareScale(bool fullscreen, std::span<const OpenGLScaleStep> steps,
        unsigned int width, unsigned int height);
    void WarmScale(bool fullscreen);
    void SetScaleMode(bool enabled, bool fullscreen);
    OpenGLScaleImage ScaleOutput(bool fullscreen) const;
    struct ScaleCounts { size_t programs, lookups, writableImages; };
    ScaleCounts GetScaleCounts() const;
    GpuClip PresentRect(int width, int height) const;
    std::vector<unsigned int> ReadScenePixels();
    ImagePixels ReadTexturePixels(OpenGLTexture* texture);
    std::vector<float> ReadTextureFloats(OpenGLTexture* texture);
    std::vector<unsigned int> ReadScalePixels(bool fullscreen);
    const int& sceneWidth;
    const int& sceneHeight;
    unsigned int MaxImageDimension2D() const;
    struct ResourceCounts {
        size_t textures,retiredTextures,descriptorPools,vertexBuffers;
        size_t queuedBatches{};
    };
    ResourceCounts GetResourceCounts() const;
};
}
