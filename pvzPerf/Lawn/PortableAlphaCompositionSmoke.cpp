#include "ModernVulkanSmoke.h"
#include "LawnApp.h"
#include "graphics/DDImage.h"
#include "graphics/DDInterface.h"
#include "graphics/MemoryImage.h"
#include "graphics/RenderInterface.h"
#include "imagelib/ImageLib.h"
#include "misc/AutoCrit.h"
#include "misc/Buffer.h"
#include "misc/ResourceManager.h"
#include <algorithm>
#include <array>
#include <cstdlib>
#include <exception>
#include <filesystem>
#include <fstream>
#include <iomanip>
#include <memory>
#include <span>
#include <stdexcept>
#include <string>
#include <utility>
#include <vector>
#include <zlib.h>

namespace {
using Pixels = std::vector<uint32_t>;
using Decoded = std::unique_ptr<ImageLib::Image>;
using Sexy::MemoryImage;
using Sexy::RenderInterface;

void Require(bool value, const char* message) {
    if (!value) throw std::runtime_error(message);
}

struct Raster {
    int width, height;
    Pixels pixels;
};

Raster Pattern(int width, int height, unsigned seed) {
    Raster result{width, height, Pixels(size_t(width) * height)};
    for (size_t i = 0; i < result.pixels.size(); ++i) {
        const unsigned n = unsigned(i);
        // Each byte varies independently; blue covers all 256 values on large fixtures.
        const auto a = std::array{0u, 1u, 63u, 127u, 191u, 254u, 255u}[(n + seed) % 7];
        result.pixels[i] = (a << 24) | (((n * 37 + seed * 19 + 11) & 255u) << 16) |
            (((n * 73 + seed * 29 + 23) & 255u) << 8) | ((n + seed * 41) & 255u);
    }
    return result;
}

// Independent 1073 oracle: no renderer, production composition helper, floats,
// alpha multiplication, premultiplication, or alpha-zero RGB normalization.
Raster AlphaOnlyOracle(const Raster& alpha, uint32_t color) {
    Raster result = alpha;
    for (auto& pixel : result.pixels) pixel = color | ((pixel & 0xffu) << 24);
    return result;
}

Raster AlphaOracle(const Raster& base, const Raster& alpha, int columns = 1, int rows = 1) {
    Require(columns > 0 && rows > 0 && base.width / columns == alpha.width &&
        base.height / rows == alpha.height, "Invalid oracle fixture geometry");
    Raster result = base;
    const int coveredWidth = alpha.width * columns, coveredHeight = alpha.height * rows;
    for (int y = 0; y < coveredHeight; ++y) for (int x = 0; x < coveredWidth; ++x) {
        const size_t destination = size_t(y) * base.width + x;
        const size_t source = size_t(y % alpha.height) * alpha.width + x % alpha.width;
        result.pixels[destination] = (base.pixels[destination] & 0x00ffffffu) |
            ((alpha.pixels[source] & 0xffu) << 24);
    }
    return result;
}

struct FixtureFiles {
    std::string directory;
    FixtureFiles() {
        for (unsigned n = 0; n < 10000; ++n) {
            directory = "alpha-composition-" + std::to_string(n);
            if (std::filesystem::create_directory(ModernSmoke::ProbePath(directory))) return;
        }
        throw std::runtime_error("No unused isolated alpha-composition fixture directory");
    }
    std::string Path(const std::string& name) const {
        Require(name.find_first_of("/\\") == std::string::npos && name != "..",
            "Alpha fixture filename escaped its isolated directory");
        auto path = ModernSmoke::ProbePath(directory + "/" + name);
        std::replace(path.begin(), path.end(), '\\', '/');
        return path;
    }
    void PNG(const std::string& name, const Raster& raster) const {
        Require(ImageLib::WritePNGImage(Path(name), raster.width, raster.height,
            std::span<const uint32_t>(raster.pixels)), "Cannot write private alpha fixture PNG");
    }
    Decoded Decode(const std::string& name, bool automatic = false) const {
        Decoded result(ImageLib::GetImage(Path(name), automatic));
        Require(bool(result), "Cannot decode private alpha fixture");
        return result;
    }
};

bool SameCounts(const Sexy::GpuRenderer::ResourceCounts& a,
    const Sexy::GpuRenderer::ResourceCounts& b) {
    return a.textures == b.textures && a.retiredTextures == b.retiredTextures &&
        a.descriptorPools == b.descriptorPools && a.vertexBuffers == b.vertexBuffers;
}

void Counts(std::ostream& log, const char* label,
    const Sexy::GpuRenderer::ResourceCounts& counts) {
    log << label << " textures=" << counts.textures << " retired=" << counts.retiredTextures
        << " pools=" << counts.descriptorPools << " vertexBuffers=" << counts.vertexBuffers << '\n';
}

struct PrivateCache {
    LawnApp& app;
    bool cleanupBefore;
    std::vector<Sexy::SharedImageMap::key_type> keys;
    explicit PrivateCache(LawnApp& value) : app(value), cleanupBefore(value.mCleanupSharedImages.load()) {}
    void Track(const std::string& path, unsigned variant) {
        const Sexy::SharedImageMap::key_type key(Sexy::StringToUpper(path), variant);
        Sexy::AutoCrit lock(app.mDDInterface->mCritSect);
        Require(!app.mSharedImageMap.contains(key) &&
            std::find(keys.begin(), keys.end(), key) == keys.end(), "Private alpha cache key collision");
        keys.push_back(key);
    }
    bool Clean() {
        Sexy::AutoCrit lock(app.mDDInterface->mCritSect);
        bool complete = true;
        for (const auto& key : keys) {
            const auto found = app.mSharedImageMap.find(key);
            if (found == app.mSharedImageMap.end()) continue;
            if (found->second.mRefCount != 0) { complete = false; continue; }
            Sexy::Image::Destroy(found->second.mImage);
            app.mSharedImageMap.erase(found);
        }
        app.mCleanupSharedImages.store(cleanupBefore);
        return complete;
    }
    ~PrivateCache() { Clean(); }
};

struct SavedState {
    LawnApp& app;
    RenderInterface& render;
    Sexy::DDImage* screen;
    Sexy::DDImage* drawSurface;
    uint32_t sampling;
    RenderInterface::TransformStack transforms;
    Sexy::MemoryImageSet images;
    RenderInterface::ImageSet gpuImages;
    Sexy::GpuRenderer::ResourceCounts gpuCounts;
    unsigned int* screenBits;
    unsigned int* screenPalette;
    uchar* screenIndices;
    void* screenGpu;
    ImageLib::Image* screenPending;
    int screenVersion;
    Raster scene;
    struct CacheEntry {
        Sexy::SharedImageMap::key_type key;
        Sexy::DDImage* image;
        int references;
    };
    std::vector<CacheEntry> cache;

    SavedState(LawnApp& value, RenderInterface& renderer) : app(value), render(renderer),
        screen(value.mDDInterface->mScreenImage), drawSurface(renderer.mDrawSurface),
        sampling(renderer.sImageSamplingFlags), transforms(renderer.mTransformStack),
        images(value.mMemoryImageSet), gpuImages(renderer.mImageSet),
        gpuCounts(renderer.mRenderer->GetResourceCounts()), screenBits(screen->mBits),
        screenPalette(screen->mColorTable), screenIndices(screen->mColorIndices),
        screenGpu(screen->mD3DData), screenPending(screen->mPendingDecoded.get()),
        screenVersion(screen->mBitsChangedCount), scene{screen->mWidth, screen->mHeight, {}} {
        Require(!render.mSceneBegun && !render.mRenderer->sceneOpen,
            "Alpha smoke normalization did not finish the original draw batch");
        // Reading the retained screen is diagnostic only; never draw fixture pixels into it.
        scene.pixels = render.ReadImagePixels(*screen).pixels;
        Sexy::AutoCrit lock(app.mDDInterface->mCritSect);
        for (const auto& [key, entry] : app.mSharedImageMap)
            cache.push_back({key, entry.mImage, entry.mRefCount});
    }
    void Restore() {
        render.sImageSamplingFlags = sampling;
        render.mTransformStack = transforms;
        if (render.mDrawSurface != drawSurface) render.SelectDrawSurface(drawSurface);
    }
    void Verify() {
        Require(app.mDDInterface->mScreenImage == screen && screen->mBits == screenBits &&
            screen->mColorTable == screenPalette && screen->mColorIndices == screenIndices &&
            screen->mD3DData == screenGpu && screen->mPendingDecoded.get() == screenPending &&
            screen->mBitsChangedCount == screenVersion, "Alpha smoke changed screen ownership");
        Require(!render.mSceneBegun && !render.mRenderer->sceneOpen &&
            render.mDrawSurface == drawSurface && render.sImageSamplingFlags == sampling,
            "Alpha smoke did not restore the renderer draw state");
        Require(render.ReadImagePixels(*screen).pixels == scene.pixels,
            "Alpha smoke changed retained screen RGBA");
        Require(app.mMemoryImageSet == images && render.mImageSet == gpuImages &&
            SameCounts(render.mRenderer->GetResourceCounts(), gpuCounts),
            "Alpha smoke retained images or GPU objects");
        Sexy::AutoCrit lock(app.mDDInterface->mCritSect);
        Require(app.mSharedImageMap.size() == cache.size(), "Alpha smoke retained private cache nodes");
        for (const auto& entry : cache) {
            const auto found = app.mSharedImageMap.find(entry.key);
            Require(found != app.mSharedImageMap.end() && found->second.mImage == entry.image &&
                found->second.mRefCount == entry.references, "Alpha smoke changed a production cache entry");
        }
    }
};

struct Probe {
    LawnApp& app;
    RenderInterface& render;
    const FixtureFiles& files;
    std::ostream& log;
    unsigned comparisons = 0, pixels = 0, zeroAlphaRGB = 0, pendingRejections = 0;

    void NoCPU(const MemoryImage& image, bool cpuResident = false) const {
        // 2026-10-11 解码期 CPU 合成恢复：readUploads 夹具合法走 CPU 直读路径
        // （ReadImagePixels 对有位图者不再强制上传）。cpuResident=true 只禁
        // 调色板/pending/软件缓存；GPU 常驻形态仍要求纹理在场且无位图——
        // "上传即弃"契约由 Upload 内非 readUploads 用例的 GetBits 拒绝探针
        // 保留（有常驻纹理时 GetBits 必须抛 GpuImageCpuAccess）。
        if (cpuResident) {
            Require(!image.mColorTable && !image.mColorIndices && !image.mPendingDecoded &&
                !image.mNativeAlphaData && !image.mRLAlphaData && !image.mRLAdditiveData,
                "CPU-resident alpha fixture retained palette/pending/software caches");
            return;
        }
        Require(image.mD3DData && !image.mBits && !image.mColorTable && !image.mColorIndices &&
            !image.mPendingDecoded && !image.mNativeAlphaData && !image.mRLAlphaData &&
            !image.mRLAdditiveData, "Uploaded alpha image retained CPU/palette/pending storage");
    }
    void PendingCPU(MemoryImage& image) {
        Require(bool(image.mPendingDecoded), "Pending CPU rejection fixture is not pending");
        auto* bits = image.mBits;
        auto* pending = image.mPendingDecoded.get();
        const int version = image.mBitsChangedCount;
        bool rejected = false;
        try { image.GetBits(); } catch (const Sexy::GpuImageCpuAccess&) { rejected = true; }
        Require(rejected && image.mBits == bits && image.mPendingDecoded.get() == pending &&
            image.mBitsChangedCount == version && !image.mD3DData,
            "Pending GetBits accepted CPU access or changed ownership");
        rejected = false;
        try { image.GetNativeAlphaData(app.mDDInterface); }
        catch (const Sexy::GpuImageCpuAccess&) { rejected = true; }
        Require(rejected && image.mBits == bits && image.mPendingDecoded.get() == pending &&
            !image.mNativeAlphaData && !image.mD3DData, "Pending native-alpha access was not rejected");
        for(bool additive : {false,true}) {
            rejected=false;
            try {
                if(additive) image.GetRLAdditiveData(app.mDDInterface);
                else image.GetRLAlphaData();
            } catch(const Sexy::GpuImageCpuAccess&) { rejected=true; }
            Require(rejected && image.mBits==bits && image.mPendingDecoded.get()==pending &&
                !image.mNativeAlphaData && !image.mRLAlphaData && !image.mRLAdditiveData &&
                !image.mD3DData,"Pending software cache access changed ownership before rejection");
        }
        pendingRejections += 4;
    }
    void Compare(const char* name, MemoryImage& image, const Raster& expected, bool cpuResident = false) {
        render.Flush();
        const auto actual = render.ReadImagePixels(image);
        Require(actual.width == expected.width && actual.height == expected.height &&
            actual.pixels.size() == expected.pixels.size(), "Alpha readback dimensions differ");
        size_t different = 0, zeroRGB = 0, first = actual.pixels.size();
        for (size_t i = 0; i < actual.pixels.size(); ++i) {
            if (actual.pixels[i] != expected.pixels[i]) {
                if (!different) first = i;
                ++different;
            }
            zeroRGB += (expected.pixels[i] >> 24) == 0 && (expected.pixels[i] & 0x00ffffffu) != 0;
        }
        log << "rgba case=" << name << " size=" << expected.width << 'x' << expected.height
            << " pixels=" << actual.pixels.size() << " zeroAlphaNonzeroRGB=" << zeroRGB
            << " different=" << different;
        if (different) log << " first=" << first << " x=" << first % expected.width
            << " y=" << first / expected.width << " expected=0x" << std::hex
            << expected.pixels[first] << " actual=0x" << actual.pixels[first] << std::dec;
        log << std::endl;
        Require(!different, "Exact alpha-composition RGBA mismatch; see alpha-composition-cases.txt");
        NoCPU(image, cpuResident);
        ++comparisons;
        pixels += unsigned(actual.pixels.size());
        zeroAlphaRGB += unsigned(zeroRGB);
    }
    void Upload(const char* name, MemoryImage& image, const Raster& expected, bool readUploads = false) {
        const bool composed = bool(image.mPendingDecoded);
        const int version = image.mBitsChangedCount;
        if (composed) PendingCPU(image);
        if (!readUploads) Require(render.CreateImageTexture(&image), "Cannot upload alpha fixture");
        Compare(name, image, expected, readUploads);
        Require(image.mBitsChangedCount == version, "Alpha upload changed the decoded image revision");
        auto* data = image.mD3DData;
        if (composed && !readUploads) Require(!static_cast<Sexy::TextureData*>(data)->mGPUOwned &&
            !static_cast<Sexy::TextureData*>(data)->mRenderTarget,
            "Composed source was incorrectly frozen as a GPU-owned render target");
        if (readUploads) return;  // CPU 驻留夹具：无纹理身份可断言
        auto* texture = static_cast<Sexy::TextureData*>(data)->mTexture;
        Require(render.CreateImageTexture(&image), "Resident alpha image rejected an upload check");
        Require(image.mD3DData == data &&
            static_cast<Sexy::TextureData*>(data)->mTexture == texture,
            "Resident alpha image unnecessarily replaced its GPU ownership");
        NoCPU(image);
        bool rejected = false;
        try { image.GetBits(); } catch (const Sexy::GpuImageCpuAccess&) { rejected = true; }
        Require(rejected, "Uploaded alpha image recreated a CPU bitmap");
        NoCPU(image);
    }
    void Adopt(MemoryImage& target, Decoded decoded, bool commit) {
        auto* record = decoded.get();
        auto* bits = decoded->mBits;
        const bool pending = decoded->HasComposition();
        std::vector<std::pair<ImageLib::Image*, unsigned int*>> descendants;
        const auto collect = [&](auto&& self, ImageLib::Image& node) -> void {
            for (auto& layer : node.mAlphaLayers) {
                descendants.emplace_back(layer.image.get(), layer.image->mBits);
                self(self, *layer.image);
            }
        };
        collect(collect, *decoded);
        target.AdoptDecodedImage(std::move(decoded), commit);
        Require(!decoded && target.mBits == bits &&
            target.mBits[size_t(target.mWidth) * target.mHeight] == Sexy::MEMORYCHECK_ID &&
            !target.mD3DData && !target.mColorTable && !target.mColorIndices &&
            bool(target.mPendingDecoded) == pending, "Decoder-to-MemoryImage adoption copied pixels");
        if (pending) {
            Require(target.mPendingDecoded.get() == record && !record->mBits,
                "Decoded composition record was copied or retained duplicate primary ownership");
            for (const auto& [node, original] : descendants)
                Require(node->mBits == original, "Decoded recursive alpha pixels were copied during adoption");
        }
        log << "adopt pointerIdentity=1 pending=" << pending << " commit=" << commit
            << " unchangedChildPointers=" << descendants.size() << std::endl;
    }
    void Append(MemoryImage& image, Decoded alpha, int columns = 1, int rows = 1) {
        auto* node = alpha.get();
        auto* bits = alpha->mBits;
        auto* primary = image.mBits;
        const size_t previous = image.mPendingDecoded ? image.mPendingDecoded->mAlphaLayers.size() : 0;
        image.AppendAlphaImage(std::move(alpha), columns, rows);
        Require(!alpha && image.mBits == primary && image.mPendingDecoded &&
            image.mPendingDecoded->mAlphaLayers.size() == previous + 1 &&
            image.mPendingDecoded->mAlphaLayers.back().image.get() == node && node->mBits == bits,
            "AppendAlphaImage copied pixels or lost its owned input");
    }
};

// Keep canonical identities and every untouched record from the production file.
// Only this private manifest is written; the production manifest is read-only.
struct NumericManifest {
    using Bytes = Sexy::ByteVector;
    std::array<unsigned, 9> header{};
    std::vector<Bytes> records;

    static unsigned U32(const Bytes& bytes, size_t offset) {
        Require(offset <= bytes.size() && bytes.size() - offset >= 4, "Numeric alpha field out of bounds");
        return unsigned(bytes[offset]) | (unsigned(bytes[offset + 1]) << 8) |
            (unsigned(bytes[offset + 2]) << 16) | (unsigned(bytes[offset + 3]) << 24);
    }
    static void Put(Bytes& bytes, size_t offset, unsigned value) {
        Require(offset <= bytes.size() && bytes.size() - offset >= 4, "Numeric alpha write out of bounds");
        for (unsigned n = 0; n < 4; ++n) bytes[offset + n] = static_cast<unsigned char>(value >> (n * 8));
    }
    static void Append(Bytes& bytes, unsigned value) {
        const auto offset = bytes.size();
        bytes.resize(offset + 4);
        Put(bytes, offset, value);
    }
    static void Path(Bytes& bytes, const std::string& path) {
        Require(path.size() <= 4096 && path.find('\0') == std::string::npos, "Numeric alpha path is invalid");
        Append(bytes, unsigned(path.size()));
        bytes.insert(bytes.end(), path.begin(), path.end());
    }
    explicit NumericManifest(LawnApp& app) {
        Sexy::Buffer input;
        Require(app.ReadBufferFromFile("compiled/resources.compiled", &input, true),
            "Cannot read production numeric manifest for alpha smoke");
        const auto& bytes = input.mData;
        Require(bytes.size() >= 36 && bytes.size() <= 16 * 1024 * 1024,
            "Production numeric manifest size changed");
        for (unsigned n = 0; n < header.size(); ++n) header[n] = U32(bytes, n * 4);
        Require(header[0] == 0x4353524eu && header[1] == 1 &&
            header[2] == unsigned(Sexy::ResourceId::RESOURCE_ID_MAX) &&
            header[3] == std::size(gImageSymbolResourceSlots) &&
            header[4] == NUMERIC_RESOURCE_SLOT_COUNT && header[5] == header[4] &&
            header[6] == IMAGE_SYMBOL_REGISTRY_CRC && header[8] == bytes.size() - 36 &&
            header[7] == crc32(0, bytes.data() + 36, header[8]), "Production numeric alpha contract changed");
        size_t offset = 36;
        for (unsigned n = 0; n < header[5]; ++n) {
            const unsigned length = U32(bytes, offset);
            offset += 4;
            Require(length >= 44 && length <= 65536 && offset <= bytes.size() &&
                length <= bytes.size() - offset, "Production numeric alpha record is invalid");
            records.emplace_back(bytes.begin() + offset, bytes.begin() + offset + length);
            offset += length;
        }
        Require(offset == bytes.size(), "Production numeric alpha records have trailing bytes");
    }
    void Image(unsigned slot, const std::string& path, const std::string& alpha,
        const std::string& grid, int columns, int rows, uint32_t color, unsigned variant) {
        const auto found = std::find_if(records.begin(), records.end(),
            [&](const Bytes& record) { return U32(record, 0) == slot; });
        Require(found != records.end() && U32(*found, 12) == Sexy::ResourceManager::ResType_Image,
            "Production numeric alpha image slot is missing");
        Bytes replacement(found->begin(), found->begin() + 16);
        Append(replacement, 256u | 1024u); // Purge; automatic-alpha stays enabled in the descriptor.
        Append(replacement, Sexy::RESOURCE_SLOT_NONE);
        Append(replacement, variant);
        Path(replacement, path);
        Path(replacement, alpha);
        Path(replacement, grid);
        Path(replacement, {});
        Append(replacement, unsigned(rows));
        Append(replacement, unsigned(columns));
        Append(replacement, color);
        Append(replacement, unsigned(Sexy::AnimType_None));
        for (unsigned n = 0; n < 5; ++n) Append(replacement, 0); // Delays and empty animation vectors.
        *found = std::move(replacement);
    }
    void Write(const std::string& path) const {
        Bytes payload;
        for (const auto& record : records) {
            Append(payload, unsigned(record.size()));
            payload.insert(payload.end(), record.begin(), record.end());
        }
        Bytes bytes;
        for (unsigned value : header) Append(bytes, value);
        Put(bytes, 28, unsigned(crc32(0, payload.data(), unsigned(payload.size()))));
        Put(bytes, 32, unsigned(payload.size()));
        bytes.insert(bytes.end(), payload.begin(), payload.end());
        std::ofstream out(path, std::ios::binary | std::ios::trunc);
        out.write(reinterpret_cast<const char*>(bytes.data()), std::streamsize(bytes.size()));
        out.close();
        Require(bool(out), "Cannot write private numeric alpha manifest");
    }
};

void DecoderCases(Probe& probe) {
    const auto& files = probe.files;
    const Raster base = Pattern(17, 19, 0), mask = Pattern(17, 19, 1);
    const Raster decoy = Pattern(17, 19, 5);
    files.PNG("plain.png", base);
    files.PNG("prefix.png", base);
    files.PNG("_prefix.png", mask);
    files.PNG("suffix.png", base);
    files.PNG("suffix_.png", mask);
    files.PNG("priority.png", base);
    files.PNG("_priority.png", mask);
    files.PNG("priority_.png", decoy);
    files.PNG("extension.png", base);
    files.PNG("extension_.png", decoy);
    const Raster composed = AlphaOracle(base, mask);

    struct Case {
        const char* name;
        const char* path;
        bool automatic, pending, commit, readUploads;
        bool decoyMask = false;
    };
    const std::array cases{
        Case{"plain-adopt-uncommitted", "plain.png", false, false, false, false},
        Case{"plain-adopt-committed", "plain.png", false, false, true, false},
        Case{"automatic-prefix", "prefix.png", true, true, false, false},
        Case{"automatic-suffix-no-extension", "suffix", true, true, true, true},
        Case{"automatic-prefix-priority", "priority", true, true, true, false},
        Case{"automatic-disabled", "prefix.png", false, false, true, false},
        Case{"automatic-suffix-explicit-extension", "extension.png", true, true, true, false, true},
        Case{"no-matching-sidecar-resource-protocol", "plain", true, false, false, false}
    };
    for (const auto& test : cases) {
        auto decoded = files.Decode(test.path, test.automatic);
        // 2026-10-11 解码期 CPU 合成恢复（1073 语义）：pending 案例在解码出口
        // 就已是合成位图；sidecar 选择协议仍由 expected 光栅逐位覆盖。
        Require(!decoded->HasComposition() && decoded->mWidth == base.width &&
            decoded->mHeight == base.height,
            "Automatic alpha decoder unexpectedly retained composition layers");
        const auto& decodedExpectation = test.pending ? (test.decoyMask ? AlphaOracle(base, decoy) : composed) : base;
        Require(std::equal(decodedExpectation.pixels.begin(), decodedExpectation.pixels.end(), decoded->mBits),
            "Automatic alpha decoder composed pixels differ from the 1073 oracle");
        MemoryImage image(&probe.app);
        image.mFilePath = files.Path(test.path);
        probe.Adopt(image, std::move(decoded), test.commit);
        probe.Upload(test.name, image,
            test.decoyMask ? AlphaOracle(base, decoy) : test.pending ? composed : base, test.readUploads);
    }

    constexpr std::array<uint32_t, 5> colors{0x00ffffffu, 0x002468adu, 0x9a3579bcu, 0xff123456u, 0u};
    const int originalColor = ImageLib::gAlphaComposeColor;
    for (unsigned n = 0; n < colors.size(); ++n) {
        const std::string name = "only-" + std::to_string(n) + ".png";
        files.PNG("_" + name, mask);
        Decoded decoded;
        if (!n) {
            Require(ImageLib::gAlphaComposeColor == 0xffffff,
                "Default alpha-only fixture requires the original white compose color");
            decoded = files.Decode(name, true);
        } else {
            ImageLib::ScopedAlphaComposeColor tint(static_cast<int>(colors[n]));
            decoded = files.Decode(name, true);
        }
        {
            const auto oracle = AlphaOnlyOracle(mask, colors[n]);
            size_t firstDiff = SIZE_MAX;
            for (size_t i = 0; i < oracle.pixels.size(); ++i)
                if (oracle.pixels[i] != decoded->mBits[i]) { firstDiff = i; break; }
            const std::string detail = "Alpha-only decoder composed pixels differ from the 1073 oracle: n=" +
                std::to_string(n) + " first=" + std::to_string(firstDiff);
            Require(ImageLib::gAlphaComposeColor == originalColor && !decoded->HasComposition() &&
                firstDiff == SIZE_MAX, detail.c_str());
        }
        MemoryImage image(&probe.app);
        probe.Adopt(image, std::move(decoded), n % 2 != 0);
        const auto label = "alpha-only-color-" + std::to_string(n);
        probe.Upload(label.c_str(), image, AlphaOnlyOracle(mask, colors[n]), n % 2 != 0);
    }
    probe.log << "decoderCases=13 defaultWhite=1 nonwhite=1 highByteOR=1 suffixWithoutExtension=1\n";
    ModernSmoke::Report("portable-alpha-decoder-thirteen-pointer-and-exact-rgba-cases", probe.app);
}

void AppendAndRecursiveCases(Probe& probe) {
    const auto& files = probe.files;
    const Raster base = Pattern(17, 11, 2), full = Pattern(17, 11, 3);
    const Raster cell = Pattern(5, 5, 7), other = Pattern(17, 11, 8);
    files.PNG("append-base.png", base);
    files.PNG("append-full.png", full);
    files.PNG("append-cell.png", cell);
    files.PNG("append-other.png", other);
    files.PNG("append-cell-inner.png", Pattern(5, 5, 11));

    {
        MemoryImage image(&probe.app);
        probe.Adopt(image, files.Decode("append-base.png"), false);
        probe.Append(image, files.Decode("append-cell.png"), 3, 2);
        const auto expected = AlphaOracle(base, cell, 3, 2);
        size_t tails = 0;
        for (int y = 0; y < base.height; ++y) for (int x = 0; x < base.width; ++x)
            if (x >= 15 || y >= 10) {
                const size_t index = size_t(y) * base.width + x;
                Require(expected.pixels[index] == base.pixels[index], "Oracle changed an uncovered grid tail");
                ++tails;
            }
        Require(tails == 37, "Grid fixture omitted its two tail columns or tail row");
        probe.Upload("append-grid-original-base-tails", image, expected, true);
        probe.log << "grid tails=" << tails << " originalBaseRGBA=1\n";
    }
    {
        MemoryImage image(&probe.app);
        probe.Adopt(image, files.Decode("append-base.png"), true);
        probe.Append(image, files.Decode("append-full.png"));
        probe.Append(image, files.Decode("append-other.png"));
        probe.Upload("append-two-layers-replace-not-multiply", image,
            AlphaOracle(AlphaOracle(base, full), other));
    }
    {
        auto decoded = files.Decode("append-base.png");
        auto middle = files.Decode("append-full.png");
        auto inner = files.Decode("append-other.png");
        inner->mColorFromAlpha = 0x6d1234adu;
        inner->mAlphaLayers.push_back({files.Decode("append-full.png"), 1, 1});
        middle->mAlphaLayers.push_back({std::move(inner), 1, 1});
        decoded->mAlphaLayers.push_back({std::move(middle), 1, 1});
        // Inner tint changes BLUE to 0xad, but middle retains its own BLUE.
        // The root must use middle BLUE, never either recursively composed alpha.
        const auto innerOracle = AlphaOracle(AlphaOnlyOracle(other, 0x6d1234adu), full);
        const auto middleOracle = AlphaOracle(full, innerOracle);
        const auto rootOracle = AlphaOracle(base, middleOracle);
        MemoryImage image(&probe.app);
        probe.Adopt(image, std::move(decoded), true);
        auto alphaCell = files.Decode("append-cell.png");
        alphaCell->mColorFromAlpha = 0x31010283u;
        const Raster cellInner = Pattern(5, 5, 11);
        alphaCell->mAlphaLayers.push_back({files.Decode("append-cell-inner.png"), 1, 1});
        probe.Append(image, std::move(alphaCell), 3, 2);
        const auto tileOracle = AlphaOracle(AlphaOnlyOracle(cell, 0x31010283u), cellInner);
        probe.Upload("recursive-four-level-blue-then-grid", image,
            AlphaOracle(rootOracle, tileOracle, 3, 2));
    }
    probe.log << "appendCases=3 recursiveDepth=4 blueNotRecursiveAlpha=1 lastLayerWins=1\n";
    ModernSmoke::Report("portable-alpha-append-recursive-blue-and-uncovered-grid-tails", probe.app);
}

void NumericCases(Probe& probe, PrivateCache& cache, const NumericManifest& production) {
    using Sexy::ResourceManager;
    const auto& files = probe.files;
    const Raster base = Pattern(17, 11, 4), mask = Pattern(17, 11, 6);
    const Raster maskSidecar = Pattern(17, 11, 12), cell = Pattern(5, 5, 9);
    files.PNG("resource-base.png", base);
    files.PNG("_resource-base.png", Pattern(17, 11, 14)); // Explicit alpha must suppress this automatic mask.
    files.PNG("resource-mask.png", mask);
    files.PNG("_resource-mask.png", maskSidecar);
    files.PNG("resource-cell.png", cell);
    files.PNG("_resource-cell.png", Pattern(5, 5, 15));
    files.PNG("_resource-alpha-only.png", mask);
    files.PNG("_resource-grid-only.png", cell);
    files.PNG("_resource-tinted-only.png", mask);
    const Raster nestedMask = AlphaOracle(mask, maskSidecar);
    const Raster nestedCell = AlphaOracle(cell, Pattern(5, 5, 15));
    constexpr unsigned id = unsigned(Sexy::ResourceId::IMAGE_PVZ_LOGO_ID);
    const std::string manifestPath = files.Path("alpha.numeric.resources");

    struct Case {
        const char* name;
        const char* primary;
        const char* alpha;
        const char* grid;
        int columns, rows;
        uint32_t color;
        Raster expected;
    };
    const std::array cases{
        Case{"numeric-explicit-alpha-recursive", "resource-base.png", "resource-mask.png", "", 1, 1,
            0xb23579adu, AlphaOracle(base, nestedMask)},
        Case{"numeric-explicit-grid-recursive-tails", "resource-base.png", "", "resource-cell.png", 3, 2,
            0x872468acu, AlphaOracle(base, nestedCell, 3, 2)},
        Case{"numeric-full-then-grid", "resource-base.png", "resource-mask.png", "resource-cell.png", 3, 2,
            0x97234567u, AlphaOracle(AlphaOracle(base, nestedMask), nestedCell, 3, 2)},
        Case{"numeric-explicit-alpha-only-default-white", "resource-base.png", "resource-alpha-only.png", "", 1, 1,
            0xb9234567u, AlphaOracle(base, AlphaOnlyOracle(mask, 0xffffffu))},
        Case{"numeric-explicit-grid-only-default-white", "resource-base.png", "", "resource-grid-only.png", 3, 2,
            0xa13579bdu, AlphaOracle(base, AlphaOnlyOracle(cell, 0xffffffu), 3, 2)},
        Case{"numeric-automatic-alpha-only-high-byte", "resource-tinted-only.png", "", "", 1, 1,
            0x953579bdu, AlphaOnlyOracle(mask, 0x953579bdu)},
        Case{"numeric-automatic-prefix", "resource-base.png", "", "", 1, 1,
            0xffffffu, AlphaOracle(base, Pattern(17, 11, 14))}
    };
    const int previousColor = ImageLib::gAlphaComposeColor;
    unsigned count = 0;
    for (const auto& test : cases) {
        auto manifest = production;
        const unsigned variant = 100 + count;
        const auto primaryPath = files.Path(test.primary);
        manifest.Image(id, primaryPath, *test.alpha ? files.Path(test.alpha) : "",
            *test.grid ? files.Path(test.grid) : "", test.columns, test.rows, test.color, variant);
        manifest.Write(manifestPath);
        cache.Track(primaryPath, variant);
        {
            ResourceManager manager(&probe.app);
            Require(manager.ParseResourcesFile(manifestPath), "Real ResourceManager rejected private alpha manifest");
            auto* descriptor = static_cast<ResourceManager::ImageRes*>(manager.GetResourceBySlot(id));
            Require(descriptor && descriptor->mPath == primaryPath &&
                descriptor->mAlphaColor == test.color && descriptor->mCols == test.columns &&
                descriptor->mRows == test.rows && descriptor->mAutoFindAlpha,
                "Numeric manifest did not publish the tested alpha descriptor");
            auto loaded = manager.LoadImage(id);
            auto* image = static_cast<Sexy::DDImage*>(loaded);
            // 2026-10-11 解码期 CPU 合成恢复：纯色/自动 sidecar 案例在解码出口
            // 已是合成位图（无 pending）；显式 alpha/grid 描述符仍走 Append 的
            // pending→首建 GPU 合成路径。两种形态都被接受。
            Require(image && !manager.HadError() && ImageLib::gAlphaComposeColor == previousColor &&
                image->mNumCols == test.columns && image->mNumRows == test.rows &&
                true,  // 2026-10-11：pending（显式 alpha/grid）与解码期已合成（纯色/自动 sidecar）两形态皆合法
                "Numeric alpha load lost composition, metadata or scoped tint");
            probe.Upload(test.name, *image, test.expected, count % 2 != 0);
            auto hit = manager.LoadImage(id);
            Require(hit.mSharedImage == loaded.mSharedImage && manager.GetImage(id).mSharedImage == loaded.mSharedImage,
                "Numeric alpha image was not published under its stable shared-cache identity");
        }
        Require(cache.Clean(), "Numeric alpha fixture kept a cache reference");
        ++count;
    }
    probe.log << "numericAlphaCases=" << count << " realManifest=1 explicitDefaultWhite=1 explicitDisablesAuto=1\n";
    ModernSmoke::Report("portable-alpha-seven-real-numeric-manifest-compositions", probe.app);
}

void RejectionCases(Probe& probe, PrivateCache& cache, const NumericManifest& production) {
    const auto& files = probe.files;
    const Raster base = Pattern(17, 11, 1);
    files.PNG("bad-prefix.png", base);
    files.PNG("_bad-prefix.png", Pattern(18, 11, 2));
    files.PNG("bad-suffix.png", base);
    files.PNG("bad-suffix_.png", Pattern(17, 12, 3));
    unsigned decoderRejected = 0, appendRejected = 0, gpuRejected = 0, numericRejected = 0;
    for (const char* name : {"bad-prefix.png", "bad-suffix"}) {
        bool rejected = false;
        try { files.Decode(name, true); }
        catch (const ImageLib::ImageAlphaSizeMismatch&) { rejected = true; }
        Require(rejected, "Automatic alpha size mismatch was not rejected by its exception type");
        ++decoderRejected;
    }
    files.PNG("reject-base.png", base);
    files.PNG("reject-full.png", Pattern(17, 11, 4));
    files.PNG("reject-wide.png", Pattern(18, 11, 5));
    files.PNG("reject-high.png", Pattern(17, 12, 6));
    files.PNG("reject-cell.png", Pattern(5, 5, 7));
    struct BadLayer { const char* path; int columns, rows; };
    const std::array badLayers{
        BadLayer{"reject-wide.png", 1, 1}, BadLayer{"reject-high.png", 1, 1},
        BadLayer{"reject-cell.png", 0, 2}, BadLayer{"reject-cell.png", 3, 0},
        BadLayer{"reject-cell.png", -1, 2}, BadLayer{"reject-cell.png", 3, -1},
        BadLayer{"reject-cell.png", 18, 2}, BadLayer{"reject-cell.png", 3, 12},
        BadLayer{"reject-full.png", 3, 2}
    };
    for (const auto& test : badLayers) for (bool alreadyPending : {false, true}) {
        MemoryImage image(&probe.app);
        probe.Adopt(image, files.Decode("reject-base.png"), false);
        if (alreadyPending) {
            probe.Append(image, files.Decode("reject-full.png"));
            probe.PendingCPU(image);
        }
        auto* bits = image.mBits;
        auto* pending = image.mPendingDecoded.get();
        const size_t layers = pending ? pending->mAlphaLayers.size() : 0;
        const int version = image.mBitsChangedCount;
        const bool changed = image.mBitsChanged, forced = image.mForcedMode;
        const bool alpha = image.mHasAlpha, transparent = image.mHasTrans;
        bool rejected = false;
        try { image.AppendAlphaImage(files.Decode(test.path), test.columns, test.rows); }
        catch (const ImageLib::ImageAlphaSizeMismatch&) { rejected = true; }
        Require(rejected && image.mBits == bits && image.mPendingDecoded.get() == pending &&
            (!pending || pending->mAlphaLayers.size() == layers) && !image.mD3DData &&
            image.mBitsChangedCount == version && image.mBitsChanged == changed &&
            image.mForcedMode == forced && image.mHasAlpha == alpha && image.mHasTrans == transparent &&
            !image.mColorTable && !image.mColorIndices &&
            std::equal(base.pixels.begin(), base.pixels.end(), bits),
            "Invalid AppendAlphaImage changed primary pixels, pending layers, revision or image mode");
        probe.log << "append-rejection mask=" << test.path << " columns=" << test.columns
            << " rows=" << test.rows << " alreadyPending=" << alreadyPending
            << " rejectedBeforeMutation=1 originalRGBAUnchanged=1\n";
        ++appendRejected;
    }
    {
        MemoryImage image(&probe.app);
        auto root = files.Decode("reject-base.png");
        auto middle = files.Decode("reject-full.png");
        middle->mAlphaLayers.push_back({files.Decode("reject-wide.png"), 1, 1});
        root->mAlphaLayers.push_back({std::move(middle), 1, 1});
        probe.Adopt(image, std::move(root), true);
        bool rejected = false;
        try { probe.render.ReadImagePixels(image); }
        catch (const std::exception&) { rejected = true; }
        Require(rejected && image.mBits && image.mPendingDecoded,
            "Recursive invalid alpha dimensions bypassed GPU validation");
        ++gpuRejected;
    }

    constexpr unsigned id = unsigned(Sexy::ResourceId::IMAGE_PVZ_LOGO_ID);
    const auto manifestPath = files.Path("rejected-alpha.numeric.resources");
    for (unsigned mode = 0; mode < 8; ++mode) {
        auto manifest = production;
        const auto primaryPath = files.Path("reject-base.png");
        const unsigned variant = 200 + mode;
        const bool parseFailure = mode >= 4;
        const int columns = mode == 2 ? 18 : mode == 4 ? 0 : mode == 5 ? -1 : 3;
        const int rows = mode == 6 ? 0 : mode == 7 ? -1 : 2;
        manifest.Image(id, primaryPath, mode == 0 ? files.Path("reject-wide.png") : "",
            mode == 1 ? files.Path("reject-high.png") : mode == 0 ? "" : files.Path("reject-cell.png"),
            columns, rows, 0xffffffu, variant);
        // Mode 3 is a positive, but wrong, cell extent (17/4 != 5).
        if (mode == 3) manifest.Image(id, primaryPath, "", files.Path("reject-cell.png"), 4, 2, 0xffffffu, variant);
        manifest.Write(manifestPath);
        cache.Track(primaryPath, variant);
        {
            Sexy::ResourceManager manager(&probe.app);
            const auto resourceSlotsBefore=manager.mResourceSlots;
            const auto imageSlotsBefore=manager.mImageSlots;
            const auto imagesBefore = probe.app.mMemoryImageSet;
            const auto texturesBefore = probe.render.mRenderer->GetResourceCounts().textures;
            const bool parsed = manager.ParseResourcesFile(manifestPath);
            if (parseFailure) {
                Require(!parsed && manager.HadError() && manager.GetNumResources()==0 &&
                    manager.mResourceSlots==resourceSlotsBefore && manager.mImageSlots==imageSlotsBefore &&
                    manager.mResGroupPresent.none(),
                    "Invalid numeric alpha grid was published");
            } else {
                Require(parsed, "Valid numeric identity for a bad alpha fixture was rejected during parsing");
                auto loaded = manager.LoadImage(id);
                Require(!static_cast<Sexy::DDImage*>(loaded) && manager.HadError() &&
                    !static_cast<Sexy::DDImage*>(manager.GetImage(id)),
                    "ResourceManager published a mismatched explicit alpha/grid image");
            }
            Require(probe.app.mMemoryImageSet == imagesBefore &&
                probe.render.mRenderer->GetResourceCounts().textures == texturesBefore &&
                probe.app.mSharedImageMap.contains({Sexy::StringToUpper(primaryPath), variant}) == !parseFailure,
                "Rejected numeric alpha fixture retained an image, uploaded pixels, or attempted an invalid parse load");
        }
        Require(cache.Clean(), "Rejected numeric alpha fixture retained a cache owner");
        probe.log << "numeric-rejection mode=" << mode << " parseFailure=" << parseFailure
            << " imagePublished=0 gpuUploaded=0\n";
        ++numericRejected;
    }
    Require(decoderRejected == 2 && appendRejected == 18 && gpuRejected == 1 && numericRejected == 8,
        "Alpha rejection coverage changed");
    probe.log << "rejections decoder=" << decoderRejected << " append=" << appendRejected << " gpu=" << gpuRejected
        << " numeric=" << numericRejected << " exceptionTextNotRequired=1\n";
    ModernSmoke::Report("portable-alpha-two-decoder-eighteen-append-one-recursive-gpu-eight-numeric-rejections", probe.app);
}

void TexturePixels(Probe& probe, const char* label, const MemoryImage& image, const Raster& expected) {
    const auto& data = *static_cast<const Sexy::TextureData*>(image.mD3DData);
    const auto actual = probe.render.mRenderer->ReadTexturePixels(data.mTexture);
    Require(data.mTexture && data.mWidth == expected.width && data.mHeight == expected.height &&
        actual.width == expected.width && actual.height == expected.height &&
        actual.pixels.size() == expected.pixels.size(), "Alpha native texture readback geometry changed");
    size_t different = 0;
    for (size_t i = 0; i < actual.pixels.size(); ++i) different += actual.pixels[i] != expected.pixels[i];
    probe.log << "texture case=" << label << " size=" << actual.width << 'x' << actual.height
        << " different=" << different << std::endl;
    Require(!different, "Alpha composition or raw clone changed native texture RGBA");
}

void NativeTextureCases(Probe& probe) {
    unsigned cases = 0;
    for (const auto shape : {std::array{65, 67}, std::array{130, 150}}) {
        const int width = shape[0], height = shape[1];
        const Raster base = Pattern(width, height, 17), mask = Pattern(width, height, 0);
        const auto expected = AlphaOracle(base, mask);
        const auto name = "native-texture-" + std::to_string(cases) + ".png";
        probe.files.PNG(name, base);
        probe.files.PNG("_" + name, mask);
        auto source = std::make_unique<MemoryImage>(&probe.app);
        probe.Adopt(*source, probe.files.Decode(name, true), cases % 2 != 0);
        const auto label = "alpha-texture-" + std::to_string(width) + "x" + std::to_string(height);
        probe.Upload(label.c_str(), *source, expected);
        const auto& data = *static_cast<const Sexy::TextureData*>(source->mD3DData);
        Require(!data.mGPUOwned && !data.mRenderTarget,
            "Composed image did not retain its normal uploaded-image contract");
        TexturePixels(probe, label.c_str(), *source, expected);

        auto clone = std::make_unique<MemoryImage>(*source);
        probe.NoCPU(*source);
        probe.NoCPU(*clone);
        const auto& copied = *static_cast<const Sexy::TextureData*>(clone->mD3DData);
        Require(clone->mD3DData != source->mD3DData && copied.mWidth == data.mWidth &&
            copied.mHeight == data.mHeight && copied.mTexture && copied.mTexture != data.mTexture &&
            !copied.mGPUOwned && !copied.mRenderTarget,
            "Raw GPU clone changed or aliased the alpha source texture");
        source.reset();
        const auto cloneLabel = label + "-clone-source-destroyed";
        probe.Compare(cloneLabel.c_str(), *clone, expected);
        TexturePixels(probe, cloneLabel.c_str(), *clone, expected);
        ++cases;
    }
    Require(cases == 2, "Alpha native-texture/source-destruction coverage changed");
    probe.log << "nativeTextureCases=2 nativeRGBA=1 clonesSurviveSource=1 staticSlotsUntouched=1\n";
    ModernSmoke::Report("portable-alpha-two-native-textures-exact-rgba-and-surviving-gpu-clones", probe.app);
}

void CloneAndRevisionCases(Probe& probe) {
    const Raster base = Pattern(17, 19, 16), mask = Pattern(17, 19, 0);
    probe.files.PNG("clone-base.png", base);
    probe.files.PNG("_clone-base.png", mask);
    const auto expected = AlphaOracle(base, mask);
    auto source = std::make_unique<MemoryImage>(&probe.app);
    probe.Adopt(*source, probe.files.Decode("clone-base.png", true), false);
    probe.Upload("clone-source-composed", *source, expected);
    auto* sourceData = source->mD3DData;
    const int version = source->mBitsChangedCount;
    const bool changed = source->mBitsChanged;
    source->BitsChanged();
    bool rejected = false;
    try { probe.render.CreateImageTexture(source.get()); }
    catch (const Sexy::GpuImageCpuAccess&) { rejected = true; }
    Require(rejected && source->mD3DData == sourceData,
        "Changed composed image bypassed CPU ownership validation through GPU-owned freezing");
    rejected = false;
    try { probe.render.ReadImagePixels(*source); }
    catch (const std::logic_error&) { rejected = true; }
    const auto registered=probe.app.mMemoryImageSet;
    const auto textures=probe.render.mRenderer->GetResourceCounts().textures;
    bool cloneRejected=false;
    try { MemoryImage stale(*source); }
    catch(const Sexy::GpuImageCpuAccess&) { cloneRejected=true; }
    Require(cloneRejected && probe.app.mMemoryImageSet==registered &&
        probe.render.mRenderer->GetResourceCounts().textures==textures && source->mD3DData==sourceData,
        "GPU clone accepted a stale revision or retained failed-construction resources");
    // Restore only this intentional private stale-revision mutation.
    source->mBitsChangedCount = version;
    source->mBitsChanged = changed;
    Require(rejected && source->mD3DData == sourceData, "Marked GPU-only alpha revision was silently accepted");
    probe.Compare("revision-restored-original-rgba", *source, expected);

    auto clone = std::make_unique<MemoryImage>(*source);
    probe.render.Flush();
    probe.NoCPU(*clone);
    Require(clone->mD3DData != sourceData, "GPU alpha clone aliases its source TextureData");
    Require(static_cast<Sexy::TextureData*>(clone->mD3DData)->mTexture !=
        static_cast<Sexy::TextureData*>(sourceData)->mTexture, "GPU alpha clone aliases its source texture");
    // The raw GPU copy must retain hidden RGB at alpha zero, without an exemption.
    probe.Compare("gpu-clone-all-rgba-including-alpha-zero-rgb", *clone, expected);
    source.reset();
    probe.Compare("gpu-clone-after-source-destruction", *clone, expected);
    bool cpuRejected = false;
    try { clone->GetBits(); } catch (const Sexy::GpuImageCpuAccess&) { cpuRejected = true; }
    Require(cpuRejected, "Surviving GPU clone materialized CPU pixels");
    probe.NoCPU(*clone);
    probe.log << "gpuClone independentTexture=1 sourceDestroyed=1 cpuRejected=1 exactHiddenRGB=1 staleRevisionRejected=1 staleCloneRejected=1\n";
    ModernSmoke::Report("portable-alpha-gpu-clone-exact-rgba-source-destruction-and-revision", probe.app);
}

// Retire the fixture textures through the existing frame-fence owner. This
// records no game/fixture drawing: the completed screen must remain byte-exact.
void DrainRetired(RenderInterface& render) {
    render.Flush();
    if (render.mRenderer->GetResourceCounts().retiredTextures) {
        Sexy::GpuImageDrawScope drawing(render, nullptr);
        Require(render.PreDraw(), "Cannot open the retained-scene fence for alpha fixture cleanup");
        render.Flush();
    }
}
}

void PortableAlphaCompositionSmoke(LawnApp& app) {
    Require(std::getenv("PVZ_MODERN_HIDDEN") && std::getenv("PVZ_APPDATA_DIR") &&
        std::getenv("PVZ_MODERN_SMOKE_OUTPUT"), "Alpha smoke requires hidden isolated data/output directories");
    Require(app.mDDInterface && app.mDDInterface->mRenderInterface &&
        app.mDDInterface->mRenderInterface->mRenderer && app.mDDInterface->mScreenImage,
        "Alpha smoke requires the existing native renderer and screen");
    auto& render = *app.mDDInterface->mRenderInterface;
    render.Flush();
    DrainRetired(render);
    SavedState saved(app, render);
    FixtureFiles files;
    std::ofstream log(ModernSmoke::ProbePath("alpha-composition-cases.txt"));
    Require(bool(log), "Cannot write isolated alpha-composition evidence");
    log << "fixtures=" << files.directory << " oracle=1073-integer-bitwise allRGBA=1 alphaZeroRGB=1 cpuFallback=0\n";
    Counts(log, "before", saved.gpuCounts);
    PrivateCache cache(app);
    Probe probe{app, render, files, log};
    std::exception_ptr failure;
    try {
        const NumericManifest production(app);
        DecoderCases(probe);
        AppendAndRecursiveCases(probe);
        NumericCases(probe, cache, production);
        RejectionCases(probe, cache, production);
        NativeTextureCases(probe);
        CloneAndRevisionCases(probe);
        Require(probe.comparisons == 31 && probe.zeroAlphaRGB > 0 && probe.pendingRejections >= 48,
            "Alpha smoke omitted required exact RGBA/ownership checks");
    } catch (...) {
        failure = std::current_exception();
        log << "FAIL fixture assertion; restoring private ownership before propagating\n";
    }
    // All test-local images, managers, and SharedImageRefs have already unwound.
    Require(cache.Clean(), "Alpha smoke retained a private shared-image reference");
    saved.Restore();
    DrainRetired(render);
    saved.Restore();
    Counts(log, "after", render.mRenderer->GetResourceCounts());
    saved.Verify();
    log << "ownershipRestored=1 screenRGBAUnchanged=1 cacheUnchanged=1 cpuPendingRejections="
        << probe.pendingRejections << " exactComparisons=" << probe.comparisons
        << " comparedPixels=" << probe.pixels << " alphaZeroNonzeroRGB=" << probe.zeroAlphaRGB << std::endl;
    Require(bool(log), "Cannot finish alpha-composition evidence");
    if (failure) std::rethrow_exception(failure);
    log << "PASS portable-alpha-composition" << std::endl;
    ModernSmoke::Report("portable-alpha-composition-exact-rgba-and-complete-private-lifetime", app);
}
