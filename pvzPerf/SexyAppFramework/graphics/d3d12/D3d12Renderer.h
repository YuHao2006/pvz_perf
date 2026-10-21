#pragma once

#include "SexyAppFramework/graphics/GpuTypes.h"
#include "SexyAppFramework/graphics/ImageReadback.h"
#include "SexyAppFramework/graphics/vulkan/VulkanHdr.h"
#include <cstddef>
#include <cstdint>
#include <filesystem>
#include <memory>
#include <span>
#include <vector>

namespace Sexy {
class D3d12Context;
struct D3d12Texture;
struct D3d12ScaleImage;
struct D3d12ScaleStep;
using GpuHdrParams = VulkanHdrParams;

// Standalone renderer. All calls and member reads are serialized on the render thread.
// One logical image occupies one native texture, including NPOT images.
class D3d12Renderer final {
    struct Impl;
    std::unique_ptr<Impl> impl_;
public:
    D3d12Renderer(D3d12Context& context, int sceneWidth, int sceneHeight,
        const std::filesystem::path& shaderDirectory, const GpuHdrParams* hdr = nullptr);
    ~D3d12Renderer();
    D3d12Renderer(const D3d12Renderer&) = delete;
    D3d12Renderer& operator=(const D3d12Renderer&) = delete;

    // Render-thread loading action, before image composition or font rendering.
    // Prepares fixed compute pipelines without images or command submission.
    // Idempotent after success; business calls require the prepared pipelines.
    void PrepareLoadingPipelines();

    // Native BGRA bytes (0xAARRGGBB); pitch includes source row padding.
    // Copies the source before returning. Opaque is draw metadata only.
    D3d12Texture* CreateTexture(int width, int height, const void* bgra,
        int rowPitch, bool opaque = false);
    // Raw composition scratch survives the current batch; adopt the final
    // result before submission to retain it as a drawable texture.
    D3d12Texture* CreateRawTexture(int width, int height, const void* bgra, int rowPitch);
    D3d12Texture* ReplaceTexture(D3d12Texture* previous, int width, int height,
        const void* bgra, int rowPitch, bool opaque = false);
    // Immutable static images occupy only staticBase + staticSlot. Migration
    // releases the former dynamic slot; recorded mutable versions retire at
    // the fence before their replacement returns to its static index.
    D3d12Texture* CreateTextureStatic(int width, int height, const void* bgra,
        int rowPitch, bool opaque, uint32_t staticSlot);
    // count is the highest static symbol (0 is the reserved sentinel).
    void ReserveStaticTextureSlots(uint32_t count);
    void BindStaticTexture(D3d12Texture* texture, uint32_t staticSlot);
    D3d12Texture* CreateCoverageMask(int width, int height,
        std::span<const uint8_t> coverage, int rowPitch);

    // GPU-cleared RGBA32F, with premultiplied storage. The handle stays stable
    // when a write snapshots pixels previously sampled in the current frame.
    D3d12Texture* CreateRenderImage(int width, int height);
    void SetRenderImage(D3d12Texture* image);
    D3d12Texture* CopyTextureRegion(D3d12Texture* source,
        int x, int y, int width, int height);
    D3d12Texture* ProcessImage(D3d12Texture* source, const GpuImageProcessing& processing);
    D3d12Texture* ComposeAlphaRaw(D3d12Texture* base, D3d12Texture* alpha,
        int columns, int rows, uint32_t color, bool colorOnly);
    D3d12Texture* AdoptComposedTexture(D3d12Texture* composed);
    D3d12Texture* ComposeAlpha(D3d12Texture* base, D3d12Texture* alpha,
        int columns, int rows, uint32_t color, bool colorOnly);
    void RenderFontAtlas(D3d12Texture* target, D3d12Texture* source,
        std::span<const GpuFontGlyph> glyphs, uint32_t samplingFlags, bool forceWhite);

    void DestroyTexture(D3d12Texture* texture);
    D3d12Texture* const& whiteTexture;
    // Low 12 bits are the heap index; flags match GpuVertex's Vulkan contract.
    static uint32_t SlotOf(const D3d12Texture* texture);

    D3d12Texture* CreateCausticsTexture(int width, int height, D3d12Texture* source);
    void UseCausticsTexture(D3d12Texture* output, D3d12Texture* source);
    void SetCausticsFrame(uint32_t counter);
    D3d12Texture* const& causticsTexture;
    bool HasCausticsCompute() const;

    // Selecting an image permits a batch while the window is suspended.
    bool BeginScene();
    const bool& sceneOpen;
    void SubmitTriangles(std::span<const GpuVertex> vertices, D3d12Texture* texture,
        bool linear, bool wrap, GpuBlend blend, const GpuClip* clip = nullptr);
    void SubmitCoverageTriangles(std::span<const GpuVertex> vertices,
        D3d12Texture* mask, GpuBlend blend, const GpuClip* clip = nullptr);
    // Main scenes queue presentation asynchronously. The next recording waits
    // their fence before reusing mapped pages, descriptors, or retired images.
    // Image-only scenes remain synchronous.
    void EndSceneAndPresent();
    bool PresentRetainedScene();
    bool ResizePresent();
    void ResizeScene(int width, int height);
    void SetHdrParams(const GpuHdrParams& params);
    GpuHdrParams HdrParams() const;
    // Effect descriptors must remain alive at stable addresses. Prepare and
    // warm each mode before activation; both modes remain resident.
    void PrepareScale(bool fullscreen, std::span<const D3d12ScaleStep> steps,
        uint32_t targetWidth, uint32_t targetHeight);
    void WarmScale(bool fullscreen);
    void SetScaleMode(bool enabled, bool fullscreen);
    D3d12ScaleImage ScaleOutput(bool fullscreen) const;
    struct ScaleCounts { size_t programs, lookups, writableImages; };
    ScaleCounts GetScaleCounts() const;
    GpuClip PresentRect(int framebufferWidth, int framebufferHeight) const;

    // Explicit export/diagnostics only; normal rendering stays entirely on GPU.
    std::vector<uint32_t> ReadScenePixels();
    ImagePixels ReadTexturePixels(D3d12Texture* texture);
    std::vector<uint32_t> ReadScalePixels(bool fullscreen);
    const int& sceneWidth;
    const int& sceneHeight;
    uint32_t MaxImageDimension2D() const;

    struct ResourceCounts {
        size_t textures, retiredTextures, descriptorPools, vertexBuffers;
    };
    ResourceCounts GetResourceCounts() const;
};
}
