#include "ModernVulkanSmoke.h"
#include "LawnApp.h"
#include "Board.h"
#include "Cutscene.h"
#include "Widget/TitleScreen.h"
#include "Widget/GameButton.h"
#include "System/PlayerInfo.h"
#include "Sexy.TodLib/Attachment.h"
#include "Sexy.TodLib/EffectSystem.h"
#include "Sexy.TodLib/Reanimator.h"
#include "Sexy.TodLib/TodCommon.h"
#include "graphics/DDImage.h"
#include "graphics/DDInterface.h"
#include "graphics/RenderInterface.h"
#include "widget/WidgetManager.h"
#include <array>
#include <fstream>
#include <stdexcept>
#include <vector>

namespace {
using namespace Sexy;
using namespace ModernSmoke;
static_assert(REANIM_CRAZY_DAVE==0x5f);
void Require(bool ok,const char* text) { if(!ok) throw std::runtime_error(text); }
bool Alive(LawnApp& app,ReanimationID id) {
    auto* r=app.ReanimationTryToGet(id); return r && !r->mDead;
}
unsigned DaveCount(LawnApp& app) {
    unsigned count=0; Reanimation* r=nullptr;
    while(app.mEffectSystem->mReanimationHolder->mReanimations.IterateNext(r))
        count+=!r->mDead && r->mReanimationType==REANIM_CRAZY_DAVE;
    return count;
}
bool SameMatrix(const SexyMatrix3& a,const SexyMatrix3& b) {
    for(int y=0;y<3;++y) for(int x=0;x<3;++x) if(a.m[y][x]!=b.m[y][x]) return false;
    return true;
}
void FreezePose(LawnApp& app,Reanimation& dave) {
    // Fixed pose, no time advancement or random shake between GPU comparisons.
    // Three passes settle nested Threepeater heads after their parent's matrix.
    dave.PlayReanim(ReanimTrackId::anim_idle_handing,REANIM_LOOP,0,0);
    dave.mAnimTime=0.5f;
    Reanimation* r=nullptr;
    while(app.mEffectSystem->mReanimationHolder->mReanimations.IterateNext(r)) {
        r->mAnimRate=0;
        for(int i=0;i<r->mDefinition->mTracks.count;++i) {
            r->mTrackInstances[i].mBlendCounter=0;
            r->mTrackInstances[i].mShakeOverride=0;
        }
    }
    for(int i=0;i<3;++i) dave.Update();
}
std::vector<std::uint32_t> Render(LawnApp& app,Reanimation& dave) {
    auto* screen=app.mDDInterface->mScreenImage;
    screen->FillRect(Rect(0,0,800,600),Color(19,31,47),0);
    Graphics g(screen); dave.Draw(&g);
    auto& render=*app.mDDInterface->mRenderInterface;
    render.Flush(); return render.mRenderer->ReadScenePixels();
}
unsigned Differences(const std::vector<std::uint32_t>& a,const std::vector<std::uint32_t>& b) {
    Require(a.size()==480000 && b.size()==a.size(),"Upsell GPU capture dimensions");
    unsigned count=0; for(size_t i=0;i<a.size();++i) count+=a[i]!=b[i]; return count;
}
unsigned ComponentCases(LawnApp& app,std::ofstream& log) {
    auto& c=*app.mBoard->mCutScene;
    app.CrazyDaveEnter();
    for(int i=0;i<600 && app.mCrazyDaveState==CRAZY_DAVE_ENTERING;++i) app.UpdateCrazyDave();
    Require(app.mCrazyDaveState==CRAZY_DAVE_IDLING,"Upsell Dave did not finish entering");
    auto* dave=app.ReanimationGet(app.mCrazyDaveReanimID);
    dave->mOverlayMatrix.m02 = 150;
    dave->mOverlayMatrix.m12 = 70;
    unsigned wrong=0;
    c.mCrazyDaveLastTalkIndex=-1; c.mCrazyDaveDialogStart=3300;
    ; // UpdateUpsell 已删除
    const int firstCountdown=c.mCrazyDaveCountDown;
    const bool first=c.mCrazyDaveLastTalkIndex==3300 && c.mCrazyDaveDialogStart==3300
        && app.mCrazyDaveMessageIndex==3300 && firstCountdown>1;
    ; // UpdateUpsell 已删除
    const bool progresses=c.mCrazyDaveLastTalkIndex==3300 && c.mCrazyDaveCountDown==firstCountdown-1;
    wrong+=!first; wrong+=!progresses;
    log << "first-line last=" << c.mCrazyDaveLastTalkIndex << " start=" << c.mCrazyDaveDialogStart
        << " before=" << firstCountdown << " after=" << c.mCrazyDaveCountDown
        << " initialized=" << first << " progresses=" << progresses << std::endl;
    // 1073 does not special-case Upsell in AnimateBoard's 2750-time handoff.
    c.mCutsceneTime=2750; c.AnimateBoard();
    const bool handoff=c.mCrazyDaveDialogStart==-1 && app.mCrazyDaveMessageIndex==3300;
    wrong+=!handoff;
    log << "original-entry-handoff=" << handoff << std::endl;

    const std::array<int,3> lines{3305,3306,3307};
    const std::array<ReanimTrackId,3> tracks{ReanimTrackId::Dave_handinghand,
        ReanimTrackId::Dave_body1,ReanimTrackId::Dave_pot};
    const std::array<ReanimationType,3> types{REANIM_SQUASH,REANIM_THREEPEATER,REANIM_MAGNETSHROOM};
    for(size_t i=0;i<lines.size();++i) {
        // Independent real dispatch cases; not pretending to play every dialogue line.
        c.mCrazyDaveLastTalkIndex=lines[i]-1; c.mCrazyDaveCountDown=0;
        app.mCrazyDaveMessageIndex=-1;
        ; // UpdateUpsell 已删除
        Require(c.mCrazyDaveLastTalkIndex==lines[i],"Upsell dispatch did not advance dialogue");
        auto* track=dave->GetTrackInstanceByName(tracks[i]);
        auto* effect=FindFirstAttachment(track->mAttachmentID);
        auto* child=FindReanimAttachment(track->mAttachmentID);
        Require(effect && child && child->mReanimationType==types[i],"Upsell prop was not attached to its original track");
        const SexyTransform2D saved=effect->mOffset;
        SexyTransform2D expected;
        if(i==1) TodScaleRotateTransformMatrix(expected,-70,260,0.5f,1.2f,1.2f);
        else {
            expected.m00=expected.m11=1.2f;
            expected.m02=i==0 ? 92.0f : 25.0f;
            expected.m12=i==0 ? 387.0f : 49.0f;
        }
        const bool matrix=SameMatrix(saved,expected);
        FreezePose(app,*dave);
        const auto actual=Render(app,*dave);
        Capture(("upsell-actual-"+std::to_string(lines[i])).c_str(),app);
        effect->mOffset=expected;
        for(int step=0;step<3;++step) dave->Update();
        const auto reference=Render(app,*dave);
        Capture(("upsell-reference-"+std::to_string(lines[i])).c_str(),app);
        const auto id=track->mAttachmentID;
        track->mAttachmentID=ATTACHMENTID_NULL;
        const auto without=Render(app,*dave);
        track->mAttachmentID=id;
        effect->mOffset=saved;
        for(int step=0;step<3;++step) dave->Update();
        const auto pixels=Differences(actual,reference);
        const auto visible=Differences(reference,without);
        const bool pass=matrix && pixels==0 && visible>20;
        wrong+=!pass;
        log << "prop line=" << lines[i] << " matrix=" << matrix << " different=" << pixels
            << " visible=" << visible << " pass=" << pass << std::endl;
    }

    // Preserve by REANIM_CRAZY_DAVE type, including a Dave not named by app IDs.
    app.mCrazyDaveState=CRAZY_DAVE_IDLING; app.mCrazyDaveBlinkCounter=0;
    app.UpdateCrazyDave();
    const auto body=app.mCrazyDaveReanimID, blink=app.mCrazyDaveBlinkReanimID;
    Require(Alive(app,body) && Alive(app,blink),"Upsell blink fixture missing");
    const auto extra=app.ReanimationGetID(app.AddReanimation(0,0,0,REANIM_CRAZY_DAVE));
    const auto ordinary=app.ReanimationGetID(app.AddReanimation(0,0,0,REANIM_SUN));
    const unsigned before=DaveCount(app);
    c.ClearUpsellBoard();
    const bool clear=Alive(app,body) && Alive(app,blink) && Alive(app,extra)
        && !Alive(app,ordinary) && DaveCount(app)==before;
    wrong+=!clear;
    log << "clear body=" << Alive(app,body) << " blink=" << Alive(app,blink)
        << " extra-dave=" << Alive(app,extra) << " ordinary=" << Alive(app,ordinary)
        << " daves-before=" << before << " daves-after=" << DaveCount(app) << " pass=" << clear << std::endl;
    log << "wrong=" << wrong << std::endl;
    // The old code killed Dave: do not feed its dead ID into StopTalking.
    Require(wrong==0,"Upsell differs from 1073; see upsell-cases.txt");
    app.mEffectSystem->ProcessDeleteQueue();
    Require(Alive(app,body) && Alive(app,blink) && Alive(app,extra),"Upsell delete queue reclaimed a preserved Dave");
    app.CrazyDaveStopTalking();
    c.ClearUpsellBoard();
    app.mEffectSystem->ProcessDeleteQueue();
    Require(Alive(app,body) && Alive(app,blink) && Alive(app,extra),"Repeated Upsell clear changed Dave ownership");
    app.ReanimationGet(extra)->ReanimationDie();
    app.CrazyDaveDie();
    app.mEffectSystem->ProcessDeleteQueue();
    Require(DaveCount(app)==0,"Upsell fixture cleanup retained a Dave");
    Report("portable-upsell-original-first-line-and-entry-handoff",app);
    Report("portable-upsell-three-props-matrices-and-gpu",app);
    Report("portable-upsell-type-preserving-clear-and-cleanup",app);
    return wrong;
}
}

void ModernVulkanUpsellSmokeTick(LawnApp& app) {
    static int stage=0;
    static std::uint32_t started=0,deadline=0;
    static int lastLine=3299,visited=0;
    static bool oldCheatKeys=false;
    Require(getenv("PVZ_MODERN_HIDDEN") && getenv("PVZ_APPDATA_DIR") && app.mNoSoundNeeded,
        "Upsell probe must be hidden, isolated and silent");
    if(stage==0) {
        if(!app.mLoaded || !app.mTitleScreen || !app.mTitleScreen->mLoadingThreadComplete) return;
        app.LoadingCompleted(); started=app.mUpdateCount; deadline=started+100; stage=1; return;
    }
    if(stage==6) return;
    Require(app.mUpdateCount-started<3500,"Upsell probe timed out");
    if(app.mUpdateCount<deadline) return;
    if(stage==1) {
        app.KillGameSelector();
        app.PreNewGame(GAMEMODE_INTRO,false);
        app.mBoard->Pause(true);
        app.mBoard->mCutScene->PreloadResources();
        std::ofstream log(ProbePath("upsell-cases.txt")); Require(bool(log),"Cannot write Upsell evidence");
        ComponentCases(app,log);
        app.DoBackToMain(); deadline=app.mUpdateCount+50; stage=2; return;
    }
    if(stage==2) {
        Require(!app.mBoard && app.mGameSelector && DaveCount(app)==0,"Upsell component cleanup failed");
        app.KillGameSelector(); app.PreNewGame(GAMEMODE_INTRO,false);
        oldCheatKeys=app.mTodCheatKeys; app.mTodCheatKeys=true;
        stage=4; return;
    }
    if(stage==4) {
        auto& c=*app.mBoard->mCutScene;
        if(c.mCrazyDaveLastTalkIndex>=3300) {
            Require(Alive(app,app.mCrazyDaveReanimID),"Natural Upsell lost its Dave");
            const int line=c.mCrazyDaveLastTalkIndex;
            if(line!=lastLine) {
                Require(line==lastLine+1 && line<=3317,"Upsell repeated or skipped a dialogue line");
                lastLine=line; ++visited;
                std::ofstream log(ProbePath("upsell-playback.txt"),std::ios::app);
                Require(bool(log),"Cannot write Upsell playback evidence");
                log << "line=" << line << " time=" << c.mCutsceneTime << " countdown=" << c.mCrazyDaveCountDown
                    << " background=" << int(app.mBoard->mBackground) << " hidden=" << c.mUpsellHideBoard
                    << " challenge=" << bool(c.mUpsellChallengeScreen) << " dave-alive=1" << std::endl;
                if(line==3312) Require(app.mBoard->mBackground==BACKGROUND_3_POOL && !c.mUpsellHideBoard,"Upsell pool transition");
                if(line==3313) Require(app.mBoard->mBackground==BACKGROUND_4_FOG && !c.mUpsellHideBoard,"Upsell fog transition");
                if(line==3314) Require(c.mUpsellChallengeScreen && !c.mUpsellHideBoard,"Upsell challenge transition");
                if(line==3315) Require(!c.mUpsellChallengeScreen && c.mUpsellHideBoard,"Upsell garden transition");
                if(line==3316) Require(app.mBoard->mBackground==BACKGROUND_5_ROOF && !c.mUpsellHideBoard,"Upsell roof transition");
                if(line==3317) Require(c.mUpsellHideBoard,"Upsell final clear");
            }
            if(line==3317 && c.mCrazyDaveCountDown==0) {
                const auto* menu=app.mBoard->mMenuButton;
                const auto* store=app.mBoard->mStoreButton;
                Require(visited==18 && !menu->mBtnNoDraw && !store->mBtnNoDraw
                    && menu->mX==510 && menu->mY==480 && menu->mWidth==210 && menu->mHeight==46
                    && store->mX==510 && store->mY==420 && store->mWidth==210 && store->mHeight==46,
                    "Upsell final buttons differ from 1073");
                Report("portable-upsell-18-lines-debug-skip-and-scene-transitions",app);
                app.mTodCheatKeys=oldCheatKeys;
                app.DoBackToMain(); deadline=app.mUpdateCount+50; stage=5; return;
            }
            // Exercise the existing debug click route, never inject OS input.
            // Keep line3311's countdown90 event; this is not a duration test.
            if(line!=3311 || c.mCrazyDaveCountDown<=90) c.MouseDown(0,0);
        }
        return;
    }
    Require(!app.mBoard && app.mGameSelector && DaveCount(app)==0,"Upsell did not cleanly return to menu");
    if(!app.mWidgetManager->DrawScreen()) return;
    ProbeScreenshot(app);
    Report("PASS upsell; dialogue, three props, type-based cleanup, full transitions and menu",app);
    app.CloseRequestAsync(); stage=6;
}
