#include "OpenGLRendererInternal.h"
#include "OpenGLShaders.h"
#include <algorithm>
#include <cmath>
#include <cstdio>
#include <cstring>
#include <limits>
#include <stdexcept>
#include <string>

namespace Sexy {
using namespace GL3;
namespace {
constexpr int TableWidth = 1024;
constexpr unsigned int GeometryShader = 0x8DD9, Rgba32ui = 0x8D70, RgbaInteger = 0x8D99;
// This backend deliberately uses native GLSL sin/cos. No contraction-control
// extension or Vulkan polynomial/precise dependency is imposed on OpenGL.
constexpr const char* ReanimVertexSource = R"GLSL(#version 150
in uvec4 sampleInfo;
in vec4 timeTranslation,overlayX,overlayY;
in uvec4 colorFlags;
uniform usampler2D tracks;
uniform sampler2D keys,geometry;
uniform uint imageSlotCount,textureFlags;
uniform vec4 reanimClip;
uniform bool polygonClip;
flat out vec4 point0,point1,point2,point3,trackColor,trackClip;
flat out uvec4 trackInfo;
ivec2 address(uint index){return ivec2(int(index%1024u),int(index/1024u));}
vec4 keyAt(uint index){return texelFetch(keys,address(index),0);}
vec4 geoAt(uint index){return texelFetch(geometry,address(index),0);}
vec4 corner(vec2 p,vec2 uv,vec4 m,vec2 origin){
 return vec4(m.x*p.x+m.y*p.y+origin.x,m.z*p.x+m.w*p.y+origin.y,uv);
}
void main(){
 uvec4 track=texelFetch(tracks,address(sampleInfo.x),0);
 uint before=(track.x+sampleInfo.y)*3u,after=(track.x+sampleInfo.z)*3u;
 vec4 a0=keyAt(before),a1=keyAt(before+1u),a2=keyAt(before+2u);
 vec4 b0=keyAt(after),b1=keyAt(after+1u);
 float t=timeTranslation.x;
 vec4 p=a0+(b0-a0)*t,s=a1+(b1-a1)*t;
 float alpha=clamp(floor(s.z*float(colorFlags.x>>24u)+0.5),0.0,255.0);
 uint image=uint(a2.x);
 vec4 base=geoAt(image*2u);
 uint appearance=(sampleInfo.w*imageSlotCount+image)*2u;
 vec4 shape=geoAt(appearance),uvEnd=geoAt(appearance+1u);
 bool visible=a1.w>=0.0 && image!=0u && alpha>0.0 && shape.x>0.0 && shape.y>0.0;
 if(colorFlags.w!=0u && a1.w!=-1.0 && b1.w==-1.0 && t>0.0)visible=false;
 trackColor=vec4(float((colorFlags.x>>16u)&255u),float((colorFlags.x>>8u)&255u),
  float(colorFlags.x&255u),alpha)/255.0;
 trackClip=reanimClip;
 trackInfo=uvec4(textureFlags|colorFlags.y,colorFlags.z,polygonClip?1u:0u,visible?1u:0u);
 gl_Position=vec4(0,0,0,1);
 if(!visible)return;
 vec2 radians=-p.zw*0.017453292;
 float m00=cos(radians.x)*s.x,m10=-sin(radians.x)*s.x;
 float m01=sin(radians.y)*s.y,m11=cos(radians.y)*s.y;
 float cx=m00*(base.x*.5)+m01*(base.y*.5)+p.x;
 float cy=m10*(base.x*.5)+m11*(base.y*.5)+p.y;
 vec4 matrix=vec4(overlayX.x*m00+overlayX.y*m10,overlayX.x*m01+overlayX.y*m11,
  overlayY.x*m00+overlayY.y*m10,overlayY.x*m01+overlayY.y*m11);
 vec2 origin=vec2((overlayX.x*cx+overlayX.y*cy+overlayX.z)+timeTranslation.y,
  (overlayY.x*cx+overlayY.y*cy+overlayY.z)+timeTranslation.z);
 point0=corner(vec2(-shape.x*.5,-shape.y*.5),shape.zw,matrix,origin);
 point1=corner(vec2(-shape.x*.5,shape.y*.5),vec2(shape.z,uvEnd.y),matrix,origin);
 point2=corner(vec2(shape.x*.5,shape.y*.5),uvEnd.xy,matrix,origin);
 point3=corner(vec2(shape.x*.5,-shape.y*.5),vec2(uvEnd.x,shape.w),matrix,origin);
}
)GLSL";
constexpr const char* ReanimGeometrySource = R"GLSL(#version 150
layout(points)in;
layout(triangle_strip,max_vertices=18)out;
flat in vec4 point0[],point1[],point2[],point3[],trackColor[],trackClip[];
flat in uvec4 trackInfo[];
uniform vec2 targetExtent;
out vec4 color;out vec2 uv;
flat out uint slot,samplerIndex;
void emit(vec4 point){
 gl_Position=vec4(point.xy/targetExtent*2.0-1.0,0,1);
 color=trackColor[0];uv=point.zw;slot=trackInfo[0].x;samplerIndex=trackInfo[0].y;
 EmitVertex();
}
bool insideClip(vec4 p,int edge,float boundary){
 float value=(edge%2==0)?p.x:p.y;return edge<2?value>=boundary:value<boundary;
}
void main(){
 if(trackInfo[0].w==0u)return;
 if(trackInfo[0].z==0u){
  emit(point0[0]);emit(point1[0]);emit(point3[0]);emit(point2[0]);EndPrimitive();return;
 }
 vec4 polygon[8];
 polygon[0]=point0[0];polygon[1]=point1[0];polygon[2]=point2[0];polygon[3]=point3[0];
 int count=4;
 for(int edge=0;edge<4;++edge){
  if(count<2)return;
  vec4 clipped[8];int written=0;
  for(int i=0;i<count;++i){
   vec4 p=polygon[(i+count-1)%count],q=polygon[i];
   bool pin=insideClip(p,edge,trackClip[0][edge]),qin=insideClip(q,edge,trackClip[0][edge]);
   if(pin!=qin){
    float av=(edge%2==0)?p.x:p.y,bv=(edge%2==0)?q.x:q.y;
    float t=(trackClip[0][edge]-av)/(bv-av);
    clipped[written++]=p+(q-p)*t;
   }
   if(qin)clipped[written++]=q;
  }
  count=written;for(int i=0;i<count;++i)polygon[i]=clipped[i];
 }
 for(int i=1;i+1<count;++i){emit(polygon[0]);emit(polygon[i]);emit(polygon[i+1]);EndPrimitive();}
}
)GLSL";

unsigned int Compile(unsigned int kind, std::string_view source)
{
    const auto shader = glCreateShader(kind);
    const char* text = source.data(); const auto length = int(source.size());
    glShaderSource(shader, 1, &text, &length); glCompileShader(shader);
    int ok = 0; glGetShaderiv(shader, GL_COMPILE_STATUS, &ok);
    if (!ok) {
        std::string log(8192, '\0'); int used = 0;
        glGetShaderInfoLog(shader, int(log.size()), &used, log.data());
        glDeleteShader(shader); log.resize(used);
        throw std::runtime_error("OpenGL optional reanimation shader failed: " + log);
    }
    return shader;
}
unsigned int Table(int maximum, size_t texels, const void* source, bool integer)
{
    const auto rows = (texels + TableWidth - 1) / TableWidth;
    if (maximum < TableWidth || !rows || rows > size_t(maximum))
        throw std::invalid_argument("OpenGL resident reanimation table exceeds texture capacity");
    std::vector<std::uint32_t> packed(rows * TableWidth * 4);
    std::memcpy(packed.data(), source, texels * 16);
    unsigned int texture = 0; glGenTextures(1, &texture);
    glBindTexture(GL_TEXTURE_2D, texture);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_NEAREST);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_NEAREST);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_BASE_LEVEL, 0);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAX_LEVEL, 0);
    glPixelStorei(GL_UNPACK_ALIGNMENT, 4); glPixelStorei(GL_UNPACK_ROW_LENGTH, 0);
    glTexImage2D(GL_TEXTURE_2D, 0, integer ? Rgba32ui : GL_RGBA32F, TableWidth, int(rows), 0,
        integer ? RgbaInteger : GL_RGBA, integer ? GL_UNSIGNED_INT : GL_FLOAT, packed.data());
    try { GL3::CheckError("Upload OpenGL resident reanimation table"); }
    catch (...) { glDeleteTextures(1, &texture); throw; }
    return texture;
}
}

OpenGLReanim::~OpenGLReanim()
{
    const unsigned int objects[]{tracks, keys, geometry}; glDeleteTextures(3, objects);
}
bool OpenGLRenderer::Impl::InitReanim()
{
    if (reanimChecked) return reanimProgram != 0;
    reanimChecked = true;
    if (context.majorVersion < 3 || (context.majorVersion == 3 && context.minorVersion < 2))
        return false;
    unsigned int vertex = 0, geometry = 0, fragment = 0, program = 0;
    try {
        vertex = Compile(GL_VERTEX_SHADER, ReanimVertexSource);
        geometry = Compile(GeometryShader, ReanimGeometrySource);
        fragment = Compile(GL_FRAGMENT_SHADER, SceneFragmentShader()); program = glCreateProgram();
        glAttachShader(program, vertex); glAttachShader(program, geometry); glAttachShader(program, fragment);
        constexpr const char* attributes[]{"sampleInfo","timeTranslation","overlayX","overlayY","colorFlags"};
        for (unsigned int i = 0; i < std::size(attributes); ++i)
            glBindAttribLocation(program, i, attributes[i]);
        glBindFragDataLocation(program, 0, "outColor"); glLinkProgram(program);
        int ok = 0; glGetProgramiv(program, GL_LINK_STATUS, &ok);
        if (!ok) {
            std::string log(8192, '\0'); int used = 0;
            glGetProgramInfoLog(program, int(log.size()), &used, log.data()); log.resize(used);
            throw std::runtime_error("OpenGL optional reanimation pipeline link failed: " + log);
        }
        constexpr const char* names[]{"targetExtent","image","premultipliedOutput","coverageInput",
            "tracks","keys","geometry","imageSlotCount","textureFlags","reanimClip","polygonClip"};
        for (unsigned int i = 0; i < std::size(names); ++i)
            reanimUniforms[i] = glGetUniformLocation(program, names[i]);
        glUseProgram(program);
        for (int i = 4; i <= 6; ++i) glUniform1i(reanimUniforms[i], i - 3);
        glGenVertexArrays(1, &reanimVao); glBindVertexArray(reanimVao);
        glGenBuffers(1, &reanimStream); glBindBuffer(GL_ARRAY_BUFFER, reanimStream);
        for (unsigned int i = 0; i < 5; ++i) {
            glEnableVertexAttribArray(i);
            const auto offset = reinterpret_cast<const void*>(size_t(i) * 16);
            if (i == 0 || i == 4)
                glVertexAttribIPointer(i, 4, GL_UNSIGNED_INT, sizeof(GpuReanimDraw), offset);
            else glVertexAttribPointer(i, 4, GL_FLOAT, GL_FALSE, sizeof(GpuReanimDraw), offset);
        }
        GL3::CheckError("Initialize optional OpenGL reanimation pipeline");
        reanimProgram = program;
    } catch (const std::exception& error) {
        std::fprintf(stderr, "Optional OpenGL reanimation uses CPU fallback: %s\n", error.what());
        if (program) glDeleteProgram(program);
        if (reanimVao) glDeleteVertexArrays(1, &reanimVao);
        if (reanimStream) glDeleteBuffers(1, &reanimStream);
        reanimVao = reanimStream = 0;
    }
    if (vertex) glDeleteShader(vertex);
    if (geometry) glDeleteShader(geometry);
    if (fragment) glDeleteShader(fragment);
    glBindVertexArray(vao); glActiveTexture(GL_TEXTURE0);
    return reanimProgram != 0;
}

OpenGLReanim* OpenGLRenderer::UploadReanimDefinition(const GpuReanimDefinition& source)
{
    auto& s = *impl_;
    if (s.open) throw std::logic_error("Upload reanimation definitions between OpenGL scenes");
    if (source.tracks.empty() || source.keys.empty() || !source.imageSlotCount ||
        source.imageSlotCount > (1u << 20) || !source.variantCount ||
        std::uint64_t(source.imageSlotCount) * source.variantCount != source.geometry.size())
        throw std::invalid_argument("Invalid OpenGL resident reanimation definition");
    for (const auto& track : source.tracks)
        if (track.keyOffset != GpuReanimNoKeys &&
            (!track.keyCount || std::uint64_t(track.keyOffset) + track.keyCount > source.keys.size()))
            throw std::invalid_argument("Invalid OpenGL resident reanimation track range");
    std::vector<std::array<float, 12>> keys;
    keys.reserve(source.keys.size());
    for (const auto& key : source.keys) {
        if (key.imageSlot >= source.imageSlotCount)
            throw std::invalid_argument("Invalid OpenGL resident reanimation image slot");
        // Frame participates only in visible/exact-minus-one disappearance
        // tests, so retain that full int32 contract without float truncation.
        const float frame = key.frame >= 0 ? 0.f : key.frame == -1 ? -1.f : -2.f;
        keys.push_back({key.transX,key.transY,key.skewX,key.skewY,key.scaleX,key.scaleY,key.alpha,
            frame,float(key.imageSlot),0,0,0});
    }
    if (!s.InitReanim()) return nullptr;
    auto result = std::make_unique<OpenGLReanim>();
    result->trackInfo.assign(source.tracks.begin(), source.tracks.end());
    result->imageSlotCount = source.imageSlotCount; result->variantCount = source.variantCount;
    glActiveTexture(GL_TEXTURE0);
    result->tracks = Table(s.maximum, source.tracks.size(), source.tracks.data(), true);
    result->keys = Table(s.maximum, keys.size() * 3, keys.data(), false);
    result->geometry = Table(s.maximum, source.geometry.size() * 2, source.geometry.data(), false);
    s.reanimDefinitions.insert(result.get());
    return result.release();
}

void OpenGLRenderer::DestroyReanimDefinition(OpenGLReanim* definition)
{
    if (!definition) return;
    auto& s = *impl_;
    const auto found = s.reanimDefinitions.find(definition);
    if (found == s.reanimDefinitions.end()) throw std::invalid_argument("Unknown OpenGL reanimation definition");
    // Retain native textures for already queued batches. GL deletion after the
    // queued draw commands also retains storage until the GPU finishes using it.
    s.retiredReanims.push_back(definition); s.reanimDefinitions.erase(found);
}

bool OpenGLRenderer::SubmitReanim(OpenGLReanim* definition, OpenGLTexture* texture,
    const GpuReanimDraw& draw, bool linear, bool repeat, GpuBlend blend, const GpuClip* requested)
{
    auto& s = *impl_;
    if (!s.open) throw std::logic_error("OpenGL reanimation submission requires an open scene");
    auto* target = s.selected ? s.selected : s.scene;
    if (!definition || !s.reanimDefinitions.contains(definition) || !texture ||
        !s.textures.contains(texture) || texture == target || !s.reanimProgram ||
        static_cast<unsigned>(blend) > static_cast<unsigned>(GpuBlend::Opaque) ||
        draw.track >= definition->trackInfo.size() || draw.variant >= definition->variantCount ||
        !std::isfinite(draw.fraction) || draw.fraction < 0 || draw.fraction > 1 ||
        (draw.samplingFlags & ~(GpuVertex::kIndependentColorFilter | GpuVertex::kColorFilterMask |
            GpuVertex::kAlphaEdgeFilter))) return false;
    const auto& track = definition->trackInfo[draw.track];
    if (track.keyOffset == GpuReanimNoKeys || track.flags ||
        draw.before >= track.keyCount || draw.after >= track.keyCount) return false;
    GpuClip clip = requested ? *requested : GpuClip{0,0,target->width,target->height};
    const auto polygonBounds = clip;
    const auto right = std::min<std::int64_t>(target->width, std::int64_t(clip.x) + std::max(0,clip.width));
    const auto top = std::min<std::int64_t>(target->height, std::int64_t(clip.y) + std::max(0,clip.height));
    clip.x = std::max(0,clip.x); clip.y = std::max(0,clip.y);
    clip.width = int(std::max<std::int64_t>(0,right-clip.x));
    clip.height = int(std::max<std::int64_t>(0,top-clip.y));
    if (!clip.width || !clip.height) return true;
    auto job = draw; job.sampler = (linear ? 1u : 0u) | (repeat ? 2u : 0u);
    const auto first = s.reanimDraws.size();
    const auto flags = texture->flags | (texture->render ? 0x80000000u : 0u);
    const auto sameClip = [&](const Impl::Batch& batch) {
        return batch.clip.x == clip.x && batch.clip.y == clip.y &&
            batch.clip.width == clip.width && batch.clip.height == clip.height &&
            (!requested || (batch.polygonBounds.x == polygonBounds.x &&
                batch.polygonBounds.y == polygonBounds.y && batch.polygonBounds.width == polygonBounds.width &&
                batch.polygonBounds.height == polygonBounds.height));
    };
    if (!s.batches.empty() && s.batches.back().reanim == definition &&
        s.batches.back().image == texture->image && s.batches.back().textureFlags == flags &&
        s.batches.back().blend == blend && s.batches.back().polygonClip == bool(requested) &&
        sameClip(s.batches.back())) {
        s.reanimDraws.push_back(job); ++s.batches.back().count;
    } else {
        // Reserve first so allocation failure cannot leave only half a queued job.
        s.batches.reserve(s.batches.size()+1); s.reanimDraws.push_back(job);
        s.batches.push_back({texture->image,first,1,blend,clip,false,definition,flags,bool(requested),polygonBounds});
    }
    return true;
}
}
