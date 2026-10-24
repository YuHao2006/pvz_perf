#include "VulkanRenderer.h"
#include "TestWin32Window.h"
#include "SexyAppFramework/misc/FastMath.h"
#include <algorithm>
#include <array>
#include <atomic>
#include <cmath>
#include <chrono>
#include <filesystem>
#include <iostream>
#include <numeric>
#include <stdexcept>
#include <string>
#include <vector>

namespace Sexy {
const char* GetLogFilePathC(const char* name) {
    static thread_local std::string path;
    std::filesystem::create_directories("reanim-test-output");
    path=std::string("reanim-test-output/")+name;
    return path.c_str();
}
}
namespace {
using namespace Sexy;
std::atomic<unsigned> errors=0;
VkBool32 VKAPI_CALL Validate(VkDebugUtilsMessageSeverityFlagBitsEXT severity,
    VkDebugUtilsMessageTypeFlagsEXT types,const VkDebugUtilsMessengerCallbackDataEXT* data,void* user) {
    if (severity>=VK_DEBUG_UTILS_MESSAGE_SEVERITY_ERROR_BIT_EXT) ++errors;
    return VulkanInitConfig::DefaultDebugCallback(severity,types,data,user);
}
void Require(bool result,const char* message) {
    if (!result) throw std::runtime_error(message);
}
using Point=std::array<float,4>;
float Lerp(float a,float b,float t) { return a+t*(b-a); }
struct CpuTriangles {
    std::array<GpuVertex,18> vertices;
    size_t count=0;
    operator std::span<const GpuVertex>() const { return {vertices.data(),count}; }
};
CpuTriangles Reference(const GpuReanimKey& a,const GpuReanimKey& b,
    const GpuReanimGeometry& base,const GpuReanimGeometry& source,
    const GpuReanimDraw& job,uint32_t slot,const GpuClip* clip) {
    const auto t=job.fraction;
    int alpha=int(Lerp(a.alpha,b.alpha,t)*float(job.color>>24)+0.5f);
    alpha=std::clamp(alpha,0,255);
    if (a.frame<0 || !a.imageSlot || !alpha || !source.width || !source.height ||
        (job.truncate && a.frame!=-1 && b.frame==-1 && t>0)) return {};
    const float x=-(Lerp(a.skewX,b.skewX,t)*0.017453292f);
    const float y=-(Lerp(a.skewY,b.skewY,t)*0.017453292f);
    const float sx=Lerp(a.scaleX,b.scaleX,t),sy=Lerp(a.scaleY,b.scaleY,t);
    const float m00=FastCos(x)*sx,m10=-FastSin(x)*sx,m01=FastSin(y)*sy,m11=FastCos(y)*sy;
    const float cx=m00*(base.width*0.5f)+m01*(base.height*0.5f)+Lerp(a.transX,b.transX,t);
    const float cy=m10*(base.width*0.5f)+m11*(base.height*0.5f)+Lerp(a.transY,b.transY,t);
    const float xx=job.overlay00*m00+job.overlay01*m10,xy=job.overlay00*m01+job.overlay01*m11;
    const float yx=job.overlay10*m00+job.overlay11*m10,yy=job.overlay10*m01+job.overlay11*m11;
    const float ox=(job.overlay00*cx+job.overlay01*cy+job.overlay02)+job.translateX;
    const float oy=(job.overlay10*cx+job.overlay11*cy+job.overlay12)+job.translateY;
    std::array<Point,8> polygon{{
        {-source.width/2,-source.height/2,source.u0,source.v0},
        {-source.width/2,source.height/2,source.u0,source.v1},
        {source.width/2,source.height/2,source.u1,source.v1},
        {source.width/2,-source.height/2,source.u1,source.v0}}};
    size_t count=4;
    for (size_t i=0;i<count;++i) {
        auto& point=polygon[i];
        const auto px=point[0],py=point[1];
        point[0]=xx*px+xy*py+ox; point[1]=yx*px+yy*py+oy;
    }
    if (clip) {
        const float boundaries[]={float(clip->x),float(clip->y),
            float(clip->x+clip->width),float(clip->y+clip->height)};
        for (int edge=0;edge<4;++edge) {
            std::array<Point,8> output{};
            size_t written=0;
            const int axis=edge%2;
            for (size_t i=0;i<count;++i) {
                const auto& p=polygon[(i+count-1)%count];
                const auto& q=polygon[i];
                const bool pin=edge<2?p[axis]>=boundaries[edge]:p[axis]<boundaries[edge];
                const bool qin=edge<2?q[axis]>=boundaries[edge]:q[axis]<boundaries[edge];
                if (pin!=qin) {
                    const auto f=(boundaries[edge]-p[axis])/(q[axis]-p[axis]);
                    Point intersection{};
                    for (int j=0;j<4;++j) intersection[j]=p[j]+(q[j]-p[j])*f;
                    output[written++]=intersection;
                }
                if (qin) output[written++]=q;
            }
            polygon=std::move(output);
            count=written;
        }
    }
    CpuTriangles result;
    const auto emit=[&](const Point& p) {
        result.vertices[result.count++]={p[0],p[1],float((job.color>>16)&255)/255,
            float((job.color>>8)&255)/255,float(job.color&255)/255,float(alpha)/255,
            p[2],p[3],slot|job.samplingFlags,job.sampler};
    };
    if (clip) {
        for (size_t i=1;i+1<count;++i) {emit(polygon[0]);emit(polygon[i]);emit(polygon[i+1]);}
    } else {
        for (int index:{0,1,3,1,3,2}) emit(polygon[size_t(index)]);
    }
    return result;
}
void Clear(VulkanRenderer& renderer) {
    const uint32_t slot=VulkanRenderer::SlotOf(renderer.whiteTexture);
    const float w=float(renderer.sceneWidth),h=float(renderer.sceneHeight);
    const GpuVertex quad[]={
        {0,0,0,0,0,1,0,0,slot,0},{w,0,0,0,0,1,1,0,slot,0},{w,h,0,0,0,1,1,1,slot,0},
        {0,0,0,0,0,1,0,0,slot,0},{w,h,0,0,0,1,1,1,slot,0},{0,h,0,0,0,1,0,1,slot,0}};
    renderer.SubmitTriangles(quad,renderer.whiteTexture,false,false,GpuBlend::Opaque);
}
void Run() {
    VulkanTest::Window native(64,64);
    VulkanInitConfig config; config.enableValidation=true; config.debugCallback=Validate;
    VulkanContext window(config,native.hwnd,VulkanTest::SwapchainConfig());
    const std::string shaders=PVZ_NATIVE_SHADER_DIR;
    VulkanRenderer renderer(window,64,64,shaders+"/game_vs.spv",shaders+"/game_ps.spv");
    const std::array<GpuReanimKey,2> keys{{
        {5.25f,8.125f,-15,23,1.15f,0.9f,0.8f,0,1},
        {13.5f,11.25f,37,-18,-0.75f,1.1f,0.35f,-1,1}}};
    const std::array<GpuReanimTrack,3> tracks{{{0,2},{GpuReanimNoKeys,0},{0,2}}};
    const std::array<GpuReanimGeometry,4> geometry{{
        {},{20,24,0,0,1,1},{},{28,12,1,0,0,1}}};
    auto uploadKeys=keys; auto uploadGeometry=geometry;
    auto* definition=renderer.UploadReanimDefinition({tracks,uploadKeys,uploadGeometry,2,2});
    uploadKeys={}; uploadGeometry={}; // The upload must snapshot these spans.
    const uint32_t texels[]={0xffff0000,0xff00ff00,0xff0000ff,0xffffff00};
    auto* texture=renderer.CreateTexture(2,2,texels,8);
    const GpuClip clip{10,10,22,25};
    unsigned cases=0;
    for (uint32_t variant:{0u,1u}) for (float fraction:{0.0f,0.375f,1.0f})
        for (bool clipped:{false,true}) for (bool truncate:{false,true}) {
            GpuReanimDraw draw{};
            draw.track=2; draw.before=0; draw.after=1; draw.variant=variant; draw.fraction=fraction;
            draw.translateX=-0.5f; draw.translateY=1.25f;
            draw.overlay00=1;draw.overlay01=0.15f;draw.overlay02=8;
            draw.overlay10=-0.1f;draw.overlay11=1;draw.overlay12=5;
            draw.color=0xc0e0d0ff;draw.truncate=truncate;
            const auto* requested=clipped?&clip:nullptr;
            Require(renderer.BeginScene(),"Cannot start reference scene"); Clear(renderer);
            const auto vertices=Reference(keys[0],keys[1],geometry[1],geometry[variant*2+1],
                draw,VulkanRenderer::SlotOf(texture),requested);
            renderer.SubmitTriangles(vertices,texture,false,false,GpuBlend::Normal);
            renderer.SubmitTriangles(vertices,texture,false,false,GpuBlend::Additive);
            renderer.SubmitTriangles(vertices,texture,false,false,GpuBlend::Normal);
            renderer.EndSceneAndPresent();
            const auto expected=renderer.ReadScenePixels();
            Require(renderer.BeginScene(),"Cannot start resident scene"); Clear(renderer);
            auto unsupported=draw; unsupported.track=1;
            Require(!renderer.SubmitReanim(definition,texture,unsupported,false,false,GpuBlend::Normal),
                "CPU-only logical track unexpectedly became a GPU track");
            Require(renderer.SubmitReanim(definition,texture,draw,false,false,GpuBlend::Normal,requested),
                "Resident draw rejected valid track");
            // Ordinary triangles between GPU jobs exercise shared-stream
            // painter order and prelude writes to noncontiguous reservations.
            renderer.SubmitTriangles(vertices,texture,false,false,GpuBlend::Additive);
            Require(renderer.SubmitReanim(definition,texture,draw,false,false,GpuBlend::Normal,requested),
                "Resident draw rejected a later reservation in the mixed stream");
            renderer.EndSceneAndPresent();
            const auto actual=renderer.ReadScenePixels();
            for (size_t i=0;i<actual.size();++i) for (unsigned shift:{0u,8u,16u,24u})
                Require(std::abs(int((actual[i]>>shift)&255)-int((expected[i]>>shift)&255))<=3,
                    "Resident interpolation/geometry/clipping/painter-order pixel mismatch");
            ++cases;
        }
    // Image-only submission also runs the prelude and protects deferred deletion.
    auto* image=renderer.CreateRenderImage(64,64);
    renderer.SetRenderImage(image);
    Require(renderer.BeginScene(),"Cannot start image-only reanimation batch");
    GpuReanimDraw draw{};draw.track=0;draw.overlay00=draw.overlay11=1;draw.color=0xffffffff;
    Require(renderer.SubmitReanim(definition,texture,draw,false,false,GpuBlend::Normal,&clip),
        "Cannot draw resident reanimation into render image");
    renderer.DestroyReanimDefinition(definition); renderer.DestroyTexture(texture);
    renderer.EndSceneAndPresent(); renderer.SetRenderImage(nullptr);
    renderer.DestroyTexture(image);
    Require(renderer.BeginScene(),"Cannot retire resident resources"); renderer.EndSceneAndPresent();
    Require(errors.load()==0,"Vulkan validation errors");
    std::cout<<"PASS "<<cases<<" resident CPU/GPU pixel cases, CPU-only indexes, mixed stream, image-only lifetime\n";
}
#if defined(PVZ_REANIM_BENCHMARK)
struct Timing { double cpu=0, jobs=0, gpu=0; };
Timing BenchmarkBurst(VulkanRenderer& renderer,VulkanContext& window,VulkanReanim* definition,
    VulkanTexture* texture,const std::vector<GpuReanimKey>& keys,std::vector<GpuReanimDraw>& draws,
    const GpuReanimGeometry& geometry,bool resident,bool clipped,
    const std::array<VkQueryPool,16>& queries,double timestampPeriod,unsigned phase) {
    using Clock=std::chrono::steady_clock;
    Timing result;
    const GpuClip clip{6,6,782,582};
    const auto slot=VulkanRenderer::SlotOf(texture);
    for (size_t frame=0;frame<queries.size();++frame) {
        renderer.frameTimestampQueries=queries[frame];
        Require(renderer.BeginScene(),"Cannot start benchmark frame");
        const auto start=Clock::now();
        Clear(renderer);
        const float fraction=float((phase+unsigned(frame))%31)/31.0f;
        for (size_t i=0;i<draws.size();++i) {
            auto& draw=draws[i]; draw.fraction=fraction;
            if (resident) {
                Require(renderer.SubmitReanim(definition,texture,draw,false,false,GpuBlend::Normal,
                    clipped?&clip:nullptr),"Benchmark resident submission rejected");
            } else {
                const auto vertices=Reference(keys[2*i],keys[2*i+1],geometry,geometry,draw,slot,
                    clipped?&clip:nullptr);
                renderer.SubmitTriangles(vertices,texture,false,false,GpuBlend::Normal);
            }
        }
        const auto jobsEnd=Clock::now();
        renderer.EndSceneAndPresent();
        const auto end=Clock::now();
        result.jobs+=std::chrono::duration<double,std::micro>(jobsEnd-start).count();
        result.cpu+=std::chrono::duration<double,std::micro>(end-start).count();
    }
    window.WaitForFrame();
    // Only scalar timer results are read, after the complete burst and outside
    // CPU samples. There is no image/vertex readback in these timing loops.
    for (auto query:queries) {
        uint64_t ticks[2]{};
        Require(vkGetQueryPoolResults(window.device,query,0,2,sizeof(ticks),ticks,sizeof(uint64_t),
            VK_QUERY_RESULT_64_BIT)==VK_SUCCESS,"Benchmark timestamps unavailable");
        result.gpu+=double(ticks[1]-ticks[0])*timestampPeriod/1000.0;
    }
    result.cpu/=queries.size(); result.jobs/=queries.size();result.gpu/=queries.size();
    return result;
}
double Median(std::vector<double> values) {
    std::sort(values.begin(),values.end()); return values[values.size()/2];
}
double Mean(const std::vector<double>& values) {
    return std::accumulate(values.begin(),values.end(),0.0)/double(values.size());
}
void Benchmark() {
    VulkanTest::Window native(800,600);
    VulkanInitConfig config;
    VulkanContext window(config,native.hwnd,VulkanTest::SwapchainConfig());
    VkPhysicalDeviceProperties properties{};
    vkGetPhysicalDeviceProperties(window.physicalDevice,&properties);
    std::cout<<"Vulkan resident benchmark adapter="<<properties.deviceName
        <<" timestampPeriodNs="<<properties.limits.timestampPeriod
        <<" unlocked clocks; CPU excludes BeginScene acquire/prior-frame wait; CPU includes "
          "clear, track work, upload, prelude recording, submit and present call. "
          "GPU timestamps bracket prelude+scene+present-quad commands, exclude WSI present wait.\n";
    const std::string shaders=PVZ_NATIVE_SHADER_DIR;
    VulkanRenderer renderer(window,800,600,shaders+"/game_vs.spv",shaders+"/game_ps.spv");
    const uint32_t texels[]={0xffff8020,0xff20ff80,0xff8020ff,0xffe0e020};
    auto* texture=renderer.CreateTexture(2,2,texels,8);
    std::array<VkQueryPool,16> queries{};
    VkQueryPoolCreateInfo pool{VK_STRUCTURE_TYPE_QUERY_POOL_CREATE_INFO};
    pool.queryType=VK_QUERY_TYPE_TIMESTAMP;pool.queryCount=2;
    for (auto& query:queries)
        Require(vkCreateQueryPool(window.device,&pool,nullptr,&query)==VK_SUCCESS,"Cannot create benchmark queries");
    unsigned gates=0,meanGates=0,total=0;
    for (uint32_t count:{256u,512u,2048u,8192u}) {
        std::vector<GpuReanimTrack> tracks(count);
        std::vector<GpuReanimKey> keys(count*2);
        std::vector<GpuReanimDraw> draws(count);
        const std::array<GpuReanimGeometry,2> geometry{{{},{10,12,0,0,1,1}}};
        for (uint32_t i=0;i<count;++i) {
            tracks[i]={2*i,2};
            keys[2*i]={0.25f,0.125f,-15,23,1.15f,0.9f,0.8f,0,1};
            keys[2*i+1]={1.5f,1.25f,37,-18,0.75f,1.1f,0.35f,0,1};
            auto& draw=draws[i];
            draw.track=i;draw.before=0;draw.after=1;
            draw.translateX=draw.translateY=-0.5f;
            draw.overlay00=draw.overlay11=1;
            draw.overlay02=float(i%64)*12+4;draw.overlay12=float((i/64)%48)*12+4;
            draw.color=0xc0e0d0ff;
        }
        auto* definition=renderer.UploadReanimDefinition({tracks,keys,geometry,2,1});
        for (bool clipped:{false,true}) {
            std::array<std::vector<double>,6> values;
            for (unsigned round=0;round<12;++round) {
                Timing cpu,gpu;
                if (round%2==0) {
                    cpu=BenchmarkBurst(renderer,window,definition,texture,keys,draws,geometry[1],false,
                        clipped,queries,properties.limits.timestampPeriod,round*16);
                    gpu=BenchmarkBurst(renderer,window,definition,texture,keys,draws,geometry[1],true,
                        clipped,queries,properties.limits.timestampPeriod,round*16);
                } else {
                    gpu=BenchmarkBurst(renderer,window,definition,texture,keys,draws,geometry[1],true,
                        clipped,queries,properties.limits.timestampPeriod,round*16);
                    cpu=BenchmarkBurst(renderer,window,definition,texture,keys,draws,geometry[1],false,
                        clipped,queries,properties.limits.timestampPeriod,round*16);
                }
                if (round<3) continue;
                std::cout<<"sample tracks="<<count<<" clipped="<<clipped<<" round="<<round
                    <<" cpu="<<cpu.cpu<<" residentCpu="<<gpu.cpu<<" gpu="<<cpu.gpu
                    <<" residentGpu="<<gpu.gpu<<'\n';
                values[0].push_back(cpu.cpu);values[1].push_back(gpu.cpu);
                values[2].push_back(cpu.gpu);values[3].push_back(gpu.gpu);
                values[4].push_back(cpu.jobs);values[5].push_back(gpu.jobs);
            }
            const double cpu=Median(values[0]),residentCpu=Median(values[1]);
            const double gpu=Median(values[2]),residentGpu=Median(values[3]);
            const bool passed=cpu-residentCpu>std::max(0.0,residentGpu-gpu);
            const bool meanPassed=Mean(values[0])-Mean(values[1])>
                std::max(0.0,Mean(values[3])-Mean(values[2]));
            gates+=passed; ++total;
            meanGates+=meanPassed;
            std::cout<<"tracks="<<count<<" clipped="<<clipped
                <<" CPU_us="<<cpu<<"->"<<residentCpu
                <<" jobs_us="<<Median(values[4])<<"->"<<Median(values[5])
                <<" GPU_us="<<gpu<<"->"<<residentGpu
                <<" CPU_saved="<<cpu-residentCpu
                <<" GPU_added="<<residentGpu-gpu<<" gate="<<(passed?"PASS":"FAIL")
                <<" meanCPU_us="<<Mean(values[0])<<"->"<<Mean(values[1])
                <<" meanGPU_us="<<Mean(values[2])<<"->"<<Mean(values[3])
                <<" meanGate="<<(meanPassed?"PASS":"FAIL")<<std::endl;
        }
        renderer.DestroyReanimDefinition(definition);
    }
    renderer.frameTimestampQueries=VK_NULL_HANDLE;
    window.WaitForFrame();
    for (auto query:queries) vkDestroyQueryPool(window.device,query,nullptr);
    renderer.DestroyTexture(texture);
    std::cout<<"GATES median "<<gates<<"/"<<total<<" mean "<<meanGates<<"/"<<total
        <<" pass; scalar query collection outside timed CPU samples; "
        "no full-game speedup claim\n";
}
#endif
}
int main(int argc,char** argv) {
    try {
#if defined(PVZ_REANIM_BENCHMARK)
        if (argc>1 && std::string(argv[1])=="--benchmark") {Benchmark();return 0;}
#else
        (void)argc;(void)argv;
#endif
        Run(); return 0;
    }
    catch (const std::exception& error) { std::cerr<<error.what()<<'\n';return 1; }
}
