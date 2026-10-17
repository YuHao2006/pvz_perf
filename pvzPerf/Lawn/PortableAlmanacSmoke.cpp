#include "Sexy.TodLib/generated/EntityStrings.h"
#include "PortableFixesSmoke.h"
#include "ModernVulkanSmoke.h"
#include "LawnApp.h"
#include "Resources.h"
#include "Board.h"
#include "Cutscene.h"
#include "Plant.h"
#include "Zombie.h"
#include "ToolTipWidget.h"
#include "SeedPacket.h"
#include "System/Music.h"
#include "System/PlayerInfo.h"
#include "System/ReanimationLawn.h"
#include "Widget/Almanac.h"
#include "Widget/SeedChooserScreen.h"
#include "Widget/GameButton.h"
#include "Sexy.TodLib/EffectSystem.h"
#include "Sexy.TodLib/Reanimator.h"
#include "Sexy.TodLib/TodStringFile.h"
#include "sound/SoundManager.h"
#include "sound/SoundInstance.h"
#include "widget/WidgetManager.h"
#include "graphics/DDImage.h"
#include "graphics/DDInterface.h"
#include "graphics/RenderInterface.h"
#include "graphics/Font.h"
#include <array>
#include <fstream>
#include <memory>
#include <set>
#include <stdexcept>

namespace {
using namespace Sexy;
void Require(bool ok, const char* message) { if (!ok) throw std::runtime_error(message); }
class Tap final : public SoundInstance {
public:
    unsigned plays = 0; bool semantics = true;
    void Release() override {}
    void SetBaseVolume(double) override {}
    void SetBasePan(int) override {}
    void AdjustPitch(double) override {}
    void SetVolume(double) override {}
    void SetPan(int) override {}
    bool Play(bool looping, bool autoRelease) override { ++plays; semantics &= !looping && autoRelease; return true; }
    void Stop() override {}
    bool IsPlaying() override { return false; }
    bool IsReleased() override { return true; }
};
class TapManager final : public SoundManager {
    LawnApp& app;
public:
    Tap tap; unsigned requests = 0; bool beforeDialog = true;
    explicit TapManager(LawnApp& a) : app(a) { mInitialized = true; }
    bool LoadSound(unsigned, const std::string&) override { return true; }
    int LoadSound(const std::string&) override { return 0; }
    void ReleaseSound(unsigned) override {}
    void SetVolume(double) override {}
    bool SetBaseVolume(unsigned, double) override { return true; }
    bool SetBasePan(unsigned, int) override { return true; }
    SoundInstance* GetSoundInstance(unsigned id) override {
        if (id != static_cast<unsigned>(SOUND_TAP)) return nullptr;
        ++requests; beforeDialog &= app.GetDialog(DIALOG_ALMANAC) == nullptr; return &tap;
    }
    void ReleaseSounds() override {}
    void ReleaseChannels() override {}
    void Flush() override {}
    void SetCooperativeWindow(HWND) override {}
    void StopAllSounds() override {}
    int GetFreeSoundId() override { return 0; }
    int GetNumSounds() override { return 1; }
};

class CloseAlmanac final : public Widget {
    LawnApp& app; ZombieType expected; unsigned updates = 0;
public:
    unsigned closed = 0;
    CloseAlmanac(LawnApp& a, ZombieType type) : app(a), expected(type) {
        mMouseVisible = false; mWidgetFlagsMod.mAddFlags = WIDGETFLAGS_UPDATE; app.mWidgetManager->AddWidget(this);
    }
    ~CloseAlmanac() override { if (mWidgetManager) mWidgetManager->RemoveWidget(this); }
    void Update() override {
        Require(++updates < 500, "Preview almanac modal did not complete");
        auto* dialog = dynamic_cast<AlmanacDialog*>(app.GetDialog(DIALOG_ALMANAC));
        if (!dialog) return;
        Require(closed == 0 && dialog->mSelectedZombie == expected && dialog->mOpenPage == ALMANAC_PAGE_ZOMBIES,
            "Preview click selected the wrong almanac entry");
        ++closed;
        // The ordinary application close route, without synthesizing an extra
        // click sound or touching OS input. WaitForResult still has to return.
        Require(app.KillAlmanacDialog(), "Actual almanac close route failed");
    }
};

unsigned IconPixels(LawnApp& app, std::ostream& log) {
    auto& widgets = *app.mWidgetManager;
    auto& renderer = *app.mDDInterface->mRenderInterface;
    auto* screen = app.mDDInterface->mScreenImage;
    AlmanacDialog dialog(&app); dialog.ShowZombie(ZOMBIE_NORMAL);
    struct Icon { ZombieType type; float dx, dy; };
    // 1073 0040425E..004042A5, decoded double constants 006FDAB8,
    // 006FDB70, 006FDB50, 006FDB40: 0, 15, 5, 20.
    constexpr std::array<Icon,2> icons{{{ZOMBIE_DANCER,0,15},{ZOMBIE_BACKUP_DANCER,-5,20}}};
    unsigned wrong = 0, cases = 0;
    for (auto hovered : {ZOMBIE_INVALID, ZOMBIE_DANCER, ZOMBIE_BACKUP_DANCER}) {
        widgets.mLastMouseX = widgets.mLastMouseY = -100;
        if (hovered != ZOMBIE_INVALID) {
            dialog.GetZombiePosition(hovered, widgets.mLastMouseX, widgets.mLastMouseY);
            widgets.mLastMouseX += 30; widgets.mLastMouseY += 30;
        }
        Require(dialog.ZombieHitTest(widgets.mLastMouseX, widgets.mLastMouseY) == hovered, "Unexpected almanac hover fixture");
        screen->FillRect(Rect(0,0,800,600),Color(17,23,31),0);
        Graphics actualGraphics(screen); dialog.DrawZombies(&actualGraphics);
        renderer.Flush(); const auto actual = renderer.mRenderer->ReadScenePixels();
        const auto reference = [&](bool includeZombie) {
            screen->FillRect(Rect(0,0,800,600),Color(17,23,31),0);
            Graphics g(screen); g.DrawImage(IMAGE_ALMANAC_ZOMBIEBACK,0,0);
            for (const auto& icon : icons) {
                int x,y; dialog.GetZombiePosition(icon.type,x,y);
                Require(dialog.ZombieIsShown(icon.type) && !dialog.ZombieHasSilhouette(icon.type), "Icon fixture is locked/silhouetted");
                const auto window = [&](Image* image) {
                    g.DrawImage(image,x,y);
                    if (hovered == icon.type) {
                        g.mDrawMode = Graphics::DRAWMODE_ADDITIVE; g.mColor = Color(255,255,255,48);
                        g.mColorizeImages = true; g.DrawImage(image,x,y);
                        g.mDrawMode = Graphics::DRAWMODE_NORMAL; g.mColorizeImages = false;
                    }
                };
                window(IMAGE_ALMANAC_ZOMBIEWINDOW);
                if (includeZombie) {
                    Graphics zombie(g); zombie.SetClipRect(x+2,y+2,72,72); zombie.Translate(x+1,y-6);
                    zombie.mScaleX = zombie.mScaleY = 0.5f; zombie.TranslateF(icon.dx,icon.dy);
                    app.mReanimatorCache->DrawCachedZombie(&zombie,0,0,icon.type);
                }
                window(IMAGE_ALMANAC_ZOMBIEWINDOW2);
            }
            renderer.Flush(); return renderer.mRenderer->ReadScenePixels();
        };
        const auto expected = reference(true), blank = reference(false);
        Require(actual.size()==480000 && expected.size()==actual.size() && blank.size()==actual.size(), "Invalid native almanac capture");
        for (const auto& icon : icons) {
            int x,y; dialog.GetZombiePosition(icon.type,x,y);
            unsigned different=0, visible=0;
            // Whole 72x72 sprite clip plus its border: do not ignore edge pixels.
            for (int iy=y;iy<y+76;++iy) for (int ix=x;ix<x+76;++ix) {
                const auto p=static_cast<size_t>(iy)*800+ix;
                different += actual[p]!=expected[p]; visible += expected[p]!=blank[p];
            }
            ++cases; wrong += different!=0 || visible<50;
            log<<"icon="<<int(icon.type)<<" hover="<<int(hovered)<<" offset="<<icon.dx<<','<<icon.dy
                <<" pixels=5776 different="<<different<<" visible="<<visible<<std::endl;
        }
    }
    log<<"icon-cases="<<cases<<" wrong="<<wrong<<std::endl;
    return wrong;
}

unsigned RechargePixels(LawnApp& app, std::ostream& log) {
    auto& renderer=*app.mDDInterface->mRenderInterface;
    auto* screen=app.mDDInterface->mScreenImage;
    auto* font=FONT_BRIANNETOD12;
    AlmanacDialog dialog(&app);
    dialog.ClearPlantsAndZombies();
    // Exercise the actual three DrawPlants branches; reference text is from
    // 1073 00403290, not the production format expression being tested.
    struct Entry {SeedType seed;int refresh;const char* value;const std::string* text;};
    const std::array<Entry,3> entries{{
        {SEED_PEASHOOTER,750," fast",&gStr.WAIT_TIME_SHORT},
        {SEED_WALLNUT,3000," slow",&gStr.WAIT_TIME_LONG},
        {SEED_CHERRYBOMB,5000," very slow",&gStr.WAIT_TIME_VERY_LONG}}};
    Require(gStr.WAIT_TIME=="Recharge","Recharge probe requires original English strings");
    unsigned wrong=0;
    auto pixels=[&](){renderer.Flush();return renderer.mRenderer->ReadScenePixels();};
    for(const auto& entry:entries) {
        Require(GetPlantDefinition(entry.seed).mRefreshTime==entry.refresh,"Unexpected recharge fixture timing");
        Require(*entry.text==entry.value+1,"Recharge fixture differs from original English value");
        dialog.mSelectedSeed=entry.seed;
        screen->FillRect(Rect(0,0,800,600),Color(17,23,31),0);
        Graphics actualGraphics(screen);dialog.DrawPlants(&actualGraphics);
        const auto actual=pixels();
        screen->FillRect(Rect(0,0,800,600),Color(17,23,31),0);
        Graphics g(screen);
        g.DrawImage(IMAGE_ALMANAC_PLANTBACK,0,0);
        g.DrawImage(IMAGE_ALMANAC_PLANTCARD,459,86);
        const auto blank=pixels();
        const int width=font->StringWidth("Recharge:")+font->StringWidth(entry.value);
        Require(width<=139,"English recharge reference unexpectedly needs wrapping");
        const int x=739-width,y=520+font->mAscent-font->mAscentPadding;
        font->DrawString(&g,x,y,"Recharge:",Color(143,67,27),g.mClipRect);
        font->DrawString(&g,x+font->StringWidth("Recharge:"),y,entry.value,Color(204,36,29),g.mClipRect);
        const auto expected=pixels();
        Require(actual.size()==480000 && expected.size()==actual.size() && blank.size()==actual.size(),
            "Invalid native recharge capture");
        unsigned different=0,visible=0;
        for(int iy=520;iy<570;++iy)for(int ix=600;ix<739;++ix){
            const auto p=static_cast<size_t>(iy)*800+ix;
            different+=actual[p]!=expected[p];visible+=expected[p]!=blank[p];
        }
        wrong+=different!=0 || visible<50;
        log<<"recharge seed="<<int(entry.seed)<<" refresh="<<entry.refresh<<" width="<<width
           <<" different="<<different<<" visible="<<visible<<std::endl;
    }
    log<<"recharge-cases=3 wrong="<<wrong<<std::endl;
    return wrong;
}

void PreviewRows(LawnApp& app) {
    auto& board=*app.mBoard;
    Require(board.StageHasPool() && board.mPlantRow[0]!=PLANTROW_POOL &&
        board.mPlantRow[2]==PLANTROW_POOL && board.mPlantRow[3]==PLANTROW_POOL,
        "Preview row regression needs a real pool/fog board");
    struct Restore {LawnApp& app;GameMode mode;~Restore(){app.mGameMode=mode;}} restore{app,app.mGameMode};
    std::ofstream log(ModernSmoke::ProbePath("preview-row-cases.txt"));Require(bool(log),"Cannot write preview row evidence");
    auto tube=[&](Zombie& zombie){auto* body=app.ReanimationGet(zombie.mBodyReanimID);
        const int track=body->FindTrackIndex(ReanimTrackId::Zombie_duckytube);
        return body->mTrackInstances[track].mRenderGroup==RENDER_GROUP_NORMAL;};
    auto remove=[&](Zombie& zombie){zombie.DieNoLoot();board.ProcessDeleteQueue();app.mEffectSystem->ProcessDeleteQueue();};
    unsigned cases=0,wrong=0,controls=0,controlWrong=0;
    for(auto mode:{restore.mode,GAMEMODE_MINIGAME_WAR_AND_PEAS_2}) {
        app.mGameMode=mode;Require(!app.IsLittleTroubleLevel(),"Unexpected little-trouble preview fixture");
        for(auto type:{ZOMBIE_NORMAL,ZOMBIE_TRAFFIC_CONE,ZOMBIE_PAIL,ZOMBIE_DUCKY_TUBE})
        for(int y=0;y<5;++y)for(int x:{0,1}){
            const auto baseline=board.mZombies.mSize;
            std::set<Zombie*> before;Zombie* z=nullptr;while(board.IterateZombies(z))before.insert(z);
            board.mCutScene->PlaceAZombie(type,x,y);
            Zombie* added=nullptr;z=nullptr;
            while(board.IterateZombies(z))if(!before.contains(z)){Require(!added,"Preview added multiple zombies");added=z;}
            Require(added && board.mZombies.mSize==baseline+1,"Preview did not add one zombie");
            const auto expectedType=type==ZOMBIE_DUCKY_TUBE && mode==GAMEMODE_MINIGAME_WAR_AND_PEAS_2?ZOMBIE_PEA_HEAD:type;
            const bool ring=tube(*added),expectedRing=type==ZOMBIE_DUCKY_TUBE;
            const int baseX=830+56*x,baseY=70+90*y+30*(x%2);
            const bool layout=added->mPosX>=baseX && added->mPosX<=baseX+14 &&
                added->mPosY>=baseY && added->mPosY<=baseY+14 &&
                added->mRenderOrder==300000+4*y+2*(x%2);
            const bool pass=added->mRow==0 && added->mFromWave==Zombie::ZOMBIE_WAVE_CUTSCENE &&
                added->mZombieType==expectedType && ring==expectedRing && layout;
            ++cases;wrong+=!pass;
            log<<"preview mode="<<int(mode)<<" type="<<int(type)<<" grid="<<x<<','<<y<<" row="<<added->mRow
               <<" tube="<<ring<<" expected-tube="<<expectedRing<<" layout="<<layout<<" pass="<<pass<<std::endl;
            remove(*added);Require(board.mZombies.mSize==baseline,"Preview fixture leaked a zombie slot");
        }
    }
    app.mGameMode=restore.mode;
    // The original LoadPlainZombieReanim tests the actual row, even for an
    // explicitly row-assigned cutscene object. Fix placement, not this rule.
    for(auto type:{ZOMBIE_NORMAL,ZOMBIE_TRAFFIC_CONE,ZOMBIE_PAIL,ZOMBIE_DUCKY_TUBE})
    for(int row:{0,2,3})for(int wave:{0,int(Zombie::ZOMBIE_WAVE_CUTSCENE)}) {
        const auto baseline=board.mZombies.mSize;
        auto* zombie=board.AddZombieInRow(type,row,wave);Require(zombie!=nullptr,"Cannot add row control");
        const bool expected=type==ZOMBIE_DUCKY_TUBE || board.mPlantRow[row]==PLANTROW_POOL;
        const bool actual=tube(*zombie),pass=actual==expected && zombie->mRow==row;
        ++controls;controlWrong+=!pass;
        log<<"control type="<<int(type)<<" row="<<row<<" wave="<<wave<<" tube="<<actual<<" expected="<<expected<<" pass="<<pass<<std::endl;
        remove(*zombie);Require(board.mZombies.mSize==baseline,"Row control leaked a zombie slot");
    }
    log<<"preview-cases="<<cases<<" wrong="<<wrong<<" row-controls="<<controls<<" control-wrong="<<controlWrong<<std::endl;
    Require(cases==80 && controls==24 && !wrong && !controlWrong,"1073 preview logic row/tube differs; see preview-row-cases.txt");
    ModernSmoke::Report("portable-preview-80-original-row-24-water-controls",app);
}
}

void PortableAlmanacSmoke(LawnApp& app) {
    Require(getenv("PVZ_MODERN_HIDDEN") && getenv("PVZ_APPDATA_DIR") && app.mBoard && app.mSeedChooserScreen &&
        app.mDialogMap.empty(), "Almanac probe requires isolated hidden chooser");
    auto& board=*app.mBoard; auto& chooser=*app.mSeedChooserScreen; auto& widgets=*app.mWidgetManager;
    Require(chooser.mMouseVisible && chooser.mSeedsInBank==0 && chooser.mSeedsInFlight==0, "Almanac probe requires ready empty chooser");
    auto fixture=std::make_unique<PlayerInfo>(*app.mPlayerInfo);
    struct Restore {
        LawnApp& app; PlayerInfo* player; SoundManager* sounds; int tap, x,y,mouseX,mouseY; bool muted,paused;
        FlagsMod boardFlags,chooserFlags; Widget* focus;
        ~Restore(){app.mPlayerInfo=player;app.mSoundManager=sounds;SOUND_TAP=tap;app.mMuteSoundsForCutscene=muted;
            auto& b=*app.mBoard;b.mX=x;b.mY=y;b.mPaused=paused;b.mWidgetFlagsMod=boardFlags;
            app.mSeedChooserScreen->mWidgetFlagsMod=chooserFlags;app.mWidgetManager->mLastMouseX=mouseX;
            app.mWidgetManager->mLastMouseY=mouseY;app.mWidgetManager->SetFocus(focus);}
    } restore{app,app.mPlayerInfo,app.mSoundManager,SOUND_TAP,board.mX,board.mY,widgets.mLastMouseX,widgets.mLastMouseY,
        app.mMuteSoundsForCutscene,board.mPaused,board.mWidgetFlagsMod,chooser.mWidgetFlagsMod,widgets.mFocusWidget};
    app.mPlayerInfo=fixture.get(); board.mX=board.mY=0;
    board.mWidgetFlagsMod.mRemoveFlags|=WIDGETFLAGS_UPDATE;
    chooser.mWidgetFlagsMod.mRemoveFlags|=WIDGETFLAGS_UPDATE;
    app.mMuteSoundsForCutscene=false;
    // No-sound test runs leave resource IDs at zero. A distinct temporary ID
    // prevents unrelated foley requests from being counted as a tap.
    SOUND_TAP=0x1073;
    std::ofstream log(ModernSmoke::ProbePath("almanac-input-icons.txt")); Require(bool(log),"Cannot write almanac evidence");
    unsigned cases=0,wrong=0,opens=0;
    const auto widgetCount=widgets.mWidgets.size();
    const auto zombies=board.mZombies.mSize;
    for (auto type : {ZOMBIE_NORMAL,ZOMBIE_GARGANTUAR,ZOMBIE_REDEYE_GARGANTUAR}) {
        auto* zombie=board.AddZombieInRow(type,0,Zombie::ZOMBIE_WAVE_CUTSCENE);
        zombie->mPosX=600;zombie->mX=600;zombie->mPosY=250;zombie->mY=250;
        const auto rect=zombie->GetZombieRect(); const int x=rect.mX+rect.mWidth/2,y=rect.mY+rect.mHeight/2;
        Require(board.ZombieHitTest(x,y)==zombie && chooser.SeedHitTest(x,y)==SEED_NONE && !board.mSeedBank->ContainsPoint(x,y),
            "Preview fixture overlaps another object or packet");
        for (int wave : std::array<int,2>{Zombie::ZOMBIE_WAVE_CUTSCENE,0}) for(int profile=0;profile<3;++profile) for(int repeat=0;repeat<2;++repeat) {
            fixture->mLevel=profile==1?15:14;fixture->mFinishedAdventure=profile==2?1:0;zombie->mFromWave=wave;
            widgets.mLastMouseX=x;widgets.mLastMouseY=y;
            TapManager sounds(app);app.mSoundManager=&sounds;
            const bool expected=profile!=0 && type!=ZOMBIE_REDEYE_GARGANTUAR && wave==Zombie::ZOMBIE_WAVE_CUTSCENE;
            unsigned closed=0;
            {
                CloseAlmanac closer(app,type);chooser.MouseDown(x,y,1);closed=closer.closed;
            }
            app.mSoundManager=restore.sounds;
            const auto expectedTune=app.mNoSoundNeeded?MUSIC_TUNE_NONE:MUSIC_TUNE_CHOOSE_YOUR_SEEDS;
            const bool correct=closed==unsigned(expected) && sounds.requests==unsigned(expected) &&
                sounds.tap.plays==unsigned(expected) && sounds.tap.semantics && sounds.beforeDialog &&
                (!expected || (app.mMusic->mMusicDisabled==app.mNoSoundNeeded && app.mMusic->mCurMusicTune==expectedTune));
            ++cases;wrong+=!correct;opens+=closed;
            log<<"input type="<<int(type)<<" wave="<<wave<<" profile="<<profile<<" repeat="<<repeat
                <<" expected="<<expected<<" opened="<<closed<<" taps="<<sounds.tap.plays<<" before-dialog="<<sounds.beforeDialog
                <<" requests="<<sounds.requests<<" play-semantics="<<sounds.tap.semantics
                <<" no-sound="<<app.mNoSoundNeeded<<" tune="<<int(app.mMusic->mCurMusicTune)<<" expected-tune="<<int(expectedTune)
                <<" pass="<<correct<<std::endl;
            Require(app.mDialogMap.empty() && app.mDialogList.empty() && widgets.mWidgets.size()==widgetCount &&
                app.mSeedChooserScreen==&chooser && chooser.mSeedsInBank==0 && app.mBoard==&board,
                "Preview almanac retained a modal/widget or replaced its chooser/board");
        }
        zombie->DieNoLoot();board.ProcessDeleteQueue();app.mEffectSystem->ProcessDeleteQueue();
        Require(board.mZombies.mSize==zombies,"Preview fixture left a zombie in the board pool");
    }
    fixture->mLevel=50;fixture->mFinishedAdventure=2;
    SOUND_TAP=restore.tap;
    const unsigned iconWrong=IconPixels(app,log);
    const unsigned rechargeWrong=RechargePixels(app,log);
    PreviewRows(app);
    log<<"input-cases="<<cases<<" wrong="<<wrong<<" actual-opens="<<opens<<" icon-wrong="<<iconWrong<<std::endl;
    Require(cases==36 && opens==8 && wrong==0 && iconWrong==0,"1073 preview tap/icon alignment regression; see almanac-input-icons.txt");
    Require(rechargeWrong==0,"1073 recharge label spacing differs; see almanac-input-icons.txt");
    board.MarkAllDirty();
    ModernSmoke::Report("portable-almanac-36-clicks-eight-modals-six-gpu-icons",app);
    ModernSmoke::Report("portable-almanac-three-recharge-original-gpu-labels",app);
}
