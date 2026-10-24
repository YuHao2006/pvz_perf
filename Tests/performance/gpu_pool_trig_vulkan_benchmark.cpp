// Explicit Intel headless GPU-only experiment. No WSI, GL context or global changes.
#define PVZ_POOL_BENCH_SHARED_ONLY
#include "gpu_pool_trig_benchmark.cpp"
#include <vulkan/vulkan.h>
#include <fstream>
#include <numeric>

static void VkCheck(VkResult result,const char* operation)
{
    if (result!=VK_SUCCESS) throw std::runtime_error(operation);
}
namespace {
void Replace(std::string& source,std::string_view old,std::string_view replacement)
{
    const auto at=source.find(old);
    Require(at!=std::string::npos,"shader conversion token missing");
    source.replace(at,old.size(),replacement);
}
void EmitShaders(const std::filesystem::path& directory)
{
    std::filesystem::create_directories(directory);
    const std::string header=R"GLSL(#version 450
layout(location=0) in vec2 inPosition;
layout(location=1) in vec4 inColor;
layout(location=2) in vec2 inUV;
layout(location=3) in uint inSlot;
layout(location=4) in uint inSampler;
layout(push_constant) uniform Params { vec2 extent; vec2 padding; vec4 wave; } pc;
layout(location=0) out vec4 color;
layout(location=1) out vec2 uv;
layout(location=2) flat out uint slot;
layout(location=3) flat out uint samplerIndex;
)GLSL";
    const std::string tail=R"GLSL(
    color=inColor; slot=inSlot; samplerIndex=inSampler;
    gl_Position=vec4(inPosition/pc.extent*2.0-1.0,0.0,1.0);
}
)GLSL";
    const auto write=[&](const char* name,const std::string& text) {
        std::ofstream file(directory/name,std::ios::binary);
        Require(bool(file),"write generated shader"); file<<text;
    };
    write("cpu.vert",header+"void main(){ uv=inUV;\n"+tail);
    const std::string wave(VertexSource);
    const auto from=wave.find("    float x ="),to=wave.find("    gl_Position=");
    write("gpu.vert",header+R"GLSL(
layout(location=5) in vec2 phase;
void main() {
    ivec3 grid=ivec3(ivec2(inUV),int(inSlot & 3u));
    vec4 result; vec4 waveTime=pc.wave;
)GLSL"+wave.substr(from,to-from)+"uv=result.xy;\n"+tail);
    std::string fragment(GL::SceneFragmentShader());
    Replace(fragment,"#version 130","#version 450");
    Replace(fragment,"uniform sampler2D image;","layout(set=0,binding=0) uniform sampler2D image;");
    Replace(fragment,"uniform bool premultipliedOutput;","const bool premultipliedOutput=false;");
    Replace(fragment,"uniform bool coverageInput;","const bool coverageInput=false;");
    Replace(fragment,"in vec4 color;","layout(location=0) in vec4 color;");
    Replace(fragment,"in vec2 uv;","layout(location=1) in vec2 uv;");
    Replace(fragment,"flat in uint slot;","layout(location=2) flat in uint slot;");
    Replace(fragment,"flat in uint samplerIndex;","layout(location=3) flat in uint samplerIndex;");
    Replace(fragment,"out vec4 outColor;","layout(location=0) out vec4 outColor;");
    write("pool.frag",fragment);
}
struct BufferRes { VkBuffer buffer{}; VkDeviceMemory memory{}; void* mapped{}; };
struct ImageRes { VkImage image{}; VkDeviceMemory memory{}; VkImageView view{}; };
struct Push { float width=800,height=600,padding[2]{}; Times time{}; };
static_assert(sizeof(Push)==32);
struct VkPool {
    VkInstance instance{}; VkPhysicalDevice physical{}; VkDevice device{}; VkQueue queue{};
    VkPhysicalDeviceProperties properties{}; unsigned family=~0u,validBits=0;
    VkCommandPool commandPool{}; VkCommandBuffer cmd{}; VkFence fence{};
    VkQueryPool queries{}; VkRenderPass renderPass{}; VkFramebuffer framebuffer{};
    VkDescriptorSetLayout setLayout{}; VkDescriptorPool descriptorPool{}; VkDescriptorSet sets[3]{};
    VkPipelineLayout pipelineLayout{}; VkPipeline pipelines[3]{}; VkSampler sampler{};
    std::vector<BufferRes> buffers; std::vector<ImageRes> images;
    BufferRes dynamic{},staticList{},staticIndexed{},index{},readback{};
    ImageRes target{},textures[3]{};
    std::vector<Vertex> grid; std::vector<StaticVertex> unique,triangles;
    std::vector<unsigned> indices;
    std::vector<Sexy::GpuVertex> cpuVertices;
    std::array<Value,288> values{};
    unsigned long long timestampGcd=0;
    VkPool()
    {
    VkApplicationInfo app{VK_STRUCTURE_TYPE_APPLICATION_INFO};
    app.pApplicationName="PVZ isolated Intel pool experiment";
    app.apiVersion=VK_API_VERSION_1_2;
    VkInstanceCreateInfo info{VK_STRUCTURE_TYPE_INSTANCE_CREATE_INFO};
    info.pApplicationInfo=&app;
    VkCheck(vkCreateInstance(&info,nullptr,&instance),"vkCreateInstance");
    unsigned count=0;
    VkCheck(vkEnumeratePhysicalDevices(instance,&count,nullptr),"vkEnumeratePhysicalDevices count");
    std::vector<VkPhysicalDevice> devices(count);
    VkCheck(vkEnumeratePhysicalDevices(instance,&count,devices.data()),"vkEnumeratePhysicalDevices");
    for (const auto candidate:devices) {
        VkPhysicalDeviceProperties props{};
        vkGetPhysicalDeviceProperties(candidate,&props);
        std::printf("device %s vendor=0x%04x device=0x%04x type=%u\n",
            props.deviceName,props.vendorID,props.deviceID,props.deviceType);
        if (props.vendorID==0x8086 && props.deviceID==0x7d55) {
            physical=candidate; properties=props;
        }
    }
    if (!physical) throw std::runtime_error("Intel Arc 8086:7D55 not exposed by Vulkan loader");
    unsigned families=0;
    vkGetPhysicalDeviceQueueFamilyProperties(physical,&families,nullptr);
    std::vector<VkQueueFamilyProperties> queues(families);
    vkGetPhysicalDeviceQueueFamilyProperties(physical,&families,queues.data());
    for (unsigned i=0;i<families;++i) {
        std::printf("Intel queue %u flags=0x%x timestampValidBits=%u\n",
            i,queues[i].queueFlags,queues[i].timestampValidBits);
        if (family==~0u && (queues[i].queueFlags&VK_QUEUE_GRAPHICS_BIT) &&
            queues[i].timestampValidBits) { family=i; validBits=queues[i].timestampValidBits; }
    }
    if (family==~0u) throw std::runtime_error("Intel graphics timestamp queue unavailable");
    const float priority=1;
    VkDeviceQueueCreateInfo queueInfo{VK_STRUCTURE_TYPE_DEVICE_QUEUE_CREATE_INFO};
    queueInfo.queueFamilyIndex=family; queueInfo.queueCount=1; queueInfo.pQueuePriorities=&priority;
    VkDeviceCreateInfo create{VK_STRUCTURE_TYPE_DEVICE_CREATE_INFO};
    create.queueCreateInfoCount=1; create.pQueueCreateInfos=&queueInfo;
    VkCheck(vkCreateDevice(physical,&create,nullptr,&device),"vkCreateDevice(Intel)");
    vkGetDeviceQueue(device,family,0,&queue);
    std::printf("SELECTED %s vendor=0x%04x device=0x%04x graphicsQueue=%u timestampPeriod=%.9g\n",
        properties.deviceName,properties.vendorID,properties.deviceID,family,properties.limits.timestampPeriod);
    }
    unsigned MemoryType(unsigned mask,VkMemoryPropertyFlags flags)
    {
        VkPhysicalDeviceMemoryProperties memory{}; vkGetPhysicalDeviceMemoryProperties(physical,&memory);
        for (unsigned i=0;i<memory.memoryTypeCount;++i)
            if ((mask&(1u<<i)) && (memory.memoryTypes[i].propertyFlags&flags)==flags) return i;
        throw std::runtime_error("Vulkan memory type unavailable");
    }
    BufferRes Buffer(VkDeviceSize bytes,VkBufferUsageFlags usage)
    {
        BufferRes result;
        VkBufferCreateInfo info{VK_STRUCTURE_TYPE_BUFFER_CREATE_INFO};
        info.size=bytes; info.usage=usage;
        VkCheck(vkCreateBuffer(device,&info,nullptr,&result.buffer),"vkCreateBuffer");
        VkMemoryRequirements req{}; vkGetBufferMemoryRequirements(device,result.buffer,&req);
        VkMemoryAllocateInfo alloc{VK_STRUCTURE_TYPE_MEMORY_ALLOCATE_INFO};
        alloc.allocationSize=req.size; alloc.memoryTypeIndex=MemoryType(req.memoryTypeBits,
            VK_MEMORY_PROPERTY_HOST_VISIBLE_BIT|VK_MEMORY_PROPERTY_HOST_COHERENT_BIT);
        VkCheck(vkAllocateMemory(device,&alloc,nullptr,&result.memory),"buffer memory");
        VkCheck(vkBindBufferMemory(device,result.buffer,result.memory,0),"bind buffer");
        VkCheck(vkMapMemory(device,result.memory,0,bytes,0,&result.mapped),"map buffer");
        buffers.push_back(result); return result;
    }
    ImageRes Image(unsigned w,unsigned h,VkImageUsageFlags usage)
    {
        ImageRes result;
        VkImageCreateInfo info{VK_STRUCTURE_TYPE_IMAGE_CREATE_INFO};
        info.imageType=VK_IMAGE_TYPE_2D; info.format=VK_FORMAT_R8G8B8A8_UNORM;
        info.extent={w,h,1}; info.mipLevels=info.arrayLayers=1; info.samples=VK_SAMPLE_COUNT_1_BIT;
        info.tiling=VK_IMAGE_TILING_OPTIMAL; info.usage=usage;
        VkCheck(vkCreateImage(device,&info,nullptr,&result.image),"vkCreateImage");
        VkMemoryRequirements req{}; vkGetImageMemoryRequirements(device,result.image,&req);
        VkMemoryAllocateInfo alloc{VK_STRUCTURE_TYPE_MEMORY_ALLOCATE_INFO};
        alloc.allocationSize=req.size; alloc.memoryTypeIndex=MemoryType(req.memoryTypeBits,VK_MEMORY_PROPERTY_DEVICE_LOCAL_BIT);
        VkCheck(vkAllocateMemory(device,&alloc,nullptr,&result.memory),"image memory");
        VkCheck(vkBindImageMemory(device,result.image,result.memory,0),"bind image");
        VkImageViewCreateInfo view{VK_STRUCTURE_TYPE_IMAGE_VIEW_CREATE_INFO};
        view.image=result.image; view.viewType=VK_IMAGE_VIEW_TYPE_2D; view.format=info.format;
        view.subresourceRange={VK_IMAGE_ASPECT_COLOR_BIT,0,1,0,1};
        VkCheck(vkCreateImageView(device,&view,nullptr,&result.view),"image view");
        images.push_back(result); return result;
    }
    void Begin()
    {
        VkCheck(vkResetCommandBuffer(cmd,0),"reset command buffer");
        VkCommandBufferBeginInfo begin{VK_STRUCTURE_TYPE_COMMAND_BUFFER_BEGIN_INFO};
        begin.flags=VK_COMMAND_BUFFER_USAGE_ONE_TIME_SUBMIT_BIT;
        VkCheck(vkBeginCommandBuffer(cmd,&begin),"begin command buffer");
    }
    void Submit()
    {
        VkCheck(vkEndCommandBuffer(cmd),"end command buffer");
        VkCheck(vkResetFences(device,1,&fence),"reset fence");
        VkSubmitInfo submit{VK_STRUCTURE_TYPE_SUBMIT_INFO};
        submit.commandBufferCount=1; submit.pCommandBuffers=&cmd;
        VkCheck(vkQueueSubmit(queue,1,&submit,fence),"queue submit");
        // One wait per burst, outside GPU timestamp intervals, never per draw.
        VkCheck(vkWaitForFences(device,1,&fence,VK_TRUE,10'000'000'000ull),"batch fence");
    }
    void Barrier(VkImage image,VkImageLayout before,VkImageLayout after,
        VkPipelineStageFlags src,VkPipelineStageFlags dst,VkAccessFlags a,VkAccessFlags b)
    {
        VkImageMemoryBarrier barrier{VK_STRUCTURE_TYPE_IMAGE_MEMORY_BARRIER};
        barrier.oldLayout=before; barrier.newLayout=after;
        barrier.srcQueueFamilyIndex=barrier.dstQueueFamilyIndex=VK_QUEUE_FAMILY_IGNORED;
        barrier.image=image; barrier.subresourceRange={VK_IMAGE_ASPECT_COLOR_BIT,0,1,0,1};
        barrier.srcAccessMask=a; barrier.dstAccessMask=b;
        vkCmdPipelineBarrier(cmd,src,dst,0,0,nullptr,0,nullptr,1,&barrier);
    }
    VkShaderModule Module(const std::filesystem::path& path)
    {
        std::ifstream file(path,std::ios::binary|std::ios::ate);
        Require(bool(file),"SPIR-V file missing");
        const auto size=std::size_t(file.tellg()); Require(size && size%4==0,"SPIR-V size");
        std::vector<unsigned> code(size/4); file.seekg(0);
        file.read(reinterpret_cast<char*>(code.data()),std::streamsize(size));
        VkShaderModuleCreateInfo info{VK_STRUCTURE_TYPE_SHADER_MODULE_CREATE_INFO};
        info.codeSize=size; info.pCode=code.data();
        VkShaderModule module{}; VkCheck(vkCreateShaderModule(device,&info,nullptr,&module),"shader module");
        return module;
    }
    void Pipeline(int path,const std::filesystem::path& directory)
    {
        const auto vs=Module(directory/(path==0 ? "cpu.spv" : "gpu.spv"));
        const auto fs=Module(directory/"pool.spv");
        VkPipelineShaderStageCreateInfo stages[2]{};
        for (auto& s:stages) { s.sType=VK_STRUCTURE_TYPE_PIPELINE_SHADER_STAGE_CREATE_INFO; s.pName="main"; }
        stages[0].stage=VK_SHADER_STAGE_VERTEX_BIT; stages[0].module=vs;
        stages[1].stage=VK_SHADER_STAGE_FRAGMENT_BIT; stages[1].module=fs;
        VkVertexInputBindingDescription binding{0,path==0 ? 40u : 48u,VK_VERTEX_INPUT_RATE_VERTEX};
        VkVertexInputAttributeDescription attributes[]{
            {0,0,VK_FORMAT_R32G32_SFLOAT,0},{1,0,VK_FORMAT_R32G32B32A32_SFLOAT,8},
            {2,0,VK_FORMAT_R32G32_SFLOAT,24},{3,0,VK_FORMAT_R32_UINT,32},
            {4,0,VK_FORMAT_R32_UINT,36},{5,0,VK_FORMAT_R32G32_SFLOAT,40}};
        VkPipelineVertexInputStateCreateInfo input{VK_STRUCTURE_TYPE_PIPELINE_VERTEX_INPUT_STATE_CREATE_INFO};
        input.vertexBindingDescriptionCount=1; input.pVertexBindingDescriptions=&binding;
        input.vertexAttributeDescriptionCount=path==0 ? 5 : 6; input.pVertexAttributeDescriptions=attributes;
        VkPipelineInputAssemblyStateCreateInfo assembly{VK_STRUCTURE_TYPE_PIPELINE_INPUT_ASSEMBLY_STATE_CREATE_INFO};
        assembly.topology=VK_PRIMITIVE_TOPOLOGY_TRIANGLE_LIST;
        VkViewport viewport{0,0,800,600,0,1}; VkRect2D scissor{{0,0},{800,600}};
        VkPipelineViewportStateCreateInfo view{VK_STRUCTURE_TYPE_PIPELINE_VIEWPORT_STATE_CREATE_INFO};
        view.viewportCount=view.scissorCount=1; view.pViewports=&viewport; view.pScissors=&scissor;
        VkPipelineRasterizationStateCreateInfo raster{VK_STRUCTURE_TYPE_PIPELINE_RASTERIZATION_STATE_CREATE_INFO};
        raster.polygonMode=VK_POLYGON_MODE_FILL; raster.cullMode=VK_CULL_MODE_NONE; raster.lineWidth=1;
        VkPipelineMultisampleStateCreateInfo ms{VK_STRUCTURE_TYPE_PIPELINE_MULTISAMPLE_STATE_CREATE_INFO};
        ms.rasterizationSamples=VK_SAMPLE_COUNT_1_BIT;
        VkPipelineColorBlendAttachmentState attachment{};
        attachment.blendEnable=VK_TRUE; attachment.srcColorBlendFactor=VK_BLEND_FACTOR_SRC_ALPHA;
        attachment.dstColorBlendFactor=VK_BLEND_FACTOR_ONE_MINUS_SRC_ALPHA;
        attachment.colorBlendOp=attachment.alphaBlendOp=VK_BLEND_OP_ADD;
        attachment.srcAlphaBlendFactor=VK_BLEND_FACTOR_ONE; attachment.dstAlphaBlendFactor=VK_BLEND_FACTOR_ONE_MINUS_SRC_ALPHA;
        attachment.colorWriteMask=15;
        VkPipelineColorBlendStateCreateInfo blend{VK_STRUCTURE_TYPE_PIPELINE_COLOR_BLEND_STATE_CREATE_INFO};
        blend.attachmentCount=1; blend.pAttachments=&attachment;
        VkGraphicsPipelineCreateInfo info{VK_STRUCTURE_TYPE_GRAPHICS_PIPELINE_CREATE_INFO};
        info.stageCount=2; info.pStages=stages; info.pVertexInputState=&input; info.pInputAssemblyState=&assembly;
        info.pViewportState=&view; info.pRasterizationState=&raster; info.pMultisampleState=&ms;
        info.pColorBlendState=&blend; info.layout=pipelineLayout; info.renderPass=renderPass;
        VkCheck(vkCreateGraphicsPipelines(device,{},1,&info,nullptr,&pipelines[path]),"graphics pipeline");
        vkDestroyShaderModule(device,vs,nullptr); vkDestroyShaderModule(device,fs,nullptr);
    }
    void Setup(IWICImagingFactory* factory,const std::filesystem::path& shaderDirectory)
    {
        VkCommandPoolCreateInfo pool{VK_STRUCTURE_TYPE_COMMAND_POOL_CREATE_INFO};
        pool.queueFamilyIndex=family; pool.flags=VK_COMMAND_POOL_CREATE_RESET_COMMAND_BUFFER_BIT;
        VkCheck(vkCreateCommandPool(device,&pool,nullptr,&commandPool),"command pool");
        VkCommandBufferAllocateInfo allocate{VK_STRUCTURE_TYPE_COMMAND_BUFFER_ALLOCATE_INFO};
        allocate.commandPool=commandPool; allocate.level=VK_COMMAND_BUFFER_LEVEL_PRIMARY; allocate.commandBufferCount=1;
        VkCheck(vkAllocateCommandBuffers(device,&allocate,&cmd),"command buffer");
        VkFenceCreateInfo fenceInfo{VK_STRUCTURE_TYPE_FENCE_CREATE_INFO};
        VkCheck(vkCreateFence(device,&fenceInfo,nullptr,&fence),"fence");
        VkQueryPoolCreateInfo query{VK_STRUCTURE_TYPE_QUERY_POOL_CREATE_INFO};
        query.queryType=VK_QUERY_TYPE_TIMESTAMP; query.queryCount=Burst*2;
        VkCheck(vkCreateQueryPool(device,&query,nullptr,&queries),"timestamp queries");
        const auto assets=std::filesystem::current_path()/"assets/runtime/images";
        const auto poolGeometry=LoadImage(factory,assets/"pool.jpg");
        const char* names[]{"pool_base.jpg","pool_shading.jpg","pool_caustic_effect.jpg"};
        for (int i=0;i<3;++i) {
            const auto image=LoadImage(factory,assets/names[i]);
            textures[i]=Image(image.w,image.h,VK_IMAGE_USAGE_SAMPLED_BIT|VK_IMAGE_USAGE_TRANSFER_DST_BIT);
            auto staging=Buffer(image.rgba.size(),VK_BUFFER_USAGE_TRANSFER_SRC_BIT);
            std::memcpy(staging.mapped,image.rgba.data(),image.rgba.size());
            Begin();
            Barrier(textures[i].image,VK_IMAGE_LAYOUT_UNDEFINED,VK_IMAGE_LAYOUT_TRANSFER_DST_OPTIMAL,
                VK_PIPELINE_STAGE_TOP_OF_PIPE_BIT,VK_PIPELINE_STAGE_TRANSFER_BIT,0,VK_ACCESS_TRANSFER_WRITE_BIT);
            VkBufferImageCopy copy{}; copy.imageSubresource={VK_IMAGE_ASPECT_COLOR_BIT,0,0,1};
            copy.imageExtent={image.w,image.h,1};
            vkCmdCopyBufferToImage(cmd,staging.buffer,textures[i].image,VK_IMAGE_LAYOUT_TRANSFER_DST_OPTIMAL,1,&copy);
            Barrier(textures[i].image,VK_IMAGE_LAYOUT_TRANSFER_DST_OPTIMAL,VK_IMAGE_LAYOUT_SHADER_READ_ONLY_OPTIMAL,
                VK_PIPELINE_STAGE_TRANSFER_BIT,VK_PIPELINE_STAGE_FRAGMENT_SHADER_BIT,
                VK_ACCESS_TRANSFER_WRITE_BIT,VK_ACCESS_SHADER_READ_BIT);
            Submit();
            std::printf("texture %s %ux%u\n",names[i],image.w,image.h);
        }
        for (int layer=0;layer<3;++layer) for (int x=0;x<=15;++x) for (int y=0;y<=5;++y) {
            const Vertex g{x,y,layer,float(x*3.0f*2*PI/15.0f),float(y*3.0f*2*PI/5.0f)};
            grid.push_back(g);
            const float px=layer==2 ? (704.0f/15)*x+45 : (poolGeometry.w/15.0f)*x+35;
            const float py=layer==2 ? 30.0f*y+288 : (poolGeometry.h/5.0f)*y+279;
            const float alpha=layer!=2 ? 1 : (x==0 || x==15 || y==0) ? 32.0f/255 :
                x<=7 ? 192.0f/255 : 128.0f/255;
            unique.push_back({{px,py,1,1,1,alpha,float(x),float(y),
                0x04000000u|unsigned(layer),layer==2 ? 3u : 1u},g.xPhase,g.yPhase});
        }
        constexpr int ox[]{0,0,1,0,1,1},oy[]{0,1,1,0,1,0};
        for (int layer=0;layer<3;++layer) for (int x=0;x<15;++x) for (int y=0;y<5;++y)
            for (int k=0;k<6;++k) {
                const auto at=unsigned(At(layer,x+ox[k],y+oy[k]));
                indices.push_back(at); triangles.push_back(unique[at]);
            }
        cpuVertices.resize(indices.size());
        dynamic=Buffer(Burst*indices.size()*40,VK_BUFFER_USAGE_VERTEX_BUFFER_BIT);
        staticList=Buffer(triangles.size()*48,VK_BUFFER_USAGE_VERTEX_BUFFER_BIT);
        staticIndexed=Buffer(unique.size()*48,VK_BUFFER_USAGE_VERTEX_BUFFER_BIT);
        index=Buffer(indices.size()*4,VK_BUFFER_USAGE_INDEX_BUFFER_BIT);
        readback=Buffer(TargetW*TargetH*4,VK_BUFFER_USAGE_TRANSFER_DST_BIT);
        std::memcpy(staticList.mapped,triangles.data(),triangles.size()*48);
        std::memcpy(staticIndexed.mapped,unique.data(),unique.size()*48);
        std::memcpy(index.mapped,indices.data(),indices.size()*4);
        target=Image(800,600,VK_IMAGE_USAGE_COLOR_ATTACHMENT_BIT|VK_IMAGE_USAGE_TRANSFER_SRC_BIT);
        VkAttachmentDescription attachment{}; attachment.format=VK_FORMAT_R8G8B8A8_UNORM;
        attachment.samples=VK_SAMPLE_COUNT_1_BIT; attachment.loadOp=VK_ATTACHMENT_LOAD_OP_CLEAR;
        attachment.storeOp=VK_ATTACHMENT_STORE_OP_STORE; attachment.initialLayout=VK_IMAGE_LAYOUT_UNDEFINED;
        attachment.finalLayout=VK_IMAGE_LAYOUT_COLOR_ATTACHMENT_OPTIMAL;
        VkAttachmentReference reference{0,VK_IMAGE_LAYOUT_COLOR_ATTACHMENT_OPTIMAL};
        VkSubpassDescription subpass{}; subpass.pipelineBindPoint=VK_PIPELINE_BIND_POINT_GRAPHICS;
        subpass.colorAttachmentCount=1; subpass.pColorAttachments=&reference;
        VkSubpassDependency dependency{};
        dependency.srcSubpass=VK_SUBPASS_EXTERNAL; dependency.dstSubpass=0;
        dependency.srcStageMask=dependency.dstStageMask=VK_PIPELINE_STAGE_COLOR_ATTACHMENT_OUTPUT_BIT;
        dependency.srcAccessMask=VK_ACCESS_COLOR_ATTACHMENT_WRITE_BIT;
        dependency.dstAccessMask=VK_ACCESS_COLOR_ATTACHMENT_WRITE_BIT;
        VkRenderPassCreateInfo pass{VK_STRUCTURE_TYPE_RENDER_PASS_CREATE_INFO};
        pass.attachmentCount=1; pass.pAttachments=&attachment; pass.subpassCount=1; pass.pSubpasses=&subpass;
        pass.dependencyCount=1; pass.pDependencies=&dependency;
        VkCheck(vkCreateRenderPass(device,&pass,nullptr,&renderPass),"render pass");
        VkFramebufferCreateInfo fb{VK_STRUCTURE_TYPE_FRAMEBUFFER_CREATE_INFO};
        fb.renderPass=renderPass; fb.attachmentCount=1; fb.pAttachments=&target.view; fb.width=800; fb.height=600; fb.layers=1;
        VkCheck(vkCreateFramebuffer(device,&fb,nullptr,&framebuffer),"framebuffer");
        VkDescriptorSetLayoutBinding binding{0,VK_DESCRIPTOR_TYPE_COMBINED_IMAGE_SAMPLER,1,VK_SHADER_STAGE_FRAGMENT_BIT,nullptr};
        VkDescriptorSetLayoutCreateInfo set{VK_STRUCTURE_TYPE_DESCRIPTOR_SET_LAYOUT_CREATE_INFO};
        set.bindingCount=1; set.pBindings=&binding;
        VkCheck(vkCreateDescriptorSetLayout(device,&set,nullptr,&setLayout),"descriptor layout");
        VkPushConstantRange range{VK_SHADER_STAGE_VERTEX_BIT,0,sizeof(Push)};
        VkPipelineLayoutCreateInfo layout{VK_STRUCTURE_TYPE_PIPELINE_LAYOUT_CREATE_INFO};
        layout.setLayoutCount=1; layout.pSetLayouts=&setLayout; layout.pushConstantRangeCount=1; layout.pPushConstantRanges=&range;
        VkCheck(vkCreatePipelineLayout(device,&layout,nullptr,&pipelineLayout),"pipeline layout");
        VkDescriptorPoolSize size{VK_DESCRIPTOR_TYPE_COMBINED_IMAGE_SAMPLER,3};
        VkDescriptorPoolCreateInfo descriptors{VK_STRUCTURE_TYPE_DESCRIPTOR_POOL_CREATE_INFO};
        descriptors.maxSets=3; descriptors.poolSizeCount=1; descriptors.pPoolSizes=&size;
        VkCheck(vkCreateDescriptorPool(device,&descriptors,nullptr,&descriptorPool),"descriptor pool");
        const VkDescriptorSetLayout layouts[]{setLayout,setLayout,setLayout};
        VkDescriptorSetAllocateInfo setsInfo{VK_STRUCTURE_TYPE_DESCRIPTOR_SET_ALLOCATE_INFO};
        setsInfo.descriptorPool=descriptorPool; setsInfo.descriptorSetCount=3; setsInfo.pSetLayouts=layouts;
        VkCheck(vkAllocateDescriptorSets(device,&setsInfo,sets),"descriptor sets");
        VkSamplerCreateInfo sample{VK_STRUCTURE_TYPE_SAMPLER_CREATE_INFO};
        sample.magFilter=sample.minFilter=VK_FILTER_NEAREST;
        sample.mipmapMode=VK_SAMPLER_MIPMAP_MODE_NEAREST; sample.maxLod=0;
        VkCheck(vkCreateSampler(device,&sample,nullptr,&sampler),"sampler");
        for (int i=0;i<3;++i) {
            VkDescriptorImageInfo texture{sampler,textures[i].view,VK_IMAGE_LAYOUT_SHADER_READ_ONLY_OPTIMAL};
            VkWriteDescriptorSet write{VK_STRUCTURE_TYPE_WRITE_DESCRIPTOR_SET};
            write.dstSet=sets[i]; write.descriptorCount=1; write.descriptorType=VK_DESCRIPTOR_TYPE_COMBINED_IMAGE_SAMPLER;
            write.pImageInfo=&texture; vkUpdateDescriptorSets(device,1,&write,0,nullptr);
            Pipeline(i,shaderDirectory);
        }
    }
    void Prepare(unsigned tick,int slot)
    {
        const auto time=CpuTimes(tick);
        for (std::size_t i=0;i<grid.size();++i) values[i]=CpuValue(grid[i],time);
        for (std::size_t i=0;i<indices.size();++i) {
            cpuVertices[i]=triangles[i].draw; cpuVertices[i].u=values[indices[i]].u; cpuVertices[i].v=values[indices[i]].v;
        }
        std::memcpy(static_cast<char*>(dynamic.mapped)+slot*indices.size()*40,cpuVertices.data(),indices.size()*40);
    }
    std::vector<double> Batch(int path,const unsigned* ticks,int count,bool copyPixels=false)
    {
        if (path==0) for (int i=0;i<count;++i) Prepare(ticks[i],i);
        Begin(); vkCmdResetQueryPool(cmd,queries,0,unsigned(count*2));
        for (int i=0;i<count;++i) {
            // Separate GPU samples without host waits or batched-throughput timing.
            vkCmdPipelineBarrier(cmd,VK_PIPELINE_STAGE_ALL_COMMANDS_BIT,VK_PIPELINE_STAGE_ALL_COMMANDS_BIT,
                0,0,nullptr,0,nullptr,0,nullptr);
            vkCmdWriteTimestamp(cmd,VK_PIPELINE_STAGE_TOP_OF_PIPE_BIT,queries,unsigned(i*2));
            VkClearValue clear{}; clear.color={{.05f,.1f,.15f,1}};
            VkRenderPassBeginInfo pass{VK_STRUCTURE_TYPE_RENDER_PASS_BEGIN_INFO};
            pass.renderPass=renderPass; pass.framebuffer=framebuffer; pass.renderArea={{0,0},{800,600}};
            pass.clearValueCount=1; pass.pClearValues=&clear;
            vkCmdBeginRenderPass(cmd,&pass,VK_SUBPASS_CONTENTS_INLINE);
            vkCmdBindPipeline(cmd,VK_PIPELINE_BIND_POINT_GRAPHICS,pipelines[path]);
            const VkDeviceSize offset=path==0 ? VkDeviceSize(i)*indices.size()*40 : 0;
            const auto vbo=path==0 ? dynamic.buffer : path==1 ? staticList.buffer : staticIndexed.buffer;
            vkCmdBindVertexBuffers(cmd,0,1,&vbo,&offset);
            if (path==2) vkCmdBindIndexBuffer(cmd,index.buffer,0,VK_INDEX_TYPE_UINT32);
            Push push; push.time=CpuTimes(ticks[i]);
            vkCmdPushConstants(cmd,pipelineLayout,VK_SHADER_STAGE_VERTEX_BIT,0,sizeof(push),&push);
            for (unsigned layer=0;layer<3;++layer) {
                vkCmdBindDescriptorSets(cmd,VK_PIPELINE_BIND_POINT_GRAPHICS,pipelineLayout,0,1,&sets[layer],0,nullptr);
                if (path==2) vkCmdDrawIndexed(cmd,450,1,layer*450,0,0);
                else vkCmdDraw(cmd,450,1,layer*450,0);
            }
            vkCmdEndRenderPass(cmd);
            vkCmdWriteTimestamp(cmd,VK_PIPELINE_STAGE_BOTTOM_OF_PIPE_BIT,queries,unsigned(i*2+1));
        }
        if (copyPixels) {
            Barrier(target.image,VK_IMAGE_LAYOUT_COLOR_ATTACHMENT_OPTIMAL,VK_IMAGE_LAYOUT_TRANSFER_SRC_OPTIMAL,
                VK_PIPELINE_STAGE_COLOR_ATTACHMENT_OUTPUT_BIT,VK_PIPELINE_STAGE_TRANSFER_BIT,
                VK_ACCESS_COLOR_ATTACHMENT_WRITE_BIT,VK_ACCESS_TRANSFER_READ_BIT);
            VkBufferImageCopy copy{}; copy.imageSubresource={VK_IMAGE_ASPECT_COLOR_BIT,0,0,1}; copy.imageExtent={800,600,1};
            vkCmdCopyImageToBuffer(cmd,target.image,VK_IMAGE_LAYOUT_TRANSFER_SRC_OPTIMAL,readback.buffer,1,&copy);
            VkMemoryBarrier host{VK_STRUCTURE_TYPE_MEMORY_BARRIER};
            host.srcAccessMask=VK_ACCESS_TRANSFER_WRITE_BIT; host.dstAccessMask=VK_ACCESS_HOST_READ_BIT;
            vkCmdPipelineBarrier(cmd,VK_PIPELINE_STAGE_TRANSFER_BIT,VK_PIPELINE_STAGE_HOST_BIT,0,1,&host,0,nullptr,0,nullptr);
        }
        Submit();
        std::array<unsigned long long,Burst*2> stamps{};
        VkCheck(vkGetQueryPoolResults(device,queries,0,unsigned(count*2),count*2*sizeof(stamps[0]),
            stamps.data(),sizeof(stamps[0]),VK_QUERY_RESULT_64_BIT),"completed timestamps");
        const auto mask=validBits==64 ? ~0ull : (1ull<<validBits)-1;
        std::vector<double> times;
        for (int i=0;i<count;++i) {
            const auto delta=(stamps[i*2+1]-stamps[i*2])&mask;
            timestampGcd=std::gcd(timestampGcd,delta);
            times.push_back(double(delta)*properties.limits.timestampPeriod/1000.0);
        }
        return times;
    }
    void Validate()
    {
        std::vector<unsigned char> expected(800*600*4);
        unsigned maxError=0; double sum=0; unsigned long long count=0;
        for (const unsigned tick:{0u,158399u,158400u,1771218101u}) {
            Batch(0,&tick,1,true); std::memcpy(expected.data(),readback.mapped,expected.size());
            for (int path=1;path<3;++path) {
                Batch(path,&tick,1,true); const auto got=static_cast<unsigned char*>(readback.mapped);
                for (std::size_t i=0;i<expected.size();++i) {
                    const auto error=unsigned(std::abs(int(expected[i])-int(got[i])));
                    maxError=std::max(maxError,error); sum+=error; ++count;
                }
            }
        }
        std::printf("PRE-TIMING textured image max_byte_error=%u mean_abs_byte_error=%.9g\n",maxError,sum/count);
        Require(maxError<=16,"Intel textured image exceeded unchanged tolerance; no timing performed");
    }
    ~VkPool()
    {
        if (device) {
            vkDeviceWaitIdle(device);
            for (const auto pipeline:pipelines) if (pipeline) vkDestroyPipeline(device,pipeline,nullptr);
            if (framebuffer) vkDestroyFramebuffer(device,framebuffer,nullptr);
            if (renderPass) vkDestroyRenderPass(device,renderPass,nullptr);
            if (pipelineLayout) vkDestroyPipelineLayout(device,pipelineLayout,nullptr);
            if (descriptorPool) vkDestroyDescriptorPool(device,descriptorPool,nullptr);
            if (setLayout) vkDestroyDescriptorSetLayout(device,setLayout,nullptr);
            if (sampler) vkDestroySampler(device,sampler,nullptr);
            if (queries) vkDestroyQueryPool(device,queries,nullptr);
            if (commandPool) vkDestroyCommandPool(device,commandPool,nullptr);
            if (fence) vkDestroyFence(device,fence,nullptr);
            for (const auto image:images) {
                vkDestroyImageView(device,image.view,nullptr); vkDestroyImage(device,image.image,nullptr);
                vkFreeMemory(device,image.memory,nullptr);
            }
            for (const auto buffer:buffers) {
                vkUnmapMemory(device,buffer.memory); vkDestroyBuffer(device,buffer.buffer,nullptr);
                vkFreeMemory(device,buffer.memory,nullptr);
            }
            vkDestroyDevice(device,nullptr);
        }
        if (instance) vkDestroyInstance(instance,nullptr);
    }
};
}
int main(int argc,char** argv)
try {
    if (argc>2 && std::strcmp(argv[1],"--emit-shaders")==0) {
        EmitShaders(argv[2]); std::puts("generated Vulkan shader sources"); return 0;
    }
    VkPool pool;
    if (argc==1 || std::strcmp(argv[1],"--probe")==0) return 0;
    Require(SetThreadAffinityMask(GetCurrentThread(),1)!=0,"CPU0 affinity");
    const unsigned order=argc>2 ? unsigned(std::strtoul(argv[2],nullptr,10))%3 : 0;
    Require(SUCCEEDED(CoInitializeEx(nullptr,COINIT_MULTITHREADED)),"COM initialize");
    ComPtr<IWICImagingFactory> factory;
    Require(SUCCEEDED(CoCreateInstance(CLSID_WICImagingFactory,nullptr,CLSCTX_INPROC_SERVER,
        IID_PPV_ARGS(&factory))),"WIC factory");
    pool.Setup(factory.Get(),argv[1]); pool.Validate();
    std::printf("headless Vulkan single_pool RGBA8 800x600; order=%u; CPU not timed; frames=%d rounds=%d burst=%d\n",
        order,Frames,Rounds,Burst);
    std::vector<double> samples[3];
    std::array<unsigned,Burst> warm{};
    for (int path=0;path<3;++path) for (int block=0;block<WarmupBlocks;++block) {
        for (int i=0;i<Burst;++i) warm[i]=unsigned(block*Burst+i);
        pool.Batch(path,warm.data(),Burst);
    }
    unsigned seed=0x60191981; std::array<unsigned,Frames> ticks{};
    for (int round=0;round<Rounds;++round) {
        for (auto& tick:ticks) { seed^=seed<<13; seed^=seed>>17; seed^=seed<<5; tick=seed; }
        for (int position=0;position<3;++position) {
            const int path=int((order+round+(round&1 ? 2-position : position))%3);
            std::vector<double> current;
            for (int block=0;block<Frames/Burst;++block) {
                auto result=pool.Batch(path,ticks.data()+block*Burst,Burst);
                current.insert(current.end(),result.begin(),result.end());
            }
            std::printf("round %d path %c gpu_p50_us %.6f\n",round,'A'+path,Percentile(current,.5));
            samples[path].insert(samples[path].end(),current.begin(),current.end());
        }
    }
    for (int path=0;path<3;++path) {
        std::printf("path %c samples %zu",'A'+path,samples[path].size());
        PrintDistribution("gpu",samples[path]); std::putchar('\n');
    }
    std::printf("elapsed_timestamp_ticks_gcd %llu, observed_elapsed_quantum_ns %.9g\n",
        pool.timestampGcd,double(pool.timestampGcd)*pool.properties.limits.timestampPeriod);
    std::puts("PASS: Intel Vulkan VS->fragment textures->offscreen target; no timed pixel/UV readback, no CPU timing.");
    factory.Reset(); CoUninitialize(); return 0;
} catch (const std::exception& error) {
    std::fprintf(stderr,"FAIL: %s\n",error.what());
    return 1;
}
