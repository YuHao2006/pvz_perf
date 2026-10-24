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
#if defined(PVZ_REANIM_GEOMETRY)
bool requestGeometry=true;
#endif
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
#if defined(PVZ_REANIM_GEOMETRY)
    config.features.geometryShader=requestGeometry?VK_TRUE:VK_FALSE;
    config.allowOptionalGeometryShader=requestGeometry;
#endif
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
#if defined(PVZ_REANIM_UNIFIED)
    if (!requestGeometry) {
        Require(!window.geometryShaderEnabled,"Disabled optional geometry feature was enabled");
        GpuReanimDraw draw{};draw.track=2;draw.after=1;draw.fraction=0.375f;
        draw.overlay00=draw.overlay11=1;draw.overlay02=12;draw.overlay12=8;draw.color=0xffffffff;
        const auto vertices=Reference(keys[0],keys[1],geometry[1],geometry[1],draw,
            VulkanRenderer::SlotOf(texture),&clip);
        Require(renderer.BeginScene(),"Cannot begin unsupported-feature CPU reference");Clear(renderer);
        renderer.SubmitTriangles(vertices,texture,false,false,GpuBlend::Normal);
        renderer.EndSceneAndPresent();const auto expected=renderer.ReadScenePixels();
        Require(renderer.BeginScene(),"Cannot begin unsupported-feature fallback");Clear(renderer);
        GpuReanimInstance instance{};instance.after=1;instance.overlay00=instance.overlay11=1;
        Require(renderer.BeginReanimInstance(definition,texture,instance,false,false,nullptr,true)==UINT32_MAX,
            "Forced packet bypassed unsupported hardware");
        Require(!renderer.SubmitReanim(definition,texture,draw,false,false,GpuBlend::Normal,&clip,true),
            "Unsupported geometry silently selected compute prototype");
        renderer.SubmitTriangles(vertices,texture,false,false,GpuBlend::Normal);
        renderer.EndSceneAndPresent();
        Require(renderer.ReadScenePixels()==expected,"Unsupported-feature CPU fallback changed pixels");
        renderer.DestroyReanimDefinition(definition);renderer.DestroyTexture(texture);
        Require(errors.load()==0,"Vulkan validation errors in unsupported-feature fallback");
        std::cout<<"PASS optional geometry disabled: forced/legacy rejected, actual CPU fallback pixels, no compute fallback\n";
        return;
    }
#endif
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
            Require(!renderer.SubmitReanim(definition,texture,unsupported,false,false,GpuBlend::Normal,nullptr,true),
                "CPU-only logical track unexpectedly became a GPU track");
            Require(renderer.SubmitReanim(definition,texture,draw,false,false,GpuBlend::Normal,requested,true),
                "Resident draw rejected valid track");
            // Ordinary triangles between GPU jobs exercise shared-stream
            // painter order and prelude writes to noncontiguous reservations.
            renderer.SubmitTriangles(vertices,texture,false,false,GpuBlend::Additive);
            Require(renderer.SubmitReanim(definition,texture,draw,false,false,GpuBlend::Normal,requested,true),
                "Resident draw rejected a later reservation in the mixed stream");
            renderer.EndSceneAndPresent();
            const auto actual=renderer.ReadScenePixels();
            for (size_t i=0;i<actual.size();++i) for (unsigned shift:{0u,8u,16u,24u})
                Require(std::abs(int((actual[i]>>shift)&255)-int((expected[i]>>shift)&255))<=3,
                    "Resident interpolation/geometry/clipping/painter-order pixel mismatch");
            ++cases;
        }
    // Definitions, texture slots, clips, filters and draw modes can change
    // inside painter order. Ordinary sprites can appear between point jobs.
    auto secondKeys=keys;secondKeys[0].transX+=4;secondKeys[1].transY-=3;
    auto blankGeometry=geometry;blankGeometry[3]={};
    auto* second=renderer.UploadReanimDefinition({tracks,secondKeys,blankGeometry,2,2});
    const uint32_t otherTexels[]={0xff20c040,0xffe02060,0xff8060f0,0xffe0a020};
    auto* other=renderer.CreateTexture(2,2,otherTexels,8);
    const GpuClip clips[]={{3,8,32,36},{12,3,19,40},{100,100,10,10}};
    std::vector<uint32_t> mixedExpected;
    for (bool resident:{false,true}) {
        Require(renderer.BeginScene(),"Cannot start mixed-state scene");Clear(renderer);
        for (unsigned i=0;i<24;++i) {
            const bool useSecond=i%3==1;
            GpuReanimDraw job{};job.track=2;job.after=1;job.fraction=float(i%7)/7;
            job.overlay00=(i%4==0)?-0.75f:1;job.overlay11=0.8f;
            job.overlay01=0.125f;job.overlay10=-0.25f;
            job.overlay02=float(i%5)*3+8;job.overlay12=float(i%3)*4+4;
            job.translateX=-0.5f;job.translateY=0.25f;
            job.color=0x9070c0e0;job.variant=i%2;
            job.samplingFlags=(i%4)*0x10000000u;
            auto* image=useSecond?other:texture;
            const auto& sourceKeys=useSecond?secondKeys:keys;
            const auto& sourceGeometry=useSecond?blankGeometry:geometry;
            const auto blend=GpuBlend(i%3);
            const auto* requested=i%4==0?nullptr:&clips[i%3];
            if (resident) Require(renderer.SubmitReanim(useSecond?second:definition,image,job,
                false,false,blend,requested,true),"Mixed-state resident job rejected");
            else renderer.SubmitTriangles(Reference(sourceKeys[0],sourceKeys[1],sourceGeometry[1],
                sourceGeometry[job.variant*2+1],job,VulkanRenderer::SlotOf(image),requested),
                image,false,false,blend);
            if (i%3==2) {
                auto marker=job;marker.color=0x407f7f7f;marker.samplingFlags=0;marker.variant=0;
                renderer.SubmitTriangles(Reference(keys[0],keys[1],geometry[1],geometry[1],
                    marker,VulkanRenderer::SlotOf(texture),nullptr),texture,false,false,GpuBlend::Normal);
            }
        }
        renderer.EndSceneAndPresent();
        const auto actual=renderer.ReadScenePixels();
        if (!resident) mixedExpected=actual;
        else for (size_t i=0;i<actual.size();++i) for (unsigned shift:{0u,8u,16u,24u})
            Require(std::abs(int((actual[i]>>shift)&255)-int((mixedExpected[i]>>shift)&255))<=3,
                "Mixed definitions/textures/filters/blends/clips/sprite-order mismatch");
    }
    renderer.DestroyReanimDefinition(second);renderer.DestroyTexture(other);
#if defined(PVZ_REANIM_UNIFIED)
    unsigned packetCases=0;
    uint32_t staleToken=UINT32_MAX;
    for (uint32_t variant:{0u,1u}) for (float fraction:{0.0f,0.375f,1.0f})
        for (bool clipped:{false,true}) for (bool truncate:{false,true}) for (bool ignore:{false,true}) {
            GpuReanimInstance instance{};
            instance.after=1;instance.variant=variant;instance.fraction=fraction;
            instance.translateX=0.375f;instance.translateY=-0.125f;
            instance.overlay00=1;instance.overlay01=0.15f;instance.overlay02=8;
            instance.overlay10=-0.1f;instance.overlay11=1;instance.overlay12=5;
            GpuReanimTrackDraw track{};track.track=2;track.color=0xc0e0d0ff;
            track.shakeX=-1.125f;track.shakeY=0.75f;
            track.flags=(truncate?GpuReanimTrackDraw::Truncate:0u)|
                (ignore?GpuReanimTrackDraw::IgnoreDefaultClip:0u);
            GpuReanimDraw legacy{};
            legacy.track=track.track;legacy.after=1;legacy.variant=variant;legacy.fraction=fraction;
            legacy.overlay00=instance.overlay00;legacy.overlay01=instance.overlay01;legacy.overlay02=instance.overlay02;
            legacy.overlay10=instance.overlay10;legacy.overlay11=instance.overlay11;legacy.overlay12=instance.overlay12;
            legacy.translateX=(track.shakeX+instance.translateX)-0.5f;
            legacy.translateY=(track.shakeY+instance.translateY)-0.5f;
            legacy.color=track.color;legacy.truncate=truncate;
            const auto* effective=clipped&&!ignore?&clip:nullptr;
            const auto vertices=Reference(keys[0],keys[1],geometry[1],geometry[variant*2+1],legacy,
                VulkanRenderer::SlotOf(texture),effective);
            Require(renderer.BeginScene(),"Cannot begin packet reference");Clear(renderer);
            renderer.SubmitTriangles(vertices,texture,false,false,GpuBlend::Normal);
            renderer.EndSceneAndPresent();const auto expected=renderer.ReadScenePixels();
            Require(renderer.BeginScene(),"Cannot begin packet resident frame");Clear(renderer);
            const auto token=renderer.BeginReanimInstance(definition,texture,instance,false,false,clipped?&clip:nullptr,true);
            Require(token!=UINT32_MAX,"Cannot begin shared reanimation instance");
            auto unsupported=track;unsupported.track=1;
            Require(!renderer.SubmitReanimTrack(token,unsupported,GpuBlend::Normal),"Packet accepted CPU-only logical track");
            Require(renderer.SubmitReanimTrack(token,track,GpuBlend::Normal),"Packet rejected image track");
            staleToken=token;
            renderer.EndSceneAndPresent();const auto actual=renderer.ReadScenePixels();
            for (size_t i=0;i<actual.size();++i) for (unsigned shift:{0u,8u,16u,24u})
                Require(std::abs(int((actual[i]>>shift)&255)-int((expected[i]>>shift)&255))<=3,
                    "Shared instance/shake/clip/variant/disappearing-frame pixel mismatch");
            ++packetCases;
        }
    Require(renderer.BeginScene(),"Cannot test expired instance token");Clear(renderer);
    GpuReanimTrackDraw unusedTrack{};unusedTrack.track=2;unusedTrack.color=0xffffffff;
    Require(!renderer.SubmitReanimTrack(staleToken,unusedTrack,GpuBlend::Normal),
        "An instance token survived a frame boundary");
    GpuReanimInstance unusedInstance{};unusedInstance.after=1;unusedInstance.overlay00=unusedInstance.overlay11=1;
    Require(renderer.BeginReanimInstance(definition,texture,unusedInstance,false,false,nullptr,true)!=UINT32_MAX,
        "Cannot create begin-only packet");
    renderer.EndSceneAndPresent();
    std::cout<<"PASS "<<packetCases<<" shared-instance pixel cases, raw translation/shake ordering, "
        "ignore clip, CPU-only indexes, begin-only group and expired frame token\n";
    // Both sides of the adaptive threshold must preserve painter order across
    // state changes and target switches; a token stays valid within the frame.
    auto* adaptiveImage=renderer.CreateRenderImage(64,64);
    for (unsigned ordinaryCount:{64u,2048u}) for (bool clipped:{false,true}) {
        std::vector<uint32_t> expected;
        for (bool resident:{false,true}) {
            Require(renderer.BeginScene(),"Cannot begin adaptive mixed-stream scene");Clear(renderer);
            GpuReanimInstance instance{};
            instance.after=1;instance.fraction=0.375f;instance.overlay00=instance.overlay11=1;
            instance.overlay02=12;instance.overlay12=8;
            uint32_t token=UINT32_MAX;
            if (resident) token=renderer.BeginReanimInstance(definition,texture,instance,false,false,clipped?&clip:nullptr,true);
            GpuReanimTrackDraw track{};track.track=2;track.color=0xb0e08040;
            GpuReanimDraw legacy{};
            legacy.track=2;legacy.after=1;legacy.fraction=instance.fraction;
            legacy.overlay00=legacy.overlay11=1;legacy.overlay02=12;legacy.overlay12=8;
            legacy.translateX=legacy.translateY=-0.5f;legacy.color=track.color;
            const auto emit=[&](GpuBlend blend) {
                if (resident) Require(renderer.SubmitReanimTrack(token,track,blend),
                    "Adaptive resident marker/token rejected");
                else renderer.SubmitTriangles(Reference(keys[0],keys[1],geometry[1],geometry[1],
                    legacy,VulkanRenderer::SlotOf(texture),clipped?&clip:nullptr),texture,false,false,blend);
            };
            emit(GpuBlend::Normal);
            for (unsigned i=0;i<ordinaryCount;++i) {
                const float x=float((i*13)%60),y=float((i*7)%60);
                const auto slot=VulkanRenderer::SlotOf(renderer.whiteTexture);
                const GpuVertex triangle[]={
                    {x,y,0.1f,0.3f,0.7f,0.125f,0,0,slot,0},
                    {x+4,y,0.1f,0.3f,0.7f,0.125f,1,0,slot,0},
                    {x,y+4,0.1f,0.3f,0.7f,0.125f,0,1,slot,0}};
                renderer.SubmitTriangles(triangle,renderer.whiteTexture,false,false,
                    i%11==0?GpuBlend::Additive:GpuBlend::Normal,i%17==0?&clip:nullptr);
            }
            emit(GpuBlend::Additive);
            // Force queued ordinary work to flush at a target boundary, then
            // reuse the shared token after restoring the main scene.
            const auto whiteSlot=VulkanRenderer::SlotOf(renderer.whiteTexture);
            const GpuVertex boundaryTriangle[]={
                {8,8,0.2f,0.8f,0.1f,0.25f,0,0,whiteSlot,0},
                {40,8,0.2f,0.8f,0.1f,0.25f,1,0,whiteSlot,0},
                {8,40,0.2f,0.8f,0.1f,0.25f,0,1,whiteSlot,0}};
            renderer.SubmitTriangles(boundaryTriangle,renderer.whiteTexture,false,false,GpuBlend::Normal);
            renderer.SetRenderImage(adaptiveImage);Clear(renderer);emit(GpuBlend::Normal);
            renderer.SetRenderImage(nullptr);emit(GpuBlend::Normal);
            renderer.EndSceneAndPresent();
            const auto actual=renderer.ReadScenePixels();
            if (!resident) expected=actual;
            else for (size_t i=0;i<actual.size();++i) for (unsigned shift:{0u,8u,16u,24u})
                Require(std::abs(int((actual[i]>>shift)&255)-int((expected[i]>>shift)&255))<=3,
                    "Adaptive ordinary-span/painter-order/target-restore mismatch");
        }
    }
    std::cout<<"PASS adaptive short/long ordinary spans, blend/scissor changes and same-frame target-restored tokens\n";
    GpuReanimDraw policyLegacy{};policyLegacy.track=2;policyLegacy.after=1;policyLegacy.fraction=0.375f;
    policyLegacy.overlay00=policyLegacy.overlay11=1;policyLegacy.overlay02=12;policyLegacy.overlay12=8;
    policyLegacy.translateX=policyLegacy.translateY=-0.5f;policyLegacy.color=0xb0e08040;
    const auto policyCpu=Reference(keys[0],keys[1],geometry[1],geometry[1],policyLegacy,
        VulkanRenderer::SlotOf(texture),nullptr);
    Require(renderer.BeginScene(),"Cannot begin policy cold batch");Clear(renderer);
    Require(!renderer.reanimFrameEligible,"Cold batch unexpectedly enabled resident policy");
    renderer.SubmitTriangles(policyCpu,texture,false,false,GpuBlend::Normal);
    renderer.reanimPictureCandidates=255;
    renderer.EndSceneAndPresent();
    const auto policyExpected=renderer.ReadScenePixels();
    Require(renderer.BeginScene(),"Cannot begin policy low-count batch");Clear(renderer);
    Require(!renderer.reanimFrameEligible,"Low-count batch enabled resident policy");
    Require(renderer.BeginReanimInstance(definition,texture,unusedInstance,false,false)==UINT32_MAX,
        "Rejected policy allocated an instance");
    Require(!renderer.SubmitReanim(definition,texture,policyLegacy,false,false,GpuBlend::Normal),
        "Legacy submission bypassed rejected policy");
    renderer.SubmitTriangles(policyCpu,texture,false,false,GpuBlend::Normal);
    const auto forced=renderer.BeginReanimInstance(definition,texture,unusedInstance,false,false,nullptr,true);
    Require(forced!=UINT32_MAX && (forced&0xffffu)==0,"Rejected begin consumed an instance slot");
    renderer.reanimPictureCandidates=256;renderer.EndSceneAndPresent();
    Require(renderer.ReadScenePixels()==policyExpected,"Policy rejection changed actual CPU fallback pixels");
    Require(renderer.BeginScene(),"Cannot begin policy dense batch");Clear(renderer);
    Require(renderer.reanimFrameEligible && renderer.reanimPictureCandidates==0,
        "Dense prior batch failed policy/reset");
    renderer.SetRenderImage(adaptiveImage);Clear(renderer);
    Require(renderer.reanimFrameEligible,"Internal target switch reset policy");
    renderer.SetRenderImage(nullptr);
    const auto whiteSlot=VulkanRenderer::SlotOf(renderer.whiteTexture);
    std::vector<GpuVertex> densityTriangles(8193*3);
    for (auto& vertex:densityTriangles) {vertex.slot=whiteSlot;vertex.x=vertex.y=-10;}
    renderer.SubmitTriangles(densityTriangles,renderer.whiteTexture,false,false,GpuBlend::Normal);
    renderer.reanimPictureCandidates=256;renderer.EndSceneAndPresent();
    Require(renderer.BeginScene(),"Cannot begin policy low-density batch");Clear(renderer);
    Require(!renderer.reanimFrameEligible,"Low-density prior batch enabled resident policy");
    renderer.reanimPictureCandidates=256;renderer.EndSceneAndPresent();
    Require(renderer.BeginScene(),"Cannot begin policy recovery batch");Clear(renderer);
    Require(renderer.reanimFrameEligible,"Policy failed to recover from sparse batch");
    renderer.EndSceneAndPresent();
    renderer.SetRenderImage(adaptiveImage);
    Require(renderer.BeginScene(),"Cannot begin policy image-only batch");Clear(renderer);
    Require(!renderer.reanimFrameEligible,"Empty completed batch left policy enabled");
    const auto imageToken=renderer.BeginReanimInstance(definition,texture,unusedInstance,false,false,nullptr,true);
    renderer.reanimPictureCandidates=256;renderer.EndSceneAndPresent();
    renderer.SetRenderImage(nullptr);
    Require(renderer.BeginScene(),"Cannot begin policy after image-only batch");Clear(renderer);
    Require(renderer.reanimFrameEligible,"Image-only completed batch lost policy evidence");
    Require(!renderer.SubmitReanimTrack(imageToken,unusedTrack,GpuBlend::Normal),
        "Image-only token survived explicit batch boundary");
    renderer.EndSceneAndPresent();
    renderer.DestroyTexture(adaptiveImage);
    std::cout<<"PASS prior-batch eligibility/count/density/reset, rejected no-slot allocation, "
        "forced override and image-only explicit boundary\n";
#endif
    // Image-only submission also runs the prelude and protects deferred deletion.
    auto* image=renderer.CreateRenderImage(64,64);
    renderer.SetRenderImage(image);
    Require(renderer.BeginScene(),"Cannot start image-only reanimation batch");
    GpuReanimDraw draw{};draw.track=0;draw.overlay00=draw.overlay11=1;draw.color=0xffffffff;
    Require(renderer.SubmitReanim(definition,texture,draw,false,false,GpuBlend::Normal,&clip,true),
        "Cannot draw resident reanimation into render image");
    renderer.DestroyReanimDefinition(definition); renderer.DestroyTexture(texture);
    renderer.EndSceneAndPresent(); renderer.SetRenderImage(nullptr);
    renderer.DestroyTexture(image);
    Require(renderer.BeginScene(),"Cannot retire resident resources"); renderer.EndSceneAndPresent();
    Require(errors.load()==0,"Vulkan validation errors");
    std::cout<<"PASS "<<cases<<" resident CPU/GPU pixel cases, CPU-only indexes, mixed stream, "
        "24 mixed definition/texture/filter/blend/clip jobs and ordinary sprites, image-only lifetime\n";
}
#if defined(PVZ_REANIM_BENCHMARK)
struct Timing { double cpu=0, jobs=0, gpu=0; uint64_t accepted=0,fallback=0; };
bool mixedBenchmark=false;
bool spriteOnlyBenchmark=false;
bool packetBenchmark=false;
bool sparseBenchmark=false;
unsigned sparseVisible=0;
bool policyBenchmark=false;
bool transitionBenchmark=false;
Timing BenchmarkBurst(VulkanRenderer& renderer,VulkanContext& window,std::span<VulkanReanim* const> definitions,
    VulkanTexture* texture,const std::vector<GpuReanimKey>& keys,std::vector<GpuReanimDraw>& draws,
    const GpuReanimGeometry& geometry,bool resident,bool clipped,
    const std::array<VkQueryPool,16>& queries,double timestampPeriod,unsigned phase) {
    using Clock=std::chrono::steady_clock;
    Timing result;
    const GpuClip clip{6,6,782,582};
    const auto slot=VulkanRenderer::SlotOf(texture);
    const uint32_t white=VulkanRenderer::SlotOf(renderer.whiteTexture);
    const GpuVertex marker[]={
        {795,595,1,1,1,0.1f,0,0,white,0},{797,595,1,1,1,0.1f,1,0,white,0},
        {795,597,1,1,1,0.1f,0,1,white,0}};
    std::vector<uint32_t> instanceTokens(definitions.size());
    for (size_t frame=0;frame<queries.size();++frame) {
        renderer.frameTimestampQueries=queries[frame];
        Require(renderer.BeginScene(),"Cannot start benchmark frame");
        const auto start=Clock::now();
        Clear(renderer);
        const float fraction=float((phase+unsigned(frame))%31)/31.0f;
        const unsigned visible=transitionBenchmark?
            (((phase+unsigned(frame))/8)%2?16u:0u):sparseVisible;
        if (resident && packetBenchmark) {
            GpuReanimInstance instance{};
            instance.after=1;instance.fraction=fraction;instance.overlay00=instance.overlay11=1;
            for (size_t i=0;i<definitions.size();++i) {
                instanceTokens[i]=renderer.BeginReanimInstance(definitions[i],texture,instance,false,false,
                    clipped?&clip:nullptr,!policyBenchmark);
                Require(policyBenchmark || instanceTokens[i]!=UINT32_MAX,"Cannot begin benchmark instance");
            }
        }
        if (spriteOnlyBenchmark && resident) {
            auto trigger=draws[0];trigger.color=0;
            if (packetBenchmark) {
                GpuReanimTrackDraw track{};track.track=0;
                Require(renderer.SubmitReanimTrack(instanceTokens[0],track,GpuBlend::Normal),
                    "Cannot activate packet pipeline for ordinary-sprite control");
            } else Require(renderer.SubmitReanim(definitions[0],texture,trigger,false,false,GpuBlend::Normal,nullptr,true),
                    "Cannot activate resident pipeline for ordinary-sprite control");
        }
        const auto emitSprite=[&](size_t i) {
            const float x=float(i%64)*12+4,y=float((i/64)%48)*12+4;
            const GpuVertex sprite[]={
                {x,y,1,1,1,0.5f,0,0,slot,0},{x,y+12,1,1,1,0.5f,0,1,slot,0},
                {x+10,y,1,1,1,0.5f,1,0,slot,0},{x,y+12,1,1,1,0.5f,0,1,slot,0},
                {x+10,y,1,1,1,0.5f,1,0,slot,0},{x+10,y+12,1,1,1,0.5f,1,1,slot,0}};
            renderer.SubmitTriangles(sprite,texture,false,false,GpuBlend::Normal);
        };
        const auto emitReanim=[&](size_t i) {
            auto& draw=draws[i]; draw.fraction=fraction;
            ++renderer.reanimPictureCandidates;
            if (resident && packetBenchmark && instanceTokens[(i/32)%definitions.size()]!=UINT32_MAX) {
                GpuReanimTrackDraw track{};track.track=draw.track;track.color=draw.color;
                track.shakeX=draw.translateX+0.5f;track.shakeY=draw.translateY+0.5f;
                Require(renderer.SubmitReanimTrack(instanceTokens[(i/32)%definitions.size()],track,GpuBlend::Normal),
                    "Benchmark packet submission rejected");
                ++result.accepted;
            } else if (resident && !packetBenchmark) {
                Require(renderer.SubmitReanim(definitions[(i/32)%definitions.size()],texture,draw,false,false,GpuBlend::Normal,
                    clipped?&clip:nullptr,!policyBenchmark),"Benchmark resident submission rejected");
                ++result.accepted;
            } else {
                if (resident) ++result.fallback;
                const auto vertices=Reference(keys[2*i],keys[2*i+1],geometry,geometry,draw,slot,
                    clipped?&clip:nullptr);
                renderer.SubmitTriangles(vertices,texture,false,false,GpuBlend::Normal);
            }
        };
        unsigned sparseEmitted=0;
        for (size_t i=0;i<draws.size();++i) {
            if (visible) {
                if (sparseEmitted<visible &&
                    i==size_t(sparseEmitted)*draws.size()/visible) {
                    emitReanim(i);++sparseEmitted;
                }
                emitSprite(i);
            } else if (spriteOnlyBenchmark) emitSprite(i);
            else emitReanim(i);
            if (mixedBenchmark && i%32==31)
                renderer.SubmitTriangles(marker,renderer.whiteTexture,false,false,GpuBlend::Normal);
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
#if defined(PVZ_REANIM_GEOMETRY)
    config.features.geometryShader=requestGeometry?VK_TRUE:VK_FALSE;
    config.allowOptionalGeometryShader=requestGeometry;
#endif
    VulkanContext window(config,native.hwnd,VulkanTest::SwapchainConfig());
    VkPhysicalDeviceProperties properties{};
    vkGetPhysicalDeviceProperties(window.physicalDevice,&properties);
    std::cout<<"Vulkan resident benchmark adapter="<<properties.deviceName
        <<" geometryShader="<<window.geometryShaderEnabled
        <<" mixed="<<mixedBenchmark
        <<" ordinaryOnly="<<spriteOnlyBenchmark
        <<" packets="<<packetBenchmark
        <<" sparse="<<sparseBenchmark
        <<" policy="<<policyBenchmark<<" transitions="<<transitionBenchmark
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
    unsigned gates=0,meanGates=0,total=0,rejected=0;
    for (unsigned visible: sparseBenchmark?std::vector<unsigned>{1,4,16}:std::vector<unsigned>{0}) {
    sparseVisible=visible;
    for (uint32_t count: transitionBenchmark?std::vector<uint32_t>{8192}:
        sparseBenchmark?std::vector<uint32_t>{2048,8192}:
        std::vector<uint32_t>{256,512,2048,8192}) {
        std::vector<GpuReanimTrack> tracks(count);
        std::vector<GpuReanimKey> keys(count*2);
        std::vector<GpuReanimDraw> draws(count);
        const std::array<GpuReanimGeometry,2> geometry{{{},{10,12,0,0,1,1}}};
        for (uint32_t i=0;i<count;++i) {
            tracks[i]={2*i,2};
            keys[2*i]={0.25f,0.125f,-15,23,1.15f,0.9f,0.8f,0,1};
            keys[2*i+1]={1.5f,1.25f,37,-18,0.75f,1.1f,0.35f,0,1};
            const float x=float(i%64)*12+4,y=float((i/64)%48)*12+4;
            keys[2*i].transX+=x;keys[2*i+1].transX+=x;
            keys[2*i].transY+=y;keys[2*i+1].transY+=y;
            auto& draw=draws[i];
            draw.track=i;draw.before=0;draw.after=1;
            draw.translateX=draw.translateY=-0.5f;
            draw.overlay00=draw.overlay11=1;
            draw.color=0xc0e0d0ff;
        }
        std::vector<VulkanReanim*> definitions;
        for (unsigned index=0;index<(mixedBenchmark?4u:1u);++index)
            definitions.push_back(renderer.UploadReanimDefinition({tracks,keys,geometry,2,1}));
        for (bool clipped:{false,true}) {
            std::array<std::vector<double>,6> values;
            uint64_t accepted=0,fallback=0;
            for (unsigned round=0;round<12;++round) {
                Timing cpu,gpu;
                if (round%2==0) {
                    cpu=BenchmarkBurst(renderer,window,definitions,texture,keys,draws,geometry[1],false,
                        clipped,queries,properties.limits.timestampPeriod,round*16);
                    gpu=BenchmarkBurst(renderer,window,definitions,texture,keys,draws,geometry[1],true,
                        clipped,queries,properties.limits.timestampPeriod,round*16);
                } else {
                    gpu=BenchmarkBurst(renderer,window,definitions,texture,keys,draws,geometry[1],true,
                        clipped,queries,properties.limits.timestampPeriod,round*16);
                    cpu=BenchmarkBurst(renderer,window,definitions,texture,keys,draws,geometry[1],false,
                        clipped,queries,properties.limits.timestampPeriod,round*16);
                }
                if (round<3) continue;
                accepted+=gpu.accepted;fallback+=gpu.fallback;
                std::cout<<"sample tracks="<<count<<" clipped="<<clipped<<" round="<<round
                    <<" sparseVisible="<<sparseVisible
                    <<" ordinarySprites="<<((sparseVisible||spriteOnlyBenchmark||transitionBenchmark)?count:0)
                    <<" transitionSparseVisible="<<(transitionBenchmark?16:0)
                    <<" accepted="<<gpu.accepted<<" fallback="<<gpu.fallback
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
            const bool cpuFallback=policyBenchmark && accepted==0 && fallback>0;
            if (cpuFallback) ++rejected;
            else {gates+=passed;++total;meanGates+=meanPassed;}
            std::cout<<"tracks="<<count<<" clipped="<<clipped
                <<" sparseVisible="<<sparseVisible
                <<" ordinarySprites="<<((sparseVisible||spriteOnlyBenchmark||transitionBenchmark)?count:0)
                <<" transitionSparseVisible="<<(transitionBenchmark?16:0)
                <<" CPU_us="<<cpu<<"->"<<residentCpu
                <<" jobs_us="<<Median(values[4])<<"->"<<Median(values[5])
                <<" GPU_us="<<gpu<<"->"<<residentGpu
                <<" CPU_saved="<<cpu-residentCpu
                <<" GPU_added="<<residentGpu-gpu
                <<" accepted="<<accepted<<" fallback="<<fallback
                <<" gate="<<(cpuFallback?"CPU_FALLBACK":passed?"PASS":"FAIL")
                <<" meanCPU_us="<<Mean(values[0])<<"->"<<Mean(values[1])
                <<" meanGPU_us="<<Mean(values[2])<<"->"<<Mean(values[3])
                <<" meanGate="<<(cpuFallback?"CPU_FALLBACK":meanPassed?"PASS":"FAIL")<<std::endl;
        }
        for (auto* definition:definitions) renderer.DestroyReanimDefinition(definition);
    }
    }
    renderer.frameTimestampQueries=VK_NULL_HANDLE;
    window.WaitForFrame();
    for (auto query:queries) vkDestroyQueryPool(window.device,query,nullptr);
    renderer.DestroyTexture(texture);
    std::cout<<"GATES median "<<gates<<"/"<<total<<" mean "<<meanGates<<"/"<<total
        <<" pass; policy CPU fallback cases="<<rejected
        <<"; scalar query collection outside timed CPU samples; "
        "no full-game speedup claim\n";
}
#endif
}
int main(int argc,char** argv) {
    try {
#if defined(PVZ_REANIM_GEOMETRY)
        if (argc>1 && std::string(argv[1])=="--no-geometry") requestGeometry=false;
#endif
#if defined(PVZ_REANIM_BENCHMARK)
        if (argc>1 && std::string(argv[1])=="--benchmark-mixed") {
            mixedBenchmark=true;Benchmark();return 0;
        }
        if (argc>1 && std::string(argv[1])=="--benchmark-sprites") {
            spriteOnlyBenchmark=true;Benchmark();return 0;
        }
        if (argc>1 && std::string(argv[1])=="--benchmark-packets") {
            packetBenchmark=true;Benchmark();return 0;
        }
        if (argc>1 && std::string(argv[1])=="--benchmark-packets-mixed") {
            packetBenchmark=true;mixedBenchmark=true;Benchmark();return 0;
        }
        if (argc>1 && std::string(argv[1])=="--benchmark-packets-sprites") {
            packetBenchmark=true;spriteOnlyBenchmark=true;Benchmark();return 0;
        }
        if (argc>1 && std::string(argv[1])=="--benchmark-packets-sparse") {
            packetBenchmark=true;sparseBenchmark=true;Benchmark();return 0;
        }
        if (argc>1 && std::string(argv[1])=="--benchmark-policy") {
            packetBenchmark=true;policyBenchmark=true;Benchmark();return 0;
        }
        if (argc>1 && std::string(argv[1])=="--benchmark-policy-mixed") {
            packetBenchmark=true;policyBenchmark=true;mixedBenchmark=true;Benchmark();return 0;
        }
        if (argc>1 && std::string(argv[1])=="--benchmark-policy-sparse") {
            packetBenchmark=true;policyBenchmark=true;sparseBenchmark=true;Benchmark();return 0;
        }
        if (argc>1 && std::string(argv[1])=="--benchmark-policy-transitions") {
            packetBenchmark=true;policyBenchmark=true;transitionBenchmark=true;Benchmark();return 0;
        }
        if (argc>1 && std::string(argv[1])=="--benchmark") {Benchmark();return 0;}
#else
        (void)argc;(void)argv;
#endif
        Run(); return 0;
    }
    catch (const std::exception& error) { std::cerr<<error.what()<<'\n';return 1; }
}
