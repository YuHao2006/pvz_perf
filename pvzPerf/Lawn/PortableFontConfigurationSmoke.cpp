#include "PortableFixesSmoke.h"
#include "ModernVulkanSmoke.h"
#include "Widget/GameButton.h"
#include "LawnApp.h"
#include "Resources.h"
#include "graphics/DDImage.h"
#include "graphics/DDInterface.h"
#include "graphics/Font.h"
#include "graphics/Graphics.h"
#include "graphics/ImageFont.h"
#include "graphics/RenderInterface.h"
#include "misc/KeyCodes.h"
#include "misc/StableTime.h"
#include "widget/ButtonWidget.h"
#include "widget/Dialog.h"
#include "widget/DialogButton.h"
#include "widget/EditWidget.h"
#include "widget/HyperlinkWidget.h"
#include "widget/WidgetManager.h"
#include <algorithm>
#include <memory>
#include <stdexcept>

namespace {
using namespace Sexy;

void Require(bool condition, const char* message)
{
    if (!condition) throw std::runtime_error(message);
}

void RequireGpuImage(MemoryImage& image)
{
    auto* texture = static_cast<TextureData*>(image.mD3DData);
    Require(texture && texture->mGPUOwned && texture->mRenderTarget &&
        !image.mBits && !image.mColorTable && !image.mColorIndices &&
        !image.mPendingDecoded && !image.mNativeAlphaData &&
        !image.mRLAlphaData && !image.mRLAdditiveData,
        "Debug text canvas retained software storage");
    bool rejected = false;
    try { image.GetBits(); }
    catch (const GpuImageCpuAccess&) { rejected = true; }
    Require(rejected && !image.mBits, "Debug text canvas allowed CPU pixel access");
}

void FontContracts(LawnApp& app)
{
    auto& render = *app.mDDInterface->mRenderInterface;
    auto* font = app.GetDebugFont();
    Require(font == FONT_TINYBOLD && dynamic_cast<ImageFont*>(font),
        "Lawn debug font is not the configured bitmap font");
    const auto imagesBefore = app.mMemoryImageSet.size();
    unsigned rejected = 0;
    {
        std::unique_ptr<DDImage> canvas(render.CreateRenderImage(320, 160));
        GpuImageDrawScope drawing(render, canvas.get());
        auto expectMissing = [&](auto&& invoke) {
            try { invoke(); }
            catch (const FontNotConfigured&) { ++rejected; return; }
            throw std::runtime_error("Unconfigured font silently accepted");
        };
        Graphics graphics(canvas.get());
        ButtonWidget button(0, nullptr);
        button.mLabel = "7A";
        button.Resize(0, 0, 96, 32);
        expectMissing([&] { button.Draw(&graphics); });
        Require(!button.mFont, "Button installed an implicit font");
        button.SetFont(font);
        button.Draw(&graphics);

        DialogButton dialogButton(IMAGE_BUTTON_LEFT, 0, nullptr);
        dialogButton.mLabel = "7A";
        dialogButton.Resize(0, 0, 96, 32);
        expectMissing([&] { dialogButton.Draw(&graphics); });
        Require(!dialogButton.mFont, "Dialog button installed an implicit font");
        dialogButton.SetFont(font);
        dialogButton.Draw(&graphics);

        EditWidget edit(0, nullptr);
        expectMissing([&] { edit.Draw(&graphics); });
        Require(!edit.mFont, "Edit widget installed an implicit font");
        edit.SetFont(font);
        edit.Resize(0, 0, 96, 32);
        edit.SetText("7A");
        edit.Draw(&graphics);

        HyperlinkWidget hyperlink(0, nullptr);
        hyperlink.mLabel = "7A";
        hyperlink.Resize(0, 0, 96, 32);
        expectMissing([&] { hyperlink.Draw(&graphics); });
        Require(!hyperlink.mFont, "Hyperlink installed an implicit font");
        hyperlink.SetFont(font);
        hyperlink.Draw(&graphics);

        GameButton gameButton(0);
        gameButton.mLabel = "7A";
        gameButton.mX = 0;
        gameButton.mY = 0;
        gameButton.mWidth = 96;
        gameButton.mHeight = 32;
        expectMissing([&] { gameButton.Draw(&graphics); });
        Require(!gameButton.mFont, "Game button installed an implicit font");
        gameButton.SetFont(font);
        gameButton.Draw(&graphics);

        Dialog dialog(nullptr, nullptr, 0, false, "7A", "7A", "", Dialog::BUTTONS_NONE);
        expectMissing([&] { dialog.GetPreferredHeight(160); });
        Require(!dialog.mHeaderFont && !dialog.mLinesFont,
            "Dialog installed implicit fonts before layout rejection");
        dialog.SetHeaderFont(font);
        expectMissing([&] { dialog.Draw(&graphics); });
        Require(!dialog.mLinesFont, "Dialog installed implicit lines font");
        dialog.SetLinesFont(font);
        dialog.Resize(0, 0, 160, dialog.GetPreferredHeight(160));
        dialog.Draw(&graphics);
        expectMissing([&] { app.SexyAppBase::GetDebugFont(); });

        // Empty/image-only buttons do not require a text font.
        ButtonWidget emptyButton(0, nullptr);
        emptyButton.Resize(0, 0, 96, 32);
        emptyButton.Draw(&graphics);
        DialogButton emptyDialogButton(nullptr, 0, nullptr);
        emptyDialogButton.Resize(0, 0, 96, 32);
        emptyDialogButton.Draw(&graphics);
        GameButton emptyGameButton(0);
        emptyGameButton.mX = 0;
        emptyGameButton.mY = 0;
        emptyGameButton.mWidth = 96;
        emptyGameButton.mHeight = 32;
        emptyGameButton.Draw(&graphics);
        Require(!emptyButton.mFont && !emptyDialogButton.mFont && !emptyGameButton.mFont,
            "Empty buttons created text fonts");
        RequireGpuImage(*canvas);
    }
    render.Flush();
    Require(rejected == 8 && app.mMemoryImageSet.size() == imagesBefore,
        "Font contract probes leaked image ownership");
    ModernSmoke::Report("font-config-eight-rejections-six-bitmap-controls-three-empty-buttons", app);
}

MemoryImage* FindCanvas(LawnApp& app, const MemoryImageSet& previous, int height)
{
    MemoryImage* found = nullptr;
    for (auto* image : app.mMemoryImageSet)
        if (!previous.contains(image) && image->mWidth == 192 && image->mHeight == height)
        {
            Require(!found, "Debug display created multiple canvases");
            found = image;
        }
    Require(found != nullptr, "Debug display did not create its GPU canvas");
    RequireGpuImage(*found);
    return found;
}

void RequireText(LawnApp& app, MemoryImage& actual, const SexyString& text)
{
    auto& render = *app.mDDInterface->mRenderInterface;
    auto* font = app.GetDebugFont();
    {
        std::unique_ptr<DDImage> expected(
            render.CreateRenderImage(actual.mWidth, actual.mHeight));
        {
            GpuImageDrawScope drawing(render, expected.get());
            Graphics graphics(expected.get());
            graphics.mColor = 0x000000;
            graphics.FillRect(0, 0, expected->mWidth, expected->mHeight);
            graphics.mColor = 0xFFFFFF;
            graphics.mFont = font;
            graphics.DrawString(text, 2, font->mAscent);
        }
        render.Flush();
        const auto actualPixels = render.ReadImagePixels(actual);
        const auto expectedPixels = render.ReadImagePixels(*expected);
        Require(actualPixels.pixels == expectedPixels.pixels,
            "Debug display text differs from the selected mode");
        Require(std::count_if(actualPixels.pixels.begin(), actualPixels.pixels.end(),
            [](auto pixel) { return pixel != 0xff000000u; }) > 5,
            "Debug display text is blank");
    }
    RequireGpuImage(actual);
}

void DebugDisplays(LawnApp& app)
{
    auto& widgets = *app.mWidgetManager;
    struct Restore {
        LawnApp& app;
        bool shift, show, playing;
        int mode, x, y, frameTime;
        std::uint32_t length;
        double multiplier;
        ~Restore()
        {
            app.mWidgetManager->mKeyDown[KEYCODE_SHIFT] = shift;
            app.mWidgetManager->mLastMouseX = x;
            app.mWidgetManager->mLastMouseY = y;
            app.mShowFPS = show;
            app.mShowFPSMode = mode;
            app.mPlayingDemoBuffer = playing;
            app.mDemoLength = length;
            app.mFrameTime = frameTime;
            app.mUpdateMultiplier = multiplier;
        }
    } restore{app, widgets.mKeyDown[KEYCODE_SHIFT], app.mShowFPS,
        app.mPlayingDemoBuffer, app.mShowFPSMode, widgets.mLastMouseX,
        widgets.mLastMouseY, app.mFrameTime, app.mDemoLength, app.mUpdateMultiplier};
    Require(!app.mShowFPS && app.mShowFPSMode == FPS_ShowFPS && !app.mPlayingDemoBuffer,
        "Debug display is enabled during ordinary startup");
    auto draw = [&] {
        widgets.MarkAllDirty();
        app.mNextDrawTick = SexyGetTickCount();
        Require(app.DrawDirtyStuff(), "Debug display did not draw the actual application");
    };
    const auto imagesBefore = app.mMemoryImageSet;
    widgets.mKeyDown[KEYCODE_SHIFT] = false;
    app.SexyAppBase::DebugKeyDown(VK_F3);
    Require(app.mShowFPS && app.mShowFPSMode == FPS_ShowFPS, "F3 did not enable FPS mode");
    draw();
    auto* fps = FindCanvas(app, imagesBefore, app.GetDebugFont()->mHeight + 4);
    RequireText(app, *fps, "FPS: 0");

    widgets.mKeyDown[KEYCODE_SHIFT] = true;
    app.SexyAppBase::DebugKeyDown(VK_F3);
    widgets.mLastMouseX = 700;
    widgets.mLastMouseY = 555;
    Require(app.mShowFPS && app.mShowFPSMode == FPS_ShowCoords,
        "Shift+F3 did not select mouse coordinates");
    draw();
    RequireText(app, *fps, "700,555");

    const auto beforeDemo = app.mMemoryImageSet;
    app.mPlayingDemoBuffer = true;
    app.mFrameTime = 10;
    app.mUpdateMultiplier = 1;
    app.mDemoLength = app.mUpdateCount + 372300u;
    draw();
    auto* demo = FindCanvas(app, beforeDemo, app.GetDebugFont()->mHeight + 4);
    RequireText(app, *demo, "01:02:03");
    app.mPlayingDemoBuffer = false;
    app.SexyAppBase::DebugKeyDown(VK_F3);
    Require(app.mShowFPSMode == FPS_ShowFPS, "Shift+F3 did not wrap back to FPS");
    draw();
    RequireText(app, *fps, "FPS: 0");

    widgets.mKeyDown[KEYCODE_SHIFT] = false;
    app.SexyAppBase::DebugKeyDown(VK_F3);
    Require(!app.mShowFPS, "F3 did not disable the debug display");
    draw();
    Require(app.mMemoryImageSet.size() == imagesBefore.size() + 2 &&
        app.mMemoryImageSet.contains(fps) && app.mMemoryImageSet.contains(demo),
        "Debug mode switches leaked or replaced their canvases");
    RequireGpuImage(*fps);
    RequireGpuImage(*demo);
    ModernSmoke::Report("debug-display-1073-fps-coords-demo-two-gpu-canvases-no-cpu", app);
}
}

void PortableFontConfigurationSmoke(LawnApp& app)
{
    Require(getenv("PVZ_MODERN_HIDDEN") && getenv("PVZ_APPDATA_DIR"),
        "Font configuration probes require an isolated hidden game");
    FontContracts(app);
    DebugDisplays(app);
}
