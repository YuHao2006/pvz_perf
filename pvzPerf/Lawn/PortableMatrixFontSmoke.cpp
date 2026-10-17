#include "graphics/Graphics.h"
#include "PortableFixesSmoke.h"
#include "ModernVulkanSmoke.h"
#include "LawnApp.h"
#include "Resources.h"
#include "Sexy.TodLib/TodCommon.h"
#include "graphics/ImageFont.h"
#include "graphics/DDImage.h"
#include "graphics/DDInterface.h"
#include "graphics/RenderInterface.h"
#include <array>
#include <cmath>
#include <fstream>
#include <memory>
#include <stdexcept>
#include <vector>

namespace {
using namespace Sexy;
void Require(bool ok, const char* message) { if (!ok) throw std::runtime_error(message); }
struct Fixture {
    // Font copies share FontData by design; private base-layer copies keep
    // added character metrics and modified spacing out of the game's fonts.
    std::vector<std::unique_ptr<FontLayer>> bases;
    std::unique_ptr<ImageFont> font;
    std::vector<ActiveFontLayer*> missing;
    SexyChar key = 0;
    SexyString text;
    Fixture(ImageFont& source, int variant, bool originalRectLookup) {
        source.Prepare(); font = std::make_unique<ImageFont>(source);
        Require(!font->mActiveLayerList.empty(), "Matrix font has no active layers");
        if (variant == 1 && font->mActiveLayerList.size() == 1)
            font->mActiveLayerList.emplace_back(font->mActiveLayerList.front());
        key = font->GetMappedChar(variant == 2 ? '\1' : 'A');
        text = variant == 2 ? SexyString("B\1B") : variant == 3 ? SexyString("Welcome 123") : SexyString("BAB");
        unsigned index = 0;
        for (auto& active : font->mActiveLayerList) {
            bases.push_back(std::make_unique<FontLayer>(*active.mBaseFontLayer));
            active.mBaseFontLayer = bases.back().get();
            active.mBaseFontLayer->mSpacing = 3;
            if (variant == 3 || (variant == 1 && index++ != 0)) continue;
            // ASCII 阵列语义：无 absent 态——"删除"= 复位默认零矩形，与 1073
            // "插入零 Rect 不跳过 metrics"行为等价（默认即零矩形）。
            active.mScaledCharImageRects[(unsigned char)key] = Rect();
            if (variant == 2) active.mBaseFontLayer->mCharData[(unsigned char)key] = CharData();
            missing.push_back(&active);
        }
    }
    bool HasOriginalEmptyRects() const {
        for (const auto* layer : missing) {
            if (layer->mScaledCharImageRects[(unsigned char)key] != Rect()) return false;
        }
        return true;
    }
    std::vector<size_t> Sizes() const {
        std::vector<size_t> sizes;
        for (const auto& layer : font->mActiveLayerList) sizes.push_back(std::count_if(std::begin(layer.mScaledCharImageRects),std::end(layer.mScaledCharImageRects),[](const Rect& r){return r != Rect();}));
        return sizes;
    }
};
struct HiddenImages {
    ImageFont& font; std::vector<Image*> images;
    explicit HiddenImages(ImageFont& f) : font(f) {
        for (auto& layer : font.mActiveLayerList) { images.push_back(layer.mScaledImage); layer.mScaledImage = nullptr; }
    }
    ~HiddenImages() { size_t i=0; for (auto& layer : font.mActiveLayerList) layer.mScaledImage = images[i++]; }
};
std::vector<std::uint32_t> Render(LawnApp& app, Fixture& fixture, int transform) {
    auto& render = *app.mDDInterface->mRenderInterface;
    auto* screen = app.mDDInterface->mScreenImage;
    screen->FillRect(Rect(0,0,800,600), Color(19,31,47), 0);
    Graphics g(screen); g.SetClipRect(80,80,600,440); g.mLinearBlend = true;
    SexyMatrix3 matrix;
    const float scale = transform == 0 ? 1.0f : transform == 1 ? 0.6f : 1.4f;
    const float angle = transform == 0 ? 0.0f : transform == 1 ? 0.25f : -0.18f;
    matrix.m00 = scale*std::cos(angle); matrix.m01 = -scale*std::sin(angle); matrix.m02 = 210;
    matrix.m10 = scale*std::sin(angle); matrix.m11 = scale*std::cos(angle); matrix.m12 = 270;
    matrix.m20 = matrix.m21 = 0; matrix.m22 = 1;
    const auto clip = g.mClipRect;
    TodDrawStringMatrix(&g, fixture.font.get(), matrix, fixture.text, Color(231,187,139,213));
    Require(g.mClipRect == clip && g.mDrawMode == Graphics::DRAWMODE_NORMAL && !g.mColorizeImages,
        "Matrix font draw leaked Graphics state");
    render.Flush(); return render.mRenderer->ReadScenePixels();
}
}

void PortableMatrixFontSmoke(LawnApp& app) {
    Require(getenv("PVZ_MODERN_HIDDEN") && getenv("PVZ_APPDATA_DIR"), "Matrix font probe must be hidden and isolated");
    std::ofstream log(ModernSmoke::ProbePath("matrix-font-cases.txt")); Require(bool(log), "Cannot write matrix font evidence");
    const std::array<_Font*,3> sources{FONT_BRIANNETOD16,FONT_DWARVENTODCRAFT15,FONT_DWARVENTODCRAFT24};
    unsigned cold = 0, coldWrong = 0;
    // First isolate the lookup contract with no drawable image. An old invalid
    // iterator cannot send arbitrary source rectangles into GPU rendering here.
    // A negative baseline stops before running the subsequent live-image cases.
    for (auto* source : sources) {
        auto* base = dynamic_cast<ImageFont*>(source); Require(base != nullptr, "Expected original image font");
        for (int variant = 0; variant < 3; ++variant) {
            Fixture fixture(*base,variant,false);
            { HiddenImages hidden(*fixture.font); Render(app,fixture,0); }
            const bool correct = fixture.HasOriginalEmptyRects();
            ++cold; coldWrong += !correct;
            log << "lookup case=" << cold << " variant=" << variant << " missing-layers=" << fixture.missing.size()
                << " active-layers=" << fixture.font->mActiveLayerList.size()
                << " empty-rects-inserted=" << correct << std::endl;
        }
    }
    log << "cold-cases=" << cold << " wrong=" << coldWrong << std::endl;
    Require(coldWrong == 0, "Matrix font missing rectangle differs from 1073; see matrix-font-cases.txt");

    unsigned gpu = 0, wrong = 0, nonblank = 0;
    for (size_t fontIndex=0;fontIndex<sources.size();++fontIndex) {
        auto& base = *static_cast<ImageFont*>(sources[fontIndex]);
        for (int variant=0;variant<4;++variant) for (int transform=0;transform<3;++transform) {
            Fixture actualFont(base,variant,false), referenceFont(base,variant,true);
            const auto expected = Render(app,referenceFont,transform);
            const auto actual = Render(app,actualFont,transform);
            Require(actual.size() == 480000 && expected.size() == actual.size(), "Invalid font GPU capture size");
            unsigned different=0, visible=0;
            for (size_t i=0;i<actual.size();++i) { different += actual[i]!=expected[i]; visible += expected[i]!=0xff131f2fu; }
            const auto warmSizes = actualFont.Sizes();
            const auto warm = Render(app,actualFont,transform);
            const bool correct = different==0 && warm==actual && actualFont.Sizes()==warmSizes && actualFont.HasOriginalEmptyRects();
            ++gpu; wrong += !correct; nonblank += visible>20;
            log << "gpu font=" << fontIndex << " variant=" << variant << " transform=" << transform
                << " different=" << different << " visible=" << visible << " warm-stable=" << (warm==actual)
                << " pass=" << correct << std::endl;
        }
    }
    log << "gpu-cases=" << gpu << " wrong=" << wrong << " nonblank=" << nonblank << std::endl;
    Require(gpu==36 && wrong==0 && nonblank==36, "Matrix font spacing/layers/transform parity failed");
    ModernSmoke::Report("portable-matrix-font-nine-lookups-36-gpu-cold-warm-cases",app);
}
