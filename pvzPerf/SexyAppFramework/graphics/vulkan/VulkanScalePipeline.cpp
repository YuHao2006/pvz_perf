#include "VulkanScalePipeline.h"
#include "VulkanContext.h"
#include "VulkanEffectFormats.h"
#include "VulkanScaleDds.h"
#include <algorithm>
#include <cstring>
#include <fstream>
#include <limits>
#include <map>
#include <set>
#include <stdexcept>

namespace Sexy {
namespace {
void Check(VkResult result, const char* operation) {
    if (result!=VK_SUCCESS) throw std::runtime_error(std::string(operation)+": VkResult "+std::to_string(result));
}
uint32_t MemoryType(VkPhysicalDevice physical, uint32_t mask, VkMemoryPropertyFlags flags) {
    VkPhysicalDeviceMemoryProperties memory{};
    vkGetPhysicalDeviceMemoryProperties(physical,&memory);
    for (uint32_t i=0;i<memory.memoryTypeCount;++i)
        if ((mask&(1u<<i)) && (memory.memoryTypes[i].propertyFlags&flags)==flags) return i;
    throw std::runtime_error("No Vulkan memory type for scaling resource");
}
struct Image {
    VulkanScaleImage native{};
    VkDevice device{};
    VkDeviceMemory memory{};
    VkImageLayout layout=VK_IMAGE_LAYOUT_UNDEFINED;
    VkPipelineStageFlags2 stage=VK_PIPELINE_STAGE_2_NONE;
    VkAccessFlags2 access=0;
    bool owned=false;
    ~Image() {
        if (!owned) return;
        if (native.view) vkDestroyImageView(device,native.view,nullptr);
        if (native.image) vkDestroyImage(device,native.image,nullptr);
        if (memory) vkFreeMemory(device,memory,nullptr);
    }
};
void Transition(VkCommandBuffer cmd, Image& image, VkImageLayout layout,
    VkPipelineStageFlags2 stage, VkAccessFlags2 access) {
    // Include same-layout WAW and WAR dependencies, not just layout changes.
    VkImageMemoryBarrier2 barrier{VK_STRUCTURE_TYPE_IMAGE_MEMORY_BARRIER_2};
    barrier.srcStageMask=image.stage; barrier.dstStageMask=stage;
    barrier.srcAccessMask=image.access; barrier.dstAccessMask=access;
    barrier.oldLayout=image.layout; barrier.newLayout=layout;
    barrier.srcQueueFamilyIndex=barrier.dstQueueFamilyIndex=VK_QUEUE_FAMILY_IGNORED;
    barrier.image=image.native.image;
    barrier.subresourceRange={VK_IMAGE_ASPECT_COLOR_BIT,0,1,0,1};
    VkDependencyInfo dependency{VK_STRUCTURE_TYPE_DEPENDENCY_INFO};
    dependency.imageMemoryBarrierCount=1;
    dependency.pImageMemoryBarriers=&barrier;
    VulkanContext::pipelineBarrier2(cmd,&dependency);
    image.layout=layout; image.stage=stage; image.access=access;
}
void RequireFormat(VkPhysicalDevice physical, VkFormat format, VkFormatFeatureFlags features) {
    VkFormatProperties props{};
    vkGetPhysicalDeviceFormatProperties(physical,format,&props);
    if ((props.optimalTilingFeatures&features)!=features)
        throw std::runtime_error("Vulkan GPU does not support scale texture format/features "+
            std::to_string(format)+"/"+std::to_string(features));
}
std::unique_ptr<Image> CreateImage(VulkanScaleDevice context, uint32_t w, uint32_t h,
    VkFormat format, VkImageUsageFlags usage) {
    VkPhysicalDeviceProperties props{};
    vkGetPhysicalDeviceProperties(context.physical,&props);
    if (!w || !h || w>props.limits.maxImageDimension2D || h>props.limits.maxImageDimension2D)
        throw std::runtime_error("Scale image dimensions exceed device limits");
    VkFormatFeatureFlags features=VK_FORMAT_FEATURE_SAMPLED_IMAGE_BIT;
    if (usage&VK_IMAGE_USAGE_STORAGE_BIT) features|=VK_FORMAT_FEATURE_STORAGE_IMAGE_BIT;
    if (usage&VK_IMAGE_USAGE_TRANSFER_SRC_BIT) features|=VK_FORMAT_FEATURE_TRANSFER_SRC_BIT;
    if (usage&VK_IMAGE_USAGE_TRANSFER_DST_BIT) features|=VK_FORMAT_FEATURE_TRANSFER_DST_BIT;
    RequireFormat(context.physical,format,features);
    auto result=std::make_unique<Image>();
    result->device=context.device; result->owned=true;
    result->native.format=format; result->native.width=w; result->native.height=h;
    VkImageCreateInfo info{VK_STRUCTURE_TYPE_IMAGE_CREATE_INFO};
    info.imageType=VK_IMAGE_TYPE_2D; info.format=format; info.extent={w,h,1};
    info.mipLevels=info.arrayLayers=1; info.samples=VK_SAMPLE_COUNT_1_BIT;
    info.tiling=VK_IMAGE_TILING_OPTIMAL; info.usage=usage;
    Check(vkCreateImage(context.device,&info,nullptr,&result->native.image),"create scale image");
    VkMemoryRequirements req{};
    vkGetImageMemoryRequirements(context.device,result->native.image,&req);
    VkMemoryAllocateInfo alloc{VK_STRUCTURE_TYPE_MEMORY_ALLOCATE_INFO};
    alloc.allocationSize=req.size;
    alloc.memoryTypeIndex=MemoryType(context.physical,req.memoryTypeBits,VK_MEMORY_PROPERTY_DEVICE_LOCAL_BIT);
    Check(vkAllocateMemory(context.device,&alloc,nullptr,&result->memory),"allocate scale image");
    Check(vkBindImageMemory(context.device,result->native.image,result->memory,0),"bind scale image");
    VkImageViewCreateInfo view{VK_STRUCTURE_TYPE_IMAGE_VIEW_CREATE_INFO};
    view.image=result->native.image; view.viewType=VK_IMAGE_VIEW_TYPE_2D; view.format=format;
    view.subresourceRange={VK_IMAGE_ASPECT_COLOR_BIT,0,1,0,1};
    Check(vkCreateImageView(context.device,&view,nullptr,&result->native.view),"create scale view");
    return result;
}
struct Buffer {
    VkDevice device{};
    VkBuffer buffer{};
    VkDeviceMemory memory{};
    VkDeviceSize size{};
    void* mapped{};
    ~Buffer() {
        if (mapped) vkUnmapMemory(device,memory);
        if (buffer) vkDestroyBuffer(device,buffer,nullptr);
        if (memory) vkFreeMemory(device,memory,nullptr);
    }
};
std::unique_ptr<Buffer> CreateBuffer(VulkanScaleDevice context, VkDeviceSize size, VkBufferUsageFlags usage) {
    auto result=std::make_unique<Buffer>();
    result->device=context.device; result->size=size;
    VkBufferCreateInfo info{VK_STRUCTURE_TYPE_BUFFER_CREATE_INFO};
    info.size=size; info.usage=usage;
    Check(vkCreateBuffer(context.device,&info,nullptr,&result->buffer),"create scale buffer");
    VkMemoryRequirements req{};
    vkGetBufferMemoryRequirements(context.device,result->buffer,&req);
    VkMemoryAllocateInfo alloc{VK_STRUCTURE_TYPE_MEMORY_ALLOCATE_INFO};
    alloc.allocationSize=req.size;
    alloc.memoryTypeIndex=MemoryType(context.physical,req.memoryTypeBits,
        VK_MEMORY_PROPERTY_HOST_VISIBLE_BIT|VK_MEMORY_PROPERTY_HOST_COHERENT_BIT);
    Check(vkAllocateMemory(context.device,&alloc,nullptr,&result->memory),"allocate scale buffer");
    Check(vkBindBufferMemory(context.device,result->buffer,result->memory,0),"bind scale buffer");
    Check(vkMapMemory(context.device,result->memory,0,size,0,&result->mapped),"map scale buffer");
    return result;
}
struct UploadCommands {
    VkDevice device{};
    VkCommandPool pool{};
    VkFence fence{};
    ~UploadCommands() {
        if (fence) vkDestroyFence(device,fence,nullptr);
        if (pool) vkDestroyCommandPool(device,pool,nullptr);
    }
};
std::unique_ptr<Image> LoadLookup(VulkanScaleDevice context, const std::filesystem::path& path) {
    std::ifstream stream(path,std::ios::binary|std::ios::ate);
    if (!stream) throw std::runtime_error("Cannot read scale DDS: "+path.string());
    const auto length=stream.tellg();
    if (length<0 || uint64_t(length)>std::numeric_limits<size_t>::max())
        throw std::runtime_error("Invalid scale DDS file size: "+path.string());
    std::vector<std::byte> file(static_cast<size_t>(length));
    stream.seekg(0);
    if (!stream.read(reinterpret_cast<char*>(file.data()),length))
        throw std::runtime_error("Incomplete scale DDS read: "+path.string());
    const auto dds=ParseScaleDds(file);
    auto result=CreateImage(context,dds.width,dds.height,dds.format,
        VK_IMAGE_USAGE_SAMPLED_BIT|VK_IMAGE_USAGE_TRANSFER_DST_BIT);
    auto staging=CreateBuffer(context,dds.byteSize,VK_BUFFER_USAGE_TRANSFER_SRC_BIT);
    std::memcpy(staging->mapped,file.data()+dds.pixelOffset,dds.byteSize);
    UploadCommands commands;
    commands.device=context.device;
    VkCommandPoolCreateInfo pool{VK_STRUCTURE_TYPE_COMMAND_POOL_CREATE_INFO};
    pool.queueFamilyIndex=context.queueFamily; pool.flags=VK_COMMAND_POOL_CREATE_TRANSIENT_BIT;
    Check(vkCreateCommandPool(context.device,&pool,nullptr,&commands.pool),"create scale upload pool");
    VkCommandBufferAllocateInfo alloc{VK_STRUCTURE_TYPE_COMMAND_BUFFER_ALLOCATE_INFO};
    alloc.commandPool=commands.pool; alloc.level=VK_COMMAND_BUFFER_LEVEL_PRIMARY; alloc.commandBufferCount=1;
    VkCommandBuffer cmd{};
    Check(vkAllocateCommandBuffers(context.device,&alloc,&cmd),"allocate scale upload command");
    VkCommandBufferBeginInfo begin{VK_STRUCTURE_TYPE_COMMAND_BUFFER_BEGIN_INFO};
    begin.flags=VK_COMMAND_BUFFER_USAGE_ONE_TIME_SUBMIT_BIT;
    Check(vkBeginCommandBuffer(cmd,&begin),"begin scale upload");
    Transition(cmd,*result,VK_IMAGE_LAYOUT_TRANSFER_DST_OPTIMAL,VK_PIPELINE_STAGE_TRANSFER_BIT,VK_ACCESS_TRANSFER_WRITE_BIT);
    VkBufferImageCopy copy{};
    copy.imageSubresource={VK_IMAGE_ASPECT_COLOR_BIT,0,0,1};
    copy.imageExtent={dds.width,dds.height,1};
    vkCmdCopyBufferToImage(cmd,staging->buffer,result->native.image,VK_IMAGE_LAYOUT_TRANSFER_DST_OPTIMAL,1,&copy);
    Transition(cmd,*result,VK_IMAGE_LAYOUT_SHADER_READ_ONLY_OPTIMAL,VK_PIPELINE_STAGE_COMPUTE_SHADER_BIT,VK_ACCESS_SHADER_READ_BIT);
    Check(vkEndCommandBuffer(cmd),"end scale upload");
    VkFenceCreateInfo fence{VK_STRUCTURE_TYPE_FENCE_CREATE_INFO};
    Check(vkCreateFence(context.device,&fence,nullptr,&commands.fence),"create scale upload fence");
    VkCommandBufferSubmitInfo command{VK_STRUCTURE_TYPE_COMMAND_BUFFER_SUBMIT_INFO};
    command.commandBuffer=cmd;
    VkSubmitInfo2 submit{VK_STRUCTURE_TYPE_SUBMIT_INFO_2};
    submit.commandBufferInfoCount=1; submit.pCommandBufferInfos=&command;
    Check(VulkanContext::queueSubmit2(context.queue,1,&submit,commands.fence),"submit scale upload");
    Check(vkWaitForFences(context.device,1,&commands.fence,VK_TRUE,UINT64_MAX),"wait scale upload");
    return result; // CPU file/staging released only after upload completion.
}
struct DescriptorPool {
    VkDevice device{};
    VkDescriptorPool pool{};
    ~DescriptorPool() { if (pool) vkDestroyDescriptorPool(device,pool,nullptr); }
};
}
struct VulkanScaleLibrary::Impl {
    VulkanScaleDevice context;
    VulkanEffectPrograms programs;
    std::map<std::filesystem::path,std::unique_ptr<Image>> lookups;
    explicit Impl(VulkanScaleDevice c) : context(c), programs(c.device) {}
    Image* Lookup(const std::filesystem::path& path) {
        const auto key=std::filesystem::canonical(path);
        if (auto found=lookups.find(key);found!=lookups.end()) return found->second.get();
        auto image=LoadLookup(context,key);
        return lookups.emplace(key,std::move(image)).first->second.get();
    }
};
VulkanScaleLibrary::VulkanScaleLibrary(VulkanScaleDevice device) : impl_(std::make_unique<Impl>(device)) {}
VulkanScaleLibrary::~VulkanScaleLibrary()=default;
const VulkanEffectProgram& VulkanScaleLibrary::Program(const ScaleEffectRuntimeDesc& effect) { return impl_->programs.Get(effect); }
VulkanScaleImage VulkanScaleLibrary::Lookup(const std::filesystem::path& path) { return impl_->Lookup(path)->native; }
size_t VulkanScaleLibrary::ProgramCount() const { return impl_->programs.Size(); }
size_t VulkanScaleLibrary::LookupCount() const { return impl_->lookups.size(); }

struct VulkanScalePipeline::Impl {
    struct Pass {
        const VulkanEffectProgram::Pass* program{};
        std::array<VkDescriptorSet,4> sets{};
        std::vector<Image*> inputs, outputs;
        uint32_t groupsX{}, groupsY{};
    };
    VulkanScaleDevice context;
    Image input;
    Image* output{};
    std::vector<std::unique_ptr<Image>> images;
    std::vector<std::unique_ptr<Buffer>> constants;
    DescriptorPool descriptors;
    std::vector<Pass> passes;

    Impl(VulkanScaleLibrary::Impl& library, VulkanScaleImage scene,
        std::span<const VulkanScaleStep> steps, uint32_t targetW, uint32_t targetH) : context(library.context) {
        if (!scene.image || !scene.view || !scene.width || !scene.height || steps.empty() ||
            !targetW || !targetH || scene.width>INT32_MAX || scene.height>INT32_MAX ||
            targetW>INT32_MAX || targetH>INT32_MAX)
            throw std::invalid_argument("Invalid scale pipeline input, target or steps"
                " (image="+std::to_string(uintptr_t(scene.image))+" view="+std::to_string(uintptr_t(scene.view))+
                " scene="+std::to_string(scene.width)+"x"+std::to_string(scene.height)+
                " target="+std::to_string(targetW)+"x"+std::to_string(targetH)+
                " steps="+std::to_string(steps.size())+")");
        input.native=scene; output=&input;
        VkPhysicalDeviceProperties deviceProps{};
        vkGetPhysicalDeviceProperties(context.physical,&deviceProps);
        std::array<uint32_t,4> counts{};
        for (const auto& step:steps) {
            std::string error;
            if (!step.effect || !ScaleEffectBinary::Validate(*step.effect,error))
                throw std::invalid_argument("Scale step has no valid numeric program: "+error);
            for (const auto& pass:step.effect->mPasses) {
                ++counts[0]; counts[1]+=uint32_t(pass.mInputs.size());
                counts[2]+=uint32_t(pass.mOutputs.size()); counts[3]+=uint32_t(step.effect->mSamplers.size());
            }
        }
        static constexpr VkDescriptorType types[]={VK_DESCRIPTOR_TYPE_UNIFORM_BUFFER,VK_DESCRIPTOR_TYPE_SAMPLED_IMAGE,
            VK_DESCRIPTOR_TYPE_STORAGE_IMAGE,VK_DESCRIPTOR_TYPE_SAMPLER};
        std::vector<VkDescriptorPoolSize> sizes;
        for (size_t i=0;i<4;++i) if (counts[i]) sizes.push_back({types[i],counts[i]});
        descriptors.device=context.device;
        VkDescriptorPoolCreateInfo pool{VK_STRUCTURE_TYPE_DESCRIPTOR_POOL_CREATE_INFO};
        pool.maxSets=counts[0]*4; pool.poolSizeCount=uint32_t(sizes.size()); pool.pPoolSizes=sizes.data();
        Check(vkCreateDescriptorPool(context.device,&pool,nullptr,&descriptors.pool),"create scale descriptors");

        for (const auto& step:steps) {
            const auto& effect=*step.effect;
            const auto& program=library.programs.Get(effect);
            const int inW=int(output->native.width),inH=int(output->native.height);
            int outW=0,outH=0;
            if (!ScaleEffectSizing::ComputePipelineOutputSize({step.effect},{step.scaling},inW,inH,
                int(targetW),int(targetH),outW,outH) || outW<=0 || outH<=0)
                throw std::runtime_error("Invalid scale output dimensions for "+effect.mSourcePath);
            std::vector<Image*> textures(effect.mTextures.size());
            textures[ScaleSlot(effect.mInput)]=output;
            std::set<Image*> produced{output},readOnly{output};
            const bool linear=std::any_of(effect.mSamplers.begin(),effect.mSamplers.end(),
                [](const auto& sampler){ return sampler.mFilter==VK_FILTER_LINEAR; });
            for (const auto& texture:effect.mTextures) {
                if (texture.mId==effect.mInput) continue;
                Image* image=nullptr;
                if (!texture.mSource.empty()) {
                    image=library.Lookup(std::filesystem::path(effect.mSourcePath).parent_path()/texture.mSource);
                    if (image->native.format!=texture.mFormat)
                        throw std::runtime_error("DDS format disagrees with resource "+std::to_string(ScaleSlot(texture.mId)));
                    produced.insert(image); readOnly.insert(image);
                } else {
                    bool wOk=true,hOk=true;
                    const int w=(texture.mId==effect.mOutput || texture.mWidthExpr.empty())?outW:
                        ScaleEffectSizing::EvalSizeExpr(texture.mWidthExpr,inW,inH,outW,outH,wOk);
                    const int h=(texture.mId==effect.mOutput || texture.mHeightExpr.empty())?outH:
                        ScaleEffectSizing::EvalSizeExpr(texture.mHeightExpr,inW,inH,outW,outH,hOk);
                    if (!wOk || !hOk || w<=0 || h<=0) throw std::runtime_error("Invalid scale intermediate size");
                    images.push_back(CreateImage(context,uint32_t(w),uint32_t(h),static_cast<VkFormat>(texture.mFormat),
                        VK_IMAGE_USAGE_STORAGE_BIT|VK_IMAGE_USAGE_SAMPLED_BIT|VK_IMAGE_USAGE_TRANSFER_SRC_BIT));
                    image=images.back().get();
                }
                textures[ScaleSlot(texture.mId)]=image;
            }
            const auto words=ScaleEffectSizing::BuildConstants(effect,inW,inH,outW,outH);
            if (words.size()*4>deviceProps.limits.maxUniformBufferRange)
                throw std::runtime_error("Scale constants exceed device limits");
            constants.push_back(CreateBuffer(context,words.size()*4,VK_BUFFER_USAGE_UNIFORM_BUFFER_BIT));
            auto& buffer=*constants.back();
            std::memcpy(buffer.mapped,words.data(),words.size()*4);
            const VkDescriptorBufferInfo ubo{buffer.buffer,0,buffer.size};
            for (size_t p=0;p<effect.mPasses.size();++p) {
                const auto& desc=effect.mPasses[p];
                Pass pass;
                pass.program=&program.passes_.at(p);
                const auto resolve=[&](ScaleResourceId id) {
                    if (ScaleSlot(id)>=textures.size() || !textures[ScaleSlot(id)])
                        throw std::runtime_error("Undeclared scale resource "+std::to_string(ScaleSlot(id)));
                    return textures[ScaleSlot(id)];
                };
                for (const auto id:desc.mInputs) {
                    auto* image=resolve(id);
                    if (!produced.contains(image)) throw std::runtime_error("Scale pass reads unwritten resource "+std::to_string(ScaleSlot(id)));
                    if (linear) RequireFormat(context.physical,image->native.format,VK_FORMAT_FEATURE_SAMPLED_IMAGE_FILTER_LINEAR_BIT);
                    pass.inputs.push_back(image);
                }
                for (const auto id:desc.mOutputs) {
                    auto* image=resolve(id);
                    if (readOnly.contains(image) || std::find(pass.inputs.begin(),pass.inputs.end(),image)!=pass.inputs.end() ||
                        std::find(pass.outputs.begin(),pass.outputs.end(),image)!=pass.outputs.end())
                        throw std::runtime_error("Scale pass aliases resource "+std::to_string(ScaleSlot(id)));
                    pass.outputs.push_back(image); produced.insert(image);
                }
                if (pass.outputs.empty()) throw std::runtime_error("Scale pass has no output");
                const int bw=desc.mPSStyle?16:desc.mBlockWidth,bh=desc.mPSStyle?16:desc.mBlockHeight;
                if (bw<=0 || bh<=0) throw std::runtime_error("Invalid scale block size");
                pass.groupsX=(pass.outputs[0]->native.width+uint32_t(bw)-1)/uint32_t(bw);
                pass.groupsY=(pass.outputs[0]->native.height+uint32_t(bh)-1)/uint32_t(bh);
                if (pass.groupsX>deviceProps.limits.maxComputeWorkGroupCount[0] ||
                    pass.groupsY>deviceProps.limits.maxComputeWorkGroupCount[1])
                    throw std::runtime_error("Scale dispatch exceeds device limits");
                VkDescriptorSetAllocateInfo allocate{VK_STRUCTURE_TYPE_DESCRIPTOR_SET_ALLOCATE_INFO};
                allocate.descriptorPool=descriptors.pool; allocate.descriptorSetCount=4;
                allocate.pSetLayouts=pass.program->sets.data();
                Check(vkAllocateDescriptorSets(context.device,&allocate,pass.sets.data()),"allocate scale sets");
                VkWriteDescriptorSet write{VK_STRUCTURE_TYPE_WRITE_DESCRIPTOR_SET};
                write.dstSet=pass.sets[0]; write.descriptorCount=1;
                write.descriptorType=VK_DESCRIPTOR_TYPE_UNIFORM_BUFFER; write.pBufferInfo=&ubo;
                vkUpdateDescriptorSets(context.device,1,&write,0,nullptr);
                write.pBufferInfo=nullptr;
                for (uint32_t set=1;set<=3;++set) {
                    const size_t count=set==1?pass.inputs.size():(set==2?pass.outputs.size():program.samplers_.size());
                    for (uint32_t binding=0;binding<count;++binding) {
                        VkDescriptorImageInfo image{};
                        if (set==3) image.sampler=program.samplers_[binding];
                        else {
                            image.imageView=(set==1?pass.inputs:pass.outputs)[binding]->native.view;
                            image.imageLayout=set==1?VK_IMAGE_LAYOUT_SHADER_READ_ONLY_OPTIMAL:VK_IMAGE_LAYOUT_GENERAL;
                        }
                        write.dstSet=pass.sets[set]; write.dstBinding=binding;
                        write.descriptorType=types[set]; write.pImageInfo=&image;
                        vkUpdateDescriptorSets(context.device,1,&write,0,nullptr);
                    }
                }
                passes.push_back(std::move(pass));
            }
            auto* final=textures[ScaleSlot(effect.mOutput)];
            if (!final || !produced.contains(final) || readOnly.contains(final))
                throw std::runtime_error("Scale effect does not produce its output resource");
            output=final;
            if (output->native.width!=uint32_t(outW) || output->native.height!=uint32_t(outH))
                throw std::runtime_error("Scale OUTPUT dimensions disagree with effect sizing");
        }
    }
    void Record(VkCommandBuffer cmd, VkImageLayout layout, VkPipelineStageFlags stage, VkAccessFlags access) {
        input.layout=layout; input.stage=stage; input.access=access;
        // Even an effect that does not sample INPUT must return the borrowed
        // scene in the documented layout for the next game render pass.
        Transition(cmd,input,VK_IMAGE_LAYOUT_SHADER_READ_ONLY_OPTIMAL,
            VK_PIPELINE_STAGE_COMPUTE_SHADER_BIT,VK_ACCESS_SHADER_READ_BIT);
        for (const auto& pass:passes) {
            for (auto* image:pass.inputs) Transition(cmd,*image,VK_IMAGE_LAYOUT_SHADER_READ_ONLY_OPTIMAL,
                VK_PIPELINE_STAGE_COMPUTE_SHADER_BIT,VK_ACCESS_SHADER_READ_BIT);
            for (auto* image:pass.outputs) Transition(cmd,*image,VK_IMAGE_LAYOUT_GENERAL,
                VK_PIPELINE_STAGE_COMPUTE_SHADER_BIT,VK_ACCESS_SHADER_WRITE_BIT);
            vkCmdBindPipeline(cmd,VK_PIPELINE_BIND_POINT_COMPUTE,pass.program->pipeline);
            vkCmdBindDescriptorSets(cmd,VK_PIPELINE_BIND_POINT_COMPUTE,pass.program->layout,0,4,pass.sets.data(),0,nullptr);
            vkCmdDispatch(cmd,pass.groupsX,pass.groupsY,1);
        }
        Transition(cmd,*output,VK_IMAGE_LAYOUT_SHADER_READ_ONLY_OPTIMAL,
            VK_PIPELINE_STAGE_COMPUTE_SHADER_BIT|VK_PIPELINE_STAGE_FRAGMENT_SHADER_BIT,VK_ACCESS_SHADER_READ_BIT);
    }
};
VulkanScalePipeline::VulkanScalePipeline(VulkanScaleLibrary& library,VulkanScaleImage input,
    std::span<const VulkanScaleStep> steps,uint32_t targetW,uint32_t targetH)
    : impl_(std::make_unique<Impl>(*library.impl_,input,steps,targetW,targetH)),
      output(impl_->output->native) {}
VulkanScalePipeline::~VulkanScalePipeline()=default;
void VulkanScalePipeline::Record(VkCommandBuffer cmd,VkImageLayout layout,VkPipelineStageFlags stage,VkAccessFlags access) {
    impl_->Record(cmd,layout,stage,access);
}
size_t VulkanScalePipeline::WritableImageCount() const { return impl_->images.size(); }
size_t VulkanScalePipeline::PassCount() const { return impl_->passes.size(); }
}
