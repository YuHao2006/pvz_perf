#ifndef NOMINMAX
#define NOMINMAX
#endif
#include "D3d12ScalePipeline.h"
#include "D3d12ScaleDds.h"
#include "D3d12Check.h"
#include <d3d12.h>
#include <wrl/client.h>
#include <algorithm>
#include <array>
#include <cstring>
#include <fstream>
#include <limits>
#include <map>
#include <set>
#include <stdexcept>

namespace Sexy {
namespace {
using Microsoft::WRL::ComPtr;
constexpr auto ReadState = D3D12_RESOURCE_STATE_NON_PIXEL_SHADER_RESOURCE |
    D3D12_RESOURCE_STATE_PIXEL_SHADER_RESOURCE;

DXGI_FORMAT NativeFormat(uint32_t format) {
    // Runtime metadata keeps the existing VkFormat numeric protocol.
    switch (format) {
    case 109: return DXGI_FORMAT_R32G32B32A32_FLOAT;
    case 97: return DXGI_FORMAT_R16G16B16A16_FLOAT;
    case 91: return DXGI_FORMAT_R16G16B16A16_UNORM;
    case 92: return DXGI_FORMAT_R16G16B16A16_SNORM;
    case 103: return DXGI_FORMAT_R32G32_FLOAT;
    case 64: return DXGI_FORMAT_R10G10B10A2_UNORM;
    case 122: return DXGI_FORMAT_R11G11B10_FLOAT;
    case 37: return DXGI_FORMAT_R8G8B8A8_UNORM;
    case 38: return DXGI_FORMAT_R8G8B8A8_SNORM;
    case 83: return DXGI_FORMAT_R16G16_FLOAT;
    case 77: return DXGI_FORMAT_R16G16_UNORM;
    case 78: return DXGI_FORMAT_R16G16_SNORM;
    case 100: return DXGI_FORMAT_R32_FLOAT;
    case 16: return DXGI_FORMAT_R8G8_UNORM;
    case 17: return DXGI_FORMAT_R8G8_SNORM;
    case 76: return DXGI_FORMAT_R16_FLOAT;
    case 70: return DXGI_FORMAT_R16_UNORM;
    case 71: return DXGI_FORMAT_R16_SNORM;
    case 9: return DXGI_FORMAT_R8_UNORM;
    case 10: return DXGI_FORMAT_R8_SNORM;
    default: throw std::runtime_error("Unsupported scale metadata format " + std::to_string(format));
    }
}
D3D12_SAMPLER_DESC NativeSampler(const ScaleRuntimeSampler& sampler) {
    D3D12_SAMPLER_DESC result{};
    switch (uint32_t(sampler.mFilter)) {
    case 0: result.Filter = D3D12_FILTER_MIN_MAG_MIP_POINT; break;
    case 1: result.Filter = D3D12_FILTER_MIN_MAG_LINEAR_MIP_POINT; break;
    default: throw std::runtime_error("Unsupported scale sampler filter");
    }
    switch (uint32_t(sampler.mAddress)) {
    case 0: result.AddressU = D3D12_TEXTURE_ADDRESS_MODE_WRAP; break;
    case 1: result.AddressU = D3D12_TEXTURE_ADDRESS_MODE_MIRROR; break;
    case 2: result.AddressU = D3D12_TEXTURE_ADDRESS_MODE_CLAMP; break;
    case 3: result.AddressU = D3D12_TEXTURE_ADDRESS_MODE_BORDER; break;
    default: throw std::runtime_error("Unsupported scale sampler address mode");
    }
    result.AddressV = result.AddressW = result.AddressU;
    result.MaxAnisotropy = 1;
    result.ComparisonFunc = D3D12_COMPARISON_FUNC_NEVER;
    result.MinLOD = result.MaxLOD = 0;
    return result;
}
void RequireFormat(ID3D12Device* device, DXGI_FORMAT format, bool writable) {
    D3D12_FEATURE_DATA_FORMAT_SUPPORT support{format};
    D3d12Check(device->CheckFeatureSupport(D3D12_FEATURE_FORMAT_SUPPORT, &support, sizeof(support)),
        "Query scale format support");
    auto flags = D3D12_FORMAT_SUPPORT1_TEXTURE2D | D3D12_FORMAT_SUPPORT1_SHADER_LOAD |
        D3D12_FORMAT_SUPPORT1_SHADER_SAMPLE;
    if (writable) flags |= D3D12_FORMAT_SUPPORT1_TYPED_UNORDERED_ACCESS_VIEW;
    if ((support.Support1 & flags) != flags ||
        (writable && !(support.Support2 & D3D12_FORMAT_SUPPORT2_UAV_TYPED_STORE)))
        throw std::runtime_error("D3D12 device does not support scale texture format/features " +
            std::to_string(uint32_t(format)));
}
ComPtr<ID3D12Resource> CreateBuffer(ID3D12Device* device, uint64_t size) {
    D3D12_HEAP_PROPERTIES heap{};
    heap.Type = D3D12_HEAP_TYPE_UPLOAD;
    D3D12_RESOURCE_DESC desc{};
    desc.Dimension = D3D12_RESOURCE_DIMENSION_BUFFER;
    desc.Width = size; desc.Height = 1; desc.DepthOrArraySize = desc.MipLevels = 1;
    desc.SampleDesc.Count = 1;
    desc.Layout = D3D12_TEXTURE_LAYOUT_ROW_MAJOR;
    ComPtr<ID3D12Resource> result;
    D3d12Check(device->CreateCommittedResource(&heap, D3D12_HEAP_FLAG_NONE, &desc,
        D3D12_RESOURCE_STATE_GENERIC_READ, nullptr, IID_PPV_ARGS(&result)), "Create scale upload buffer");
    return result;
}
void* MapWrite(ID3D12Resource* buffer) {
    void* mapped = nullptr;
    const D3D12_RANGE read{0, 0};
    D3d12Check(buffer->Map(0, &read, &mapped), "Map scale upload buffer");
    return mapped;
}
struct Image {
    D3d12ScaleImage native{};
    ComPtr<ID3D12Resource> owned;
    uint32_t state = D3D12_RESOURCE_STATE_COMMON;
    // Retained for the library lifetime, including after upload submission.
    ComPtr<ID3D12Resource> staging;
    D3D12_PLACED_SUBRESOURCE_FOOTPRINT footprint{};
    bool uploaded = true;
};
std::unique_ptr<Image> CreateImage(ID3D12Device* device, uint32_t width, uint32_t height,
    DXGI_FORMAT format, bool writable) {
    if (!width || !height || width > D3D12_REQ_TEXTURE2D_U_OR_V_DIMENSION ||
        height > D3D12_REQ_TEXTURE2D_U_OR_V_DIMENSION)
        throw std::runtime_error("Scale image dimensions exceed D3D12 limits");
    RequireFormat(device, format, writable);
    auto image = std::make_unique<Image>();
    D3D12_HEAP_PROPERTIES heap{};
    heap.Type = D3D12_HEAP_TYPE_DEFAULT;
    D3D12_RESOURCE_DESC desc{};
    desc.Dimension = D3D12_RESOURCE_DIMENSION_TEXTURE2D;
    desc.Width = width; desc.Height = height; desc.DepthOrArraySize = desc.MipLevels = 1;
    desc.Format = format; desc.SampleDesc.Count = 1;
    desc.Flags = writable ? D3D12_RESOURCE_FLAG_ALLOW_UNORDERED_ACCESS : D3D12_RESOURCE_FLAG_NONE;
    image->state = writable ? D3D12_RESOURCE_STATE_COMMON : D3D12_RESOURCE_STATE_COPY_DEST;
    D3d12Check(device->CreateCommittedResource(&heap, D3D12_HEAP_FLAG_NONE, &desc,
        D3D12_RESOURCE_STATES(image->state), nullptr, IID_PPV_ARGS(&image->owned)), "Create scale texture");
    image->native = {image->owned.Get(), uint32_t(format), width, height};
    return image;
}
void Transition(ID3D12GraphicsCommandList* cmd, Image& image, D3D12_RESOURCE_STATES state) {
    D3D12_RESOURCE_BARRIER barrier{};
    if (image.state == state) {
        if (state != D3D12_RESOURCE_STATE_UNORDERED_ACCESS) return;
        barrier.Type = D3D12_RESOURCE_BARRIER_TYPE_UAV;
        barrier.UAV.pResource = image.native.resource;
    } else {
        barrier.Type = D3D12_RESOURCE_BARRIER_TYPE_TRANSITION;
        barrier.Transition = {image.native.resource, D3D12_RESOURCE_BARRIER_ALL_SUBRESOURCES,
            D3D12_RESOURCE_STATES(image.state), state};
    }
    cmd->ResourceBarrier(1, &barrier);
    image.state = state;
}
std::unique_ptr<Image> LoadLookup(ID3D12Device* device, const std::filesystem::path& path) {
    std::ifstream stream(path, std::ios::binary | std::ios::ate);
    if (!stream) throw std::runtime_error("Cannot read scale DDS: " + path.string());
    const auto length = stream.tellg();
    if (length < 0 || uint64_t(length) > std::numeric_limits<size_t>::max() ||
        uint64_t(length) > uint64_t(std::numeric_limits<std::streamsize>::max()))
        throw std::runtime_error("Invalid scale DDS file size: " + path.string());
    std::vector<std::byte> file(static_cast<size_t>(length));
    stream.seekg(0);
    if (!stream.read(reinterpret_cast<char*>(file.data()), std::streamsize(length)))
        throw std::runtime_error("Incomplete scale DDS read: " + path.string());
    const auto dds = ParseD3d12ScaleDds(file);
    auto image = CreateImage(device, dds.width, dds.height, DXGI_FORMAT(dds.format), false);
    const auto desc = image->native.resource->GetDesc();
    UINT rows = 0;
    UINT64 rowBytes = 0, total = 0;
    device->GetCopyableFootprints(&desc, 0, 1, 0, &image->footprint, &rows, &rowBytes, &total);
    if (rows != dds.height || rowBytes != dds.rowPitch || total == UINT64_MAX ||
        total > std::numeric_limits<size_t>::max())
        throw std::runtime_error("Invalid scale DDS copy footprint");
    image->staging = CreateBuffer(device, total);
    auto* mapped = static_cast<std::byte*>(MapWrite(image->staging.Get()));
    std::memset(mapped, 0, size_t(total));
    for (size_t row = 0; row < rows; ++row)
        std::memcpy(mapped + image->footprint.Offset + row * image->footprint.Footprint.RowPitch,
            file.data() + dds.pixelOffset + row * dds.rowPitch, dds.rowPitch);
    const D3D12_RANGE written{0, size_t(total)};
    image->staging->Unmap(0, &written);
    image->uploaded = false;
    return image;
}
void Upload(ID3D12GraphicsCommandList* cmd, Image& image) {
    if (image.uploaded) return;
    D3D12_TEXTURE_COPY_LOCATION source{};
    source.pResource = image.staging.Get();
    source.Type = D3D12_TEXTURE_COPY_TYPE_PLACED_FOOTPRINT;
    source.PlacedFootprint = image.footprint;
    D3D12_TEXTURE_COPY_LOCATION dest{};
    dest.pResource = image.native.resource;
    dest.Type = D3D12_TEXTURE_COPY_TYPE_SUBRESOURCE_INDEX;
    cmd->CopyTextureRegion(&dest, 0, 0, 0, &source, nullptr);
    Transition(cmd, image, D3D12_RESOURCE_STATE_NON_PIXEL_SHADER_RESOURCE);
    image.uploaded = true;
}
struct ProgramPass {
    ComPtr<ID3D12RootSignature> root;
    ComPtr<ID3D12PipelineState> pso;
    uint32_t srvRoot = UINT32_MAX, uavRoot = UINT32_MAX, samplerRoot = UINT32_MAX;
};
struct Program {
    std::vector<ProgramPass> passes;
};
void ValidateEffect(const ScaleEffectRuntimeDesc& effect) {
    if (effect.mTextures.empty() || effect.mPasses.empty() ||
        ScaleSlot(effect.mInput) >= effect.mTextures.size() ||
        ScaleSlot(effect.mOutput) >= effect.mTextures.size() || effect.mInput == effect.mOutput)
        throw std::invalid_argument("Invalid D3D12 scale input/output/pass IDs");
    for (size_t i = 0; i < effect.mTextures.size(); ++i) {
        if (ScaleSlot(effect.mTextures[i].mId) != i)
            throw std::invalid_argument("Invalid D3D12 scale resource declaration order");
        NativeFormat(uint32_t(effect.mTextures[i].mFormat));
    }
    if (!effect.mTextures[ScaleSlot(effect.mInput)].mSource.empty() ||
        !effect.mTextures[ScaleSlot(effect.mOutput)].mSource.empty())
        throw std::invalid_argument("Scale INPUT/OUTPUT cannot be DDS resources");
    if (effect.mSamplers.size() > D3D12_COMMONSHADER_SAMPLER_SLOT_COUNT)
        throw std::invalid_argument("Too many scale samplers");
    for (const auto& sampler : effect.mSamplers) NativeSampler(sampler);
    std::vector<bool> produced(effect.mTextures.size());
    produced[ScaleSlot(effect.mInput)] = true;
    for (const auto& texture : effect.mTextures)
        if (!texture.mSource.empty()) produced[ScaleSlot(texture.mId)] = true;
    for (size_t i = 0; i < effect.mPasses.size(); ++i) {
        const auto& pass = effect.mPasses[i];
        if (ScaleSlot(pass.mId) != i || pass.mOutputs.empty() ||
            pass.mInputs.size() > D3D12_COMMONSHADER_INPUT_RESOURCE_SLOT_COUNT ||
            pass.mOutputs.size() > D3D12_UAV_SLOT_COUNT ||
            pass.mBlockWidth <= 0 || pass.mBlockHeight <= 0 ||
            pass.mNumThreadsX <= 0 || pass.mNumThreadsX > D3D12_CS_THREAD_GROUP_MAX_X ||
            pass.mNumThreadsY <= 0 || pass.mNumThreadsY > D3D12_CS_THREAD_GROUP_MAX_Y ||
            pass.mNumThreadsZ <= 0 || pass.mNumThreadsZ > D3D12_CS_THREAD_GROUP_MAX_Z ||
            uint64_t(pass.mNumThreadsX) * pass.mNumThreadsY * pass.mNumThreadsZ >
                D3D12_CS_THREAD_GROUP_MAX_THREADS_PER_GROUP)
            throw std::invalid_argument("Invalid D3D12 scale pass/block/thread count");
        // DXIL containers have the DXBC container signature. PSO creation
        // performs native bytecode validation; SPIR-V is never consumed here.
        if (pass.mDxil.size() < 32 || std::memcmp(pass.mDxil.data(), "DXBC", 4) != 0)
            throw std::invalid_argument("Scale pass has no compiled DXIL container");
        for (const auto id : pass.mInputs)
            if (ScaleSlot(id) >= produced.size() || !produced[ScaleSlot(id)])
                throw std::invalid_argument("Scale pass reads an undeclared/unwritten resource");
        std::set<ScaleResourceId> outputs;
        for (const auto id : pass.mOutputs) {
            if (ScaleSlot(id) >= produced.size() || id == effect.mInput ||
                !effect.mTextures[ScaleSlot(id)].mSource.empty() ||
                std::find(pass.mInputs.begin(), pass.mInputs.end(), id) != pass.mInputs.end() ||
                !outputs.insert(id).second)
                throw std::invalid_argument("Scale pass aliases a resource");
            produced[ScaleSlot(id)] = true;
        }
    }
    if (!produced[ScaleSlot(effect.mOutput)])
        throw std::invalid_argument("Scale effect does not produce its OUTPUT");
}
std::unique_ptr<Program> CreateProgram(ID3D12Device* device, const ScaleEffectRuntimeDesc& effect) {
    ValidateEffect(effect);
    auto program = std::make_unique<Program>();
    for (const auto& pass : effect.mPasses) {
        ProgramPass native;
        std::array<D3D12_DESCRIPTOR_RANGE, 3> ranges{};
        std::array<D3D12_ROOT_PARAMETER, 4> params{};
        params[0].ParameterType = D3D12_ROOT_PARAMETER_TYPE_CBV;
        params[0].ShaderVisibility = D3D12_SHADER_VISIBILITY_ALL;
        uint32_t count = 1;
        const auto table = [&](uint32_t rangeIndex, D3D12_DESCRIPTOR_RANGE_TYPE type,
            size_t descriptors, uint32_t& root) {
            if (!descriptors) return;
            root = count++;
            auto& range = ranges[rangeIndex];
            range.RangeType = type; range.NumDescriptors = uint32_t(descriptors);
            range.OffsetInDescriptorsFromTableStart = D3D12_DESCRIPTOR_RANGE_OFFSET_APPEND;
            auto& param = params[root];
            param.ParameterType = D3D12_ROOT_PARAMETER_TYPE_DESCRIPTOR_TABLE;
            param.ShaderVisibility = D3D12_SHADER_VISIBILITY_ALL;
            param.DescriptorTable = {1, &range};
        };
        table(0, D3D12_DESCRIPTOR_RANGE_TYPE_SRV, pass.mInputs.size(), native.srvRoot);
        table(1, D3D12_DESCRIPTOR_RANGE_TYPE_UAV, pass.mOutputs.size(), native.uavRoot);
        table(2, D3D12_DESCRIPTOR_RANGE_TYPE_SAMPLER, effect.mSamplers.size(), native.samplerRoot);
        D3D12_ROOT_SIGNATURE_DESC signature{};
        signature.NumParameters = count; signature.pParameters = params.data();
        ComPtr<ID3DBlob> binary, error;
        const auto hr = D3D12SerializeRootSignature(&signature, D3D_ROOT_SIGNATURE_VERSION_1,
            &binary, &error);
        if (FAILED(hr) && error)
            throw std::runtime_error("Serialize scale root signature: " +
                std::string(static_cast<const char*>(error->GetBufferPointer()), error->GetBufferSize()));
        D3d12Check(hr, "Serialize scale root signature");
        D3d12Check(device->CreateRootSignature(0, binary->GetBufferPointer(), binary->GetBufferSize(),
            IID_PPV_ARGS(&native.root)), "Create scale root signature");
        D3D12_COMPUTE_PIPELINE_STATE_DESC pso{};
        pso.pRootSignature = native.root.Get();
        pso.CS = {pass.mDxil.data(), pass.mDxil.size()};
        D3d12Check(device->CreateComputePipelineState(&pso, IID_PPV_ARGS(&native.pso)),
            "Create scale DXIL compute pipeline");
        program->passes.push_back(std::move(native));
    }
    return program;
}
ComPtr<ID3D12DescriptorHeap> CreateHeap(ID3D12Device* device, D3D12_DESCRIPTOR_HEAP_TYPE type,
    uint32_t count) {
    ComPtr<ID3D12DescriptorHeap> heap;
    if (!count) return heap;
    D3D12_DESCRIPTOR_HEAP_DESC desc{};
    desc.Type = type; desc.NumDescriptors = count;
    desc.Flags = D3D12_DESCRIPTOR_HEAP_FLAG_SHADER_VISIBLE;
    D3d12Check(device->CreateDescriptorHeap(&desc, IID_PPV_ARGS(&heap)), "Create scale descriptor heap");
    return heap;
}
D3D12_CPU_DESCRIPTOR_HANDLE Cpu(ID3D12DescriptorHeap* heap, uint32_t stride, uint32_t index) {
    auto handle = heap->GetCPUDescriptorHandleForHeapStart();
    handle.ptr += SIZE_T(stride) * index;
    return handle;
}
D3D12_GPU_DESCRIPTOR_HANDLE Gpu(ID3D12DescriptorHeap* heap, uint32_t stride, uint32_t index) {
    auto handle = heap->GetGPUDescriptorHandleForHeapStart();
    handle.ptr += UINT64(stride) * index;
    return handle;
}
}

struct D3d12ScaleLibrary::Impl {
    ComPtr<ID3D12Device> device;
    std::map<const ScaleEffectRuntimeDesc*, std::unique_ptr<Program>> programs;
    std::map<std::filesystem::path, std::unique_ptr<Image>> lookups;
    explicit Impl(D3d12ScaleDevice context) : device(context.device) {
        if (!device) throw std::invalid_argument("D3D12 scale library requires a device");
    }
    Program& Get(const ScaleEffectRuntimeDesc& effect) {
        if (const auto found = programs.find(&effect); found != programs.end()) return *found->second;
        auto program = CreateProgram(device.Get(), effect);
        return *programs.emplace(&effect, std::move(program)).first->second;
    }
    Image* Lookup(const std::filesystem::path& path) {
        const auto key = std::filesystem::canonical(path);
        if (const auto found = lookups.find(key); found != lookups.end()) return found->second.get();
        auto image = LoadLookup(device.Get(), key);
        return lookups.emplace(key, std::move(image)).first->second.get();
    }
};
D3d12ScaleLibrary::D3d12ScaleLibrary(D3d12ScaleDevice device) : impl_(std::make_unique<Impl>(device)) {}
D3d12ScaleLibrary::~D3d12ScaleLibrary() = default;
D3d12ScaleImage D3d12ScaleLibrary::Lookup(const std::filesystem::path& path) { return impl_->Lookup(path)->native; }
size_t D3d12ScaleLibrary::ProgramCount() const { return impl_->programs.size(); }
size_t D3d12ScaleLibrary::LookupCount() const { return impl_->lookups.size(); }

struct D3d12ScalePipeline::Impl {
    struct Pass {
        const ProgramPass* program{};
        std::vector<Image*> inputs, outputs;
        D3D12_GPU_VIRTUAL_ADDRESS constants{};
        D3D12_GPU_DESCRIPTOR_HANDLE srv{}, uav{}, sampler{};
        uint32_t groupsX{}, groupsY{};
    };
    Image input;
    Image* output = &input;
    std::vector<std::unique_ptr<Image>> images;
    std::vector<ComPtr<ID3D12Resource>> constants;
    ComPtr<ID3D12DescriptorHeap> resources, samplers;
    std::vector<Pass> passes;
    Impl(D3d12ScaleLibrary::Impl& library, D3d12ScaleImage scene,
        std::span<const D3d12ScaleStep> steps, uint32_t targetWidth, uint32_t targetHeight) {
        if (!scene.resource || !scene.width || !scene.height || steps.empty() ||
            !targetWidth || !targetHeight || scene.width > INT32_MAX || scene.height > INT32_MAX ||
            targetWidth > INT32_MAX || targetHeight > INT32_MAX)
            throw std::invalid_argument("Invalid D3D12 scale input, target or steps");
        auto* device = library.device.Get();
        const auto sceneDesc = scene.resource->GetDesc();
        ComPtr<ID3D12Device> sceneDevice;
        D3d12Check(scene.resource->GetDevice(IID_PPV_ARGS(&sceneDevice)), "Query scale input device");
        if (sceneDevice.Get() != device || sceneDesc.Dimension != D3D12_RESOURCE_DIMENSION_TEXTURE2D ||
            sceneDesc.Width != scene.width || sceneDesc.Height != scene.height ||
            sceneDesc.DepthOrArraySize != 1 || sceneDesc.MipLevels != 1 || sceneDesc.SampleDesc.Count != 1 ||
            uint32_t(sceneDesc.Format) != scene.format || (sceneDesc.Flags & D3D12_RESOURCE_FLAG_DENY_SHADER_RESOURCE))
            throw std::invalid_argument("Scale input must be a matching single-mip 2D SRV on the library device");
        RequireFormat(device, DXGI_FORMAT(scene.format), false);
        input.native = scene;
        uint64_t resourceCount = 0, samplerCount = 0;
        for (const auto& step : steps) {
            if (!step.effect) throw std::invalid_argument("Scale step has no effect");
            ValidateEffect(*step.effect);
            for (const auto& pass : step.effect->mPasses) {
                resourceCount += pass.mInputs.size() + pass.mOutputs.size();
                samplerCount += step.effect->mSamplers.size();
            }
        }
        if (resourceCount > D3D12_MAX_SHADER_VISIBLE_DESCRIPTOR_HEAP_SIZE_TIER_1 ||
            samplerCount > D3D12_MAX_SHADER_VISIBLE_SAMPLER_HEAP_SIZE)
            throw std::runtime_error("Scale descriptors exceed D3D12 heap limits");
        resources = CreateHeap(device, D3D12_DESCRIPTOR_HEAP_TYPE_CBV_SRV_UAV, uint32_t(resourceCount));
        samplers = CreateHeap(device, D3D12_DESCRIPTOR_HEAP_TYPE_SAMPLER, uint32_t(samplerCount));
        const auto resourceStride = device->GetDescriptorHandleIncrementSize(D3D12_DESCRIPTOR_HEAP_TYPE_CBV_SRV_UAV);
        const auto samplerStride = device->GetDescriptorHandleIncrementSize(D3D12_DESCRIPTOR_HEAP_TYPE_SAMPLER);
        uint32_t resourceIndex = 0, samplerIndex = 0;
        for (const auto& step : steps) {
            const auto& effect = *step.effect;
            const auto& program = library.Get(effect);
            const int inW = int(output->native.width), inH = int(output->native.height);
            int outW = 0, outH = 0;
            if (!ScaleEffectSizing::ComputePipelineOutputSize({step.effect}, {step.scaling},
                inW, inH, int(targetWidth), int(targetHeight), outW, outH) || outW <= 0 || outH <= 0)
                throw std::runtime_error("Invalid scale output dimensions for " + effect.mSourcePath);
            std::vector<Image*> textures(effect.mTextures.size());
            textures[ScaleSlot(effect.mInput)] = output;
            std::set<Image*> produced{output}, readOnly{output};
            for (const auto& texture : effect.mTextures) {
                if (texture.mId == effect.mInput) continue;
                Image* image = nullptr;
                const auto format = NativeFormat(uint32_t(texture.mFormat));
                if (!texture.mSource.empty()) {
                    image = library.Lookup(std::filesystem::path(effect.mSourcePath).parent_path() / texture.mSource);
                    if (image->native.format != uint32_t(format))
                        throw std::runtime_error("Scale DDS format disagrees with resource " +
                            std::to_string(ScaleSlot(texture.mId)));
                    produced.insert(image); readOnly.insert(image);
                } else {
                    bool wOk = true, hOk = true;
                    const int w = (texture.mId == effect.mOutput || texture.mWidthExpr.empty()) ? outW :
                        ScaleEffectSizing::EvalSizeExpr(texture.mWidthExpr, inW, inH, outW, outH, wOk);
                    const int h = (texture.mId == effect.mOutput || texture.mHeightExpr.empty()) ? outH :
                        ScaleEffectSizing::EvalSizeExpr(texture.mHeightExpr, inW, inH, outW, outH, hOk);
                    if (!wOk || !hOk || w <= 0 || h <= 0)
                        throw std::runtime_error("Invalid scale intermediate dimensions");
                    images.push_back(CreateImage(device, uint32_t(w), uint32_t(h), format, true));
                    image = images.back().get();
                }
                textures[ScaleSlot(texture.mId)] = image;
            }
            const auto words = ScaleEffectSizing::BuildConstants(effect, inW, inH, outW, outH);
            const auto bytes = words.size() * sizeof(uint32_t);
            if (!bytes || bytes > D3D12_REQ_CONSTANT_BUFFER_ELEMENT_COUNT * 16u)
                throw std::runtime_error("Scale constants exceed D3D12 limits");
            const auto aligned = (bytes + D3D12_CONSTANT_BUFFER_DATA_PLACEMENT_ALIGNMENT - 1) &
                ~size_t(D3D12_CONSTANT_BUFFER_DATA_PLACEMENT_ALIGNMENT - 1);
            auto buffer = CreateBuffer(device, aligned);
            auto* mapped = MapWrite(buffer.Get());
            std::memset(mapped, 0, aligned);
            std::memcpy(mapped, words.data(), bytes);
            const D3D12_RANGE written{0, aligned};
            buffer->Unmap(0, &written);
            const auto address = buffer->GetGPUVirtualAddress();
            constants.push_back(std::move(buffer));
            for (size_t p = 0; p < effect.mPasses.size(); ++p) {
                const auto& desc = effect.mPasses[p];
                Pass pass;
                pass.program = &program.passes.at(p); pass.constants = address;
                const auto resolve = [&](ScaleResourceId id) {
                    if (ScaleSlot(id) >= textures.size() || !textures[ScaleSlot(id)])
                        throw std::runtime_error("Undeclared scale resource " + std::to_string(ScaleSlot(id)));
                    return textures[ScaleSlot(id)];
                };
                if (!desc.mInputs.empty()) pass.srv = Gpu(resources.Get(), resourceStride, resourceIndex);
                for (const auto id : desc.mInputs) {
                    auto* image = resolve(id);
                    if (!produced.contains(image)) throw std::runtime_error("Scale pass reads an unwritten resource");
                    RequireFormat(device, DXGI_FORMAT(image->native.format), false);
                    pass.inputs.push_back(image);
                    D3D12_SHADER_RESOURCE_VIEW_DESC srv{};
                    srv.Format = DXGI_FORMAT(image->native.format);
                    srv.ViewDimension = D3D12_SRV_DIMENSION_TEXTURE2D;
                    srv.Shader4ComponentMapping = D3D12_DEFAULT_SHADER_4_COMPONENT_MAPPING;
                    srv.Texture2D.MipLevels = 1;
                    device->CreateShaderResourceView(image->native.resource, &srv,
                        Cpu(resources.Get(), resourceStride, resourceIndex++));
                }
                pass.uav = Gpu(resources.Get(), resourceStride, resourceIndex);
                for (const auto id : desc.mOutputs) {
                    auto* image = resolve(id);
                    if (readOnly.contains(image) ||
                        std::find(pass.inputs.begin(), pass.inputs.end(), image) != pass.inputs.end() ||
                        std::find(pass.outputs.begin(), pass.outputs.end(), image) != pass.outputs.end())
                        throw std::runtime_error("Scale pass aliases a resource");
                    pass.outputs.push_back(image); produced.insert(image);
                    D3D12_UNORDERED_ACCESS_VIEW_DESC uav{};
                    uav.Format = DXGI_FORMAT(image->native.format);
                    uav.ViewDimension = D3D12_UAV_DIMENSION_TEXTURE2D;
                    device->CreateUnorderedAccessView(image->native.resource, nullptr, &uav,
                        Cpu(resources.Get(), resourceStride, resourceIndex++));
                }
                if (!effect.mSamplers.empty()) pass.sampler = Gpu(samplers.Get(), samplerStride, samplerIndex);
                for (const auto& sampler : effect.mSamplers) {
                    const auto native = NativeSampler(sampler);
                    device->CreateSampler(&native, Cpu(samplers.Get(), samplerStride, samplerIndex++));
                }
                const uint32_t bw = desc.mPSStyle ? 16 : uint32_t(desc.mBlockWidth);
                const uint32_t bh = desc.mPSStyle ? 16 : uint32_t(desc.mBlockHeight);
                pass.groupsX = uint32_t((uint64_t(pass.outputs[0]->native.width) + bw - 1) / bw);
                pass.groupsY = uint32_t((uint64_t(pass.outputs[0]->native.height) + bh - 1) / bh);
                if (pass.groupsX > D3D12_CS_DISPATCH_MAX_THREAD_GROUPS_PER_DIMENSION ||
                    pass.groupsY > D3D12_CS_DISPATCH_MAX_THREAD_GROUPS_PER_DIMENSION)
                    throw std::runtime_error("Scale dispatch exceeds D3D12 limits");
                passes.push_back(std::move(pass));
            }
            auto* final = textures[ScaleSlot(effect.mOutput)];
            if (!final || !produced.contains(final) || readOnly.contains(final))
                throw std::runtime_error("Scale effect does not produce its OUTPUT");
            output = final;
            if (output->native.width != uint32_t(outW) || output->native.height != uint32_t(outH))
                throw std::runtime_error("Scale OUTPUT dimensions disagree with effect sizing");
        }
    }
    void Record(ID3D12GraphicsCommandList* cmd, uint32_t inputState) {
        if (!cmd || cmd->GetType() != D3D12_COMMAND_LIST_TYPE_DIRECT)
            throw std::invalid_argument("Scale Record requires a direct command list");
        input.state = D3D12_RESOURCE_STATES(inputState);
        Transition(cmd, input, ReadState);
        ID3D12DescriptorHeap* heaps[] = {resources.Get(), samplers.Get()};
        cmd->SetDescriptorHeaps(samplers ? 2 : 1, heaps);
        for (const auto& pass : passes) {
            for (auto* image : pass.inputs) {
                Upload(cmd, *image);
                Transition(cmd, *image, image == &input ? ReadState : D3D12_RESOURCE_STATE_NON_PIXEL_SHADER_RESOURCE);
            }
            for (auto* image : pass.outputs) Transition(cmd, *image, D3D12_RESOURCE_STATE_UNORDERED_ACCESS);
            cmd->SetComputeRootSignature(pass.program->root.Get());
            cmd->SetPipelineState(pass.program->pso.Get());
            cmd->SetComputeRootConstantBufferView(0, pass.constants);
            if (pass.program->srvRoot != UINT32_MAX)
                cmd->SetComputeRootDescriptorTable(pass.program->srvRoot, pass.srv);
            cmd->SetComputeRootDescriptorTable(pass.program->uavRoot, pass.uav);
            if (pass.program->samplerRoot != UINT32_MAX)
                cmd->SetComputeRootDescriptorTable(pass.program->samplerRoot, pass.sampler);
            cmd->Dispatch(pass.groupsX, pass.groupsY, 1);
        }
        Transition(cmd, *output, ReadState);
    }
};
D3d12ScalePipeline::D3d12ScalePipeline(D3d12ScaleLibrary& library, D3d12ScaleImage input,
    std::span<const D3d12ScaleStep> steps, uint32_t targetWidth, uint32_t targetHeight)
    : impl_(std::make_unique<Impl>(*library.impl_, input, steps, targetWidth, targetHeight)),
      output(impl_->output->native), inputState(impl_->input.state),
      outputState(impl_->output->state) {}
D3d12ScalePipeline::~D3d12ScalePipeline() = default;
void D3d12ScalePipeline::Record(ID3D12GraphicsCommandList* cmd, uint32_t inputStateBeforeRecord) { impl_->Record(cmd, inputStateBeforeRecord); }
size_t D3d12ScalePipeline::WritableImageCount() const { return impl_->images.size(); }
size_t D3d12ScalePipeline::PassCount() const { return impl_->passes.size(); }
}
