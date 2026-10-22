#include "D3d9RendererInternal.h"
#include "graphics/FontWeights.h"
#include <algorithm>
#include <cmath>
#include <cstring>
#include <limits>

namespace Sexy {
using namespace DX9;
namespace S = D3d9Shaders;
namespace {
S::Float4 ColorBytes(unsigned int value)
{
    return {float((value >> 16) & 255), float((value >> 8) & 255),
        float(value & 255), float(value >> 24)};
}
S::Float4 TintBytes(int value)
{
    const auto bits = static_cast<unsigned int>(value);
    return {float(bits & 255), float((bits >> 8) & 255),
        float((bits >> 16) & 255), float(bits >> 24)};
}
S::Float4 CausticOffset(unsigned int u, unsigned int v)
{
    return {float((u >> 16) & 255), float(u & 65535), float((v >> 16) & 255), float(v & 65535)};
}
unsigned int DivideSigned(unsigned int value, int divisor)
{
    const auto signedValue = value <= 0x7fffffffU ?
        static_cast<long long>(value) : static_cast<long long>(value) - 0x100000000LL;
    return static_cast<unsigned int>(signedValue / divisor);
}
}
void D3d9Renderer::Impl::ImagePass(D3d9Texture* target, D3d9Texture* source,
    D3d9Texture* alpha, int operation, const GpuImageProcessing* processing,
    int columns, int rows, unsigned int color, bool colorOnly)
{
    Flush();
    D3d9Texture sourceCopy, alphaCopy;
    if (source->storage == target->storage) {
        sourceCopy = *source; sourceCopy.storage = Snapshot(source);
        source = &sourceCopy;
    }
    if (alpha && alpha->storage == target->storage) {
        alphaCopy = *alpha; alphaCopy.storage = Snapshot(alpha);
        alpha = &alphaCopy;
    }
    Target(target->storage->surface.value, target->width, target->height);
    Check(device->SetVertexShader(imageVS.value), "Bind D3D9 image vertex shader");
    auto* program = operation == 0 ? copyPS.value : operation == 1 ? colorizePS.value :
        operation == 2 ? composePS.value : operation == 3 ? causticsPS.value : nullptr;
    if (!program) throw std::invalid_argument("Unknown D3D9 image operation");
    Check(device->SetPixelShader(program), "Bind D3D9 image pixel shader");
    Constants c{}; Source(c, source);
    c[S::Rectangle] = {float(processing ? processing->x : 0), float(processing ? processing->y : 0),
        float(target->width), float(target->height)};
    const auto* mask = alpha ? alpha : source;
    c[S::AlphaRect] = {0, 0, float(mask->width), float(mask->height)};
    c[S::AlphaTexture] = {1.0f / float(mask->storage->width), 1.0f / float(mask->storage->height), 0, 0};
    c[S::PackedColor] = ColorBytes(color);
    c[S::Cells] = {float(columns), float(rows), float(target->width / columns), float(target->height / rows)};
    c[S::Modes].z = float(colorOnly);
    if (processing) {
        c[S::TintRed] = TintBytes(processing->red); c[S::TintGreen] = TintBytes(processing->green);
        c[S::TintBlue] = TintBytes(processing->blue); c[S::TintAlpha] = TintBytes(processing->alpha);
        c[S::Modes].w = float(processing->red <= 255 && processing->green <= 255 &&
            processing->blue <= 255 && processing->alpha <= 255);
    }
    const unsigned int p0 = causticCounter << 16;
    const unsigned int p1 = ((causticCounter & 65535U) + 1U) << 16;
    c[S::CausticOffset0] = CausticOffset(DivideSigned(p0, 10), 0);
    c[S::CausticOffset1] = CausticOffset(0U - DivideSigned(p1, 6), p0 >> 3);
    SetConstants(c);
    Check(device->SetTexture(S::SourceImage, source->storage->image.value), "Bind D3D9 image source");
    Check(device->SetTexture(S::AlphaImage, mask->storage->image.value), "Bind D3D9 alpha source");
    Quad(target->width, target->height);
}
D3d9Texture* D3d9Renderer::ProcessImage(D3d9Texture* source, const GpuImageProcessing& processing)
{
    auto& s = *impl_;
    if (!source || !s.textures.contains(source)) throw std::invalid_argument("D3D9 image processing requires a live source");
    if (processing.operation != GpuImageOperation::Copy && processing.operation != GpuImageOperation::Colorize)
        throw std::invalid_argument("Unknown D3D9 image operation");
    auto* target = s.Allocate(processing.width, processing.height, D3DFMT_A8R8G8B8, true);
    try {
        s.ImagePass(target, source, nullptr, processing.operation == GpuImageOperation::Copy ? 0 : 1, &processing);
    } catch (...) { DestroyTexture(target); throw; }
    return target;
}
D3d9Texture* D3d9Renderer::CopyTextureRegion(D3d9Texture* source, int x, int y, int w, int h)
{
    auto& s = *impl_;
    if (!source || !s.textures.contains(source)) throw std::invalid_argument("D3D9 region copy requires a live source");
    s.Flush();
    auto* target = s.Allocate(w, h, source->storage->format, true);
    target->flags = source->flags; target->render = source->render;
    try {
        s.Target(target->storage->surface.value, w, h);
        Check(s.device->Clear(0, nullptr, D3DCLEAR_TARGET, 0, 1, 0), "Clear D3D9 region copy");
        const int left = static_cast<int>(std::clamp<long long>(x, 0, source->width));
        const int top = static_cast<int>(std::clamp<long long>(y, 0, source->height));
        const int right = static_cast<int>(std::clamp<long long>(static_cast<long long>(x) + w, 0, source->width));
        const int bottom = static_cast<int>(std::clamp<long long>(static_cast<long long>(y) + h, 0, source->height));
        if (right > left && bottom > top) {
            RECT from{left, top, right, bottom};
            RECT to{left - x, top - y, right - x, bottom - y};
            Check(s.device->StretchRect(source->storage->surface.value, &from, target->storage->surface.value,
                &to, D3DTEXF_NONE), "Lossless D3D9 region copy");
        }
    } catch (...) { DestroyTexture(target); throw; }
    return target;
}
D3d9Texture* D3d9Renderer::ComposeAlphaRaw(D3d9Texture* base, D3d9Texture* alpha,
    int columns, int rows, unsigned int color, bool colorOnly)
{
    auto& s = *impl_;
    if (!base || !alpha || !s.textures.contains(base) || !s.textures.contains(alpha) ||
        columns <= 0 || rows <= 0 || columns > base->width || rows > base->height ||
        alpha->width < base->width / columns || alpha->height < base->height / rows)
        throw std::invalid_argument("Invalid D3D9 alpha composition dimensions");
    auto* target = s.Allocate(base->width, base->height, D3DFMT_A8R8G8B8, false);
    try { s.ImagePass(target, base, alpha, 2, nullptr, columns, rows, color, colorOnly); }
    catch (...) { DestroyTexture(target); throw; }
    return target;
}
D3d9Texture* D3d9Renderer::AdoptComposedTexture(D3d9Texture* image)
{
    auto& s = *impl_;
    if (!image || !s.textures.contains(image) || image->slot != ~0U)
        throw std::invalid_argument("Only raw D3D9 composition can be adopted");
    s.Register(image);
    for (auto it = s.textures.begin(); it != s.textures.end();) {
        auto* candidate = it->first;
        if (candidate != s.scene && candidate != s.selected && candidate->slot == ~0U)
            it = s.textures.erase(it);
        else ++it;
    }
    return image;
}
D3d9Texture* D3d9Renderer::ComposeAlpha(D3d9Texture* base, D3d9Texture* alpha,
    int columns, int rows, unsigned int color, bool colorOnly)
{
    return AdoptComposedTexture(ComposeAlphaRaw(base, alpha, columns, rows, color, colorOnly));
}
namespace {
float ExactInteger(long long value)
{
    if (value < -16777216 || value > 16777216)
        throw std::runtime_error("D3D9 font table integer exceeds exact float32 representation");
    return static_cast<float>(value);
}
void ValidateAxis(const FontAxisWeights& axis, unsigned int unit)
{
    for (size_t i = 1; i < axis.offsets.size(); ++i) {
        const auto begin = axis.offsets[i - 1], end = axis.offsets[i];
        if (end - begin > unit)
            throw std::runtime_error("D3D9 font axis exceeds the exact SM3 tap loop limit");
        unsigned long long sum = 0;
        for (auto tap = begin; tap < end; ++tap) {
            if (!axis.taps[tap].weight) throw std::runtime_error("D3D9 font table contains a zero weight");
            sum += axis.taps[tap].weight;
        }
        if (sum > unit) throw std::runtime_error("D3D9 font weights exceed exact float32 accumulation bound");
    }
}
unsigned int MaximumTapCount(const FontAxisWeights& axis)
{
    unsigned int count = 0;
    for (size_t i = 1; i < axis.offsets.size(); ++i)
        count = std::max(count, axis.offsets[i] - axis.offsets[i - 1]);
    return count;
}
struct WeightTexture {
    Com<IDirect3DTexture9> image;
    int width = 0, height = 0;
    WeightTexture(IDirect3DDevice9Ex* device, const FontAxisWeights& axis, bool ranges, int maximum)
    {
        const size_t count = ranges ? axis.offsets.size() - 1 : axis.taps.size();
        if (count > size_t(maximum) * maximum)
            throw std::runtime_error("D3D9 font weight table exceeds texture size limit");
        width = static_cast<int>(std::min<size_t>(maximum, std::max<size_t>(1, count)));
        height = static_cast<int>(std::max<size_t>(1, (count + width - 1) / width));
        Com<IDirect3DTexture9> staging;
        Check(device->CreateTexture(width, height, 1, 0, D3DFMT_A32B32G32R32F,
            D3DPOOL_SYSTEMMEM, staging.put(), nullptr), "Allocate D3D9 font table staging");
        D3DLOCKED_RECT lock{};
        Check(staging->LockRect(0, &lock, nullptr, 0), "Lock D3D9 font table");
        try {
            for (int y = 0; y < height; ++y) {
                auto* row = reinterpret_cast<S::Float4*>(static_cast<unsigned char*>(lock.pBits) + size_t(y) * lock.Pitch);
                for (int x = 0; x < width; ++x) {
                    const size_t index = size_t(y) * width + x;
                    row[x] = {};
                    if (index >= count) continue;
                    if (ranges) row[x] = {ExactInteger(axis.offsets[index]),
                        ExactInteger(axis.offsets[index + 1] - axis.offsets[index]), 0, 0};
                    else {
                        const auto& tap = axis.taps[index];
                        const auto signedIndex = tap.index <= 0x7fffffffU ?
                            static_cast<long long>(tap.index) : static_cast<long long>(tap.index) - 0x100000000LL;
                        row[x] = {ExactInteger(signedIndex), ExactInteger(tap.weight), 0, 0};
                    }
                }
            }
        } catch (...) { staging->UnlockRect(0); throw; }
        Check(staging->UnlockRect(0), "Unlock D3D9 font table");
        Check(device->CreateTexture(width, height, 1, 0, D3DFMT_A32B32G32R32F,
            D3DPOOL_DEFAULT, image.put(), nullptr), "Allocate D3D9 exact float32 font table");
        Check(device->UpdateTexture(staging.value, image.value), "Upload D3D9 font table");
    }
    S::Float4 Extent() const { return {float(width), float(height), 1.0f / float(width), 1.0f / float(height)}; }
};
}
void D3d9Renderer::RenderFontAtlas(D3d9Texture* target, D3d9Texture* source,
    std::span<const GpuFontGlyph> glyphs, unsigned int samplingFlags, bool forceWhite)
{
    auto& s = *impl_;
    if (!target || !source || !s.textures.contains(target) || !s.textures.contains(source) || !target->render)
        throw std::invalid_argument("D3D9 font generation requires live source and float target");
    s.Flush();
    D3d9Texture sourceCopy;
    if (source->storage == target->storage) {
        sourceCopy = *source; sourceCopy.storage = s.Snapshot(source);
        source = &sourceCopy;
    }
    // Validate all rectangles before modifying the target.
    for (const auto& glyph : glyphs)
        if (glyph.sourceWidth <= 0 || glyph.sourceHeight <= 0 || glyph.sourceX < 0 || glyph.sourceY < 0 ||
            static_cast<long long>(glyph.sourceX) + glyph.sourceWidth > source->width ||
            static_cast<long long>(glyph.sourceY) + glyph.sourceHeight > source->height ||
            glyph.targetX < 0 || glyph.targetY < 0 || glyph.targetWidth <= 0 || glyph.targetHeight <= 0 ||
            static_cast<long long>(glyph.targetX) + glyph.targetWidth > target->width ||
            static_cast<long long>(glyph.targetY) + glyph.targetHeight > target->height)
            throw std::invalid_argument("D3D9 font glyph rectangle exceeds its image");
    s.Target(target->storage->surface.value, target->width, target->height);
    Check(s.device->SetVertexShader(s.imageVS.value), "Bind D3D9 font vertex shader");
    Check(s.device->SetPixelShader(s.fontPS.value), "Bind D3D9 font pixel shader");
    for (const auto& glyph : glyphs) {
        const auto x = BuildFontAxisWeights(glyph.sourceWidth, glyph.targetWidth,
            glyph.sourceX, source->width, 257);
        const auto y = BuildFontAxisWeights(glyph.sourceHeight, glyph.targetHeight,
            glyph.sourceY, source->height, 256);
        ValidateAxis(x, 257); ValidateAxis(y, 256);
        const auto pairs = static_cast<unsigned long long>(MaximumTapCount(x)) * MaximumTapCount(y);
        if ((pairs + 1) * s.fontInstructionsPerTap > s.context.caps.maxPixelShaderInstructionsExecuted)
            throw std::runtime_error("Exact D3D9 font workload exceeds the device executed-instruction limit");
        WeightTexture xr(s.device, x, true, s.maximum), yr(s.device, y, true, s.maximum);
        WeightTexture xt(s.device, x, false, s.maximum), yt(s.device, y, false, s.maximum);
        Impl::Constants c{}; s.Source(c, source);
        c[S::SourceFlags].z = float(bool(samplingFlags & GpuVertex::kAlphaEdgeFilter));
        c[S::Modes].y = float(forceWhite);
        c[S::GlyphSource] = {float(glyph.sourceX), float(glyph.sourceY), float(glyph.sourceWidth), float(glyph.sourceHeight)};
        c[S::GlyphDestination] = {float(glyph.targetX), float(glyph.targetY), float(glyph.targetWidth), float(glyph.targetHeight)};
        c[S::XRangeTexture] = xr.Extent(); c[S::YRangeTexture] = yr.Extent();
        c[S::XTapTexture] = xt.Extent(); c[S::YTapTexture] = yt.Extent();
        s.SetConstants(c);
        Check(s.device->SetTexture(S::SourceImage, source->storage->image.value), "Bind D3D9 font source");
        Check(s.device->SetTexture(S::XRanges, xr.image.value), "Bind D3D9 font X ranges");
        Check(s.device->SetTexture(S::YRanges, yr.image.value), "Bind D3D9 font Y ranges");
        Check(s.device->SetTexture(S::XTaps, xt.image.value), "Bind D3D9 font X taps");
        Check(s.device->SetTexture(S::YTaps, yt.image.value), "Bind D3D9 font Y taps");
        D3DVIEWPORT9 viewport{DWORD(glyph.targetX), DWORD(glyph.targetY), DWORD(glyph.targetWidth),
            DWORD(glyph.targetHeight), 0, 1};
        Check(s.device->SetViewport(&viewport), "Set D3D9 glyph viewport");
        s.Quad(glyph.targetWidth, glyph.targetHeight);
    }
    for (unsigned int i = 1; i < 5; ++i)
        Check(s.device->SetTexture(i, nullptr), "Release D3D9 font table binding");
}
D3d9Texture* D3d9Renderer::CreateCausticsTexture(int w, int h, D3d9Texture* source)
{
    if (w != 128 || h != 64) throw std::invalid_argument("D3D9 caustics output must be 128 by 64");
    auto& s = *impl_;
    s.Flush();
    auto* target = s.Allocate(w, h, D3DFMT_A8R8G8B8, true); target->caustic = true;
    try {
        s.Target(target->storage->surface.value, w, h);
        Check(s.device->Clear(0, nullptr, D3DCLEAR_TARGET, 0x00ffffff, 1, 0), "Clear D3D9 caustics");
        UseCausticsTexture(target, source);
    } catch (...) { DestroyTexture(target); throw; }
    return target;
}
void D3d9Renderer::UseCausticsTexture(D3d9Texture* output, D3d9Texture* source)
{
    auto& s = *impl_;
    if (s.open || !output || !source || !s.textures.contains(output) || !s.textures.contains(source) ||
        !output->caustic || output->width != 128 || output->height != 64 ||
        output->storage->format != D3DFMT_A8R8G8B8 || source->width != 256 || source->height != 256)
        throw std::invalid_argument("Invalid D3D9 caustics source/output");
    s.causticTarget = output; s.causticSource = source; s.causticsQueued = true;
}
void D3d9Renderer::SetCausticsFrame(unsigned int frame)
{
    impl_->causticCounter = frame; impl_->causticsQueued = impl_->causticTarget != nullptr;
}
bool D3d9Renderer::HasCausticsCompute() const { return bool(impl_->causticsPS); }
std::vector<float> D3d9Renderer::ReadTextureFloats(D3d9Texture* image)
{
    auto& s = *impl_;
    if (s.open) throw std::logic_error("D3D9 diagnostic readback requires a closed scene");
    if (!image || !s.textures.contains(image)) throw std::invalid_argument("Cannot read destroyed D3D9 image");
    const auto& storage = *image->storage;
    Com<IDirect3DSurface9> staging;
    Check(s.device->CreateOffscreenPlainSurface(storage.width, storage.height, storage.format,
        D3DPOOL_SYSTEMMEM, staging.put(), nullptr), "Allocate D3D9 diagnostic readback");
    Check(s.device->GetRenderTargetData(storage.surface.value, staging.value), "Read D3D9 render texture");
    D3DLOCKED_RECT lock{};
    Check(staging->LockRect(&lock, nullptr, D3DLOCK_READONLY), "Lock D3D9 diagnostic readback");
    std::vector<float> result;
    try {
        result.resize(size_t(image->width) * image->height * 4);
        for (int y = 0; y < image->height; ++y) {
            const auto* row = static_cast<const unsigned char*>(lock.pBits) + size_t(y) * lock.Pitch;
            auto* destination = result.data() + size_t(y) * image->width * 4;
            if (storage.format == D3DFMT_A32B32G32R32F)
                std::memcpy(destination, row, size_t(image->width) * 16);
            else for (int x = 0; x < image->width; ++x) {
                const auto* pixel = row + size_t(x) * 4;
                destination[x * 4] = pixel[2] / 255.0f; destination[x * 4 + 1] = pixel[1] / 255.0f;
                destination[x * 4 + 2] = pixel[0] / 255.0f; destination[x * 4 + 3] = pixel[3] / 255.0f;
            }
        }
    } catch (...) { staging->UnlockRect(); throw; }
    Check(staging->UnlockRect(), "Unlock D3D9 diagnostic readback");
    return result;
}
ImagePixels D3d9Renderer::ReadTexturePixels(D3d9Texture* image)
{
    const auto values = ReadTextureFloats(image);
    ImagePixels output(image->width, image->height);
    const auto byte = [](float value) {
        return static_cast<unsigned int>(std::round(std::clamp(value, 0.0f, 1.0f) * 255.0f));
    };
    for (size_t i = 0; i < output.pixels.size(); ++i) {
        const auto alpha = image->flags & GpuVertex::kOpaqueInput ? 1.0f : values[i * 4 + 3];
        const auto factor = image->render ? (alpha > 0 ? 1.0f / alpha : 0) : 1.0f;
        output.pixels[i] = (byte(alpha) << 24) | (byte(values[i * 4] * factor) << 16) |
            (byte(values[i * 4 + 1] * factor) << 8) | byte(values[i * 4 + 2] * factor);
    }
    return output;
}
std::vector<unsigned int> D3d9Renderer::ReadScenePixels()
{
    if (!impl_->sceneInitialized) throw std::logic_error("D3D9 scene readback requires a completed main scene");
    return ReadTexturePixels(impl_->scene).pixels;
}
std::vector<unsigned int> D3d9Renderer::ReadScalePixels(bool)
{
    throw std::logic_error("Direct3D9Ex has no configured custom compute scaling output");
}
}
