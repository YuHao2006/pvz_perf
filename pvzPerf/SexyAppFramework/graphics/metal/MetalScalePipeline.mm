#include "MetalScalePipeline.h"
#import <Metal/Metal.h>
#include <spirv_msl.hpp>
#include <algorithm>
#include <bit>
#include <climits>
#include <fstream>
#include <limits>
#include <map>
#include <set>
#include <stdexcept>
#include <utility>

#if !__has_feature(objc_arc)
#error MetalScalePipeline.mm requires Objective-C ARC
#endif

namespace Sexy {
namespace {
[[noreturn]] void Fail(const std::string& operation, NSError* error = nil) {
    throw std::runtime_error(operation + (error ?
        ": " + std::string(error.localizedDescription.UTF8String) : ""));
}
MTLPixelFormat PixelFormat(uint32_t format) {
    switch (format) {
    case 109: return MTLPixelFormatRGBA32Float;
    case 97: return MTLPixelFormatRGBA16Float;
    case 91: return MTLPixelFormatRGBA16Unorm;
    case 92: return MTLPixelFormatRGBA16Snorm;
    case 103: return MTLPixelFormatRG32Float;
    case 64: return MTLPixelFormatRGB10A2Unorm;
    case 122: return MTLPixelFormatRG11B10Float;
    case 37: return MTLPixelFormatRGBA8Unorm;
    case 38: return MTLPixelFormatRGBA8Snorm;
    case 83: return MTLPixelFormatRG16Float;
    case 77: return MTLPixelFormatRG16Unorm;
    case 78: return MTLPixelFormatRG16Snorm;
    case 100: return MTLPixelFormatR32Float;
    case 16: return MTLPixelFormatRG8Unorm;
    case 17: return MTLPixelFormatRG8Snorm;
    case 76: return MTLPixelFormatR16Float;
    case 70: return MTLPixelFormatR16Unorm;
    case 71: return MTLPixelFormatR16Snorm;
    case 9: return MTLPixelFormatR8Unorm;
    case 10: return MTLPixelFormatR8Snorm;
    default: Fail("Unsupported Metal scale format " + std::to_string(format));
    }
}
struct Image {
    id<MTLTexture> texture = nil;
    MetalScaleImage native{};
};
std::unique_ptr<Image> CreateImage(id<MTLDevice> device, uint32_t width, uint32_t height,
    MTLPixelFormat format, bool writable) {
    if (!width || !height || width > 16384 || height > 16384)
        Fail("Metal scale texture dimensions exceed the macOS 2D texture limit");
    MTLTextureDescriptor* desc = [MTLTextureDescriptor
        texture2DDescriptorWithPixelFormat:format width:width height:height mipmapped:NO];
    desc.storageMode = writable ? MTLStorageModePrivate : MTLStorageModeShared;
    desc.usage = MTLTextureUsageShaderRead | (writable ? MTLTextureUsageShaderWrite : 0);
    desc.hazardTrackingMode = MTLHazardTrackingModeTracked;
    auto image = std::make_unique<Image>();
    image->texture = [device newTextureWithDescriptor:desc];
    if (!image->texture) Fail("Cannot allocate Metal scale texture, format " + std::to_string(format));
    image->native = {(__bridge void*)image->texture, uint32_t(format), width, height};
    return image;
}
std::unique_ptr<Image> LoadLookup(id<MTLDevice> device, const std::filesystem::path& path) {
    std::ifstream stream(path, std::ios::binary | std::ios::ate);
    if (!stream) Fail("Cannot read scale DDS: " + path.string());
    const auto length = stream.tellg();
    if (length < 128 || uint64_t(length) > std::numeric_limits<size_t>::max())
        Fail("Invalid scale DDS file size: " + path.string());
    std::vector<uint8_t> file(static_cast<size_t>(length));
    stream.seekg(0);
    if (!stream.read(reinterpret_cast<char*>(file.data()), length))
        Fail("Incomplete scale DDS read: " + path.string());
    const auto word = [&](size_t offset) {
        if (offset > file.size() || file.size() - offset < 4) Fail("Truncated scale DDS");
        uint32_t value = 0;
        for (unsigned i = 0; i < 4; ++i) value |= uint32_t(file[offset + i]) << (8 * i);
        return value;
    };
    if (word(0) != 0x20534444 || word(4) != 124 || word(76) != 32)
        Fail("Invalid scale DDS header");
    if (word(24) > 1 || word(28) > 1 || word(112))
        Fail("Scale DDS must be a single-mip 2D image");
    const uint32_t width = word(16), height = word(12), flags = word(80);
    uint32_t format = 0, bytes = 0;
    if (flags & 4) {
        if (word(84) == 113) { format = 97; bytes = 8; }
    } else if ((flags & 0x41) == 0x41 && word(88) == 32 &&
        word(92) == 0xff && word(96) == 0xff00 && word(100) == 0xff0000 && word(104) == 0xff000000) {
        format = 37; bytes = 4;
    } else if (flags == 0x20000 && word(88) == 8 && word(92) == 0xff &&
        !word(96) && !word(100) && !word(104)) {
        format = 9; bytes = 1;
    }
    if (!format) Fail("Unsupported scale DDS pixel format");
    if (!width || !height || size_t(width) > std::numeric_limits<size_t>::max() / bytes ||
        size_t(height) > std::numeric_limits<size_t>::max() / (size_t(width) * bytes))
        Fail("Invalid scale DDS dimensions");
    const size_t rowBytes = size_t(width) * bytes, byteSize = rowBytes * height;
    if (((word(8) & 8) && word(20) != rowBytes) || file.size() - 128 != byteSize)
        Fail("Scale DDS payload length or row pitch disagrees with header");
    auto image = CreateImage(device, width, height, PixelFormat(format), false);
    [image->texture replaceRegion:MTLRegionMake2D(0, 0, width, height) mipmapLevel:0
        withBytes:file.data() + 128 bytesPerRow:rowBytes];
    return image;
}
struct Binding {
    uint32_t set{}, slot{}, metal{};
};
struct ProgramPass {
    id<MTLLibrary> library = nil;
    id<MTLComputePipelineState> pipeline = nil;
    std::vector<Binding> bindings;
    size_t constantBytes{};
    MTLSize threads{};
};
struct Program {
    std::vector<ProgramPass> passes;
    std::vector<id<MTLSamplerState>> samplers;
};
ProgramPass CompilePass(id<MTLDevice> device, const ScaleEffectRuntimeDesc& effect,
    const ScaleRuntimePass& pass) {
    spirv_cross::CompilerMSL compiler(pass.mSpirv);
    compiler.set_entry_point("__M", spv::ExecutionModelGLCompute);
    auto options = compiler.get_msl_options();
    options.platform = spirv_cross::CompilerMSL::Options::macOS;
    options.msl_version = spirv_cross::CompilerMSL::Options::make_msl_version(2, 3);
    options.argument_buffers = false;
    compiler.set_msl_options(options);
    ProgramPass result;
    // Use only active variables: DXC can remove unused declaration-order slots.
    const auto active = compiler.get_active_interface_variables();
    compiler.set_enabled_interface_variables(active);
    const auto resources = compiler.get_shader_resources(active);
    if (!resources.storage_buffers.empty() || !resources.push_constant_buffers.empty() ||
        !resources.sampled_images.empty() || !resources.subpass_inputs.empty() ||
        !resources.atomic_counters.empty() || !resources.acceleration_structures.empty() ||
        !resources.gl_plain_uniforms.empty() || !resources.shader_record_buffers.empty())
        Fail("Unsupported resource class in Metal scale SPIR-V");
    std::set<std::pair<uint32_t, uint32_t>> seen;
    uint32_t bufferIndex = 0, textureIndex = 0, samplerIndex = 0;
    const auto remap = [&](const auto& list, uint32_t set, size_t count) {
        for (const auto& resource : list) {
            if (!compiler.has_decoration(resource.id, spv::DecorationDescriptorSet) ||
                !compiler.has_decoration(resource.id, spv::DecorationBinding))
                Fail("Metal scale resource lacks explicit set/binding");
            const auto declaredSet = compiler.get_decoration(resource.id, spv::DecorationDescriptorSet);
            const auto slot = compiler.get_decoration(resource.id, spv::DecorationBinding);
            if (declaredSet != set || slot >= count || !seen.emplace(set, slot).second)
                Fail("Metal scale reflection disagrees with descriptor protocol");
            const auto& type = compiler.get_type(resource.type_id);
            if (!type.array.empty()) Fail("Metal scale resource arrays are unsupported");
            if (set == 1 || set == 2) {
                if (type.image.dim != spv::Dim2D || type.image.arrayed || type.image.ms ||
                    type.image.depth)
                    Fail("Metal scale resources must be non-depth single-sample Texture2D");
            }
            spirv_cross::MSLResourceBinding binding{};
            binding.stage = spv::ExecutionModelGLCompute;
            binding.desc_set = set;
            binding.binding = slot;
            uint32_t index;
            if (set == 0) {
                index = bufferIndex++;
                binding.msl_buffer = index;
                result.constantBytes = compiler.get_declared_struct_size(
                    compiler.get_type(resource.base_type_id));
            } else if (set == 3) {
                index = samplerIndex++;
                binding.msl_sampler = index;
            } else {
                index = textureIndex++;
                binding.msl_texture = index;
            }
            compiler.add_msl_resource_binding(binding);
            result.bindings.push_back({set, slot, index});
        }
    };
    remap(resources.uniform_buffers, 0, 1);
    remap(resources.separate_images, 1, pass.mInputs.size());
    remap(resources.storage_images, 2, pass.mOutputs.size());
    remap(resources.separate_samplers, 3, effect.mSamplers.size());
    if (bufferIndex > 31 || textureIndex > 128 || samplerIndex > 16)
        Fail("Metal scale resources exceed native argument limits");
    const auto specializations = compiler.get_specialization_constants();
    for (const auto& spec : specializations) {
        if (spec.constant_id >= effect.mParams.size())
            Fail("Unknown Metal scale specialization constant " + std::to_string(spec.constant_id));
        const auto& param = effect.mParams[spec.constant_id];
        auto& constant = compiler.get_constant(spec.id);
        const auto& type = compiler.get_type(constant.constant_type);
        if (ScaleSlot(param.mId) != spec.constant_id || type.width != 32 ||
            type.vecsize != 1 || type.columns != 1 ||
            type.basetype != (param.mIsInt ? spirv_cross::SPIRType::Int : spirv_cross::SPIRType::Float))
            Fail("Metal scale specialization type disagrees with parameter");
        // SPIRV-Cross emits some array-size specializations as macros, and
        // evaluates their dependent expressions while generating MSL. Update
        // defaults too, so those paths use the resolved runtime parameter.
        constant.m.c[0].r[0].u32 = param.mIsInt ?
            std::bit_cast<uint32_t>(int32_t(param.mInlineValue)) :
            std::bit_cast<uint32_t>(param.mInlineValue);
    }
    const uint32_t x = compiler.get_execution_mode_argument(spv::ExecutionModeLocalSize, 0);
    const uint32_t y = compiler.get_execution_mode_argument(spv::ExecutionModeLocalSize, 1);
    const uint32_t z = compiler.get_execution_mode_argument(spv::ExecutionModeLocalSize, 2);
    // The compiler's PS wrapper covers a 16x16 tile using 64x1x1
    // threads, independently of the authored compute thread metadata.
    if (!x || !y || !z || x != (pass.mPSStyle ? 64u : uint32_t(pass.mNumThreadsX)) ||
        y != (pass.mPSStyle ? 1u : uint32_t(pass.mNumThreadsY)) ||
        z != (pass.mPSStyle ? 1u : uint32_t(pass.mNumThreadsZ)))
        Fail("Metal scale SPIR-V workgroup shape disagrees with metadata");
    result.threads = MTLSizeMake(x, y, z);
    const auto source = compiler.compile();
    const auto entry = compiler.get_cleansed_entry_point_name("__M", spv::ExecutionModelGLCompute);
    MTLFunctionConstantValues* values = [MTLFunctionConstantValues new];
    for (const auto& spec : specializations) {
        if (compiler.specialization_constant_is_macro(spec.constant_id)) continue;
        const auto& param = effect.mParams[spec.constant_id];
        if (param.mIsInt) {
            int32_t value = int32_t(param.mInlineValue);
            [values setConstantValue:&value type:MTLDataTypeInt atIndex:spec.constant_id];
        } else {
            float value = param.mInlineValue;
            [values setConstantValue:&value type:MTLDataTypeFloat atIndex:spec.constant_id];
        }
    }
    NSError* error = nil;
    MTLCompileOptions* compileOptions = [MTLCompileOptions new];
    compileOptions.languageVersion = MTLLanguageVersion2_3;
    compileOptions.fastMathEnabled = NO;
    NSString* text = [[NSString alloc] initWithBytes:source.data() length:source.size()
        encoding:NSUTF8StringEncoding];
    result.library = [device newLibraryWithSource:text options:compileOptions error:&error];
    if (!result.library) Fail("Compile generated Metal scale MSL", error);
    NSString* name = [NSString stringWithUTF8String:entry.c_str()];
    id<MTLFunction> function = [result.library newFunctionWithName:name constantValues:values error:&error];
    if (!function) Fail("Specialize Metal scale compute function", error);
    result.pipeline = [device newComputePipelineStateWithFunction:function error:&error];
    if (!result.pipeline) Fail("Create Metal scale compute pipeline", error);
    const auto limits = device.maxThreadsPerThreadgroup;
    if (x > limits.width || y > limits.height || z > limits.depth ||
        uint64_t(x) * y * z > result.pipeline.maxTotalThreadsPerThreadgroup ||
        result.pipeline.staticThreadgroupMemoryLength > device.maxThreadgroupMemoryLength)
        Fail("Metal scale threadgroup shape exceeds device/pipeline limits");
    return result;
}
std::unique_ptr<Program> CreateProgram(id<MTLDevice> device, const ScaleEffectRuntimeDesc& effect) {
    std::string error;
    if (!ScaleEffectBinary::Validate(effect, error)) Fail("Invalid Metal scale effect: " + error);
    auto program = std::make_unique<Program>();
    for (const auto& sampler : effect.mSamplers) {
        if (sampler.mFilter > 1 || sampler.mAddress > 3) Fail("Invalid Metal scale sampler");
        MTLSamplerDescriptor* desc = [MTLSamplerDescriptor new];
        desc.minFilter = desc.magFilter = sampler.mFilter ? MTLSamplerMinMagFilterLinear : MTLSamplerMinMagFilterNearest;
        desc.mipFilter = MTLSamplerMipFilterNotMipmapped;
        static constexpr MTLSamplerAddressMode modes[] = {MTLSamplerAddressModeRepeat,
            MTLSamplerAddressModeMirrorRepeat, MTLSamplerAddressModeClampToEdge,
            MTLSamplerAddressModeClampToBorderColor};
        desc.sAddressMode = desc.tAddressMode = desc.rAddressMode = modes[sampler.mAddress];
        desc.borderColor = MTLSamplerBorderColorTransparentBlack;
        id<MTLSamplerState> native = [device newSamplerStateWithDescriptor:desc];
        if (!native) Fail("Cannot create Metal scale sampler");
        program->samplers.push_back(native);
    }
    for (const auto& pass : effect.mPasses) {
        try {
            program->passes.push_back(CompilePass(device, effect, pass));
        } catch (const std::exception& e) {
            Fail("Metal scale " + effect.mSourcePath + " pass " +
                std::to_string(ScaleSlot(pass.mId)) + ": " + e.what());
        }
    }
    return program;
}
}

struct MetalScaleLibrary::Impl {
    id<MTLDevice> device;
    std::map<const ScaleEffectRuntimeDesc*, std::unique_ptr<Program>> programs;
    std::map<std::filesystem::path, std::unique_ptr<Image>> lookups;
    explicit Impl(void* native) : device((__bridge id<MTLDevice>)native) {
        if (!device) throw std::invalid_argument("Metal scale library requires a device");
    }
    Program& Get(const ScaleEffectRuntimeDesc& effect) {
        if (auto it = programs.find(&effect); it != programs.end()) return *it->second;
        auto program = CreateProgram(device, effect);
        return *programs.emplace(&effect, std::move(program)).first->second;
    }
    Image* Lookup(const std::filesystem::path& path) {
        const auto key = std::filesystem::canonical(path);
        if (auto it = lookups.find(key); it != lookups.end()) return it->second.get();
        auto image = LoadLookup(device, key);
        return lookups.emplace(key, std::move(image)).first->second.get();
    }
};
MetalScaleLibrary::MetalScaleLibrary(void* device) : impl_(std::make_unique<Impl>(device)) {}
MetalScaleLibrary::~MetalScaleLibrary() = default;
void MetalScaleLibrary::Prepare(const ScaleEffectRuntimeDesc& effect) { impl_->Get(effect); }
MetalScaleImage MetalScaleLibrary::Lookup(const std::filesystem::path& path) { return impl_->Lookup(path)->native; }
size_t MetalScaleLibrary::ProgramCount() const { return impl_->programs.size(); }
size_t MetalScaleLibrary::LookupCount() const { return impl_->lookups.size(); }

struct MetalScalePipeline::Impl {
    struct TextureBinding {
        id<MTLTexture> texture = nil;
        uint32_t index{};
    };
    struct SamplerBinding {
        id<MTLSamplerState> sampler = nil;
        uint32_t index{};
    };
    struct Pass {
        const ProgramPass* program{};
        id<MTLBuffer> constants = nil;
        std::vector<uint32_t> constantIndices;
        std::vector<TextureBinding> textures;
        std::vector<SamplerBinding> samplers;
        MTLSize groups{};
    };
    id<MTLDevice> device;
    Image input;
    Image* output{};
    std::vector<std::unique_ptr<Image>> images;
    std::vector<Pass> passes;

    Impl(MetalScaleLibrary::Impl& library, MetalScaleImage scene,
        std::span<const MetalScaleStep> steps, uint32_t targetW, uint32_t targetH) : device(library.device) {
        if (!scene.texture || !scene.width || !scene.height || steps.empty() || !targetW || !targetH ||
            scene.width > INT_MAX || scene.height > INT_MAX || targetW > INT_MAX || targetH > INT_MAX)
            throw std::invalid_argument("Invalid Metal scale input, target or steps");
        id<MTLTexture> native = (__bridge id<MTLTexture>)scene.texture;
        if (native.device != device || native.width != scene.width || native.height != scene.height ||
            native.pixelFormat != scene.format || native.textureType != MTLTextureType2D ||
            native.sampleCount != 1 || !(native.usage & MTLTextureUsageShaderRead) ||
            native.hazardTrackingMode == MTLHazardTrackingModeUntracked)
            Fail("Metal scale borrowed texture metadata/device/usage disagrees with input contract");
        input.native = scene;
        output = &input;
        for (const auto& step : steps) {
            if (!step.effect) throw std::invalid_argument("Metal scale step has no effect");
            const auto& effect = *step.effect;
            auto& program = library.Get(effect);
            const int inW = int(output->native.width), inH = int(output->native.height);
            int outW = 0, outH = 0;
            if (!ScaleEffectSizing::ComputePipelineOutputSize({step.effect}, {step.scaling},
                inW, inH, int(targetW), int(targetH), outW, outH) || outW <= 0 || outH <= 0)
                Fail("Invalid Metal scale output dimensions: " + effect.mSourcePath);
            std::vector<Image*> textures(effect.mTextures.size());
            textures.at(ScaleSlot(effect.mInput)) = output;
            std::set<Image*> produced{output}, readOnly{output};
            for (const auto& texture : effect.mTextures) {
                if (texture.mId == effect.mInput) continue;
                Image* image;
                if (!texture.mSource.empty()) {
                    image = library.Lookup(std::filesystem::path(effect.mSourcePath).parent_path() / texture.mSource);
                    if (image->native.format != PixelFormat(texture.mFormat))
                        Fail("Metal scale DDS format disagrees with resource " + std::to_string(ScaleSlot(texture.mId)));
                    produced.insert(image);
                    readOnly.insert(image);
                } else {
                    bool widthOk = true, heightOk = true;
                    const int width = texture.mId == effect.mOutput || texture.mWidthExpr.empty() ? outW :
                        ScaleEffectSizing::EvalSizeExpr(texture.mWidthExpr, inW, inH, outW, outH, widthOk);
                    const int height = texture.mId == effect.mOutput || texture.mHeightExpr.empty() ? outH :
                        ScaleEffectSizing::EvalSizeExpr(texture.mHeightExpr, inW, inH, outW, outH, heightOk);
                    if (!widthOk || !heightOk || width <= 0 || height <= 0)
                        Fail("Invalid Metal scale intermediate size");
                    images.push_back(CreateImage(device, uint32_t(width), uint32_t(height),
                        PixelFormat(texture.mFormat), true));
                    image = images.back().get();
                }
                textures.at(ScaleSlot(texture.mId)) = image;
            }
            const auto words = ScaleEffectSizing::BuildConstants(effect, inW, inH, outW, outH);
            const size_t bytes = words.size() * sizeof(uint32_t);
            if (!bytes || bytes > device.maxBufferLength) Fail("Metal scale constants exceed device limits");
            id<MTLBuffer> buffer = [device newBufferWithBytes:words.data() length:bytes
                options:MTLResourceStorageModeShared];
            if (!buffer) Fail("Cannot create Metal scale constants");
            for (size_t p = 0; p < effect.mPasses.size(); ++p) {
                const auto& desc = effect.mPasses[p];
                Pass pass;
                pass.program = &program.passes.at(p);
                pass.constants = buffer;
                if (pass.program->constantBytes > bytes)
                    Fail("Metal scale reflected constants exceed the shared constant buffer");
                std::vector<Image*> inputs, outputs;
                const auto resolve = [&](ScaleResourceId id) {
                    if (ScaleSlot(id) >= textures.size() || !textures[ScaleSlot(id)])
                        Fail("Undeclared Metal scale resource");
                    return textures[ScaleSlot(id)];
                };
                for (const auto id : desc.mInputs) {
                    auto* image = resolve(id);
                    if (!produced.contains(image)) Fail("Metal scale pass reads unwritten resource");
                    inputs.push_back(image);
                }
                for (const auto id : desc.mOutputs) {
                    auto* image = resolve(id);
                    if (readOnly.contains(image) || std::find(inputs.begin(), inputs.end(), image) != inputs.end() ||
                        std::find(outputs.begin(), outputs.end(), image) != outputs.end())
                        Fail("Metal scale pass aliases resource");
                    outputs.push_back(image);
                }
                if (outputs.empty()) Fail("Metal scale pass has no output");
                produced.insert(outputs.begin(), outputs.end());
                const int bw = desc.mPSStyle ? 16 : desc.mBlockWidth;
                const int bh = desc.mPSStyle ? 16 : desc.mBlockHeight;
                if (bw <= 0 || bh <= 0) Fail("Invalid Metal scale block dimensions");
                pass.groups = MTLSizeMake((outputs[0]->native.width + uint32_t(bw) - 1) / uint32_t(bw),
                    (outputs[0]->native.height + uint32_t(bh) - 1) / uint32_t(bh), 1);
                for (const auto& binding : pass.program->bindings) {
                    if (binding.set == 0) {
                        pass.constantIndices.push_back(binding.metal);
                    } else if (binding.set == 3) {
                        pass.samplers.push_back({program.samplers.at(binding.slot), binding.metal});
                    } else {
                        auto* image = (binding.set == 1 ? inputs : outputs).at(binding.slot);
                        pass.textures.push_back({(__bridge id<MTLTexture>)image->native.texture, binding.metal});
                    }
                }
                passes.push_back(std::move(pass));
            }
            auto* final = textures.at(ScaleSlot(effect.mOutput));
            if (!final || !produced.contains(final) || readOnly.contains(final))
                Fail("Metal scale effect does not produce OUTPUT");
            output = final;
            if (output->native.width != uint32_t(outW) || output->native.height != uint32_t(outH))
                Fail("Metal scale OUTPUT dimensions disagree with sizing");
        }
    }
    void Record(void* native) {
        id<MTLCommandBuffer> cmd = (__bridge id<MTLCommandBuffer>)native;
        if (!cmd || cmd.device != device || cmd.status != MTLCommandBufferStatusNotEnqueued)
            throw std::invalid_argument("Metal scale Record requires an uncommitted command buffer on its device");
        for (const auto& pass : passes) {
            id<MTLComputeCommandEncoder> encoder = [cmd computeCommandEncoder];
            if (!encoder) Fail("Cannot begin Metal scale compute encoder");
            [encoder setComputePipelineState:pass.program->pipeline];
            for (const auto index : pass.constantIndices)
                [encoder setBuffer:pass.constants offset:0 atIndex:index];
            for (const auto& binding : pass.textures)
                [encoder setTexture:binding.texture atIndex:binding.index];
            for (const auto& binding : pass.samplers)
                [encoder setSamplerState:binding.sampler atIndex:binding.index];
            [encoder dispatchThreadgroups:pass.groups threadsPerThreadgroup:pass.program->threads];
            [encoder endEncoding];
        }
    }
};
MetalScalePipeline::MetalScalePipeline(MetalScaleLibrary& library, MetalScaleImage input,
    std::span<const MetalScaleStep> steps, uint32_t targetWidth, uint32_t targetHeight)
    : impl_(std::make_unique<Impl>(*library.impl_, input, steps, targetWidth, targetHeight)),
      output(impl_->output->native) {}
MetalScalePipeline::~MetalScalePipeline() = default;
void MetalScalePipeline::Record(void* commandBuffer) { impl_->Record(commandBuffer); }
size_t MetalScalePipeline::WritableImageCount() const { return impl_->images.size(); }
size_t MetalScalePipeline::PassCount() const { return impl_->passes.size(); }
}
