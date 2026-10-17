#include "SexyAppFramework/effect/ScaleEffectCompiler.h"
#include <windows.h>
#include <d3d12shader.h>
#include <dxcapi.h>
#include <filesystem>
#include <fstream>
#include <iostream>
#include <stdexcept>
#include <tuple>
#include <utility>

namespace Sexy {
const char* GetLogFilePathC(const char* name) {
    static thread_local std::string path;
    path = (std::filesystem::temp_directory_path() / name).string();
    return path.c_str();
}
}
namespace {
using namespace Sexy;
void Require(bool value, const std::string& message) {
    if (!value) throw std::runtime_error(message);
}
template<class T> struct ComPtr {
    T* ptr = nullptr;
    ~ComPtr() { if (ptr) ptr->Release(); }
};
void InspectBindings(const ScaleRuntimePass& pass) {
    ComPtr<IDxcUtils> utils;
    ComPtr<IDxcBlobEncoding> blob;
    ComPtr<IDxcContainerReflection> container;
    ComPtr<ID3D12ShaderReflection> reflection;
    Require(SUCCEEDED(DxcCreateInstance(CLSID_DxcUtils, IID_PPV_ARGS(&utils.ptr))), "DXC utils");
    Require(SUCCEEDED(utils.ptr->CreateBlob(pass.mDxil.data(), UINT32(pass.mDxil.size()), 0, &blob.ptr)), "DXIL blob");
    Require(SUCCEEDED(DxcCreateInstance(CLSID_DxcContainerReflection, IID_PPV_ARGS(&container.ptr))), "DXC reflection");
    Require(SUCCEEDED(container.ptr->Load(blob.ptr)), "DXIL container");
    UINT32 part = 0;
    Require(SUCCEEDED(container.ptr->FindFirstPartKind(0x4c495844u, &part)), "DXIL part");
    Require(SUCCEEDED(container.ptr->GetPartReflection(part, IID_PPV_ARGS(&reflection.ptr))), "shader reflection");
    D3D12_SHADER_DESC desc{};
    Require(SUCCEEDED(reflection.ptr->GetDesc(&desc)), "shader description");
    Require(D3D12_SHVER_GET_TYPE(desc.Version) == D3D12_SHVER_COMPUTE_SHADER &&
        D3D12_SHVER_GET_MAJOR(desc.Version) == 6 && D3D12_SHVER_GET_MINOR(desc.Version) == 0,
        "expected cs_6_0");
    for (const auto& [name, type, slot] : {
        std::tuple{"__CB1", D3D_SIT_CBUFFER, 0u},
        std::tuple{"TEMP", D3D_SIT_TEXTURE, 0u},
        std::tuple{"INPUT", D3D_SIT_TEXTURE, 1u},
        std::tuple{"OUTPUT", D3D_SIT_UAV_RWTYPED, 0u},
        std::tuple{"EXTRA", D3D_SIT_UAV_RWTYPED, 1u},
        std::tuple{"firstSam", D3D_SIT_SAMPLER, 0u},
        std::tuple{"secondSam", D3D_SIT_SAMPLER, 1u}}) {
        D3D12_SHADER_INPUT_BIND_DESC binding{};
        Require(SUCCEEDED(reflection.ptr->GetResourceBindingDescByName(name, &binding)), std::string("missing ") + name);
        Require(binding.Type == type && binding.BindPoint == slot && binding.Space == 0 && binding.BindCount == 1,
            std::string("incorrect register for ") + name);
    }
    auto* constants = reflection.ptr->GetConstantBufferByName("__CB1");
    for (const auto& [name, offset] : {
        std::pair{"__inputSize", 0u}, {"__outputSize", 8u}, {"__inputPt", 16u},
        {"__outputPt", 24u}, {"__scale", 32u}, {"__pass1OutputSize", 40u}, {"__pass1OutputPt", 48u}}) {
        D3D12_SHADER_VARIABLE_DESC variable{};
        Require(SUCCEEDED(constants->GetVariableByName(name)->GetDesc(&variable)) &&
            variable.StartOffset == offset, std::string("incorrect constant offset for ") + name);
    }
}
const char* kFixture = R"(//!MAGPIE EFFECT
//!VERSION 4
//!PARAMETER
//!DEFAULT 1
//!MIN 0
//!MAX 3
//!STEP 0.1
float gain;
//!TEXTURE
Texture2D INPUT;
//!TEXTURE
Texture2D OUTPUT;
//!TEXTURE
//!WIDTH INPUT_WIDTH
//!HEIGHT OUTPUT_HEIGHT
//!FORMAT R16G16B16A16_FLOAT
Texture2D TEMP;
//!TEXTURE
Texture2D EXTRA;
//!SAMPLER
//!FILTER POINT
SamplerState firstSam;
//!SAMPLER
//!FILTER LINEAR
SamplerState secondSam;
//!PASS 1
//!STYLE PS
//!IN INPUT
//!OUT TEMP
float4 Pass1(float2 pos) { return INPUT.SampleLevel(firstSam, pos, 0) * gain; }
//!PASS 2
//!IN TEMP, INPUT
//!OUT OUTPUT, EXTRA
//!BLOCK_SIZE 8
//!NUM_THREADS 8, 8, 1
void Pass2(uint2 blockStart, uint3 tid) {
    uint2 p = blockStart + tid.xy;
    if (any(p >= GetOutputSize())) return;
    float2 pos = (p + 0.5) * GetInputPt();
    float4 value = TEMP.SampleLevel(firstSam, pos, 0) + INPUT.SampleLevel(secondSam, pos, 0);
    value.xy += GetScale() + GetOutputPt() + GetInputSize()
        + __pass1OutputSize + __pass1OutputPt;
    OUTPUT[p] = value * gain;
    EXTRA[p] = value;
}
)";
}
int main(int argc, char** argv) {
    using namespace Sexy;
    try {
        const auto root = argc > 1 ? std::filesystem::path(argv[1]) : std::filesystem::path("effects");
        const auto fixture = std::filesystem::temp_directory_path() / "pvz-scale-d3d12-compiler-test.hlsl";
        { std::ofstream file(fixture); file << kFixture; Require(bool(file), "write fixture"); }
        ScaleEffectCompiler compiler;
        ScaleEffectRuntimeDesc baseline, changed, result;
        std::string error;
        Require(compiler.CompileD3d12(fixture.string(), {}, baseline, error), error);
        Require(error.empty() && baseline.mPasses.size() == 2, "compile completion");
        InspectBindings(baseline.mPasses[1]);
        Require(baseline.mTextures[ScaleSlot(baseline.mPasses[1].mInputs[0])].mFormat == 97u,
            "RGBA16F intermediate format protocol");
        Require(compiler.CompileD3d12(fixture.string(), {{"GAIN", 2.0f}}, changed, error), error);
        Require(changed.mParams[0].mInlineValue == 2 && baseline.mPasses[0].mDxil != changed.mPasses[0].mDxil &&
            baseline.mPasses[1].mDxil != changed.mPasses[1].mDxil, "override was not baked into each pass");
        for (const auto& overrides : {ScaleEffectParams{{"gain", 99.0f}}, ScaleEffectParams{{"typo", 1.0f}},
            ScaleEffectParams{{"gain", 1.0f}, {"GAIN", 2.0f}}}) {
            result = baseline;
            Require(!compiler.CompileD3d12(fixture.string(), overrides, result, error) &&
                !error.empty() && result.mPasses.empty() && result.mTextures.empty(), "override failure retained descriptor");
        }
        { std::ofstream file(fixture); file << kFixture << "\ninvalid HLSL;\n"; }
        result = baseline;
        Require(!compiler.CompileD3d12(fixture.string(), {}, result, error) &&
            result.mPasses.empty() && error.find("pass 2") != std::string::npos &&
            error.find("HLSL -> DXIL") != std::string::npos, "reload error lost DXC diagnostics or retained passes");
        { std::ofstream file(fixture); file << kFixture; }
        Require(compiler.CompileD3d12(fixture.string(), {}, result, error) && error.empty(), error);
        Require(result.mPasses[0].mDxil == baseline.mPasses[0].mDxil, "source recovery changed shader");
        result.mPasses[1].mDxil.resize(16);
        Require(!ScaleEffectCompiler::ValidateD3d12(result, error), "truncated DXIL accepted");
        result = baseline;
        result.mPasses[1].mInputs = {static_cast<ScaleResourceId>(9999)};
        Require(!ScaleEffectCompiler::ValidateD3d12(result, error), "invalid input metadata accepted");
        result = baseline;
        result.mPasses[1].mSpirv = {0x07230203u, 0, 0, 0, 0};
        Require(!ScaleEffectCompiler::ValidateD3d12(result, error), "mixed backend accepted");
        std::vector<std::filesystem::path> paths;
        if (argc > 2 && std::string(argv[2]) == "--all") {
            for (const auto& entry : std::filesystem::recursive_directory_iterator(root))
                if (entry.is_regular_file() && entry.path().extension() == ".hlsl") paths.push_back(entry.path());
        } else {
            for (const char* name : {"Nearest.hlsl", "Bilinear.hlsl", "Lanczos.hlsl", "SSimDownscaler.hlsl",
                "Anime4K/Anime4K_Denoise_Bilateral_Mean.hlsl", "Anime4K/Anime4K_Upscale_Denoise_UL.hlsl",
                "SMAA/SMAA_Ultra.hlsl", "NIS/NIS.hlsl"})
                paths.push_back(root / name);
        }
        size_t effects = 0, passes = 0;
        for (const auto& path : paths) {
            Require(compiler.CompileD3d12(path.string(), {}, result, error), error);
            Require(ScaleEffectCompiler::ValidateD3d12(result, error), error);
            for (const auto& pass : result.mPasses) Require(pass.mSpirv.empty() && !pass.mDxil.empty(), "backend payload");
            ++effects;
            passes += result.mPasses.size();
        }
        Require(effects > 0, "no effects tested");
        Require(compiler.CompileFile((root / "Nearest.hlsl").string(), {}, result, error), error);
        Require(ScaleEffectBinary::Validate(result, error) && result.mPasses[0].mDxil.empty(), error);
        const auto binary = fixture.string() + ".vfx";
        Require(ScaleEffectBinary::Save(binary, result, error), error);
        ScaleEffectRuntimeDesc loaded;
        Require(ScaleEffectBinary::Load(binary, loaded, error) &&
            loaded.mPasses[0].mSpirv == result.mPasses[0].mSpirv, error);
        std::filesystem::remove(binary);
        std::filesystem::remove(fixture);
        std::cout << "PASS DXIL registers, sizing constants, baked parameters, reload failures, validation, "
            << effects << " effects / " << passes << " passes and Vulkan V1 round trip\n";
        return 0;
    } catch (const std::exception& e) {
        std::cerr << "FAIL " << e.what() << '\n';
        return 1;
    }
}
