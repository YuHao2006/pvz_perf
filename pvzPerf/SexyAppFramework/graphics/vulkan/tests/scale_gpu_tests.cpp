#include "VulkanEffectPrograms.h"
#include "TestWin32Window.h"
#include <atomic>
#include <bit>
#include <cstring>
#include <filesystem>
#include <iostream>
#include <stdexcept>

namespace Sexy {
const char* GetLogFilePathC(const char* name) {
    static thread_local std::string path;
    std::filesystem::create_directories("scale-gpu-output");
    path=std::string("scale-gpu-output/")+name;
    return path.c_str();
}
}
namespace {
std::atomic_uint errors=0;
VkBool32 VKAPI_CALL Validate(VkDebugUtilsMessageSeverityFlagBitsEXT severity,
    VkDebugUtilsMessageTypeFlagsEXT types,const VkDebugUtilsMessengerCallbackDataEXT* data,void* user) {
    if(severity>=VK_DEBUG_UTILS_MESSAGE_SEVERITY_ERROR_BIT_EXT) ++errors;
    return VulkanInitConfig::DefaultDebugCallback(severity,types,data,user);
}
void Require(bool ok,const char* message) { if(!ok) throw std::runtime_error(message); }
void Check(VkResult result) { if(result!=VK_SUCCESS) throw std::runtime_error("Vulkan result "+std::to_string(result)); }
uint32_t MemoryType(uint32_t mask,VkMemoryPropertyFlags flags) {
    VkPhysicalDeviceMemoryProperties props;
    vkGetPhysicalDeviceMemoryProperties(VulkanContext::physicalDevice,&props);
    for(uint32_t i=0;i<props.memoryTypeCount;++i)
        if((mask&(1u<<i)) && (props.memoryTypes[i].propertyFlags&flags)==flags) return i;
    throw std::runtime_error("No memory type");
}
struct Buffer {
    VkDevice d=VulkanContext::device;
    VkBuffer buffer{};
    VkDeviceMemory memory{};
    void* mapped{};
    Buffer(VkDeviceSize bytes,VkBufferUsageFlags usage) {
        VkBufferCreateInfo info{VK_STRUCTURE_TYPE_BUFFER_CREATE_INFO};
        info.size=bytes; info.usage=usage;
        Check(vkCreateBuffer(d,&info,nullptr,&buffer));
        VkMemoryRequirements requirements;
        vkGetBufferMemoryRequirements(d,buffer,&requirements);
        VkMemoryAllocateInfo alloc{VK_STRUCTURE_TYPE_MEMORY_ALLOCATE_INFO};
        alloc.allocationSize=requirements.size;
        alloc.memoryTypeIndex=MemoryType(requirements.memoryTypeBits,
            VK_MEMORY_PROPERTY_HOST_VISIBLE_BIT|VK_MEMORY_PROPERTY_HOST_COHERENT_BIT);
        Check(vkAllocateMemory(d,&alloc,nullptr,&memory));
        Check(vkBindBufferMemory(d,buffer,memory,0));
        Check(vkMapMemory(d,memory,0,bytes,0,&mapped));
    }
    ~Buffer() {
        if(mapped) vkUnmapMemory(d,memory);
        if(buffer) vkDestroyBuffer(d,buffer,nullptr);
        if(memory) vkFreeMemory(d,memory,nullptr);
    }
};
struct Resources {
    VkDevice d=VulkanContext::device;
    VkImage image{}; VkImageView view{}; VkDeviceMemory memory{};
    VkDescriptorPool descriptors{}; VkCommandPool commands{}; VkFence fence{};
    ~Resources() {
        vkDeviceWaitIdle(d);
        if(fence) vkDestroyFence(d,fence,nullptr);
        if(commands) vkDestroyCommandPool(d,commands,nullptr);
        if(descriptors) vkDestroyDescriptorPool(d,descriptors,nullptr);
        if(view) vkDestroyImageView(d,view,nullptr);
        if(image) vkDestroyImage(d,image,nullptr);
        if(memory) vkFreeMemory(d,memory,nullptr);
    }
};
void RunNearest(VulkanContext& window,const Sexy::VulkanEffectProgram& program,uint32_t width,uint32_t height) {
    const uint32_t source[]={0xff0000ff,0xff00ff00,0xffff0000,0xffffffff};
    // Primary colours are identical in UNORM/sRGB; the scene renderer's UNORM
    // path has separate pixel tests. This test exercises native compute dispatch.
    Resources input;
    Resources r;
    const auto d=window.device;
    VkImageCreateInfo image{VK_STRUCTURE_TYPE_IMAGE_CREATE_INFO};
    image.imageType=VK_IMAGE_TYPE_2D; image.format=VK_FORMAT_R8G8B8A8_UNORM;
    image.extent={width,height,1}; image.mipLevels=image.arrayLayers=1;
    image.samples=VK_SAMPLE_COUNT_1_BIT; image.tiling=VK_IMAGE_TILING_OPTIMAL;
    image.usage=VK_IMAGE_USAGE_STORAGE_BIT|VK_IMAGE_USAGE_TRANSFER_SRC_BIT;
    Check(vkCreateImage(d,&image,nullptr,&r.image));
    VkMemoryRequirements req; vkGetImageMemoryRequirements(d,r.image,&req);
    VkMemoryAllocateInfo alloc{VK_STRUCTURE_TYPE_MEMORY_ALLOCATE_INFO};
    alloc.allocationSize=req.size; alloc.memoryTypeIndex=MemoryType(req.memoryTypeBits,VK_MEMORY_PROPERTY_DEVICE_LOCAL_BIT);
    Check(vkAllocateMemory(d,&alloc,nullptr,&r.memory));
    Check(vkBindImageMemory(d,r.image,r.memory,0));
    VkImageViewCreateInfo view{VK_STRUCTURE_TYPE_IMAGE_VIEW_CREATE_INFO};
    view.image=r.image; view.viewType=VK_IMAGE_VIEW_TYPE_2D; view.format=image.format;
    view.subresourceRange={VK_IMAGE_ASPECT_COLOR_BIT,0,1,0,1};
    Check(vkCreateImageView(d,&view,nullptr,&r.view));
    image.extent={2,2,1};
    image.usage=VK_IMAGE_USAGE_SAMPLED_BIT|VK_IMAGE_USAGE_TRANSFER_DST_BIT;
    Check(vkCreateImage(d,&image,nullptr,&input.image));
    vkGetImageMemoryRequirements(d,input.image,&req);
    alloc.allocationSize=req.size;
    alloc.memoryTypeIndex=MemoryType(req.memoryTypeBits,VK_MEMORY_PROPERTY_DEVICE_LOCAL_BIT);
    Check(vkAllocateMemory(d,&alloc,nullptr,&input.memory));
    Check(vkBindImageMemory(d,input.image,input.memory,0));
    view.image=input.image;
    Check(vkCreateImageView(d,&view,nullptr,&input.view));
    Buffer upload(sizeof(source),VK_BUFFER_USAGE_TRANSFER_SRC_BIT);
    std::memcpy(upload.mapped,source,sizeof(source));
    Buffer constants(48,VK_BUFFER_USAGE_UNIFORM_BUFFER_BIT);
    Buffer output(VkDeviceSize(width)*height*4,VK_BUFFER_USAGE_TRANSFER_DST_BIT);
    const uint32_t data[]={2,2,width,height,std::bit_cast<uint32_t>(0.5f),std::bit_cast<uint32_t>(0.5f),
        std::bit_cast<uint32_t>(1.0f/width),std::bit_cast<uint32_t>(1.0f/height),
        std::bit_cast<uint32_t>(width/2.0f),std::bit_cast<uint32_t>(height/2.0f),0,0};
    std::memcpy(constants.mapped,data,sizeof(data));
    const VkDescriptorPoolSize sizes[]={{VK_DESCRIPTOR_TYPE_UNIFORM_BUFFER,1},
        {VK_DESCRIPTOR_TYPE_SAMPLED_IMAGE,1},{VK_DESCRIPTOR_TYPE_STORAGE_IMAGE,1},{VK_DESCRIPTOR_TYPE_SAMPLER,1}};
    VkDescriptorPoolCreateInfo pool{VK_STRUCTURE_TYPE_DESCRIPTOR_POOL_CREATE_INFO};
    pool.maxSets=4; pool.poolSizeCount=4; pool.pPoolSizes=sizes;
    Check(vkCreateDescriptorPool(d,&pool,nullptr,&r.descriptors));
    const auto& pass=program.passes_.at(0);
    VkDescriptorSet sets[4];
    VkDescriptorSetAllocateInfo setAlloc{VK_STRUCTURE_TYPE_DESCRIPTOR_SET_ALLOCATE_INFO};
    setAlloc.descriptorPool=r.descriptors; setAlloc.descriptorSetCount=4; setAlloc.pSetLayouts=pass.sets.data();
    Check(vkAllocateDescriptorSets(d,&setAlloc,sets));
    VkDescriptorBufferInfo buffer{constants.buffer,0,48};
    const VkDescriptorImageInfo images[]={{VK_NULL_HANDLE,input.view,VK_IMAGE_LAYOUT_SHADER_READ_ONLY_OPTIMAL},
        {VK_NULL_HANDLE,r.view,VK_IMAGE_LAYOUT_GENERAL},
        {program.samplers_.at(0),VK_NULL_HANDLE,VK_IMAGE_LAYOUT_UNDEFINED}};
    VkWriteDescriptorSet writes[4]{};
    for(uint32_t i=0;i<4;++i) {
        writes[i].sType=VK_STRUCTURE_TYPE_WRITE_DESCRIPTOR_SET;
        writes[i].dstSet=sets[i]; writes[i].descriptorCount=1; writes[i].descriptorType=sizes[i].type;
        if(i==0) writes[i].pBufferInfo=&buffer; else writes[i].pImageInfo=&images[i-1];
    }
    vkUpdateDescriptorSets(d,4,writes,0,nullptr);
    VkCommandPoolCreateInfo cmdPool{VK_STRUCTURE_TYPE_COMMAND_POOL_CREATE_INFO};
    cmdPool.queueFamilyIndex=window.graphicsFamily;
    Check(vkCreateCommandPool(d,&cmdPool,nullptr,&r.commands));
    VkCommandBufferAllocateInfo cmdAlloc{VK_STRUCTURE_TYPE_COMMAND_BUFFER_ALLOCATE_INFO};
    cmdAlloc.commandPool=r.commands; cmdAlloc.level=VK_COMMAND_BUFFER_LEVEL_PRIMARY; cmdAlloc.commandBufferCount=1;
    VkCommandBuffer cmd; Check(vkAllocateCommandBuffers(d,&cmdAlloc,&cmd));
    VkCommandBufferBeginInfo begin{VK_STRUCTURE_TYPE_COMMAND_BUFFER_BEGIN_INFO};
    Check(vkBeginCommandBuffer(cmd,&begin));
    VkImageMemoryBarrier barriers[2]{};
    for(auto& barrier:barriers) {
        barrier.sType=VK_STRUCTURE_TYPE_IMAGE_MEMORY_BARRIER;
        barrier.srcQueueFamilyIndex=barrier.dstQueueFamilyIndex=VK_QUEUE_FAMILY_IGNORED;
        barrier.subresourceRange={VK_IMAGE_ASPECT_COLOR_BIT,0,1,0,1};
    }
    barriers[0].image=input.image;
    barriers[0].newLayout=VK_IMAGE_LAYOUT_TRANSFER_DST_OPTIMAL;
    barriers[0].dstAccessMask=VK_ACCESS_TRANSFER_WRITE_BIT;
    vkCmdPipelineBarrier(cmd,VK_PIPELINE_STAGE_TOP_OF_PIPE_BIT,VK_PIPELINE_STAGE_TRANSFER_BIT,0,
        0,nullptr,0,nullptr,1,barriers);
    VkBufferImageCopy inputCopy{};
    inputCopy.imageSubresource={VK_IMAGE_ASPECT_COLOR_BIT,0,0,1};
    inputCopy.imageExtent={2,2,1};
    vkCmdCopyBufferToImage(cmd,upload.buffer,input.image,VK_IMAGE_LAYOUT_TRANSFER_DST_OPTIMAL,1,&inputCopy);
    barriers[0].oldLayout=VK_IMAGE_LAYOUT_TRANSFER_DST_OPTIMAL;
    barriers[0].newLayout=VK_IMAGE_LAYOUT_SHADER_READ_ONLY_OPTIMAL;
    barriers[0].srcAccessMask=VK_ACCESS_TRANSFER_WRITE_BIT; barriers[0].dstAccessMask=VK_ACCESS_SHADER_READ_BIT;
    barriers[1].image=r.image; barriers[1].newLayout=VK_IMAGE_LAYOUT_GENERAL;
    barriers[1].dstAccessMask=VK_ACCESS_SHADER_WRITE_BIT;
    vkCmdPipelineBarrier(cmd,VK_PIPELINE_STAGE_TRANSFER_BIT,VK_PIPELINE_STAGE_COMPUTE_SHADER_BIT,0,
        0,nullptr,0,nullptr,2,barriers);
    vkCmdBindPipeline(cmd,VK_PIPELINE_BIND_POINT_COMPUTE,pass.pipeline);
    vkCmdBindDescriptorSets(cmd,VK_PIPELINE_BIND_POINT_COMPUTE,pass.layout,0,4,sets,0,nullptr);
    // The PS-style wrapper processes a 16x16 output block per group.
    vkCmdDispatch(cmd,(width+15)/16,(height+15)/16,1);
    auto barrier=barriers[1];
    barrier.oldLayout=VK_IMAGE_LAYOUT_GENERAL; barrier.newLayout=VK_IMAGE_LAYOUT_TRANSFER_SRC_OPTIMAL;
    barrier.srcAccessMask=VK_ACCESS_SHADER_WRITE_BIT; barrier.dstAccessMask=VK_ACCESS_TRANSFER_READ_BIT;
    vkCmdPipelineBarrier(cmd,VK_PIPELINE_STAGE_COMPUTE_SHADER_BIT,VK_PIPELINE_STAGE_TRANSFER_BIT,0,
        0,nullptr,0,nullptr,1,&barrier);
    VkBufferImageCopy copy{};
    copy.imageSubresource={VK_IMAGE_ASPECT_COLOR_BIT,0,0,1}; copy.imageExtent={width,height,1};
    vkCmdCopyImageToBuffer(cmd,r.image,VK_IMAGE_LAYOUT_TRANSFER_SRC_OPTIMAL,output.buffer,1,&copy);
    VkMemoryBarrier host{VK_STRUCTURE_TYPE_MEMORY_BARRIER};
    host.srcAccessMask=VK_ACCESS_TRANSFER_WRITE_BIT; host.dstAccessMask=VK_ACCESS_HOST_READ_BIT;
    vkCmdPipelineBarrier(cmd,VK_PIPELINE_STAGE_TRANSFER_BIT,VK_PIPELINE_STAGE_HOST_BIT,0,1,&host,0,nullptr,0,nullptr);
    Check(vkEndCommandBuffer(cmd));
    VkFenceCreateInfo fence{VK_STRUCTURE_TYPE_FENCE_CREATE_INFO};
    Check(vkCreateFence(d,&fence,nullptr,&r.fence));
    VkSubmitInfo submit{VK_STRUCTURE_TYPE_SUBMIT_INFO};
    submit.commandBufferCount=1; submit.pCommandBuffers=&cmd;
    Check(vkQueueSubmit(window.graphicsQueue,1,&submit,r.fence));
    Check(vkWaitForFences(d,1,&r.fence,VK_TRUE,UINT64_MAX));
    const auto* actual=static_cast<const uint32_t*>(output.mapped);
    for(uint32_t y=0;y<height;++y) for(uint32_t x=0;x<width;++x) {
        const auto sx=((2*x+1)*2)/(2*width),sy=((2*y+1)*2)/(2*height);
        Require(actual[size_t(y)*width+x]==source[sy*2+sx],"Nearest compute pixel mismatch");
    }
    std::cout << "PASS native compute pixels " << width << 'x' << height << '\n';
}
}
int main() {
    try {
        {
            VulkanInitConfig init;
            init.enableValidation=true; init.debugCallback=Validate;
            init.features.shaderStorageImageExtendedFormats=VK_TRUE;
            init.features.shaderImageGatherExtended=VK_TRUE;
            VulkanTest::Window native(64,64);
            VulkanContext window(init,native.hwnd,VulkanTest::SwapchainConfig());
            std::vector<Sexy::ScaleEffectRuntimeDesc> effects(3);
            const char* paths[]={"Nearest.hlsl","SSimDownscaler.hlsl","Anime4K/Anime4K_Upscale_Denoise_UL.hlsl"};
            Sexy::VulkanEffectPrograms programs(window.device);
            for(size_t i=0;i<effects.size();++i) {
                std::string error;
                if(!Sexy::ScaleEffectBinary::Load(Sexy::ScaleEffectBinary::DefaultPath(std::string(PVZ_EFFECTS_DIR)+"/"+paths[i]),effects[i],error))
                    throw std::runtime_error(error);
                const auto& program=programs.Get(effects[i]);
                Require(&programs.Get(effects[i])==&program,"compiled shader objects were not reused");
                Require(program.passes_.size()==effects[i].mPasses.size(),"missing native compute pipeline");
            }
            RunNearest(window,programs.Get(effects[0]),33,25);
            RunNearest(window,programs.Get(effects[0]),64,48);
            Require(programs.Size()==3,"program cache grew per use");
        }
        Require(errors.load()==0,"Vulkan validation failed");
        std::cout << "PASS shared native effect programs, two dispatch sizes, zero Vulkan errors\n";
        return 0;
    } catch(const std::exception& error) {
        std::cerr << "FAIL " << error.what() << '\n';
        return 1;
    }
}
