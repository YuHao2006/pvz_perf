#include "ModernVulkanSmoke.h"
#include "AttachmentLifetimeSmoke.h"
#include "LawnApp.h"
#include "Widget/CreditScreen.h"
#include "Widget/TitleScreen.h"
#include "Widget/GameButton.h"
#include "Widget/LawnDialog.h"
#include "Resources.h"
#include "Sexy.TodLib/Attachment.h"
#include "Sexy.TodLib/EffectSystem.h"
#include "Sexy.TodLib/Reanimator.h"
#include "graphics/DDImage.h"
#include "graphics/DDInterface.h"
#include "graphics/RenderInterface.h"
#include "graphics/Graphics.h"
#include "graphics/Font.h"
#include "widget/WidgetManager.h"
#include <array>
#include <fstream>
#include <stdexcept>

namespace {
struct CreditsAppAccess : LawnApp { static constexpr auto Cleanup = &CreditsAppAccess::ProcessSafeDeleteList; };
class ResumeCreditsProbe final:public Sexy::Widget {
    LawnApp& app;CreditScreen& credits;Sexy::PerfTimer elapsed;
public:
    bool seen=false,answered=false;double entryDuration=0,entryTime=0,answerTime=0;
    ResumeCreditsProbe(LawnApp& a,CreditScreen& c):app(a),credits(c){
        mMouseVisible=false;mWidgetFlagsMod.mAddFlags=Sexy::WIDGETFLAGS_UPDATE;
        elapsed.Start();app.mWidgetManager->AddWidget(this);
    }
    ~ResumeCreditsProbe() override {if(mWidgetManager)mWidgetManager->RemoveWidget(this);}
    double Now(){return elapsed.GetDuration();}
    void Update() override {
        if(answered)return;
        auto* dialog=dynamic_cast<LawnDialog*>(app.GetDialog(DIALOG_MESSAGE));
        if(!dialog)return;
        if(!seen){seen=true;entryDuration=credits.mTimerSinceStart.GetDuration();entryTime=Now();}
        if(Now()-entryTime<250 ||
            (dialog->mButtonDelay>=0 && dialog->mUpdateCnt<=static_cast<unsigned>(dialog->mButtonDelay)))return;
        if(!credits.mCreditsPaused)throw std::runtime_error("Credits modal did not set paused state");
        answered=true;answerTime=Now();dialog->ButtonDepress(Sexy::Dialog::ID_YES);
    }
};

void ProbePauseClock(LawnApp& app,std::ofstream& evidence) {
    if(app.mCreditScreen) throw std::runtime_error("Pause-clock fixture already has a credits owner");
    app.ShowCreditScreen();
    auto& credits=*app.mCreditScreen;
    credits.SetVisible(false);
    credits.mTimerSinceStart.Start();credits.mTimerSinceStart.SetStartTime(12000);
    ResumeCreditsProbe resume(app,credits);
    const double before=credits.mTimerSinceStart.GetDuration();
    credits.PauseCredits();
    const double after=credits.mTimerSinceStart.GetDuration();
    const double afterAnswer=resume.Now()-resume.answerTime;
    if(!resume.seen || !resume.answered || credits.mCreditsPaused || app.GetDialog(DIALOG_MESSAGE) ||
        after<before-1 || after>resume.entryDuration+afterAnswer+1)
        throw std::runtime_error("Real Credits modal wait was not excluded from its QPC timeline");
    evidence<<"real-modal-pause before="<<before<<" at-entry="<<resume.entryDuration
        <<" wait="<<resume.answerTime-resume.entryTime<<" after="<<after<<" return-cost="<<afterAnswer<<std::endl;
    ModernSmoke::Report("credits-real-modal-qpc-resume",app);
    app.KillCreditScreen();
    (app.*CreditsAppAccess::Cleanup)();
}

void ProbeDialogueFonts(CreditScreen& credits,LawnApp& app,std::ofstream& evidence) {
    using namespace ModernSmoke;
    using namespace Sexy;
    auto& render=*app.mDDInterface->mRenderInterface;
    auto* screen=app.mDDInterface->mScreenImage;
    unsigned badFonts=0,badFrames=0,checked=0;
    for(int phase:{2,3}) {
        auto* root=credits.PlayReanim(phase);
        const std::array wordTracks={root->FindTrackIndex(ReanimTrackId::Words),
            root->FindTrackIndex(ReanimTrackId::Words2)};
        for(int track=0;track<root->mDefinition->mTracks.count;++track)
            root->mTrackInstances[track].mRenderGroup=RENDER_GROUP_HIDDEN;
        for(int track:wordTracks) {
            root->mTrackInstances[track].mRenderGroup=3;
            root->mTrackInstances[track].mTrackColor=Color::Black;
            auto& transforms=root->mDefinition->mTracks.tracks[track].mTransforms;
            for(int frame=0;frame<transforms.count;++frame) {
                const auto* expected=frame<124?FONT_BRIANNETOD32BLACK:FONT_BRIANNETOD32;
                badFonts+=transforms.mTransforms[frame].mFont!=expected;
            }
        }
        for(int frame:{20,52,84}) {
            root->mAnimTime=(float(frame)+0.25f)/float(root->mDefinition->mTracks.tracks->mTransforms.count-1);
            const auto draw=[&] {
                screen->FillRect(Rect(0,0,800,600),Color::White,0);
                Graphics g(screen);g.mLinearBlend = true;
                // 1073 intentionally draws group 3 twice. Keep its filtering,
                // transforms and draw count identical in both comparisons.
                root->DrawRenderGroup(&g,3);root->DrawRenderGroup(&g,3);
                render.Flush();
                return render.mRenderer->ReadScenePixels();
            };
            const auto actual=draw();
            const auto name="credits-dialogue-"+std::to_string(phase)+"-"+std::to_string(frame);
            Capture(name.c_str(),app,2);
            std::vector<std::pair<_Font**,_Font*>> saved;
            struct RestoreFonts {
                decltype(saved)& values;
                ~RestoreFonts(){for(auto [slot,font]:values) *slot=font;}
            } restore{saved};
            // Explicit 1073 font selection is independent of the production
            // preloader's type/index lookup. Restore shared definitions even
            // if the renderer throws during this private smoke process.
            for(int track:wordTracks) {
                auto& transforms=root->mDefinition->mTracks.tracks[track].mTransforms;
                for(int i=0;i<124;++i) {
                    auto& font=transforms.mTransforms[i].mFont;
                    saved.emplace_back(&font,font);font=FONT_BRIANNETOD32BLACK;
                }
            }
            const auto expected=draw();
            Capture((name+"-reference").c_str(),app,2);
            size_t different=0,actualInk=0,expectedInk=0;
            for(size_t i=0;i<actual.size();++i) {
                different+=actual[i]!=expected[i];
                actualInk+=(actual[i]&0xffffffu)!=0xffffffu;
                expectedInk+=(expected[i]&0xffffffu)!=0xffffffu;
            }
            evidence<<"dialogue phase="<<phase<<" frame="<<frame<<" actualInk="<<actualInk
                <<" referenceInk="<<expectedInk<<" differentPixels="<<different<<std::endl;
            badFrames+=different!=0 || expectedInk==0;++checked;
        }
    }
    evidence<<"dialogue checked="<<checked<<" badFrames="<<badFrames<<" badFontSlots="<<badFonts<<std::endl;
    if(checked!=6 || badFrames || badFonts)
        throw std::runtime_error("Credits dialogue font differs from original 1073 no-outline font");
    Report("credits-dialogue-six-gpu-frames-original-font-boundary",app);
}

void ProbeClippedBackgrounds(CreditScreen& credits,LawnApp& app,std::ofstream& evidence) {
    using namespace ModernSmoke;
    using namespace Sexy;
    auto& render=*app.mDDInterface->mRenderInterface;
    auto* screen=app.mDDInterface->mScreenImage;
    std::array<unsigned,6> visibleWindows{};
    unsigned checked=0,wrong=0;
    // Isolate the real Draw() background branches by hiding this private
    // movie instance's render groups. Definitions/images and transforms stay
    // untouched; no fake renderer, coordinate override or modified asset.
    for(int phase=2;phase<=3;++phase) {
        auto* root=credits.PlayReanim(phase);
        credits.mCreditsPhase=phase==2?CREDITS_MAIN2:CREDITS_MAIN3;
        credits.mDrawCount=3;credits.mDrawBrain=false;
        for(int track=0;track<root->mDefinition->mTracks.count;++track)
            root->mTrackInstances[track].mRenderGroup=RENDER_GROUP_HIDDEN;
        for(int frame:{0,10,20,30,40,60,80,100,120}) {
            root->mAnimTime=(float(frame)+0.25f)/float(root->mDefinition->mTracks.tracks->mTransforms.count-1);
            std::array<ReanimatorTransform,4> tracks;
            const std::array ids={ReanimTrackId::Background,ReanimTrackId::Background2,
                ReanimTrackId::Background3,ReanimTrackId::Background4};
            for(size_t i=0;i<ids.size();++i) root->GetCurrentTransform(root->FindTrackIndex(ids[i]),&tracks[i]);
            Graphics actual(screen);credits.Draw(&actual);render.Flush();
            const auto pixels=render.mRenderer->ReadScenePixels();
            screen->FillRect(Rect(0,0,800,600),Color::Black,0);
            Graphics reference(screen);reference.mLinearBlend = true;
            const auto draw=[&](size_t track,Image* image,float dx,float dy,unsigned slot) {
                const auto& t=tracks[track];if(t.mFrame==-1.0f) return;
                Graphics clipped(reference);
                clipped.ClipRect(t.mTransX,t.mTransY,t.mImage->mWidth-1,t.mImage->mHeight-1);
                clipped.DrawImageF(image,t.mTransX+dx,t.mTransY+dy);
                if(clipped.mClipRect.mWidth>0 && clipped.mClipRect.mHeight>0) ++visibleWindows[slot];
            };
            // Independent constants from 1073 CreditScreen::Draw 00438850:
            // 00438CE8 subtracts double 600, 00438F42/61 subtract 360/80.
            if(phase==2) {
                draw(1,IMAGE_BACKGROUND1,-400.0f,-300.0f,0);
                draw(2,IMAGE_BACKGROUND1,-600.0f,-300.0f,1);
                draw(3,IMAGE_BACKGROUND2,-400.0f,-300.0f,2);
            } else {
                draw(0,IMAGE_BACKGROUND1,-80.0f,-360.0f,3);
                const auto& t=tracks[2];
                if(t.mFrame!=-1.0f) {
                    Graphics pool(reference);pool.mTransX+=t.mTransX-20.0f;pool.mTransY+=t.mTransY-260.0f;
                    pool.ClipRect(20,260,t.mImage->mWidth-1,t.mImage->mHeight-1);
                    pool.DrawImageF(IMAGE_BACKGROUND3,-220.0f,0.0f);
                    pool.DrawImageF(IMAGE_POOL,34.0f,278.0f);
                    if(pool.mClipRect.mWidth>0 && pool.mClipRect.mHeight>0) ++visibleWindows[4];
                }
                draw(3,IMAGE_BACKGROUND2,-400.0f,-300.0f,5);
            }
            render.Flush();const auto expected=render.mRenderer->ReadScenePixels();
            size_t different=0,ink=0;
            for(size_t i=0;i<pixels.size();++i){different+=pixels[i]!=expected[i];ink+=(expected[i]&0xffffffu)!=0;}
            evidence<<"background phase="<<phase<<" frame="<<frame<<" referenceInk="<<ink
                <<" differentPixels="<<different<<std::endl;
            wrong+=different!=0;++checked;
        }
    }
    evidence<<"background checked="<<checked<<" wrong="<<wrong<<" windows=";
    for(auto count:visibleWindows) evidence<<count<<',';
    evidence<<std::endl;
    if(checked!=18 || wrong || std::any_of(visibleWindows.begin(),visibleWindows.end(),[](auto n){return n==0;}))
        throw std::runtime_error("Credits clipped backgrounds differ from original 1073 placement");
    Report("credits-background-18-real-gpu-six-original-windows",app);
}

void ProbeCreditsRoll(CreditScreen& credits,LawnApp& app,std::ofstream& evidence) {
    using namespace ModernSmoke;
    const auto require=[](bool ok,const char* message) {if(!ok) throw std::runtime_error(message);};
    require(credits.mCreditSections.size()==11,"1073 Credits did not load all eleven role/name pairs");
    require(credits.mCreditSections[0].mRoles=="^PLANTS VS. ZOMBIES" &&
        credits.mCreditSections[2].mNames.find("GEORGE FAN")!=std::string::npos &&
        credits.mCreditSections[8].mNames.find("DAVID FRANZI")!=std::string::npos &&
        credits.mCreditSections.back().mRoles=="^THANK YOU FOR PLAYING!",
        "1073 Credits titles, original team or GOTY team missing");
    require(credits.mCreditsContentHeight>400,"Credits content height only covers an abbreviated list");
    credits.mCreditsPhase=CREDITS_END;
    credits.mCreditsPhaseCounter=0;
    credits.mUpdateCount=2;
    credits.mDontSync=false;
    credits.mCreditsPaused=false;
    for(int tick=0;tick<100;++tick) credits.Update();
    require(credits.mReplayButton->mVisible && credits.mMainMenuButton->mVisible,
        "Credits end buttons did not appear through the normal update path");
    credits.mCreditsScrollPosition=0;
    auto& render=*app.mDDInterface->mRenderInterface;
    auto* screen=app.mDDInterface->mScreenImage;
    // The heading marker is syntax, not a literal glyph, and 1073 uses the
    // same 16-point font as the body (not a separate static 28-point title).
    screen->FillRect(Rect(0,0,800,600),Color::Black,0);
    Graphics reference(screen);
    reference.mFont = Sexy::FONT_HOUSEOFTERROR16;reference.mColor = Color::White;
    const SexyString title="PLANTS VS. ZOMBIES";
    reference.DrawString(title,380-Sexy::FONT_HOUSEOFTERROR16->StringWidth(title)/2,20);
    render.Flush();const auto heading=render.mRenderer->ReadScenePixels();
    Graphics full(screen);credits.Draw(&full);render.Flush();
    auto pixels=render.mRenderer->ReadScenePixels();
    require(std::equal(heading.begin(),heading.begin()+800*40,pixels.begin()),
        "Credits heading marker, font, position or duplicate static title differs");
    // A black/white credit roll is legitimately far below the normal colorful
    // scene's 128-color gate. Require ink in BOTH columns instead.
    unsigned rolesInk=0,namesInk=0;
    for(int y=42;y<520;++y) {
        for(int x=20;x<350;++x) if(pixels[y*800+x]&0xffffffu) ++rolesInk;
        for(int x=380;x<780;++x) if(pixels[y*800+x]&0xffffffu) ++namesInk;
    }
    require(rolesInk>500 && namesInk>500,"Credits role/name columns contain no rendered staff list");
    Capture("credits-roll-original-team",app,2);
    credits.mCreditsScrollPosition=-300;
    Graphics later(screen);credits.Draw(&later);
    Capture("credits-roll-goty-team",app,2);

    // DrawFinalCredits itself must not paint into the buttons' strip.
    screen->FillRect(Rect(0,0,800,600),Color(11,22,33),0);
    Graphics clipped(screen);credits.DrawFinalCredits(&clipped);render.Flush();
    pixels=render.mRenderer->ReadScenePixels();
    require(std::all_of(pixels.begin()+800*(credits.mReplayButton->mY-10),pixels.end(),
        [](auto pixel){return pixel==0xff0b1621u;}),"Credits text spills into the replay/menu strip");
    credits.mCreditsScrollPosition=200;
    for(int tick=0;tick<100;++tick) credits.Update();
    require(credits.mCreditsScrollPosition==175,"1073 Credits must move 0.25 pixels per update");
    credits.mCreditsPaused=true;credits.Update();
    require(credits.mCreditsScrollPosition==175,"Paused Credits continue scrolling");
    credits.mCreditsPaused=false;
    credits.mCreditsScrollPosition=-float(credits.mCreditsContentHeight+120)+0.25f;
    credits.Update();
    require(credits.mCreditsScrollPosition==-float(credits.mCreditsContentHeight+120),
        "Credits wrapped before the 1073 threshold");
    credits.Update();
    require(credits.mCreditsScrollPosition==float(credits.mMainMenuButton->mY-50),
        "Credits did not wrap to the 1073 starting position");
    {
        // Use real parent/child drawing, so DrawFinalCredits' temporary clip
        // cannot accidentally clip out the independent replay/menu widgets.
        struct Registration {
            Sexy::WidgetManager& manager;
            CreditScreen& credits;
            Registration(Sexy::WidgetManager& m,CreditScreen& c):manager(m),credits(c){manager.AddWidget(&credits);}
            ~Registration(){manager.RemoveWidget(&credits);}
        } registration(*app.mWidgetManager,credits);
        credits.mCreditsScrollPosition=0;
        Sexy::ModalFlags flags;app.mWidgetManager->InitModalFlags(&flags);
        Graphics ui(screen);credits.DrawAll(&flags,&ui);render.Flush();
        pixels=render.mRenderer->ReadScenePixels();
        require(std::any_of(pixels.begin()+800*554,pixels.end(),[](auto p){return (p&0xffffffu)!=0;}),
            "Credits roll clip removed the end buttons");
        int x=0,y=0;
        require(app.mWidgetManager->GetWidgetAt(380,575,&x,&y)==credits.mMainMenuButton &&
            app.mWidgetManager->GetWidgetAt(50,570,&x,&y)==credits.mReplayButton,
            "Credits end buttons are not hit-testable");
        Capture("credits-roll-with-buttons",app);
    }
    evidence<<"end-roll sections=11 height="<<credits.mCreditsContentHeight
        <<" speed=0.25 clipBottom="<<credits.mReplayButton->mY-10<<" pause/wrap/header=PASS\n";
    Report("credits-roll-all-sections-heading-clip-speed-pause-wrap",app);
}

void ProbeVisibilityTransitions(CreditScreen& credits,std::ofstream& evidence) {
    // v2 记录的 attacher 编码文本已整体进段表（帧 mText 为空），v1“同文本
    // 可见/隐藏对”判据失效。改为行为自发现：同一轨道先扫出“有附件帧”与
    // “无附件帧”（后者须在见过活附件之后，排除从未激活的轨道），再验证
    // 冷隐藏不生成 → 可见挂上 → 重复可见不重建 → 隐藏杀缓存 → 复显重挂。
    auto* parent=credits.PlayReanim(1);
    for(int track=0;track<parent->mDefinition->mTracks.count;++track) {
        const auto id=static_cast<ReanimTrackId>(ReanimatorTrackIdAt(parent->mReanimationType,track));
        if(!ReanimTrackRanges::attacher__.Contains(id)) continue;
        const auto& transforms=parent->mDefinition->mTracks.tracks[track].mTransforms;
        const int last=transforms.count-1;
        auto& instance=parent->mTrackInstances[track];
        const auto update=[&](int frame) {
            parent->mAnimTime=(float(frame)+0.25f)/float(last);
            parent->UpdateAttacherTrack(track);
        };
        const auto attachmentAlive=[&]() {
            auto* child=FindReanimAttachment(instance.mAttachmentID);
            return child!=nullptr && !child->mDead;
        };
        int visibleFrame=-1,hiddenFrame=-1;
        for(int f=0;f<last && (visibleFrame<0||hiddenFrame<0);++f) {
            update(f);
            if(attachmentAlive()) {
                if(visibleFrame<0) visibleFrame=f;
            } else if(visibleFrame>=0 && hiddenFrame<0) {
                hiddenFrame=f;
            }
        }
        if(visibleFrame<0||hiddenFrame<0) continue;
        AttachmentDie(instance.mAttachmentID);  // 清掉扫描残留，回到冷起点
        update(hiddenFrame);
        if(instance.mAttachmentID!=AttachmentID::ATTACHMENTID_NULL)
            throw std::runtime_error("Cold hidden Credits track spawned an attachment");
        update(visibleFrame);
        auto* oldChild=FindReanimAttachment(instance.mAttachmentID);
        if(!oldChild || oldChild->mDead)
            throw std::runtime_error("Hidden state poisoned the visible attachment spawn");
        const auto oldID=instance.mAttachmentID;
        update(visibleFrame);
        if(instance.mAttachmentID!=oldID)
            throw std::runtime_error("Unchanged visible attachment was unnecessarily recreated");
        update(hiddenFrame);
        if(instance.mAttachmentID!=AttachmentID::ATTACHMENTID_NULL || !oldChild->mDead)
            throw std::runtime_error("Cached visible Credits attachment survived its hidden frame");
        update(visibleFrame);
        auto* newChild=FindReanimAttachment(instance.mAttachmentID);
        if(!newChild || newChild->mDead || instance.mAttachmentID==oldID)
            throw std::runtime_error("Credits attachment failed to reappear after hiding");
        evidence<<"visibility-cycle type="<<int(parent->mReanimationType)
            <<" track="<<static_cast<std::uint32_t>(id)<<" visible="<<visibleFrame
            <<" hidden="<<hiddenFrame<<" cold-hidden/visible/hidden/visible=PASS\n";
        return;
    }
    throw std::runtime_error("Credits fixture lacks a visible/hidden attacher transition");
}
}

// Hidden, opt-in integration test: real pak64, CreditScreen::UpdateMovie and
// CreditScreen::Draw. No synthesized renderer, mouse injection or save edits.
void ModernVulkanCreditsSmokeTick(LawnApp& app) {
    using namespace ModernSmoke;
    static int stage=0;
    static std::uint32_t deadline=0;
    if(stage==0) {
        if(!app.mLoaded || !app.mTitleScreen || !app.mTitleScreen->mLoadingThreadComplete) return;
        app.LoadingCompleted();
        stage=1;deadline=app.mUpdateCount+20;
        return;
    }
    if(app.mUpdateCount<deadline || stage==3) return;
    if(stage==1) {
        RequireDeletionBoundary(app,"credits-title-to-menu");
        app.KillGameSelector();
        // Let the normal deferred widget deletion finish before Credits frees
        // the effect system, exactly as an ordinary scene transition does.
        stage=2;deadline=app.mUpdateCount+20;
        return;
    }
    stage=3;
    RequireDeletionBoundary(app,"credits-selector-before-movie");
    std::ofstream evidence(ProbePath("credits-attachments.txt"));
    if(!evidence) throw std::runtime_error("Cannot write Credits attachment evidence");
    unsigned violations=0,checked=0,captures=0,steps=0;
    ProbePauseClock(app,evidence);
    {
        CreditScreen credits(&app);
        credits.Resize(0,0,800,600);
        credits.PreLoadCredits();
        ProbeDialogueFonts(credits,app,evidence);
        ProbeClippedBackgrounds(credits,app,evidence);
        ProbeVisibilityTransitions(credits,evidence);
        for(int pass=0;pass<2;++pass) {
            app.mEffectSystem->EffectSystemFreeAll();
            credits.mCreditsReanimID=ReanimationID::REANIMATIONID_NULL;
            credits.mCreditsPhase=CREDITS_MAIN1;
            credits.mCreditsPhaseCounter=0;
            credits.mDrawBrain=false;
            credits.mDrawCount=3;
            credits.PlayReanim(1);
            struct Shot { CreditsPhase phase; int frame; };
            constexpr Shot shots[]={{CREDITS_MAIN1,220},{CREDITS_MAIN1,315},
                {CREDITS_MAIN2,60},{CREDITS_MAIN2,210},{CREDITS_MAIN3,60},{CREDITS_MAIN3,250}};
            unsigned nextShot=0;
            for(int tick=0;credits.mCreditsPhase!=CREDITS_END && tick<20000;++tick) {
                credits.UpdateMovie();
                app.mEffectSystem->ProcessDeleteQueue();
                ++steps;
                auto* root=app.ReanimationGet(credits.mCreditsReanimID);
                ReanimatorFrameTime rootTime;root->GetFrameTime(&rootTime);
                if(tick%14==0) {
                    Reanimation* reanim=nullptr;
                    while(app.mEffectSystem->mReanimationHolder->mReanimations.IterateNext(reanim)) {
                        if(reanim->mDead) continue;
                        for(int track=0;track<reanim->mDefinition->mTracks.count;++track) {
                            const auto id=static_cast<ReanimTrackId>(ReanimatorTrackIdAt(reanim->mReanimationType,track));
                            if(!ReanimTrackRanges::attacher__.Contains(id)) continue;
                            ReanimatorTransform transform;reanim->GetCurrentTransform(track,&transform);
                            ++checked;
                            if(transform.mFrame!=-1.0f || reanim->mTrackInstances[track].mAttachmentID==AttachmentID::ATTACHMENTID_NULL) continue;
                            if(violations++<30)
                                evidence<<"hidden-live pass="<<pass<<" phase="<<credits.mCreditsPhase
                                    <<" frame="<<rootTime.mAnimFrameBeforeInt<<" type="<<int(reanim->mReanimationType)
                                    <<" track="<<static_cast<std::uint32_t>(id)<<'\n';
                        }
                    }
                }
                if(nextShot<std::size(shots) && credits.mCreditsPhase==shots[nextShot].phase &&
                    rootTime.mAnimFrameBeforeInt>=shots[nextShot].frame) {
                    auto& render=*app.mDDInterface->mRenderInterface;
                    auto* screen=app.mDDInterface->mScreenImage;
                    screen->FillRect(Rect(0,0,800,600),Color(255,0,0),0);
                    Graphics first(screen);credits.Draw(&first);render.Flush();
                    const auto expected=render.mRenderer->ReadScenePixels();
                    screen->FillRect(Rect(0,0,800,600),Color(0,0,255),0);
                    Graphics second(screen);credits.Draw(&second);render.Flush();
                    if(expected!=render.mRenderer->ReadScenePixels())
                        throw std::runtime_error("Credits output depends on the previous framebuffer");
                    const auto name="credits-pass"+std::to_string(pass)+"-phase"+
                        std::to_string(int(credits.mCreditsPhase)+1)+"-frame"+std::to_string(shots[nextShot].frame);
                    Capture(name.c_str(),app);
                    evidence<<name<<" previous-frame-independent\n";
                    ++nextShot;++captures;
                }
            }
            if(credits.mCreditsPhase!=CREDITS_END || nextShot!=std::size(shots))
                throw std::runtime_error("Credits regression did not finish its real movie timeline");
            Report(pass==0?"credits-first-play-finished":"credits-replay-finished",app);
            if(pass==1) ProbeCreditsRoll(credits,app,evidence);
        }
    }
    app.mEffectSystem->EffectSystemFreeAll();
    evidence<<"steps="<<steps<<" checked="<<checked<<" hiddenLive="<<violations<<" captures="<<captures<<'\n';
    evidence.close();
    if(violations) throw std::runtime_error("Credits kept hidden attachments alive: "+std::to_string(violations));
    CreditsAttachmentRetentionProbe(app);
    Report("PASS credits; hidden attachments and retained canvas verified",app);
    app.CloseRequestAsync();
}
