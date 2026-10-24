#include "OpenGLApi.h"
#include "OpenGLContext.h"
#include "OpenGLRenderer.h"
#include "misc/FastMath.h"
#include <algorithm>
#include <array>
#include <chrono>
#include <cmath>
#include <iostream>
#include <numeric>
#include <stdexcept>
#include <vector>
namespace {
using namespace Sexy;
void Require(bool ok,const char* text){if(!ok)throw std::runtime_error(text);}
struct Window {
 HWND hwnd{};
 Window(){
  WNDCLASSW cls{};cls.style=CS_OWNDC;cls.lpfnWndProc=DefWindowProcW;
  cls.hInstance=GetModuleHandleW(nullptr);cls.lpszClassName=L"PvzOpenGLReanimTests";
  Require(RegisterClassW(&cls)!=0,"Register hidden test class");
  hwnd=CreateWindowExW(0,cls.lpszClassName,L"Resident reanimation tests",WS_POPUP,
   0,0,800,600,nullptr,nullptr,cls.hInstance,nullptr);
  Require(hwnd!=nullptr,"Create hidden test window");
 }
 ~Window(){if(hwnd)DestroyWindow(hwnd);UnregisterClassW(L"PvzOpenGLReanimTests",GetModuleHandleW(nullptr));}
};
struct Triangles {
 std::array<GpuVertex,18> vertices{};size_t count=0;
 operator std::span<const GpuVertex>()const{return{vertices.data(),count};}
};
Triangles Reference(const GpuReanimKey&a,const GpuReanimKey&b,const GpuReanimGeometry&base,
 const GpuReanimGeometry&source,const GpuReanimDraw&job,uint32_t slot,const GpuClip*clip){
 const auto lerp=[&](float x,float y){return x+(y-x)*job.fraction;};
 const int alpha=std::clamp(int(lerp(a.alpha,b.alpha)*float(job.color>>24)+.5f),0,255);
 if(a.frame<0||!a.imageSlot||!alpha||source.width<=0||source.height<=0||
  (job.truncate&&a.frame!=-1&&b.frame==-1&&job.fraction>0))return{};
 const float x=-(lerp(a.skewX,b.skewX)*.017453292f),y=-(lerp(a.skewY,b.skewY)*.017453292f);
 const float m00=FastCos(x)*lerp(a.scaleX,b.scaleX),m10=-FastSin(x)*lerp(a.scaleX,b.scaleX);
 const float m01=FastSin(y)*lerp(a.scaleY,b.scaleY),m11=FastCos(y)*lerp(a.scaleY,b.scaleY);
 const float cx=m00*(base.width*.5f)+m01*(base.height*.5f)+lerp(a.transX,b.transX);
 const float cy=m10*(base.width*.5f)+m11*(base.height*.5f)+lerp(a.transY,b.transY);
 const float xx=job.overlay00*m00+job.overlay01*m10,xy=job.overlay00*m01+job.overlay01*m11;
 const float yx=job.overlay10*m00+job.overlay11*m10,yy=job.overlay10*m01+job.overlay11*m11;
 const float ox=(job.overlay00*cx+job.overlay01*cy+job.overlay02)+job.translateX;
 const float oy=(job.overlay10*cx+job.overlay11*cy+job.overlay12)+job.translateY;
 using Point=std::array<float,4>;
 std::array<Point,8> p{{
  {-source.width*.5f,-source.height*.5f,source.u0,source.v0},
  {-source.width*.5f,source.height*.5f,source.u0,source.v1},
  {source.width*.5f,source.height*.5f,source.u1,source.v1},
  {source.width*.5f,-source.height*.5f,source.u1,source.v0}}};
 size_t count=4;
 for(size_t i=0;i<4;++i){const auto lx=p[i][0],ly=p[i][1];p[i][0]=xx*lx+xy*ly+ox;p[i][1]=yx*lx+yy*ly+oy;}
 if(clip){
  const float bounds[]{float(clip->x),float(clip->y),float(int64_t(clip->x)+clip->width),float(int64_t(clip->y)+clip->height)};
  for(int edge=0;edge<4;++edge){
   std::array<Point,8> out{};size_t written=0;
   for(size_t i=0;i<count;++i){
    const auto&a0=p[(i+count-1)%count];const auto&b0=p[i];const int axis=edge%2;
    const bool ai=edge<2?a0[axis]>=bounds[edge]:a0[axis]<bounds[edge];
    const bool bi=edge<2?b0[axis]>=bounds[edge]:b0[axis]<bounds[edge];
    if(ai!=bi){const float f=(bounds[edge]-a0[axis])/(b0[axis]-a0[axis]);Point v{};
     for(int j=0;j<4;++j)v[j]=a0[j]+(b0[j]-a0[j])*f;out[written++]=v;}
    if(bi)out[written++]=b0;
   }
   p=out;count=written;
  }
 }
 Triangles out;
 const auto emit=[&](const Point&v){
  out.vertices[out.count++]={v[0],v[1],float((job.color>>16)&255)/255,float((job.color>>8)&255)/255,
   float(job.color&255)/255,float(alpha)/255,v[2],v[3],slot|job.samplingFlags,job.sampler};
 };
 if(clip){for(size_t i=1;i+1<count;++i){emit(p[0]);emit(p[i]);emit(p[i+1]);}}
 else for(int i:{0,1,3,1,3,2})emit(p[size_t(i)]);
 return out;
}
void Clear(OpenGLRenderer&r){
 const auto s=OpenGLRenderer::SlotOf(r.whiteTexture);const float w=float(r.sceneWidth),h=float(r.sceneHeight);
 const GpuVertex v[]{
  {0,0,0,0,0,1,0,0,s,0},{w,0,0,0,0,1,1,0,s,0},{w,h,0,0,0,1,1,1,s,0},
  {0,0,0,0,0,1,0,0,s,0},{w,h,0,0,0,1,1,1,s,0},{0,h,0,0,0,1,0,1,s,0}};
 r.SubmitTriangles(v,r.whiteTexture,false,false,GpuBlend::Opaque);
}
struct Error {
 unsigned maximum=0;uint64_t sum=0,components=0;
 bool Compare(const std::vector<uint32_t>&a,const std::vector<uint32_t>&b){
  Require(a.size()==b.size(),"Pixel count mismatch");
  size_t differingComponents=0,firstPixel=0;unsigned firstShift=0;
  for(size_t i=0;i<a.size();++i)for(unsigned shift:{0u,8u,16u,24u}){
   const auto d=unsigned(std::abs(int((a[i]>>shift)&255)-int((b[i]>>shift)&255)));
   if(d){if(!differingComponents){firstPixel=i;firstShift=shift;}++differingComponents;}
   if(d>3)std::cerr<<"pixel mismatch index="<<i<<" componentShift="<<shift
    <<" expected="<<((a[i]>>shift)&255)<<" actual="<<((b[i]>>shift)&255)<<'\n';
   maximum=std::max(maximum,d);sum+=d;++components;
  }
  if(differingComponents)std::cout<<"PIXEL_DIFFERENCE components="<<differingComponents
   <<" first_index="<<firstPixel<<" component_shift="<<firstShift
   <<" expected="<<((a[firstPixel]>>firstShift)&255)<<" actual="<<((b[firstPixel]>>firstShift)&255)<<'\n';
  Require(maximum<=3,"OpenGL native-trig reanimation pixel maximum exceeds3");
  return differingComponents!=0;
 }
};
void Correct(OpenGLContext&context){
 OpenGLRenderer r(context,64,64,{});
 std::array<GpuReanimKey,2> keys{{
  {5.25f,8.125f,-15,23,1.15f,.9f,.8f,INT32_MAX,1},
  {13.5f,11.25f,37,-18,-.75f,1.1f,.35f,-1,1}}};
 const std::array<GpuReanimTrack,3> tracks{{{0,2},{GpuReanimNoKeys,0},{0,2}}};
 const std::array<GpuReanimGeometry,4> geo{{{},{20,24,0,0,1,1},{},{28,12,1,0,0,1}}};
 auto upload=keys;auto geometry=geo;
#if defined(PVZ_OPENGL_REANIM_COMPUTE_EXPERIMENT)
 OpenGLRenderer::FrameTiming pathProof;r.frameTiming=&pathProof;
#endif
 auto*definition=r.UploadReanimDefinition({tracks,upload,geometry,2,2});
#if defined(PVZ_OPENGL_REANIM_COMPUTE_EXPERIMENT)
 const bool computeActive=pathProof.computeAvailable;r.frameTiming=nullptr;
 const bool computeCapable=context.majorVersion>4||(context.majorVersion==4&&context.minorVersion>=3);
 if(computeCapable)Require(computeActive,"Compute experiment did not activate on GL4.3-capable context");
 std::cout<<"EXPERIMENT actual_path="<<(computeActive?"compute/SceneVS":"GS/CPU fallback")<<'\n';
#endif
 if(context.majorVersion<3||(context.majorVersion==3&&context.minorVersion<2)){
  Require(!definition,"GL3.0 unexpectedly enabled optional geometry backend");
  Require(r.BeginScene(),"CPU fallback scene");Clear(r);r.EndSceneAndPresent();
  std::cout<<"PASS baseline CPU renderer; SKIP optional resident GS on GL<3.2\n";return;
 }
 Require(definition!=nullptr,"GL3.2 resident shader unavailable on capable test context");
#if defined(PVZ_OPENGL_REANIM_VERTEX_EXPERIMENT)
 std::cout<<"EXPERIMENT actual_path=vertex/SceneFS no_geometry_stage four_markers_six_indices_per_track\n";
#endif
 upload={};geometry={};
 const uint32_t texels[]{0xffff0000,0xff00ff00,0xff0000ff,0xffffff00};
 auto*texture=r.CreateTexture(2,2,texels,8);
 const GpuClip clips[]{{10,10,22,25},{-20,-10,110,100},{100,100,4,4}};
 Error error;unsigned cases=0;unsigned previousToken=~0u;
 for(unsigned variant:{0u,1u})for(float t:{0.f,.375f,1.f})for(int clipping:{-1,0,1,2})
  for(bool truncate:{false,true})for(unsigned sampling:{0u,1u,2u,3u}){
   GpuReanimDraw job{};job.track=2;job.after=1;job.variant=variant;job.fraction=t;
   job.overlay00=1;job.overlay01=.15f;job.overlay02=8;job.overlay10=-.1f;job.overlay11=1;job.overlay12=5;
   job.translateX=-.5f;job.translateY=1.25f;job.color=0xc0e0d0ff;job.truncate=truncate;job.sampler=sampling;
   const auto*clip=clipping<0?nullptr:&clips[clipping];
   const auto cpu=Reference(keys[0],keys[1],geo[1],geo[variant*2+1],job,OpenGLRenderer::SlotOf(texture),clip);
   Require(r.BeginScene(),"CPU scene");Clear(r);
   for(auto blend:{GpuBlend::Normal,GpuBlend::Additive,GpuBlend::Normal})
    r.SubmitTriangles(cpu,texture,sampling&1,sampling&2,blend);
   r.EndSceneAndPresent();const auto expected=r.ReadScenePixels();
   Require(r.BeginScene(),"GPU scene");Clear(r);auto unsupported=job;unsupported.track=1;
   Require(!r.SubmitReanim(definition,texture,unsupported,false,false,GpuBlend::Normal,nullptr,true),"CPU-only track was densified");
   Require(r.SubmitReanim(definition,texture,job,sampling&1,sampling&2,GpuBlend::Normal,clip,true),"Valid resident job rejected");
   r.SubmitTriangles(cpu,texture,sampling&1,sampling&2,GpuBlend::Additive);
   const GpuReanimInstance packet{job.before,job.after,job.variant,0,
    job.fraction,job.translateX+.5f,job.translateY+.5f,0,
    job.overlay00,job.overlay01,job.overlay02,0,job.overlay10,job.overlay11,job.overlay12,0};
   const auto token=r.BeginReanimInstance(definition,texture,packet,sampling&1,sampling&2,clip,true);
   const GpuReanimTrackDraw track{job.track,job.color,job.samplingFlags,
    truncate?GpuReanimTrackDraw::Truncate:0u};
   Require(token!=~0u,"Shared instance rejected");
   if(previousToken!=~0u)Require(!r.SubmitReanimTrack(previousToken,track,GpuBlend::Normal),"Stale frame token accepted");
   Require(r.SubmitReanimTrack(token,track,GpuBlend::Normal),"Shared track rejected");
   previousToken=token;
   r.EndSceneAndPresent();
   if(error.Compare(expected,r.ReadScenePixels()))
    std::cout<<"DIFFERENCE_CASE variant="<<variant<<" fraction="<<t<<" clipping="<<clipping
     <<" truncate="<<truncate<<" sampling="<<sampling<<" blends=Normal/Additive/Normal\n";
   ++cases;
  }
 auto secondKeys=keys;secondKeys[0].transX+=4;secondKeys[1].transY-=3;
 auto blank=geo;blank[3]={};
 auto*second=r.UploadReanimDefinition({tracks,secondKeys,blank,2,2});
 // Surpass the initial4096-texel arena while the two definitions used below
 // remain live, then reclaim/reuse alternating ranges. Their later pixels
 // verify that growth copied resident bytes on the GPU without a key mirror.
 std::vector<OpenGLReanim*>arena;
 for(unsigned i=0;i<320;++i)arena.push_back(r.UploadReanimDefinition({tracks,keys,geo,2,2}));
 for(size_t i=0;i<arena.size();i+=2){Require(arena[i]!=nullptr,"Arena growth upload rejected");r.DestroyReanimDefinition(arena[i]);}
 for(size_t i=0;i<arena.size();i+=2)arena[i]=r.UploadReanimDefinition({tracks,keys,geo,2,2});
 for(auto*entry:arena){Require(entry!=nullptr,"Arena reuse upload rejected");r.DestroyReanimDefinition(entry);}
 const uint32_t otherTexels[]{0xff20c040,0xffe02060,0xff8060f0,0xffe0a020};
 auto*other=r.CreateTexture(2,2,otherTexels,8);std::vector<uint32_t> mixed;
 for(bool gpu:{false,true}){
  Require(r.BeginScene(),"Mixed scene");Clear(r);
  for(unsigned i=0;i<48;++i){
   const bool useSecond=i%3==1;auto*image=useSecond?other:texture;
   GpuReanimDraw job{};job.track=2;job.after=1;job.fraction=float(i%7)/7;job.variant=i%2;
   job.overlay00=i%4==0?-.75f:1;job.overlay11=.8f;job.overlay01=.125f;job.overlay10=-.25f;
   job.overlay02=float(i%5)*3+8;job.overlay12=float(i%3)*4+4;job.translateX=-.5f;job.translateY=.25f;
   job.color=0x9070c0e0;job.samplingFlags=(i%4)*0x10000000u;job.sampler=i%4;
   const auto*clip=i%4==0?nullptr:&clips[i%3];const auto blend=GpuBlend(i%3);
   const bool ignore=i%5==0;const auto*effectiveClip=ignore?nullptr:clip;
   const auto&k=useSecond?secondKeys:keys;const auto&g=useSecond?blank:geo;
   const auto cpu=Reference(k[0],k[1],g[1],g[job.variant*2+1],job,OpenGLRenderer::SlotOf(image),effectiveClip);
   if(gpu){
    const GpuReanimInstance packet{job.before,job.after,job.variant,0,
     job.fraction,job.translateX+.5f,job.translateY+.5f,0,
     job.overlay00,job.overlay01,job.overlay02,0,job.overlay10,job.overlay11,job.overlay12,0};
    const auto token=r.BeginReanimInstance(useSecond?second:definition,image,packet,i%2,(i/2)%2,clip,true);
    const GpuReanimTrackDraw track{job.track,job.color,job.samplingFlags,
     ignore?GpuReanimTrackDraw::IgnoreDefaultClip:0u};
    Require(r.SubmitReanimTrack(token,track,blend),"Mixed shared job rejected");
   }
   else r.SubmitTriangles(cpu,image,i%2,(i/2)%2,blend);
   if(i%3==2)r.SubmitTriangles(cpu,image,i%2,(i/2)%2,GpuBlend::Normal);
  }
  r.EndSceneAndPresent();const auto actual=r.ReadScenePixels();if(!gpu)mixed=actual;else error.Compare(mixed,actual);
 }
 for(unsigned gap:{511u,512u,2048u})for(bool clipped:{false,true}){
  GpuReanimDraw job{};job.track=2;job.after=1;job.fraction=.375f;
  job.overlay00=job.overlay11=1;job.overlay02=8;job.overlay12=5;job.color=0x8070c0e0;
  const auto*clip=clipped?&clips[0]:nullptr;
  const auto cpu=Reference(keys[0],keys[1],geo[1],geo[1],job,OpenGLRenderer::SlotOf(texture),clip);
  Require(cpu.count>=3,"Long-span reference unexpectedly empty");
  std::vector<GpuVertex>ordinary;ordinary.reserve(gap*3);
  for(unsigned i=0;i<gap;++i)ordinary.insert(ordinary.end(),cpu.vertices.begin(),cpu.vertices.begin()+3);
  std::vector<uint32_t>expected;
  for(bool gpu:{false,true}){
   Require(r.BeginScene(),"Long ordinary span scene");Clear(r);
   for(unsigned section=0;section<3;++section){
    if(gpu)Require(r.SubmitReanim(definition,texture,job,false,false,GpuBlend::Normal,clip,true),
     "Long-span resident rejected");
    else r.SubmitTriangles(cpu,texture,false,false,GpuBlend::Normal,clip);
    // The complete ordinary span shares the same texture/blend/clip batch
    // with both surrounding markers. Material boundaries also split it.
    if(section<2){
     if(section==0)r.SubmitTriangles(ordinary,texture,false,false,GpuBlend::Normal,clip);
     else {
      const auto split=ordinary.size()/6*3;
      r.SubmitTriangles(std::span(ordinary).first(split),texture,false,false,GpuBlend::Additive,clip);
      r.SubmitTriangles(std::span(ordinary).subspan(split),texture,false,false,GpuBlend::Normal,clip);
     }
    }
   }
   r.EndSceneAndPresent();const auto actual=r.ReadScenePixels();
   if(!gpu)expected=actual;else error.Compare(expected,actual);
  }
 }
 {
  auto*target=r.CreateRenderImage(64,64);std::vector<uint32_t>expected;
  GpuReanimDraw job{};job.track=2;job.after=1;job.fraction=.375f;
  job.overlay00=job.overlay11=1;job.overlay02=8;job.overlay12=5;job.color=0x9070c0e0;
  const auto cpu=Reference(keys[0],keys[1],geo[1],geo[1],job,OpenGLRenderer::SlotOf(texture),nullptr);
  const auto feedbackSlot=OpenGLRenderer::SlotOf(target);
  const GpuVertex triangle[]{{2,2,1,1,1,.1f,0,0,feedbackSlot,0},
   {50,2,1,1,1,.1f,1,0,feedbackSlot,0},{2,50,1,1,1,.1f,0,1,feedbackSlot,0}};
  std::vector<GpuVertex>ordinary;
  for(int i=0;i<512;++i)ordinary.insert(ordinary.end(),std::begin(triangle),std::end(triangle));
  for(bool gpu:{false,true}){
   r.SetRenderImage(target);Require(r.BeginScene(),"Long-span image-target scene");Clear(r);
   if(gpu)Require(r.SubmitReanim(definition,texture,job,false,false,GpuBlend::Normal,nullptr,true),"Image-target resident rejected");
   else r.SubmitTriangles(cpu,texture,false,false,GpuBlend::Normal);
   // Reading the current target forces a snapshot/Flush boundary. The long
   // ordinary prefix after it must retain that snapshot through the next GS.
   r.SubmitTriangles(ordinary,target,false,false,GpuBlend::Normal,&clips[0]);
   if(gpu)Require(r.SubmitReanim(definition,texture,job,false,false,GpuBlend::Additive,nullptr,true),"Post-feedback resident rejected");
   else r.SubmitTriangles(cpu,texture,false,false,GpuBlend::Additive);
   r.EndSceneAndPresent();
   if(gpu){
    // Image-only End does not present/rebind buffers. Query the actual
    // instance upload across two Flushes and two independently indexed jobs.
    using BufferSize=void(APIENTRY*)(GLenum,GLenum,GLint*);
    const auto bufferSize=reinterpret_cast<BufferSize>(GL3::GetProcAddress("glGetBufferParameteriv"));
    Require(bufferSize!=nullptr,"Buffer-size query unavailable");
    GLint bytes=0;bufferSize(0x8C2A,0x8764,&bytes); // GL_TEXTURE_BUFFER / GL_BUFFER_SIZE.
#if defined(PVZ_OPENGL_REANIM_COMPUTE_EXPERIMENT)
    constexpr int instanceBytes=96;
#else
    constexpr int instanceBytes=80;
#endif
    Require(bytes==2*instanceBytes,"Resident instance upload contains unused clip data or has a wrong stride");
    std::cout<<"PASS two resident instances across feedback Flushes bytes="<<bytes<<'\n';
#if defined(PVZ_OPENGL_REANIM_COMPUTE_EXPERIMENT)
    if(!computeActive)
#endif
    {
    // The last resident segment also leaves its EBO bound.
    bufferSize(GL_ELEMENT_ARRAY_BUFFER,0x8764,&bytes);
#if defined(PVZ_OPENGL_REANIM_VERTEX_EXPERIMENT)
    constexpr int markerIndices=6;
#else
    constexpr int markerIndices=3;
#endif
    Require(bytes==markerIndices*int(sizeof(unsigned int)),
     "Long ordinary prefix still uploaded unused EBO indices");
    std::cout<<"PASS resident EBO excludes512 ordinary triangles bytes="<<bytes<<'\n';
    }
   }
   r.SetRenderImage(nullptr);const auto actual=r.ReadTexturePixels(target).pixels;
   if(!gpu)expected=actual;else error.Compare(expected,actual);
  }
  for(const auto&clip:clips)for(bool ignore:{false,true}){
   const auto clippedCpu=Reference(keys[0],keys[1],geo[1],geo[1],job,
    OpenGLRenderer::SlotOf(texture),ignore?nullptr:&clip);
   for(bool gpu:{false,true}){
    r.SetRenderImage(target);Require(r.BeginScene(),"Clipped image-target scene");Clear(r);
    if(gpu){
     const GpuReanimInstance packet{job.before,job.after,job.variant,0,job.fraction,
      job.translateX+.5f,job.translateY+.5f,0,
      job.overlay00,job.overlay01,job.overlay02,0,job.overlay10,job.overlay11,job.overlay12,0};
     const auto token=r.BeginReanimInstance(definition,texture,packet,false,false,&clip,true);
     Require(token!=~0u,"Clipped image-target instance rejected");
     const GpuReanimTrackDraw track{job.track,job.color,0,
      ignore?GpuReanimTrackDraw::IgnoreDefaultClip:0u};
     Require(r.SubmitReanimTrack(token,track,GpuBlend::Normal),"Clipped image-target track rejected");
    }else r.SubmitTriangles(clippedCpu,texture,false,false,GpuBlend::Normal);
    r.EndSceneAndPresent();r.SetRenderImage(nullptr);const auto actual=r.ReadTexturePixels(target).pixels;
    if(!gpu)expected=actual;else if(error.Compare(expected,actual))
     std::cout<<"DIFFERENCE_CASE image_target clip="<<clip.x<<','<<clip.y<<','<<clip.width<<','<<clip.height
      <<" ignore_default_clip="<<ignore<<" blend=Normal\n";
   }
  }
  r.DestroyTexture(target);
 }
 if(context.majorVersion>4||(context.majorVersion==4&&context.minorVersion>=6)){
  using Gen=void(APIENTRY*)(GLsizei,GLuint*);using Result=void(APIENTRY*)(GLuint,GLenum,unsigned long long*);
  const auto gen=reinterpret_cast<Gen>(GL3::GetProcAddress("glGenQueries"));
  const auto get=reinterpret_cast<Result>(GL3::GetProcAddress("glGetQueryObjectui64v"));
  Require(gen&&get,"Pipeline-statistics query functions unavailable");
  GLuint query=0;gen(1,&query);OpenGLRenderer::FrameTiming statistics;statistics.vertexInvocationsQuery=query;
  r.frameTiming=&statistics;Require(r.BeginScene(),"Invocation-count scene");Clear(r);
  const GpuReanimInstance packet{0,1,0,0,.375f,0,0,0,1,0,8,0,0,1,5,0};
  const auto token=r.BeginReanimInstance(definition,texture,packet,false,false,nullptr,true);
  const GpuReanimTrackDraw track{2,0xc0e0d0ff};
  for(int i=0;i<256;++i)Require(r.SubmitReanimTrack(token,track,GpuBlend::Normal),"Invocation-count track rejected");
  r.EndSceneAndPresent();unsigned long long invocations=0;get(query,0x8866,&invocations);r.frameTiming=nullptr;
  unsigned long long expectedInvocations=262;
#if defined(PVZ_OPENGL_REANIM_VERTEX_EXPERIMENT)
  expectedInvocations=256*4+6;
#elif defined(PVZ_OPENGL_REANIM_COMPUTE_EXPERIMENT)
  if(computeActive)expectedInvocations=256*4+6;
#endif
  std::cout<<"PIPELINE_STATISTICS GPUtracks=256 clear_vertices=6 actual_VS_invocations="<<invocations
   <<" expected_unique_vertices="<<expectedInvocations<<" (GL4.6 diagnostic only)\n";
#if defined(PVZ_OPENGL_REANIM_VERTEX_EXPERIMENT)
  Require(invocations>=expectedInvocations&&invocations<=256*6+6,
   "Vertex experiment work outside the emitted index bounds");
#else
#if defined(PVZ_OPENGL_REANIM_COMPUTE_EXPERIMENT)
  // Indexed draws may invoke a vertex again after a post-transform cache miss.
  // Compute emits eighteen indices per track, including degenerate padding;
  // the query counts invocations, not unique output vertices.
  if(computeActive)Require(invocations>=expectedInvocations&&invocations<=256*18+6,
   "Compute vertex work outside the emitted index bounds");
  else
#endif
   Require(invocations==expectedInvocations,"Unexpected indexed vertex work for the selected resident path");
#endif
  r.frameTiming=&statistics;Require(r.BeginScene(),"Ordinary-only invocation-count scene");Clear(r);
  Require(r.BeginReanimInstance(definition,texture,packet,false,false,nullptr,true)!=~0u,"Unused shared instance rejected");
  r.EndSceneAndPresent();get(query,0x8866,&invocations);r.frameTiming=nullptr;
  Require(invocations==6,"Unused resident instance changed ordinary-only vertex work");
  using Delete=void(APIENTRY*)(GLsizei,const GLuint*);
  const auto remove=reinterpret_cast<Delete>(GL3::GetProcAddress("glDeleteQueries"));
  Require(remove!=nullptr,"Pipeline-statistics query deletion unavailable");remove(1,&query);
  std::cout<<"PASS ordinary-only frame with unused resident instance uses6 vertex invocations\n";
 }
 r.DestroyReanimDefinition(second);r.DestroyTexture(other);
 auto*target=r.CreateRenderImage(64,64);r.SetRenderImage(target);Require(r.BeginScene(),"Image-only scene");
 GpuReanimDraw job{};job.track=0;job.overlay00=job.overlay11=1;job.color=0xffffffff;
 Require(r.SubmitReanim(definition,texture,job,false,false,GpuBlend::Normal,&clips[0],true),"Image-only resident rejected");
 r.DestroyReanimDefinition(definition);r.DestroyTexture(texture);
 r.EndSceneAndPresent();r.SetRenderImage(nullptr);r.DestroyTexture(target);
 Require(r.BeginScene(),"Retirement scene");r.EndSceneAndPresent();
 GL3::CheckError("resident correctness");
 const auto mean=double(error.sum)/double(error.components);
 Require(mean<=.001,"Native-trig resident mean pixel error exceeds .001 byte");
 std::cout<<"PASS OpenGL native sin/cos no-precise resident cases="<<cases
  <<" mixed_jobs=48 arena_growth/reclaim ordinary_spans511/512/2048 same_batch/material_boundary target_feedback"
  <<" full_int32_frame logical_CPU_sentinel upload_staging_release lifetime"
  <<" max_RGBA8="<<error.maximum<<" mean_RGBA8="<<mean<<'\n';
 // Exercise the explicit version fallback policy on the same real context.
 const auto major=context.majorVersion,minor=context.minorVersion;context.majorVersion=3;context.minorVersion=0;
 {OpenGLRenderer fallback(context,64,64,{});
  Require(!fallback.UploadReanimDefinition({tracks,keys,geo,2,2}),"GL3.0 policy unexpectedly required geometry shaders");}
 context.majorVersion=major;context.minorVersion=minor;
 std::cout<<"PASS GL3.0 capability policy keeps CPU fallback (version simulation, not old-driver execution)\n";
}
void Policy(OpenGLContext&context){
 if(context.majorVersion<3||(context.majorVersion==3&&context.minorVersion<2))return;
 OpenGLRenderer r(context,64,64,{});
 const std::array<GpuReanimKey,2>keys{{{5,8,-15,23,1,1,1,0,1},{8,9,20,10,1,1,1,0,1}}};
 const std::array<GpuReanimTrack,1>tracks{{{0,2}}};
 const std::array<GpuReanimGeometry,2>geo{{{},{20,24,0,0,1,1}}};
 auto*definition=r.UploadReanimDefinition({tracks,keys,geo,2,1});
 const uint32_t pixel=0xff80c040;auto*texture=r.CreateTexture(1,1,&pixel,4);
 const GpuReanimInstance packet{0,1,0,0,.375f,0,0,0,1,0,8,0,0,1,5,0};
 GpuReanimDraw job{};job.after=1;job.fraction=.375f;job.overlay00=job.overlay11=1;
 job.overlay02=8;job.overlay12=5;job.translateX=job.translateY=-.5f;job.color=0xffffffff;
 const auto cpu=Reference(keys[0],keys[1],geo[1],geo[1],job,OpenGLRenderer::SlotOf(texture),nullptr);
 Require(r.BeginScene(),"Initial policy scene");Require(!r.reanimFrameEligible,"Initial policy must select CPU");
 Require(r.BeginReanimInstance(definition,texture,packet,false,false)==~0u,"Initial policy allocated instance");
 Require((r.BeginReanimInstance(definition,texture,packet,false,false,nullptr,true)&65535u)==0,
  "Rejected initial frame retained packet");
 Clear(r);r.reanimPictureCandidates=256;r.EndSceneAndPresent();
 Require(r.BeginScene(),"Dense policy scene");Require(r.reanimFrameEligible,"Dense completed frame not accepted");
 auto token=r.BeginReanimInstance(definition,texture,packet,false,false);
 Require(token!=~0u,"Dense policy instance rejected");
 Require(r.SubmitReanimTrack(token,{0,0xffffffff},GpuBlend::Normal),"Dense policy track rejected");
 r.reanimPictureCandidates=1;r.EndSceneAndPresent();
 for(unsigned candidates:{0u,1u,8u,32u,256u}){
  Require(r.BeginScene(),"Sparse preparation");Clear(r);r.reanimPictureCandidates=candidates;
  // Dense candidate count with a very long ordinary span must also reject.
  if(candidates==256)for(int i=0;i<4200;++i)Clear(r);
  r.EndSceneAndPresent();
  Require(r.BeginScene(),"Sparse policy scene");Require(!r.reanimFrameEligible,"Sparse frame unexpectedly accepted");
  Require(r.BeginReanimInstance(definition,texture,packet,false,false)==~0u,"Sparse policy allocated instance");
  Require((r.BeginReanimInstance(definition,texture,packet,false,false,nullptr,true)&65535u)==0,
   "Rejected sparse frame retained packet");
  Clear(r);r.SubmitTriangles(cpu,texture,false,false,GpuBlend::Normal);
  r.EndSceneAndPresent();const auto actual=r.ReadScenePixels();
  Require(r.BeginScene(),"Sparse CPU reference");Clear(r);
  r.SubmitTriangles(cpu,texture,false,false,GpuBlend::Normal);r.EndSceneAndPresent();
  Require(actual==r.ReadScenePixels(),"Sparse fallback differs from actual CPU pixels");
 }
 Require(r.BeginScene(),"GPU-only forced policy scene");Require(!r.reanimFrameEligible,"Sparse history unexpectedly eligible");
 token=r.BeginReanimInstance(definition,texture,packet,false,false,nullptr,true);
 Require(token!=~0u,"GPU-only forced route rejected supported backend");
 Require(r.SubmitReanimTrack(token,{0,0xffffffff},GpuBlend::Normal),"GPU-only forced track rejected");
 r.reanimPictureCandidates=333;
 auto*target=r.CreateRenderImage(64,64);r.SetRenderImage(target);r.SetRenderImage(nullptr);
 Require(r.reanimPictureCandidates==333&&!r.reanimFrameEligible,"Internal target switch reset frame policy");
 r.EndSceneAndPresent();r.DestroyTexture(target);r.DestroyTexture(texture);r.DestroyReanimDefinition(definition);
 GL3::CheckError("resident prior-frame policy");
 std::cout<<"PASS prior-frame policy initial_CPU sparse0/1/8/32 long_ordinary_CPU zero_rejected_packets"
  <<" actual_CPU_pixels dense_accepted force_GPU internal_target_preserves_counters\n";
}
void Lifecycle(OpenGLContext&context){
 if(context.majorVersion<3||(context.majorVersion==3&&context.minorVersion<2))return;
 OpenGLRenderer r(context,64,64,{});
 const std::array<GpuReanimTrack,1>tracks{{{0,1}}};
 const std::array<GpuReanimKey,1>keys{{{8,8,0,0,1,1,1,0,1}}};
 const std::array<GpuReanimGeometry,2>geometry{{{},{20,20,0,0,1,1}}};
 const uint32_t blue=0xff0000ffu,green=0xff00ff00u;
 auto*referenceTexture=r.CreateTexture(1,1,&blue,4);
 GpuReanimDraw job{};job.overlay00=job.overlay11=1;job.overlay02=6;job.overlay12=4;job.color=0xffffffffu;
 const auto cpu=Reference(keys[0],keys[0],geometry[1],geometry[1],job,
  OpenGLRenderer::SlotOf(referenceTexture),nullptr);
 const GpuReanimInstance packet{0,0,0,0,0,.5f,.5f,0,1,0,6,0,0,1,4,0};
 const GpuReanimTrackDraw track{0,0xffffffffu};
 Require(r.BeginScene(),"Lifecycle empty reference");Clear(r);r.EndSceneAndPresent();
 const auto empty=r.ReadScenePixels();
 Require(r.BeginScene(),"Lifecycle picture reference");Clear(r);
 r.SubmitTriangles(cpu,referenceTexture,false,false,GpuBlend::Normal);r.EndSceneAndPresent();
 const auto picture=r.ReadScenePixels();
 // Test before and after a real same-generation Flush, then create replacement
 // handles. Rejection must not depend on whether the allocator reuses an address.
 for(unsigned mode=0;mode<4;++mode)for(bool queued:{false,true}){
  auto*definition=r.UploadReanimDefinition({tracks,keys,geometry,2,1});
  Require(definition!=nullptr,"Lifecycle resident definition unavailable");
  auto*texture=mode==2?r.CreateRawTexture(1,1,&blue,4):r.CreateTexture(1,1,&blue,4);
  auto*adopted=mode==2?r.CreateRawTexture(1,1,&green,4):nullptr;
  Require(r.BeginScene(),"Lifecycle instance scene");
  const auto token=r.BeginReanimInstance(definition,texture,packet,false,false,nullptr,true);
  Require(token!=~0u,"Lifecycle instance rejected");
  if(queued){Clear(r);Require(r.SubmitReanimTrack(token,track,GpuBlend::Normal),"Lifecycle initial track rejected");}
  if(mode==0){r.DestroyReanimDefinition(definition);definition=nullptr;}
  else if(mode==1){r.DestroyTexture(texture);texture=nullptr;}
  else if(mode==2){
   // Direct adoption intentionally bypasses ComposeAlphaRaw/ImagePass's Flush.
   Require(r.AdoptComposedTexture(adopted)==adopted,"Direct raw adoption failed");texture=nullptr;
  }else texture=r.ReplaceTexture(texture,1,1,&blue,4,false);
  Require(!r.SubmitReanimTrack(token,track,GpuBlend::Normal),"Destroyed resource token accepted before Flush");
  auto*scratch=r.CreateRenderImage(1,1); // Flush and delete all retired objects without changing the token generation.
  r.DestroyTexture(scratch);
  Require(!r.SubmitReanimTrack(token,track,GpuBlend::Normal),"Destroyed resource token accepted after retirement");
  if(!texture)texture=r.CreateTexture(1,1,&blue,4);
  if(definition)Require(r.BeginReanimInstance(definition,texture,packet,false,false,nullptr,true)!=~0u,
   "Replacement live resource instance rejected");
  Require(!r.SubmitReanimTrack(token,track,GpuBlend::Normal),"Replacement resource revived an old token");
  if(!queued)Clear(r);
  r.EndSceneAndPresent();
  Require(r.ReadScenePixels()==(queued?picture:empty),"Resource destruction changed already queued pixels");
  if(!definition)definition=r.UploadReanimDefinition({tracks,keys,geometry,2,1});
  Require(definition!=nullptr,"Rebuilt lifecycle definition unavailable");
  Require(r.BeginScene(),"Lifecycle replacement scene");Clear(r);
  Require(!r.SubmitReanimTrack(token,track,GpuBlend::Normal),"Rebuilt resource revived an old frame token");
  const auto fresh=r.BeginReanimInstance(definition,texture,packet,false,false,nullptr,true);
  Require(fresh!=~0u&&r.SubmitReanimTrack(fresh,track,GpuBlend::Normal),"Fresh replacement token failed");
  r.EndSceneAndPresent();Require(r.ReadScenePixels()==picture,"Fresh replacement resource pixels changed");
  r.DestroyReanimDefinition(definition);r.DestroyTexture(texture);r.DestroyTexture(adopted);
 }
 auto*definition=r.UploadReanimDefinition({tracks,keys,geometry,2,1});
 Require(definition!=nullptr,"Protected texture lifecycle definition unavailable");
 Require(r.BeginScene(),"Protected texture lifecycle scene");Clear(r);
 const auto token=r.BeginReanimInstance(definition,r.whiteTexture,packet,false,false,nullptr,true);
 Require(token!=~0u,"Protected texture instance rejected");
 bool rejected=false;
 try{r.DestroyTexture(r.whiteTexture);}catch(const std::invalid_argument&){rejected=true;}
 Require(rejected&&r.SubmitReanimTrack(token,track,GpuBlend::Normal),
  "Failed texture destruction invalidated a live token");
 r.EndSceneAndPresent();r.DestroyReanimDefinition(definition);r.DestroyTexture(referenceTexture);
 GL3::CheckError("resident explicit instance invalidation lifecycle");
 std::cout<<"PASS resident lifecycle: begin-only/queued definition/texture/direct-raw-adoption/replacement,"
  <<" same-generation retirement, no old-token resurrection, fresh-token pixels, failed-destroy preservation\n";
}
using GenQuery=void(APIENTRY*)(GLsizei,GLuint*);
using Query64=void(APIENTRY*)(GLuint,GLenum,unsigned long long*);
template<class T>T Proc(const char*n){auto p=reinterpret_cast<T>(GL3::GetProcAddress(n));Require(p!=nullptr,n);return p;}
double Median(std::vector<double>v){std::sort(v.begin(),v.end());return v[v.size()/2];}
double Mean(const std::vector<double>&v){return std::accumulate(v.begin(),v.end(),0.)/v.size();}
int Benchmark(OpenGLContext&context,bool mixed,bool transitions=false,bool diagnostic=false){
#if defined(PVZ_OPENGL_REANIM_COMPUTE_EXPERIMENT)
 if(context.majorVersion<4||(context.majorVersion==4&&context.minorVersion<3)){
  std::cout<<"SKIP compute benchmark on GL<4.3; use correctness entry for GS fallback\n";return 0;
 }
 constexpr int TimestampStride=4;
#else
 constexpr int TimestampStride=3;
#endif
 OpenGLRenderer r(context,800,600,{});const uint32_t pixels[]{0xffff8020,0xff20ff80,0xff8020ff,0xffe0e020};
 auto*texture=r.CreateTexture(2,2,pixels,8);constexpr int Burst=16;
 std::array<GLuint,Burst>queries{};auto gen=Proc<GenQuery>("glGenQueries");gen(Burst,queries.data());
 std::array<GLuint,Burst*TimestampStride>timestampQueries{};
 if(diagnostic){Proc<void(APIENTRY*)(GLuint,GLenum)>("glQueryCounter");gen(Burst*TimestampStride,timestampQueries.data());}
 auto get=Proc<Query64>("glGetQueryObjectui64v");
 OpenGLRenderer::FrameTiming timing;r.frameTiming=&timing;
 std::vector<GpuVertex>ordinary;
 if(transitions){
  const auto white=OpenGLRenderer::SlotOf(r.whiteTexture);ordinary.reserve(4096*3);
  for(unsigned i=0;i<4096;++i){
   const float x=float(i%128)*6,y=float(i/128)*16;
   ordinary.push_back({x,y,1,1,1,.1f,0,0,white,0});
   ordinary.push_back({x+3,y,1,1,1,.1f,1,0,white,0});
   ordinary.push_back({x,y+3,1,1,1,.1f,0,1,white,0});
  }
 }
 unsigned gates=0,meanGates=0,total=0;
 std::cout<<"OpenGL actual renderer native-trig "
#if defined(PVZ_OPENGL_REANIM_COMPUTE_EXPERIMENT)
  <<"compute/SceneVS"
#elif defined(PVZ_OPENGL_REANIM_VERTEX_EXPERIMENT)
  <<"vertex/SceneFS"
#else
  <<"GS"
#endif
  <<" benchmark mixed="<<mixed
  <<" transitions="<<transitions
  <<" diagnostic_timestamps="<<diagnostic
  <<" unlocked clocks; CPU includes interpolation/clip or API_payload64Binstance+32Btrack;"
  <<" GPU_upload"
#if defined(PVZ_OPENGL_REANIM_COMPUTE_EXPERIMENT)
  <<"96"
#else
  <<"80"
#endif
  <<"Binstance+"
#if defined(PVZ_OPENGL_REANIM_VERTEX_EXPERIMENT)
  <<"4x40Bmarker+24Bindices"
#elif defined(PVZ_OPENGL_REANIM_COMPUTE_EXPERIMENT)
  <<"40Bmarker+72Bindices+8Bjob; GPU_copy_and_expansion"
#else
  <<"40Bmarker+12Bindices"
#endif
  <<" preparation,batching,upload,flush,presentcall;"
  <<" GPU query brackets actual Flush upload+draw, excludes presentquad/WSI;"
  <<" CPU subtracts separately measured Present call; no vertex/pixel readback\n";
 for(unsigned count:{256u,512u,2048u,8192u}){
  std::vector<GpuReanimTrack>tracks(count);std::vector<GpuReanimKey>keys(count*2);
  std::vector<GpuReanimDraw>jobs(count);const std::array<GpuReanimGeometry,2>geo{{{},{10,12,0,0,1,1}}};
  for(unsigned i=0;i<count;++i){
   tracks[i]={i*2,2};keys[i*2]={.25f,.125f,-15,23,1.15f,.9f,.8f,0,1};
   keys[i*2+1]={1.5f,1.25f,37,-18,.75f,1.1f,.35f,0,1};
   auto&j=jobs[i];j.track=i;j.after=1;j.overlay00=j.overlay11=1;j.translateX=j.translateY=-.5f;
   j.overlay02=float(i%64)*12+4;j.overlay12=float((i/64)%48)*12+4;j.color=0xc0e0d0ff;
  }
  std::vector<OpenGLReanim*>definitions;
  for(unsigned i=0;i<(mixed?4u:1u);++i){auto*d=r.UploadReanimDefinition({tracks,keys,geo,2,1});Require(d!=nullptr,"Benchmark GPU unavailable");definitions.push_back(d);}
#if defined(PVZ_OPENGL_REANIM_COMPUTE_EXPERIMENT)
  Require(timing.computeAvailable,"Compute benchmark unexpectedly selected GS fallback");
#endif
  for(bool clipped:{false,true}){
   std::array<std::vector<double>,4>samples;const GpuClip clip{6,6,782,582};
   uint64_t accepted=0,fallback=0;
   for(int round=-3;round<12;++round)for(int order=0;order<2;++order){
    const int path=(order+round+4)%2;
    double burstCpu=0;
    std::array<double,Burst>frameCpu{};
    std::array<bool,Burst>frameEligible{};
    for(int frame=0;frame<Burst;++frame){
     Require(r.BeginScene(),"Benchmark scene");
     const auto start=std::chrono::steady_clock::now();Clear(r);
     const bool sparse=transitions&&frame%4>=2;
     const unsigned activeCount=sparse?8:count;
     frameEligible[frame]=r.reanimFrameEligible;
     r.reanimPictureCandidates=activeCount;
     if(round>=0&&path){if(r.reanimFrameEligible)accepted+=activeCount;else fallback+=activeCount;}
     unsigned packet=~0u;
     for(unsigned i=0;i<activeCount;++i){
      auto&j=jobs[i];j.fraction=float((round+3+frame)%31)/31;
      if(path&&r.reanimFrameEligible){
       if(i==0||(mixed&&i%32==0)){
        const GpuReanimInstance source{0,1,0,0,j.fraction,0,0,0,1,0,0,0,0,1,0,0};
        packet=r.BeginReanimInstance(definitions[(i/32)%definitions.size()],texture,source,false,false,clipped?&clip:nullptr);
       }
       const GpuReanimTrackDraw track{i,j.color,0,0,j.overlay02,j.overlay12};
       Require(r.SubmitReanimTrack(packet,track,GpuBlend::Normal),"Benchmark shared resident rejected");
      }
      else r.SubmitTriangles(Reference(keys[i*2],keys[i*2+1],geo[1],geo[1],j,OpenGLRenderer::SlotOf(texture),clipped?&clip:nullptr),
       texture,false,false,GpuBlend::Normal);
      if(mixed&&i%32==31){
       const auto white=OpenGLRenderer::SlotOf(r.whiteTexture);
       const GpuVertex marker[]{{795,595,1,1,1,.1f,0,0,white,0},{797,595,1,1,1,.1f,1,0,white,0},{795,597,1,1,1,.1f,0,1,white,0}};
       r.SubmitTriangles(marker,r.whiteTexture,false,false,GpuBlend::Normal);
      }
     }
     if(sparse)r.SubmitTriangles(ordinary,r.whiteTexture,false,false,GpuBlend::Normal);
     timing.elapsedQuery=queries[frame];
     if(diagnostic){
      timing.uploadBeginTimestamp=timestampQueries[frame*TimestampStride];
#if defined(PVZ_OPENGL_REANIM_COMPUTE_EXPERIMENT)
      timing.computeBeginTimestamp=timestampQueries[frame*TimestampStride+1];
#endif
      timing.drawBeginTimestamp=timestampQueries[frame*TimestampStride+TimestampStride-2];
      timing.drawEndTimestamp=timestampQueries[frame*TimestampStride+TimestampStride-1];
     }
     r.EndSceneAndPresent();
     const double cpu=std::chrono::duration<double,std::micro>(std::chrono::steady_clock::now()-start).count()-timing.presentCpuUs;
     frameCpu[frame]=cpu;
     burstCpu+=cpu;
     if(round>=0&&!transitions)samples[path].push_back(cpu);
    }
    glFinish();double burstGpu=0;
    unsigned queryFrame=0;
    for(auto q:queries){unsigned long long ns;get(q,0x8866,&ns);burstGpu+=ns*.001;
     if(diagnostic&&round==0&&!clipped&&(count==256||count==8192)){
      unsigned long long uploadBegin,drawBegin,drawEnd;
      get(timestampQueries[queryFrame*TimestampStride],0x8866,&uploadBegin);
      get(timestampQueries[queryFrame*TimestampStride+TimestampStride-2],0x8866,&drawBegin);
      get(timestampQueries[queryFrame*TimestampStride+TimestampStride-1],0x8866,&drawEnd);
      auto uploadEnd=drawBegin;
#if defined(PVZ_OPENGL_REANIM_COMPUTE_EXPERIMENT)
      unsigned long long computeBegin;get(timestampQueries[queryFrame*TimestampStride+1],0x8866,&computeBegin);
      uploadEnd=computeBegin;
#endif
      std::cout<<"DIAGNOSTIC tracks="<<count<<" frame="<<queryFrame<<" path="<<path
       <<" eligible="<<frameEligible[queryFrame]<<" CPU_us="<<frameCpu[queryFrame]
       <<" query_us="<<ns*.001<<" upload_interval_us="<<(uploadEnd-uploadBegin)*.001
#if defined(PVZ_OPENGL_REANIM_COMPUTE_EXPERIMENT)
       <<" compute_copy_barrier_interval_us="<<(drawBegin-computeBegin)*.001
#endif
       <<" draw_interval_us="<<(drawEnd-drawBegin)*.001<<'\n';
     }
     ++queryFrame;
     if(round>=0&&!transitions)samples[2+path].push_back(ns*.001);}
    if(round>=0&&transitions){samples[path].push_back(burstCpu/Burst);samples[2+path].push_back(burstGpu/Burst);}
   }
   const auto saved=Median(samples[0])-Median(samples[1]),added=Median(samples[3])-Median(samples[2]);
   const bool pass=saved>std::max(0.,added);const bool meanPass=Mean(samples[0])-Mean(samples[1])>std::max(0.,Mean(samples[3])-Mean(samples[2]));
   gates+=pass;meanGates+=meanPass;++total;
   std::cout<<"tracks="<<count<<" clipped="<<clipped<<" mixed="<<mixed
    <<" CPU_us="<<Median(samples[0])<<"->"<<Median(samples[1])
    <<" GPU_us="<<Median(samples[2])<<"->"<<Median(samples[3])
    <<" CPU_saved="<<saved<<" GPU_added="<<added<<" gate="<<(pass?"PASS":"FAIL")
    <<" transitions="<<transitions
    <<" actual_GPU_tracks="<<accepted<<" actual_CPU_fallback_tracks="<<fallback
    <<" meanGate="<<(meanPass?"PASS":"FAIL")<<'\n';
  }
  for(auto*d:definitions)r.DestroyReanimDefinition(d);
 }
 r.DestroyTexture(texture);GL3::CheckError("resident benchmark");
 r.frameTiming=nullptr;
 std::cout<<"GATES median="<<gates<<"/"<<total<<" mean="<<meanGates<<"/"<<total<<'\n';
 return gates==total&&meanGates==total?0:2;
}
}
int main(int argc,char**argv)try{
 Window native;OpenGLContext context(native.hwnd,true);
 std::cout<<"adapter="<<context.adapterDescription<<" GL="<<context.majorVersion<<'.'<<context.minorVersion<<'\n';
#if defined(PVZ_OPENGL_REANIM_COMPUTE_EXPERIMENT)
 if(argc>1&&std::string(argv[1])=="--gs-fallback"){
  std::cout<<"Compute capability policy simulation GL3.2; actual context remains the driver version above\n";
  context.majorVersion=3;context.minorVersion=2;Correct(context);Lifecycle(context);Policy(context);return 0;
 }
#endif
 if(argc>1&&std::string(argv[1])=="--benchmark")return Benchmark(context,false);
 else if(argc>1&&std::string(argv[1])=="--benchmark-mixed")return Benchmark(context,true);
 else if(argc>1&&std::string(argv[1])=="--benchmark-transitions")return Benchmark(context,true,true);
 else if(argc>1&&std::string(argv[1])=="--diagnose-transitions")return Benchmark(context,true,true,true);
 else {Correct(context);Lifecycle(context);Policy(context);}
 return 0;
}catch(const std::exception&e){std::cerr<<"FAIL "<<e.what()<<'\n';return 1;}
