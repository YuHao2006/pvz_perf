#include "PortableZombatarSmoke.h"
#include "ModernVulkanSmoke.h"
#include "LawnApp.h"
#include "ConstEnums.h"
#include "tools/saveConverter/src/LevelSaveConverter.h"
#include "Resources.h"
#include "System/PlayerInfo.h"
#include "Widget/ZombatarItems.h"
#include "Widget/ZombatarScreen.h"
#include "Widget/Almanac.h"
#include "misc/ResourceManager.h"
#include "Zombie.h"
#include "Sexy.TodLib/EffectSystem.h"
#include "Sexy.TodLib/Attachment.h"
#include "Sexy.TodLib/Reanimator.h"
#include "graphics/DDInterface.h"
#include "graphics/DDImage.h"
#include "graphics/Graphics.h"
#include "graphics/MemoryImage.h"
#include "graphics/RenderInterface.h"
#include <algorithm>
#include <array>
#include <cstring>
#include <fstream>
#include <filesystem>
#include <iterator>
#include <memory>
#include <stdexcept>
#include <vector>

namespace
{
using namespace Sexy;
void Require(bool ok, const char* why) { if (!ok) throw std::runtime_error(why); }

void OriginalProfilePairs(LawnApp& app) {
    Require(getenv("PVZ_MODERN_SMOKE") && getenv("PVZ_APPDATA_DIR"),"Profile probe requires isolated saves");
    constexpr int profileId=10730091;
    const auto dir=std::filesystem::path(GetAppDataFolder());
    const auto path=dir/"user10730091.dat", path64=dir/"user10730091.dat64";
    Require(std::filesystem::weakly_canonical(dir)==
        std::filesystem::weakly_canonical(getenv("PVZ_APPDATA_DIR")),"Profile writes escaped the isolated save root");
    Require(!std::filesystem::exists(path) && !std::filesystem::exists(path64),
        "Refusing to overwrite existing profile fixture");
    using Bytes=std::vector<unsigned char>;
    Bytes expected(886+2*72,0);
    const auto put=[&](size_t at,int value){for(unsigned b=0;b<4;++b)expected.at(at+b)=static_cast<unsigned char>(std::uint32_t(value)>>(8*b));};
    put(0,12);put(4,1); // 原版版本/核心，无盆栽
    // v12 挑战记录（槽=旧模式值-1）：槽0=v1 1 生存普通1、槽5=v1 6 生存困难1、
    // 槽49=v1 50 智慧树——覆盖记录搬运的三个落点。
    put(16,7);put(16+5*4,9);put(16+49*4,4);
    for(int i=0;i<20;++i){expected[820+2*i]=i%3==0;expected[820+2*i+1]=i%5==0;}
    expected[860]=1;put(861,2);
    std::array<Zombatar,2> records{};
    for(int i=0;i<2;++i){
        auto& r=records[i];std::fill(std::begin(r.mItems),std::end(r.mItems),-1);
        std::fill(std::begin(r.mColors),std::end(r.mColors),-1);
        r.mColors[ZOMBATAR_CUSTOM_SKIN]=3+7*i;
        r.mItems[ZOMBATAR_CUSTOM_HAIR]=i;r.mColors[ZOMBATAR_CUSTOM_HAIR]=20+12*i;
        r.mItems[ZOMBATAR_CUSTOM_BACKDROPS]=i+1;r.mColors[ZOMBATAR_CUSTOM_BACKDROPS]=47;
        for(int page=0;page<9;++page){put(865+72*i+8*page,r.mItems[page]);put(869+72*i+8*page,r.mColors[page]);}
    }
    for(int i=0;i<20;++i)expected[1009+i]=i%4==0;  // v12 小游戏槽 i=v1 模式 16+i
    expected[1029]=1;
    {std::ofstream file(path,std::ios::binary);file.write(reinterpret_cast<const char*>(expected.data()),expected.size());
        Require(bool(file),"Cannot write original-order profile fixture");}
    // 两段式第一段：手造 v12 过真转换器（LevelSaveConverter.cpp 直链进本目标）
    // → v13 dat64（PVZUSR64 魔数 + 槽序=GameMode v3 直下标）。
    const PvzDat64::UserConversionResult aConverted=PvzDat64::ConvertUserFile(path,path64);
    Require(aConverted.mSourceFormat==PvzDat64::UserFormat::LegacyUserDat &&
        aConverted.mTargetFormat==PvzDat64::UserFormat::UserDat64,"Fixture conversion direction changed");
    std::ifstream wire64(path64,std::ios::binary);
    Bytes wire{std::istreambuf_iterator<char>(wire64),std::istreambuf_iterator<char>()};
    Require(wire.size()==8+expected.size(),"Converted dat64 size changed");
    const auto at=[&](size_t off){return std::uint32_t(wire[off])|(std::uint32_t(wire[off+1])<<8)|
        (std::uint32_t(wire[off+2])<<16)|(std::uint32_t(wire[off+3])<<24);};
    Require(wire[0]=='P'&&wire[1]=='V'&&wire[2]=='Z'&&wire[3]=='U'&&wire[4]=='S'&&wire[5]=='R'&&wire[6]=='6'&&wire[7]=='4',
        "Converted dat64 lost the PVZUSR64 magic");
    Require(at(8)==13,"Converted dat64 is not detail version 13");
    constexpr size_t kRecordBase=24;  // 8 魔数 + ver/level/coins/finished
    std::array<std::uint32_t,100> wantRecords{};
    wantRecords[(int)kGameModeRemapV1ToV3[1]]=7;    // v1 1  → v3 66
    wantRecords[(int)kGameModeRemapV1ToV3[6]]=9;    // v1 6  → v3 61
    wantRecords[(int)kGameModeRemapV1ToV3[50]]=4;   // v1 50 → v3 71
    for(int slot=0;slot<100;++slot)Require(at(kRecordBase+4*slot)==wantRecords[slot],
        "Challenge records were not remapped to GameMode v3 direct slots");
    std::array<bool,20> wantMini{};
    for(int i=0;i<20;++i)wantMini[(int)kGameModeRemapV1ToV3[16+i]-1]=i%4==0;
    for(int slot=0;slot<20;++slot)Require(wire[8+1009+slot]==(wantMini[slot]?1:0),
        "Mini-game completion bits were not remapped to MINIGAME slots");
    for(int i=0;i<40;++i)Require(wire[8+820+i]==expected[820+i],"Achievement pair bytes moved");
    for(int i=0;i<2*72;++i)Require(wire[8+865+i]==expected[865+i],"Zombatar record bytes moved");
    Require(wire[8+1029]==1,"Desktop-message flag moved");
    // 两段式第二段：游戏本体只认 user%d.dat64（v13 版本门）。
    PlayerInfo decoded;decoded.mId=profileId;
    Require(decoded.LoadDetails() && !decoded.mDetailsLoadRejected && decoded.mNumZombatars==2,"Converted profile load failed");
    for(int i=0;i<20;++i)Require(decoded.mEarnedAchievements[i]==(i%3==0) &&
        decoded.mShownAchievements[i]==(i%5==0) &&
        decoded.mMiniGamesCompleted[(int)kGameModeRemapV1ToV3[16+i]-1]==(i%4==0),
        "Original achievement pair order changed");
    Require(decoded.mChallengeRecords[(int)kGameModeRemapV1ToV3[1]]==7 &&
        decoded.mChallengeRecords[(int)kGameModeRemapV1ToV3[6]]==9 &&
        decoded.mChallengeRecords[(int)kGameModeRemapV1ToV3[50]]==4,
        "Loaded v13 challenge records are not at GameMode direct slots");
    Require(decoded.mAcceptedZombatarULA && decoded.mShownZombatarDesktopMessage,"Original profile tail flags changed");
    auto& render=*app.mDDInterface->mRenderInterface;auto* screen=app.mDDInterface->mScreenImage;
    std::ofstream log(ModernSmoke::ProbePath("profile-pair-order.txt"));Require(bool(log),"Cannot write profile pair evidence");
    for(int i=0;i<2;++i){
        for(int p=0;p<9;++p)Require(decoded.mZombatars[i].mItems[p]==records[i].mItems[p] &&
            decoded.mZombatars[i].mColors[p]==records[i].mColors[p],"Original avatar item/color pair order changed");
        const auto draw=[&](const Zombatar& r){screen->FillRect(Rect(0,0,800,600),Color(17,23,31),0);
            Graphics g(screen);DrawZombatarPortrait(&g,r,260,300);render.Flush();return render.mRenderer->ReadScenePixels();};
        const auto actual=draw(decoded.mZombatars[i]),reference=draw(records[i]);
        size_t ink=0;for(auto pixel:reference)ink+=(pixel&0xffffffu)!=0x11171fu;
        Require(actual==reference && ink>100,"Reloaded original avatar GPU output differs from explicit component selection");
        log<<"avatar="<<i<<" different-pixels=0 ink="<<ink<<std::endl;
    }
    decoded.SaveDetails();
    std::ifstream back(path64,std::ios::binary);Bytes written{std::istreambuf_iterator<char>(back),std::istreambuf_iterator<char>()};
    Require(written==wire,"Game re-save diverged from the converter's dat64 bytes");
    log<<"bytes="<<written.size()<<" original-pairs=PASS converter-v13-remap=PASS game-resave-identical=PASS disk-roundtrip=PASS"<<std::endl;
    ModernSmoke::Report("portable-profile-original-pairs-disk-two-gpu-avatars",app);
}
struct RestoreRecords
{
    PlayerInfo& player;
    int count;
    std::array<Zombatar, MAX_NUM_ZOMBATARS> records;
    explicit RestoreRecords(PlayerInfo& value) : player(value), count(value.mNumZombatars)
    { std::copy(std::begin(player.mZombatars), std::end(player.mZombatars), records.begin()); }
    ~RestoreRecords()
    {
        player.mNumZombatars = count;
        std::copy(records.begin(), records.end(), std::begin(player.mZombatars));
    }
};

void ReferenceList(Graphics& g, ZombatarItems& items, PlayerInfo& player)
{
    // Independent composition of 1073 0052E710 case 4, not a second call to
    // DrawSavedZombatars. Shared portrait/button primitives are intentionally
    // outside this test's scope: this checks their list placement/state only.
    g.DrawImage(IMAGE_ZOMBATAR_WIDGET_BG, 0, 0);
    const int current = items.mSelectedZombatar;
    {
        GraphicsAutoState saved(&g);
        g.ClipRect(33, 100, items.mWidth - 63, items.mHeight - 163);
        g.mColor = Color::Black;
        g.FillRect(33, 100, items.mWidth - 63, items.mHeight - 269);
        const int width = IMAGE_ZOMBATAR_BACKGROUND_BLANK->mWidth;
        const int x = (items.mWidth - 30) / 2 + 20 - width / 2;
        DrawZombatarPortrait(&g, player.mZombatars[current], x, 150);
        if (current + 1 < player.mNumZombatars)
            DrawZombatarPortrait(&g, player.mZombatars[current + 1], x + 40 + width, 150);
        if (current > 0)
            DrawZombatarPortrait(&g, player.mZombatars[current - 1], x - 40 - width, 150);
    }
    if (current > 0) items.mPrevZombieButton->Draw(&g);
    if (current + 1 < player.mNumZombatars) items.mNextZombieButton->Draw(&g);
    if (player.mNumZombatars < MAX_NUM_ZOMBATARS) items.mNewZombieButton->Draw(&g);
    const auto& prev = *items.mPrevPageButton;
    const auto& next = *items.mNextPageButton;
    const int x = prev.mX + (next.mX - prev.mX) / 2 - 115;
    const int y = prev.mY + prev.mHeight / 2 - 230;
    g.mFont = FONT_BRIANNETOD12;
    g.mColor = Color::White;
    g.DrawString(std::to_string(current + 1) + " / " + std::to_string(player.mNumZombatars), x, y);
    g.mFont = FONT_DWARVENTODCRAFT12;
    g.mColor = items.mDeleteHovered ? Color(22, 253, 5) : Color::White;
    g.DrawString("Delete?", x + 130, y);
    items.mMainMenuButton->Draw(&g);
}

void Click(ZombatarItems& items, GameButton& button)
{
    const int x = button.mX + button.mWidth / 2, y = button.mY + button.mHeight / 2;
    items.MouseDown(x, y, 0, 1);
    items.MouseUp(x, y, 0, 1);
}
}

void PortableZombatarListSmoke(LawnApp& app)
{
    using namespace Sexy;
    Require(app.mPlayerInfo != nullptr, "Zombatar probe needs isolated profile");
    RestoreRecords restore(*app.mPlayerInfo);
    auto& player = *app.mPlayerInfo;
    for (int i = 0; i < MAX_NUM_ZOMBATARS; ++i)
    {
        auto& record = player.mZombatars[i];
        std::fill(std::begin(record.mItems), std::end(record.mItems), -1);
        std::fill(std::begin(record.mColors), std::end(record.mColors), -1);
        record.mColors[ZOMBATAR_CUSTOM_SKIN] = i % 12;
        record.mColors[ZOMBATAR_CUSTOM_BACKDROPS] = 47;
        record.mItems[ZOMBATAR_CUSTOM_BACKDROPS] = i % 5;
    }
    // No SaveCurrentZombatar/SaveDetails/export calls: even the disposable
    // records remain in memory and never write the desktop or user profile.
    std::ofstream log(ModernSmoke::ProbePath("zombatar-list-cases.txt"));
    Require(bool(log), "Cannot write Zombatar list evidence");
    ZombatarItems items(&app);
    OriginalProfilePairs(app);
    items.mState = ZombatarEditorState::BROWSING;
    auto& render = *app.mDDInterface->mRenderInterface;
    auto* screen = app.mDDInterface->mScreenImage;
    const auto* cpuBits = screen->mBits;
    const auto cpuVersion = screen->mBitsChangedCount;
    uint64_t mismatches = 0;
    unsigned cases = 0, inputCases = 0;
    auto compare = [&]()
    {
        const Rect clip(0, 0, 800, 600);
        screen->FillRect(clip, Color(18, 26, 34), 0);
        Graphics actual(screen); actual.Translate(25, 25);
        const auto originalClip = actual.mClipRect;
        items.Draw(&actual);
        Require(actual.mClipRect == originalClip, "List draw leaked its temporary clip");
        render.Flush(); const auto actualPixels = render.mRenderer->ReadScenePixels();
        screen->FillRect(clip, Color(18, 26, 34), 0);
        Graphics expected(screen); expected.Translate(25, 25);
        ReferenceList(expected, items, player);
        render.Flush(); const auto expectedPixels = render.mRenderer->ReadScenePixels();
        unsigned errors = 0, first = 0;
        for (unsigned i = 0; i < expectedPixels.size(); ++i)
            if (actualPixels[i] != expectedPixels[i]) { if (!errors) first = i; ++errors; }
        log << "size=" << items.mWidth << ',' << items.mHeight << " count=" << player.mNumZombatars
            << " index=" << items.mSelectedZombatar << " delete-hover=" << items.mDeleteHovered << " mismatches=" << errors;
        if (errors) log << " first=" << first % 800 << ',' << first / 800 << " actual="
            << std::hex << actualPixels[first] << " expected=" << expectedPixels[first] << std::dec;
        log << std::endl;
        mismatches += errors;
    };
    for (auto [width, height] : std::array{std::pair{560, 600}, std::pair{561, 551}, std::pair{559, 501}})
    {
        items.Resize(25, 25, width, height);
        for (int count : {1, 2, 3, 100})
        {
            player.mNumZombatars = count;
            for (int index : {0, count / 2, count - 1})
            {
                // Cover every real boundary (including duplicate single-item
                // positions), plus distinct middle slots of longer lists.
                for (bool hovered : {false, true})
                {
                    items.mSelectedZombatar = index;
                    items.mDeleteHovered = hovered;
                    items.RefreshState();
                    Require(items.mPrevZombieButton->mDisabled == (index == 0) &&
                        items.mNextZombieButton->mDisabled == (index + 1 == count),
                        "Saved portrait boundary button state differs from 1073");
                    compare(); ++cases;
                }
            }
            items.mSelectedZombatar = 0; items.RefreshState();
            Click(items, *items.mPrevZombieButton);
            Require(items.mSelectedZombatar == 0, "Hidden previous arrow accepted a click");
            if (count > 1)
            {
                Click(items, *items.mNextZombieButton);
                Require(items.mSelectedZombatar == 1, "Next portrait click did not advance once");
                Click(items, *items.mPrevZombieButton);
                Require(items.mSelectedZombatar == 0, "Previous portrait click did not return once");
            }
            items.mSelectedZombatar = count - 1; items.RefreshState();
            Click(items, *items.mNextZombieButton);
            Require(items.mSelectedZombatar == count - 1, "Hidden next arrow accepted a click");
            ++inputCases;
        }
    }
    // The shipped panel already has black areas. A coloured fixture prevents
    // that artwork from accidentally hiding an omitted FillRect, and a short
    // panel distinguishes the 437-high clip from the 331-high fill. No asset
    // files are modified; the resource slot is restored before fixture death.
    {
        MemoryImage frame;
        frame.Create(560, 493);
        frame.FillRect(Rect(0, 0, 560, 493), Color(33, 77, 121), 0);
        struct RestoreImage { Image* previous; ~RestoreImage() { IMAGE_ZOMBATAR_WIDGET_BG = previous; } }
            restoreImage{IMAGE_ZOMBATAR_WIDGET_BG};
        IMAGE_ZOMBATAR_WIDGET_BG = &frame;
        player.mNumZombatars = 3;
        items.mSelectedZombatar = 1;
        for (int height : {600, 450}) for (bool hovered : {false, true})
        {
            items.Resize(25, 25, 560, height); items.mDeleteHovered = hovered; items.RefreshState();
            log << "synthetic-panel "; compare();
        }
    }
    log << "cases=" << cases << " input-sequences=" << inputCases << " total-mismatches=" << mismatches << std::endl;
    Require(cases == 72 && inputCases == 12, "Zombatar list test coverage incomplete");
    Require(screen->mBits == cpuBits && screen->mBitsChangedCount == cpuVersion,
        "Zombatar list used CPU screen backing");
    ModernSmoke::Report("portable-zombatar-list-boundary-input-12", app);
    Require(mismatches == 0, "Saved Zombatar list differs from 1073 composition; see zombatar-list-cases.txt");
    ModernSmoke::Report("portable-zombatar-list-72-gpu-compositions", app);
    ModernSmoke::Report("portable-zombatar-list-four-coloured-panel-clip-fill-cases", app);
}

void PortableZombatarHeadSmoke(LawnApp& app)
{
    // Independent descriptor order, including absent base/line tracks.
    struct PartTracks { ReanimTrackId base, line; };
    constexpr PartTracks tidbitTracks[] = {
        {ReanimTrackId::tidBits_00, ReanimTrackId::tidBits_00_line},
        {ReanimTrackId::tidBits_01, ReanimTrackId::tidBits_01_line},
        {ReanimTrackId::tidBits_02, ReanimTrackId::None},
        {ReanimTrackId::tidBits_03, ReanimTrackId::None},
        {ReanimTrackId::tidBits_04, ReanimTrackId::None},
        {ReanimTrackId::tidBits_05, ReanimTrackId::None},
        {ReanimTrackId::tidBits_06, ReanimTrackId::None},
        {ReanimTrackId::tidBits_07, ReanimTrackId::None},
        {ReanimTrackId::tidBits_08, ReanimTrackId::None},
        {ReanimTrackId::tidBits_09, ReanimTrackId::tidBits_09_line},
        {ReanimTrackId::tidBits_10, ReanimTrackId::tidBits_10_line},
        {ReanimTrackId::tidBits_11, ReanimTrackId::tidBits_11_line},
        {ReanimTrackId::tidBits_12, ReanimTrackId::None},
        {ReanimTrackId::tidBits_13, ReanimTrackId::None},
    };
    constexpr PartTracks accessoryTracks[] = {
        {ReanimTrackId::accessories_00, ReanimTrackId::None},
        {ReanimTrackId::accessories_01, ReanimTrackId::None},
        {ReanimTrackId::accessories_02, ReanimTrackId::None},
        {ReanimTrackId::accessories_03, ReanimTrackId::None},
        {ReanimTrackId::accessories_04, ReanimTrackId::None},
        {ReanimTrackId::accessories_14, ReanimTrackId::None},
        {ReanimTrackId::accessories_05, ReanimTrackId::None},
        {ReanimTrackId::accessories_06, ReanimTrackId::None},
        {ReanimTrackId::accessories_12, ReanimTrackId::None},
        {ReanimTrackId::accessories_07, ReanimTrackId::None},
        {ReanimTrackId::accessories_09, ReanimTrackId::None},
        {ReanimTrackId::accessories_10, ReanimTrackId::None},
        {ReanimTrackId::accessories_11, ReanimTrackId::None},
        {ReanimTrackId::accessories_13, ReanimTrackId::None},
        {ReanimTrackId::accessories_08, ReanimTrackId::None},
    };
    constexpr PartTracks facialHairTracks[] = {
        {ReanimTrackId::facialHair_00, ReanimTrackId::facialHair_00_line},
        {ReanimTrackId::facialHair_01, ReanimTrackId::facialHair_01_line},
        {ReanimTrackId::facialHair_02, ReanimTrackId::facialHair_02_line},
        {ReanimTrackId::facialHair_03, ReanimTrackId::facialHair_03_line},
        {ReanimTrackId::facialHair_04, ReanimTrackId::facialHair_04_line},
        {ReanimTrackId::facialHair_05, ReanimTrackId::facialHair_05_line},
        {ReanimTrackId::facialHair_06, ReanimTrackId::facialHair_06_line},
        {ReanimTrackId::facialHair_07, ReanimTrackId::facialHair_07_line},
        {ReanimTrackId::facialHair_08, ReanimTrackId::facialHair_08_line},
        {ReanimTrackId::facialHair_09, ReanimTrackId::facialHair_09_line},
        {ReanimTrackId::facialHair_10, ReanimTrackId::facialHair_10_line},
        {ReanimTrackId::facialHair_11, ReanimTrackId::facialHair_11_line},
        {ReanimTrackId::facialHair_12, ReanimTrackId::facialHair_12_line},
        {ReanimTrackId::facialHair_13, ReanimTrackId::facialHair_13_line},
        {ReanimTrackId::facialHair_14, ReanimTrackId::facialHair_14_line},
        {ReanimTrackId::facialHair_15, ReanimTrackId::facialHair_15_line},
        {ReanimTrackId::facialHair_16, ReanimTrackId::facialHair_16_line},
        {ReanimTrackId::facialHair_17, ReanimTrackId::facialHair_17_line},
        {ReanimTrackId::facialHair_18, ReanimTrackId::facialHair_18_line},
        {ReanimTrackId::facialHair_19, ReanimTrackId::facialHair_19_line},
        {ReanimTrackId::facialHair_20, ReanimTrackId::facialHair_20_line},
        {ReanimTrackId::facialHair_21, ReanimTrackId::facialHair_21_line},
        {ReanimTrackId::facialHair_22, ReanimTrackId::facialHair_22_line},
        {ReanimTrackId::facialHair_23, ReanimTrackId::facialHair_23_line},
    };
    constexpr PartTracks hairTracks[] = {
        {ReanimTrackId::hair_00, ReanimTrackId::hair_00_line},
        {ReanimTrackId::hair_01, ReanimTrackId::hair_01_line},
        {ReanimTrackId::None, ReanimTrackId::hair_02_line},
        {ReanimTrackId::hair_03, ReanimTrackId::hair_03_line},
        {ReanimTrackId::hair_04, ReanimTrackId::hair_04_line},
        {ReanimTrackId::hair_05, ReanimTrackId::hair_05_line},
        {ReanimTrackId::hair_06, ReanimTrackId::hair_06_line},
        {ReanimTrackId::hair_07, ReanimTrackId::hair_07_line},
        {ReanimTrackId::hair_08, ReanimTrackId::hair_08_line},
        {ReanimTrackId::hair_09, ReanimTrackId::hair_09_line},
        {ReanimTrackId::hair_10, ReanimTrackId::hair_10_line},
        {ReanimTrackId::hair_11, ReanimTrackId::hair_11_line},
        {ReanimTrackId::hair_12, ReanimTrackId::hair_12_line},
        {ReanimTrackId::hair_13, ReanimTrackId::hair_13_line},
        {ReanimTrackId::hair_14, ReanimTrackId::hair_14_line},
        {ReanimTrackId::hair_15, ReanimTrackId::hair_15_line},
    };
    constexpr PartTracks eyewearTracks[] = {
        {ReanimTrackId::eyeWear_00, ReanimTrackId::eyeWear_00_line},
        {ReanimTrackId::eyeWear_01, ReanimTrackId::eyeWear_01_line},
        {ReanimTrackId::eyeWear_02, ReanimTrackId::eyeWear_02_line},
        {ReanimTrackId::eyeWear_03, ReanimTrackId::eyeWear_03_line},
        {ReanimTrackId::eyeWear_04, ReanimTrackId::eyeWear_04_line},
        {ReanimTrackId::eyeWear_05, ReanimTrackId::eyeWear_05_line},
        {ReanimTrackId::eyeWear_06, ReanimTrackId::eyeWear_06_line},
        {ReanimTrackId::eyeWear_07, ReanimTrackId::eyeWear_07_line},
        {ReanimTrackId::eyeWear_08, ReanimTrackId::eyeWear_08_line},
        {ReanimTrackId::eyeWear_09, ReanimTrackId::eyeWear_09_line},
        {ReanimTrackId::eyeWear_10, ReanimTrackId::eyeWear_10_line},
        {ReanimTrackId::eyeWear_11, ReanimTrackId::eyeWear_11_line},
        {ReanimTrackId::eyeWear_12, ReanimTrackId::None},
        {ReanimTrackId::eyeWear_13, ReanimTrackId::None},
        {ReanimTrackId::eyeWear_14, ReanimTrackId::None},
        {ReanimTrackId::eyeWear_15, ReanimTrackId::None},
    };
    constexpr PartTracks hatTracks[] = {
        {ReanimTrackId::hats_00, ReanimTrackId::hats_00_line},
        {ReanimTrackId::hats_01, ReanimTrackId::hats_01_line},
        {ReanimTrackId::hats_02, ReanimTrackId::hats_02_line},
        {ReanimTrackId::hats_03, ReanimTrackId::hats_03_line},
        {ReanimTrackId::hats_04, ReanimTrackId::hats_04_line},
        {ReanimTrackId::hats_05, ReanimTrackId::hats_05_line},
        {ReanimTrackId::hats_06, ReanimTrackId::hats_06_line},
        {ReanimTrackId::hats_07, ReanimTrackId::hats_07_line},
        {ReanimTrackId::hats_08, ReanimTrackId::hats_08_line},
        {ReanimTrackId::hats_09, ReanimTrackId::hats_09_line},
        {ReanimTrackId::hats_10, ReanimTrackId::hats_10_line},
        {ReanimTrackId::hats_11, ReanimTrackId::hats_11_line},
        {ReanimTrackId::None, ReanimTrackId::hats_12_line},
        {ReanimTrackId::hats_13, ReanimTrackId::hats_13_line},
    };
    static_assert(std::size(tidbitTracks) + std::size(accessoryTracks) + std::size(facialHairTracks) +
        std::size(hairTracks) + std::size(eyewearTracks) + std::size(hatTracks) == 99);
    struct Family { ZombatarCustomizationPage page; const PartTracks* tracks; int count, group; };
    const Family families[] = {
        {ZOMBATAR_CUSTOM_TIDBITS,tidbitTracks,int(std::size(tidbitTracks)),2},
        {ZOMBATAR_CUSTOM_ACCESSORIES,accessoryTracks,int(std::size(accessoryTracks)),4},
        {ZOMBATAR_CUSTOM_FACIAL_HAIR,facialHairTracks,int(std::size(facialHairTracks)),6},
        {ZOMBATAR_CUSTOM_HAIR,hairTracks,int(std::size(hairTracks)),8},
        {ZOMBATAR_CUSTOM_EYEWEAR,eyewearTracks,int(std::size(eyewearTracks)),10},
        {ZOMBATAR_CUSTOM_HATS,hatTracks,int(std::size(hatTracks)),12},
    };
    RestoreRecords restore(*app.mPlayerInfo);
    app.mPlayerInfo->mNumZombatars = 0;
    auto& pool = app.mEffectSystem->mReanimationHolder->mReanimations;
    const auto initialCount = pool.mSize;
    std::ofstream log(ModernSmoke::ProbePath("zombatar-head-cases.txt"));
    Require(bool(log), "Cannot write Zombatar head evidence");
    {
        Zombie zombie;
        zombie.mBoard = nullptr;
        zombie.ZombieInitialize(0, ZOMBIE_ZOMBATAR, false, nullptr, Zombie::ZOMBIE_WAVE_UI);
        struct EndZombie { Zombie& zombie; ~EndZombie() { zombie.DieNoLoot(); } } end{zombie};
        auto* body = app.ReanimationGet(zombie.mBodyReanimID);
        auto* head = app.ReanimationGet(zombie.mZombatarHeadReanimID);
        Require(body && head, "Zombatar head/body missing");
        auto& carrier = *body->GetTrackInstanceByName(ReanimTrackId::anim_head1);
        Require(carrier.mRenderGroup == 3 && carrier.mImageOverride == IMAGE_BLANK &&
            carrier.mAttachmentID != ATTACHMENTID_NULL,
            "Zombatar head is not attached in original late body group3");
        Require(body->TrackExists(ReanimTrackId::Zombie_tie) &&
            body->GetTrackInstanceByName(ReanimTrackId::Zombie_tie)->mRenderGroup == 0,
            "Zombie tie is not in the original ordinary body group");
        auto indexOf = [&](ReanimTrackId id)
        {
            if (id == ReanimTrackId::None) return -1;
            for (int i = 0; i < head->mDefinition->mTracks.count; ++i)
                if (head->mDefinition->mTracks.tracks[i].mTrackId == id)
                    return i;
            return -1;
        };
        std::vector<int> groups;
        std::vector<Color> colors;
        for (int i = 0; i < head->mDefinition->mTracks.count; ++i)
        { groups.push_back(head->mTrackInstances[i].mRenderGroup); colors.push_back(head->mTrackInstances[i].mTrackColor); }
        unsigned cases = 0, lineOnly = 0;
        for (const auto& family : families) for (int raw = 0; raw < family.count; ++raw)
        {
            const auto& part = family.tracks[raw];
            const int base = indexOf(part.base), line = indexOf(part.line);
            if (base < 0 && line >= 0) ++lineOnly;
            Require(base >= 0 || line >= 0, "1073 selected part has neither base nor line in pak64");
            for (int palette : {-1, 0, 31})
            {
                Zombatar record{};
                std::fill(std::begin(record.mItems), std::end(record.mItems), -1);
                std::fill(std::begin(record.mColors), std::end(record.mColors), -1);
                record.mColors[ZOMBATAR_CUSTOM_SKIN] = 0;
                record.mItems[ZOMBATAR_CUSTOM_BACKDROPS] = 4;
                record.mColors[family.page] = palette;
                record.mItems[family.page] = raw + (raw >= 17 ? 1 : 0);
                // Reset hides only part families; absent bases still colour slot 0.
                for (const auto& resetFamily : families) for (int j = 0; j < resetFamily.count; ++j)
                {
                    const auto& resetPart = resetFamily.tracks[j];
                    for (const auto candidate : {resetPart.base, resetPart.line})
                        if (const int idx = indexOf(candidate); idx >= 0) groups[idx] = -1;
                }
                const int group = family.page == ZOMBATAR_CUSTOM_ACCESSORIES && raw == 14 ? 10 : family.group;
                if (base >= 0) groups[base] = group;
                if (line >= 0) groups[line] = group + 1;
                colors[base >= 0 ? base : 0] = ZombatarGetColor(palette);
                zombie.ApplyZombatarHead(&app, &record);
                for (int i = 0; i < head->mDefinition->mTracks.count; ++i)
                {
                    if (head->mTrackInstances[i].mRenderGroup != groups[i] || head->mTrackInstances[i].mTrackColor != colors[i])
                        log << "mismatch page=" << int(family.page) << " raw=" << raw
                            << " type=" << int(head->mReanimationType)
                            << " track=" << static_cast<std::uint32_t>(head->mDefinition->mTracks.tracks[i].mTrackId)
                            << " group=" << head->mTrackInstances[i].mRenderGroup << " expected=" << groups[i]
                            << " color=" << head->mTrackInstances[i].mTrackColor.ToInt() << " expected=" << colors[i].ToInt() << std::endl;
                    Require(head->mTrackInstances[i].mRenderGroup == groups[i] &&
                        head->mTrackInstances[i].mTrackColor == colors[i],
                        "Zombatar selected/reset group or color differs from original descriptor semantics");
                }
                log << "page=" << int(family.page) << " raw=" << raw
                    << " type=" << int(head->mReanimationType)
                    << " base-id=" << static_cast<std::uint32_t>(part.base)
                    << " line-id=" << static_cast<std::uint32_t>(part.line)
                    << " logical=" << record.mItems[family.page] << " palette=" << palette
                    << " base=" << base << " line=" << line << " group=" << group << " exact=1" << std::endl;
                ++cases;
            }
        }
        Require(cases == 297 && lineOnly == 2, "Zombatar part coverage or missing-base inventory changed");
        auto& render = *app.mDDInterface->mRenderInterface;
        auto* screen = app.mDDInterface->mScreenImage;
        auto clear = [&] { screen->FillRect(Rect(0,0,800,600), Color(18,26,34), 0); };
        auto pixels = [&] { render.Flush(); return render.mRenderer->ReadScenePixels(); };
        const auto* cpuBits = screen->mBits; const auto cpuVersion = screen->mBitsChangedCount;
        unsigned draws = 0;
        for (auto [page, item] : std::array{
            std::pair{ZOMBATAR_CUSTOM_HAIR,2}, std::pair{ZOMBATAR_CUSTOM_HATS,12},
            std::pair{ZOMBATAR_CUSTOM_FACIAL_HAIR,4}, std::pair{ZOMBATAR_CUSTOM_FACIAL_HAIR,15}})
        {
            Zombatar record{};
            std::fill(std::begin(record.mItems), std::end(record.mItems), -1);
            std::fill(std::begin(record.mColors), std::end(record.mColors), -1);
            record.mColors[ZOMBATAR_CUSTOM_SKIN] = 0; record.mItems[ZOMBATAR_CUSTOM_BACKDROPS] = 4;
            record.mItems[page] = item;
            zombie.ApplyZombatarHead(&app, &record);
            head->Update(); body->Update();
            clear(); Graphics actual(screen); actual.Translate(250, 220);
            ZombieDrawPosition position{}; position.mClipHeight = CLIP_HEIGHT_LIMIT;
            zombie.DrawReanim(&actual, position, 0);
            const auto actualPixels = pixels();
            clear(); Graphics expected(screen); expected.Translate(250,220);
            // 1073 0053D950 type0x21: body0, then head carrier3, then4.
            body->DrawRenderGroup(&expected,0); body->DrawRenderGroup(&expected,3); body->DrawRenderGroup(&expected,4);
            const auto expectedPixels = pixels();
            Require(actualPixels == expectedPixels, "Zombatar body/attachment group draw order differs from1073");
            Require(std::count_if(actualPixels.begin(),actualPixels.end(),[](auto p){return p != 0xff121a22u;}) > 500,
                "Zombatar body GPU oracle is empty");
            clear(); Graphics ordinary(screen); ordinary.Translate(250,220);
            body->DrawRenderGroup(&ordinary,0);
            const auto bodyOnly = pixels();
            Require(actualPixels != bodyOnly, "Custom head attachment did not paint any pixels");
            clear(); Graphics attached(screen); attached.Translate(250,220);
            AttachmentDraw(carrier.mAttachmentID, &attached, false);
            const auto attachedPixels = pixels();
            clear(); Graphics headReference(screen); headReference.Translate(250,220);
            // Independent of Reanimation::Draw/Attachment::Draw, so a return
            // to drawing only group0 cannot make both sides falsely pass.
            for(int group=0;group<=17;++group) head->DrawRenderGroup(&headReference,group);
            Require(attachedPixels==pixels(),"Head attachment omitted/reordered a supported render group");
            const Family* family=nullptr;
            for(const auto& entry:families) if(entry.page==page) family=&entry;
            Require(family!=nullptr,"Missing part family for GPU probe");
            const auto& selected=family->tracks[item];
            const int base=indexOf(selected.base), line=indexOf(selected.line);
            const int oldBase=base>=0?head->mTrackInstances[base].mRenderGroup:-1;
            const int oldLine=line>=0?head->mTrackInstances[line].mRenderGroup:-1;
            if(base>=0) head->mTrackInstances[base].mRenderGroup=-1;
            if(line>=0) head->mTrackInstances[line].mRenderGroup=-1;
            clear(); AttachmentDraw(carrier.mAttachmentID,&attached,false);
            const auto withoutPart=pixels();
            if(base>=0) head->mTrackInstances[base].mRenderGroup=oldBase;
            if(line>=0) head->mTrackInstances[line].mRenderGroup=oldLine;
            unsigned partPixels=0;
            for(size_t i=0;i<withoutPart.size();++i) partPixels+=withoutPart[i]!=attachedPixels[i];
            log << "gpu page=" << int(page) << " item=" << item
                << " original-group-order=1 attachment-visible=1 selected-part-pixels=" << partPixels << std::endl;
            Require(partPixels>0,"Selected part did not paint pixels (base face alone is not a pass)");
            ++draws;
        }
        Require(draws == 4 && screen->mBits == cpuBits && screen->mBitsChangedCount == cpuVersion,
            "Zombatar GPU fixture used CPU screen backing");
        log << "parts=99 cases=" << cases << " line-only=" << lineOnly << " gpu=" << draws << std::endl;
    }
    app.mEffectSystem->ProcessDeleteQueue();
    Require(pool.mSize == initialCount, "Temporary Zombatar head/body/flag did not return to pool baseline");
    ModernSmoke::Report("portable-zombatar-head-297-part-cases-two-line-only-four-gpu", app);
}

void PortableZombatarResourceSmoke(LawnApp& app)
{
    Require(getenv("PVZ_MODERN_HIDDEN") && getenv("PVZ_APPDATA_DIR"),
        "Zombatar lifetime probe requires a hidden window and isolated saves");
    RestoreRecords restore(*app.mPlayerInfo);
    app.mPlayerInfo->mNumZombatars = 0;
    auto& resources = *app.mResourceManager;
    auto& renderer = *app.mDDInterface->mRenderInterface;
    auto* target = app.mDDInterface->mScreenImage;
    std::ofstream log(ModernSmoke::ProbePath("zombatar-resource-lifetime.txt"));
    Require(bool(log), "Cannot write Zombatar lifetime evidence");
    // The real selector already has a live ZombatarScreen. ResourceManager's
    // manifest records, not global raw IMAGE pointers, prove continued ownership.
    const auto groupImages = [&] {
        std::vector<MemoryImage*> result;
        for (auto* resource : resources.mResourceSlots)
            if (resource != nullptr && resource->mType == ResourceManager::ResType_Image &&
                (resource->mResGroup == ResourceGroupId::DelayLoad_Almanac || resource->mResGroup == ResourceGroupId::DelayLoad_Zombatar))
                result.push_back(static_cast<MemoryImage*>(
                    static_cast<ResourceManager::ImageRes*>(resource)->mImage));
        return result;
    };
    const auto retained = groupImages();
    Require(!retained.empty() && std::all_of(retained.begin(), retained.end(), [](auto* p) { return p; }),
        "Zombatar lifetime baseline is not loaded");
    const auto groups = resources.mLoadedGroups;
    const auto imageRecords = resources.GetNumImages();
    const auto fontRecords = resources.GetNumFonts();
    const auto soundRecords = resources.GetNumSounds();
    app.mEffectSystem->ProcessDeleteQueue();
    const auto reanimations = app.mEffectSystem->mReanimationHolder->mReanimations.mSize;
    const auto attachments = app.mEffectSystem->mAttachmentHolder->mAttachments.mSize;
    size_t baselineImages = 0, baselineShared = 0, baselineTextures = 0;
    std::uint64_t baselineCreated = 0;
    const auto capture = [&](ZombatarScreen& screen) {
        target->FillRect(Rect(0, 0, 800, 600), Color(17, 23, 31), Graphics::DRAWMODE_NORMAL);
        Graphics g(target);
        screen.Draw(&g);
        renderer.Flush();
        return renderer.mRenderer->ReadScenePixels();
    };
    for (int cycle = 0; cycle < 17; ++cycle)
    {
        // Exercise both destruction orders with a real Almanac consumer alive;
        // do not attach temporary windows or send OS input / save / export.
        auto first = std::make_unique<ZombatarScreen>(&app);
        auto almanac = std::make_unique<AlmanacDialog>(&app);
        auto second = std::make_unique<ZombatarScreen>(&app);
        first->SetupZombiePreview();
        second->SetupZombiePreview();
        auto& survivor = cycle % 2 ? *first : *second;
        // Initialization intentionally picks a random idle frame. Compare the
        // SAME instance before/after releasing its neighbour, not unrelated
        // randomized zombies across cycles. Never change the game's RNG.
        const auto reference = capture(survivor);
        if (cycle % 2) second.reset(); else first.reset();
        const bool retainedAfterOne = groupImages() == retained && resources.mLoadedGroups == groups;
        log << "cycle=" << cycle << " resources-retained-after-one=" << retainedAfterOne << std::endl;
        if (!retainedAfterOne)
        {
            // Negative test cleanup: record failure first, then reload before
            // touching any raw resource pointer. Do not render freed memory.
            first.reset(); second.reset(); almanac.reset();
            TodLoadResources(ResourceGroupId::DelayLoad_Almanac);
            TodLoadResources(ResourceGroupId::DelayLoad_Zombatar);
            app.mEffectSystem->ProcessDeleteQueue();
            throw std::runtime_error("Zombatar destruction revoked shared resources still borrowed by another screen");
        }
        const auto pixels = capture(survivor);
        Require(pixels.size() == 480000, "Zombatar lifetime GPU image size differs");
        Require(std::count_if(pixels.begin(), pixels.end(), [](auto p) { return (p & 0xffffff) != 0x11171f; }) > 10000,
            "Zombatar lifetime GPU reference is empty");
        Require(pixels == reference, "Surviving Zombatar changed pixels after shared borrower destruction");
        first.reset(); second.reset(); almanac.reset();
        app.mEffectSystem->ProcessDeleteQueue();
        app.CleanSharedImages();
        const auto counts = renderer.mRenderer->GetResourceCounts();
#if defined(PVZ_GPU_D3D12)
        const auto uploads = renderer.mRenderer->textureUploadCounts;
#else
        const auto uploads = renderer.mRenderer->GetTextureUploadCounts();
#endif
        if (cycle == 0)
        {
            baselineImages = app.mMemoryImageSet.size();
            baselineShared = app.mSharedImageMap.size();
            baselineTextures = counts.textures;
            baselineCreated = uploads.createdTextures;
        }
        const bool steady = groupImages() == retained && resources.mLoadedGroups == groups &&
            resources.GetNumImages() == imageRecords && resources.GetNumFonts() == fontRecords &&
            resources.GetNumSounds() == soundRecords && app.mMemoryImageSet.size() == baselineImages &&
            app.mSharedImageMap.size() == baselineShared && counts.textures == baselineTextures &&
            uploads.createdTextures == baselineCreated &&
            app.mEffectSystem->mReanimationHolder->mReanimations.mSize == reanimations &&
            app.mEffectSystem->mAttachmentHolder->mAttachments.mSize == attachments;
        log << "cycle=" << cycle << " stable=" << steady << " images=" << app.mMemoryImageSet.size()
            << " shared=" << app.mSharedImageMap.size() << " textures=" << counts.textures
            << " total-texture-creations=" << uploads.createdTextures << " reanimations="
            << app.mEffectSystem->mReanimationHolder->mReanimations.mSize << " attachments="
            << app.mEffectSystem->mAttachmentHolder->mAttachments.mSize << std::endl;
        Require(steady, "Repeated Zombatar/Almanac lifetimes lost resources, leaked objects or reuploaded warm textures");
    }
    log << "warmup=1 measured-cycles=16 temporary-screens=34 almanacs=17 gpu-identical=17" << std::endl;
    ModernSmoke::Report("portable-zombatar-resource-16-cycles-two-borrowers-gpu-stable", app);
}
