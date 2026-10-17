#include "VulkanEffectPrograms.h"
#include <stdexcept>
#include <string>
#include <bit>

namespace Sexy {
namespace {
void Check(VkResult result,const char* name) {
    if(result!=VK_SUCCESS) throw std::runtime_error(std::string(name)+": "+std::to_string(result));
}
}
VulkanEffectPrograms::VulkanEffectPrograms(VkDevice device):device_(device) {
    VkPipelineCacheCreateInfo info{VK_STRUCTURE_TYPE_PIPELINE_CACHE_CREATE_INFO};
    Check(vkCreatePipelineCache(device_,&info,nullptr,&cache_),"Create effect pipeline cache");
}
VulkanEffectPrograms::~VulkanEffectPrograms() {
    effects_.clear();
    if(cache_) vkDestroyPipelineCache(device_,cache_,nullptr);
}
const VulkanEffectProgram& VulkanEffectPrograms::Get(const ScaleEffectRuntimeDesc& effect) {
    const auto found=effects_.find(&effect);
    if(found!=effects_.end()) return *found->second;
    auto program=std::unique_ptr<VulkanEffectProgram>(new VulkanEffectProgram(device_,cache_,effect));
    auto [entry,inserted]=effects_.emplace(&effect,std::move(program));
    return *entry->second;
}
VulkanEffectProgram::VulkanEffectProgram(VkDevice device,VkPipelineCache cache,const ScaleEffectRuntimeDesc& effect)
    :device_(device) {
    try {
        std::string error;
        if(!ScaleEffectBinary::Validate(effect,error)) throw std::runtime_error(error);
        std::vector<VkSpecializationMapEntry> entries;
        std::vector<uint32_t> values;
        for(const auto& param:effect.mParams) {
            entries.push_back({uint32_t(ScaleSlot(param.mId)),uint32_t(values.size()*4),4});
            values.push_back(param.mIsInt ? std::bit_cast<uint32_t>(int32_t(param.mInlineValue)) :
                std::bit_cast<uint32_t>(param.mInlineValue));
        }
        const VkSpecializationInfo specialization{uint32_t(entries.size()),entries.data(),values.size()*4,values.data()};
        for(const auto& sampler:effect.mSamplers) {
            VkSamplerCreateInfo info{VK_STRUCTURE_TYPE_SAMPLER_CREATE_INFO};
            info.magFilter=info.minFilter=static_cast<VkFilter>(sampler.mFilter);
            info.mipmapMode=VK_SAMPLER_MIPMAP_MODE_NEAREST;
            info.addressModeU=info.addressModeV=info.addressModeW=static_cast<VkSamplerAddressMode>(sampler.mAddress);
            info.borderColor=VK_BORDER_COLOR_FLOAT_TRANSPARENT_BLACK;
            VkSampler handle{};
            Check(vkCreateSampler(device_,&info,nullptr,&handle),"Create effect sampler");
            samplers_.push_back(handle);
        }
        passes_.resize(effect.mPasses.size());
        for(size_t i=0;i<passes_.size();++i) {
            auto& pass=passes_[i];
            const auto& metadata=effect.mPasses[i];
            const uint32_t counts[]={1,uint32_t(metadata.mInputs.size()),
                uint32_t(metadata.mOutputs.size()),uint32_t(samplers_.size())};
            const VkDescriptorType types[]={VK_DESCRIPTOR_TYPE_UNIFORM_BUFFER,
                VK_DESCRIPTOR_TYPE_SAMPLED_IMAGE,VK_DESCRIPTOR_TYPE_STORAGE_IMAGE,VK_DESCRIPTOR_TYPE_SAMPLER};
            for(uint32_t set=0;set<4;++set) {
                std::vector<VkDescriptorSetLayoutBinding> bindings(counts[set]);
                for(uint32_t j=0;j<counts[set];++j) {
                    bindings[j].binding=j;
                    bindings[j].descriptorType=types[set];
                    bindings[j].descriptorCount=1;
                    bindings[j].stageFlags=VK_SHADER_STAGE_COMPUTE_BIT;
                }
                VkDescriptorSetLayoutCreateInfo info{VK_STRUCTURE_TYPE_DESCRIPTOR_SET_LAYOUT_CREATE_INFO};
                info.bindingCount=counts[set];
                info.pBindings=bindings.data();
                Check(vkCreateDescriptorSetLayout(device_,&info,nullptr,&pass.sets[set]),"Create effect bindings");
            }
            VkPipelineLayoutCreateInfo layout{VK_STRUCTURE_TYPE_PIPELINE_LAYOUT_CREATE_INFO};
            layout.setLayoutCount=4;
            layout.pSetLayouts=pass.sets.data();
            Check(vkCreatePipelineLayout(device_,&layout,nullptr,&pass.layout),"Create effect pipeline layout");
            const auto& words=metadata.mSpirv;
            if(words.size()<5 || words[0]!=0x07230203u)
                throw std::runtime_error("Effect contains non-SPIR-V shader");
            VkShaderModuleCreateInfo moduleInfo{VK_STRUCTURE_TYPE_SHADER_MODULE_CREATE_INFO};
            moduleInfo.codeSize=words.size()*sizeof(uint32_t);
            moduleInfo.pCode=words.data();
            VkShaderModule module{};
            Check(vkCreateShaderModule(device_,&moduleInfo,nullptr,&module),"Create effect shader module");
            VkComputePipelineCreateInfo pipeline{VK_STRUCTURE_TYPE_COMPUTE_PIPELINE_CREATE_INFO};
            pipeline.stage.sType=VK_STRUCTURE_TYPE_PIPELINE_SHADER_STAGE_CREATE_INFO;
            pipeline.stage.stage=VK_SHADER_STAGE_COMPUTE_BIT;
            pipeline.stage.module=module;
            pipeline.stage.pName="__M"; // Required SPIR-V entry-point protocol.
            pipeline.stage.pSpecializationInfo=entries.empty()?nullptr:&specialization;
            pipeline.layout=pass.layout;
            const auto result=vkCreateComputePipelines(device_,cache,1,&pipeline,nullptr,&pass.pipeline);
            vkDestroyShaderModule(device_,module,nullptr);
            Check(result,"Create native effect compute pipeline");
        }
    } catch(...) {
        Release(); // cleanup only; the original failure remains visible
        throw;
    }
}
void VulkanEffectProgram::Release() noexcept {
    for(auto& pass:passes_) {
        if(pass.pipeline) vkDestroyPipeline(device_,pass.pipeline,nullptr);
        if(pass.layout) vkDestroyPipelineLayout(device_,pass.layout,nullptr);
        for(auto set:pass.sets) if(set) vkDestroyDescriptorSetLayout(device_,set,nullptr);
    }
    passes_.clear();
    for(auto sampler:samplers_) vkDestroySampler(device_,sampler,nullptr);
    samplers_.clear();
}
VulkanEffectProgram::~VulkanEffectProgram() { Release(); }
}
