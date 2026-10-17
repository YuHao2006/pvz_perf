#include "PortableCreditsPauseSmoke.h"
#include "ModernVulkanSmoke.h"
#include "LawnApp.h"
#include "System/Music.h"
#include "Widget/CreditScreen.h"
#include "Widget/LawnDialog.h"
#include "widget/WidgetManager.h"
#include "widget/WidgetLifetimeHold.h"
#include <array>
#include <fstream>
#include <memory>
#include <stdexcept>

namespace {
using namespace ModernSmoke;
void Require(bool ok, const char* why) { if (!ok) throw std::runtime_error(why); }
struct AppAccess : LawnApp { static constexpr auto Cleanup = &AppAccess::ProcessSafeDeleteList; };
class ObservedCredits final : public CreditScreen {
    bool& dead;
public:
    ObservedCredits(LawnApp& app, bool& destroyed) : CreditScreen(&app), dead(destroyed) {}
    ~ObservedCredits() override { dead = true; }
};
ObservedCredits* Open(LawnApp& app, bool& dead) {
    Require(!app.mCreditScreen, "Credits fixture already has an owner");
    auto* screen = new ObservedCredits(app, dead);
    app.mCreditScreen = screen;
    screen->Resize(0,0,800,600);
    // This suite tests the real registered modal caller, not movie rendering.
    // The existing Credits GPU suite separately exercises the full timeline.
    screen->SetVisible(false);
    app.mWidgetManager->AddWidget(screen);
    app.mWidgetManager->SetFocus(screen);
    screen->mTimerSinceStart.Start(); screen->mTimerSinceStart.SetStartTime(12000);
    return screen;
}
enum class Transition { None, Remove, Replace, Menu };
struct Case { const char* name; int result; Transition transition; bool reenter = false; };
constexpr std::array cases{
    Case{"resume",Dialog::ID_YES,Transition::None},
    Case{"cancel",0,Transition::None},
    Case{"main-menu",Dialog::ID_NO,Transition::None},
    Case{"nested-pause",Dialog::ID_YES,Transition::None,true},
    Case{"removed-yes",Dialog::ID_YES,Transition::Remove},
    Case{"removed-no",Dialog::ID_NO,Transition::Remove},
    Case{"removed-cancel",0,Transition::Remove},
    Case{"replacement-yes",Dialog::ID_YES,Transition::Replace},
    Case{"replacement-no",Dialog::ID_NO,Transition::Replace},
    Case{"replacement-cancel",0,Transition::Replace},
    Case{"menu-yes",Dialog::ID_YES,Transition::Menu},
    Case{"menu-no",Dialog::ID_NO,Transition::Menu}};

class Reply final : public Widget {
    LawnApp& app; CreditScreen& old; const Case& test; bool& oldDead; bool& replacementDead;
    PerfTimer clock;
    unsigned ticks = 0;
public:
    // On the deliberately unfixed executable, retain the old object in the
    // fixture instead of knowingly dereferencing freed memory. Needing this
    // rescue is itself a failed assertion, never a production fallback.
    std::unique_ptr<WidgetLifetimeHold> emergency;
    CreditScreen* replacement = nullptr;
    bool answered = false, ownHold = false, aliveInCollector = false;
    double answerTime = 0;
    Reply(LawnApp& a, CreditScreen& c, const Case& t, bool& dead, bool& otherDead)
        : app(a), old(c), test(t), oldDead(dead), replacementDead(otherDead) {
        mMouseVisible = false; mWidgetFlagsMod.mAddFlags = WIDGETFLAGS_UPDATE;
        clock.Start(); app.mWidgetManager->AddWidget(this);
    }
    ~Reply() override { if (mWidgetManager) mWidgetManager->RemoveWidget(this); }
    double Now() { return clock.GetDuration(); }
    void Update() override {
        if (answered) return;
        Require(++ticks < 500, "Credits pause responder timed out");
        auto* dialog = dynamic_cast<LawnDialog*>(app.GetDialog(DIALOG_MESSAGE));
        if (!dialog || Now() < 250 ||
            (dialog->mButtonDelay >= 0 && dialog->mUpdateCnt <= unsigned(dialog->mButtonDelay))) return;
        Require(old.mCreditsPaused && app.mMusic->mPaused, "Credits failed to pause its timeline and logical music");
        ownHold = old.mDeferredDeleteHolds > 0;
        if (!ownHold) emergency = std::make_unique<WidgetLifetimeHold>(old);
        if (test.reenter) {
            old.PauseCredits();
            Require(app.GetDialog(DIALOG_MESSAGE) == dialog, "Nested pause replaced its own dialog");
        }
        answered = true;
        if (test.result) dialog->ButtonDepress(test.result);
        else app.KillDialog(DIALOG_MESSAGE);
        if (test.transition != Transition::None) {
            app.KillCreditScreen();
            if (test.transition == Transition::Replace) {
                replacement = Open(app, replacementDead);
                replacement->mCreditsPaused = true;
                replacement->mTimerSinceStart.SetStartTime(32000);
            } else if (test.transition == Transition::Menu) app.DoBackToMain();
            // This is deliberately the replacement scene's logical state.
            // The no-audio suite must not call BASS with synthetic positions.
            app.mMusic->mCurMusicTune = MUSIC_TUNE_FOG_RIGORMORMIST;
            app.mMusic->mPaused = true;
            app.mMusic->mPauseOffset = 0x1234;
        }
        (app.*AppAccess::Cleanup)();
        aliveInCollector = !oldDead;
        Require(aliveInCollector, "Credits was destroyed inside its own pause wait");
        answerTime = Now();
    }
};
}

void PortableCreditsPauseSmoke(LawnApp& app) {
    Require(app.mNoSoundNeeded && app.mMusic->IsMusicDisabled() && !app.mUpdateAppDepth,
        "Credits lifetime fixture requires the isolated no-audio outer update");
    std::ofstream log(ProbePath("credits-pause-lifetime.txt"));
    Require(bool(log), "Cannot write credits lifetime evidence");
    unsigned failures = 0;
    for (const auto& test : cases) {
        app.KillBoard(); app.KillGameSelector(); app.KillChallengeScreen();
        (app.*AppAccess::Cleanup)();
        bool dead = false, replacementDead = false;
        auto* old = Open(app, dead);
        app.mMusic->mCurMusicTune = MUSIC_TUNE_CREDITS_ZOMBIES_ON_YOUR_LAWN;
        app.mMusic->mPauseOffset = 4321;
        Reply reply(app, *old, test, dead, replacementDead);
        old->PauseCredits();
        Require(reply.answered && !dead, "Credits pause failed to return with its caller still alive");
        bool stateOk;
        if (test.transition == Transition::None) {
            if (test.result == Dialog::ID_NO)
                stateOk = !app.mCreditScreen && app.mGameSelector && !app.mMusic->mPaused;
            else stateOk = app.mCreditScreen == old && !old->mCreditsPaused && !app.mMusic->mPaused &&
                old->mTimerSinceStart.GetDuration() >= 11999 &&
                old->mTimerSinceStart.GetDuration() < 12050 + reply.Now() - reply.answerTime;
        } else {
            stateOk = old->mCreditsPaused && old->mTimerSinceStart.GetDuration() >= 12200 &&
                app.mMusic->mCurMusicTune == MUSIC_TUNE_FOG_RIGORMORMIST &&
                app.mMusic->mPaused && app.mMusic->mPauseOffset == 0x1234;
            if (test.transition == Transition::Replace)
                stateOk &= app.mCreditScreen == reply.replacement && !replacementDead &&
                    reply.replacement->mCreditsPaused && reply.replacement->mTimerSinceStart.GetDuration() >= 32000;
            else if (test.transition == Transition::Menu) stateOk &= app.mGameSelector && !app.mCreditScreen;
            else stateOk &= !app.mCreditScreen && !app.mGameSelector;
        }
        bool passed = stateOk && reply.ownHold && reply.aliveInCollector && !app.GetDialog(DIALOG_MESSAGE);
        log << test.name << " production-hold=" << reply.ownHold << " retained-during-collection="
            << reply.aliveInCollector << " state=" << stateOk << " pass=" << passed << std::endl;
        failures += !passed;
        reply.emergency.reset();
        app.KillCreditScreen(); app.KillGameSelector(); app.mMusic->StopAllMusic();
        (app.*AppAccess::Cleanup)();
        Require(dead && (!reply.replacement || replacementDead), "Credits lifetime hold leaked a retired screen");
    }
    log << "cases=" << cases.size() << " failures=" << failures << " actual-audio=0" << std::endl;
    Require(!failures, "Credits pause resumed a replacement scene, changed its clock or lacked caller lifetime");
    Report("portable-credits-12-owned-pause-lifecycles-noaudio",app);
}
