#include "OpenGLRendererInternal.h"
#include "OpenGLShaders.h"
#include <algorithm>
#include <bit>
#include <cmath>
#include <cstdio>
#include <cstring>
#include <numeric>
#include <stdexcept>
#include <string>

namespace Sexy {
using namespace GL3;
namespace {
constexpr unsigned int GeometryShader = 0x8DD9, TextureBuffer = 0x8C2A;
constexpr unsigned int CopyReadBuffer = 0x8F36, CopyWriteBuffer = 0x8F37;
constexpr size_t ExactFloatIndexLimit = 1u << 24;
constexpr unsigned int MarkerSampler = ~0u;
template<class T> void EnsureSpace(std::vector<T>& values,size_t required)
{
    if(required>values.capacity())values.reserve(std::max(required,values.capacity()+values.capacity()/2+64));
}
// No contraction-control extension is required: this is an independently
// verified OpenGL native-sin/cos implementation, not the Vulkan polynomial.
constexpr const char* ReanimVertexSource = R"GLSL(#version 150
in vec2 inPosition;in vec4 inColor;in vec2 inUV;in uint inSlot,inSampler;
in uvec4 markerInfo;in vec2 markerShake;
uniform samplerBuffer residentData,instances;
flat out vec4 point0,point1,point2,point3,trackColor,trackClip;
flat out uvec4 trackInfo;
vec4 dataAt(int index){return texelFetch(residentData,index);}
vec4 corner(vec2 p,vec2 uv,vec4 m,vec2 origin){
 return vec4(m.x*p.x+m.y*p.y+origin.x,m.z*p.x+m.w*p.y+origin.y,uv);
}
void main(){
 gl_Position=vec4(0,0,0,1);
 if(inSampler!=0xffffffffu){
  point0=vec4(inPosition,inUV);trackColor=inColor;trackInfo=uvec4(inSlot,inSampler,0u,1u);return;
 }
 int index=int(markerInfo.y)*6;
 vec4 frameSample=texelFetch(instances,index),time=texelFetch(instances,index+1);
 vec4 overlayX=texelFetch(instances,index+2),overlayY=texelFetch(instances,index+3);
 vec4 outputInfo=texelFetch(instances,index+4);
 vec4 header=dataAt(int(outputInfo.x));
 vec4 track=dataAt(int(header.x)+int(markerInfo.x));
 int before=int(header.y)+(int(track.x)+int(frameSample.x))*3;
 int after=int(header.y)+(int(track.x)+int(frameSample.y))*3;
 vec4 a0=dataAt(before),a1=dataAt(before+1),a2=dataAt(before+2);
 vec4 b0=dataAt(after),b1=dataAt(after+1);
 vec4 p=a0+(b0-a0)*time.x,s=a1+(b1-a1)*time.x;
 float alpha=clamp(floor(s.z*float(markerInfo.z>>24u)+0.5),0.0,255.0);
 int image=int(a2.x),geometry=int(header.z),slots=int(header.w);
 vec4 base=dataAt(geometry+image*2);
 int appearance=geometry+(int(frameSample.z)*slots+image)*2;
 vec4 shape=dataAt(appearance),uvEnd=dataAt(appearance+1);
 bool visible=a1.w>=0.0&&image!=0&&alpha>0.0&&shape.x>0.0&&shape.y>0.0;
 if((markerInfo.w&1u)!=0u&&a1.w!=-1.0&&b1.w==-1.0&&time.x>0.0)visible=false;
 uint outputFlags=uint(outputInfo.y);
 bool clipping=(outputFlags&4u)!=0u&&(markerInfo.w&2u)==0u;
 uint textureFlags=uint(outputInfo.z)|(uint(outputInfo.w)<<16u);
 trackColor=vec4(float((markerInfo.z>>16u)&255u),float((markerInfo.z>>8u)&255u),
  float(markerInfo.z&255u),alpha)/255.0;
 trackClip=texelFetch(instances,index+5);
 trackInfo=uvec4(textureFlags|(markerInfo.w&0xffffff00u),outputFlags&3u,
  clipping?2u:1u,visible?1u:0u);
 if(!visible)return;
 vec2 radians=-p.zw*0.017453292;
 float m00=cos(radians.x)*s.x,m10=-sin(radians.x)*s.x;
 float m01=sin(radians.y)*s.y,m11=cos(radians.y)*s.y;
 float cx=m00*(base.x*.5)+m01*(base.y*.5)+p.x;
 float cy=m10*(base.x*.5)+m11*(base.y*.5)+p.y;
 vec4 matrix=vec4(overlayX.x*m00+overlayX.y*m10,overlayX.x*m01+overlayX.y*m11,
  overlayY.x*m00+overlayY.y*m10,overlayY.x*m01+overlayY.y*m11);
 vec2 translation=(outputFlags&8u)!=0u?time.yz:(markerShake+time.yz)-vec2(.5);
 vec2 origin=vec2((overlayX.x*cx+overlayX.y*cy+overlayX.z)+translation.x,
  (overlayY.x*cx+overlayY.y*cy+overlayY.z)+translation.y);
 point0=corner(vec2(-shape.x*.5,-shape.y*.5),shape.zw,matrix,origin);
 point1=corner(vec2(-shape.x*.5,shape.y*.5),vec2(shape.z,uvEnd.y),matrix,origin);
 point2=corner(vec2(shape.x*.5,shape.y*.5),uvEnd.xy,matrix,origin);
 point3=corner(vec2(shape.x*.5,-shape.y*.5),vec2(uvEnd.x,shape.w),matrix,origin);
}
)GLSL";
constexpr const char* ReanimGeometrySource = R"GLSL(#version 150
layout(triangles)in;layout(triangle_strip,max_vertices=18)out;
flat in vec4 point0[],point1[],point2[],point3[],trackColor[],trackClip[];
flat in uvec4 trackInfo[];
uniform vec2 targetExtent;
out vec4 color;out vec2 uv;flat out uint slot,samplerIndex;
void emitPoint(vec4 point,vec4 tint,uvec2 metadata){
 gl_Position=vec4(point.xy/targetExtent*2.0-1.0,0,1);
 color=tint;uv=point.zw;slot=metadata.x;samplerIndex=metadata.y;EmitVertex();
}
void trackPoint(vec4 point){emitPoint(point,trackColor[0],trackInfo[0].xy);}
bool insideClip(vec4 p,int edge,float boundary){
 float value=edge%2==0?p.x:p.y;return edge<2?value>=boundary:value<boundary;
}
void main(){
 if(trackInfo[0].z==0u){
  for(int i=0;i<3;++i)emitPoint(point0[i],trackColor[i],trackInfo[i].xy);
  EndPrimitive();return;
 }
 if(trackInfo[0].w==0u)return;
 if(trackInfo[0].z==1u){
  trackPoint(point0[0]);trackPoint(point1[0]);trackPoint(point3[0]);trackPoint(point2[0]);
  EndPrimitive();return;
 }
 vec4 polygon[8];polygon[0]=point0[0];polygon[1]=point1[0];polygon[2]=point2[0];polygon[3]=point3[0];
 int count=4;
 for(int edge=0;edge<4;++edge){
  if(count<2)return;
  vec4 clipped[8];int written=0;
  for(int i=0;i<count;++i){
   vec4 p=polygon[(i+count-1)%count],q=polygon[i];
   bool pin=insideClip(p,edge,trackClip[0][edge]),qin=insideClip(q,edge,trackClip[0][edge]);
   if(pin!=qin){
    float av=edge%2==0?p.x:p.y,bv=edge%2==0?q.x:q.y;
    float t=(trackClip[0][edge]-av)/(bv-av);clipped[written++]=p+(q-p)*t;
   }
   if(qin)clipped[written++]=q;
  }
  count=written;for(int i=0;i<count;++i)polygon[i]=clipped[i];
 }
 for(int i=1;i+1<count;++i){trackPoint(polygon[0]);trackPoint(polygon[i]);trackPoint(polygon[i+1]);EndPrimitive();}
}
)GLSL";
unsigned int Compile(unsigned int kind,std::string_view source)
{
    const auto object=glCreateShader(kind);const char* text=source.data();const int length=int(source.size());
    glShaderSource(object,1,&text,&length);glCompileShader(object);
    int ok=0;glGetShaderiv(object,GL_COMPILE_STATUS,&ok);
    if(!ok){
        std::string log(8192,'\0');int used=0;glGetShaderInfoLog(object,int(log.size()),&used,log.data());
        glDeleteShader(object);log.resize(used);throw std::runtime_error("OpenGL optional reanimation shader: "+log);
    }
    return object;
}
GpuClip Clamped(const GpuClip& clip,int width,int height)
{
    const auto right=std::min<std::int64_t>(width,std::int64_t(clip.x)+std::max(0,clip.width));
    const auto top=std::min<std::int64_t>(height,std::int64_t(clip.y)+std::max(0,clip.height));
    const int x=std::max(0,clip.x),y=std::max(0,clip.y);
    return {x,y,int(std::max<std::int64_t>(0,right-x)),int(std::max<std::int64_t>(0,top-y))};
}
}

bool OpenGLRenderer::Impl::InitReanim()
{
    if(reanimChecked)return reanimProgram!=0;
    reanimChecked=true;
    if(context.majorVersion<3||(context.majorVersion==3&&context.minorVersion<2))return false;
    unsigned int vertex=0,geometry=0,fragment=0,program=0;
    try{
        texBuffer=reinterpret_cast<TexBufferFn>(GL3::GetProcAddress("glTexBuffer"));
        copyBuffer=reinterpret_cast<CopyBufferFn>(GL3::GetProcAddress("glCopyBufferSubData"));
        if(!texBuffer||!copyBuffer)return false;
        int bufferMaximum=0;glGetIntegerv(0x8C2B,&bufferMaximum); // GL_MAX_TEXTURE_BUFFER_SIZE.
        reanimBlobMaximum=std::min(size_t(std::max(0,bufferMaximum)),ExactFloatIndexLimit);
        if(!reanimBlobMaximum)return false;
        vertex=Compile(GL_VERTEX_SHADER,ReanimVertexSource);
        geometry=Compile(GeometryShader,ReanimGeometrySource);
        fragment=Compile(GL_FRAGMENT_SHADER,SceneFragmentShader());program=glCreateProgram();
        glAttachShader(program,vertex);glAttachShader(program,geometry);glAttachShader(program,fragment);
        constexpr const char* attributes[]{"inPosition","inColor","inUV","inSlot","inSampler","markerInfo","markerShake"};
        for(unsigned int i=0;i<std::size(attributes);++i)glBindAttribLocation(program,i,attributes[i]);
        glBindFragDataLocation(program,0,"outColor");glLinkProgram(program);
        int ok=0;glGetProgramiv(program,GL_LINK_STATUS,&ok);
        if(!ok){
            std::string log(8192,'\0');int used=0;glGetProgramInfoLog(program,int(log.size()),&used,log.data());
            log.resize(used);throw std::runtime_error("OpenGL optional reanimation link: "+log);
        }
        constexpr const char* names[]{"targetExtent","image","premultipliedOutput","coverageInput","residentData","instances"};
        for(unsigned int i=0;i<std::size(names);++i)reanimUniforms[i]=glGetUniformLocation(program,names[i]);
        glUseProgram(program);glUniform1i(reanimUniforms[4],1);glUniform1i(reanimUniforms[5],2);
        glGenVertexArrays(1,&reanimVao);glBindVertexArray(reanimVao);glBindBuffer(GL_ARRAY_BUFFER,stream);
        glEnableVertexAttribArray(0);glVertexAttribPointer(0,2,GL_FLOAT,GL_FALSE,sizeof(Vertex),nullptr);
        glEnableVertexAttribArray(1);glVertexAttribPointer(1,4,GL_FLOAT,GL_FALSE,sizeof(Vertex),reinterpret_cast<void*>(8));
        glEnableVertexAttribArray(2);glVertexAttribPointer(2,2,GL_FLOAT,GL_FALSE,sizeof(Vertex),reinterpret_cast<void*>(24));
        glEnableVertexAttribArray(3);glVertexAttribIPointer(3,1,GL_UNSIGNED_INT,sizeof(Vertex),reinterpret_cast<void*>(32));
        glEnableVertexAttribArray(4);glVertexAttribIPointer(4,1,GL_UNSIGNED_INT,sizeof(Vertex),reinterpret_cast<void*>(36));
        glEnableVertexAttribArray(5);glVertexAttribIPointer(5,4,GL_UNSIGNED_INT,sizeof(Vertex),nullptr);
        glEnableVertexAttribArray(6);glVertexAttribPointer(6,2,GL_FLOAT,GL_FALSE,sizeof(Vertex),reinterpret_cast<void*>(16));
        glGenBuffers(1,&reanimIndexBuffer);glBindBuffer(GL_ELEMENT_ARRAY_BUFFER,reanimIndexBuffer);
        glGenBuffers(1,&reanimInstanceBuffer);glBindBuffer(TextureBuffer,reanimInstanceBuffer);
        glBufferData(TextureBuffer,96,nullptr,GL_STREAM_DRAW);
        glGenTextures(1,&reanimInstanceTexture);glBindTexture(TextureBuffer,reanimInstanceTexture);
        texBuffer(TextureBuffer,GL_RGBA32F,reanimInstanceBuffer);
        glGenTextures(1,&reanimBlobTexture);
        GL3::CheckError("Initialize indexed OpenGL reanimation");reanimProgram=program;
    }catch(const std::exception& error){
        std::fprintf(stderr,"Optional OpenGL reanimation uses CPU fallback: %s\n",error.what());
        if(program)glDeleteProgram(program);
        if(reanimVao)glDeleteVertexArrays(1,&reanimVao);
        if(reanimIndexBuffer)glDeleteBuffers(1,&reanimIndexBuffer);
        if(reanimInstanceBuffer)glDeleteBuffers(1,&reanimInstanceBuffer);
        if(reanimInstanceTexture)glDeleteTextures(1,&reanimInstanceTexture);
        if(reanimBlobTexture)glDeleteTextures(1,&reanimBlobTexture);
        reanimVao=reanimIndexBuffer=reanimInstanceBuffer=reanimInstanceTexture=reanimBlobTexture=0;
    }
    if(vertex)glDeleteShader(vertex);if(geometry)glDeleteShader(geometry);if(fragment)glDeleteShader(fragment);
    glBindVertexArray(vao);glActiveTexture(GL_TEXTURE0);return reanimProgram!=0;
}

size_t OpenGLRenderer::Impl::AllocateReanimRange(size_t count)
{
    for(auto& range:reanimFreeRanges)if(range.count>=count){
        const auto result=range.first;range.first+=count;range.count-=count;return result;
    }
    if(count>reanimBlobMaximum-reanimBlobUsed)throw std::length_error("OpenGL reanimation arena exceeds exact index capacity");
    const size_t required=reanimBlobUsed+count;
    if(required>reanimBlobCapacity){
        const auto capacity=std::min(reanimBlobMaximum,std::bit_ceil(std::max(size_t(4096),required)));
        unsigned int replacement=0;glGenBuffers(1,&replacement);
        try{
            glBindBuffer(CopyWriteBuffer,replacement);glBufferData(CopyWriteBuffer,capacity*16,nullptr,GL_STATIC_DRAW);
            if(reanimBlob){
                glBindBuffer(CopyReadBuffer,reanimBlob);
                copyBuffer(CopyReadBuffer,CopyWriteBuffer,0,0,reanimBlobUsed*16);
            }
            glActiveTexture(GL_TEXTURE1);glBindTexture(TextureBuffer,reanimBlobTexture);
            texBuffer(TextureBuffer,GL_RGBA32F,replacement);
            GL3::CheckError("Grow GPU-only OpenGL resident arena");
        }catch(...){glDeleteBuffers(1,&replacement);glActiveTexture(GL_TEXTURE0);throw;}
        if(reanimBlob)glDeleteBuffers(1,&reanimBlob);
        reanimBlob=replacement;reanimBlobCapacity=capacity;glActiveTexture(GL_TEXTURE0);
    }
    const auto result=reanimBlobUsed;reanimBlobUsed=required;return result;
}
void OpenGLRenderer::Impl::CollectReanims()
{
    if(retiredReanims.empty())return;
    reanimFreeRanges.reserve(reanimFreeRanges.size()+retiredReanims.size());
    for(auto* definition:retiredReanims){
        reanimFreeRanges.push_back({definition->firstTexel,definition->texelCount});delete definition;
    }
    retiredReanims.clear();
    std::sort(reanimFreeRanges.begin(),reanimFreeRanges.end(),[](auto a,auto b){return a.first<b.first;});
    size_t written=0;
    for(const auto range:reanimFreeRanges){
        if(!range.count)continue;
        if(written&&reanimFreeRanges[written-1].first+reanimFreeRanges[written-1].count==range.first)
            reanimFreeRanges[written-1].count+=range.count;
        else reanimFreeRanges[written++]=range;
    }
    reanimFreeRanges.resize(written);
}

OpenGLReanim* OpenGLRenderer::UploadReanimDefinition(const GpuReanimDefinition& source)
{
    auto& s=*impl_;
    if(s.open)throw std::logic_error("Upload OpenGL reanimation definitions between scenes");
    if(source.tracks.empty()||source.keys.empty()||!source.imageSlotCount||
        source.imageSlotCount>(1u<<20)||!source.variantCount||
        uint64_t(source.imageSlotCount)*source.variantCount!=source.geometry.size())
        throw std::invalid_argument("Invalid OpenGL resident reanimation definition");
    for(const auto& track:source.tracks)
        if(track.keyOffset!=GpuReanimNoKeys&&(!track.keyCount||uint64_t(track.keyOffset)+track.keyCount>source.keys.size()))
            throw std::invalid_argument("Invalid OpenGL resident logical track range");
    for(const auto& key:source.keys)if(key.imageSlot>=source.imageSlotCount)
        throw std::invalid_argument("Invalid OpenGL resident image slot");
    if(!s.InitReanim())return nullptr;
    const auto count=uint64_t(1)+source.tracks.size()+source.keys.size()*3+source.geometry.size()*2;
    if(count>s.reanimBlobMaximum)return nullptr;
    s.CollectReanims();
    auto result=std::make_unique<OpenGLReanim>();
    result->trackInfo.assign(source.tracks.begin(),source.tracks.end());
    result->imageSlotCount=source.imageSlotCount;result->variantCount=source.variantCount;
    std::vector<std::array<float,4>> staging;staging.reserve(size_t(count));
    s.reanimFreeRanges.reserve(s.reanimFreeRanges.size()+1);
    result->texelCount=unsigned(count);
    try{result->firstTexel=unsigned(s.AllocateReanimRange(size_t(count)));}
    catch(const std::length_error&){return nullptr;}
    const auto tracks=result->firstTexel+1,keys=tracks+unsigned(source.tracks.size());
    const auto geometry=keys+unsigned(source.keys.size()*3);
    staging.push_back({float(tracks),float(keys),float(geometry),float(source.imageSlotCount)});
    for(const auto& track:source.tracks)
        staging.push_back({track.keyOffset==GpuReanimNoKeys?-1.f:float(track.keyOffset),
            float(track.keyCount),track.flags?1.f:0.f,0});
    for(const auto& key:source.keys){
        const float frame=key.frame>=0?0.f:key.frame==-1?-1.f:-2.f;
        staging.push_back({key.transX,key.transY,key.skewX,key.skewY});
        staging.push_back({key.scaleX,key.scaleY,key.alpha,frame});
        staging.push_back({float(key.imageSlot),0,0,0});
    }
    for(const auto& region:source.geometry){
        staging.push_back({region.width,region.height,region.u0,region.v0});
        staging.push_back({region.u1,region.v1,0,0});
    }
    try{
        s.reanimDefinitions.insert(result.get());
        glBindBuffer(TextureBuffer,s.reanimBlob);
        glBufferSubData(TextureBuffer,result->firstTexel*16,staging.size()*16,staging.data());
        GL3::CheckError("Upload immutable OpenGL reanimation definition");
    }catch(...){
        s.reanimDefinitions.erase(result.get());
        s.reanimFreeRanges.push_back({result->firstTexel,result->texelCount});throw;
    }
    return result.release();
}
void OpenGLRenderer::DestroyReanimDefinition(OpenGLReanim* definition)
{
    if(!definition)return;auto& s=*impl_;
    const auto found=s.reanimDefinitions.find(definition);
    if(found==s.reanimDefinitions.end())throw std::invalid_argument("Unknown OpenGL resident definition");
    s.retiredReanims.push_back(definition);s.reanimDefinitions.erase(found);
}
unsigned int OpenGLRenderer::BeginReanimInstance(OpenGLReanim* definition,OpenGLTexture* texture,
    const GpuReanimInstance& source,bool linear,bool repeat,const GpuClip* defaultClip,bool forceGpu)
{
    auto& s=*impl_;
    if(!s.open)throw std::logic_error("OpenGL reanimation instance requires an open scene");
    if(!forceGpu&&!s.reanimFrameEligible)return ~0u;
    auto* target=s.selected?s.selected:s.scene;
    if(!s.reanimProgram||!definition||!s.reanimDefinitions.contains(definition)||!texture||
        !s.textures.contains(texture)||texture==target||source.variant>=definition->variantCount||
        source.before>=ExactFloatIndexLimit||source.after>=ExactFloatIndexLimit||
        !std::isfinite(source.fraction)||source.fraction<0||source.fraction>1||
        s.reanimInstances.size()>=std::min(size_t(65535),s.reanimBlobMaximum/6))return ~0u;
    const GpuClip bounds=defaultClip?*defaultClip:GpuClip{0,0,target->width,target->height};
    const auto flags=texture->flags|(texture->render?0x80000000u:0u);
    std::array<float,24> data{
        float(source.before),float(source.after),float(source.variant),0,
        source.fraction,source.translateX,source.translateY,0,
        source.overlay00,source.overlay01,source.overlay02,0,
        source.overlay10,source.overlay11,source.overlay12,0,
        float(definition->firstTexel),float((linear?1:0)|(repeat?2:0)|(defaultClip?4:0)),
        float(flags&65535u),float(flags>>16),
        float(bounds.x),float(bounds.y),float(int64_t(bounds.x)+bounds.width),float(int64_t(bounds.y)+bounds.height)};
    const auto index=unsigned(s.reanimInstances.size());
    EnsureSpace(s.reanimInstances,index+1);EnsureSpace(s.reanimInstanceData,index+1);
    s.reanimInstances.push_back({definition,texture,texture->image,bounds});s.reanimInstanceData.push_back(data);
    return (s.reanimFrameGeneration<<16)|index;
}
bool OpenGLRenderer::SubmitReanimTrack(unsigned int instance,const GpuReanimTrackDraw& draw,GpuBlend blend)
{
    auto& s=*impl_;
    if(!s.open)throw std::logic_error("OpenGL reanimation track requires an open scene");
    if((instance>>16)!=s.reanimFrameGeneration)return false;
    instance&=65535u;
    if(instance>=s.reanimInstances.size()||static_cast<unsigned>(blend)>static_cast<unsigned>(GpuBlend::Opaque)||
        (draw.flags&~(GpuReanimTrackDraw::Truncate|GpuReanimTrackDraw::IgnoreDefaultClip))||
        (draw.samplingFlags&~(GpuVertex::kIndependentColorFilter|GpuVertex::kColorFilterMask|GpuVertex::kAlphaEdgeFilter)))
        return false;
    const auto& state=s.reanimInstances[instance];
    if(!s.reanimDefinitions.contains(state.definition)||!s.textures.contains(state.texture)||
        state.texture->image!=state.image||draw.track>=state.definition->trackInfo.size())return false;
    const auto& track=state.definition->trackInfo[draw.track];const auto& data=s.reanimInstanceData[instance];
    if(track.keyOffset==GpuReanimNoKeys||track.flags||unsigned(data[0])>=track.keyCount||unsigned(data[1])>=track.keyCount)
        return false;
    auto* target=s.selected?s.selected:s.scene;
    if(state.texture==target)return false;
    const auto clip=Clamped(draw.flags&GpuReanimTrackDraw::IgnoreDefaultClip?
        GpuClip{0,0,target->width,target->height}:state.clip,target->width,target->height);
    if(!clip.width||!clip.height)return true;
    if(s.vertices.size()>=UINT32_MAX||s.reanimIndices.size()>size_t(INT32_MAX)-3)
        throw std::length_error("OpenGL indexed reanimation stream exhausted");
    // The native32byte track payload aliases the first32bytes of an ordinary
    // GpuVertex. Typed integer attributes preserve all color/flag/index bits.
    GpuVertex marker{};
    const std::array<uint32_t,8> payload{
        draw.track,instance,draw.color,draw.samplingFlags|draw.flags,
        std::bit_cast<uint32_t>(draw.shakeX),std::bit_cast<uint32_t>(draw.shakeY),0,0};
    std::memcpy(&marker,payload.data(),32);marker.sampler=MarkerSampler;
    EnsureSpace(s.vertices,s.vertices.size()+1);
    EnsureSpace(s.reanimIndices,(s.hasReanimDraws?s.reanimIndices.size():s.vertices.size())+3);
    EnsureSpace(s.batches,s.batches.size()+1);
    EnsureSpace(s.reanimMarkerOffsets,s.reanimMarkerOffsets.size()+1);
    if(!s.hasReanimDraws){
        s.reanimIndices.resize(s.vertices.size());
        std::iota(s.reanimIndices.begin(),s.reanimIndices.end(),0u);
    }
    const auto first=s.reanimIndices.size();const auto vertex=unsigned(s.vertices.size());
    s.reanimMarkerOffsets.push_back(first);
    s.vertices.push_back({marker});s.reanimIndices.insert(s.reanimIndices.end(),{vertex,vertex,vertex});
    s.hasReanimDraws=true;
    const auto sameClip=[&](const Impl::Batch& b){
        return b.clip.x==clip.x&&b.clip.y==clip.y&&b.clip.width==clip.width&&b.clip.height==clip.height;};
    if(!s.batches.empty()&&s.batches.back().image==state.image&&s.batches.back().blend==blend&&
        !s.batches.back().coverage&&sameClip(s.batches.back()))s.batches.back().count+=3;
    else s.batches.push_back({state.image,first,3,blend,clip,false});
    return true;
}
bool OpenGLRenderer::SubmitReanim(OpenGLReanim* definition,OpenGLTexture* texture,
    const GpuReanimDraw& draw,bool linear,bool repeat,GpuBlend blend,const GpuClip* clip,bool forceGpu)
{
    GpuReanimInstance instance{draw.before,draw.after,draw.variant,0,draw.fraction,draw.translateX,draw.translateY,0,
        draw.overlay00,draw.overlay01,draw.overlay02,0,draw.overlay10,draw.overlay11,draw.overlay12,0};
    const auto index=BeginReanimInstance(definition,texture,instance,linear,repeat,clip,forceGpu);
    if(index==~0u)return false;
    // The legacy80byte API already contains the final shake/half-pixel offset.
    auto& flags=impl_->reanimInstanceData[index&65535u][17];
    flags=float(unsigned(flags)|8u);
    const GpuReanimTrackDraw track{draw.track,draw.color,draw.samplingFlags,
        draw.truncate?GpuReanimTrackDraw::Truncate:0u};
    return SubmitReanimTrack(index,track,blend);
}
}
