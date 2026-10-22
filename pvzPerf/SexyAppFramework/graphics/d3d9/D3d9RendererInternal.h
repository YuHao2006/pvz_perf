#pragma once
#include "D3d9Renderer.h"
#include "D3d9Api.h"
#include "D3d9Shaders.h"
#include <array>
#include <unordered_map>

namespace Sexy {
struct D3d9Storage {
    DX9::Com<IDirect3DTexture9> image;
    DX9::Com<IDirect3DSurface9> surface;
    int width = 0, height = 0;
    D3DFORMAT format = D3DFMT_UNKNOWN;
};
struct D3d9Texture {
    std::shared_ptr<D3d9Storage> storage;
    int width = 0, height = 0;
    unsigned int slot = ~0U, staticSlot = ~0U, flags = 0;
    bool render = false, caustic = false;
};
struct D3d9Renderer::Impl {
    using Vertex = D3d9Shaders::Vertex;
    static_assert(sizeof(Vertex) == 52 && offsetof(Vertex, rect) == 32 && offsetof(Vertex, flags) == 48);
    using Constants = std::array<D3d9Shaders::Float4, D3d9Shaders::PixelConstantCount>;
    struct Batch {
        std::shared_ptr<D3d9Storage> storage;
        size_t first = 0, count = 0;
        GpuBlend blend{};
        GpuClip clip{};
        bool coverage = false;
    };
    D3d9Context& context;
    IDirect3DDevice9Ex* device;
    int width, height, maximum = 0;
    unsigned int staticBase = 4096;
    size_t streamCapacity = 0;
    unsigned long long fontInstructionsPerTap = 0;
    std::filesystem::path shaderDirectory;
    DX9::Com<IDirect3DVertexDeclaration9> declaration;
    DX9::Com<IDirect3DVertexBuffer9> stream;
    DX9::Com<IDirect3DVertexShader9> sceneVS, imageVS;
    DX9::Com<IDirect3DPixelShader9> scenePS, copyPS, colorizePS, composePS, causticsPS, fontPS, presentPS;
    bool open = false, mainFrame = false, initialized = false, sceneInitialized = false;
    D3d9Texture* white = nullptr;
    D3d9Texture* scene = nullptr;
    D3d9Texture* selected = nullptr;
    D3d9Texture* causticSource = nullptr;
    unsigned int causticCounter = 0;
    bool causticsQueued = false;
    D3d9Texture* causticTarget = nullptr;
    VulkanHdrParams hdr{80, 1000, 150, 1};
    std::array<D3d9Texture*, 4096> slots{};
    std::unordered_map<D3d9Texture*, std::unique_ptr<D3d9Texture>> textures;
    std::vector<Vertex> vertices;
    std::vector<Batch> batches;
    Impl(D3d9Context&, int, int, const std::filesystem::path&);
    ~Impl();
    void Dimensions(int, int) const;
    std::shared_ptr<D3d9Storage> Storage(int, int, D3DFORMAT);
    D3d9Texture* Allocate(int, int, D3DFORMAT, bool registerSlot);
    void Register(D3d9Texture*);
    void Upload(D3d9Texture*, const void*, int);
    void BindTarget();
    void Target(IDirect3DSurface9*, int, int);
    void InitializeStates();
    void Flush();
    void Submit(std::span<const GpuVertex>, D3d9Texture*, GpuBlend, const GpuClip*, bool);
    void Source(Constants&, const D3d9Texture*, unsigned int sampler = 0) const;
    void SetConstants(const Constants&);
    void Projection(int, int);
    void Quad(int, int);
    void ImagePass(D3d9Texture*, D3d9Texture*, D3d9Texture*, int,
        const GpuImageProcessing* = nullptr, int = 1, int = 1, unsigned int = 0, bool = false);
    std::shared_ptr<D3d9Storage> Snapshot(D3d9Texture*);
    bool Present();
};
}
