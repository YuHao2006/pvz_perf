#pragma once
#include "graphics/GpuTypes.h"
#include "graphics/ImageReadback.h"
#include "graphics/vulkan/VulkanHdr.h"
#include "D3d9ScaleTypes.h"
#include <cstddef>
#include <filesystem>
#include <memory>
#include <span>
#include <vector>
namespace Sexy {
class D3d9Context;
struct D3d9Texture;
class D3d9Renderer final {
    struct Impl;
    std::unique_ptr<Impl> impl_;
public:
    D3d9Renderer(D3d9Context&, int width, int height,
        const std::filesystem::path& shaderDirectory, const VulkanHdrParams* hdr = nullptr);
    ~D3d9Renderer();
    D3d9Renderer(const D3d9Renderer&) = delete;
    D3d9Renderer& operator=(const D3d9Renderer&) = delete;
    void PrepareLoadingPipelines();
    D3d9Texture* CreateTexture(int, int, const void*, int, bool opaque = false);
    D3d9Texture* CreateTextureStatic(int, int, const void*, int, bool, unsigned int);
    D3d9Texture* CreateRawTexture(int, int, const void*, int);
    D3d9Texture* ReplaceTexture(D3d9Texture*, int, int, const void*, int, bool opaque = false);
    void ReserveStaticTextureSlots(unsigned int);
    void BindStaticTexture(D3d9Texture*, unsigned int);
    D3d9Texture* CreateCoverageMask(int, int, std::span<const unsigned char>, int);
    D3d9Texture* CreateRenderImage(int, int);
    void SetRenderImage(D3d9Texture*);
    D3d9Texture* CopyTextureRegion(D3d9Texture*, int, int, int, int);
    D3d9Texture* ProcessImage(D3d9Texture*, const GpuImageProcessing&);
    D3d9Texture* ComposeAlphaRaw(D3d9Texture*, D3d9Texture*, unsigned int, bool);
    D3d9Texture* AdoptComposedTexture(D3d9Texture*);
    D3d9Texture* ComposeAlpha(D3d9Texture*, D3d9Texture*, unsigned int, bool);
    void RenderFontAtlas(D3d9Texture*, D3d9Texture*, std::span<const GpuFontGlyph>,
        unsigned int samplingFlags, bool forceWhite);
    void DestroyTexture(D3d9Texture*);
    D3d9Texture* const& whiteTexture;
    static unsigned int SlotOf(const D3d9Texture*);
    D3d9Texture* CreateCausticsTexture(int, int, D3d9Texture*);
    void UseCausticsTexture(D3d9Texture*, D3d9Texture*);
    void SetCausticsFrame(unsigned int);
    D3d9Texture* const& causticsTexture;
    bool HasCausticsCompute() const;
    bool BeginScene();
    const bool& sceneOpen;
    void SubmitTriangles(std::span<const GpuVertex>, D3d9Texture*, bool, bool,
        GpuBlend, const GpuClip* clip = nullptr);
    void SubmitCoverageTriangles(std::span<const GpuVertex>, D3d9Texture*,
        GpuBlend, const GpuClip* clip = nullptr);
    void EndSceneAndPresent();
    bool PresentRetainedScene();
    bool ResizePresent();
    void ResizeScene(int width, int height);
    void SetHdrParams(const VulkanHdrParams&);
    VulkanHdrParams HdrParams() const;
    void PrepareScale(bool, std::span<const D3d9ScaleStep>, unsigned int, unsigned int);
    void WarmScale(bool);
    void SetScaleMode(bool, bool);
    D3d9ScaleImage ScaleOutput(bool) const;
    struct ScaleCounts { size_t programs, lookups, writableImages; };
    ScaleCounts GetScaleCounts() const;
    GpuClip PresentRect(int, int) const;
    std::vector<unsigned int> ReadScenePixels();
    ImagePixels ReadTexturePixels(D3d9Texture*);
    std::vector<float> ReadTextureFloats(D3d9Texture*);
    std::vector<unsigned int> ReadScalePixels(bool);
    const int& sceneWidth;
    const int& sceneHeight;
    unsigned int MaxImageDimension2D() const;
    struct ResourceCounts {
        size_t textures, retiredTextures, descriptorPools, vertexBuffers;
        size_t queuedBatches{};
    };
    ResourceCounts GetResourceCounts() const;
};
}
