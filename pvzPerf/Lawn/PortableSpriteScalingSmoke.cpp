#include "ModernVulkanSmoke.h"
#include "LawnApp.h"
#include "Resources.h"
#include "Board.h"
#include "Plant.h"
#include "Zombie.h"
#include "Widget/Almanac.h"
#include "CursorObject.h"
#include "ZenGarden.h"
#include "Sexy.TodLib/TodCommon.h"
#include "Sexy.TodLib/Reanimator.h"
#include "Sexy.TodLib/EffectSystem.h"
#include "graphics/DDInterface.h"
#include "graphics/DDImage.h"
#include "graphics/Graphics.h"
#include "graphics/MemoryImage.h"
#include "graphics/RenderInterface.h"
#include "imagelib/ImageLib.h"
#include "misc/ResourceManager.h"
#include <algorithm>
#include <array>
#include <cmath>
#include <fstream>
#include <stdexcept>

namespace
{
using namespace Sexy;
constexpr uint32_t background = 0xff121a22u;
void ProbeUploadDiscard(LawnApp& app)
{
    auto& render=*app.mDDInterface->mRenderInterface;
    render.Flush();
    std::ofstream log(ModernSmoke::ProbePath("cpu-bitmap-upload-discard.txt"));
    const std::array<uint32_t,4> expected{0xff124578u,0x802468acu,0x00aabbccu,0xffffffffu};
    for (bool staticApi:{false,true})
    {
        MemoryImage image;
        image.Create(2,2);
        std::copy(expected.begin(),expected.end(),image.GetBits());
        image.BitsChanged();
        image.mPurgeBits=false;
        const bool uploaded=staticApi?render.CreateImageTextureStatic(&image,UINT32_MAX):
            render.CreateImageTexture(&image);
        if (!uploaded || image.mBits || image.mColorTable || image.mColorIndices ||
            image.mPendingDecoded)
            throw std::runtime_error("Lazy resource upload exposed retained CPU pixels");
        const auto pixels=render.ReadImagePixels(image);
        if (!std::equal(expected.begin(),expected.end(),pixels.pixels.begin()))
            throw std::runtime_error("Discarding CPU pixels changed uploaded GPU content");
        bool rejected=false;
        try { image.GetBits(); }
        catch (const GpuImageCpuAccess&) { rejected=true; }
        if (!rejected)
            throw std::runtime_error("Uploaded resource allowed runtime CPU pixels");
        log<<"api="<<(staticApi?"static-no-fixed-slot":"dynamic")
            <<" purge-request=0 retained-cpu-pixels=0 gpu-differences=0 cpu-read-rejected=1\n";
    }
    unsigned resident=0;
    for(auto* resource:app.mResourceManager->mResourceSlots) {
        if(!resource || resource->mType!=ResourceManager::ResType_Image) continue;
        MemoryImage* image=static_cast<ResourceManager::ImageRes*>(resource)->mImage;
        if(!image || !image->mD3DData) continue;
        if(image->mBits || image->mColorTable || image->mColorIndices || image->mPendingDecoded)
            throw std::runtime_error("Resident resource retained CPU bitmap storage");
        ++resident;
    }
    log<<"resident-resources="<<resident<<" retained-cpu-pixels=0\n";
    ModernSmoke::Report("cpu-bitmap-upload-both-apis-discard-and-gpu-pixels",app);
}
uint32_t SpriteColor(int col, int row, int quarterX, int quarterY)
{
    const int frame = col + row * 2, quarter = quarterX + quarterY * 2;
    return 0xff000000u | ((32 + frame * 40 + quarterX * 13) << 16) |
        ((28 + quarter * 38) << 8) | (40 + frame * 20 + quarterY * 55);
}
void Clear(LawnApp& app)
{
    app.mDDInterface->mScreenImage->FillRect(Rect(0, 0, 800, 600), Color(18, 26, 34), 0);
}
struct Case
{
    bool floating;
    int col, row, x, y;
    float sx, sy;
    int tx = 0, ty = 0;
    Rect clip{0, 0, 800, 600};
};
bool Check(LawnApp& app, MemoryImage& spriteSheet, const Case& test, std::ostream& log)
{
    auto& render = *app.mDDInterface->mRenderInterface;
    Clear(app);
    Graphics graphics(app.mDDInterface->mScreenImage);
    graphics.mTransX = float(test.tx); graphics.mTransY = float(test.ty);
    graphics.mClipRect = test.clip;
    graphics.mFastStretch = true;
    if (test.floating)
        TodDrawImageCelScaledF(&graphics, &spriteSheet, float(test.x), float(test.y), test.col, test.row, test.sx, test.sy);
    else
        TodDrawImageCelScaled(&graphics, &spriteSheet, test.x, test.y, test.col, test.row, test.sx, test.sy);
    render.Flush();
    const auto pixels = render.mRenderer->ReadScenePixels();
    const float width = test.floating ? 256 * test.sx : float(std::lround(256 * test.sx));
    const float height = test.floating ? 256 * test.sy : float(std::lround(256 * test.sy));
    const float originX = float(test.x + test.tx), originY = float(test.y + test.ty);
    unsigned checked = 0, mismatches = 0;
    int firstX = -1, firstY = -1; uint32_t firstActual = 0, firstExpected = 0;
    for (int y = 0; y < 600; ++y) for (int x = 0; x < 800; ++x)
    {
        const float px = x + 0.5f, py = y + 0.5f;
        // Ignore only a two-pixel band at geometric/colour discontinuities:
        // the float helper deliberately uses linear filtering, not nearest.
        if (std::abs(px - originX) < 2 || std::abs(px - originX - width) < 2 ||
            std::abs(py - originY) < 2 || std::abs(py - originY - height) < 2) continue;
        const float u = (px - originX) / width, v = (py - originY) / height;
        const bool inside = u >= 0 && u < 1 && v >= 0 && v < 1 && test.clip.Contains(x, y);
        uint32_t expected = background;
        if (inside)
        {
            if (std::abs((u - 0.5f) * width) < 2 || std::abs((v - 0.5f) * height) < 2) continue;
            expected = SpriteColor(test.col, test.row, u >= 0.5f, v >= 0.5f);
        }
        ++checked;
        const auto actual = pixels.at(size_t(y) * 800 + x);
        if (actual != expected)
        {
            if (!mismatches) { firstX = x; firstY = y; firstActual = actual; firstExpected = expected; }
            ++mismatches;
        }
    }
    log << (test.floating ? "float" : "integer") << " frame=" << test.col << ',' << test.row
        << " scale=" << test.sx << ',' << test.sy << " translation=" << test.tx << ',' << test.ty
        << " pixels=" << checked << " mismatches=" << mismatches;
    if (mismatches) log << " first=" << firstX << ',' << firstY << " actual=" << std::hex << firstActual << " expected=" << firstExpected << std::dec;
    log << std::endl;
    return checked > 400000 && mismatches == 0;
}
void WaveFrames(LawnApp& app, std::ostream& log)
{
    auto* waves = IMAGE_WAVESIDE;
    if (!waves || waves->mNumCols != 1 || waves->mNumRows < 2 || waves->GetCelWidth() != 160)
        throw std::runtime_error("Unexpected original WAVESIDE strip layout");
    auto& render = *app.mDDInterface->mRenderInterface;
    for (int frame = 0; frame < waves->mNumRows; ++frame)
    {
        Clear(app);
        Graphics graphics(app.mDDInterface->mScreenImage);
        graphics.mDrawMode = Graphics::DRAWMODE_ADDITIVE;
        graphics.DrawImageCel(waves, 0, 40, frame);
        TodDrawImageCelScaled(&graphics, waves, 800, 40, 0, frame, -1, 1);
        render.Flush();
        const auto pixels = render.mRenderer->ReadScenePixels();
        unsigned mismatches = 0, changed = 0;
        for (int y = 40; y < 40 + waves->GetCelHeight(); ++y) for (int x = 0; x < 160; ++x)
        {
            const auto left = pixels.at(size_t(y) * 800 + x);
            const auto right = pixels.at(size_t(y) * 800 + 799 - x);
            changed += left != background;
            for (int shift : {0, 8, 16})
                if (std::abs(int((left >> shift) & 255) - int((right >> shift) & 255)) > 1) { ++mismatches; break; }
        }
        log << "wave frame=" << frame << " changed=" << changed << " mirrored-mismatches=" << mismatches << std::endl;
        if (!changed || mismatches) throw std::runtime_error("Aquarium right wave is not the mirrored original frame");
    }
    ModernSmoke::Report("portable-sprite-scaling-all-water-frames-mirrored", app);
}

void ZenPlacementShadows(LawnApp& app, std::ostream& log)
{
    // Exercise the production caller implicated in Portable 14a785a, without
    // loading or changing a user's Zen Garden inventory or sending OS input.
    ZenGarden garden;
    garden.mBoard = app.mBoard; garden.mGardenType = GARDEN_AQUARIUM;
    const auto grids = garden.GetSpecialGridPlacements();
    const int count = static_cast<int>(grids.size());
    if (count != 8) throw std::runtime_error("Unexpected aquarium garden placement count");
    for (int i = 0; i < count; ++i)
        if (app.mBoard->GetTopPlantAt(grids[i].mGridX, grids[i].mGridY, TOPPLANT_ZEN_TOOL_ORDER))
            throw std::runtime_error("Garden shadow probe needs eight unoccupied cells");
    auto& cursor = *app.mBoard->mCursorObject;
    struct RestoreCursor { CursorObject& cursor; CursorType old; ~RestoreCursor() { cursor.mCursorType = old; } } restore{cursor, cursor.mCursorType};
    auto& render = *app.mDDInterface->mRenderInterface;
    auto* shadow = IMAGE_PLANTSHADOW;
    const Rect source(0, 0, shadow->GetCelWidth(), shadow->GetCelHeight());
    for (auto type : {CURSOR_TYPE_NORMAL, CURSOR_TYPE_PLANT_FROM_WHEEL_BARROW,
        CURSOR_TYPE_WHEEELBARROW, CURSOR_TYPE_PLANT_FROM_GLOVE})
    {
        cursor.mCursorType = type;
        Clear(app);
        Graphics graphics(app.mDDInterface->mScreenImage);
        garden.DrawBackdrop(&graphics);
        render.Flush(); const auto actual = render.mRenderer->ReadScenePixels();
        Clear(app);
        if (type != CURSOR_TYPE_NORMAL)
            for (int i = 0; i < count; ++i)
            {
                const Rect destination(grids[i].mPixelX - 35, grids[i].mPixelY + 33,
                    int(std::lround(source.mWidth * 1.7f)), int(std::lround(source.mHeight * 1.7f)));
                graphics.DrawImage(shadow, destination, source);
            }
        render.Flush(); const auto expected = render.mRenderer->ReadScenePixels();
        unsigned changed = 0;
        for (auto pixel : expected) changed += pixel != background;
        log << "garden cursor=" << int(type) << " changed=" << changed << " exact=" << (actual == expected) << std::endl;
        if (actual != expected || ((type == CURSOR_TYPE_NORMAL) != (changed == 0)))
            throw std::runtime_error("Actual aquarium garden placement shadow draw is incorrect");
    }
    ModernSmoke::Report("portable-sprite-scaling-actual-zen-placement-shadows", app);
}
}

void ModernSmoke::ProbeSpriteScaling(LawnApp& app)
{
    std::ofstream log(ProbePath("sprite-scaling-cases.txt"));
    if (!log) throw std::runtime_error("Cannot write sprite scaling evidence");
    auto* screen = app.mDDInterface->mScreenImage;
    const auto* cpuBits = screen->mBits;
    const auto cpuVersion = screen->mBitsChangedCount;
    MemoryImage spriteSheet;
    spriteSheet.Create(512, 512); spriteSheet.mNumCols = spriteSheet.mNumRows = 2;
    auto* bits = spriteSheet.GetBits();
    for (int y = 0; y < 512; ++y) for (int x = 0; x < 512; ++x)
        bits[size_t(y) * 512 + x] = SpriteColor(x / 256, y / 256, (x % 256) / 128, (y % 256) / 128);
    spriteSheet.BitsChanged();
    bool integerPassed = true, floatPassed = true;
    // These first integer inputs remain legal source rectangles even with the
    // old reversed arguments, so the negative run can report both defects.
    for (int row = 0; row < 2; ++row) for (int col = 0; col < 2; ++col)
    {
        integerPassed &= Check(app, spriteSheet, {false, col, row, 80, 80, 0.5f, 0.5f}, log);
        floatPassed &= Check(app, spriteSheet, {true, col, row, 80, 80, 1, 1}, log);
        floatPassed &= Check(app, spriteSheet, {true, col, row, 80, 80, 0.5f, 0.5f}, log);
    }
    if (!integerPassed || !floatPassed)
        throw std::runtime_error("Sprite scaling source/destination or row mismatch; see sprite-scaling-cases.txt");
    bool extraPassed = true;
    for (bool floating : {false, true})
    {
        for (auto [sx, sy] : std::array{std::pair{1.7f, 1.7f}, std::pair{-0.5f, 0.5f},
            std::pair{0.5f, -0.5f}, std::pair{-0.5f, -0.5f}, std::pair{0.25f, 0.5f}})
            extraPassed &= Check(app, spriteSheet, {floating, 1, 1, 300, 240, sx, sy}, log);
        extraPassed &= Check(app, spriteSheet, {floating, 1, 1, 80, 80, 0.5f, 0.5f, 14, 9, Rect(110, 90, 80, 120)}, log);
    }
    if (!extraPassed) throw std::runtime_error("Sprite scaling mirror/clip/translation regression");
    if (screen->mBits != cpuBits || screen->mBitsChangedCount != cpuVersion)
        throw std::runtime_error("Sprite scaling unexpectedly wrote a CPU screen canvas");
    Report("portable-sprite-scaling-24-gpu-cases", app);
    WaveFrames(app, log);
    ZenPlacementShadows(app, log);
}

void PortableShadowSmoke(LawnApp& app)
{
    ProbeUploadDiscard(app);
    const auto require=[](bool ok,const char* message) { if(!ok) throw std::runtime_error(message); };
    require(app.mBoard && getenv("PVZ_MODERN_HIDDEN"),"Shadow probe needs isolated gameplay");
    auto& render=*app.mDDInterface->mRenderInterface;
    auto* screen=app.mDDInterface->mScreenImage;
    std::ofstream log(ModernSmoke::ProbePath("actor-shadows.txt"));
    require(bool(log),"Cannot write actor shadow evidence");
    struct Restore {
        LawnApp& app;
        BackgroundType background;
        GameScenes scene;
        bool paused;
        ~Restore() { app.mBoard->mBackground=background;app.mGameScene=scene;app.mBoard->mPaused=paused; }
    } restore{app,app.mBoard->mBackground,app.mGameScene,app.mBoard->mPaused};
    app.mGameScene=SCENE_PLAYING;
    const auto pixels=[&](auto draw) {
        screen->FillRect(Rect(0,0,800,600),Color(180,200,220),Graphics::DRAWMODE_NORMAL);
        Graphics g(screen);
        g.Translate(160,160);
        draw(g);
        render.Flush();
        return render.mRenderer->ReadScenePixels();
    };
    const auto blank=pixels([](Graphics&){});
    unsigned cases=0;
    for (bool night : {false,true}) {
        app.mBoard->mBackground=night?BACKGROUND_2_NIGHT:BACKGROUND_1_DAY;
        auto* image=static_cast<MemoryImage*>(night?IMAGE_PLANTSHADOW2:IMAGE_PLANTSHADOW);
        require(image && image->mWidth==86 && image->mHeight==36,"Wrong plant/zombie shadow resource binding");
        std::unique_ptr<ImageLib::Image> source(ImageLib::GetImage(
            night?"images/plantshadow2.png":"images/plantshadow.png",false));
        require(source && source->mWidth==image->mWidth && source->mHeight==image->mHeight,
            "Original shadow image source missing");
        require(!image->mBits && !image->mColorTable && image->mD3DData,
            "Resident shadow retained a CPU bitmap");
        std::unique_ptr<DDImage> fresh(app.GetImage(image->mFilePath,true));
        require(fresh && fresh->mBits,"Fresh shadow decode is missing");
        log<<"fresh-decode first="<<std::hex<<fresh->mBits[0]<<std::dec<<std::endl;
        fresh->mPurgeBits=true;
        render.CreateImageTexture(fresh.get());
        const auto freshPixels=render.ReadImagePixels(*fresh);
        log<<"fresh-gpu first="<<std::hex<<freshPixels.pixels[0]<<std::dec<<std::endl;
        for(size_t i=0;i<freshPixels.pixels.size();++i)
            require(freshPixels.pixels[i]==source->mBits[i],"Fresh shadow GPU upload changed PNG bytes");
        auto* data=static_cast<TextureData*>(fresh->mD3DData);
        auto* texture=data->mTexture;
#if defined(PVZ_GPU_D3D12)
        const auto before=render.mRenderer->textureUploadCounts;
#else
        const auto before=render.mRenderer->GetTextureUploadCounts();
#endif
        render.CreateImageTexture(fresh.get());
#if defined(PVZ_GPU_D3D12)
        const auto after=render.mRenderer->textureUploadCounts;
#else
        const auto after=render.mRenderer->GetTextureUploadCounts();
#endif
        require(data->mTexture==texture &&
            before.createdTextures==after.createdTextures && before.reusedUpdates==after.reusedUpdates,
            "Resident shadow upload check rebuilt its texture");
        require(!fresh->mBits && data->mTexture==texture &&
            render.ReadImagePixels(*fresh).pixels==freshPixels.pixels,
            "Resident shadow upload check destroyed or replaced pixels");
        const auto uploaded=render.ReadImagePixels(*image);
        unsigned visible=0,maxAlpha=0;
        log<<"resident night="<<night<<" path="<<image->mFilePath<<" forced="<<image->mForcedMode
            <<" alpha="<<image->mHasAlpha<<" trans="<<image->mHasTrans
            <<" cpu="<<(image->mBits!=nullptr)<<std::endl;
        for(size_t i=0;i<uploaded.pixels.size();++i) {
            if(uploaded.pixels[i]!=source->mBits[i])
                log<<"first-difference pixel="<<i<<" resident="<<std::hex<<uploaded.pixels[i]
                    <<" png="<<source->mBits[i]<<std::dec<<std::endl;
            require(uploaded.pixels[i]==source->mBits[i],"Resident shadow pixels differ from original PNG");
            visible+=(uploaded.pixels[i]>>24)!=0;
            maxAlpha=std::max(maxAlpha,unsigned(uploaded.pixels[i]>>24));
        }
        require(visible>1000 && maxAlpha==(night?64u:128u),"Shadow image lost its visible alpha mask");
        log<<"asset night="<<night<<" visible="<<visible<<" max-alpha="<<maxAlpha<<" exact=1\n";
        DataArray<Plant> plants;plants.DataArrayInitialize(1,DataArrayKind::Plants);
        auto* plant=plants.DataArrayAlloc();
        plant->mIsOnBoard=true;
        for(auto type:{SEED_PEASHOOTER,SEED_TALLNUT}) {
            plant->mSeedType=type;
            const auto actual=pixels([&](Graphics& g){plant->DrawShadow(&g,0,0);});
            unsigned darker=0;
            for(size_t i=0;i<actual.size();++i)
                darker+=((actual[i]>>16)&255)<((blank[i]>>16)&255);
            log<<"plant night="<<night<<" type="<<int(type)<<" darker="<<darker<<std::endl;
            require(darker>500,"Production plant shadow did not darken the GPU scene");
            ++cases;
        }
        DataArray<Zombie> zombies;zombies.DataArrayInitialize(1,DataArrayKind::Zombies);
        auto* zombie=zombies.DataArrayAlloc();
        zombie->mZombieType=ZOMBIE_NORMAL;zombie->mZombieHeight=HEIGHT_ZOMBIE_NORMAL;
        zombie->mZombiePhase=PHASE_ZOMBIE_NORMAL;zombie->mScaleZombie=1;
        require(zombie->HasShadow(),"Ordinary zombie incorrectly suppresses its shadow");
        for(float scale:{1.0f,1.5f}) {
            zombie->mScaleZombie=scale;
            const auto actual=pixels([&](Graphics& g){zombie->DrawShadow(&g);});
            unsigned darker=0;
            for(size_t i=0;i<actual.size();++i)
                darker+=((actual[i]>>16)&255)<((blank[i]>>16)&255);
            log<<"zombie night="<<night<<" scale="<<scale<<" darker="<<darker<<std::endl;
            require(darker>500,"Production zombie shadow did not darken the GPU scene");
            ++cases;
        }
    }
    require(cases==8,"Actor shadow coverage incomplete");
    ModernSmoke::Report("portable-actor-shadows-eight-real-draws-original-alpha-darken-gpu",app);
    app.mBoard->mPaused=true;
    AlmanacDialog almanac(&app);
    const auto almanacPixels=[&] {
        screen->FillRect(Rect(0,0,800,600),Color(180,200,220),Graphics::DRAWMODE_NORMAL);
        Graphics g(screen);
        almanac.Draw(&g);
        render.Flush();
        return render.mRenderer->ReadScenePixels();
    };
    MemoryImage transparent(&app);
    transparent.Create(1,1);transparent.mPurgeBits=true;
    render.CreateImageTexture(&transparent);
    for (const auto page : {ALMANAC_PAGE_INDEX,ALMANAC_PAGE_ZOMBIES}) {
        almanac.SetPage(page);
        // Page setup assigns mPos; the ordinary update synchronizes the local clip origin.
        almanac.Update();
        const auto actual=almanacPixels();
        std::vector<std::uint32_t> noShadow;
        {
            struct RestoreShadow {
                Image* old;
                ~RestoreShadow() { IMAGE_PLANTSHADOW=old; }
            } restoreShadow{IMAGE_PLANTSHADOW};
            IMAGE_PLANTSHADOW=&transparent;
            noShadow=almanacPixels();
        }
        require(actual.size()==480000 && noShadow.size()==actual.size(),
            "Almanac shadow GPU capture is incomplete");
        const Rect area=page==ALMANAC_PAGE_INDEX?Rect(24,180,372,240):Rect(518,110,197,187);
        unsigned darker=0;
        for(int y=area.mY;y<area.mY+area.mHeight;++y) for(int x=area.mX;x<area.mX+area.mWidth;++x) {
            const auto i=size_t(y)*800+x;
            darker+=((actual[i]>>16)&255)<((noShadow[i]>>16)&255);
        }
        log<<"almanac-page="<<int(page)
            <<(page==ALMANAC_PAGE_INDEX?" plant-shadow-darker=":" zombie-shadow-darker=")<<darker
            <<" negative-control=transparent-gpu-texture"<<std::endl;
        require(darker>100,page==ALMANAC_PAGE_INDEX?
            "Almanac index omitted the live plant shadow":
            "Almanac detail omitted the live zombie shadow");
        ModernSmoke::Report(page==ALMANAC_PAGE_INDEX?
            "portable-almanac-index-live-plant-shadow-positive-negative-gpu":
            "portable-almanac-detail-live-zombie-shadow-positive-negative-gpu",app);
    }
}
