#include "PortableWhackSmoke.h"
#include "ModernVulkanSmoke.h"
#include "LawnApp.h"
#include "Board.h"
#include "Challenge.h"
#include "CursorObject.h"
#include "Zombie.h"
#include "GridItem.h"
#include "Cutscene.h"
#include "System/PlayerInfo.h"
#include "System/SaveGame.h"
#include "Widget/TitleScreen.h"
#include "Sexy.TodLib/EffectSystem.h"
#include "Sexy.TodLib/Reanimator.h"
#include "widget/WidgetManager.h"
#include "graphics/GpuBackend.h"
#include <fstream>
#include <set>
#include <stdexcept>

namespace
{
using namespace ModernSmoke;
void Require(bool value, const char* message) { if (!value) throw std::runtime_error(message); }
unsigned CountHammers(LawnApp& app)
{
    unsigned count = 0; Reanimation* animation = nullptr;
    while (app.mEffectSystem->mReanimationHolder->mReanimations.IterateNext(animation))
        count += !animation->mDead && animation->mReanimationType == REANIM_HAMMER;
    return count;
}
Reanimation* CheckHammer(LawnApp& app)
{
    auto* hammer = app.ReanimationTryToGet(app.mBoard->mCursorObject->mReanimCursorID);
    Require(hammer && !hammer->mDead && hammer->mReanimationType == REANIM_HAMMER && CountHammers(app) == 1,
        "Whack cursor did not own exactly one live hammer");
    const auto track = ReanimTrackId::anim_whack_zombie;
    Require(hammer->GetTrackId(hammer->FindTrackIndex(track)) == track, "Whack track is absent from compiled hammer");
    int first = 0, count = 0; hammer->GetFramesForLayer(track, first, count);
    Require(hammer->mFrameStart == first && hammer->mFrameCount == count && hammer->mAnimRate == 24 &&
        hammer->mIsAttachment && hammer->mLoopType == REANIM_PLAY_ONCE_AND_HOLD, "Whack cursor frame/rate/ownership differs from 1073");
    return hammer;
}
void HitAndUpdate(LawnApp& app, std::ostream& log)
{
    auto& board = *app.mBoard;
    Require(app.IsWhackAZombieLevel() && board.mCursorObject->mCursorType == CURSOR_TYPE_HAMMER && board.GetGraveStonesCount() > 0,
        "Actual Whack StartLevel did not establish its input/graves");
    std::set<unsigned> previous; Zombie* zombie = nullptr;
    while (board.IterateZombies(zombie)) previous.insert(board.mZombies.DataArrayGetID(zombie));
    board.mCurrentWave = 1; board.mZombieCountDown = 1000; board.mChallenge->mChallengeStateCounter = 1;
    Require(board.mChallenge->UpdateZombieSpawning() == ZombieSpawningUpdateResult::HANDLED_BY_CHALLENGE,
        "Whack incorrectly allowed ordinary level spawning");
    Zombie* target = nullptr; zombie = nullptr; unsigned spawned = 0;
    while (board.IterateZombies(zombie))
        if (!previous.contains(board.mZombies.DataArrayGetID(zombie))) { target = zombie; ++spawned; }
    Require(spawned == 1 && target && target->mZombieType == ZOMBIE_NORMAL, "First-phase Whack did not spawn one normal zombie from a grave");
    ZombieDrawPosition draw;
    target->GetDrawPos(draw);
    // Independent 1073 00542A60 construction. A newly spawned Whack zombie
    // retains a signed height; clamping it changes the lower hammer hit edge.
    Rect original = target->mZombieRect;
    original.Offset(target->mX, int(target->mY + draw.mBodyY));
    if (draw.mClipHeight > -100.0f)
        original.mHeight = int(float(original.mHeight) - draw.mClipHeight);
    Require(original.mHeight < -45, "Real Whack spawn did not cover a deeply clipped zombie");
    const int x=original.mX+original.mWidth/2;
    const int missY=original.mY+20;
    const int health=target->mBodyHealth;
    board.mChallenge->MouseDownWhackAZombie(x, missY+20);
    const bool missed=!target->IsDeadOrDying() && target->mBodyHealth==health;
    log << "grave-original-height=" << original.mHeight << " actual-height=" << target->GetZombieRect().mHeight
        << " below-original-missed=" << missed << std::endl;
    Require(missed && target->GetZombieRect()==original,
        "Clamping the grave rectangle changed the original Whack miss region");
    // Above the top edge, original branch order measures distance from the
    // top even for negative height. Midpoint of an inverted interval is not
    // a valid general hit oracle.
    board.mChallenge->MouseDownWhackAZombie(x, original.mY-1+20);
    auto* hammer = CheckHammer(app);
    Require(target->IsDeadOrDying() && hammer->mAnimTime == 0.2f && board.mCursorObject->mCursorType == CURSOR_TYPE_HAMMER,
        "Actual Whack click did not kill/reset swing/preserve hammer input");
    auto& widgets = *app.mWidgetManager;
    struct Restore { Sexy::WidgetManager& manager; bool mouseIn; ~Restore(){ manager.mMouseIn = mouseIn; } } restore{widgets, widgets.mMouseIn};
    widgets.mMouseIn = true; // Logical callback state only; no OS mouse/focus operation.
    board.mCursorObject->Update();
    Require(hammer->mAnimTime > 0.2f, "Cursor update did not advance its hammer");
    log << "spawn-from-grave=1 click-kill=1 phase=" << hammer->mAnimTime << std::endl;
    Report("portable-whack-real-spawn-click-and-cursor-update", app);
    Report("portable-whack-signed-grave-rect-miss-hit-1073", app);
}
bool CursorLifetime(LawnApp& app, std::ostream& log)
{
    const auto baseline = CountHammers(app);
    CursorObject temporary; // Direct constructor probe: StartLevel is not called.
    const auto id = temporary.mReanimCursorID;
    Require(id != REANIMATIONID_NULL && CountHammers(app) == baseline + 1 && app.ReanimationGet(id)->mAnimTime == 1,
        "1073 constructor-time hammer initialization was moved or broken");
    temporary.Die();
    const bool cleared = temporary.mReanimCursorID == REANIMATIONID_NULL;
    app.mEffectSystem->ProcessDeleteQueue();
    Require(!app.ReanimationTryToGet(id) && CountHammers(app) == baseline, "Temporary cursor hammer was not released");
    temporary.Die(); // Must also be harmless after the normal queue has reclaimed the slot.
    Require(CountHammers(app) == baseline, "Second Die changed another cursor's hammer");
    struct RestoreMode { LawnApp& app; GameMode old; ~RestoreMode(){ app.mGameMode = old; } } restore{app, app.mGameMode};
    app.mGameMode = GAMEMODE_MINIGAME_ZOMBIQUARIUM;
    CursorObject ordinary;
    Require(ordinary.mReanimCursorID == REANIMATIONID_NULL && CountHammers(app) == baseline,
        "Ordinary mode unnecessarily created a hammer");
    log << "constructor-only=1 die-id-cleared=" << cleared << " queued-release=1 repeated-die=1 ordinary-no-hammer=1" << std::endl;
    return cleared;
}

std::set<unsigned> ZombieIDs(Board& board) {
    std::set<unsigned> ids;Zombie* zombie=nullptr;
    while(board.IterateZombies(zombie))ids.insert(board.mZombies.DataArrayGetID(zombie));
    return ids;
}
void CheckWaveCompletion(LawnApp& app,std::ostream& log) {
    auto& board=*app.mBoard;auto& challenge=*board.mChallenge;
    Require(app.IsWhackAZombieLevel() && board.mNumWaves>1 && !board.HasLevelAwardDropped(),
        "Whack wave test requires a live ordinary Whack level");
    // This is the disposable board's last test before DoBackToMain. Keep the
    // public Board entrypoint; testing Challenge alone misses double dispatch.
    board.mRiseFromGraveCounter=0;board.mHugeWaveCountDown=0;board.mFinalWaveSoundCounter=0;
    const auto existing=ZombieIDs(board);
    for(int wave=0;wave<board.mNumWaves;++wave){
        board.mCurrentWave=wave;board.mZombieCountDown=1000;challenge.mChallengeStateCounter=2;
        board.UpdateZombieSpawning();
        Require(board.mCurrentWave==wave && board.mZombieCountDown==999 && challenge.mChallengeStateCounter==1 &&
            ZombieIDs(board)==existing,"Board ran more than one scheduler for Whack");
    }
    log<<"one-scheduler-probes="<<board.mNumWaves<<" countdown=999 challenge-counter=1"<<std::endl;

    // Controlled witness for Portable's historical return-0 bug, without
    // changing production code: run Whack, then reach the ordinary scheduler
    // through Board's public entrypoint with a temporary ordinary game mode.
    board.mCurrentWave=0;board.mZombieCountDown=1000;challenge.mChallengeStateCounter=2;
    challenge.WhackAZombieSpawning();
    {
        struct RestoreMode {LawnApp& app;GameMode mode;~RestoreMode(){app.mGameMode=mode;}} restore{app,app.mGameMode};
        app.mGameMode=GAMEMODE_MINIGAME_WAR_AND_PEAS;
        board.UpdateZombieSpawning();
    }
    log<<"forced-old-double-dispatch-countdown="<<board.mZombieCountDown<<std::endl;
    Require(board.mZombieCountDown!=999,"Double-dispatch witness did not distinguish the old route");
    Require(ZombieIDs(board)==existing,"Double-dispatch witness unexpectedly spawned a normal wave");

    unsigned eligible=0;GridItem* grave=nullptr;
    while(board.IterateGridItems(grave))if(grave->mGridItemType==GRIDITEM_GRAVESTONE){
        Require(board.GetTopPlantAt(grave->mGridX,grave->mGridY,TOPPLANT_ONLY_NORMAL_POSITION)==nullptr,
            "Whack wave test would ignore a gravebuster");
        ++eligible;
    }
    Require(eligible>0,"Whack final wave has no graves in the test fixture");
    board.mCurrentWave=board.mNumWaves-1;board.mZombieCountDown=6;challenge.mChallengeStateCounter=2;
    for(int i=0;i<5;++i){
        board.UpdateZombieSpawning();
        Require(board.mCurrentWave==board.mNumWaves-1 && board.mZombieCountDown==5-i &&
            challenge.mChallengeStateCounter==2 && ZombieIDs(board)==existing,
            "Whack pre-final warning countdown or spawning changed");
    }
    board.UpdateZombieSpawning();
    Require(board.mCurrentWave==board.mNumWaves && board.mZombieCountDown==2000 &&
        challenge.mChallengeStateCounter==299 && ZombieIDs(board)==existing,
        "Whack final wave entry is not the original 2000/299 state");
    for(int ticks=1;ticks<=298;++ticks){
        board.UpdateZombieSpawning();
        Require(board.mCurrentWave==board.mNumWaves && board.mZombieCountDown==2000-ticks &&
            challenge.mChallengeStateCounter==299-ticks && ZombieIDs(board)==existing,
            "Whack final group spawned early or counters advanced twice");
    }
    board.UpdateZombieSpawning();
    const auto finalIDs=ZombieIDs(board);
    const unsigned wanted=std::min(eligible,20u);
    Require(board.mCurrentWave==board.mNumWaves && board.mZombieCountDown==0 && challenge.mChallengeStateCounter==0 &&
        finalIDs.size()==existing.size()+wanted,"Whack final group did not stop both countdowns");
    Zombie* zombie=nullptr;unsigned checked=0;
    while(board.IterateZombies(zombie))if(!existing.contains(board.mZombies.DataArrayGetID(zombie))){
        Require((zombie->mZombieType==ZOMBIE_TRAFFIC_CONE || zombie->mZombieType==ZOMBIE_PAIL) &&
            zombie->mFromWave==board.mNumWaves && zombie->mPhaseCounter==50,
            "Whack final group type/wave/emergence differs from 1073");
        ++checked;
    }
    Require(checked==wanted,"Whack final group verification count changed");
    for(unsigned i=0;i<1000;++i){
        board.UpdateZombieSpawning();
        Require(board.mCurrentWave==board.mNumWaves && board.mZombieCountDown==0 &&
            challenge.mChallengeStateCounter==0 && ZombieIDs(board)==finalIDs,
            "Whack advanced beyond the final wave or duplicated its final group");
    }
    log<<"last-wave="<<board.mNumWaves<<" warning-ticks=5 entry=2000/299 delayed-ticks=299 final-zombies="<<wanted
        <<" terminal-updates=1000 extra-wave=0"<<std::endl;
    Report("portable-whack-board-final-wave-299-delay-1000-stopped-updates",app);
}
}

void PortableWhackSmokeTick(LawnApp& app)
{
    using namespace ModernSmoke;
    static unsigned stage = 0, modeIndex = 0;
    static std::uint32_t started = 0, deadline = 0;
    static ReanimationID savedID = REANIMATIONID_NULL;
    static float savedPhase = 0;
    static bool observedPlaying = false, allDieCleared = true;
    Require(getenv("PVZ_MODERN_HIDDEN") && getenv("PVZ_APPDATA_DIR") && app.mNoSoundNeeded &&
        app.mGpuContext && !IsWindowVisible(app.mHWnd), "Whack probe is not isolated/hidden/silent");
    if (stage == 0)
    {
        if (!app.mLoaded || !app.mTitleScreen || !app.mTitleScreen->mLoadingThreadComplete) return;
        app.LoadingCompleted(); started = app.mUpdateCount; deadline = started + 100; stage = 1; return;
    }
    if (stage == 7) return;
    Require(app.mUpdateCount - started < 4000, "Whack probe timed out");
    if (app.mUpdateCount < deadline) return;
    const auto mode = modeIndex == 0 ? GAMEMODE_MINIGAME_WHACK_A_ZOMBIE : GAMEMODE_ADVENTURE;
    if (stage == 1)
    {
        Require(!app.mBoard && CountHammers(app) == 0, "Previous board left a live hammer in the menu");
        RequireDeletionBoundary(app, modeIndex == 0 ? "whack-minigame-menu-start" : "whack-adventure-menu-start");
        app.KillGameSelector(); app.mPlayerInfo->mLevel = 15; app.mPlayerInfo->mFinishedAdventure = modeIndex == 0 ? 1 : 0;
        app.PreNewGame(mode, false); CheckHammer(app);
        app.mBoard->mCutScene->CancelIntro(); observedPlaying = false; stage = 2; return;
    }
    if (stage == 2)
    {
        if (app.mGameScene != SCENE_PLAYING) return;
        if (!observedPlaying) { observedPlaying = true; deadline = app.mUpdateCount + 2; return; }
        RequireDeletionBoundary(app, modeIndex == 0 ? "whack-minigame-selector-deleted" : "whack-adventure-selector-deleted");
        auto& board = *app.mBoard; board.Pause(true);
        std::ofstream log(ProbePath(modeIndex == 0 ? "whack-minigame-cases.txt" : "whack-adventure15-cases.txt"));
        Require(bool(log), "Cannot write Whack evidence");
        CheckHammer(app); HitAndUpdate(app, log);
        allDieCleared &= CursorLifetime(app, log);
        savedID = board.mCursorObject->mReanimCursorID; savedPhase = CheckHammer(app)->mAnimTime;
        Require(LawnSaveGame(&board, ProbePath("whack.dat64")), "Cannot save Whack fixture");
        app.DoBackToMain(); deadline = app.mUpdateCount + 50; stage = 3; return;
    }
    if (stage == 3)
    {
        Require(!app.mBoard && app.mGameSelector && CountHammers(app) == 0, "Whack menu cleanup left a hammer");
        RequireDeletionBoundary(app, modeIndex == 0 ? "whack-minigame-board-deleted" : "whack-adventure-board-deleted");
        app.KillGameSelector(); app.mGameMode = mode; app.MakeNewBoard(); CheckHammer(app);
        Require(app.mBoard->LoadGame(ProbePath("whack.dat64")), "Cannot load Whack fixture");
        app.mBoard->Pause(true);
        Require(app.mBoard->mCursorObject->mReanimCursorID == savedID && CheckHammer(app)->mAnimTime == savedPhase,
            "Whack dat64 replaced the saved ID/phase or duplicated its constructor hammer");
        deadline = app.mUpdateCount + 50; stage = 4; return;
    }
    if (stage == 4)
    {
        Require(app.mBoard->mCursorObject->mReanimCursorID == savedID && CheckHammer(app)->mAnimTime == savedPhase,
            "Deferred cleanup changed the restored Whack cursor");
        app.mBoard->MarkAllDirty(); if (!app.mWidgetManager->DrawScreen()) return;
        RequireDeletionBoundary(app, modeIndex == 0 ? "whack-minigame-loaded-selector-deleted" : "whack-adventure-loaded-selector-deleted");
        Capture(modeIndex == 0 ? "whack-minigame" : "whack-adventure15", app);
        if (modeIndex == 0) ProbeScreenshot(app);
        Report(modeIndex == 0 ? "portable-whack-minigame-dat64-menu" : "portable-whack-adventure15-dat64-menu", app);
        std::ofstream log(ProbePath(modeIndex == 0 ? "whack-minigame-cases.txt" : "whack-adventure15-cases.txt"),std::ios::app);
        Require(bool(log),"Cannot append Whack wave evidence");
        CheckWaveCompletion(app,log);
        app.DoBackToMain(); deadline = app.mUpdateCount + 50; stage = 5; return;
    }
    Require(!app.mBoard && CountHammers(app) == 0, "Final Whack menu cleanup retained a hammer");
    RequireDeletionBoundary(app, modeIndex == 0 ? "whack-minigame-loaded-board-deleted" : "whack-adventure-loaded-board-deleted");
    if (++modeIndex < 2) { stage = 1; return; }
    Require(allDieCleared, "CursorObject::Die leaves a stale ID; see both Whack case logs");
    Report("portable-whack-constructor-die-id-and-ordinary-mode", app);
    Report("portable-whack-ten-deferred-deletion-boundaries", app);
    Report("PASS whack; original constructor, real hit, both modes, dat64 and cleanup", app);
    app.CloseRequestAsync(); stage = 7;
}
