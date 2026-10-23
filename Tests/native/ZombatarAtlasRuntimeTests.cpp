#include "LawnApp.h"
#include "Lawn/Widget/ZombatarItems.h"
#include "SexyAppFramework/graphics/DDInterface.h"
#include "SexyAppFramework/graphics/Graphics.h"
#include "SexyAppFramework/graphics/RenderInterface.h"
#include "SexyAppFramework/imagelib/ImageLib.h"
#include "SexyAppFramework/paklib/PakInterface.h"
#include "SexyAppFramework/widget/WidgetManager.h"
#include "Sexy.TodLib/DefinitionImageRegion.h"
#include "Sexy.TodLib/TodCommon.h"
#include "Resources.h"
#include <algorithm>
#include <array>
#include <fstream>
#include <functional>
#include <iostream>
#include <memory>
#include <stdexcept>
#include <string>
#include <vector>

bool FixtureCloseRequest() { return false; }
bool (*gAppCloseRequest)() = FixtureCloseRequest;

namespace
{
using namespace Sexy;
void Require(bool value, const char* message)
{
    if (!value) throw std::runtime_error(message);
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
class HiddenWindow
{
public:
    HWND handle = nullptr;
    HiddenWindow()
    {
        WNDCLASSW type{};
        type.style=CS_OWNDC; type.lpfnWndProc=DefWindowProcW;
        type.hInstance=GetModuleHandleW(nullptr);
        type.lpszClassName=L"PvzZombatarAtlasTests";
        Require(RegisterClassW(&type)!=0,"Cannot register hidden fixture window");
        handle=CreateWindowExW(0,type.lpszClassName,L"Zombatar atlas tests",
            WS_POPUP,0,0,64,64,nullptr,nullptr,type.hInstance,nullptr);
        Require(handle!=nullptr,"Cannot create hidden fixture window");
    }
    ~HiddenWindow()
    {
        if (handle) DestroyWindow(handle);
        UnregisterClassW(L"PvzZombatarAtlasTests",GetModuleHandleW(nullptr));
    }
};

struct Original
{
    std::string name;
    std::unique_ptr<Image> image;
};
std::vector<Original> LoadOriginals(SexyAppBase& app, const char* manifest)
{
    std::ifstream input(manifest);
    Require(bool(input),"Cannot read independent source manifest");
    std::vector<Original> originals;
    std::string name,path,alpha;
    while (std::getline(input,name,'\t') && std::getline(input,path,'\t') &&
           std::getline(input,alpha))
    {
        auto image=std::make_unique<Image>(&app);
        auto* decoded=ImageLib::GetImage(path,alpha=="1");
        if (!decoded) throw std::runtime_error("Cannot decode reference image: "+path);
        image->AdoptDecodedImage(decoded);
        app.mDDInterface->mRenderInterface->CreateImageTexture(image.get());
        originals.push_back({name,std::move(image)});
    }
    Require(originals.size()==209,"Independent source manifest must contain all209 images");
    return originals;
}

class PixelComparison
{
    RenderInterface& render;
    std::unique_ptr<Image> target;
    int width,height;
public:
    explicit PixelComparison(SexyAppBase& app,int targetWidth=256,int targetHeight=256)
        : render(*app.mDDInterface->mRenderInterface),
          target(render.CreateRenderImage(targetWidth,targetHeight)),
          width(targetWidth),height(targetHeight) {}

    std::vector<unsigned> Draw(const std::function<void(Graphics&)>& draw)
    {
        {
            GpuImageDrawScope destination(render,target.get());
            Graphics graphics(target.get());
            graphics.mColor=Color(31,47,61);
            graphics.FillRect(Rect(0,0,width,height));
            graphics.mColor=Color::White;
            graphics.mLinearBlend=false;
            graphics.mFastStretch=true;
            draw(graphics);
        }
        render.Flush();
        return render.ReadImagePixels(*target).pixels;
    }
    void Compare(const std::string& label,
                 const std::function<void(Graphics&)>& actual,
                 const std::function<void(Graphics&)>& expected, int tolerance=0)
    {
        const auto reference=Draw(expected), candidate=Draw(actual);
        if(candidate==reference) return;
        for (size_t i=0;i<reference.size();++i)
        {
            if(candidate[i]==reference[i]) continue;
            for (int shift:{0,8,16,24})
                if (std::abs(int((candidate[i]>>shift)&255)-
                             int((reference[i]>>shift)&255))>tolerance)
                    throw std::runtime_error(label+" pixel mismatch at "+
                        std::to_string(i%width)+","+std::to_string(i/width));
        }
    }
};

void AllImages(SexyAppBase& app, const std::vector<Original>& originals)
{
    for (size_t index=0;index<originals.size();++index)
    {
        const auto id=static_cast<ZombatarImage>(index);
        const auto& source=*originals[index].image;
        PixelComparison pixels(app,std::min(2048,source.mWidth*2+96),
            std::min(1536,source.mHeight*2+96));
        const auto& rect=gZombatarAtlas.mImages[index];
        Require(rect.mWidth==source.mWidth && rect.mHeight==source.mHeight,
            "Atlas changed original source dimensions");
        auto* image=originals[index].image.get();
        pixels.Compare(originals[index].name+" direct",
            [&](Graphics& g){ DrawZombatarImage(&g,id,11,13); },
            [&](Graphics& g){ g.DrawImage(image,11,13); });
        // Nontrivial RGB and alpha modulation exposes mask/tint differences.
        pixels.Compare(originals[index].name+" tinted translated scaled clipped",
            [&](Graphics& g){
                g.Translate(17,19); g.SetClipRect(23,29,611,419);
                g.mColorizeImages=true; g.mColor=Color(117,203,71,173);
                DrawZombatarImage(&g,id,31,37,rect.mWidth*2,rect.mHeight*2);
            },
            [&](Graphics& g){
                g.Translate(17,19); g.SetClipRect(23,29,611,419);
                g.mColorizeImages=true; g.mColor=Color(117,203,71,173);
                g.DrawImage(image,31,37,rect.mWidth*2,rect.mHeight*2);
            },1);
        const Rect local(rect.mWidth/4,rect.mHeight/5,
            std::max(1,rect.mWidth/2),std::max(1,rect.mHeight/2));
        const Rect destination(29,41,local.mWidth*2,local.mHeight*2);
        pixels.Compare(originals[index].name+" local source crop",
            [&](Graphics& g){ g.Translate(7,11); DrawZombatarImage(&g,id,destination,local); },
            [&](Graphics& g){ g.Translate(7,11); g.DrawImage(image,destination,local); },1);
        pixels.Compare(originals[index].name+" noninteger Graphics scaling with origin",
            [&](Graphics& g){
                g.Translate(17,19); g.SetScale(1.375f,.8125f,23,29);
                g.mFastStretch=false;
                DrawZombatarImage(&g,id,31,37);
            },
            [&](Graphics& g){
                g.Translate(17,19); g.SetScale(1.375f,.8125f,23,29);
                g.mFastStretch=false;
                g.DrawImage(image,31,37);
            },1);
        const Rect filtered(29,41,std::max(1,local.mWidth*3/4),std::max(1,local.mHeight*5/4));
        pixels.Compare(originals[index].name+" linear filtered local crop",
            [&](Graphics& g){
                g.Translate(7,11); g.mFastStretch=false;
                DrawZombatarImage(&g,id,filtered,local);
            },
            [&](Graphics& g){
                g.Translate(7,11); g.mFastStretch=false;
                g.DrawImage(image,filtered,local);
            },1);
    }
    PixelComparison pixels(app);
    pixels.Compare("None sentinel",
        [&](Graphics& g){ DrawZombatarImage(&g,ZombatarImage::None,0,0); },
        [](Graphics&){});
    std::cout<<"PASS all209 independently decoded reference images: direct, RGBA tint, "
        "translation, clipping, scaled draws, local source rectangles, noninteger "
        "Graphics scaling with origins and linear filtering\n";
}

void Buttons(SexyAppBase& app, const std::vector<Original>& originals)
{
    PixelComparison pixels(app);
    const auto normal=ZombatarImage::NEXT_BUTTON;
    const auto hover=ZombatarImage::NEXT_BUTTON_HIGHLIGHT;
    // Production next/previous buttons fall back to their normal art when
    // disabled. A distinct existing image also covers the optional inactive
    // and pressed-image branches without adding program-image resources.
    const auto disabled=ZombatarImage::PREV_BUTTON;
    const auto original=[&](ZombatarImage id) { return originals.at(size_t(id)).image.get(); };
    ZombatarButton button(0,normal,hover,disabled,disabled);
    button.mX=27; button.mY=33;
    for (int state=0;state<4;++state)
    {
        button.mDisabled=state==3;
        button.mIsDown=state==2;
        button.mIsOver=state==1 || state==2;
        app.mWidgetManager->mLastMouseX=state ? 28 : 0;
        app.mWidgetManager->mLastMouseY=state ? 34 : 0;
        const auto expected=state==0 ? normal : state==1 ? hover : disabled;
        pixels.Compare("Actual ZombatarButton state "+std::to_string(state),
            [&](Graphics& g){ g.Translate(7,9); button.Draw(&g);
                Require(g.mTransX==7 && g.mTransY==9,"Button leaked graphics translation"); },
            [&](Graphics& g){ g.Translate(7,9); g.DrawImage(original(expected),27,33); });
    }
    button.mDisabled=false; button.mIsDown=button.mIsOver=true;
    button.mPressedImage=ZombatarImage::None;
    pixels.Compare("Pressed button fallback offset",
        [&](Graphics& g){ button.Draw(&g); },
        [&](Graphics& g){ g.DrawImage(original(hover),28,34); });
    button.mBtnNoDraw=true;
    pixels.Compare("Hidden button", [&](Graphics& g){button.Draw(&g);},[](Graphics&){});
    std::cout<<"PASS actual button normal, hover, pressed, disabled, pressed fallback, "
        "hidden state and graphics translation restoration\n";
}

void Portraits(SexyAppBase& app, const std::vector<Original>& originals)
{
    PixelComparison pixels(app);
    const auto image=[&](ZombatarImage id){return originals.at(size_t(id)).image.get();};
    const auto reference=[&](Graphics& g,const Zombatar& record,int x,int y) {
        GraphicsAutoState restore(&g);
        auto* canvas=image(ZombatarImage::BACKGROUND_BLANK);
        g.ClipRect(x,y,canvas->mWidth,canvas->mHeight);
        g.mColorizeImages=false; g.mColor=Color::White;
        const auto drawItem=[&](const ZombatarItem& item,int page) {
            if (item.mImage==ZombatarImage::None) return;
            g.mColorizeImages=item.mColorMode!=ZOMBATAR_COLOR_NOT_APPLICABLE;
            g.mColor=g.mColorizeImages ? ZombatarGetColor(record.mColors[page]) : Color::White;
            if (item.mColorMask!=ZombatarImage::None)
            {
                g.DrawImage(image(item.mColorMask),x+item.mX+item.mMaskX,y+item.mY+item.mMaskY);
                g.mColorizeImages=false;
            }
            g.DrawImage(image(item.mImage),x+item.mX,y+item.mY);
            g.mColorizeImages=false; g.mColor=Color::White;
        };
        if (auto* backdrop=ZombatarGetItem(ZOMBATAR_CUSTOM_BACKDROPS,
                                         record.mItems[ZOMBATAR_CUSTOM_BACKDROPS]))
            drawItem(*backdrop,ZOMBATAR_CUSTOM_BACKDROPS);
        auto* skin=image(ZombatarImage::ZOMBIE_BLANK_SKIN);
        g.mColorizeImages=true;
        g.mColor=ZombatarGetColor(record.mColors[ZOMBATAR_CUSTOM_SKIN]);
        g.DrawImage(skin,x+canvas->mWidth-skin->mWidth,y+canvas->mHeight-skin->mHeight);
        auto* blank=image(ZombatarImage::ZOMBIE_BLANK);
        g.mColorizeImages=false;
        g.DrawImage(blank,x+canvas->mWidth-blank->mWidth,y+canvas->mHeight-blank->mHeight);
        std::vector<std::pair<int,const ZombatarItem*>> items;
        for(int page=ZOMBATAR_CUSTOM_CLOTHES;page<=ZOMBATAR_CUSTOM_HATS;++page)
            if(auto* item=ZombatarGetItem(static_cast<ZombatarCustomizationPage>(page),
                                        record.mItems[page])) items.emplace_back(page,item);
        std::stable_sort(items.begin(),items.end(),[](const auto& a,const auto& b){
            return a.second->mRenderGroup==b.second->mRenderGroup ?
                a.first>b.first : a.second->mRenderGroup<b.second->mRenderGroup;
        });
        for(const auto& [page,item]:items) drawItem(*item,page);
    };
    for(int variant=0;variant<12;++variant)
    {
        Zombatar record{};
        for(int page=0;page<ZOMBATAR_NUM_ZOMBATAR_CUSTOM_PAGES;++page)
        {
            record.mColors[page]=(variant+page)%12;
            record.mItems[page]=-1;
            for(int candidate=variant;candidate<variant+36;++candidate)
                if(ZombatarGetItem(static_cast<ZombatarCustomizationPage>(page),candidate))
                { record.mItems[page]=candidate; break; }
        }
        // Four is the existing valid default backdrop.
        record.mItems[ZOMBATAR_CUSTOM_BACKDROPS]=4;
        const auto saved=record;
        pixels.Compare("Actual portrait composition "+std::to_string(variant),
            [&](Graphics& g){
                g.Translate(13,17); g.mColorizeImages=true; g.mColor=Color(47,83,131,149);
                DrawZombatarPortrait(&g,record,31,37);
                Require(g.mColorizeImages && g.mColor==Color(47,83,131,149),
                    "Portrait failed to restore incoming graphics state");
            },
            [&](Graphics& g){g.Translate(13,17); reference(g,record,31,37);},1);
        Require(std::equal(std::begin(record.mItems),std::end(record.mItems),std::begin(saved.mItems)) &&
                std::equal(std::begin(record.mColors),std::end(record.mColors),std::begin(saved.mColors)),
                "Portrait drawing changed saved logical selections or palette indices");
        if(variant==11)
        {
            auto& render=*app.mDDInterface->mRenderInterface;
            std::unique_ptr<Image> exportTarget(render.CreateRenderImage(180,180));
            {
                GpuImageDrawScope destination(render,exportTarget.get());
                Graphics graphics(exportTarget.get());
                DrawZombatarPortrait(&graphics,record,0,0);
            }
            render.Flush();
            const auto exported=render.ReadImagePixels(*exportTarget);
            Require(ImageLib::WritePNGImage("zombatar-atlas-export.png",180,180,exported.pixels),
                "Portrait PNG export failed");
            std::unique_ptr<ImageLib::Image> decoded(ImageLib::GetImage("zombatar-atlas-export.png",false));
            Require(decoded && decoded->mWidth==180 && decoded->mHeight==180 &&
                std::equal(exported.pixels.begin(),exported.pixels.end(),decoded->mBits),
                "Exported portrait PNG changed GPU pixels or canvas dimensions");
        }
    }
    std::cout<<"PASS actual portrait layers, tinted masks, canvas clipping, bottom-right "
        "base alignment, graphics restoration, preserved saved logical indices/colors "
        "and 180x180 GPU-to-PNG export round trip\n";
}
}

int main(int argc,char** argv)
{
    SetErrorMode(SEM_FAILCRITICALERRORS|SEM_NOGPFAULTERRORBOX|SEM_NOOPENFILEERRORBOX);
    try
    {
        Require(argc==4,"Pass production PAK, original reference PAK, source manifest");
        HiddenWindow window;
        TestApp app;
        gLawnApp=&app;
        app.mPrimaryThreadId=CurrentNativeThreadIdentity();
        app.mScaleHDREnabled=false; app.mReadFromRegistry=false;
        app.mWidth=800; app.mHeight=600;
#if defined(PVZ_GPU_OPENGL) || defined(PVZ_GPU_D3D9)
        app.mGpuContext=std::make_unique<GpuContext>(window.handle,false,false);
#else
        VulkanInitConfig init{};
        init.appInfo.pApplicationName="Zombatar atlas tests";
        init.features.shaderFloat64=VK_TRUE;
        VkSwapchainCreateInfoKHR swapchain{
            .sType=VK_STRUCTURE_TYPE_SWAPCHAIN_CREATE_INFO_KHR,
            .imageFormat=VK_FORMAT_B8G8R8A8_UNORM,
            .imageColorSpace=VK_COLOR_SPACE_SRGB_NONLINEAR_KHR,
            .imageUsage=VK_IMAGE_USAGE_COLOR_ATTACHMENT_BIT,
            .compositeAlpha=VK_COMPOSITE_ALPHA_OPAQUE_BIT_KHR,
            .presentMode=VK_PRESENT_MODE_FIFO_KHR,.clipped=VK_TRUE};
        app.mGpuContext=std::make_unique<GpuContext>(init,window.handle,swapchain);
#endif
        app.mDDInterface=new DDInterface(&app);
        Require(app.mDDInterface->Init(window.handle,true)==DDInterface::RESULT_OK,
            "Cannot initialize GPU fixture");
        Require(gPakInterface && gPakInterface->AddPakFile(argv[2]),"Cannot mount reference PAK");
        auto originals=LoadOriginals(app,argv[3]);
        Require(gPakInterface->AddPakFile(argv[1]),"Cannot mount production PAK");
        ZombatarLoadResources();
        struct Cleanup { ~Cleanup(){ZombatarFreeResources(); DefinitionFreeAtlasImages();} } cleanup;
        Require(gZombatarAtlas.mTexture!=nullptr,"Zombatar atlas was not uploaded");
        AllImages(app,originals);
        Buttons(app,originals);
        Portraits(app,originals);
        auto* texture=gZombatarAtlas.mTexture;
        ZombatarLoadResources();
        Require(gZombatarAtlas.mTexture==texture,"Repeated load replaced live atlas");
        ZombatarFreeResources();
        Require(!gZombatarAtlas.mTexture,"Atlas release left a borrowed texture");
        ZombatarFreeResources();
        ZombatarLoadResources();
        AllImages(app,originals);
        std::cout<<"PASS repeated atlas load, release, repeated free and reload\n";
    }
    catch(const std::exception& error)
    {
        std::cerr<<"FAIL Zombatar atlas: "<<error.what()<<'\n';
        return 1;
    }
}
