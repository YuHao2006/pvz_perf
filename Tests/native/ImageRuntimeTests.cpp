#include "ReanimClock.h"
#include "SexyAppFramework/SexyAppBase.h"
#include "SexyAppFramework/graphics/DDInterface.h"
#include "SexyAppFramework/graphics/Graphics.h"
#include "SexyAppFramework/graphics/AtlasDraw.h"
#include "SexyAppFramework/graphics/ImageFont.h"
#include "SexyAppFramework/graphics/RenderInterface.h"
#include "SexyAppFramework/paklib/PakInterface.h"
#include "Sexy.TodLib/TodCommon.h"
#include "Sexy.TodLib/TodParticle.h"
#include "ParticleDrawReference.h"
#include "Sexy.TodLib/EffectSystem.h"
#include "Sexy.TodLib/Reanimator.h"
#include "Sexy.TodLib/Attachment.h"
#include "Sexy.TodLib/Definition.h"
#include "Sexy.TodLib/generated/GeneratedDefinitions.h"
#include "Sexy.TodLib/generated/NumericResourceBindings.h"
#include "Sexy.TodLib/generated/SceneAtlasData.h"
#include "Resources.h"
#include "LawnApp.h"
#include "Lawn/Board.h"
#include "Lawn/Projectile.h"
#include "Lawn/ProjectileResources.h"
#include "Lawn/Zombie.h"
#include "Lawn/SeedPacket.h"
#include "Lawn/Widget/GameButton.h"
#include "SexyAppFramework/widget/WidgetManager.h"
#include "Lawn/System/PlayerInfo.h"
#include "Lawn/System/Music.h"
#include "Lawn/System/ReanimationLawn.h"
#include "Lawn/Widget/StoreScreen.h"
#include "Lawn/Widget/TitleScreen.h"
#include "SexyAppFramework/widget/HyperlinkWidget.h"
#include "Sexy.TodLib/TodFoley.h"
#include "SexyAppFramework/imagelib/ImageLib.h"
#include "SexyAppFramework/sound/SoundManager.h"
#include "SexyAppFramework/sound/SoundDecode.h"
#include "SexyAppFramework/sound/DummyMusicInterface.h"
#include "PoolGpuChecks.h"
#include "ParticleRuntimeDrawChecks.h"
#include "Lawn/System/PoolEffect.h"
#include "QuitDialogRuntimeChecks.h"
#include <array>
#include <algorithm>
#include <cmath>
#include <cstdlib>
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
    using SexyAppBase::ProcessSafeDeleteList;
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
    TextureSource packedTexture{packed.mTexture,0};
    const TextureRegion packedSheet{1.f/10,2.f/9,7.f/10,7.f/9,6,5};
    const TextureRegion packedView{3.f/10,3.f/9,5.f/10,5.f/9,2,2};
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


void NecessaryLocalClipDraws(SexyAppBase& app)
{
    auto& render=*app.mDDInterface->mRenderInterface;
    constexpr int width=16,height=12;
    constexpr unsigned background=0xff030507u, solid=0xff113355u;
    std::array<unsigned,8> colors{0xffff0000u,0xff00ff00u,0xff0000ffu,0xffffffffu,
        0xffffff00u,0xffff00ffu,0xff00ffffu,0xff805020u};
    Image source(&app);
    source.SetBits(colors.data(),4,2);
    const Rect region(1,0,2,2);
    const TextureRegion uv{.25f,0,.75f,1,2,2};
    std::unique_ptr<Image> target(render.CreateRenderImage(width,height));
    enum Method { Fill,Outline,FullImage,SourceImage,MirrorImage,MatrixImage,
        MatrixTexture,ParticleQuad,ConvexPolygon };
    for(const auto method:{Fill,Outline,FullImage,SourceImage,MirrorImage,MatrixImage,
        MatrixTexture,ParticleQuad,ConvexPolygon})
    for(const auto origin:{Point(2,3),Point(-1,-1)})
    for(const int clipCase:{0,1,2,3})
    {
        const bool empty=clipCase>=2;
        const Rect clip=clipCase==0 ? Rect(10,8,1,1) : clipCase==1 ?
            Rect(origin.mX+1,origin.mY+1,1,1) : clipCase==2 ? Rect(0,0,0,4) : Rect(0,0,4,0);
        {
            GpuImageDrawScope destination(render,target.get());
            Graphics g(target.get());
            g.mColor=Color(3,5,7,255);
            g.FillRect(0,0,width,height);
            g.mClipRect=clip;
            g.mColor=Color(17,51,85,255);
            g.mLinearBlend=false;g.mFastStretch=true;
            switch(method)
            {
            case Fill:g.FillRect(origin.mX,origin.mY,4,2);break;
            case Outline:g.DrawRect(origin.mX,origin.mY,4,2);break;
            case FullImage:g.DrawImage(&source,origin.mX,origin.mY);break;
            case SourceImage:g.DrawImage(&source,origin.mX,origin.mY,region);break;
            case MirrorImage:g.DrawImageMirror(&source,origin.mX,origin.mY,region,true);break;
            case MatrixImage:case MatrixTexture:case ParticleQuad:
            {
                SexyMatrix3 matrix;matrix.LoadIdentity();
                matrix.m02=origin.mX+1;matrix.m12=origin.mY+1;
                const TextureSource texture{render.CreateImageTexture(&source),0};
                if(method==MatrixImage)
                    TodBltMatrix(&g,&source,matrix,clip,Color::White,g.mDrawMode,region);
                else if(method==MatrixTexture)
                    TodBltMatrix(&g,texture,matrix,clip,Color::White,g.mDrawMode,uv);
                else {
                    TodTriangleGroup triangles;
                    triangles.AddTriangle(&g,texture,matrix,clip,Color::White,g.mDrawMode,uv);
                    triangles.DrawGroup(&g);
                }
                break;
            }
            case ConvexPolygon:
            {
                const Point polygon[]{origin,Point(origin.mX+4,origin.mY),
                    Point(origin.mX+4,origin.mY+2),Point(origin.mX,origin.mY+2)};
                g.PolyFill(polygon,4,true);
                break;
            }
            }
        }
        render.Flush();
        const auto actual=render.ReadImagePixels(*target);
        for(int y=0;y<height;++y)for(int x=0;x<width;++x) {
            unsigned expected=background;
            const int column=x-origin.mX,row=y-origin.mY;
            if(!empty && x>=clip.mX && x<clip.mX+clip.mWidth &&
                y>=clip.mY && y<clip.mY+clip.mHeight) {
                if(method==Outline) {
                    if(column>=0 && column<=4 && row>=0 && row<=2 &&
                        (column==0 || column==4 || row==0 || row==2)) expected=solid;
                } else {
                    const bool plain=method==FullImage;
                    const bool shape=method==Fill || method==ConvexPolygon;
                    const int drawnWidth=shape || plain ? 4 : 2;
                    if(column>=0 && column<drawnWidth && row>=0 && row<2)
                        expected=shape ? solid : colors[row*4+(plain ? column :
                            1+(method==MirrorImage ? 1-column : column))];
                }
            }
            try {Pixel(actual,y*width+x,expected,0);}
            catch(...) {
                std::cerr<<"Necessary-local-clip method="<<method<<" case="<<clipCase
                    <<" origin="<<origin.mX<<','<<origin.mY<<" pixel="<<x<<','<<y<<'\n';
                throw;
            }
        }
    }
    // A native line's edge-coverage convention is backend-specific. Compare
    // exact bytes with the same geometry under the full target clip, and require
    // that reference to be visible; no tolerance or relaxed pixel comparison.
    for(const bool negative:{false,true}) {
        const auto line=[&](const Rect& clip,bool explicitClippedEndpoints=false) {
            {
                GpuImageDrawScope destination(render,target.get());
                Graphics g(target.get());
                g.mColor=Color(3,5,7,255);g.FillRect(0,0,width,height);
                g.mClipRect=clip;g.mColor=Color::White;
                g.DrawLine(explicitClippedEndpoints ? 4 : negative ? -3 : 2,4,explicitClippedEndpoints ? 5 : 8,4);
                g.DrawLineAA(explicitClippedEndpoints ? 4 : negative ? -2 : 3,7,explicitClippedEndpoints ? 5 : 9,7);
            }
            render.Flush();
            return render.ReadImagePixels(*target).pixels;
        };
        const auto reference=line(Rect(0,0,width,height));
        Require(std::any_of(reference.begin(),reference.end(),[](unsigned p){return p!=background;}),
            "Unclipped line reference did not draw");
        const auto outside=line(Rect(12,9,1,1));
        Require(std::all_of(outside.begin(),outside.end(),[](unsigned p){return p==background;}),
            "Disjoint clip did not suppress native lines");
        const Rect partial(4,0,2,height);
        const auto clipped=line(partial);
        // Legacy line clipping ends at the last integer coordinate (5),
        // while native triangle coverage excludes that endpoint. Compare to
        // independently submitted explicit endpoints, not a scissored long line.
        Require(clipped==line(Rect(0,0,width,height),true),
            "Partial line clip differs from its exact historical endpoint geometry");
        const auto hidden=line(Rect(0,0,0,height));
        Require(std::all_of(hidden.begin(),hidden.end(),[](unsigned p){return p==background;}),
            "Empty clip did not suppress line drawing");
    }
    std::cout<<"PASS necessary local-clip contract: independent full-pixel rect/image/source/mirror/"
        "matrix/particle/convex oracles, disjoint/partial/empty clips and negative framebuffer crossings\n";
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
    std::array<TextureRegion,5> regions;
    for (int state=0;state<5;++state)
    {
        unsigned pixels[]{colors[state],colors[state]^0x00101010u,
            colors[state]^0x00080808u,colors[state]};
        original[state].SetBits(pixels,2,2);
        rectangles[state]=Rect(2+state*4,2,2,2);
        regions[state]=PixelSourceToUv(rectangles[state],22,6);
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
    TextureSource texture{packed.mTexture,0};
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
        atlasButton.mNormalRegion=PixelSourceToUv(rectangles[0],22,6);
        atlasButton.mOverRegion=PixelSourceToUv(rectangles[1],22,6);
        atlasButton.mDownRegion=PixelSourceToUv(rectangles[2],22,6);
        atlasButton.mDisabledRegion=PixelSourceToUv(rectangles[3],22,6);
        if (state==7 || state==8)
        {
            oldButton.mDownImage=nullptr;
            atlasButton.mDownRegion=TextureRegion{};
        }
        if (state==8)
        {
            oldButton.mOverImage=nullptr;
            atlasButton.mOverRegion=TextureRegion{};
        }
        const bool glow=state==5 || state==6;
        oldButton.mOverOverlayImage=glow ? &original[4] : nullptr;
        const auto draw=[&](Image* target,bool useAtlas) {
            GpuImageDrawScope destination(render,target);
            Graphics graphics(target);
            graphics.mColor=Color(11,17,23);
            graphics.FillRect(Rect(0,0,12,10));
            graphics.TranslateF(1.1f,2.3f);
            graphics.mFastStretch=true;
            if (useAtlas)
                atlasButton.DrawAtlas(&graphics,texture,glow ? &regions[4] : nullptr);
            else oldButton.Draw(&graphics);
            Require(graphics.mTransX==1.1f && graphics.mTransY==2.3f,
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

void WrappedTextMeasurements()
{
    struct CountingFont final : _Font {
        int draws=0;
        CountingFont() { mAscent=7;mHeight=10;mLineSpacingOffset=2; }
        int CharWidth(SexyChar ch) override { return ch=='\n' ? 0 : ch==' ' ? 3 : 5; }
        int StringWidth(const SexyString& text) override {
            int width=0;
            for (auto ch:text) width+=CharWidth(ch);
            return width;
        }
        void DrawString(Graphics*,int,int,const SexyString&,const Color&,const Rect&) override { ++draws; }
        _Font* Duplicate() override { return new CountingFont(*this); }
    } font;
    for (bool colored:{false,true})
        for (int width:{5,20,60})
            for (const SexyString text:{"","word","word word word","longunbrokenword",
                "first\nsecond\n","^ff0000^colored words","many   spaces"})
            {
                Graphics measure(nullptr),drawing(nullptr);
                measure.mFont=drawing.mFont=&font;
                measure.mWriteColoredString=drawing.mWriteColoredString=colored;
                measure.mColor=drawing.mColor=Color(17,31,47,191);
                drawing.mClipRect=Rect(0,0,10000,10000);
                int measuredWidth=0,drawnWidth=0;
                font.draws=0;
                int standaloneWidth=0;
                const int standaloneHeight=Graphics::MeasureWordWrappedHeight(
                    font,width,text,-1,&standaloneWidth,colored);
                Require(font.draws==0,"Standalone text measurement invoked glyph drawing");
                const int height=measure.GetWordWrappedHeight(width,text,-1,&measuredWidth);
                Require(font.draws==0,"Wrapped text measurement invoked glyph drawing");
                const int reference=drawing.WriteWordWrapped(Rect(0,0,width,0),text,-1,-1,&drawnWidth);
                Require(height==reference && standaloneHeight==reference &&
                    standaloneWidth==drawnWidth && measuredWidth==drawnWidth &&
                    measure.mColor==Color(17,31,47,191),
                    "Pure wrapped measurement changed line breaking, width or color state");
            }
    Graphics invisible(nullptr);
    invisible.mColor=Color::White;
    invisible.FillRect(0,0,20,20);
    std::cout<<"PASS pure wrapped text measurement: wrapping, newlines, color tags, no glyph draws and empty fill\n";
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
    glyph.mImageRect={0,0,1,1,3,1};
    glyph.mWidth=3;
    {
        Graphics measuring(nullptr);
        int measuredWidth=0;
        font.DrawStringEx(&measuring,0,1,"A",Color::White,nullptr,&measuredWidth);
        Require(measuredWidth==3 && !source.mTexture,
            "Text measurement required a GPU draw target or uploaded glyphs");
    }

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
    // A nonzero glyph origin exercises the UV-only persistent source through
    // the loading-time pixel-exact resampler. Its oracle supplies the original
    // integer texel coordinates directly, independently of glyph UV storage.
    {
        Image glyphSheet(&app);
        std::array<unsigned,15> sheetPixels;
        sheetPixels.fill(0xffff00ffu);
        std::copy(std::begin(pixels),std::end(pixels),sheetPixels.begin()+6);
        glyphSheet.SetBits(sheetPixels.data(),5,3,false);
        ImageFont scaledFont(&glyphSheet);
        auto& scaledLayer=scaledFont.mFontData->mFontLayerList.front();
        scaledLayer.mPointSize=0;
        scaledLayer.mAscent=1;
        scaledLayer.mHeight=1;
        auto& scaledGlyph=scaledLayer.mCharData['A'];
        scaledGlyph.mImageRect={1.f/5,1.f/3,4.f/5,2.f/3,3,1};
        scaledGlyph.mWidth=3;
        scaledFont.SetScale(2);
        scaledFont.GenerateActiveFontLayers();
        Require(scaledFont.mActiveLayerList.size()==1,"Missing scaled font UV layer");
        const auto& active=scaledFont.mActiveLayerList.front();
        Require(active.mOwnsImage && active.mScaledImage->mWidth==6 &&
            active.mScaledImage->mHeight==2,"Scaled font UV geometry changed");
        Image* expected=render.CreateRenderImage(6,2);
        try
        {
            const GpuFontGlyph oldPixelGlyph{1,1,3,1,0,0,6,2};
            render.RenderFontAtlas(expected,&glyphSheet,std::span(&oldPixelGlyph,1),false);
            render.Flush();
            Require(render.ReadImagePixels(*expected).pixels==
                render.ReadImagePixels(*active.mScaledImage).pixels,
                "Scaled font UV origin changed pixel-exact resampling");
            const auto& region=active.mScaledCharImageRects['A'];
            Require(region.mU0==0 && region.mV0==0 && region.mU1==1 && region.mV1==1 &&
                region.mWidth==6 && region.mHeight==2,"Scaled font kept pixel source coordinates");
        }
        catch (...) { delete expected; throw; }
        delete expected;
    }
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
    std::vector<ReanimatorSourceTransform> transforms(trackCount);
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
    TextureRegion rectangles[]{
        {},{2.f/12,2.f/8,4.f/12,4.f/8,2,2},{6.f/12,2.f/8,8.f/12,4.f/8,2,2},
        {},{},                                  {6.f/12,2.f/8,8.f/12,4.f/8,2,2},
        {},{2.f/16,2.f/10,4.f/16,4.f/10,2,2},{7.f/16,5.f/10,11.f/16,7.f/10,4,2},
        {},{},                                  {7.f/16,5.f/10,11.f/16,7.f/10,4,2}};
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
    // DrawTrack visibility: explicit synchronous visibility for metadata tracks,
    // incomplete text and a real bitmap-font text track, including blank rows.
    {
        Image glyphImage(&app);
        unsigned glyphPixels[]{0xffffffffu, 0xffffffffu, 0xffffffffu};
        glyphImage.SetBits(glyphPixels,3,1,false);
        ImageFont font(&glyphImage);
        auto& layer=font.mFontData->mFontLayerList.front();
        layer.mPointSize=0; layer.mAscent=1; layer.mHeight=1;
        auto& glyph=layer.mCharData['A'];
        glyph.mImageRect={0,0,1,1,3,1}; glyph.mWidth=3;
        const auto original=transforms[face];
        const auto originalVariant=animation.mVariant;
        const bool originalTruncation=animation.mTrackInstances[face].mTruncateDisappearingFrames;
        ReanimatorFrameTime time{0,0,0};
        const auto check=[&](bool expected,const char* message) {
            {
                GpuImageDrawScope destination(render,target.get());
                Graphics graphics(target.get());
                graphics.mColor=Color::Black;
                graphics.FillRect(Rect(0,0,20,12));
                Require(animation.DrawTrack(&graphics,face,0,&time)==expected,message);
            }
            render.Flush();
            const auto pixels=render.ReadImagePixels(*target);
            Require(pixels.pixels.size()==240,"Metadata fixture changed target size");
        };
        transforms[face].mImageSlot=0;
        transforms[face].mFont=nullptr; transforms[face].mText=nullptr;
        check(false,"Control track incorrectly reports visible");
        transforms[face].mText="attacher__Garlic";
        check(false,"Attacher metadata incorrectly draws as text");
        transforms[face].mFont=&font; transforms[face].mText=nullptr;
        check(false,"Font without text incorrectly reports visible");
        transforms[face].mText="A";
        check(true,"Font/text track was rejected by metadata fast path");
        transforms[face].mText="";
        check(true,"Empty but non-null text changed visibility");
        transforms[face].mText="A"; transforms[face].mAlpha=0;
        check(false,"Zero-alpha text incorrectly reports visible");
        transforms[face].mAlpha=1; transforms[face].mFrame=-1;
        check(false,"Hidden text incorrectly reports visible");
        transforms[face]=original;
        animation.SelectVariant(1);
        check(true,"Blank appearance incorrectly hides attachment parent");
        transforms[face].mAlpha=0;
        check(false,"Zero-alpha blank appearance incorrectly reports visible");
        transforms[face]=original;
        std::vector<std::array<ReanimatorSourceTransform,2>> fade(trackCount);
        for (int t=0;t<trackCount;++t)
        {
            fade[t]={transforms[t],transforms[t]};
            tracks[t].mTransforms={fade[t].data(),2};
        }
        fade[face][1].mFrame=-1;
        time={.5f,0,1};
        animation.mTrackInstances[face].mTruncateDisappearingFrames=true;
        check(false,"Disappearing truncated track incorrectly reports visible");
        animation.mTrackInstances[face].mTruncateDisappearingFrames=false;
        check(true,"Nontruncated disappearing track lost its visible frame");
        for (int t=0;t<trackCount;++t) tracks[t].mTransforms={&transforms[t],1};
        animation.SelectVariant(originalVariant);
        animation.mTrackInstances[face].mTruncateDisappearingFrames=originalTruncation;
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
    {
        auto& lawn=static_cast<LawnApp&>(app);
        auto* previousEffects=lawn.mEffectSystem;
        lawn.mEffectSystem=&effects;
        struct RestoreEffects {
            LawnApp& app;
            EffectSystem* previous;
            ~RestoreEffects() { app.mEffectSystem=previous; }
        } restoreEffects{lawn,previousEffects};
        Zombie boss{};
        boss.mFromWave=Zombie::ZOMBIE_WAVE_UI;
        boss.mZombieType=ZombieType::ZOMBIE_BOSS;
        boss.mFadeEndTimeNs=-1;
        boss.mBodyHealth=boss.mBodyMaxHealth=1000;
        boss.mShieldType=ShieldType::SHIELDTYPE_NONE;
        boss.mBodyReanimID=static_cast<ReanimationID>(
            effects.mReanimationHolder->mReanimations.DataArrayGetID(child));
        for (int t=0;t<trackCount;++t)
            child->mTrackInstances[t].mRenderGroup=RENDER_GROUP_BOSS_BACK_ARM;
        child->mOverlayMatrix.m02=0.1f;
        child->mOverlayMatrix.m12=-0.3f;
        const auto original=child->mOverlayMatrix;
        ZombieDrawPosition drawPosition{};
        drawPosition.mClipHeight=CLIP_HEIGHT_OFF;
        std::unique_ptr<Image> bossTarget(render.CreateRenderImage(256,128));
        const ZombiePhase phases[]{PHASE_BOSS_DROP_RV,PHASE_BOSS_BUNGEES_ENTER,
            PHASE_BOSS_BUNGEES_DROP,PHASE_BOSS_BUNGEES_LEAVE};
        for (const auto phase:phases)
        {
            boss.mZombiePhase=phase;
            boss.mTargetCol=1;
            boss.mTargetRow=2;
            // Independent expected draw: apply the intended attack offset,
            // then restore by assignment before exercising the Zombie method.
            child->mOverlayMatrix.m02=original.m02+(phase==PHASE_BOSS_DROP_RV?80.f:57.f);
            child->mOverlayMatrix.m12=original.m12+(phase==PHASE_BOSS_DROP_RV?65.f:0.f);
            {
                GpuImageDrawScope destination(render,bossTarget.get());
                Graphics graphics(bossTarget.get());
                graphics.mColor=Color::Black;
                graphics.FillRect(Rect(0,0,256,128));
                child->DrawRenderGroup(&graphics,RENDER_GROUP_BOSS_BACK_ARM);
            }
            render.Flush();
            const auto expected=render.ReadImagePixels(*bossTarget);
            Require(std::any_of(expected.pixels.begin(),expected.pixels.end(),
                [](unsigned pixel) { return pixel!=0xff000000u; }),
                "Boss back-arm reference did not draw a visible track");
            child->mOverlayMatrix=original;
            {
                GpuImageDrawScope destination(render,bossTarget.get());
                Graphics graphics(bossTarget.get());
                graphics.mColor=Color::Black;
                graphics.FillRect(Rect(0,0,256,128));
                boss.DrawBossBackArm(&graphics,drawPosition);
                Require(child->mOverlayMatrix.m02==original.m02 &&
                    child->mOverlayMatrix.m12==original.m12,
                    "Boss back-arm drawing changed the shared animation's fractional translation");
            }
            render.Flush();
            Require(render.ReadImagePixels(*bossTarget).pixels==expected.pixels,
                "Boss back-arm drawing changed its attack offset pixels");
        }
        {
            GpuImageDrawScope destination(render,bossTarget.get());
            Graphics graphics(bossTarget.get());
            for (int i=0;i<1024;++i)
            {
                boss.mZombiePhase=phases[i%4];
                boss.mTargetCol=i%3;
                boss.mTargetRow=i%4;
                boss.DrawBossBackArm(&graphics,drawPosition);
                Require(child->mOverlayMatrix.m02==original.m02 &&
                    child->mOverlayMatrix.m12==original.m12,
                    "Repeated boss back-arm drawing accumulated animation translation rounding");
            }
        }
        render.Flush();
        std::cout<<"PASS actual boss back-arm drawing: four attack offsets, reference pixels, "
            "1024 exact shared-animation translation restorations\n";
    }
    bool rejected=false;
    try { animation.SelectVariant(4); } catch (const std::out_of_range&) { rejected=true; }
    Require(rejected && animation.mVariant==3,"Invalid appearance selection damaged the current row");
    std::cout<<"PASS reanimation appearances: independent options, image slots, atlas dimensions, "
        "original centers and actual AttachmentDraw visibility pixels\n";
}

void ReanimationFullscreenPixels(SexyAppBase& app)
{
    auto& render=*app.mDDInterface->mRenderInterface;
    ReanimatorLoadDefinitions(gLawnReanimationArray,static_cast<int>(ReanimationType::NUM_REANIMS));
    struct CatalogCleanup { ~CatalogCleanup() { ReanimatorFreeDefinitions(); } } cleanup;
    Reanimation lookup;
    lookup.mReanimationType=ReanimationType::REANIM_ZOMBIES_WON;
    const int fullscreen=lookup.FindTrackIndex(ReanimTrackId::fullscreen);
    std::vector<ReanimatorTrack> tracks(fullscreen+1);
    std::vector<ReanimatorSourceTransform> transforms(fullscreen+1);
    for (int t=0;t<=fullscreen;++t)
    {
        transforms[t].mScaleX=transforms[t].mScaleY=1;
        transforms[t].mAlpha=0.5f;
        transforms[t].mFrame=-1;
        tracks[t].mTransforms={&transforms[t],1};
    }
    auto& transform=transforms[fullscreen];
    transform.mFrame=0;
    transform.mTransX=12345; transform.mTransY=-7654;
    transform.mSkewX=37; transform.mSkewY=-91;
    transform.mScaleX=-17; transform.mScaleY=23;
    TextureRegion empty{};
    ReanimatorDefinition definition;
    definition.mTracks={tracks.data(),int(tracks.size())};
    definition.mImageRects=&empty;
    Reanimation animation;
    animation.mReanimationType=lookup.mReanimationType;
    animation.ReanimationInitialize(0,0,&definition);
    animation.mColorOverride=Color(200,120,220,200);
    auto& instance=animation.mTrackInstances[fullscreen];
    instance.mTrackColor=Color(90,160,210,180);
    ReanimatorFrameTime time{0,0,0};
    std::unique_ptr<Image> target(render.CreateRenderImage(20,12));
    for (bool hidden:{false,true})
    for (bool transparent:{false,true})
    for (int mode:{Graphics::DRAWMODE_NORMAL,Graphics::DRAWMODE_ADDITIVE})
    for (bool ignoreClip:{false,true})
    {
        transform.mFrame=hidden ? -1 : 0;
        transform.mAlpha=transparent ? 0 : 0.5f;
        instance.mIgnoreClipRect=ignoreClip;
        std::vector<unsigned> expected;
        for (bool reference:{true,false})
        {
            {
                GpuImageDrawScope destination(render,target.get());
                Graphics graphics(target.get());
                graphics.mColor=Color::White;
                graphics.FillRect(Rect(0,0,20,12));
                graphics.mTransX=2.25f; graphics.mTransY=-1.5f;
                graphics.mClipRect=Rect(3,2,11,7);
                graphics.mDrawMode=mode;
                graphics.mColorizeImages=true;
                const Color original(140,220,160,128);
                graphics.mColor=original;
                if (reference && !hidden && !transparent)
                {
                    Color color=ColorsMultiply(ColorsMultiply(instance.mTrackColor,
                        animation.mColorOverride),original);
                    color.mAlpha=FloatRoundToInt(color.mAlpha*0.5f);
                    graphics.mColor=color;
                    graphics.FillRect(-graphics.mTransX,-graphics.mTransY,20,12);
                }
                if (!reference)
                {
                    Require(animation.DrawTrack(&graphics,fullscreen,0,&time)==(!hidden && !transparent),
                        "Fullscreen track changed synchronous visibility");
                    Require(graphics.mColor==original,"Fullscreen track did not restore Graphics color");
                }
            }
            render.Flush();
            const auto pixels=render.ReadImagePixels(*target);
            if (reference) expected=pixels.pixels;
            else Require(pixels.pixels==expected,
                "Fullscreen reanimation differs from destination fill after matrix bypass");
        }
    }
    std::cout<<"PASS fullscreen reanimation: destination fill pixels, hidden/zero alpha, "
        "color modulation, both blend modes, translation and effective clip without track matrices\n";
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
        Require(first.mDefinition->mTextures[v],"Appearance atlas binding was not uploaded");
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
    bool allowSilentPlayback=false;

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
        if (allowSilentPlayback) return nullptr;
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

void StorePauseClockRuntime(TestApp& app, DecodeOnlySoundManager& sounds)
{
    std::cerr<<"Store clock fixture: initialize\n";
    ReanimatorLoadDefinitions(gLawnReanimationArray,static_cast<int>(ReanimationType::NUM_REANIMS));
    struct FreeCatalog { ~FreeCatalog() { ReanimatorFreeDefinitions(); } } freeCatalog;
    EffectSystem effects;
    effects.EffectSystemInitialize();
    PlayerInfo profile;
    profile.mLevel=50;
    DummyMusicInterface silentMusicInterface;
    Music music;
    music.SetMusicDisabled(true);
    TodFoleyInitialize(gLawnFoleyParamArray,NUM_FOLEY);
    TodFoley foley;
    ReanimatorCache cache;
    cache.ReanimatorCacheInitialize();
    for (const auto seed:{SEED_GATLINGPEA,SEED_TWINSUNFLOWER,SEED_GLOOMSHROOM,SEED_CATTAIL})
        cache.mPlantImages[seed]=cache.MakeCachedPlantFrame(seed,VARIATION_NORMAL);
    struct RestoreWorld {
        TestApp& app;
        DecodeOnlySoundManager& sounds;
        PlayerInfo* profile;
        Music* music;
        TodFoley* foley;
        MusicInterface* musicInterface;
        ReanimatorCache* cache;
        GameScenes scene;
        std::uint64_t interval=Sexy::gUpdateIntervalNs;
        double ticks=Sexy::gUpdateTicks, steps=Sexy::gStepsPerLegacyTick;
        ~RestoreWorld() {
            app.KillStoreScreen();
            app.ProcessSafeDeleteList();
            app.mBoard=nullptr;
            app.mEffectSystem=nullptr;
            app.mPlayerInfo=profile;
            app.mMusic=music;
            app.mSoundSystem=foley;
            app.mMusicInterface=musicInterface;
            app.mReanimatorCache=cache;
            app.mGameScene=scene;
            sounds.allowSilentPlayback=false;
            Sexy::gUpdateIntervalNs=interval;
            Sexy::gUpdateTicks=ticks;
            Sexy::gStepsPerLegacyTick=steps;
        }
    } restore{app,sounds,app.mPlayerInfo,app.mMusic,app.mSoundSystem,app.mMusicInterface,app.mReanimatorCache,app.mGameScene};
    app.mEffectSystem=&effects;
    app.mPlayerInfo=&profile;
    app.mMusic=&music;
    app.mSoundSystem=&foley;
    app.mMusicInterface=&silentMusicInterface;
    app.mReanimatorCache=&cache;
    sounds.allowSilentPlayback=true;
    Board board(&app);
    std::cerr<<"Store clock fixture: board initialized\n";
    app.mGameScene=GameScenes::SCENE_PLAYING;
    auto& holder=*effects.mReanimationHolder;
    auto* background=app.AddReanimation(0,0,0,REANIM_PEASHOOTER);
    background->PlayReanim(ReanimTrackId::anim_idle,REANIM_LOOP,0,12);
    auto* battle=app.AddReanimation(0,0,0,REANIM_PEASHOOTER);
    battle->PlayReanim(ReanimTrackId::anim_idle,REANIM_LOOP,0,12);
    battle->BindTimeDomain(ReanimTimeDomain::Battle);
    auto& render=*app.mDDInterface->mRenderInterface;
    Image* target=render.CreateRenderImage(800,600);
    struct FreeTarget { Image* image; ~FreeTarget() { delete image; } } freeTarget{target};
    for (const int hz:{100,240,480,1000})
    {
        std::cerr<<"Store clock fixture: "<<hz<<" Hz ordinary pause\n";
        Sexy::gUpdateIntervalNs=1'000'000'000ULL/hz;
        Sexy::gUpdateTicks=100.0/hz;
        Sexy::gStepsPerLegacyTick=hz/100.0;
        const auto phase=background->SamplePlayback().phaseNs;
        const auto battleTime=holder.mBattleTimeNs;
        board.Pause(true);
        for (int frame=0;frame<hz;++frame) app.UpdateFrames();
        Require(background->SamplePlayback().phaseNs==phase && holder.mBattleTimeNs==battleTime,
            "Ordinary pause advanced the background pose or battle clock");
        board.Pause(false);
        background->Update();
        Require(background->SamplePlayback().phaseNs==phase,
            "Resuming an ordinary pause consumed elapsed UI time");
        for (const bool inLevel:{false,true})
        {
            std::cerr<<"Store clock fixture: opening "<<(inLevel ? "level" : "menu")<<" Store\n";
            app.mBoard=inLevel ? &board : nullptr;
            auto* store=app.ShowStoreScreen();
            std::cerr<<"Store clock fixture: drawing Store\n";
            Require(board.mPaused==inLevel,"Store modal did not preserve the expected board pause");
            {
                GpuImageDrawScope destination(render,target);
                Graphics graphics(target);
                store->Draw(&graphics);
            }
            std::cerr<<"Store clock fixture: drawing completed, updating entry\n";
            for (int frame=0;frame<3*hz;++frame)
            {
                try { app.UpdateFrames(); }
                catch (...) { std::cerr<<"Store entry update failed at frame "<<frame<<'\n'; throw; }
            }
            Require(app.mCrazyDaveState!=CRAZY_DAVE_ENTERING && app.mCrazyDaveState!=CRAZY_DAVE_OFF,
                "Store Crazy Dave did not complete his entry animation");
            std::cerr<<"Store clock fixture: entry completed, navigating\n";
            for (const int button:{store->mNextButton->mId,store->mPrevButton->mId})
            {
                const auto previousPage=store->mPage;
                store->ButtonDepress(button);
                Require(store->mPage!=previousPage && store->mHatchTimer>0,
                    "Store page button did not start its hatch transition");
                for (int frame=0;frame<hz;++frame) app.UpdateFrames();
                Require(store->mHatchTimer==0 && !store->mPrevButton->mDisabled &&
                    !store->mNextButton->mDisabled,"Store hatch remained closed after page navigation");
            }
            constexpr int nestedDialogId=41000;
            std::cerr<<"Store clock fixture: navigation completed, removing Store\n";
            if (inLevel)
            {
                auto* nested=new Dialog(nullptr,nullptr,nestedDialogId,true,"","","",Dialog::BUTTONS_NONE);
                nested->Resize(0,0,100,100);
                app.AddDialog(nested);
            }
            app.KillStoreScreen();
            std::cerr<<"Store clock fixture: Store removed\n";
            app.ProcessSafeDeleteList();
            if (inLevel)
            {
                Require(board.mPaused && background->SamplePlayback().phaseNs==phase,
                    "Removing Store under another modal did not restore the paused background pose");
                for (int frame=0;frame<hz;++frame) app.UpdateFrames();
                Require(background->SamplePlayback().phaseNs==phase,
                    "Background pose advanced under the modal remaining after Store closed");
                app.KillDialog(nestedDialogId);
                app.ProcessSafeDeleteList();
                background->Update();
                battle->Update();
                Require(background->SamplePlayback().phaseNs==phase && holder.mBattleTimeNs==battleTime,
                    "Store resume advanced a paused background animation or battle clock");
            }
            Require(!board.mPaused,"Closing the Store and its modal left the board paused");
            // The menu case deliberately had no board. Consume its visual time
            // before measuring the next paused in-level interval.
            background->RebaseTime(holder.mVisualTimeNs);
        }
        app.mBoard=&board;
        std::cout<<"PASS Store clocks "<<hz<<" Hz: menu/level Dave entry, next/prev hatch, pause/resume poses and battle clock\n";
    }
}

void ProjectileAtlasPixels(LawnApp& app)
{
    auto& render=*app.mDDInterface->mRenderInterface;
    const auto& definition=GeneratedDefinitions::Projectiles;
    ProjectileLoadResources();
    struct FreeResources {
        ~FreeResources() { ProjectileFreeResources(); DefinitionFreeAtlasImages(); }
    } freeResources;
    ImageLib::Image* decoded=ImageLib::GetImage("compiled/atlases/projectiles.atlas.png",false);
    // Independent pre-migration packed pixel layout. The new program data must
    // normalize these exact regions, not redefine its own pixel oracle.
    constexpr Rect bodyRegions[]{
        {156,102,28,28},{168,44,28,28},{210,2,30,27},{38,84,55,48},
        {2,104,32,27},{97,84,55,48},{0,0,0,0},{168,2,38,38},
        {2,84,30,16},{210,33,31,31},{168,76,21,22},{2,2,162,78},
        {193,81,49,50},{156,102,28,28}};
    constexpr Rect shadowRegions[]{{200,68,21,9},{221,68,21,9}};
    Require(decoded && decoded->mBits && decoded->mWidth==244 &&
        decoded->mHeight==134,"Cannot decode projectile atlas oracle");
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
                    <<" creationTimeNs="<<projectile.mCreationTimeNs
                    <<" pixel="<<i%width<<","<<i/width
                    <<" actual="<<std::hex<<result.pixels[i]
                    <<" expected="<<expected.pixels[i]<<std::dec<<'\n';
                throw;
            }
        if (boundaryDifferences)
            std::cout<<"Nearest texel boundaries type="<<int(projectile.mProjectileType)
                <<" rotation="<<projectile.mRotation<<" motion="<<int(projectile.mMotionType)
                <<" creationTimeNs="<<projectile.mCreationTimeNs<<" pixels="<<boundaryDifferences
                <<" maxChannelDelta="<<maximumDifference
                <<" (all match adjacent CPU texels; all other pixels exact within2)\n";
    };
    for (int type=0;type<14;++type)
    {
        projectile.mProjectileType=static_cast<ProjectileType>(type);
        const auto& visual=definition.mProjectiles[type];
        const auto& oldRegion=bodyRegions[type];
        Require(visual.mSource.mWidth==oldRegion.mWidth &&
            visual.mSource.mHeight==oldRegion.mHeight &&
            visual.mSource.mU0==float(oldRegion.mX)/244 &&
            visual.mSource.mV0==float(oldRegion.mY)/134 &&
            visual.mSource.mU1==float(oldRegion.mX+oldRegion.mWidth)/244 &&
            visual.mSource.mV1==float(oldRegion.mY+oldRegion.mHeight)/134,
            "Generated projectile UV differs from the preserved pixel layout");
        Image body(&app);
        sourceImage(body,oldRegion);
        for (const std::int64_t ageNs:{0LL,123'456'789LL,300'000'000LL})
            for (const bool rotated:{false,true})
                for (const bool mirror:{false,true})
                {
                    projectile.mCreationTimeNs=
                        static_cast<std::int64_t>(board.mLevelTimeNs)-ageNs;
                    projectile.mRotation=rotated ? 0.37f : 0.0f;
                    projectile.mMotionType=mirror ? ProjectileMotion::MOTION_BEE_BACKWARDS :
                        ProjectileMotion::MOTION_STRAIGHT;
                    float scale=visual.mScale;
                    if (type==int(ProjectileType::PROJECTILE_PUFF))
                        scale=TodAnimateCurveNs(0,300'000'000,ageNs,0.3f,1.0f,Curves::Linear)*(visual.mScale/0.3f);
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
                        nearest ? &nearestTransform : nullptr,&oldRegion,Color::White);
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
                sourceImage(shadow,shadowRegions[night]);
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
                    &shadowRegions[night],Color(160,210,120,230));
            }
    }
    std::cout<<"PASS actual projectile body/shadow atlas pixels: all14 types, both shadow cels, "
        "source offsets, scale, rotation, mirrors, puff ages, lobbed shadows and collision dimensions\n";
}

void PoolScenePixels(SexyAppBase& app)
{
    auto& render=*app.mDDInterface->mRenderInterface;
    PoolEffect pool;
    pool.PoolEffectInitialize();
    pool.mPoolCounter=97;
    render.SetCausticsFrame(97);
    for (int width:{800,1400})
    {
        Image* target=render.CreateRenderImage(width,600);
        struct Cleanup { Image* image; ~Cleanup() { delete image; } } cleanup{target};
        for (bool night:{false,true})
        {
            const auto draw=[&](bool legacy) {
                {
                    GpuImageDrawScope destination(render,target);
                    Graphics g(target);
                    g.mColor=Color::Black;
                    g.FillRect(0,0,width,600);
                    g.mTransX=width==1400 ? 230.f : 0.f;
                    g.mLinearBlend=true;
                    g.DrawImage(night ? IMAGE_BACKGROUND4 : IMAGE_BACKGROUND3,-220,0);
                    if (!legacy) pool.PoolEffectDraw(&g,night);
                    else
                    {
                        Image* layers[]{night ? IMAGE_POOL_BASE_NIGHT : IMAGE_POOL_BASE,
                            night ? IMAGE_POOL_SHADING_NIGHT : IMAGE_POOL_SHADING,
                            pool.mCausticImage};
                        for (unsigned layer=0;layer<3;++layer)
                        {
                            auto p=PoolGpuChecks::Parameters(97,layer,night,GpuBlend::Normal,false,false);
                            p.width=float(IMAGE_POOL->mWidth);
                            p.height=float(IMAGE_POOL->mHeight);
                            p.transX=p.transY=0;
                            p.clip={g.mClipRect.mX,g.mClipRect.mY,g.mClipRect.mWidth,g.mClipRect.mHeight};
                            const auto vertices=PoolGpuChecks::LegacyVertices(p,0);
                            TriVertex triangles[150][3]{};
                            for (unsigned i=0;i<vertices.size();++i)
                            {
                                const auto& v=vertices[i];
                                auto& out=triangles[i/3][i%3];
                                out.x=v.x;out.y=v.y;out.u=v.u;out.v=v.v;
                                out.color=(unsigned(std::lround(v.a*255))<<24)|0xffffffu;
                            }
                            render.sSamplerAddressWrap=layer==2;
                            g.DrawTrianglesTex(layers[layer],triangles,150);
                        }
                        render.sSamplerAddressWrap=false;
                    }
                }
                render.Flush();
                return render.ReadImagePixels(*target);
            };
            const auto expected=draw(true);
            const auto actual=draw(false);
            unsigned maxDelta=0;
            for (std::size_t i=0;i<actual.pixels.size();++i)
                for (unsigned shift:{0,8,16,24})
                    maxDelta=std::max(maxDelta,unsigned(std::abs(
                        int((actual.pixels[i]>>shift)&255)-int((expected.pixels[i]>>shift)&255))));
            std::cout<<"pool scene width="<<width<<" night="<<night<<" max="<<maxDelta<<'\n';
            const auto name="pool-scene-"+std::to_string(width)+(night ? "-night" : "-day");
            Require(ImageLib::WritePNGImage(name+"-legacy.png",width,600,expected.pixels) &&
                ImageLib::WritePNGImage(name+"-gpu.png",width,600,actual.pixels),
                "Cannot write pool scene diagnostic");
            Require(maxDelta<=3,"Actual PoolEffectDraw differs from legacy Graphics triangle path");
        }
    }
}

void SeedPacketCooldownPixels(SexyAppBase& app)
{
    auto& render=*app.mDDInterface->mRenderInterface;
    Require(IMAGE_SEEDS && IMAGE_SEEDS->mTexture,"Cooldown test requires resident production seed texture");
    std::unique_ptr<Image> target(render.CreateRenderImage(80,100));
    const auto capture=[&](float fraction,int grayness) {
        {
            GpuImageDrawScope destination(render,target.get());
            Graphics g(target.get());
            g.mColor=Color::Black;g.FillRect(0,0,80,100);
            // This production packet has no cached plant thumbnail, isolating
            // the actual background and its same cooldown overlay draw path.
            DrawSeedPacket(&g,10,10,SEED_BEGHOULED_BUTTON_SHUFFLE,SEED_NONE,
                fraction,grayness,false,false);
        }
        render.Flush();
        return render.ReadImagePixels(*target).pixels;
    };
    const auto ready=capture(0,128), dark=capture(1,255);
    Require(ready!=dark,"Actual fully dark seed packet did not differ from its ready base");
    std::vector<unsigned int> previous;
    for (const auto [fraction,edge]:{std::pair{.25f,19},std::pair{.5f,36},std::pair{.75f,53}})
    {
        const auto actual=capture(fraction,255);
        unsigned changedTop=0,unchangedBottom=0;
        for (int y=0;y<100;++y)for(int x=0;x<80;++x)
        {
            const bool covered=x>=10 && x<60 && y>=10 && y<10+edge;
            const unsigned expected=covered ? dark[y*80+x] : ready[y*80+x];
            Require(actual[y*80+x]==expected,
                "Actual seed cooldown overlay leaked below its reveal edge or changed the ready portion");
            if(covered && dark[y*80+x]!=ready[y*80+x])++changedTop;
            if(x>=10 && x<60 && y>=10+edge && y<80 && actual[y*80+x]==ready[y*80+x])++unchangedBottom;
        }
        Require(changedTop>0 && unchangedBottom>0,"Cooldown fixture did not cover both dark and ready pixels");
        Require(previous.empty() || previous!=actual,"Different cooldown fractions produced the same full-gray packet");
        previous=actual;
    }
    std::cout<<"PASS actual DrawSeedPacket cooldown: production atlas, quarter/half/three-quarter edges, dark upper and unchanged ready lower pixels\n";
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
    SeedPacketCooldownPixels(app);
    ProjectileAtlasPixels(static_cast<LawnApp&>(app));
    PoolScenePixels(app);
    FixedUIAtlas::Load();
    StorePauseClockRuntime(static_cast<TestApp&>(app),sounds);
    {
        auto& render=*app.mDDInterface->mRenderInterface;
        Image* target=render.CreateRenderImage(800,600);
        try
        {
            GpuImageDrawScope destination(render,target);
            Graphics graphics(target);
            CheckQuitDialogRuntime(static_cast<LawnApp&>(app),graphics);
            static_cast<TestApp&>(app).ProcessSafeDeleteList();
        }
        catch (...) { delete target; FixedUIAtlas::Free(); throw; }
        delete target;
    }
    FixedUIAtlas::Free();
    DefinitionFreeAtlasImages();
    std::cout<<"PASS actual Quit confirmation: target-free layout, body, yes/no buttons and clean dialog release\n";
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
        ParticleDrawReference::LoadRenderDefinitions();
        ParticleRuntimeDrawChecks(*app.mDDInterface->mRenderInterface);
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
            {
                bool hasImage=false;
                for (unsigned f=0;f<definition.mImageRectCount;++f)
                    hasImage|=definition.mImageRects[v*definition.mImageRectCount+f].mWidth>0;
                Require(!hasImage || definition.mTextures[v],
                    "Static particle catalog has an unbound atlas");
            }
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
                Require(definition.mTextures[v],"Loaded appearance has no resident atlas");
                for (unsigned f=0;f<definition.mImageRectCount;++f)
                {
                    const auto& r=definition.mImageRects[v*definition.mImageRectCount+f];
                    Require(r.mU0>0 && r.mV0>0 && r.mWidth>0 && r.mHeight>0 &&
                        r.mU0<r.mU1 && r.mV0<r.mV1 && r.mU1<1 && r.mV1<1,
                        "Loaded particle frame is outside its resident atlas");
                }
            }
        }
        auto& fire=gParticleDefArray[fireEffect];
        const auto emitterCount=fire.mEmitterDefCount;
        const auto rectangleCount=fire.mImageRectCount;
        const std::vector<TextureRegion> originalRectangles(fire.mImageRects,
            fire.mImageRects+fire.mVariantCount*fire.mImageRectCount);
        const auto& duration=fire.mEmitterDefs[0].mParticleDuration;
        const std::vector<FloatParameterTrackNode> originalDurationNodes(duration.mNodes,
            duration.mNodes+duration.mCountNodes);
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

        // Preserve the pixel rectangles from the pre-UV fixture as an independent
        // oracle. Reference rendering below decodes the packed PNGs and uses the
        // ordinary Image pixel-rectangle path, never the generated UV endpoints.
        const Rect fireRectangles[]{
            {2,2,112,74},{118,2,112,74},{2,80,112,74},{118,80,112,74},
            {2,80,112,74},{118,80,112,74}};
        const Rect iceRectangles[]{
            {2,2,87,46},{2,52,87,46},{2,102,87,46},{2,152,87,46},
            {2,102,87,46},{2,152,87,46}};
        const Rect glassesRectangles[]{
            {2,2,61,48},{67,2,61,48},{2,54,61,48},{67,54,61,48}};
        const Rect snowRectangles[]{{2,202,20,20},{26,202,20,20},{50,202,20,20}};
        Image fireAtlas(&app),iceAtlas(&app),glassesAtlas(&app);
        Image* referenceAtlases[]{&fireAtlas,&iceAtlas,&glassesAtlas};
        const char* referencePaths[]{"compiled/atlases/fireball_burst.atlas.png",
            "compiled/atlases/ice_trail.atlas.png",
            "compiled/particles/zombiefutureglasses.atlas.png"};
        const int referenceWidths[]{232,91,130},referenceHeights[]{156,224,104};
        for (int atlas=0;atlas<3;++atlas)
        {
            ImageLib::Image* decoded=ImageLib::GetImage(referencePaths[atlas],false);
            struct FreeDecoded { ImageLib::Image* image; ~FreeDecoded() { delete image; } } cleanup{decoded};
            Require(decoded && decoded->mBits && decoded->mWidth==referenceWidths[atlas] &&
                decoded->mHeight==referenceHeights[atlas],"Particle pixel oracle PNG dimensions changed");
            referenceAtlases[atlas]->SetBits(decoded->mBits,decoded->mWidth,decoded->mHeight);
        }
        const auto checkUV=[](const TextureRegion& actual,const Rect& pixel,int width,int height) {
            const auto closeUV=[](float left,float right) { return std::abs(left-right)<0.000001f; };
            Require(actual.mWidth==pixel.mWidth && actual.mHeight==pixel.mHeight &&
                closeUV(actual.mU0,float(pixel.mX)/width) &&
                closeUV(actual.mV0,float(pixel.mY)/height) &&
                closeUV(actual.mU1,float(pixel.mX+pixel.mWidth)/width) &&
                closeUV(actual.mV1,float(pixel.mY+pixel.mHeight)/height),
                "Generated particle UVs disagree with the original pixel rectangles");
        };
        for (unsigned f=0;f<6;++f)
        {
            checkUV(fire.mImageRects[f],fireRectangles[f],232,156);
            checkUV(fire.mImageRects[6+f],iceRectangles[f],91,224);
        }
        for (unsigned f=0;f<4;++f)
            checkUV(gParticleDefArray[glassesEffect].mImageRects[f],glassesRectangles[f],130,104);
        for (unsigned f=0;f<3;++f)
            checkUV(gParticleDefArray[trailEffect].mImageRects[f],snowRectangles[f],91,224);

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
                        const auto v=selected->mVariant;
                        SexyMatrix3 transform;
                        TodScaleRotateTransformMatrix(transform,128,128,0,1,1);
                        const int mode=TestBit(selectedEmitter->mEmitterDef->mParticleFlags,
                            ParticleFlags::PARTICLE_ADDITIVE) ? Graphics::DRAWMODE_ADDITIVE :
                            Graphics::DRAWMODE_NORMAL;
                        triangles.AddTriangle(&graphics,referenceAtlases[v],transform,graphics.mClipRect,
                            Color::White,mode,v==0 ? fireRectangles[0] : iceRectangles[0]);
                    }
                    else
                    {
                        TodParticle particle{};
                        particle.mParticleEmitter=selectedEmitter;
                        selectedEmitter->mFrameOverride=0;
                        ParticleDrawReference::ParticleRenderParams values{};
                        values.mParticleScale=values.mParticleStretch=1;
                        values.mPosX=values.mPosY=128;
                        ParticleDrawReference::RenderParticle(&graphics,&particle,Color::White,&values,&triangles);
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
                ParticleDrawReference::ParticleRenderParams values{};
                TodTriangleGroup triangles;
                ParticleDrawReference::RenderParticle(&graphics,&noImageParticle,Color::White,&values,&triangles);
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
            const auto draw=[&](bool reference, int frame, bool clipped=false) {
                {
                    GpuImageDrawScope destination(render,target.get());
                    Graphics graphics(target.get());
                    if (clipped) graphics.mLinearBlend=false;
                    graphics.mColor=Color::Black;
                    graphics.FillRect(Rect(0,0,256,256));
                    TodTriangleGroup triangles;
                    if (reference)
                    {
                        SexyMatrix3 transform;
                        TodScaleRotateTransformMatrix(transform,
                            clipped ? 143.25f : 128.f,clipped ? 134.f : 128.f,0,1,1);
                        triangles.AddTriangle(&graphics,&glassesAtlas,transform,graphics.mClipRect,
                            Color::White,Graphics::DRAWMODE_NORMAL,
                            clipped ? Rect(82,60,38,30) : glassesRectangles[frame]);
                    }
                    else
                    {
                        ParticleDrawReference::ParticleRenderParams values{};
                        values.mParticleScale=values.mParticleStretch=1;
                        values.mPosX=values.mPosY=128;
                        ParticleDrawReference::RenderParticle(&graphics,&particle,Color::White,&values,&triangles);
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
            particle.mParticleDurationNs = std::int64_t(101) * 10'000'000;
            particle.mBirthTimeNs = 0 - (990'000'000);
            Require(draw(false,0)==last,"Particle lifetime animation selected the wrong frame");
            particle.mBirthTimeNs = 0 - (0);
            Require(draw(false,0)==first,"Particle lifetime animation did not return to frame zero");
            glasses.mAnimated=animated;
            // 61x48 logical geometry: left=.25 rounds to 15 source pixels,
            // left+right=.375 removes 23; top=.125 removes 6, and
            // top+bottom=.375 removes 18. Position keeps the original float
            // shifts (15.25,6), independently of rounded source coordinates.
            TodEmitterDefinition cropped=glasses;
            auto croppedRender = ParticleDrawReference::RenderData(glasses);
            FloatParameterTrackNode clipNodes[]{
                {0,.25f,.25f,1,1},{0,.125f,.125f,1,1},
                {0,.125f,.125f,1,1},{0,.25f,.25f,1,1}};
            croppedRender.mClipLeft={&clipNodes[0],1};
            croppedRender.mClipRight={&clipNodes[1],1};
            croppedRender.mClipTop={&clipNodes[2],1};
            croppedRender.mClipBottom={&clipNodes[3],1};
            struct RestoreEmitterDefinition {
                TodParticleEmitter* emitter;
                TodEmitterDefinition* original;
                ~RestoreEmitterDefinition() { emitter->mEmitterDef=original; }
            } restoreEmitter{emitter,emitter->mEmitterDef};
            ParticleDrawReference::BindRenderData(cropped,croppedRender);
            emitter->mEmitterDef=&cropped;
            particle.mImageFrame=3;
            Require(draw(false,0,true)==draw(true,3,true),
                "Particle UV crop changed rounded pixels or logical center shifts");
        }
        ParticleDrawReference::ClearRenderDefinitions();
        TodParticleFreeDefinitions();
        Require(!gParticleDefArray && !gParticleDefCount && !gParticleAllDefinitionDataLoaded.load(),
            "Public particle free left published definition state");
        DefinitionFreeAtlasImages();
        TodParticleLoadDefinitions(gLawnParticleArray,ParticleEffect::NUM_PARTICLES);
        Require(gParticleDefArray[fireEffect].mVariantCount==2 &&
            gParticleDefArray[fireEffect].mTextures[1],
            "Repeated particle load lost a root appearance atlas");
        const auto& reloaded=gParticleDefArray[fireEffect];
        Require(reloaded.mEmitterDefCount==emitterCount && reloaded.mImageRectCount==rectangleCount &&
            std::equal(originalRectangles.begin(),originalRectangles.end(),reloaded.mImageRects,
                [](const TextureRegion& a,const TextureRegion& b) {
                    return a.mU0==b.mU0 && a.mV0==b.mV0 && a.mU1==b.mU1 && a.mV1==b.mV1 &&
                        a.mWidth==b.mWidth && a.mHeight==b.mHeight;
                }) &&
            reloaded.mEmitterDefs[0].mParticleDuration.mCountNodes==int(originalDurationNodes.size()) &&
            std::equal(originalDurationNodes.begin(),originalDurationNodes.end(),
                reloaded.mEmitterDefs[0].mParticleDuration.mNodes,
                [](const FloatParameterTrackNode& a,const FloatParameterTrackNode& b) {
                    return a.mTime==b.mTime && a.mLow==b.mLow && a.mHigh==b.mHigh &&
                        a.mCurveType==b.mCurveType && a.mDistribution==b.mDistribution;
                }),
            "Repeated compiled particle load changed emitter, geometry or track values");
        ParticleDrawReference::ClearRenderDefinitions();
        TodParticleFreeDefinitions();
        DefinitionFreeAtlasImages();
    }
    catch (...)
    {
        ParticleDrawReference::ClearRenderDefinitions();
        TodParticleFreeDefinitions();
        DefinitionFreeAtlasImages();
        throw;
    }
    ResourceLoadingShutdown(app);
    std::cout<<"PASS static production particles: catalog validation, flat appearance rows, shared behavior, "
        "fire/ice dimensions and pixels, no-image, logical frames, sunglasses override, frame clamps, "
        "animation pixels, repeated load and release\n";
}
void TitleGrassRevealPixels(TestApp& app)
{
    auto& render=*app.mDDInterface->mRenderInterface;
    constexpr unsigned int grassColor=0xff29b74d;
    Image grass, transparent;
    std::vector<unsigned int> grassBits(314*8,grassColor);
    unsigned int clear=0;
    grass.SetBits(grassBits.data(),314,8);
    transparent.SetBits(&clear,1,1);
    EffectSystem effects;
    effects.EffectSystemInitialize();
    struct RestoreTitleWorld {
        TestApp& app;
        EffectSystem* effects;
        Rect bounds;
        Image* title=IMAGE_TITLESCREEN;
        Image* logo=IMAGE_PVZ_LOGO;
        Image* dirt=IMAGE_LOADBAR_DIRT;
        Image* grass=IMAGE_LOADBAR_GRASS;
        Image* cap=IMAGE_REANIM_SODROLLCAP;
        ~RestoreTitleWorld() {
            app.mEffectSystem=effects;
            app.mScreenBounds=bounds;
            IMAGE_TITLESCREEN=title;
            IMAGE_PVZ_LOGO=logo;
            IMAGE_LOADBAR_DIRT=dirt;
            IMAGE_LOADBAR_GRASS=grass;
            IMAGE_REANIM_SODROLLCAP=cap;
        }
    } restore{app,app.mEffectSystem,app.mScreenBounds};
    app.mEffectSystem=&effects;
    app.mScreenBounds=Rect(0,0,800,600);
    IMAGE_TITLESCREEN=IMAGE_PVZ_LOGO=IMAGE_LOADBAR_DIRT=IMAGE_REANIM_SODROLLCAP=&transparent;
    IMAGE_LOADBAR_GRASS=&grass;
    TitleScreen title(&app);
    title.mTitleState=TITLESTATE_SCREEN;
    title.mLoaderScreenIsLoaded=true;
    title.mNeedToInit=false;
    title.mLoadingThreadComplete=false;
    title.mWidth=800;
    title.mHeight=600;
    title.mStartButton->mX=240;
    title.mStartButton->mY=300;
    std::unique_ptr<Image> target(render.CreateRenderImage(800,600));
    for (const Point translation:{Point(0,0),Point(13,9)})
        for (const int width:{0,1,157,313,314,400})
        {
            title.mCurBarWidth=static_cast<float>(width);
            {
                GpuImageDrawScope destination(render,target.get());
                Graphics graphics(target.get());
                graphics.mColor=Color::Black;
                graphics.FillRect(Rect(0,0,800,600));
                graphics.Translate(translation.mX,translation.mY);
                title.Draw(&graphics);
            }
            const auto pixels=render.ReadImagePixels(*target).pixels;
            const int startX=240+translation.mX, startY=283+translation.mY;
            // Check every pixel of all lawn rows, including both sides of the
            // revealed edge. The production Draw selects the source region.
            for (int y=startY; y<startY+8; ++y)
                for (int x=0; x<800; ++x)
                    Require(pixels[y*800+x]==
                        (x>=startX && x<startX+std::min(width,314) ? grassColor : 0xff000000),
                        "TitleScreen grass appeared beyond its revealed animation width");
        }
    std::cout<<"PASS actual TitleScreen grass reveal: widths 0/1/157/313/314/400, translated draw and unrevealed black pixels\n";
}

void PrecomputedTransparentEdges(TestApp& app)
{
    auto& render = *app.mDDInterface->mRenderInterface;
    constexpr int width = 9, height = 7;
    std::array<unsigned int, width * height> pixels;
    for (unsigned int i = 0; i < pixels.size(); ++i)
        pixels[i] = ((i % 4 == 0 ? 0u : (i % 3 == 0 ? 97u : 255u)) << 24) |
            (((i * 71) & 255) << 16) | (((i * 53) & 255) << 8) | ((i * 137) & 255);
    Image original, repaired;
    original.SetBits(pixels.data(), width, height);
    repaired.SetBits(pixels.data(), width, height);
    original.mGpuSamplingFlags |= GpuVertex::kAlphaEdgeFilter;
    FixPixelsOnAlphaEdgeForBlending(&repaired);
    Require(repaired.mGpuSamplingFlags == 0, "Plain loading image retained runtime sanding");
    for (unsigned int i = 0; i < pixels.size(); ++i)
        Require((pixels[i] >> 24) ? repaired.mPendingDecoded->mBits[i] == pixels[i] :
            (repaired.mPendingDecoded->mBits[i] >> 24) == 0,
            "Edge repair changed visible pixels or alpha");
    // A second loading pass must not propagate hidden RGB into later neighbors.
    const std::vector<unsigned int> once(repaired.mPendingDecoded->mBits,
        repaired.mPendingDecoded->mBits + pixels.size());
    FixPixelsOnAlphaEdgeForBlending(&repaired);
    Require(std::equal(once.begin(), once.end(), repaired.mPendingDecoded->mBits),
        "Edge repair was not idempotent");
    std::unique_ptr<Image> target(render.CreateRenderImage(73, 61));
    for (bool linear : {false, true})
        for (float offset : {0.f, .375f})
        {
            const auto capture = [&](Image& source) {
                {
                    GpuImageDrawScope destination(render, target.get());
                    Graphics graphics(target.get());
                    graphics.mColor = Color(35, 71, 109, 255);
                    graphics.FillRect(Rect(0, 0, 73, 61));
                    graphics.mLinearBlend = linear;
                    TodDrawImageRectScaledF(&graphics, &source, 5.f + offset, 4.f + offset,
                        Rect(0, 0, width, height), 6.125f, 5.375f);
                }
                return render.ReadImagePixels(*target).pixels;
            };
            const auto expected = capture(original), actual = capture(repaired);
            for (unsigned int i = 0; i < actual.size(); ++i)
                for (unsigned int shift : {0u, 8u, 16u, 24u})
                    Require(std::abs(int((actual[i] >> shift) & 255) -
                        int((expected[i] >> shift) & 255)) <= 2,
                        "Precomputed edge repair differs from shader reference");
        }
    Require(!repaired.mPendingDecoded, "Repaired image retained loading pixels after upload");
    std::cout << "PASS precomputed transparent edges: alpha, visible RGB, idempotency, nearest/linear, upload-discard\n";
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
#if defined(PVZ_GPU_OPENGL) || defined(PVZ_GPU_D3D9) || defined(PVZ_GPU_D3D12)
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
        WrappedTextMeasurements();
        PoolGpuChecks::Run(*app.mDDInterface->mRenderInterface->mRenderer);
        PrecomputedTransparentEdges(app);
        FontUploadAndCopies(app);
        SourceRectangleDraws(app);
        NecessaryLocalClipDraws(app);
        TitleGrassRevealPixels(app);
        AtlasButtonStates(app);
        SharedReferences(app);
        ReanimationAppearancePixels(app);
        ReanimationFullscreenPixels(app);
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
