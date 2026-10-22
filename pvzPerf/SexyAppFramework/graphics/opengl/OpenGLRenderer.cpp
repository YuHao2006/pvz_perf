#include "OpenGLRendererInternal.h"
#include "OpenGLShaders.h"
#include "graphics/vulkan/VulkanViewport.h"
#include <algorithm>
#include <cmath>
#include <cstdlib>
#include <cstring>
#include <limits>
#include <stdexcept>
#include <string>

namespace Sexy {
using namespace GL3;

OpenGLStorage::~OpenGLStorage()
{
    if (framebuffer) glDeleteFramebuffers(1, &framebuffer);
    if (image) glDeleteTextures(1, &image);
}
void OpenGLRenderer::Impl::Dimensions(int w, int h) const
{
    if (w <= 0 || h <= 0 || w > maximum || h > maximum)
        throw std::invalid_argument("OpenGL texture dimensions exceed GL_MAX_TEXTURE_SIZE");
}
std::shared_ptr<OpenGLStorage> OpenGLRenderer::Impl::Storage(int w, int h, unsigned int format)
{
    Dimensions(w, h);
    auto result = std::make_shared<OpenGLStorage>();
    result->width = w; result->height = h; result->format = format;
    glGenTextures(1, &result->image);
    glBindTexture(GL_TEXTURE_2D, result->image);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_NEAREST);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_NEAREST);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_CLAMP_TO_EDGE);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_CLAMP_TO_EDGE);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_BASE_LEVEL, 0);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAX_LEVEL, 0);
    glTexImage2D(GL_TEXTURE_2D, 0, format, w, h, 0,
        format == GL_R8 ? GL_RED : GL_RGBA,
        format == GL_RGBA32F ? GL_FLOAT : GL_UNSIGNED_BYTE, nullptr);
    GL3::CheckError("Allocate OpenGL image");
    return result;
}
void OpenGLRenderer::Impl::Register(OpenGLTexture* texture)
{
    for (unsigned int slot = 1; slot < staticBase; ++slot)
        if (!slots[slot]) {
            texture->slot = slot; slots[slot] = texture;
            return;
        }
    throw std::runtime_error("OpenGL logical texture slots exhausted");
}
OpenGLTexture* OpenGLRenderer::Impl::Allocate(int w, int h, unsigned int format,
    bool registerSlot)
{
    Dimensions(w, h);
    auto result = std::make_unique<OpenGLTexture>();
    result->width = w; result->height = h;
    result->storage = Storage(w, h, format);
    if (registerSlot) Register(result.get());
    auto* pointer = result.get();
    textures.emplace(pointer, std::move(result));
    return pointer;
}
void OpenGLRenderer::Impl::Upload(OpenGLTexture* texture, const void* data, int pitch,
    unsigned int format)
{
    const int bytes = format == GL_RED ? 1 : 4;
    if (!data || pitch < static_cast<long long>(texture->width) * bytes)
        throw std::invalid_argument("Invalid OpenGL texture upload");
    std::vector<unsigned char> packed;
    if (pitch % bytes) {
        packed.resize(size_t(texture->width) * texture->height * bytes);
        for (int row = 0; row < texture->height; ++row)
            std::memcpy(packed.data() + size_t(row) * texture->width * bytes,
                static_cast<const unsigned char*>(data) + size_t(row) * pitch,
                size_t(texture->width) * bytes);
        data = packed.data(); pitch = texture->width * bytes;
    }
    glBindTexture(GL_TEXTURE_2D, texture->storage->image);
    glPixelStorei(GL_UNPACK_ALIGNMENT, 1);
    glPixelStorei(GL_UNPACK_ROW_LENGTH, pitch / bytes);
    glTexSubImage2D(GL_TEXTURE_2D, 0, 0, 0, texture->width,
        texture->height, format, GL_UNSIGNED_BYTE, data);
    glPixelStorei(GL_UNPACK_ROW_LENGTH, 0);
    GL3::CheckError("Upload OpenGL image");
}
unsigned int OpenGLRenderer::Impl::Program(std::string_view vs, std::string_view fs)
{
    const auto shader = [&](unsigned int type, std::string_view text) {
        const unsigned int object = glCreateShader(type);
        const char* source = text.data(); const int length = static_cast<int>(text.size());
        glShaderSource(object, 1, &source, &length);
        glCompileShader(object);
        int success = 0; glGetShaderiv(object, GL_COMPILE_STATUS, &success);
        if (!success) {
            std::string log(8192, '\0'); int used = 0;
            glGetShaderInfoLog(object, static_cast<int>(log.size()), &used, log.data());
            glDeleteShader(object); log.resize(used);
            throw std::runtime_error("GLSL 1.30 compile failed: " + log);
        }
        return object;
    };
    const auto vertex = shader(GL_VERTEX_SHADER, vs);
    unsigned int fragment = 0, program = 0;
    try {
        fragment = shader(GL_FRAGMENT_SHADER, fs);
        program = glCreateProgram();
        glAttachShader(program, vertex); glAttachShader(program, fragment);
        constexpr const char* attributes[]{"inPosition", "inColor", "inUV", "inSlot", "inSampler"};
        for (unsigned int i = 0; i < std::size(attributes); ++i)
            glBindAttribLocation(program, i, attributes[i]);
        glBindFragDataLocation(program, 0, "outColor");
        glLinkProgram(program);
        int success = 0; glGetProgramiv(program, GL_LINK_STATUS, &success);
        if (!success) {
            std::string log(8192, '\0'); int used = 0;
            glGetProgramInfoLog(program, static_cast<int>(log.size()), &used, log.data());
            log.resize(used); throw std::runtime_error("GLSL 1.30 link failed: " + log);
        }
    } catch (...) {
        if (program) glDeleteProgram(program);
        if (fragment) glDeleteShader(fragment);
        glDeleteShader(vertex); throw;
    }
    glDeleteShader(vertex); glDeleteShader(fragment);
    return program;
}
OpenGLRenderer::Impl::Impl(OpenGLContext& window, int w, int h)
    : context(window), width(w), height(h)
{
    context.MakeCurrent();
    glGetIntegerv(GL_MAX_TEXTURE_SIZE, &maximum);
    glDisable(GL_DEPTH_TEST); glDisable(GL_CULL_FACE); glDisable(GL_DITHER);
    glDisable(GL_FRAMEBUFFER_SRGB);
    glClampColor(GL_CLAMP_READ_COLOR, GL_FALSE);
    glClampColor(GL_CLAMP_FRAGMENT_COLOR, GL_FALSE);
    glGenVertexArrays(1, &vao); glBindVertexArray(vao);
    glGenBuffers(1, &stream); glBindBuffer(GL_ARRAY_BUFFER, stream);
    glEnableVertexAttribArray(0); glVertexAttribPointer(0, 2, GL_FLOAT, GL_FALSE, sizeof(Vertex), nullptr);
    glEnableVertexAttribArray(1); glVertexAttribPointer(1, 4, GL_FLOAT, GL_FALSE, sizeof(Vertex),
        reinterpret_cast<const void*>(offsetof(Vertex, draw) + offsetof(GpuVertex, r)));
    glEnableVertexAttribArray(2); glVertexAttribPointer(2, 2, GL_FLOAT, GL_FALSE, sizeof(Vertex),
        reinterpret_cast<const void*>(offsetof(Vertex, draw) + offsetof(GpuVertex, u)));
    glEnableVertexAttribArray(3); glVertexAttribIPointer(3, 1, GL_UNSIGNED_INT, sizeof(Vertex),
        reinterpret_cast<const void*>(offsetof(Vertex, draw) + offsetof(GpuVertex, slot)));
    glEnableVertexAttribArray(4); glVertexAttribIPointer(4, 1, GL_UNSIGNED_INT, sizeof(Vertex),
        reinterpret_cast<const void*>(offsetof(Vertex, draw) + offsetof(GpuVertex, sampler)));
    vertices.reserve(16384); batches.reserve(1024);
}
OpenGLRenderer::Impl::~Impl()
{
    context.MakeCurrent();
    textures.clear(); batches.clear();
    for (const auto program : {sceneProgram, imageProgram, fontProgram, presentProgram})
        if (program) glDeleteProgram(program);
    if (stream) glDeleteBuffers(1, &stream);
    if (vao) glDeleteVertexArrays(1, &vao);
}
void OpenGLRenderer::Impl::BindTarget()
{
    auto* target = selected ? selected : scene;
    auto& storage = *target->storage;
    if (!storage.framebuffer) {
        glGenFramebuffers(1, &storage.framebuffer);
        glBindFramebuffer(GL_FRAMEBUFFER, storage.framebuffer);
        glFramebufferTexture2D(GL_FRAMEBUFFER, GL_COLOR_ATTACHMENT0, GL_TEXTURE_2D, storage.image, 0);
        if (glCheckFramebufferStatus(GL_FRAMEBUFFER) != GL_FRAMEBUFFER_COMPLETE)
            throw std::runtime_error("OpenGL required image format is not framebuffer complete");
    } else glBindFramebuffer(GL_FRAMEBUFFER, storage.framebuffer);
    glViewport(0, 0, target->width, target->height);
}
void OpenGLRenderer::Impl::Flush()
{
    if (vertices.empty()) return;
    BindTarget();
    const auto* target = selected ? selected : scene;
    glBindVertexArray(vao); glBindBuffer(GL_ARRAY_BUFFER, stream);
    glBufferData(GL_ARRAY_BUFFER, static_cast<GLsizeiptr>(vertices.size() * sizeof(Vertex)),
        vertices.data(), GL_STREAM_DRAW);
    glUseProgram(sceneProgram);
    glUniform2f(sceneUniforms[uTargetExtent],
        static_cast<float>(target->width), static_cast<float>(target->height));
    glUniform1i(sceneUniforms[uImage], 0);
    glUniform1i(sceneUniforms[uPremultipliedOutput], target->render);
    glActiveTexture(GL_TEXTURE0);
    for (const auto& batch : batches) {
        glBindTexture(GL_TEXTURE_2D, batch.storage->image);
        glUniform1i(sceneUniforms[uCoverageInput], batch.coverage);
        glEnable(GL_SCISSOR_TEST);
        glScissor(batch.clip.x, batch.clip.y, batch.clip.width, batch.clip.height);
        if (batch.blend == GpuBlend::Opaque) glDisable(GL_BLEND);
        else {
            glEnable(GL_BLEND);
            glBlendFuncSeparate(target->render ? GL_ONE : GL_SRC_ALPHA,
                batch.blend == GpuBlend::Additive ? GL_ONE : GL_ONE_MINUS_SRC_ALPHA,
                GL_ONE, GL_ONE_MINUS_SRC_ALPHA);
        }
        glDrawArrays(GL_TRIANGLES, static_cast<int>(batch.first), static_cast<int>(batch.count));
    }
    vertices.clear(); batches.clear();
    Check("Draw OpenGL triangles");
}
std::shared_ptr<OpenGLStorage> OpenGLRenderer::Impl::Snapshot(OpenGLTexture* texture)
{
    Flush();
    auto copy = Storage(texture->width, texture->height, texture->storage->format);
    unsigned int source = 0, destination = 0;
    glGenFramebuffers(1, &source); glGenFramebuffers(1, &destination);
    glBindFramebuffer(GL_READ_FRAMEBUFFER, source);
    glFramebufferTexture2D(GL_READ_FRAMEBUFFER, GL_COLOR_ATTACHMENT0, GL_TEXTURE_2D,
        texture->storage->image, 0);
    glBindFramebuffer(GL_DRAW_FRAMEBUFFER, destination);
    glFramebufferTexture2D(GL_DRAW_FRAMEBUFFER, GL_COLOR_ATTACHMENT0, GL_TEXTURE_2D, copy->image, 0);
    glDisable(GL_SCISSOR_TEST);
    glBlitFramebuffer(0, 0, texture->width, texture->height,
        0, 0, texture->width, texture->height, GL_COLOR_BUFFER_BIT, GL_NEAREST);
    glDeleteFramebuffers(1, &source); glDeleteFramebuffers(1, &destination);
    Check("Snapshot OpenGL feedback source");
    return copy;
}
void OpenGLRenderer::Impl::Submit(std::span<const GpuVertex> input, OpenGLTexture* source,
    GpuBlend blend, const GpuClip* requested, bool coverage)
{
    (void)source; // The vertex's logical slot is authoritative, as in bindless draws.
    if (!open || input.size() % 3)
        throw std::logic_error("OpenGL submission requires an open scene and triangle list");
    auto* target = selected ? selected : scene;
    const GpuClip bounds{0, 0, target->width, target->height};
    GpuClip clip = requested ? *requested : bounds;
    const int right = std::min(target->width, clip.x + std::max(0, clip.width));
    const int top = std::min(target->height, clip.y + std::max(0, clip.height));
    clip.x = std::max(0, clip.x); clip.y = std::max(0, clip.y);
    clip.width = std::max(0, right - clip.x); clip.height = std::max(0, top - clip.y);
    if (!clip.width || !clip.height) return;
    std::shared_ptr<OpenGLStorage> feedback;
    for (size_t index = 0; index < input.size(); index += 3) {
        auto* image = slots[input[index].slot & 4095U];
        if (!image) throw std::logic_error("OpenGL draw references an unbound logical texture");
        auto storage = image->storage;
        if (storage == target->storage) {
            if (!feedback) feedback = Snapshot(image);
            storage = feedback;
        }
        const size_t first = vertices.size();
        for (size_t corner = 0; corner < 3; ++corner) {
            auto draw = input[index + corner];
            // Vulkan's default provoking vertex is the first vertex. GL 3.0
            // fixes it to the last; duplicate only flat metadata, never UV/color.
            draw.slot = input[index].slot;
            draw.sampler = coverage ? 0 : input[index].sampler;
            vertices.push_back({draw});
        }
        const auto sameClip = [](const GpuClip& a, const GpuClip& b) {
            return a.x == b.x && a.y == b.y && a.width == b.width && a.height == b.height;
        };
        if (!batches.empty() && batches.back().storage == storage &&
            batches.back().blend == blend && batches.back().coverage == coverage &&
            sameClip(batches.back().clip, clip))
            batches.back().count += 3;
        else batches.push_back({std::move(storage), first, 3, blend, clip, coverage});
    }
}
OpenGLRenderer::OpenGLRenderer(OpenGLContext& context, int w, int h,
    const std::filesystem::path&, const VulkanHdrParams* hdr)
    : impl_(std::make_unique<Impl>(context, w, h)), whiteTexture(impl_->white),
      causticsTexture(impl_->causticTarget), sceneOpen(impl_->open),
      sceneWidth(impl_->width), sceneHeight(impl_->height)
{
    if (context.hdr) throw std::runtime_error("OpenGL 3.0 backend supports SDR output only");
    if (hdr) impl_->hdr = *hdr;
    PrepareLoadingPipelines();
    const unsigned int white = 0xffffffffU;
    impl_->white = CreateTexture(1, 1, &white, 4);
    impl_->slots[impl_->white->slot] = nullptr;
    impl_->white->slot = 0; impl_->slots[0] = impl_->white;
    impl_->scene = impl_->Allocate(w, h, GL_RGBA8, false);
    impl_->BindTarget(); glDisable(GL_SCISSOR_TEST);
    glClearColor(0, 0, 0, 1); glClear(GL_COLOR_BUFFER_BIT);
}
OpenGLRenderer::~OpenGLRenderer() = default;
void OpenGLRenderer::PrepareLoadingPipelines()
{
    auto& s = *impl_;
    if (s.initialized) return;
    s.sceneProgram = s.Program(SceneVertexShader(), SceneFragmentShader());
    s.imageProgram = s.Program(QuadVertexShader(), ImageFragmentShader());
    s.fontProgram = s.Program(QuadVertexShader(), FontFragmentShader());
    s.presentProgram = s.Program(QuadVertexShader(), PresentFragmentShader());
    constexpr std::array names{"targetExtent","image","premultipliedOutput","coverageInput",
        "sourceImage","alphaImage","sourceRect","alphaRect","sourceSlot",
        "operation","rectangle","tint","packedColor","counter","cells","colorOnly",
        "samplingFlags","forceWhite","xRanges","yRanges","xTaps","yTaps",
        "xTapExtent","yTapExtent","glyphSrc","glyphDst"};
    static_assert(names.size()==Impl::uUniformCount);
    const auto cache=[&](unsigned int program,Impl::UniformLocations& locations) {
        for(size_t i=0;i<names.size();++i)
            locations[i]=glGetUniformLocation(program,names[i]);
    };
    cache(s.sceneProgram,s.sceneUniforms);cache(s.imageProgram,s.imageUniforms);
    cache(s.fontProgram,s.fontUniforms);cache(s.presentProgram,s.presentUniforms);
    s.initialized = true;
}
OpenGLTexture* OpenGLRenderer::CreateTexture(int w, int h, const void* pixels, int pitch, bool opaque)
{
    auto* texture = impl_->Allocate(w, h, GL_RGBA8, true);
    try { impl_->Upload(texture, pixels, pitch, GL_BGRA); }
    catch (...) { DestroyTexture(texture); throw; }
    texture->flags = opaque ? GpuVertex::kOpaqueInput : 0;
    return texture;
}
OpenGLTexture* OpenGLRenderer::CreateRawTexture(int w, int h, const void* pixels, int pitch)
{
    auto* texture = impl_->Allocate(w, h, GL_RGBA8, false);
    try { impl_->Upload(texture, pixels, pitch, GL_BGRA); }
    catch (...) { DestroyTexture(texture); throw; }
    return texture;
}
void OpenGLRenderer::ReserveStaticTextureSlots(unsigned int count)
{
    auto& s = *impl_;
    if (count >= 4095) throw std::invalid_argument("OpenGL static slots exceed logical table");
    const unsigned int base = 4096 - count - 1;
    if (s.staticBase != 4096 && s.staticBase != base)
        throw std::logic_error("OpenGL static table already reserved");
    for (unsigned int i = base; i < s.slots.size(); ++i)
        if (s.slots[i]) throw std::logic_error("OpenGL static/dynamic slot overlap");
    s.staticBase = base;
}
void OpenGLRenderer::BindStaticTexture(OpenGLTexture* texture, unsigned int slot)
{
    auto& s = *impl_;
    if (!texture || !s.textures.contains(texture) || !slot ||
        static_cast<unsigned long long>(s.staticBase) + slot >= 4096)
        throw std::invalid_argument("Invalid OpenGL static symbol");
    if (texture->staticSlot != ~0U && texture->staticSlot != s.staticBase + slot)
        throw std::invalid_argument("OpenGL texture already has a different static symbol");
    if (texture->slot != ~0U && s.slots[texture->slot] == texture)
        s.slots[texture->slot] = nullptr;
    texture->slot = texture->staticSlot = s.staticBase + slot;
    s.slots[texture->slot] = texture;
}
OpenGLTexture* OpenGLRenderer::CreateTextureStatic(int w, int h, const void* pixels,
    int pitch, bool opaque, unsigned int slot)
{
    auto* texture = impl_->Allocate(w, h, GL_RGBA8, false);
    texture->flags = opaque ? GpuVertex::kOpaqueInput : 0;
    try { impl_->Upload(texture, pixels, pitch, GL_BGRA); BindStaticTexture(texture, slot); }
    catch (...) { DestroyTexture(texture); throw; }
    return texture;
}
OpenGLTexture* OpenGLRenderer::ReplaceTexture(OpenGLTexture* old, int w, int h,
    const void* pixels, int pitch, bool opaque)
{
    if (!old) return CreateTexture(w,h,pixels,pitch,opaque);
    if (!impl_->textures.contains(old) || old == impl_->white || old->render || old->caustic)
        throw std::invalid_argument("Cannot host-replace this OpenGL image");
    // Recorded batches retain the previous storage while this handle gets a new resource.
    auto* next = impl_->Allocate(w, h, GL_RGBA8, false);
    next->flags = opaque ? GpuVertex::kOpaqueInput : 0;
    try {
        impl_->Upload(next, pixels, pitch, GL_BGRA);
        if (old->staticSlot != ~0U)
            BindStaticTexture(next,old->staticSlot-impl_->staticBase);
        else {
            next->slot=old->slot;
            impl_->slots[next->slot]=next;
        }
    }
    catch (...) { DestroyTexture(next); throw; }
    DestroyTexture(old);
    return next;
}
OpenGLTexture* OpenGLRenderer::CreateCoverageMask(int w, int h,
    std::span<const unsigned char> coverage, int pitch)
{
    if (pitch < w || coverage.size() < size_t(pitch) * (h - 1) + w)
        throw std::invalid_argument("Incomplete OpenGL coverage mask");
    auto* image = impl_->Allocate(w, h, GL_R8, true);
    try { impl_->Upload(image, coverage.data(), pitch, GL_RED); }
    catch (...) { DestroyTexture(image); throw; }
    return image;
}
OpenGLTexture* OpenGLRenderer::CreateRenderImage(int w, int h)
{
    auto& s = *impl_; s.Flush();
    auto* image = s.Allocate(w, h, GL_RGBA32F, true);
    image->render = true; image->flags = 0x80000000U;
    auto* previous = s.selected; s.selected = image;
    try {
        s.BindTarget(); glDisable(GL_SCISSOR_TEST);
        glClearColor(0, 0, 0, 0); glClear(GL_COLOR_BUFFER_BIT);
        s.Check("Clear RGBA32F OpenGL render image");
    } catch (...) { s.selected = previous; DestroyTexture(image); throw; }
    s.selected = previous;
    return image;
}
void OpenGLRenderer::DestroyTexture(OpenGLTexture* image)
{
    if (!image) return;
    auto& s = *impl_;
    if (!s.textures.contains(image) || image == s.white)
        throw std::invalid_argument("Cannot destroy the OpenGL white image or a foreign handle");
    if (image == s.selected) throw std::logic_error("Deselect OpenGL render image before destruction");
    if (image == s.causticTarget) s.causticTarget = nullptr;
    if (image == s.causticSource) s.causticSource = nullptr;
    if (image->slot != ~0U && s.slots[image->slot] == image) s.slots[image->slot] = nullptr;
    s.textures.erase(image);
}
unsigned int OpenGLRenderer::SlotOf(const OpenGLTexture* texture)
{
    if (!texture || texture->slot == ~0U)
        throw std::logic_error("OpenGL raw scratch image is not a drawable logical texture");
    return texture->slot | texture->flags;
}
void OpenGLRenderer::SetRenderImage(OpenGLTexture* image)
{
    auto& s = *impl_;
    if (image && (!s.textures.contains(image) || !image->render))
        throw std::invalid_argument("OpenGL target is not a live generated float image");
    if(image==s.selected)return;
    s.Flush(); s.selected = image;
    if (s.open && !s.mainFrame && !image) { glFinish(); s.open = false; }
}
bool OpenGLRenderer::BeginScene()
{
    auto& s = *impl_;
    if (s.open) throw std::logic_error("OpenGL scene already open");
    if (!s.selected && !s.context.BeginPresent()) return false;
    s.open = true; s.mainFrame = !s.selected;
    if (s.causticsQueued && s.causticTarget && s.causticSource) {
        s.ImagePass(s.causticTarget, s.causticSource, nullptr, 3);
        s.causticsQueued = false;
    }
    s.BindTarget();
    return true;
}
void OpenGLRenderer::SubmitTriangles(std::span<const GpuVertex> vertices,
    OpenGLTexture* texture, bool, bool, GpuBlend blend, const GpuClip* clip)
{
    impl_->Submit(vertices, texture, blend, clip, false);
}
void OpenGLRenderer::SubmitCoverageTriangles(std::span<const GpuVertex> vertices,
    OpenGLTexture* texture, GpuBlend blend, const GpuClip* clip)
{
    impl_->Submit(vertices, texture, blend, clip, true);
}
void OpenGLRenderer::Impl::Quad()
{
    glBindVertexArray(vao); glDisable(GL_BLEND); glDisable(GL_SCISSOR_TEST);
    glDrawArrays(GL_TRIANGLES, 0, 3);
}
bool OpenGLRenderer::Impl::Present()
{
    if (!context.BeginPresent()) return false;
    glBindFramebuffer(GL_FRAMEBUFFER, 0);
    glDisable(GL_SCISSOR_TEST); glClearColor(0, 0, 0, 1); glClear(GL_COLOR_BUFFER_BIT);
    const auto rect = FitSceneToSurface(width, height, context.width, context.height);
    glViewport(rect.x, context.height - rect.y - rect.height, rect.width, rect.height);
    glUseProgram(presentProgram); glActiveTexture(GL_TEXTURE0);
    glBindTexture(GL_TEXTURE_2D, scene->storage->image);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);
    glUniform1i(presentUniforms[uImage], 0);
    Quad(); Check("Present retained OpenGL scene"); context.Present();
    return true;
}
void OpenGLRenderer::EndSceneAndPresent()
{
    auto& s = *impl_;
    if (!s.open) throw std::logic_error("No OpenGL scene to end");
    s.Flush();
    if (s.mainFrame) { s.Present(); s.sceneInitialized = true; }
    else {
        // The common image-only batch contract is synchronous. Core GL 3.0
        // has no sync objects; main-frame draws never take this wait.
        glFinish();
    }
    s.open = false;
}
bool OpenGLRenderer::PresentRetainedScene()
{
    if (impl_->open || impl_->selected)
        throw std::logic_error("Retained OpenGL presentation requires the main scene and no open batch");
    if (!impl_->sceneInitialized) return false;
    return impl_->Present();
}
bool OpenGLRenderer::ResizePresent()
{
    if (impl_->open) throw std::logic_error("Resize OpenGL presentation between scenes");
    return impl_->context.BeginPresent();
}
void OpenGLRenderer::ResizeScene(int width, int height)
{
    auto& s = *impl_;
    if (s.open || s.selected)
        throw std::logic_error("Resize the main OpenGL canvas between scenes");
    if (s.width == width && s.height == height) return;
    auto* next = s.Allocate(width, height, GL_RGBA8, false);
    auto* previous = s.scene;
    s.scene = next;
    s.width = width;
    s.height = height;
    s.sceneInitialized = false;
    DestroyTexture(previous);
    s.BindTarget();
    glDisable(GL_SCISSOR_TEST);
    glClearColor(0, 0, 0, 1);
    glClear(GL_COLOR_BUFFER_BIT);
}
void OpenGLRenderer::SetHdrParams(const VulkanHdrParams& params) { params.Validate(); impl_->hdr = params; }
VulkanHdrParams OpenGLRenderer::HdrParams() const { return impl_->hdr; }
void OpenGLRenderer::PrepareScale(bool, std::span<const OpenGLScaleStep> steps, unsigned int, unsigned int)
{
    if (!steps.empty()) throw std::runtime_error(
        "OpenGL 3.0 cannot execute the configured HLSL compute scaling chain; GLSL 1.30 has no compute stage");
}
void OpenGLRenderer::WarmScale(bool) {}
void OpenGLRenderer::SetScaleMode(bool enabled, bool)
{
    if (enabled) throw std::runtime_error("OpenGL 3.0 custom compute scaling is not supported");
}
OpenGLScaleImage OpenGLRenderer::ScaleOutput(bool) const { return {}; }
OpenGLRenderer::ScaleCounts OpenGLRenderer::GetScaleCounts() const { return {}; }
GpuClip OpenGLRenderer::PresentRect(int w, int h) const
{
    return FitSceneToSurface(impl_->width, impl_->height, w, h);
}
unsigned int OpenGLRenderer::MaxImageDimension2D() const { return impl_->maximum; }
OpenGLRenderer::ResourceCounts OpenGLRenderer::GetResourceCounts() const
{
    return {impl_->textures.size(),0,0,1,impl_->batches.size()};
}
}
