#pragma once

#include <cstdint>
#include <filesystem>
#include <span>
#include <string>
#include <string_view>
#include <vector>

namespace Sexy {
// IDs are effect-local declaration-order slots, never hashes of execution names.
enum class ScaleResourceId : uint32_t { Invalid = UINT32_MAX };
enum class ScalePassId : uint32_t { Invalid = UINT32_MAX };
enum class ScaleParamId : uint32_t { Invalid = UINT32_MAX };
constexpr size_t ScaleSlot(ScaleResourceId id) { return static_cast<uint32_t>(id); }
constexpr size_t ScaleSlot(ScalePassId id) { return static_cast<uint32_t>(id); }
constexpr size_t ScaleSlot(ScaleParamId id) { return static_cast<uint32_t>(id); }

enum class ScaleSizeOp : uint32_t {
    Literal, InputWidth, InputHeight, OutputWidth, OutputHeight,
    Add, Subtract, Multiply, Divide
};
struct ScaleSizeInstruction {
    ScaleSizeOp mOp = ScaleSizeOp::Literal;
    int32_t mLiteral = 0;
};
using ScaleSizeExpr = std::vector<ScaleSizeInstruction>;
struct ScaleRuntimeParam {
    // External JSON boundary key only; execution values use mId.
    // The offline compiler rejects collisions in the case-insensitive protocol.
    uint64_t mProtocolKey = 0;
    ScaleParamId mId = ScaleParamId::Invalid;
    bool mIsInt = false;
    float mDefault = 0, mMin = 0, mMax = 0, mStep = 0, mInlineValue = 0;
};
struct ScaleRuntimeTexture {
    ScaleResourceId mId = ScaleResourceId::Invalid;
    ScaleSizeExpr mWidthExpr, mHeightExpr;
    // V1 numeric format protocol; native enums are confined to each backend.
    uint32_t mFormat = 37; // RGBA8 UNORM.
    std::string mSource; // DDS filepath relative to mSourcePath.
};
struct ScaleRuntimeSampler {
    uint32_t mFilter = 0; // Nearest=0, linear=1.
    uint32_t mAddress = 2; // Repeat=0, mirror=1, clamp=2, border=3.
};
struct ScaleRuntimePass {
    ScalePassId mId = ScalePassId::Invalid;
    bool mPSStyle = false;
    std::vector<ScaleResourceId> mInputs, mOutputs;
    int32_t mBlockWidth = 8, mBlockHeight = 8;
    int32_t mNumThreadsX = 8, mNumThreadsY = 8, mNumThreadsZ = 1;
    std::vector<uint32_t> mSpirv;
    std::vector<uint8_t> mDxil;
};
struct ScaleEffectRuntimeDesc {
    std::string mSourcePath; // Authoring filepath used to locate DDS assets only.
    ScaleResourceId mInput = ScaleResourceId::Invalid;
    ScaleResourceId mOutput = ScaleResourceId::Invalid;
    std::vector<ScaleRuntimeParam> mParams;
    std::vector<ScaleRuntimeTexture> mTextures;
    std::vector<ScaleRuntimeSampler> mSamplers;
    std::vector<ScaleRuntimePass> mPasses;
};
struct ScaleParamValue {
    ScaleParamId mId = ScaleParamId::Invalid;
    float mValue = 0;
    bool operator==(const ScaleParamValue&) const = default;
};
using ScaleRuntimeParams = std::vector<ScaleParamValue>;

// Optional Vulkan cache format. Version 1 stores SPIR-V only; runtime DXIL is
// compiled from source and is never serialized by this API.
class ScaleEffectBinary {
public:
    static constexpr uint32_t Version = 1;
    static bool Load(const std::filesystem::path& path, ScaleEffectRuntimeDesc& out, std::string& error);
    static bool Save(const std::filesystem::path& path, const ScaleEffectRuntimeDesc& effect, std::string& error);
    static bool Validate(const ScaleEffectRuntimeDesc& effect, std::string& error);
    static uint64_t ProtocolParamKey(std::string_view name);
    static bool DecodeParam(const ScaleEffectRuntimeDesc& effect, std::string_view name,
        float value, ScaleParamValue& out, std::string& error);
    static bool ResolveParams(const ScaleEffectRuntimeDesc& effect, const ScaleRuntimeParams& overrides,
        ScaleRuntimeParams& out, std::string& error);
    static std::filesystem::path DefaultPath(const std::filesystem::path& sourcePath);
};
}

// Source compilation is enabled for runtime, authoring, and test targets that
// explicitly opt into DXC and the metadata parser.
#if defined(SEXY_SCALE_EFFECT_AUTHORING)
#include <map>
#include <memory>
namespace Sexy {
using ScaleEffectParams = std::map<std::string, float>;
struct ScaleEffectParamDesc {
    std::string mName, mLabel;
    bool mIsInt = false;
    float mDefault = 0, mMin = 0, mMax = 0, mStep = 0;
};
struct ScaleEffectTextureDesc {
    std::string mName, mWidthExpr, mHeightExpr, mFormat, mSource;
};
struct ScaleEffectSamplerDesc {
    std::string mName, mFilter, mAddress;
};
struct ScaleEffectPassDesc {
    int mIndex;
    std::string mDesc;
    bool mPSStyle;
    std::vector<std::string> mInputs, mOutputs;
    int mBlockWidth, mBlockHeight, mNumThreadsX, mNumThreadsY, mNumThreadsZ;
    std::string mCode;
};
struct ScaleEffectDesc {
    std::string mName, mSourcePath;
    std::vector<ScaleEffectParamDesc> mParams;
    std::vector<ScaleEffectTextureDesc> mTextures;
    std::vector<ScaleEffectSamplerDesc> mSamplers;
    std::vector<std::string> mCommonBlocks;
    std::vector<ScaleEffectPassDesc> mPasses;
    std::vector<std::vector<uint32_t>> mCompiledSpirv;
    ScaleEffectParams mInlineParams;
    bool mInlineParamsEnabled = false, mCompiled = false;
    std::string mError;
};
class ScaleEffectCompiler {
public:
    ScaleEffectCompiler();
    ~ScaleEffectCompiler();
    ScaleEffectCompiler(const ScaleEffectCompiler&) = delete;
    ScaleEffectCompiler& operator=(const ScaleEffectCompiler&) = delete;
    bool CompileAll(const std::string& effectsDir, std::vector<ScaleEffectDesc>& outEffects);
    bool CompileEffect(const std::string& path, ScaleEffectDesc& outDesc);
    bool CompileEffect(const std::string& path, const ScaleEffectParams& params, ScaleEffectDesc& outDesc);
    bool CompileFile(const std::string& path, const ScaleEffectParams& params,
        ScaleEffectRuntimeDesc& out, std::string& error);
    bool CompileD3d12(const std::string& path, const ScaleEffectParams& params,
        ScaleEffectRuntimeDesc& out, std::string& error);
    static bool ValidateD3d12(const ScaleEffectRuntimeDesc& effect, std::string& error);
    static bool ResolveInlineParams(const ScaleEffectDesc& desc, const ScaleEffectParams& overrides,
        ScaleEffectParams& outResolved, std::string& error);
    static bool CompileRuntimeMetadata(const ScaleEffectDesc& authored, ScaleEffectRuntimeDesc& out, std::string& error);
    static bool CompileSizeExpr(std::string_view text, ScaleSizeExpr& out, std::string& error);
    // Writes source.hlsl.vfx. Arbitrary runtime values use specialization IDs.
    bool CompileBinary(const std::string& sourcePath, const ScaleEffectParams& overrides,
        std::filesystem::path& writtenPath, std::string& error);
private:
    struct Impl;
    std::unique_ptr<Impl> mImpl;
    bool ParseEffect(const std::string& path, ScaleEffectDesc& desc);
    bool GenerateAndCompilePasses(ScaleEffectDesc& desc,
        std::vector<std::vector<uint8_t>>* dxil = nullptr);
    static bool BuildRuntimeMetadata(const ScaleEffectDesc& authored,
        const std::vector<std::vector<uint8_t>>* dxil, ScaleEffectRuntimeDesc& out, std::string& error);
};
}
#endif
