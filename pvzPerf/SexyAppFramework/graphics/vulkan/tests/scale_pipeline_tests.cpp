#include "VulkanScalePipeline.h"
#include "VulkanScaleDds.h"
#include "TestWin32Window.h"
#include "VulkanRenderer.h"
#include <atomic>
#include <cstring>
#include <functional>
#include <fstream>
#include <iostream>
#include <stdexcept>

namespace Sexy {
const char* GetLogFilePathC(const char* name) {
    static thread_local std::string path;
    std::filesystem::create_directories("scale-pipeline-output");
    path=std::string("scale-pipeline-output/")+name;
    return path.c_str();
}
}
namespace {
std::atomic_uint errors{};
VkBool32 VKAPI_CALL Validate(VkDebugUtilsMessageSeverityFlagBitsEXT severity,
    VkDebugUtilsMessageTypeFlagsEXT types,const VkDebugUtilsMessengerCallbackDataEXT* data,void* user) {
    if(severity>=VK_DEBUG_UTILS_MESSAGE_SEVERITY_ERROR_BIT_EXT) ++errors;
    return VulkanInitConfig::DefaultDebugCallback(severity,types,data,user);
}
void Require(bool ok,const char* message) { if(!ok) throw std::runtime_error(message); }
void Check(VkResult result) { if(result!=VK_SUCCESS) throw std::runtime_error("VkResult "+std::to_string(result)); }
uint32_t MemoryType(uint32_t mask,VkMemoryPropertyFlags flags) {
    VkPhysicalDeviceMemoryProperties props{};
    vkGetPhysicalDeviceMemoryProperties(VulkanContext::physicalDevice,&props);
    for(uint32_t i=0;i<props.memoryTypeCount;++i)
        if((mask&(1u<<i)) && (props.memoryTypes[i].propertyFlags&flags)==flags) return i;
    throw std::runtime_error("Missing Vulkan memory type");
}
struct Buffer {
    VkDevice d=VulkanContext::device;
    VkBuffer buffer{};
    VkDeviceMemory memory{};
    void* mapped{};
    Buffer(size_t bytes,VkBufferUsageFlags usage) {
        VkBufferCreateInfo info{VK_STRUCTURE_TYPE_BUFFER_CREATE_INFO};
        info.size=bytes; info.usage=usage;
        Check(vkCreateBuffer(d,&info,nullptr,&buffer));
        VkMemoryRequirements req{}; vkGetBufferMemoryRequirements(d,buffer,&req);
        VkMemoryAllocateInfo alloc{VK_STRUCTURE_TYPE_MEMORY_ALLOCATE_INFO};
        alloc.allocationSize=req.size;
        alloc.memoryTypeIndex=MemoryType(req.memoryTypeBits,VK_MEMORY_PROPERTY_HOST_VISIBLE_BIT|VK_MEMORY_PROPERTY_HOST_COHERENT_BIT);
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
struct Commands {
    VkDevice d=VulkanContext::device;
    VkCommandPool pool{};
    VkFence fence{};
    VkCommandBuffer cmd{};
    Commands() {
        VkCommandPoolCreateInfo info{VK_STRUCTURE_TYPE_COMMAND_POOL_CREATE_INFO};
        info.queueFamilyIndex=VulkanContext::graphicsFamily;
        info.flags=VK_COMMAND_POOL_CREATE_RESET_COMMAND_BUFFER_BIT;
        Check(vkCreateCommandPool(d,&info,nullptr,&pool));
        VkCommandBufferAllocateInfo allocate{VK_STRUCTURE_TYPE_COMMAND_BUFFER_ALLOCATE_INFO};
        allocate.commandPool=pool; allocate.commandBufferCount=1; allocate.level=VK_COMMAND_BUFFER_LEVEL_PRIMARY;
        Check(vkAllocateCommandBuffers(d,&allocate,&cmd));
        VkFenceCreateInfo f{VK_STRUCTURE_TYPE_FENCE_CREATE_INFO};
        Check(vkCreateFence(d,&f,nullptr,&fence));
    }
    ~Commands() {
        vkDeviceWaitIdle(d);
        if(fence) vkDestroyFence(d,fence,nullptr);
        if(pool) vkDestroyCommandPool(d,pool,nullptr);
    }
    void Run(const std::function<void(VkCommandBuffer)>& record) {
        Check(vkResetCommandBuffer(cmd,0)); Check(vkResetFences(d,1,&fence));
        VkCommandBufferBeginInfo begin{VK_STRUCTURE_TYPE_COMMAND_BUFFER_BEGIN_INFO};
        Check(vkBeginCommandBuffer(cmd,&begin));
        record(cmd);
        Check(vkEndCommandBuffer(cmd));
        VkSubmitInfo submit{VK_STRUCTURE_TYPE_SUBMIT_INFO};
        submit.commandBufferCount=1; submit.pCommandBuffers=&cmd;
        Check(vkQueueSubmit(VulkanContext::graphicsQueue,1,&submit,fence));
        Check(vkWaitForFences(d,1,&fence,VK_TRUE,UINT64_MAX));
    }
};
void Barrier(VkCommandBuffer cmd,VkImage image,VkImageLayout oldLayout,VkImageLayout newLayout,
    VkPipelineStageFlags sourceStage,VkPipelineStageFlags targetStage,VkAccessFlags sourceAccess,VkAccessFlags targetAccess) {
    VkImageMemoryBarrier barrier{VK_STRUCTURE_TYPE_IMAGE_MEMORY_BARRIER};
    barrier.image=image; barrier.oldLayout=oldLayout; barrier.newLayout=newLayout;
    barrier.srcAccessMask=sourceAccess; barrier.dstAccessMask=targetAccess;
    barrier.srcQueueFamilyIndex=barrier.dstQueueFamilyIndex=VK_QUEUE_FAMILY_IGNORED;
    barrier.subresourceRange={VK_IMAGE_ASPECT_COLOR_BIT,0,1,0,1};
    vkCmdPipelineBarrier(cmd,sourceStage,targetStage,0,0,nullptr,0,nullptr,1,&barrier);
}
struct Source {
    VkDevice d=VulkanContext::device;
    Sexy::VulkanScaleImage native{};
    VkDeviceMemory memory{};
    Source(Commands& commands,uint32_t w,uint32_t h,std::span<const uint32_t> pixels) {
        Require(pixels.size()==size_t(w)*h,"invalid source size");
        native.width=w; native.height=h; native.format=VK_FORMAT_R8G8B8A8_UNORM;
        VkImageCreateInfo info{VK_STRUCTURE_TYPE_IMAGE_CREATE_INFO};
        info.imageType=VK_IMAGE_TYPE_2D; info.format=native.format; info.extent={w,h,1};
        info.mipLevels=info.arrayLayers=1; info.samples=VK_SAMPLE_COUNT_1_BIT;
        info.tiling=VK_IMAGE_TILING_OPTIMAL; info.usage=VK_IMAGE_USAGE_SAMPLED_BIT|VK_IMAGE_USAGE_TRANSFER_DST_BIT;
        Check(vkCreateImage(d,&info,nullptr,&native.image));
        VkMemoryRequirements req{}; vkGetImageMemoryRequirements(d,native.image,&req);
        VkMemoryAllocateInfo alloc{VK_STRUCTURE_TYPE_MEMORY_ALLOCATE_INFO};
        alloc.allocationSize=req.size; alloc.memoryTypeIndex=MemoryType(req.memoryTypeBits,VK_MEMORY_PROPERTY_DEVICE_LOCAL_BIT);
        Check(vkAllocateMemory(d,&alloc,nullptr,&memory));
        Check(vkBindImageMemory(d,native.image,memory,0));
        VkImageViewCreateInfo view{VK_STRUCTURE_TYPE_IMAGE_VIEW_CREATE_INFO};
        view.image=native.image; view.viewType=VK_IMAGE_VIEW_TYPE_2D; view.format=native.format;
        view.subresourceRange={VK_IMAGE_ASPECT_COLOR_BIT,0,1,0,1};
        Check(vkCreateImageView(d,&view,nullptr,&native.view));
        Buffer staging(pixels.size_bytes(),VK_BUFFER_USAGE_TRANSFER_SRC_BIT);
        std::memcpy(staging.mapped,pixels.data(),pixels.size_bytes());
        commands.Run([&](VkCommandBuffer cmd) {
            Barrier(cmd,native.image,VK_IMAGE_LAYOUT_UNDEFINED,VK_IMAGE_LAYOUT_TRANSFER_DST_OPTIMAL,
                VK_PIPELINE_STAGE_TOP_OF_PIPE_BIT,VK_PIPELINE_STAGE_TRANSFER_BIT,0,VK_ACCESS_TRANSFER_WRITE_BIT);
            VkBufferImageCopy copy{};
            copy.imageSubresource={VK_IMAGE_ASPECT_COLOR_BIT,0,0,1}; copy.imageExtent={w,h,1};
            vkCmdCopyBufferToImage(cmd,staging.buffer,native.image,VK_IMAGE_LAYOUT_TRANSFER_DST_OPTIMAL,1,&copy);
            Barrier(cmd,native.image,VK_IMAGE_LAYOUT_TRANSFER_DST_OPTIMAL,VK_IMAGE_LAYOUT_SHADER_READ_ONLY_OPTIMAL,
                VK_PIPELINE_STAGE_TRANSFER_BIT,VK_PIPELINE_STAGE_COMPUTE_SHADER_BIT,VK_ACCESS_TRANSFER_WRITE_BIT,VK_ACCESS_SHADER_READ_BIT);
        });
    }
    ~Source() {
        if(native.view) vkDestroyImageView(d,native.view,nullptr);
        if(native.image) vkDestroyImage(d,native.image,nullptr);
        if(memory) vkFreeMemory(d,memory,nullptr);
    }
};
void Record(Sexy::VulkanScalePipeline& pipeline,VkCommandBuffer cmd) {
    pipeline.Record(cmd,VK_IMAGE_LAYOUT_SHADER_READ_ONLY_OPTIMAL,
        VK_PIPELINE_STAGE_COMPUTE_SHADER_BIT|VK_PIPELINE_STAGE_TRANSFER_BIT,
        VK_ACCESS_SHADER_READ_BIT|VK_ACCESS_SHADER_WRITE_BIT|VK_ACCESS_TRANSFER_WRITE_BIT);
}
std::vector<uint32_t> ReadOutput(Commands& commands,Sexy::VulkanScaleImage image) {
    Require(image.format==VK_FORMAT_R8G8B8A8_UNORM,"readback expects RGBA8");
    Buffer readback(size_t(image.width)*image.height*4,VK_BUFFER_USAGE_TRANSFER_DST_BIT);
    commands.Run([&](VkCommandBuffer cmd) {
        Barrier(cmd,image.image,VK_IMAGE_LAYOUT_SHADER_READ_ONLY_OPTIMAL,VK_IMAGE_LAYOUT_TRANSFER_SRC_OPTIMAL,
            VK_PIPELINE_STAGE_COMPUTE_SHADER_BIT,VK_PIPELINE_STAGE_TRANSFER_BIT,
            VK_ACCESS_SHADER_WRITE_BIT|VK_ACCESS_SHADER_READ_BIT,VK_ACCESS_TRANSFER_READ_BIT);
        VkBufferImageCopy copy{};
        copy.imageSubresource={VK_IMAGE_ASPECT_COLOR_BIT,0,0,1}; copy.imageExtent={image.width,image.height,1};
        vkCmdCopyImageToBuffer(cmd,image.image,VK_IMAGE_LAYOUT_TRANSFER_SRC_OPTIMAL,readback.buffer,1,&copy);
        Barrier(cmd,image.image,VK_IMAGE_LAYOUT_TRANSFER_SRC_OPTIMAL,VK_IMAGE_LAYOUT_SHADER_READ_ONLY_OPTIMAL,
            VK_PIPELINE_STAGE_TRANSFER_BIT,VK_PIPELINE_STAGE_COMPUTE_SHADER_BIT|VK_PIPELINE_STAGE_FRAGMENT_SHADER_BIT,
            VK_ACCESS_TRANSFER_READ_BIT,VK_ACCESS_SHADER_READ_BIT);
        VkMemoryBarrier host{VK_STRUCTURE_TYPE_MEMORY_BARRIER};
        host.srcAccessMask=VK_ACCESS_TRANSFER_WRITE_BIT; host.dstAccessMask=VK_ACCESS_HOST_READ_BIT;
        vkCmdPipelineBarrier(cmd,VK_PIPELINE_STAGE_TRANSFER_BIT,VK_PIPELINE_STAGE_HOST_BIT,0,1,&host,0,nullptr,0,nullptr);
    });
    std::vector<uint32_t> result(size_t(image.width)*image.height);
    std::memcpy(result.data(),readback.mapped,result.size()*4);
    return result;
}
void TestDds(Sexy::VulkanScaleLibrary& library) {
    size_t count=0;
    for(const auto& entry:std::filesystem::recursive_directory_iterator(PVZ_EFFECTS_DIR)) {
        if(entry.path().extension()!=".dds") continue;
        ++count;
        std::ifstream stream(entry.path(),std::ios::binary|std::ios::ate);
        std::vector<std::byte> data(size_t(stream.tellg()));
        stream.seekg(0); stream.read(reinterpret_cast<char*>(data.data()),data.size());
        const auto layout=Sexy::ParseScaleDds(data);
        const auto native=library.Lookup(entry.path());
        Require(native.width==layout.width && native.height==layout.height && native.format==layout.format,"DDS GPU header mismatch");
        Require(library.Lookup(entry.path()).image==native.image,"DDS lookup not shared");
        data.pop_back();
        bool rejected=false;
        try { Sexy::ParseScaleDds(data); } catch(const std::exception&) { rejected=true; }
        Require(rejected,"truncated DDS accepted");
    }
    Require(count==17 && library.LookupCount()==17,"DDS catalog count");
    std::cout<<"PASS all 17 DDS tables uploaded, cached, malformed payloads rejected\n";
}
void RunTests(VulkanContext& window) {
    using namespace Sexy;
    Commands commands;
    VulkanScaleLibrary library({window.physicalDevice,window.device,window.graphicsQueue,window.graphicsFamily});
    TestDds(library);
    ScaleEffectRuntimeDesc targetRelative;
    std::vector<ScaleEffectRuntimeDesc> effects(5);
    const char* paths[]={"Nearest.hlsl","SSimDownscaler.hlsl","Anime4K/Anime4K_Upscale_Denoise_UL.hlsl",
        "SMAA/SMAA_Ultra.hlsl","RAVU/RAVU_Lite_R2.hlsl"};
    for(size_t i=0;i<effects.size();++i) {
        const auto path=std::filesystem::path(PVZ_EFFECTS_DIR)/paths[i];
        std::string error;
        if(!ScaleEffectBinary::Load(ScaleEffectBinary::DefaultPath(path),effects[i],error))
            throw std::runtime_error(error);
        effects[i].mSourcePath=path.generic_string();
    }
    targetRelative=effects[0];
    auto& relativeOutput=targetRelative.mTextures[ScaleSlot(targetRelative.mOutput)];
    relativeOutput.mWidthExpr={{ScaleSizeOp::OutputWidth,0},{ScaleSizeOp::Literal,2},{ScaleSizeOp::Divide,0}};
    relativeOutput.mHeightExpr={{ScaleSizeOp::OutputHeight,0},{ScaleSizeOp::Literal,2},{ScaleSizeOp::Divide,0}};
    const uint32_t tinyPixels[]={0xff123456,0xff987654,0xff80c040,0xffc08040};
    Source input(commands,2,2,tinyPixels);
    const VulkanScaleStep nearestSteps[]={
        {&effects[0],{SCALE_SCALING_NORMAL,2,2}},
        {&effects[0],{SCALE_SCALING_ABSOLUTE,33,25}}
    };
    VulkanScalePipeline first(library,input.native,nearestSteps,64,48),second(library,input.native,nearestSteps,64,48);
    Require(first.output.image!=second.output.image && first.WritableImageCount()==2,"pipeline writable images alias");
    Require(library.ProgramCount()==1,"repeated shader was not shared");
    for(unsigned frame=0;frame<16;++frame) {
        commands.Run([&](VkCommandBuffer cmd){ Record(first,cmd); Record(second,cmd); });
        for(auto* pipeline:{&first,&second}) {
            const auto pixels=ReadOutput(commands,pipeline->output);
            for(uint32_t y=0;y<25;++y) for(uint32_t x=0;x<33;++x)
                Require(pixels[size_t(y)*33+x]==tinyPixels[((2*y+1)*4/(2*25)/2)*2+((2*x+1)*4/(2*33)/2)],
                    "multi-stage nearest UNORM mismatch");
        }
    }
    std::cout<<"PASS repeated Nearest, odd dimensions, midtones, two independent modes, 16 frames\n";


    {
        VulkanRenderer renderer(window,2,2,std::string(PVZ_NATIVE_SHADER_DIR)+"/game_vs.spv",
            std::string(PVZ_NATIVE_SHADER_DIR)+"/game_ps.spv");
        renderer.PrepareLoadingPipelines();
        renderer.PrepareScale(false,nearestSteps,64,48);
        const VulkanScaleStep fullscreenStep{&effects[0],{SCALE_SCALING_ABSOLUTE,20,12}};
        renderer.PrepareScale(true,{&fullscreenStep,1},64,48);
        renderer.WarmScale(false); renderer.WarmScale(true);
        const auto dormant=renderer.GetScaleCounts();
        Require(dormant.programs==1 && dormant.writableImages==3,"renderer scale objects not shared/resident");
        const auto windowImage=renderer.ScaleOutput(false).image,fullscreenImage=renderer.ScaleOutput(true).image;
        uint32_t bgra[4];
        for(unsigned i=0;i<4;++i) bgra[i]=(tinyPixels[i]&0xff00ff00)|((tinyPixels[i]&255)<<16)|((tinyPixels[i]>>16)&255);
        auto* texture=renderer.CreateTexture(2,2,bgra,8);
        const auto slot=VulkanRenderer::SlotOf(texture);
        const VulkanVertex quad[]={
            {0,0,1,1,1,1,0,0,slot,0},{2,0,1,1,1,1,1,0,slot,0},{2,2,1,1,1,1,1,1,slot,0},
            {0,0,1,1,1,1,0,0,slot,0},{2,2,1,1,1,1,1,1,slot,0},{0,2,1,1,1,1,0,1,slot,0}
        };
        for(unsigned frame=0;frame<12;++frame) {
            const bool enabled=frame%3!=0,fullscreen=frame%3==2;
            renderer.SetScaleMode(enabled,fullscreen);
            if(frame==5 || frame==8) {
                VulkanTest::Window::Resize(window.hwnd,frame==5?75:64,frame==5?57:64);
                renderer.ResizePresent();
            }
            Require(renderer.BeginScene(),"renderer scale frame unavailable");
            renderer.SubmitTriangles(quad,texture,false,false,VulkanBlend::Opaque);
            renderer.EndSceneAndPresent();
            Require(renderer.ReadScenePixels()==std::vector<uint32_t>(bgra,bgra+4),"scale mutated source canvas");
            if(enabled) {
                const auto out=renderer.ScaleOutput(fullscreen);
                const auto pixels=ReadOutput(commands,out);
                for(uint32_t y=0;y<out.height;++y) for(uint32_t x=0;x<out.width;++x)
                    Require(pixels[size_t(y)*out.width+x]==tinyPixels[((2*y+1)*2/(2*out.height))*2+((2*x+1)*2/(2*out.width))],
                        "scene -> compute -> sampled present texture mismatch");
                const auto rect=renderer.PresentRect(64,64);
                Require(rect.width==int(out.width) && rect.height==int(out.height),"renderer rescaled custom output");
                const auto pos=WindowPointToScene(rect.x+rect.width*0.75,rect.y+rect.height*0.75,
                    64,64,64,64,rect,2,2);
                Require(pos.x==1 && pos.y==1,"scaled presentation/input mismatch");
            }
            Require(renderer.ScaleOutput(false).image==windowImage && renderer.ScaleOutput(true).image==fullscreenImage,
                "mode switch or resize destroyed resident pipelines");
        }
        renderer.DestroyTexture(texture);
        renderer.SetScaleMode(false,false);
        Require(renderer.PresentRetainedScene(),"retained direct present after scale failed");
        std::cout<<"PASS renderer GPU scene -> scale -> present, warm-up, 12 mode toggles, resize, source/input preserved\n";
    }

    std::vector<uint32_t> solid(32*24,0xffa08060);
    Source uniform(commands,32,24,solid);
    for(size_t index:{size_t(1),size_t(3),size_t(4)}) {
        const VulkanScaleStep step{&effects[index],{SCALE_SCALING_NORMAL,0.5f,0.5f}};
        VulkanScalePipeline pipeline(library,uniform.native,{&step,1},64,48);
        commands.Run([&](VkCommandBuffer cmd){ Record(pipeline,cmd); });
        const auto pixels=ReadOutput(commands,pipeline.output);
        for(uint32_t pixel:pixels) {
            for(int shift:{0,8,16,24})
                Require(std::abs(int((pixel>>shift)&255)-int((solid[0]>>shift)&255))<=2,
                    "uniform-color multipass/DDS effect mismatch");
        }
        std::cout<<"PASS uniform image "<<paths[index]<<" passes="<<pipeline.PassCount()<<'\n';
    }
    // Independent stage execution must exactly equal a prepared compound chain.
    std::vector<uint32_t> pattern(35*27);
    for(unsigned y=0;y<27;++y) for(unsigned x=0;x<35;++x)
        pattern[y*35+x]=0xff000000|((x*7+y*3)&255)|(((x*3+y*5)&255)<<8)|(((x*11+y*7)&255)<<16);
    Source textured(commands,35,27,pattern);
    const VulkanScaleStep chainSteps[]={{&effects[2],{}},{&effects[1],{SCALE_SCALING_NORMAL,0.5f,0.5f}}};
    VulkanScalePipeline compound(library,textured.native,chainSteps,64,48);
    VulkanScalePipeline upscale(library,textured.native,{chainSteps,1},64,48);
    VulkanScalePipeline downscale(library,upscale.output,{chainSteps+1,1},64,48);
    std::vector<uint32_t> baseline;
    for(unsigned frame=0;frame<6;++frame) {
        commands.Run([&](VkCommandBuffer cmd){ Record(compound,cmd); Record(upscale,cmd); Record(downscale,cmd); });
        const auto actual=ReadOutput(commands,compound.output);
        Require(actual==ReadOutput(commands,downscale.output),"compound chain differs from separate stages");
        Require(actual.size()==pattern.size(),"chain sizing failed");
        if(frame==0) baseline=actual;
        else Require(actual==baseline,"multipass output changes across identical frames");
    }

    {
        std::vector<uint32_t> gameSize(800*600);
        for(unsigned y=0;y<600;++y) for(unsigned x=0;x<800;++x)
            gameSize[y*800+x]=0xff000000|((x*255/799))|((y*255/599)<<8)|((((x/40+y/40)&1)?220:35)<<16);
        Source gameSource(commands,800,600,gameSize);
        const VulkanScaleStep fullSteps[]={{&effects[2],{}},{&effects[2],{}},
            {&effects[1],{SCALE_SCALING_FIT,1,1}}};
        VulkanScalePipeline full(library,gameSource.native,fullSteps,2560,1440);
        Require(full.output.width==1920 && full.output.height==1440,"full-size 4x then fit output mismatch");
        std::vector<uint32_t> reference;
        for(unsigned frame=0;frame<3;++frame) {
            commands.Run([&](VkCommandBuffer cmd){ Record(full,cmd); });
            const auto pixels=ReadOutput(commands,full.output);
            for(const auto pixel:pixels) Require((pixel>>24)==255,"full-size chain alpha hole");
            if(frame==0) reference=pixels;
            else Require(pixels==reference,"full-size chain has unstable pixels");
        }
        std::cout<<"PASS 800x600 -> two Anime4K UL -> 3200x2400 -> SSim fit 1920x1440; 3 stable frames\n";
    }

    Require(library.ProgramCount()==5 && library.LookupCount()==17,"resources reloaded per pipeline/frame");
    std::cout<<"PASS Anime4K UL + SSim chain equals independently executed stages, stable across 6 frames\n";
    const VulkanScaleStep relativeStep{&targetRelative,{}};
    VulkanScalePipeline relative(library,input.native,{&relativeStep,1},66,50);
    Require(relative.output.width==33 && relative.output.height==25,
        "OUTPUT size expression was applied twice");
    commands.Run([&](VkCommandBuffer cmd){ Record(relative,cmd); });
    Require(ReadOutput(commands,relative.output)==ReadOutput(commands,first.output),
        "target-relative effect output mismatch");
}
}
int main() {
    try {
        {
            VulkanInitConfig init;
            init.features.shaderFloat64=VK_TRUE;
            init.enableValidation=true; init.debugCallback=Validate;
            init.features.shaderStorageImageExtendedFormats=VK_TRUE;
            init.features.shaderImageGatherExtended=VK_TRUE;
            VulkanTest::Window native(64,64);
            VulkanContext window(init,native.hwnd,VulkanTest::SwapchainConfig());
            RunTests(window);
        }
        Require(errors==0,"Vulkan validation reported errors");
        std::cout<<"PASS native multi-pass execution, zero ordinary/synchronization validation errors\n";
        return 0;
    } catch(const std::exception& e) {
        std::cerr<<"FAIL "<<e.what()<<'\n'; return 1;
    }
}
