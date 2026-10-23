#include "SexyAppFramework/SexyAppBase.h"
#include "SexyAppFramework/graphics/DDInterface.h"
#include "SexyAppFramework/graphics/Graphics.h"
#include "SexyAppFramework/graphics/AtlasDraw.h"
#include "SexyAppFramework/graphics/ImageFont.h"
#include "SexyAppFramework/graphics/RenderInterface.h"
#include "SexyAppFramework/paklib/PakInterface.h"
#include "Sexy.TodLib/TodCommon.h"
#include "Sexy.TodLib/TodParticle.h"
#include "Sexy.TodLib/EffectSystem.h"
#include "Sexy.TodLib/Reanimator.h"
#include "Sexy.TodLib/Attachment.h"
#include "Sexy.TodLib/Definition.h"
#include "Sexy.TodLib/generated/GeneratedDefinitions.h"
#include "Sexy.TodLib/generated/NumericResourceBindings.h"
#include "Resources.h"
#include "LawnApp.h"
#include "Lawn/Board.h"
#include "Lawn/Projectile.h"
#include "Lawn/ProjectileResources.h"
#include "Lawn/Widget/GameButton.h"
#include "SexyAppFramework/widget/WidgetManager.h"
#include "Lawn/System/PlayerInfo.h"
#include "SexyAppFramework/imagelib/ImageLib.h"
#include "SexyAppFramework/sound/SoundManager.h"
#include "SexyAppFramework/sound/SoundDecode.h"
#include <array>
#include <algorithm>
#include <iostream>
#include <stdexcept>
#include <vector>

// The normal application entry point defines this callback. This executable
// links the same runtime objects with a separate, hidden test entry point.
bool FixtureCloseRequest() { return false; }
bool (*gAppCloseRequest)() = FixtureCloseRequest;

namespace
{
using namespace Sexy;

LONG CALLBACK SuppressFixtureCrashDialogs(EXCEPTION_POINTERS* exception)
{
    const DWORD code=exception->ExceptionRecord->ExceptionCode;
    if (code==EXCEPTION_ACCESS_VIOLATION || code==EXCEPTION_IN_PAGE_ERROR ||
        code==EXCEPTION_ILLEGAL_INSTRUCTION || code==EXCEPTION_STACK_OVERFLOW ||
        code==EXCEPTION_INT_DIVIDE_BY_ZERO)
    {
        std::fprintf(stderr,"FAIL image runtime fixture: hardware exception %08lX\n",code);
        std::fflush(stderr);
        TerminateProcess(GetCurrentProcess(),code);
    }
    return EXCEPTION_CONTINUE_SEARCH;
}

class TestApp final : public LawnApp
{
public:
    void ButtonPress(int) override {}
    void ButtonDepress(int) override {}
    void ButtonDownTick(int) override {}
    void ButtonMouseEnter(int) override {}
    void ButtonMouseLeave(int) override {}
    void ButtonMouseMove(int,int,int) override {}
};

void Require(bool value, const char* message)
{
    if (!value) throw std::runtime_error(message);
}

class HiddenWindow
{
public:
    HWND handle = nullptr;
    HiddenWindow()
    {
        WNDCLASSW type{};
        type.style=CS_OWNDC;
        type.lpfnWndProc=DefWindowProcW;
        type.hInstance=GetModuleHandleW(nullptr);
        type.lpszClassName=L"PvzImageRuntimeTests";
        Require(RegisterClassW(&type)!=0,"Cannot register hidden test window");
        handle=CreateWindowExW(0,type.lpszClassName,L"Image runtime tests",
            WS_POPUP,0,0,64,64,nullptr,nullptr,type.hInstance,nullptr);
        Require(handle!=nullptr,"Cannot create hidden test window");
    }
    ~HiddenWindow()
    {
        if (handle) DestroyWindow(handle);
        UnregisterClassW(L"PvzImageRuntimeTests",GetModuleHandleW(nullptr));
    }
};

void Pixel(const ImagePixels& image,int x,unsigned expected,int tolerance=1)
{
    const auto actual=image.pixels.at(x);
    for (int shift:{0,8,16,24})
        Require(std::abs(int((actual>>shift)&255)-int((expected>>shift)&255))<=tolerance,
            "Public image draw lost alpha or produced incorrect colors");
}

void SourceRectangleDraws(SexyAppBase& app)
{
    auto& render=*app.mDDInterface->mRenderInterface;
    Image source(&app);
    // A nonzero origin on both axes, four distinguishable pixels, and a
    // conspicuous surrounding border catch source-offset and UV mistakes.
    std::array<unsigned,30> pixels;
    pixels.fill(0xffff00ffu);
    constexpr std::array<unsigned,4> colors{
        0xffff0000u,0xff00ff00u,0xff0000ffu,0xffffffffu};
    pixels[8]=colors[0];pixels[9]=colors[1];
    pixels[14]=colors[2];pixels[15]=colors[3];
    source.SetBits(pixels.data(),6,5);
    const Rect region(2,1,2,2);
    constexpr int targetWidth=18,targetHeight=16;
    std::unique_ptr<Image> target(render.CreateRenderImage(targetWidth,targetHeight));

    enum Method { Direct, Float, Scaled, ScaledFloat, CenterScaledFloat,
        Mirror, ScaledMirror, ScaledFloatUnit, CenterScaledFloatUnit };
    for (const auto method:{Direct,Float,Scaled,ScaledFloat,CenterScaledFloat,
        Mirror,ScaledMirror,ScaledFloatUnit,CenterScaledFloatUnit})
    {
        const bool scaled=method==Scaled || method==ScaledFloat ||
            method==CenterScaledFloat || method==ScaledMirror;
        const bool mirrored=method==Mirror || method==ScaledMirror;
        const int scaleX=scaled ? 2 : 1,scaleY=scaled ? 3 : 1;
        // Scaling around the original 2x2 center moves the upper-left corner
        // left by one and up by two. Other helpers keep the requested origin.
        const int left=method==CenterScaledFloat ? 6 : 7;
        const int top=method==CenterScaledFloat ? 5 : 7;
        {
            GpuImageDrawScope destination(render,target.get());
            Graphics graphics(target.get());
            graphics.mColor=Color::Black;
            graphics.FillRect(Rect(0,0,targetWidth,targetHeight));
            graphics.Translate(1,2);
            graphics.mFastStretch=true;
            graphics.mLinearBlend=false;
            switch (method)
            {
            case Direct: graphics.DrawImage(&source,6,5,region); break;
            case Float: TodDrawImageRectF(&graphics,&source,6.f,5.f,region); break;
            case Scaled: TodDrawImageRectScaled(&graphics,&source,6,5,region,2,3); break;
            case ScaledFloat: TodDrawImageRectScaledF(&graphics,&source,6.f,5.f,region,2,3); break;
            case CenterScaledFloat: TodDrawImageRectCenterScaledF(&graphics,&source,6.f,5.f,region,2,3); break;
            case Mirror: graphics.DrawImageMirror(&source,6,5,region); break;
            case ScaledMirror: graphics.DrawImageMirror(&source,Rect(6,5,4,6),region); break;
            case ScaledFloatUnit: TodDrawImageRectScaledF(&graphics,&source,6.f,5.f,region,1,1); break;
            case CenterScaledFloatUnit: TodDrawImageRectCenterScaledF(&graphics,&source,6.f,5.f,region,1,1); break;
            }
        }
        render.Flush();
        const auto actual=render.ReadImagePixels(*target);
        // Check the full target, including untouched pixels around every edge.
        // The oracle is a CPU grid, independent of renderer drawing methods.
        for (int y=0;y<targetHeight;++y)
            for (int x=0;x<targetWidth;++x)
            {
                unsigned expected=0xff000000u;
                if (x>=left && x<left+2*scaleX && y>=top && y<top+2*scaleY)
                {
                    const int column=(x-left)/scaleX;
                    const int row=(y-top)/scaleY;
                    expected=colors[row*2+(mirrored ? 1-column : column)];
                }
                try { Pixel(actual,y*targetWidth+x,expected); }
                catch (...)
                {
                    std::cerr<<"Rectangle method "<<method<<" mismatched pixel "<<x<<","<<y<<"\n";
                    throw;
                }
            }
    }
    // Repack the entire 6x5 sheet at a second nonzero origin. Its internal
    // 2x2 view must preserve all existing source-relative draw semantics.
    Image packed(&app);
    std::array<unsigned,90> packedPixels;
    packedPixels.fill(0xff00ffffu);
    for (int y=0;y<5;++y)
        for (int x=0;x<6;++x)
            packedPixels[(y+2)*10+x+1]=pixels[y*6+x];
    packed.SetBits(packedPixels.data(),10,9);
    {
        GpuImageDrawScope destination(render,target.get());
        Graphics graphics(target.get());
        graphics.DrawImage(&packed,0,0);
    }
    render.Flush();
    Require(packed.mTexture!=nullptr,"Atlas test sheet was not uploaded");
    TextureSource packedTexture{packed.mTexture,10,9,0};
    const Rect packedSheet(1,2,6,5),packedView(3,3,2,2);
    std::unique_ptr<Image> expectedTarget(render.CreateRenderImage(targetWidth,targetHeight));
    for (int method=0;method<4;++method)
        for (int style=0;style<4;++style)
            for (bool fast:{false,true})
            {
                const auto draw=[&](Image* output,bool useAtlas) {
                    GpuImageDrawScope destination(render,output);
                    Graphics graphics(output);
                    graphics.mColor=Color(11,17,23);
                    graphics.FillRect(Rect(0,0,targetWidth,targetHeight));
                    graphics.ClipRect(5,7,6,6);
                    graphics.Translate(1,2);
                    graphics.mFastStretch=fast;
                    graphics.mLinearBlend=!fast;
                    graphics.mColorizeImages=(style&1)!=0;
                    graphics.mColor=Color(113,197,83,137);
                    graphics.mDrawMode=(style&2) ? Graphics::DRAWMODE_ADDITIVE :
                        Graphics::DRAWMODE_NORMAL;
                    // Nearest sampling has no unique neighbor exactly at a
                    // texel boundary when repacking changes the normalized UV
                    // denominator; this is not a pixel-copy difference. Even
                    // nearest raster extents avoid ties. Keep the original
                    // fractional extents for linear filtering.
                    if (method==1) graphics.SetScale(fast ? 1.75f : 1.5f,
                        fast ? 2.75f : 2.5f,3.f,2.f);
                    if (method<=1)
                    {
                        if (useAtlas) DrawAtlasImage(&graphics,packedTexture,packedView,6.f,5.f);
                        else graphics.DrawImage(&source,6,5,region);
                    }
                    else if (method==2)
                    {
                        const Rect outputRectangle(3,4,fast ? 8 : 7,8);
                        if (useAtlas)
                            DrawAtlasImage(&graphics,packedTexture,packedSheet,outputRectangle,region);
                        else graphics.DrawImage(&source,outputRectangle,region);
                    }
                    else
                    {
                        // A half-pixel origin with scale 2 puts nearest samples
                        // exactly on a texel boundary. Different normalized UV
                        // denominators may choose either neighbor; keep this
                        // strict comparison off that tie on every backend.
                        const float y = fast ? 3.25f : 3.5f;
                        if (useAtlas)
                            DrawAtlasImageScaled(&graphics,packedTexture,packedView,4.25f,y,1.5f,2.f);
                        else TodDrawImageRectScaledF(&graphics,&source,4.25f,y,region,1.5f,2.f);
                    }
                };
                draw(expectedTarget.get(),false);
                draw(target.get(),true);
                render.Flush();
                const auto expected=render.ReadImagePixels(*expectedTarget);
                const auto actual=render.ReadImagePixels(*target);
                bool touched=false;
                for (int pixel=0;pixel<targetWidth*targetHeight;++pixel)
                {
                    touched=touched || expected.pixels[pixel]!=0xff0b1117u;
                    try { Pixel(actual,pixel,expected.pixels[pixel]); }
                    catch (...)
                    {
                        std::cerr<<"Atlas helper method "<<method<<" style "<<style
                            <<" fast "<<fast<<" mismatched pixel "<<pixel<<"\n";
                        throw;
                    }
                }
                Require(touched,"Atlas helper comparison clipped away the complete draw");
            }
    std::cout<<"PASS nonzero source rectangles and repacked whole-sheet atlas views: translation, "
        "scale origins, clipping, tint, additive, local-source views and floating scales\n";
}

void AtlasButtonStates(SexyAppBase& app)
{
    auto& render=*app.mDDInterface->mRenderInterface;
    std::array<Image,5> original{Image(&app),Image(&app),Image(&app),Image(&app),Image(&app)};
    constexpr std::array<unsigned,5> colors{
        0xffb02010u,0xff20a030u,0xff3040d0u,0xffb09020u,0x80607080u};
    std::array<unsigned,132> packedPixels;
    packedPixels.fill(0xffff00ffu);
    std::array<Rect,5> rectangles;
    for (int state=0;state<5;++state)
    {
        unsigned pixels[]{colors[state],colors[state]^0x00101010u,
            colors[state]^0x00080808u,colors[state]};
        original[state].SetBits(pixels,2,2);
        rectangles[state]=Rect(2+state*4,2,2,2);
        for (int y=0;y<2;++y)
            for (int x=0;x<2;++x)
                packedPixels[(2+y)*22+2+state*4+x]=pixels[y*2+x];
    }
    Image packed(&app);
    packed.SetBits(packedPixels.data(),22,6);
    std::unique_ptr<Image> actualTarget(render.CreateRenderImage(12,10));
    std::unique_ptr<Image> expectedTarget(render.CreateRenderImage(12,10));
    {
        GpuImageDrawScope destination(render,actualTarget.get());
        Graphics graphics(actualTarget.get());
        graphics.DrawImage(&packed,0,0);
    }
    render.Flush();
    TextureSource texture{packed.mTexture,22,6,0};
    struct MouseRestore {
        WidgetManager& manager;
        int x,y;
        ~MouseRestore() { manager.mLastMouseX=x;manager.mLastMouseY=y; }
    } restore{*app.mWidgetManager,app.mWidgetManager->mLastMouseX,app.mWidgetManager->mLastMouseY};
    // Normal, hover, explicit press, disabled, fading highlight, glow,
    // pressed glow, pressed hover fallback, normal fallback, and hidden.
    for (int state=0;state<10;++state)
    {
        GameButton oldButton(100),atlasButton(101);
        for (GameButton* button:{&oldButton,&atlasButton})
        {
            button->mApp=static_cast<LawnApp*>(&app);
            button->mX=4;button->mY=3;button->mWidth=2;button->mHeight=2;
            button->mLabel.clear();
            button->mButtonOffsetX=1;
            button->mButtonOffsetY=1;
            button->mIsOver=state==2 || state==6 || state==7 || state==8;
            button->mIsDown=button->mIsOver;
            button->mDisabled=state==3;
            button->mOverAlpha=state==4 ? 0.4 : 0;
            button->mBtnNoDraw=state==9;
        }
        const bool hovered=state==1 || state==2 || state==5 ||
            state==6 || state==7 || state==8;
        app.mWidgetManager->mLastMouseX=hovered ? 5 : -100;
        app.mWidgetManager->mLastMouseY=hovered ? 4 : -100;
        oldButton.mButtonImage=&original[0];
        oldButton.mOverImage=&original[1];
        oldButton.mDownImage=&original[2];
        oldButton.mDisabledImage=&original[3];
        atlasButton.mNormalRect=rectangles[0];
        atlasButton.mOverRect=rectangles[1];
        atlasButton.mDownRect=rectangles[2];
        atlasButton.mDisabledRect=rectangles[3];
        if (state==7 || state==8)
        {
            oldButton.mDownImage=nullptr;
            atlasButton.mDownRect=Rect();
        }
        if (state==8)
        {
            oldButton.mOverImage=nullptr;
            atlasButton.mOverRect=Rect();
        }
        const bool glow=state==5 || state==6;
        oldButton.mOverOverlayImage=glow ? &original[4] : nullptr;
        const auto draw=[&](Image* target,bool useAtlas) {
            GpuImageDrawScope destination(render,target);
            Graphics graphics(target);
            graphics.mColor=Color(11,17,23);
            graphics.FillRect(Rect(0,0,12,10));
            graphics.Translate(1,2);
            graphics.mFastStretch=true;
            if (useAtlas)
                atlasButton.DrawAtlas(&graphics,texture,glow ? &rectangles[4] : nullptr);
            else oldButton.Draw(&graphics);
            Require(graphics.mTransX==1 && graphics.mTransY==2,
                "Button drawing failed to restore the caller's translation");
        };
        draw(expectedTarget.get(),false);
        draw(actualTarget.get(),true);
        render.Flush();
        const auto expected=render.ReadImagePixels(*expectedTarget);
        const auto actual=render.ReadImagePixels(*actualTarget);
        bool touched=false;
        for (int pixel=0;pixel<120;++pixel)
        {
            touched=touched || expected.pixels[pixel]!=0xff0b1117u;
            try { Pixel(actual,pixel,expected.pixels[pixel]); }
            catch (...)
            {
                std::cerr<<"GameButton atlas state "<<state<<" mismatched pixel "<<pixel<<"\n";
                throw;
            }
        }
        Require(touched==(state!=9),"Button state comparison had no visible coverage");
    }
    std::cout<<"PASS actual GameButton atlas states: normal, hover, press/fallbacks, disabled, "
        "overAlpha, additive glow, translation/offsets and hidden state match independent images\n";
}

void FontUploadAndCopies(SexyAppBase& app)
{
    auto& render=*app.mDDInterface->mRenderInterface;
    Image source(&app);
    unsigned pixels[]{0x00ffffffu,0x80ffffffu,0xffffffffu};
    source.SetBits(pixels,3,1,false);
    Require(source.mBitsChanged && !source.mTexture,"Source was not deferred");

    ImageFont font(&source);
    auto& layer=font.mFontData->mFontLayerList.front();
    layer.mPointSize=0;
    layer.mAscent=1;
    layer.mHeight=1;
    auto& glyph=layer.mCharData['A'];
    glyph.mImageRect=Rect(0,0,3,1);
    glyph.mWidth=3;

    Image* target=render.CreateRenderImage(3,1);
    try
    {
        const auto draw=[&] {
            GpuImageDrawScope destination(render,target);
            Graphics graphics(target);
            graphics.mColor=Color::Black;
            graphics.FillRect(Rect(0,0,3,1));
            font.DrawString(&graphics,0,1,"A",Color::White,graphics.mClipRect);
        };
        draw();
        render.Flush();
        Require(source.mTexture && !source.mPendingDecoded && !source.mBitsChanged,
            "Font upload did not consume and commit the loading payload");
        Require(source.mHasTrans && source.mHasAlpha,"Font alpha flags were not analyzed");
        const auto first=render.ReadImagePixels(*target);
        Pixel(first,0,0xff000000u);
        Pixel(first,1,0xff808080u);
        Pixel(first,2,0xffffffffu);
        auto* uploaded=source.mTexture;
        draw();
        render.Flush();
        Require(source.mTexture==uploaded,"Second font draw reuploaded the source");
        Require(render.ReadImagePixels(*target).pixels==first.pixels,"Repeated font draw changed pixels");

        SexyTransform2D translated;
        translated.Translate(1,0);
        render.PushTransform(translated);
        {
            GpuImageSamplingScope filter(render,std::uint32_t(GpuImageColorFilter::White));
            const bool previousWrap=render.sSamplerAddressWrap;
            render.sSamplerAddressWrap=true;
            Image copy(*target);
            Require(copy.mRenderTarget,"Render-target copy lost writable target capability");
            Require(render.ReadImagePixels(copy).pixels==first.pixels,
                "Render-target copy inherited caller transforms or filters");
            Require(render.sImageSamplingFlags==std::uint32_t(GpuImageColorFilter::White) &&
                render.sSamplerAddressWrap,"Copy did not restore sampling state");
            render.sSamplerAddressWrap=previousWrap;
        }
        Require(render.mTransformStack.size()==1,"Copy damaged the caller transform stack");
        render.PopTransform();

        Image deferred(&app);
        deferred.SetBits(pixels,3,1,false);
        Image copy(deferred);
        Require(copy.mHasTrans && copy.mHasAlpha && !deferred.mPendingDecoded,
            "Copy retained stale deferred alpha metadata");
        Require(copy.mTexture!=deferred.mTexture,"Image copy aliased an owning GPU texture");
        Require(render.ReadImagePixels(copy).pixels==render.ReadImagePixels(deferred).pixels,
            "Image copy changed source pixels");
    }
    catch (...) { delete target; throw; }
    delete target;
    std::cout<<"PASS public font upload: deferred alpha, upload-and-discard, texture reuse, independent copies\n";
}

void SharedReferences(SexyAppBase& app)
{
    auto* source=new Image(&app);
    const unsigned before=app.mSharedImageMap.size();
    {
        auto first=app.SetSharedImage("image-runtime-fixture",0,source,nullptr);
        Require(first.mImage==source,"New shared-image reference missed the published image");
        auto second=app.GetSharedImage("image-runtime-fixture");
        Require(second.mImage==source,"Cached reference missed the direct image snapshot");
        SharedImageRef third(second);
        Require(third.mImage==source && third.mSharedImage->mRefCount==3,
            "Shared reference copy changed image or lifetime accounting");
        first=source;
        Require(first.mSharedImage && first.mImage==source,
            "Same-image rebind dropped its owning cache reference");
    }
    Require(app.mSharedImageMap.size()==before+1 &&
        app.mSharedImageMap.find({"IMAGE-RUNTIME-FIXTURE",0})->second.mRefCount==0,
        "Shared reference release lost its cache node or count");
    std::cout<<"PASS direct shared-image snapshots and reference lifetime\n";
}

void ReanimationAppearancePixels(SexyAppBase& app)
{
    auto& render=*app.mDDInterface->mRenderInterface;
    ReanimatorLoadDefinitions(gLawnReanimationArray,static_cast<int>(ReanimationType::NUM_REANIMS));
    struct CatalogCleanup { ~CatalogCleanup() { ReanimatorFreeDefinitions(); } } catalogCleanup;
    Reanimation lookup;
    lookup.mReanimationType=ReanimationType::REANIM_GARLIC;
    const int face=lookup.FindTrackIndex(ReanimTrackId::anim_face);
    const int stem=lookup.FindTrackIndex(ReanimTrackId::Garlic_stem1);
    const int trackCount=std::max(face,stem)+1;
    std::vector<ReanimatorTrack> tracks(trackCount);
    std::vector<ReanimatorTransform> transforms(trackCount);
    for (int t=0;t<trackCount;++t)
    {
        auto& transform=transforms[t];
        transform.mTransX=transform.mTransY=0;
        transform.mSkewX=transform.mSkewY=0;
        transform.mScaleX=transform.mScaleY=1;
        transform.mFrame=-1;
        transform.mAlpha=1;
        tracks[t].mTransforms={&transform,1};
    }
    tracks[face].mTrackId=ReanimTrackId::anim_face;
    tracks[stem].mTrackId=ReanimTrackId::Garlic_stem1;
    transforms[face].mTransX=4.5f;
    transforms[face].mTransY=4.5f;
    transforms[face].mFrame=0;
    transforms[face].mImageSlot=1;
    transforms[stem].mTransX=10.5f;
    transforms[stem].mTransY=4.5f;
    transforms[stem].mFrame=0;
    transforms[stem].mImageSlot=2;

    Image base(&app),alternate(&app);
    std::array<unsigned,12*8> basePixels;
    std::array<unsigned,16*10> alternatePixels;
    basePixels.fill(0xffff00ffu);
    alternatePixels.fill(0xffff00ffu);
    for (int y=2;y<4;++y)
        for (int x=2;x<4;++x)
        {
            basePixels[y*12+x]=0xffff0000u;
            alternatePixels[y*16+x]=0xffff0000u;
        }
    for (int y=2;y<4;++y)
        for (int x=6;x<8;++x)
            basePixels[y*12+x]=0xff0000ffu;
    for (int y=5;y<7;++y)
        for (int x=7;x<11;++x)
            alternatePixels[y*16+x]=0xff00ff00u;
    base.SetBits(basePixels.data(),12,8);
    alternate.SetBits(alternatePixels.data(),16,10);
    render.CreateImageTexture(&base);
    render.CreateImageTexture(&alternate);
    GpuTexture* textures[]{base.mTexture,base.mTexture,alternate.mTexture,alternate.mTexture};
    int widths[]{12,12,16,16},heights[]{8,8,10,10};
    Rect rectangles[]{
        {},{2,2,2,2},{6,2,2,2},
        {},{},       {6,2,2,2},
        {},{2,2,2,2},{7,5,4,2},
        {},{},       {7,5,4,2}};
    std::array<std::uint32_t,16> transitions;
    std::vector<std::uint32_t> starts(trackCount),counts(trackCount),options(4*trackCount);
    starts[face]=0;counts[face]=2;
    starts[stem]=2;counts[stem]=2;
    for (unsigned v=0;v<4;++v)
    {
        transitions[v*4]=v&~1u;
        transitions[v*4+1]=v|1u;
        transitions[v*4+2]=v&~2u;
        transitions[v*4+3]=v|2u;
        options[v*trackCount+face]=v&1u;
        options[v*trackCount+stem]=v>>1;
    }
    ReanimatorDefinition definition;
    definition.mTracks={tracks.data(),trackCount};
    definition.mVariantCount=4;
    definition.mImageSlotCount=3;
    definition.mVariantActionCount=4;
    definition.mTextures=textures;
    definition.mTextureWidths=widths;
    definition.mTextureHeights=heights;
    definition.mImageRects=rectangles;
    definition.mVariantTransitions=transitions.data();
    definition.mVariantActionStarts=starts.data();
    definition.mVariantActionCounts=counts.data();
    definition.mVariantOptions=options.data();
    EffectSystem effects;
    effects.EffectSystemInitialize();
    Reanimation animation;
    animation.mReanimationType=ReanimationType::REANIM_GARLIC;
    animation.ReanimationInitialize(0,0,&definition);
    // Use the actual pools and AttachmentDraw path. The child keeps its default
    // appearance below the parent, and must honor the parent's visibility flag.
    auto* child=effects.mReanimationHolder->mReanimations.DataArrayAlloc();
    child->mReanimationHolder=effects.mReanimationHolder.get();
    child->mReanimationType=ReanimationType::REANIM_GARLIC;
    child->ReanimationInitialize(0,4,&definition);
    auto* attachment=AttachReanim(animation.mTrackInstances[face].mAttachmentID,child,0,0);
    attachment->mDontDrawIfParentHidden=true;
    animation.SetVariantOption(ReanimTrackId::anim_face,1);
    animation.SetVariantOption(ReanimTrackId::Garlic_stem1,1);
    Require(animation.mVariant==3 && animation.VariantOption(ReanimTrackId::anim_face)==1 &&
        animation.VariantOption(ReanimTrackId::Garlic_stem1)==1,
        "Independent appearance options overwrote one another");
    animation.SetVariantOption(ReanimTrackId::anim_face,0);
    Require(animation.mVariant==2 && animation.VariantOption(ReanimTrackId::Garlic_stem1)==1,
        "Resetting one appearance option reset another track");
    std::unique_ptr<Image> target(render.CreateRenderImage(20,12));
    for (unsigned v=0;v<4;++v)
    {
        animation.SelectVariant(v);
        SexyTransform2D center;
        animation.GetTrackMatrix(stem,center);
        Require(center.m02==11 && center.m12==5,
            "Replacement dimensions changed the original track center");
        animation.GetTrackMatrix(face,center);
        Require(center.m02==5 && center.m12==5,
            "Blank appearance changed attachment track geometry");
        {
            GpuImageDrawScope destination(render,target.get());
            Graphics graphics(target.get());
            graphics.mColor=Color::Black;
            graphics.FillRect(Rect(0,0,20,12));
            graphics.mLinearBlend=false;
            animation.DrawRenderGroup(&graphics,0);
        }
        render.Flush();
        const auto pixels=render.ReadImagePixels(*target);
        for (int y=0;y<12;++y)
            for (int x=0;x<20;++x)
            {
                unsigned expected=0xff000000u;
                if (!(v&1) && x>=4 && x<6 && y>=4 && y<6) expected=0xffff0000u;
                if (v&2)
                {
                    if (x>=9 && x<13 && y>=4 && y<6) expected=0xff00ff00u;
                }
                else if (x>=10 && x<12 && y>=4 && y<6) expected=0xff0000ffu;
                if (x>=4 && x<6 && y>=8 && y<10) expected=0xffff0000u;
                if (x>=10 && x<12 && y>=8 && y<10) expected=0xff0000ffu;
                Pixel(pixels,y*20+x,expected);
            }
    }
    // A genuinely hidden track must still hide this same attachment, so the
    // visible child above cannot pass merely because parentHidden was ignored.
    transforms[face].mAlpha=0;
    {
        GpuImageDrawScope destination(render,target.get());
        Graphics graphics(target.get());
        graphics.mColor=Color::Black;
        graphics.FillRect(Rect(0,0,20,12));
        animation.DrawRenderGroup(&graphics,0);
    }
    render.Flush();
    const auto hidden=render.ReadImagePixels(*target);
    Pixel(hidden,8*20+4,0xff000000u);
    Pixel(hidden,8*20+10,0xff000000u);
    transforms[face].mAlpha=1;
    bool rejected=false;
    try { animation.SelectVariant(4); } catch (const std::out_of_range&) { rejected=true; }
    Require(rejected && animation.mVariant==3,"Invalid appearance selection damaged the current row");
    std::cout<<"PASS reanimation appearances: independent options, image slots, atlas dimensions, "
        "original centers and actual AttachmentDraw visibility pixels\n";
}

void ReanimationAppearanceDefinitions(SexyAppBase& app)
{
    ReanimatorLoadDefinitions(gLawnReanimationArray,static_cast<int>(ReanimationType::NUM_REANIMS));
    struct CatalogCleanup {
        ~CatalogCleanup() { ReanimatorFreeDefinitions(); DefinitionFreeAtlasImages(); }
    } catalogCleanup;
    ReanimatorEnsureDefinitionLoaded(ReanimationType::REANIM_GARLIC,false);
    Reanimation first,second;
    first.ReanimationInitializeType(0,0,ReanimationType::REANIM_GARLIC);
    second.ReanimationInitializeType(0,0,ReanimationType::REANIM_GARLIC);
    Require(first.mDefinition==second.mDefinition && first.mDefinition->mVariantCount==3,
        "Garlic appearances duplicated shared animation definitions");
    const auto* sharedTracks=first.mDefinition->mTracks.tracks;
    for (int track=0;track<first.mDefinition->mTracks.count;++track)
        for (int frame=0;frame<sharedTracks[track].mTransforms.count;++frame)
            Require(sharedTracks[track].mTransforms.mTransforms[frame].mFrame!=-10000.0f,
                "Loaded Garlic retained an unresolved cel placeholder");
    const int face=second.FindTrackIndex(ReanimTrackId::anim_face);
    const int blink=second.FindTrackIndex(ReanimTrackId::Garlic_blink);
    const auto* blinkFrames=sharedTracks[blink].mTransforms.mTransforms;
    Require(blinkFrames[0].mFrame==-1 && blinkFrames[1].mFrame==0 &&
        blinkFrames[2].mFrame==0 && blinkFrames[4].mFrame==-1 && blinkFrames[5].mFrame==-1,
        "Cel inheritance changed Garlic's explicit or inherited hidden frames");
    auto& render=*app.mDDInterface->mRenderInterface;
    std::unique_ptr<Image> target(render.CreateRenderImage(128,128));
    {
        GpuImageDrawScope destination(render,target.get());
        Graphics graphics(target.get());
        for (int frame=0;frame<sharedTracks[face].mTransforms.count;++frame)
        {
            const ReanimatorFrameTime time{0.0f,frame,frame};
            Require(second.DrawTrack(&graphics,face,0,&time)==(frame>=4),
                "Garlic cel inheritance hid a visible face frame or exposed a hidden frame");
        }
    }
    render.Flush();
    first.SetVariantOption(ReanimTrackId::anim_face,2);
    Require(first.VariantOption(ReanimTrackId::anim_face)==2 && second.mVariant==0 &&
        first.mDefinition->mTracks.tracks==sharedTracks,
        "Appearance selection modified another instance or copied shared tracks");
    for (unsigned v=0;v<first.mDefinition->mVariantCount;++v)
    {
        first.SelectVariant(v);
        Require(first.mDefinition->mTextures[v] && first.mDefinition->mTextureWidths[v]>0 &&
            first.mDefinition->mTextureHeights[v]>0,"Appearance atlas binding was not uploaded");
        for (int track=0;track<first.mDefinition->mTracks.count;++track)
        {
            const auto count=first.mDefinition->mVariantActionCounts[track];
            if (!count) continue;
            const auto id=first.mDefinition->mTracks.tracks[track].mTrackId;
            const auto original=first.VariantOption(id);
            for (unsigned option=0;option<count;++option)
            {
                first.SelectVariant(v);
                first.SetVariantOption(id,option);
                Require(first.VariantOption(id)==option,
                    "Loaded appearance transition disagrees with its constant-time option table");
            }
            first.SelectVariant(v);
            Require(first.VariantOption(id)==original,"Appearance option lookup changed state");
        }
    }
    ReanimatorEnsureDefinitionLoaded(ReanimationType::REANIM_GARGANTUAR,false);
    Reanimation giant;
    giant.ReanimationInitializeType(0,0,ReanimationType::REANIM_GARGANTUAR);
    giant.SetVariantOption(ReanimTrackId::Zombie_gargantuar_telephonepole,2);
    giant.SetVariantOption(ReanimTrackId::anim_head1,1);
    giant.SetVariantOption(ReanimTrackId::Zombie_gargantua_body1,2);
    Require(giant.VariantOption(ReanimTrackId::Zombie_gargantuar_telephonepole)==2 &&
        giant.VariantOption(ReanimTrackId::anim_head1)==1 &&
        giant.VariantOption(ReanimTrackId::Zombie_gargantua_body1)==2,
        "Loaded independent damage/weapon/head combinations lost previous state");
    giant.SetVariantOption(ReanimTrackId::Zombie_gargantua_body1,0);
    Require(giant.VariantOption(ReanimTrackId::Zombie_gargantuar_telephonepole)==2 &&
        giant.VariantOption(ReanimTrackId::anim_head1)==1,
        "Resetting loaded body damage reset the selected weapon or red eyes");
    std::cout<<"PASS production RAV7/IDT6 body-first: cel inheritance and hidden-frame draws, "
        "shared definitions, all Garlic rows, uploaded bindings, "
        "derived option tables and Gargantuar independent damage/weapon/head transitions\n";
}

// Exercise the production decoder without creating a playback device or channels.
class DecodeOnlySoundManager final : public SoundManager
{
public:
    SoundDecoderLease decoder;
    struct Slot { bool live=false; double volume=-1; int pan=0; };
    std::array<Slot,MAX_SOURCE_SOUNDS> slots{};
    std::vector<ResourceManager::SoundRes> expected;
    unsigned nextExpected=0,loads=0,releases=0,volumeCalls=0,panCalls=0,invalidReleases=0;

    bool LoadSound(unsigned id,const std::string& path) override
    {
        Require(id<slots.size() && !slots[id].live && nextExpected<expected.size(),
            "Sound load reused a live handle or exceeded its group plan");
        const auto& metadata=expected[nextExpected++];
        Require(path==metadata.mPath,"Generated sound binding consumed the wrong plan record");
        DecodedSound pcm;
        if (!DecodeSound(path,pcm)) return false;
        Require(!pcm.samples.empty() && pcm.frequency && (pcm.channels==1 || pcm.channels==2),
            "Production sound decoder returned invalid PCM");
        slots[id]={true,metadata.mVolume,metadata.mPanning};
        ++loads;
        return true;
    }
    int LoadSound(const std::string& path) override
    {
        const int id=GetFreeSoundId();
        return id>=0 && LoadSound(unsigned(id),path) ? id : -1;
    }
    void ReleaseSound(unsigned id) override
    {
        if (id>=slots.size() || !slots[id].live) { ++invalidReleases; return; }
        slots[id]={}; ++releases;
    }
    void SetVolume(double) override {}
    bool SetBaseVolume(unsigned id,double volume) override
    {
        Require(id<slots.size() && slots[id].live && slots[id].volume==volume,
            "Sound base volume was applied to the wrong handle or value");
        ++volumeCalls; return true;
    }
    bool SetBasePan(unsigned id,int pan) override
    {
        Require(id<slots.size() && slots[id].live && slots[id].pan==pan,
            "Sound pan was applied to the wrong handle or value");
        ++panCalls; return true;
    }
    SoundInstance* GetSoundInstance(unsigned) override
    {
        throw std::runtime_error("Resource loading unexpectedly requested sound playback");
    }
    void ReleaseSounds() override
    {
        for (unsigned id=0;id<slots.size();++id) if (slots[id].live) ReleaseSound(id);
    }
    void ReleaseChannels() override {}
    void Flush() override {}
    void SetCooperativeWindow(NativeWindowHandle) override {}
    void StopAllSounds() override {}
    int GetFreeSoundId() override
    {
        for (unsigned id=0;id<slots.size();++id) if (!slots[id].live) return int(id);
        return -1;
    }
    int GetNumSounds() override
    {
        return int(std::count_if(slots.begin(),slots.end(),[](const auto& slot){return slot.live;}));
    }
};

void ProjectileAtlasPixels(LawnApp& app)
{
    auto& render=*app.mDDInterface->mRenderInterface;
    const auto& definition=GeneratedDefinitions::Projectiles;
    ProjectileLoadResources();
    struct FreeResources {
        ~FreeResources() { ProjectileFreeResources(); DefinitionFreeAtlasImages(); }
    } freeResources;
    ImageLib::Image* decoded=ImageLib::GetImage("compiled/atlases/projectiles.atlas.png",false);
    Require(decoded && decoded->mBits && decoded->mWidth==definition.mWidth &&
        decoded->mHeight==definition.mHeight,"Cannot decode projectile atlas oracle");
    struct FreeDecoded { ImageLib::Image* image; ~FreeDecoded() { delete image; } } freeDecoded{decoded};
    EffectSystem effects;
    effects.EffectSystemInitialize();
    app.mEffectSystem=&effects;
    PlayerInfo profile;
    profile.mLevel=1;
    auto* previousProfile=app.mPlayerInfo;
    app.mPlayerInfo=&profile;
    struct RestoreWorld {
        LawnApp& app;
        PlayerInfo* previousProfile;
        ~RestoreWorld() {
            app.mBoard=nullptr;
            app.mEffectSystem=nullptr;
            app.mPlayerInfo=previousProfile;
        }
    } restoreWorld{app,previousProfile};
    Board board(&app);
    Projectile projectile;
    projectile.mAttachmentID=AttachmentID::ATTACHMENTID_NULL;
    projectile.ProjectileInitialize(120,120,0,0,ProjectileType::PROJECTILE_PEA);
    Require(projectile.mWidth==40 && projectile.mHeight==40,
        "Pea initialization changed collision/save dimensions");
    projectile.ProjectileInitialize(120,120,0,0,ProjectileType::PROJECTILE_COBBIG);
    Require(projectile.mWidth==162 && projectile.mHeight==78,
        "Cob initialization lost the original unscaled collision dimensions");
    projectile.mX=100;projectile.mY=100;
    projectile.mPosX=100.375f;projectile.mPosY=100.625f;projectile.mPosZ=-3.25f;
    projectile.mShadowY=130;
    projectile.mOnHighGround=false;
    projectile.mRow=0;
    projectile.mFrame=0;
    constexpr int width=360,height=300;
    Image* target=render.CreateRenderImage(width,height);
    struct FreeTarget { Image* image; ~FreeTarget() { delete image; } } freeTarget{target};
    const auto sourceImage=[&](Image& image,const Rect& source) {
        if (!source.mWidth) return;
        std::vector<unsigned> pixels(source.mWidth*source.mHeight);
        for (int y=0;y<source.mHeight;++y)
            std::copy_n(decoded->mBits+(source.mY+y)*decoded->mWidth+source.mX,
                source.mWidth,pixels.data()+y*source.mWidth);
        image.SetBits(pixels.data(),source.mWidth,source.mHeight);
    };
    const auto compare=[&](auto&& actual,auto&& reference,const char* label,
        const SexyMatrix3* nearestTransform,const Rect* nearestSource,const Color& sampleColor) {
        const auto draw=[&](auto&& operation) {
            {
                GpuImageDrawScope destination(render,target);
                Graphics graphics(target);
                graphics.mColor=Color::Black;
                graphics.FillRect(Rect(0,0,width,height));
                graphics.TranslateF(110.25f,90.5f);
                graphics.mColorizeImages=true;
                graphics.mColor=Color(160,210,120,230);
                operation(graphics);
            }
            render.Flush();
            return render.ReadImagePixels(*target);
        };
        const auto expected=draw(reference);
        const auto result=draw(actual);
        unsigned boundaryDifferences=0;
        int maximumDifference=0;
        for (int i=0;i<width*height;++i)
            try { Pixel(result,i,expected.pixels[i],2); }
            catch (...) {
                bool boundaryMatch=false;
                if (nearestTransform && nearestSource)
                {
                    const auto& m=*nearestTransform;
                    const float determinant=m.m00*m.m11-m.m01*m.m10;
                    const float ix=m.m11/determinant, iy=-m.m01/determinant;
                    const float jx=-m.m10/determinant, jy=m.m00/determinant;
                    const float dx=i%width+0.5f-m.m02,dy=i/width+0.5f-m.m12;
                    const float sx=ix*dx+iy*dy+nearestSource->mWidth*0.5f;
                    const float sy=jx*dx+jy*dy+nearestSource->mHeight*0.5f;
                    // Rasterized vertices have subpixel precision. At most
                    // two 1/256-pixel steps, mapped back through this matrix,
                    // bound a nearest-sampling texel-boundary ambiguity.
                    const float ex=(std::abs(ix)+std::abs(iy))/128.0f+0.0001f;
                    const float ey=(std::abs(jx)+std::abs(jy))/128.0f+0.0001f;
                    const bool edgeX=std::abs(sx-std::round(sx))<=ex;
                    const bool edgeY=std::abs(sy-std::round(sy))<=ey;
                    if ((edgeX || edgeY) && sx>=-ex && sy>=-ey &&
                        sx<=nearestSource->mWidth+ex && sy<=nearestSource->mHeight+ey)
                    {
                        for (int cy=0;cy<(edgeY ? 2 : 1);++cy)
                            for (int cx=0;cx<(edgeX ? 2 : 1);++cx)
                            {
                                const int x=edgeX ? int(std::round(sx))-1+cx : int(std::floor(sx));
                                const int y=edgeY ? int(std::round(sy))-1+cy : int(std::floor(sy));
                                unsigned candidate=0xff000000u;
                                if (x>=0 && y>=0 && x<nearestSource->mWidth && y<nearestSource->mHeight)
                                {
                                    const unsigned pixel=decoded->mBits[
                                        (nearestSource->mY+y)*decoded->mWidth+nearestSource->mX+x];
                                    const float alpha=float(pixel>>24)*sampleColor.mAlpha/(255.0f*255.0f);
                                    const auto channel=[&](int shift,int tint) {
                                        return unsigned(std::lround(float((pixel>>shift)&255)*tint/255.0f*alpha));
                                    };
                                    candidate|=channel(16,sampleColor.mRed)<<16 |
                                        channel(8,sampleColor.mGreen)<<8 | channel(0,sampleColor.mBlue);
                                }
                                bool matches=true;
                                for (int shift:{0,8,16,24})
                                    matches&=std::abs(int((result.pixels[i]>>shift)&255)-
                                        int((candidate>>shift)&255))<=2;
                                boundaryMatch|=matches;
                            }
                    }
                }
                if (boundaryMatch)
                {
                    ++boundaryDifferences;
                    for (int shift:{0,8,16,24})
                        maximumDifference=std::max(maximumDifference,
                            std::abs(int((result.pixels[i]>>shift)&255)-
                                int((expected.pixels[i]>>shift)&255)));
                    continue;
                }
                std::cerr<<label<<" type="<<int(projectile.mProjectileType)
                    <<" rotation="<<projectile.mRotation
                    <<" motion="<<int(projectile.mMotionType)
                    <<" age="<<projectile.mProjectileAge
                    <<" pixel="<<i%width<<","<<i/width
                    <<" actual="<<std::hex<<result.pixels[i]
                    <<" expected="<<expected.pixels[i]<<std::dec<<'\n';
                throw;
            }
        if (boundaryDifferences)
            std::cout<<"Nearest texel boundaries type="<<int(projectile.mProjectileType)
                <<" rotation="<<projectile.mRotation<<" motion="<<int(projectile.mMotionType)
                <<" age="<<projectile.mProjectileAge<<" pixels="<<boundaryDifferences
                <<" maxChannelDelta="<<maximumDifference
                <<" (all match adjacent CPU texels; all other pixels exact within2)\n";
    };
    for (int type=0;type<14;++type)
    {
        projectile.mProjectileType=static_cast<ProjectileType>(type);
        const auto& visual=definition.mProjectiles[type];
        Image body(&app);
        sourceImage(body,visual.mSource);
        for (const int age:{0,30})
            for (const bool rotated:{false,true})
                for (const bool mirror:{false,true})
                {
                    projectile.mProjectileAge=age;
                    projectile.mRotation=rotated ? 0.37f : 0.0f;
                    projectile.mMotionType=mirror ? ProjectileMotion::MOTION_BEE_BACKWARDS :
                        ProjectileMotion::MOTION_STRAIGHT;
                    float scale=visual.mScale;
                    if (type==int(ProjectileType::PROJECTILE_PUFF))
                        scale=TodAnimateCurveFloat(0,30,age,0.3f,1.0f,Curves::Linear)*(visual.mScale/0.3f);
                    SexyTransform2D nearestTransform;
                    TodScaleRotateTransformMatrix(nearestTransform,
                        projectile.mPosX-projectile.mX+body.mWidth*0.5f+110.25f,
                        projectile.mPosZ+projectile.mPosY-projectile.mY+body.mHeight*0.5f+90.5f,
                        projectile.mRotation,scale,scale);
                    const bool nearest=rotated || !FloatApproxEqual(scale,1);
                    compare([&](Graphics& g) { projectile.Draw(&g); },[&](Graphics& g) {
                        if (!visual.mSource.mWidth) return;
                        const Rect source(0,0,body.mWidth,body.mHeight);
                        if (!rotated && FloatApproxEqual(scale,1))
                            g.DrawImageMirror(&body,Rect(0,0,body.mWidth,body.mHeight),source,mirror);
                        else {
                            SexyTransform2D transform;
                            TodScaleRotateTransformMatrix(transform,
                                projectile.mPosX-projectile.mX+body.mWidth*0.5f+g.mTransX,
                                projectile.mPosZ+projectile.mPosY-projectile.mY+body.mHeight*0.5f+g.mTransY,
                                projectile.mRotation,scale,scale);
                            TodBltMatrix(&g,&body,transform,g.mClipRect,Color::White,g.mDrawMode,source);
                        }
                    },"Projectile body atlas differs from standalone legacy draw",
                        nearest ? &nearestTransform : nullptr,&visual.mSource,Color::White);
                }
        static constexpr struct { float x,y,scale,stretch; bool skip; } shadows[]{
            {3,0,1,1,false},{-1,0,1.3f,1,false},{3,10,1.6f,1,false},
            {3,10,1.6f,1,false},{0,0,1,1,true},{3,10,1.6f,1,false},
            {0,0,1.4f,1,false},{7,0,1,1,false},{0,0,1,1,false},
            {0,0,1,1,false},{3,10,1.6f,1,false},{57,0,1,3,false},
            {3,10,1.6f,1,false},{3,0,1,1,false}};
        for (int night=0;night<2;++night)
            for (bool lobbed:{false,true})
            {
                board.mBackground=night ? BackgroundType::BACKGROUND_2_NIGHT :
                    BackgroundType::BACKGROUND_1_DAY;
                projectile.mMotionType=lobbed ? ProjectileMotion::MOTION_LOBBED :
                    ProjectileMotion::MOTION_STRAIGHT;
                Image shadow(&app);
                sourceImage(shadow,definition.mShadows[night]);
                const auto& params=shadows[type];
                const float scale=params.scale*(lobbed ? 200.0f/203.25f : 1.0f);
                SexyTransform2D nearestTransform;
                TodScaleRotateTransformMatrix(nearestTransform,
                    projectile.mPosX-projectile.mX+params.x+110.25f+shadow.mWidth*0.5f*scale*params.stretch,
                    projectile.mShadowY-projectile.mY+params.y+90.5f+shadow.mHeight*0.5f*scale,
                    0,scale*params.stretch,scale);
                compare([&](Graphics& g) { projectile.DrawShadow(&g); },[&](Graphics& g) {
                    if (params.skip) return;
                    TodDrawImageRectScaledF(&g,&shadow,
                        projectile.mPosX-projectile.mX+params.x,
                        projectile.mShadowY-projectile.mY+params.y,
                        Rect(0,0,shadow.mWidth,shadow.mHeight),scale*params.stretch,scale);
                },"Projectile shadow atlas differs from standalone legacy draw",
                    (scale*params.stretch!=1 || scale!=1) ? &nearestTransform : nullptr,
                    &definition.mShadows[night],Color(160,210,120,230));
            }
    }
    std::cout<<"PASS actual projectile body/shadow atlas pixels: all14 types, both shadow cels, "
        "source offsets, scale, rotation, mirrors, puff ages, lobbed shadows and collision dimensions\n";
}

void AllResourceGroups(SexyAppBase& app)
{
    DecodeOnlySoundManager sounds;
    ResourceManager manager(&app);
    struct RestoreAppManagers
    {
        SexyAppBase& app;
        ResourceManager& resources;
        ResourceManager* previousResources;
        SoundManager* previousSounds;
        ~RestoreAppManagers()
        {
            TodWarmDispose();
            resources.DeleteResources();
            app.mResourceManager=previousResources;
            app.mSoundManager=previousSounds;
            app.CleanSharedImages();
        }
    } restore{app,manager,app.mResourceManager,app.mSoundManager};
    app.mResourceManager=&manager;
    app.mSoundManager=&sounds;
    Require(manager.ParseResourcesFile("compiled/resources.compiled"),
        "Cannot parse production resource plans for full loading");
    Require(manager.GetNumResources()==RESOURCE_LOAD_PLAN_RECORD_COUNT &&
        manager.GetNumImages()==RESOURCE_LOAD_IMAGE_COUNT &&
        manager.GetNumSounds()==168 && manager.GetNumFonts()==20,
        "Production resource acceptance counts changed");
    unsigned expectedVolumeCalls=0,expectedPanCalls=0,loadedGroups=0;
    std::vector<SharedImageMap::key_type> imageRecipes;
    for (unsigned group=1;group<=RESOURCE_GROUP_COUNT;++group)
    {
        auto* plan=manager.mPendingPlans[group];
        Require(plan!=nullptr,"Production group has no loading plan");
        for (const auto& image:plan->mImages)
        {
            Require(!image.mFromProgram && !image.mUnavailable,
                "Production image coverage requires a loadable image recipe");
            imageRecipes.emplace_back(StringToUpper(image.mPath),image.mVariant);
        }
        sounds.expected=plan->mSounds;
        sounds.nextExpected=0;
        for (const auto& sound:sounds.expected)
        {
            expectedVolumeCalls+=sound.mVolume>=0;
            expectedPanCalls+=sound.mPanning!=0;
        }
        try
        {
            Require(manager.LoadResources(static_cast<ResourceGroupId>(group)),
                "A production resource group failed actual loading");
        }
        catch (...)
        {
            std::cerr<<"Full resource loading failed in group "<<group<<'\n';
            throw;
        }
        Require(!manager.mLoadPlan && !manager.mPendingPlans[group] &&
            sounds.nextExpected==sounds.expected.size(),
            "Completed group retained its plan or skipped sound records");
        ++loadedGroups;
        TodWarmDrainAll();
    }
    sounds.expected.clear();
    Require(loadedGroups==RESOURCE_GROUP_COUNT && sounds.loads==168 && sounds.GetNumSounds()==168 &&
        sounds.volumeCalls==expectedVolumeCalls && sounds.panCalls==expectedPanCalls,
        "Full sound load skipped a resource or its volume/pan setup");
    Require(std::all_of(manager.mPendingPlans.begin(),manager.mPendingPlans.end(),
        [](const auto* plan){return plan==nullptr;}),
        "Full loading retained temporary plan metadata");
    unsigned loadedImages=0;
    for (const auto& recipe:imageRecipes)
    {
        const auto cached=app.mSharedImageMap.find(recipe);
        Require(cached!=app.mSharedImageMap.end() && cached->second.mRefCount.load()>0,
            "Loaded image recipe lacks its counted cache ownership");
        auto* image=cached->second.mImage;
        Require(image && image->mTexture && !image->mPendingDecoded,
            "Loaded image recipe lacks its GPU texture or retains CPU pixels");
        ++loadedImages;
    }
    std::array<Image**,6> namedImages{
        &IMAGE_BLANK,&IMAGE_POPCAP_LOGO,&IMAGE_TITLESCREEN,&IMAGE_SHOVEL,
        &IMAGE_BRAIN,&IMAGE_COINBANK};
    for (auto** image:namedImages)
        Require(*image && (*image)->mTexture && !(*image)->mPendingDecoded,
            "Resource loading failed to publish a named GPU-only image");
    std::array<_Font**,20> fonts{
        &FONT_BRIANNETOD32,&FONT_BRIANNETOD32BLACK,&FONT_BRIANNETOD16,&FONT_BRIANNETOD12,
        &FONT_CONTINUUMBOLD14,&FONT_CONTINUUMBOLD14OUTLINE,&FONT_DWARVENTODCRAFT12,
        &FONT_DWARVENTODCRAFT15,&FONT_DWARVENTODCRAFT18,&FONT_DWARVENTODCRAFT18BRIGHTGREENINSET,
        &FONT_DWARVENTODCRAFT18GREENINSET,&FONT_DWARVENTODCRAFT18YELLOW,&FONT_DWARVENTODCRAFT24,
        &FONT_DWARVENTODCRAFT36BRIGHTGREENINSET,&FONT_DWARVENTODCRAFT36GREENINSET,
        &FONT_HOUSEOFTERROR16,&FONT_HOUSEOFTERROR20,&FONT_HOUSEOFTERROR28,&FONT_PICO129,&FONT_TINYBOLD};
    for (auto** font:fonts)
    {
        auto* bitmap=dynamic_cast<ImageFont*>(*font);
        Require(bitmap && bitmap->mFontData && bitmap->mFontData->mInitialized,
            "A named font global was not loaded");
        for (const auto& layer:bitmap->mFontData->mFontLayerList)
        {
            auto* glyphs=layer.mImage.mImage;
            Require(glyphs && glyphs->mTexture && !glyphs->mPendingDecoded,
                "Loaded font glyphs retained CPU pixels or lacked a GPU texture");
        }
    }
    Require(loadedImages==RESOURCE_LOAD_IMAGE_COUNT,"Full loading skipped an image recipe");
    ProjectileAtlasPixels(static_cast<LawnApp&>(app));
    TodWarmDispose();
    manager.DeleteResources();
    manager.DeleteResources();
    Require(sounds.releases==168 && !sounds.invalidReleases && !sounds.GetNumSounds(),
        "Sound shutdown leaked or released a handle twice");
    for (auto** font:fonts) Require(!*font,"Font shutdown left a named global dangling");
    for (auto** image:namedImages)
        Require(!*image,"Image shutdown left a named global dangling");
    app.CleanSharedImages();
    for (const auto& recipe:imageRecipes)
        Require(app.mSharedImageMap.find(recipe)==app.mSharedImageMap.end(),
            "Image shutdown retained a resource owner in the shared cache");
    std::cout<<"PASS all "<<loadedGroups<<" resource groups / "<<RESOURCE_LOAD_PLAN_RECORD_COUNT
        <<" resources: "<<RESOURCE_LOAD_IMAGE_COUNT<<" GPU-only images, "
        "20 named fonts, 168 real sound decodes, volume/pan setup, all plans discarded, "
        "complete release and repeated shutdown\n";
}

void ResourceLoadingOwnership(SexyAppBase& app)
{
    auto& manager=*app.mResourceManager;
    Require(manager.ParseResourcesFile("compiled/resources.compiled"),
        "Cannot parse production NRSC4 resource plans");
    auto title=manager.mPendingPlans[static_cast<unsigned>(ResourceGroupId::LoaderBar)]->mImages[0];
    Require(manager.LoadResources(ResourceGroupId::Init) && IMAGE_BLANK && IMAGE_POPCAP_LOGO,
        "Explicit image group did not bind named globals");
    Require(!manager.mLoadPlan &&
        !manager.mPendingPlans[static_cast<unsigned>(ResourceGroupId::Init)],
        "Completed group retained its loading metadata");
    Require(manager.LoadResources(ResourceGroupId::LoadingFonts) && FONT_HOUSEOFTERROR28,
        "Explicit font group did not bind named globals");
    ResourceManager::FontRes source;
    source.mFont=FONT_HOUSEOFTERROR28;
    ResourceManager::FontRes reference;
    reference.mReference=&source;
    _Font* clone=nullptr;
    Require(manager.LoadFont(reference,clone) && clone && clone!=source.mFont,
        "Temporary font reference failed to clone the named font");
    Require(dynamic_cast<ImageFont*>(clone)->mFontData==
        dynamic_cast<ImageFont*>(source.mFont)->mFontData,
        "Referenced font lost shared FontData ownership");
    manager.ReleaseFont(clone);
    manager.ReleaseFont(clone);
    manager.DeleteResources(ResourceGroupId::Init);
    auto& titlePlan=*manager.mPendingPlans[static_cast<unsigned>(ResourceGroupId::LoaderBar)];
    Require(ResourceLoadBindings::LoadStep(manager,titlePlan,ResourceGroupId::LoaderBar,title.mRecord)
        && IMAGE_TITLESCREEN,
        "Cannot load title image through its generated named owner");
    auto alias=title;
    SharedImageRef aliasOwner;
    Require(manager.LoadImage(alias,IMAGE_BLANK,aliasOwner) && IMAGE_BLANK==IMAGE_TITLESCREEN,
        "Identical image recipes failed to share the cache object");
    auto* shared=IMAGE_BLANK;
    TodWarmDrainAll();
    ReleaseTitleScreenResource(&manager);
    ReleaseTitleScreenResource(&manager);
    Require(!IMAGE_TITLESCREEN && IMAGE_BLANK==shared && aliasOwner.mImage==shared &&
        aliasOwner.mSharedImage && aliasOwner.mSharedImage->mRefCount.load()==1,
        "Title release cleared an independently owned image alias");
    manager.ReleaseImage(IMAGE_BLANK,aliasOwner);
    manager.ReleaseImage(IMAGE_BLANK,aliasOwner);
    Require(!IMAGE_BLANK && !aliasOwner.mImage && !aliasOwner.mSharedImage,
        "Independent alias release retained its named target or cache reference");
    TodWarmDispose();
    app.CleanSharedImages();
    std::cout<<"PASS NRSC4 explicit groups: plan disposal, named image/font ownership, "
        "temporary font clone, title release, independent shared aliases\n";
}

void ResourceLoadingShutdown(SexyAppBase& app)
{
    auto& manager=*app.mResourceManager;
    TodWarmDispose();
    manager.DeleteResources();
    manager.DeleteResources();
    Require(!FONT_HOUSEOFTERROR28 && !manager.mLoadPlan &&
        std::all_of(manager.mPendingPlans.begin(),manager.mPendingPlans.end(),
            [](const auto* plan){return plan==nullptr;}),
        "Shutdown retained named fonts or temporary resource plans");
    app.CleanSharedImages();
    std::cout<<"PASS resource shutdown: all pending plans freed and repeated release safe\n";
}

void ParticleDefinitionsAndFrames(SexyAppBase& app, const char* pakPath)
{
    Require(gPakInterface && gPakInterface->AddPakFile(pakPath),
        "Cannot mount the production particle package");
    AllResourceGroups(app);
    ResourceLoadingOwnership(app);
    ReanimationAppearanceDefinitions(app);
    constexpr ParticleEffect fireEffect=ParticleEffect::PARTICLE_ZOMBIE_BOSS_FIREBALL;
    constexpr ParticleEffect glassesEffect=ParticleEffect::PARTICLE_ZOMBIE_SUNGLASS;
    constexpr ParticleEffect trailEffect=ParticleEffect::PARTICLE_BOSS_ICE_BALL;
    constexpr ParticleEffect selectedEffects[]{fireEffect,glassesEffect,trailEffect};
    // Keep cleanup inside the application's lifetime, including rollback after a failed check.
    try
    {
        bool invalidCatalogRejected = false;
        try {
            ParticleParams missing[]{ {static_cast<ParticleEffect>(0),
                "particles\\ImageRuntimeMissingRoot.xml"} };
            TodParticleLoadDefinitions(missing, 1);
        } catch (const std::exception&) {
            invalidCatalogRejected = true;
        }
        Require(invalidCatalogRejected && !gParticleDefArray && !gParticleDefCount &&
            !gParticleAllDefinitionDataLoaded.load(),
            "Invalid particle catalog published definition state");
        TodParticleLoadDefinitions(gLawnParticleArray,ParticleEffect::NUM_PARTICLES);
        Require(gParticleAllDefinitionDataLoaded.load() &&
            gParticleDefCount==ParticleEffect::NUM_PARTICLES &&
            gParticleDefArray==GeneratedDefinitions::Particles,
            "Public particle loader did not publish the static catalog");
        for (int d=0;d<gParticleDefCount;++d)
        {
            const auto& definition=gParticleDefArray[d];
            Require(definition.mVariantCount>0 &&
                definition.mEmitterDefCount>=0 &&
                (definition.mEmitterDefCount==0 || definition.mEmitterDefs),
                "Static particle catalog has incomplete behavior data");
            for (unsigned v=0;v<definition.mVariantCount;++v)
                Require((definition.mTextureWidths[v]==0 && definition.mTextureHeights[v]==0) ||
                    (definition.mTextures[v] && definition.mTextureWidths[v]>0 &&
                     definition.mTextureHeights[v]>0),
                    "Static particle catalog has an unbound atlas");
        }
        constexpr int expectedCounts[]{2,1,2};
        for (int d=0;d<3;++d)
        {
            auto& definition=gParticleDefArray[selectedEffects[d]];
            Require(definition.mVariantCount>0 && definition.mEmitterDefCount==expectedCounts[d],
                "Loaded particle emitter count changed");
            unsigned next=0;
            for (int e=0;e<definition.mEmitterDefCount;++e)
            {
                const auto& emitter=definition.mEmitterDefs[e];
                Require(emitter.mImageRectOffset==next,
                    "Particle rectangle offsets are not consecutive");
                next+=emitter.mImageRectCount;
            }
            Require(next==definition.mImageRectCount,"Particle rectangle row length changed");
            for (unsigned v=0;v<definition.mVariantCount;++v)
            {
                Require(definition.mTextures[v] && definition.mTextureWidths[v]>0 &&
                    definition.mTextureHeights[v]>0,"Loaded appearance has no resident atlas");
                for (unsigned f=0;f<definition.mImageRectCount;++f)
                {
                    const auto& r=definition.mImageRects[v*definition.mImageRectCount+f];
                    Require(r.mX>=2 && r.mY>=2 && r.mWidth>0 && r.mHeight>0 &&
                        r.mX+r.mWidth+2<=definition.mTextureWidths[v] &&
                        r.mY+r.mHeight+2<=definition.mTextureHeights[v],
                        "Loaded particle frame is outside its resident atlas");
                }
            }
        }
        auto& fire=gParticleDefArray[fireEffect];
        const auto* staticEmitters=fire.mEmitterDefs;
        const auto* staticRectangles=fire.mImageRects;
        const auto* staticDurationNodes=fire.mEmitterDefs[0].mParticleDuration.mNodes;
        Require(fire.mVariantCount==2,"Fire/ice appearances were published as separate effects");
        for (unsigned v=0;v<2;++v)
        {
            for (int e=0;e<2;++e)
            {
                const auto& emitter=fire.mEmitterDefs[e];
                Require(emitter.mImageFrames==2 && emitter.mImageRectCount==(e==0 ? 4 : 2),
                    "Fire/ice logical frames or available override frames changed");
                for (int f=0;f<emitter.mImageRectCount;++f)
                {
                    const auto& rect=fire.mImageRects[v*fire.mImageRectCount+emitter.mImageRectOffset+f];
                    Require(rect.mWidth==(v==0 ? 112 : 87) && rect.mHeight==(v==0 ? 74 : 46),
                        "Fire/ice variant lost its own source frame dimensions");
                }
            }
        }
        auto& glasses=gParticleDefArray[glassesEffect].mEmitterDefs[0];
        Require(glasses.mImageFrames==4 && glasses.mImageRectCount==4,
            "Sunglasses frames changed");
        const auto& noImage=gParticleDefArray[trailEffect].mEmitterDefs[1];
        Require(noImage.mImageRectCount==0 && noImage.mImageFrames==1,
            "No-image emitter lost its logical frame count");

        {
            TodParticleDefinition emptyDefinition;
            emptyDefinition.mVariantCount=1;
            TodParticleData data;
            data.Initialize();
            TodParticleHolder holder(&data);
            struct PoolCleanup {
                TodParticleData& data;
                ~PoolCleanup() { data.Dispose(); }
            } poolCleanup{data};
            const auto systemCount=holder.mParticleSystems.mSize;
            bool invalidVariantRejected=false;
            try { holder.AllocParticleSystem(0,0,0,fireEffect,2); }
            catch (const std::out_of_range&) { invalidVariantRejected=true; }
            Require(invalidVariantRejected && holder.mParticleSystems.mSize==systemCount,
                "Invalid particle variant consumed a system pool slot");
            auto* empty=holder.AllocParticleSystemFromDef(0,0,0,&emptyDefinition,
                fireEffect);
            Require(empty && empty->mVariant==0 && empty->EmitterRosterCount()==0,
                "Zero-emitter definition failed to initialize");
            auto* fireSystem=holder.AllocParticleSystem(0,0,0,fireEffect,0);
            auto* iceSystem=holder.AllocParticleSystem(0,0,0,fireEffect,1);
            Require(fireSystem && iceSystem && fireSystem->mVariant==0 && iceSystem->mVariant==1 &&
                fireSystem->mParticleDef==iceSystem->mParticleDef &&
                fireSystem->EmitterRosterCount()>0 && iceSystem->EmitterRosterCount()>0,
                "Fire/ice allocation lost the shared root or selected variant");
            Require(fireSystem->EmitterRosterEmitterAt(0)->mEmitterDef==
                iceSystem->EmitterRosterEmitterAt(0)->mEmitterDef,
                "Particle appearance selection copied emitter behavior");
            auto* system=holder.AllocParticleSystem(0,0,0,glassesEffect);
            Require(system && system->EmitterRosterCount()==1,
                "Cannot initialize the real sunglasses particle emitter");
            auto* emitter=system->EmitterRosterEmitterAt(0);
            auto& render=*app.mDDInterface->mRenderInterface;
            std::unique_ptr<Image> target(render.CreateRenderImage(256,256));
            const auto drawAppearance=[&](TodParticleSystem* selected,bool reference) {
                {
                    GpuImageDrawScope destination(render,target.get());
                    Graphics graphics(target.get());
                    graphics.mColor=Color::Black;
                    graphics.FillRect(Rect(0,0,256,256));
                    TodTriangleGroup triangles;
                    auto* selectedEmitter=selected->EmitterRosterEmitterAt(0);
                    if (reference)
                    {
                        const auto& definition=*selected->mParticleDef;
                        const auto v=selected->mVariant;
                        TextureSource texture{definition.mTextures[v],definition.mTextureWidths[v],
                            definition.mTextureHeights[v],0};
                        SexyMatrix3 transform;
                        TodScaleRotateTransformMatrix(transform,128,128,0,1,1);
                        const int mode=TestBit(selectedEmitter->mEmitterDef->mParticleFlags,
                            ParticleFlags::PARTICLE_ADDITIVE) ? Graphics::DRAWMODE_ADDITIVE :
                            Graphics::DRAWMODE_NORMAL;
                        triangles.AddTriangle(&graphics,texture,transform,graphics.mClipRect,
                            Color::White,mode,definition.mImageRects[v*definition.mImageRectCount+
                            selectedEmitter->mEmitterDef->mImageRectOffset]);
                    }
                    else
                    {
                        TodParticle particle{};
                        particle.mParticleEmitter=selectedEmitter;
                        selectedEmitter->mFrameOverride=0;
                        ParticleRenderParams values{};
                        values.mParticleScale=values.mParticleStretch=1;
                        values.mPosX=values.mPosY=128;
                        RenderParticle(&graphics,&particle,Color::White,&values,&triangles);
                    }
                    triangles.DrawGroup(&graphics);
                }
                render.Flush();
                return render.ReadImagePixels(*target).pixels;
            };
            const auto firePixels=drawAppearance(fireSystem,true);
            const auto icePixels=drawAppearance(iceSystem,true);
            Require(firePixels!=icePixels && drawAppearance(fireSystem,false)==firePixels &&
                drawAppearance(iceSystem,false)==icePixels,
                "Shared fire/ice behavior sampled the wrong variant texture or rectangle row");
            {
                GpuImageDrawScope destination(render,target.get());
                Graphics graphics(target.get());
                graphics.mColor=Color::Black;
                graphics.FillRect(Rect(0,0,256,256));
                TodParticleEmitter noImageEmitter{};
                noImageEmitter.mEmitterDef=const_cast<TodEmitterDefinition*>(&noImage);
                TodParticle noImageParticle{};
                noImageParticle.mParticleEmitter=&noImageEmitter;
                ParticleRenderParams values{};
                TodTriangleGroup triangles;
                RenderParticle(&graphics,&noImageParticle,Color::White,&values,&triangles);
                empty->Draw(&graphics);
                triangles.DrawGroup(&graphics);
            }
            render.Flush();
            const auto noImagePixels=render.ReadImagePixels(*target).pixels;
            Require(std::all_of(noImagePixels.begin(),noImagePixels.end(),
                [](auto pixel){ return pixel==0xff000000u; }),
                "No-image or zero-emitter particle wrote pixels");
            TodParticle particle{};
            particle.mParticleEmitter=emitter;
            particle.mImageFrame=0;
            const auto draw=[&](bool reference, int frame) {
                {
                    GpuImageDrawScope destination(render,target.get());
                    Graphics graphics(target.get());
                    graphics.mColor=Color::Black;
                    graphics.FillRect(Rect(0,0,256,256));
                    TodTriangleGroup triangles;
                    if (reference)
                    {
                        const auto& definition=*system->mParticleDef;
                        TextureSource texture{definition.mTextures[0],definition.mTextureWidths[0],
                            definition.mTextureHeights[0],0};
                        SexyMatrix3 transform;
                        TodScaleRotateTransformMatrix(transform,128,128,0,1,1);
                        triangles.AddTriangle(&graphics,texture,transform,graphics.mClipRect,
                            Color::White,Graphics::DRAWMODE_NORMAL,
                            definition.mImageRects[glasses.mImageRectOffset+frame]);
                    }
                    else
                    {
                        ParticleRenderParams values{};
                        values.mParticleScale=values.mParticleStretch=1;
                        values.mPosX=values.mPosY=128;
                        RenderParticle(&graphics,&particle,Color::White,&values,&triangles);
                    }
                    triangles.DrawGroup(&graphics);
                }
                render.Flush();
                return render.ReadImagePixels(*target).pixels;
            };
            const auto first=draw(true,0), last=draw(true,3);
            Require(first!=last,"Sunglasses source frames do not distinguish frame selection");
            Require(std::any_of(last.begin(),last.end(),[](auto p){return (p&0xFFFFFFu)!=0;}),
                "Particle reference draw produced no visible pixels");
            system->OverrideFrame(ParticleEmitterRanges::All,3);
            Require(emitter->mFrameOverride==3 && draw(false,0)==last,
                "Public sunglasses override selected the wrong atlas rectangle");
            system->OverrideFrame(ParticleEmitterRanges::All,999);
            Require(draw(false,0)==last,"Particle frame upper clamp changed");
            system->OverrideFrame(ParticleEmitterRanges::All,-2);
            Require(draw(false,0)==first,"Particle frame lower clamp changed");
            system->OverrideFrame(ParticleEmitterRanges::All,-1);
            particle.mImageFrame=3;
            Require(draw(false,0)==last,"Particle fixed random frame was not retained");
            const int animated=glasses.mAnimated;
            glasses.mAnimated=1;
            particle.mParticleTimeValue=0.99f;
            Require(draw(false,0)==last,"Particle lifetime animation selected the wrong frame");
            particle.mParticleTimeValue=0;
            Require(draw(false,0)==first,"Particle lifetime animation did not return to frame zero");
            glasses.mAnimated=animated;
        }
        TodParticleFreeDefinitions();
        Require(!gParticleDefArray && !gParticleDefCount && !gParticleAllDefinitionDataLoaded.load(),
            "Public particle free left published definition state");
        DefinitionFreeAtlasImages();
        TodParticleLoadDefinitions(gLawnParticleArray,ParticleEffect::NUM_PARTICLES);
        Require(gParticleDefArray[fireEffect].mVariantCount==2 &&
            gParticleDefArray[fireEffect].mTextures[1],
            "Repeated particle load lost a root appearance atlas");
        Require(gParticleDefArray[fireEffect].mEmitterDefs==staticEmitters &&
            gParticleDefArray[fireEffect].mImageRects==staticRectangles &&
            gParticleDefArray[fireEffect].mEmitterDefs[0].mParticleDuration.mNodes==staticDurationNodes,
            "Repeated particle load replaced program-resident definition storage");
        TodParticleFreeDefinitions();
        DefinitionFreeAtlasImages();
    }
    catch (...)
    {
        TodParticleFreeDefinitions();
        DefinitionFreeAtlasImages();
        throw;
    }
    ResourceLoadingShutdown(app);
    std::cout<<"PASS static production particles: catalog validation, flat appearance rows, shared behavior, "
        "fire/ice dimensions and pixels, no-image, logical frames, sunglasses override, frame clamps, "
        "animation pixels, repeated load and release\n";
}
}

int main(int argc, char** argv)
{
    std::cout<<std::unitbuf;
    SetErrorMode(SEM_FAILCRITICALERRORS | SEM_NOGPFAULTERRORBOX | SEM_NOOPENFILEERRORBOX);
    AddVectoredExceptionHandler(1,SuppressFixtureCrashDialogs);
    try
    {
        HiddenWindow window;
        TestApp app;
        gLawnApp=&app;
        app.mPrimaryThreadId=CurrentNativeThreadIdentity();
        app.mScaleHDREnabled=false;
        app.mReadFromRegistry=false;
        app.mWidth=800;app.mHeight=600;
#if defined(PVZ_GPU_OPENGL) || defined(PVZ_GPU_D3D9)
        app.mGpuContext=std::make_unique<GpuContext>(window.handle,false,false);
#else
        VulkanInitConfig init{};
        init.appInfo.pApplicationName="Image runtime tests";
        init.features.shaderFloat64=VK_TRUE;
        VkSwapchainCreateInfoKHR swapchain{
            .sType=VK_STRUCTURE_TYPE_SWAPCHAIN_CREATE_INFO_KHR,
            .imageFormat=VK_FORMAT_B8G8R8A8_UNORM,
            .imageColorSpace=VK_COLOR_SPACE_SRGB_NONLINEAR_KHR,
            .imageUsage=VK_IMAGE_USAGE_COLOR_ATTACHMENT_BIT,
            .compositeAlpha=VK_COMPOSITE_ALPHA_OPAQUE_BIT_KHR,
            .presentMode=VK_PRESENT_MODE_FIFO_KHR,
            .clipped=VK_TRUE};
        app.mGpuContext=std::make_unique<GpuContext>(init,window.handle,swapchain);
#endif
        app.mDDInterface=new DDInterface(&app);
        Require(app.mDDInterface->Init(window.handle,true)==DDInterface::RESULT_OK,
            "Cannot initialize public image runtime");
        FontUploadAndCopies(app);
        SourceRectangleDraws(app);
        AtlasButtonStates(app);
        SharedReferences(app);
        ReanimationAppearancePixels(app);
        Require(argc==2,"Pass the production main.pak64 path to the image runtime test");
        ParticleDefinitionsAndFrames(app,argv[1]);
    }
    catch (const ResourceManagerException& error)
    {
        std::cerr<<"FAIL image runtime resource: reason="<<int(error.error.reason)
            <<" record="<<error.error.record<<" value="<<error.error.value
            <<" offset="<<error.error.offset<<'\n';
        return 1;
    }
    catch (const std::exception& error)
    {
        std::cerr<<"FAIL image runtime: "<<error.what()<<'\n';
        return 1;
    }
}
