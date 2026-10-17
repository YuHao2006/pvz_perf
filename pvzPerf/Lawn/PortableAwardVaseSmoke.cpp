#include "Sexy.TodLib/generated/EntityStrings.h"
#include "ModernVulkanSmoke.h"
#include "PortableFixesSmoke.h"
#include "LawnApp.h"
#include "Resources.h"
#include "Board.h"
#include "Challenge.h"
#include "GridItem.h"
#include "Coin.h"
#include "Zombie.h"
#include "Cutscene.h"
#include "System/PlayerInfo.h"
#include "System/SaveGame.h"
#include "Widget/TitleScreen.h"
#include "Widget/AwardScreen.h"
#include "Widget/ChallengeScreen.h"
#include "Widget/GameButton.h"
#include "Widget/AchievementsWidget.h"
#include "Sexy.TodLib/TodStringFile.h"
#include "Sexy.TodLib/Reanimator.h"
#include "graphics/GpuBackend.h"
#include "sound/SoundManager.h"
#include "sound/SoundInstance.h"
#include "widget/WidgetManager.h"
#include <array>
#include <fstream>
#include <map>
#include <set>
#include <stdexcept>

namespace {
using namespace ModernSmoke;
void Require(bool value,const char* message){if(!value) throw std::runtime_error(message);}
struct AppAccess : LawnApp { static constexpr auto Cleanup=&AppAccess::ProcessSafeDeleteList; };
class AwardTap final : public Sexy::SoundInstance {
public:
    unsigned plays=0;bool validFlags=true;
    void Release() override {}
    void SetBaseVolume(double) override {}
    void SetBasePan(int) override {}
    void AdjustPitch(double) override {}
    void SetVolume(double) override {}
    void SetPan(int) override {}
    bool Play(bool loop,bool release) override {++plays;validFlags &= !loop && release;return true;}
    void Stop() override {}
    bool IsPlaying() override {return false;}
    bool IsReleased() override {return true;}
};
class AwardTapManager final : public Sexy::SoundManager {
public:
    AwardTap tap;unsigned requests=0;bool validSound=true;
    AwardTapManager() { mInitialized = true; }
    bool LoadSound(unsigned,const std::string&) override {return false;}
    int LoadSound(const std::string&) override {return -1;}
    void ReleaseSound(unsigned) override {}
    void SetVolume(double) override {}
    bool SetBaseVolume(unsigned,double) override {return false;}
    bool SetBasePan(unsigned,int) override {return false;}
    Sexy::SoundInstance* GetSoundInstance(unsigned id) override {
        ++requests;validSound &= id==static_cast<unsigned>(Sexy::SOUND_TAP);return &tap;
    }
    void ReleaseSounds() override {}
    void ReleaseChannels() override {}
    void Flush() override {}
    void SetCooperativeWindow(HWND) override {}
    void StopAllSounds() override {}
    int GetFreeSoundId() override {return -1;}
    int GetNumSounds() override {return 0;}
};
void CheckAwardContinueInput(LawnApp& app) {
    Require(app.mNoSoundNeeded && !app.mBoard && app.GetDialogCount()==0 && getenv("PVZ_APPDATA_DIR"),
        "Award input test requires an isolated silent scene");
    PlayerInfo player;player.mId=9001;player.mLevel=4;player.mEarnedAchievements[NoFungusAmongUs]=true;
    AwardTapManager audio;
    auto& manager=*app.mWidgetManager;
    struct Restore {
        LawnApp& app;PlayerInfo* player;GameMode mode;Sexy::SoundManager* sound;int cursor,x,y,down;
        ~Restore(){app.mPlayerInfo=player;app.mGameMode=mode;app.mSoundManager=sound;
            app.mWidgetManager->mLastMouseX=x;app.mWidgetManager->mLastMouseY=y;
            app.mWidgetManager->mDownButtons=down;app.SetCursor(cursor);}
    } restore{app,app.mPlayerInfo,app.mGameMode,app.mSoundManager,app.mCursorNum,
        manager.mLastMouseX,manager.mLastMouseY,manager.mDownButtons};
    app.mPlayerInfo=&player;app.mGameMode=GAMEMODE_ADVENTURE;
    AwardScreen screen(&app,AWARD_FORLEVEL,true);screen.Resize(0,0,800,600);
    Require(screen.mShowingAchievements && screen.mAchievementItems.size()==1,"Award input fixture did not create the real achievement page");
    app.mSoundManager=&audio;
    auto pointAt=[&](GameButton& button,bool inside){
        manager.mLastMouseX=inside?button.mX+button.mWidth/2:10;
        manager.mLastMouseY=inside?button.mY+button.mHeight/2:450;
    };
    std::ofstream log(ProbePath("award-continue-input.txt"));Require(bool(log),"Cannot write award input evidence");
    unsigned cases=0,cursorWrong=0,soundWrong=0;
    // Real animation endpoint enables Continue; Start/Menu remain hidden.
    screen.mAchievementAnimTime=249;screen.mFadeInCounter=0;manager.mDownButtons=0;
    pointAt(*screen.mContinueButton,true);screen.Update();
    Require(!screen.mContinueButton->mDisabled && !screen.mContinueButton->mBtnNoDraw,"Real achievement animation did not enable Continue");
    cursorWrong+=app.mCursorNum!=Sexy::CURSOR_HAND;++cases;
    log<<"real-achievement-ready cursor="<<app.mCursorNum<<std::endl;
    screen.mShowingAchievements=false; // Inspect button states without the animation re-enabling Continue.
    const std::array<GameButton*,3> buttons{screen.mStartButton,screen.mMenuButton,screen.mContinueButton};
    for(unsigned selected=0;selected<buttons.size();++selected)for(int state=0;state<3;++state)
    for(bool inside:{false,true})for(int clicks:{1,2,-1}){
        for(auto* b:buttons){b->mBtnNoDraw=true;b->mDisabled=true;}
        auto& button=*buttons[selected];button.mBtnNoDraw=state==1;button.mDisabled=state==2;
        pointAt(button,inside);manager.mDownButtons=0;screen.Update();
        const bool usable=state==0 && inside;
        const bool cursor=app.mCursorNum==(usable?Sexy::CURSOR_HAND:Sexy::CURSOR_POINTER);
        const unsigned calls=audio.requests,plays=audio.tap.plays;
        manager.mDownButtons=clicks==1?1:0;
        screen.MouseDown(manager.mLastMouseX,manager.mLastMouseY,clicks);
        const unsigned expected=usable && clicks==1?1:0;
        const bool sound=audio.requests-calls==expected && audio.tap.plays-plays==expected;
        cursorWrong+=!cursor;soundWrong+=!sound;++cases;
        log<<"button="<<selected<<" state="<<state<<" inside="<<inside<<" clicks="<<clicks
            <<" cursor="<<cursor<<" sound="<<sound<<'\n';
    }
    log<<"cases="<<cases<<" cursor-wrong="<<cursorWrong<<" sound-wrong="<<soundWrong<<std::endl;
    Require(cases==55 && cursorWrong==0 && soundWrong==0 && audio.validSound && audio.tap.validFlags,
        "Award Continue cursor or tap omitted; see award-continue-input.txt");
    Report("portable-award-55-button-cursor-tap-state-cases",app);
}
void CheckPostGameRoutes(LawnApp& app) {
    Require(!app.mBoard && app.mNoSoundNeeded && getenv("PVZ_APPDATA_DIR"),"Post-game fixture must be isolated");
    app.KillGameSelector();(app.*AppAccess::Cleanup)();
    PlayerInfo player;
    struct Restore {
        LawnApp& app;PlayerInfo* player;GameMode mode;
        ~Restore(){app.mPlayerInfo=player;app.mGameMode=mode;}
    } restore{app,app.mPlayerInfo,app.mGameMode};
    app.mPlayerInfo=&player;
    enum Route { NextAdventure, LevelAward, AchievementAward, ChallengeList };
    struct Case {GameMode mode;int level,finished;AchievementId achievement;bool earned,record,stale;Route route;};
    const std::array<Case,13> cases{{
        {GAMEMODE_ADVENTURE,21,1,DontPea,false,false,false,AchievementAward},
        {GAMEMODE_ADVENTURE,41,1,Grounded,false,false,false,AchievementAward},
        {GAMEMODE_ADVENTURE,11,1,NoFungusAmongUs,false,false,false,AchievementAward},
        {GAMEMODE_ADVENTURE,1,1,GoodMorning,false,false,false,AchievementAward},
        {GAMEMODE_ADVENTURE,21,1,DontPea,true,false,false,NextAdventure},
        {GAMEMODE_ADVENTURE,21,1,DontPea,true,false,true,NextAdventure},
        {GAMEMODE_ADVENTURE,21,0,DontPea,false,false,false,LevelAward},
        {GAMEMODE_ADVENTURE,29,1,DontPea,false,false,false,LevelAward},
        {GAMEMODE_MINIGAME_WAR_AND_PEAS,21,1,BeyondTheGrave,false,true,false,AchievementAward},
        {GAMEMODE_MINIGAME_WAR_AND_PEAS,21,1,BeyondTheGrave,false,false,false,LevelAward},
        {GAMEMODE_MINIGAME_WAR_AND_PEAS,21,1,BeyondTheGrave,true,true,false,ChallengeList},
        {GAMEMODE_SURVIVAL_NORMAL_STAGE_3,21,1,DontPea,false,true,false,ChallengeList},
        {GAMEMODE_PUZZLE_I_ZOMBIE_1,21,1,NoFungusAmongUs,false,true,false,ChallengeList}
    }};
    std::ofstream log(ProbePath("post-game-achievement-routes.txt"));Require(bool(log),"Cannot write post-game route evidence");
    unsigned wrong=0,continued=0,index=0;
    for(const auto& c:cases) {
        player.Reset();player.mId=9901;player.mLevel=c.level;player.mFinishedAdventure=c.finished;
        std::fill(std::begin(player.mEarnedAchievements),std::end(player.mEarnedAchievements),true);
        std::fill(std::begin(player.mShownAchievements),std::end(player.mShownAchievements),true);
        player.mEarnedAchievements[c.achievement]=c.earned;player.mShownAchievements[c.achievement]=c.earned;
        if(c.stale)player.mShownAchievements[HomeSecurity]=false;
        std::fill(std::begin(player.mMiniGamesCompleted),std::end(player.mMiniGamesCompleted),true);
        if(c.mode==GAMEMODE_MINIGAME_WAR_AND_PEAS)player.mMiniGamesCompleted[int(c.mode)-(int)GameMode::GAMEMODE_MINIGAME_BEGHOULED]=false;
        if(c.mode!=GAMEMODE_ADVENTURE)player.mChallengeRecords[int(c.mode)]=c.record?10:0;  // v13 直下标
        app.PreNewGame(c.mode,false);
        Require(app.mBoard!=nullptr,"Post-game fixture did not create the real board");
        auto& board=*app.mBoard;
        board.mPeaShooterUsed=c.achievement!=DontPea;
        board.mCatapultPlantsUsed=c.achievement!=Grounded;
        board.mMushroomsUsed=c.achievement!=NoFungusAmongUs;
        board.mMushroomAndCoffeeBeansOnly=c.achievement==GoodMorning;
        if(c.mode==GAMEMODE_PUZZLE_I_ZOMBIE_1)board.mBackground=BACKGROUND_2_NIGHT;
        if(c.mode==GAMEMODE_SURVIVAL_NORMAL_STAGE_3){board.mChallenge->mSurvivalStage=4;board.mCurrentWave=board.mNumWaves;}
        // Enter the actual completion function with a real initialized board.
        // This is an end-of-level fixture, not an automated full playthrough.
        board.mLevelComplete=true;app.CheckForGameEnd();
        const int expectedLevel=c.mode==GAMEMODE_ADVENTURE?c.level+1:c.level;
        bool routed=false;
        if(c.route==NextAdventure)routed=app.mBoard && app.mBoard->mLevel==expectedLevel && !app.mAwardScreen && app.mGameMode==GAMEMODE_ADVENTURE;
        if(c.route==LevelAward || c.route==AchievementAward)routed=!app.mBoard && app.mAwardScreen &&
            app.mAwardScreen->mAwardType==(c.route==LevelAward?AWARD_FORLEVEL:AWARD_ACHIEVEMENTONLY) &&
            app.mAwardScreen->mShowingAchievements && app.mAwardScreen->mAchievementItems.size()==1 &&
            app.mAwardScreen->mAchievementItems[0].mId==c.achievement;
        if(c.route==ChallengeList)routed=!app.mBoard && !app.mAwardScreen && app.mChallengeScreen &&
            app.mChallengeScreen->mPageIndex==(c.mode==GAMEMODE_SURVIVAL_NORMAL_STAGE_3?CHALLENGE_PAGE_SURVIVAL:
                c.mode==GAMEMODE_PUZZLE_I_ZOMBIE_1?CHALLENGE_PAGE_PUZZLE:CHALLENGE_PAGE_CHALLENGE);
        const bool shown=c.earned || c.route==LevelAward || c.route==AchievementAward;
        PlayerInfo disk;disk.mId=player.mId;
        const bool persisted=disk.LoadDetails() && disk.mEarnedAchievements[c.achievement] && disk.mShownAchievements[c.achievement]==shown;
        bool correct=routed && player.mLevel==expectedLevel && player.mEarnedAchievements[c.achievement] &&
            player.mShownAchievements[c.achievement]==shown && persisted;
        if(c.stale)correct&=!player.mShownAchievements[HomeSecurity];
        const int actualAward=app.mAwardScreen?int(app.mAwardScreen->mAwardType):-1;
        const int actualPage=app.mChallengeScreen?int(app.mChallengeScreen->mPageIndex):-1;
        if(routed && c.route==AchievementAward) {
            app.mAwardScreen->AchievementsContinuePressed();
            // 1073 00409400 routes every standalone achievement page to
            // Adventure. Preserve that existing behavior in this fidelity fix.
            correct &= app.mBoard && !app.mAwardScreen && app.mGameMode==GAMEMODE_ADVENTURE && app.mBoard->mLevel==expectedLevel;
            ++continued;
        }
        log<<"case="<<++index<<" mode="<<int(c.mode)<<" source-level="<<c.level<<" target-level="<<player.mLevel
            <<" expected-route="<<int(c.route)<<" actual-award="<<actualAward<<" actual-page="<<actualPage
            <<" earned="<<player.mEarnedAchievements[c.achievement]<<" shown="<<player.mShownAchievements[c.achievement]
            <<" persisted="<<persisted<<" correct="<<correct<<std::endl;
        wrong+=!correct;
        app.KillBoard();app.KillAwardScreen();app.KillChallengeScreen();(app.*AppAccess::Cleanup)();
        Require(!app.mBoard && !app.mAwardScreen && !app.mChallengeScreen && app.mSafeDeleteList.empty(),"Post-game fixture retained a scene");
    }
    app.mPlayerInfo=restore.player;app.mGameMode=restore.mode;app.ShowGameSelector();
    log<<"cases="<<index<<" wrong="<<wrong<<" standalone-continued="<<continued<<std::endl;
    Require(index==13 && wrong==0 && continued==5,"Post-game routing differs from 1073; see post-game-achievement-routes.txt");
    Report("portable-postgame-13-routes-five-continue-persisted",app);
}
void CheckGoldTrophyGrant(LawnApp& app){
    PlayerInfo player;player.mLevel=4;
    struct Restore{LawnApp& app;PlayerInfo* player;GameMode mode;
        ~Restore(){app.mPlayerInfo=player;app.mGameMode=mode;}}restore{app,app.mPlayerInfo,app.mGameMode};
    app.mPlayerInfo=&player;
    std::ofstream log(ProbePath("gold-trophy-grant-cases.txt"));
    Require(bool(log),"Cannot write gold trophy grant evidence");
    unsigned cases=0,wrong=0;
    for(GameMode mode:{GAMEMODE_ADVENTURE,GAMEMODE_SURVIVAL_NORMAL_STAGE_1,GAMEMODE_MINIGAME_WAR_AND_PEAS,
        GAMEMODE_SCARY_POTTER_1,GAMEMODE_PUZZLE_I_ZOMBIE_1,GAMEMODE_LIMBO_ZEN_GARDEN})
    for(bool complete:{false,true})for(bool finished:{false,true})for(bool earned:{false,true})
    for(AwardType type:{AWARD_FORLEVEL,AWARD_HELP_ZOMBIENOTE,AWARD_ACHIEVEMENTONLY}){
        player.Reset();player.mLevel=4;player.mFinishedAdventure=finished?1:0;
        std::fill_n(player.mChallengeRecords,100,complete?10000:0);
        player.mEarnedAchievements[NovelPeasPrize]=earned;app.mGameMode=mode;
        Require(app.EarnedGoldTrophy()==(complete&&finished),"Gold trophy fixture did not set real trophy requirements");
        const bool expected=earned||(mode!=GAMEMODE_ADVENTURE&&complete&&finished);
        {AwardScreen screen(&app,type,false);}
        const bool pass=player.mEarnedAchievements[NovelPeasPrize]==expected&&!player.mShownAchievements[NovelPeasPrize];
        if(!pass){++wrong;log<<"mode="<<int(mode)<<" complete="<<complete<<" finished="<<finished<<" earned="<<earned
            <<" type="<<int(type)<<" actual="<<player.mEarnedAchievements[NovelPeasPrize]<<" expected="<<expected<<std::endl;}
        ++cases;
    }
    log<<"cases="<<cases<<" wrong="<<wrong<<std::endl;
    Require(cases==144&&!wrong,"AwardScreen gold trophy grant mode differs from 1073");
    Report("portable-gold-trophy-144-award-mode-requirement-cases",app);
}

void CheckAwardAndModeCases(LawnApp& app) {
    Require(!app.mBoard && app.mNoSoundNeeded,"Award probe requires a detached, silent scene");
    PlayerInfo player;
    struct Restore {
        LawnApp& app;PlayerInfo* player;GameMode mode;
        ~Restore(){app.mPlayerInfo=player;app.mGameMode=mode;}
    } restore{app,app.mPlayerInfo,app.mGameMode};
    app.mPlayerInfo=&player;
    std::ofstream log(ProbePath("award-vase-cases.txt"));
    Require(bool(log),"Cannot write award/vase evidence");
    bool modes=true,awards=true;
    unsigned modeCases=0,awardCases=0;
    static_assert(GAMEMODE_SCARY_POTTER_1==GAME_MODE_SCARY_POTTER_FIRST &&
    GAMEMODE_SCARY_POTTER_ENDLESS==GAME_MODE_SCARY_POTTER_LAST);
    for(int level:{1,35,36}) for(int value=0;value<NUM_GAME_MODES;++value) {
        player.mLevel=level;app.mGameMode=static_cast<GameMode>(value);
        const bool expected=(value>=51 && value<=60) || (value==0 && level==35);
        const bool actual=app.IsScaryPotterLevel();
        modes&=actual==expected;
        if(actual!=expected || value==51 || value==59 || value==60 || value==61)
            log<<"mode="<<value<<" profile-level="<<level<<" actual="<<actual<<" expected="<<expected<<'\n';
        if(expected) modes&=app.IsChallengeWithoutSeedBank();
        ++modeCases;
    }
    app.mGameMode=GAMEMODE_ADVENTURE;
    for(int finished:{0,1,2}) for(int level:{1,2,4,15,25,35,45}) {
        player.Reset();player.mLevel=level;player.mFinishedAdventure=finished;
        const bool home=level==1 && finished>0;
        const SexyString& label=home || level==25 || level==35 || level==45?gStr.CONTINUE_BUTTON:
            level==15?gStr.VIEW_ALMANAC_BUTTON:gStr.NEXT_LEVEL_BUTTON;
        const bool hideMenu=home || (finished==0 && level<=3);
        AwardScreen screen(&app,AWARD_FORLEVEL,false);
        const bool correct=screen.mStartButton->mLabel==label &&
            screen.mMenuButton->mBtnNoDraw==hideMenu && screen.mMenuButton->mDisabled==hideMenu &&
            player.mEarnedAchievements[HomeSecurity]==home && !player.mShownAchievements[HomeSecurity];
        awards&=correct;++awardCases;
        log<<"award level="<<level<<" finished="<<finished<<" label='"<<screen.mStartButton->mLabel
            <<"' expected='"<<label<<"' menu-hidden="<<screen.mMenuButton->mBtnNoDraw
            <<" home="<<player.mEarnedAchievements[HomeSecurity]<<" pass="<<correct<<'\n';
    }
    for(GameMode mode:{GAMEMODE_MINIGAME_WAR_AND_PEAS,GAMEMODE_SCARY_POTTER_ENDLESS}) {
        player.Reset();player.mLevel=1;player.mFinishedAdventure=1;app.mGameMode=mode;
        AwardScreen screen(&app,AWARD_FORLEVEL,false);
        const bool correct=screen.mStartButton->mLabel==EntityTranslate(gStr.MAIN_MENU_BUTTON) &&
            screen.mMenuButton->mDisabled && !player.mEarnedAchievements[HomeSecurity];
        awards&=correct;++awardCases;
        log<<"non-adventure mode="<<int(mode)<<" pass="<<correct<<'\n';
    }
    log<<"mode-cases="<<modeCases<<" pass="<<modes<<" award-cases="<<awardCases<<" pass="<<awards<<std::endl;
    Require(modes && awards,"Original vase mode range or post-adventure award routing differs");
    Report("portable-award-23-cases-original-buttons-and-achievement",app);
    Report("portable-vase-all-mode-boundaries-no-seed-chooser",app);
}
std::vector<GridItem*> Pots(Board& board) {
    std::vector<GridItem*> pots;
    GridItem* item=nullptr;
    while(board.IterateGridItems(item)) if(item->mGridItemType==GRIDITEM_SCARY_POT && !item->mDead) pots.push_back(item);
    return pots;
}
struct PotState {
    unsigned id;int x,y,type,state,seed,zombie;
    bool operator==(const PotState&) const =default;
};
std::vector<PotState> Snapshot(Board& board) {
    std::vector<PotState> result;
    for(auto* pot:Pots(board)) result.push_back({board.mGridItems.DataArrayGetID(pot),pot->mGridX,pot->mGridY,
        int(pot->mScaryPotType),int(pot->mGridItemState),int(pot->mSeedType),int(pot->mZombieType)});
    return result;
}
void CheckInitialPots(Board& board) {
    const auto pots=Pots(board);
    std::array<int,3> counts{};
    std::set<std::pair<int,int>> cells;
    for(auto* pot:pots) {
        Require(pot->mGridX>=2 && pot->mGridX<=8 && pot->mGridY>=0 && pot->mGridY<5,
            "Endless vase spawned outside its original seven columns");
        Require(cells.emplace(pot->mGridX,pot->mGridY).second,"Two starting vases share a cell");
        if(pot->mScaryPotType==SCARYPOT_SEED) ++counts[0];
        else if(pot->mScaryPotType==SCARYPOT_ZOMBIE) ++counts[1];
        else if(pot->mScaryPotType==SCARYPOT_SUN) ++counts[2];
    }
    Require(pots.size()==35 && counts==std::array{19,15,1},"Endless vase did not populate its original 35 pots");
}

void CheckSixthPots(Board& board) {
    std::map<SeedType,unsigned> seeds;
    std::map<ZombieType,unsigned> zombies;
    std::set<std::pair<int,int>> cells;
    unsigned green=0;
    for(auto* pot:Pots(board)) {
        Require(pot->mGridX>=2 && pot->mGridX<=8 && pot->mGridY>=0 && pot->mGridY<5,
            "Sixth vase has a pot outside the original 7x5 field");
        Require(cells.emplace(pot->mGridX,pot->mGridY).second,"Sixth vase reused a filled cell");
        if(pot->mScaryPotType==SCARYPOT_SEED)++seeds[pot->mSeedType];
        else if(pot->mScaryPotType==SCARYPOT_ZOMBIE)++zombies[pot->mZombieType];
        else Require(false,"Sixth vase contains an unexpected pot kind");
        if(pot->mGridItemState==GRIDITEM_STATE_SCARY_POT_LEAF) {
            Require(pot->mScaryPotType==SCARYPOT_SEED,"Green pot contains a zombie");++green;
        }
    }
    // Independent 1073 0042BA63..0042BB83 contents; counts are not derived
    // from the production function or inferred by clamping available cells.
    const std::map<SeedType,unsigned> expectedSeeds{{SEED_LEFTPEATER,7},{SEED_SQUASH,2},
        {SEED_TALLNUT,5},{SEED_THREEPEATER,2},{SEED_TORCHWOOD,4}};
    const std::map<ZombieType,unsigned> expectedZombies{{ZOMBIE_NORMAL,7},{ZOMBIE_POLEVAULTER,5},
        {ZOMBIE_FOOTBALL,2},{ZOMBIE_JACK_IN_THE_BOX,1}};
    std::ofstream log(ProbePath("vase-sixth-layouts.txt"),std::ios::app);Require(bool(log),"Cannot write sixth vase evidence");
    log<<"sixth-pots="<<cells.size()<<" green="<<green<<" football="<<zombies[ZOMBIE_FOOTBALL]
        <<" jack="<<zombies[ZOMBIE_JACK_IN_THE_BOX]<<" seeds-match="<<(seeds==expectedSeeds)
        <<" zombies-match="<<(zombies==expectedZombies)<<std::endl;
    Require(cells.size()==35 && green==2 && seeds==expectedSeeds && zombies==expectedZombies,
        "Sixth vase contents differ from 1073");
}
}

void ModernVulkanAwardVaseSmokeTick(LawnApp& app) {
    using namespace ModernSmoke;
    static unsigned stage=0,potId=0;
    static std::uint32_t started=0,deadline=0;
    static std::uint32_t strikeStarted=0;
    static ReanimationID hammerID=REANIMATIONID_NULL;
    static SeedType openedSeed=SEED_NONE;
    static std::vector<PotState> saved;
    static unsigned sixthRuns=0;
    static std::vector<PotState> savedSixth;
    Require(getenv("PVZ_MODERN_HIDDEN") && getenv("PVZ_APPDATA_DIR") && app.mNoSoundNeeded,
        "Award/vase probe is not an isolated silent test");
    Require(app.mGpuContext && !IsWindowVisible(app.mHWnd),
        "Award/vase probe became visible");
    if(stage==0) {
        if(!app.mLoaded || !app.mTitleScreen || !app.mTitleScreen->mLoadingThreadComplete) return;
        app.LoadingCompleted();started=app.mUpdateCount;deadline=started+100;stage=1;return;
    }
    if(stage==10) return;
    Require(app.mUpdateCount-started<3500,"Award/vase test timed out");
    if(app.mUpdateCount<deadline) return;
    if(stage==11) {
        Require(!app.mBoard && app.mGameSelector,"Final sixth vase did not return to menu");
        RequireDeletionBoundary(app,"vase-final-sixth-board-deleted");
        Report("portable-vase-seventeen-deferred-deletion-boundaries",app);
        Report("portable-vase-sixth-three-real-startups-and-dat64",app);
        Report("PASS vase; original awards, hit, hammer, drops, endless and sixth-grid dat64 verified",app);
        app.CloseRequestAsync();stage=10;return;
    }
    if(stage>=6) {
        if(stage==6) {
            Require(!app.mBoard && app.mGameSelector,"Sixth vase cycle did not begin at the real menu");
            RequireDeletionBoundary(app,"vase-sixth-menu-start");
            app.KillGameSelector();app.PreNewGame(GAMEMODE_SCARY_POTTER_6,false);
            app.mBoard->mCutScene->CancelIntro();stage=7;return;
        }
        if(stage==7) {
            if(app.mGameScene!=SCENE_PLAYING)return;
            RequireDeletionBoundary(app,"vase-sixth-selector-deleted");
            Require(app.mGameMode==GAMEMODE_SCARY_POTTER_6 && !app.mSeedChooserScreen,
                "Sixth vase entered the wrong mode or chooser");
            CheckSixthPots(*app.mBoard);savedSixth=Snapshot(*app.mBoard);
            app.mBoard->Pause(true);
            Require(LawnSaveGame(app.mBoard,ProbePath("vase-sixth.dat64")),"Cannot save sixth vase");
            app.DoBackToMain();stage=8;deadline=app.mUpdateCount+50;return;
        }
        if(stage==8) {
            Require(!app.mBoard && app.mGameSelector,"Sixth vase did not return to menu before load");
            RequireDeletionBoundary(app,"vase-sixth-board-deleted");
            app.KillGameSelector();app.MakeNewBoard();
            Require(app.mBoard->LoadGame(ProbePath("vase-sixth.dat64")),"Cannot reload sixth vase");
            app.mBoard->Pause(true);stage=9;deadline=app.mUpdateCount+50;return;
        }
        RequireDeletionBoundary(app,"vase-sixth-loaded-selector-deleted");
        CheckSixthPots(*app.mBoard);
        Require(Snapshot(*app.mBoard)==savedSixth,"Sixth vase IDs, layout or contents changed in dat64");
        const auto captureName="vase-sixth-restored-"+std::to_string(sixthRuns);
        Capture(captureName.c_str(),app);
        app.DoBackToMain();
        if(++sixthRuns<3){stage=6;deadline=app.mUpdateCount+50;return;}
        stage=11;deadline=app.mUpdateCount+50;return;
    }
    if(stage==1) {
        RequireDeletionBoundary(app,"vase-title-to-menu");
        CheckAwardContinueInput(app);
        CheckAwardAndModeCases(app);
        CheckGoldTrophyGrant(app);
        CheckPostGameRoutes(app);
        app.KillGameSelector();app.mPlayerInfo->mFinishedAdventure=1;app.mPlayerInfo->mLevel=50;
        app.PreNewGame(GAMEMODE_SCARY_POTTER_ENDLESS,false);
        app.mBoard->mCutScene->CancelIntro();stage=2;return;
    }
    if(stage==2) {
        if(app.mGameScene!=SCENE_PLAYING) return;
        RequireDeletionBoundary(app,"vase-endless-selector-deleted");
        auto& board=*app.mBoard;
        Require(app.IsScaryPotterLevel() && !app.mSeedChooserScreen && board.StageIsNight() &&
            board.mChallenge->mSurvivalStage==0 && !board.IsFinalScaryPotterStage(),
            "Endless vase startup took an ordinary level/seed chooser path");
        CheckInitialPots(board);
        GridItem* chosen=nullptr;
        for(auto* pot:Pots(board)) if(pot->mScaryPotType==SCARYPOT_SEED){chosen=pot;break;}
        Require(chosen!=nullptr,"No seed vase available for the mouse path");
        potId=board.mGridItems.DataArrayGetID(chosen);openedSeed=chosen->mSeedType;
        const int x=board.GridToPixelX(chosen->mGridX,chosen->mGridY)+30;
        const int y=board.GridToPixelY(chosen->mGridX,chosen->mGridY)+35;
        HitResult hit;board.MouseHitTest(x,y,&hit);
        Require(hit.mObjectType==OBJECT_TYPE_SCARY_POT && hit.mObject==chosen,"Board hit test omitted the endless vase");
        board.MouseDown(x,y,1);board.MouseUp(x,y,1); // Game methods only, no OS input.
        Require(board.mChallenge->mChallengeState==STATECHALLENGE_SCARY_POTTER_MALLETING,
            "Endless vase click did not start the real hammer animation");
        hammerID=board.mChallenge->mReanimChallenge;
        auto* hammer=app.ReanimationGet(hammerID);
        const auto track=ReanimTrackId::anim_open_pot;
        Require(hammer->GetTrackId(hammer->FindTrackIndex(track))==track,"Hammer definition lacks anim_open_pot");
        int first=0,count=0;hammer->GetFramesForLayer(track,first,count);
        std::ofstream log(ProbePath("vase-hammer-track.txt"));
        Require(bool(log),"Cannot write vase hammer evidence");
        log<<"expected="<<first<<','<<count<<" actual="<<hammer->mFrameStart<<','<<hammer->mFrameCount
           <<" rate="<<hammer->mAnimRate<<std::endl;
        Require(hammer->mFrameStart==first && hammer->mFrameCount==count && hammer->mAnimRate==40 &&
            hammer->mLoopType==REANIM_PLAY_ONCE_AND_HOLD && hammer->mAnimTime==0,
            "Vase hammer did not select the original anim_open_pot frames");
        strikeStarted=app.mUpdateCount;
        Report("portable-vase-original-open-pot-track",app);
        Report("portable-vase-endless-35pots-live-hit",app);
        deadline=app.mUpdateCount+1;stage=3;return;
    }
    if(stage==3) {
        auto& board=*app.mBoard;
        auto* opened=board.mGridItems.DataArrayTryToGet(potId);
        if(board.mChallenge->mChallengeState==STATECHALLENGE_SCARY_POTTER_MALLETING) {
            auto* hammer=app.ReanimationTryToGet(hammerID);
            Require(opened && !opened->mDead && hammer && !hammer->mDead && app.mUpdateCount-strikeStarted<200,
                "Vase vanished before the strike completed or hammer never finished");
            return;
        }
        Require((!opened || opened->mDead) && Pots(board).size()==34 &&
            board.mChallenge->mChallengeState==STATECHALLENGE_NORMAL,"Hammer did not naturally break its vase");
        auto* hammer=app.ReanimationTryToGet(hammerID);
        Require(board.mChallenge->mReanimChallenge==REANIMATIONID_NULL && (!hammer || hammer->mDead),
            "Finished vase hammer retained a live owner ID");
        std::ofstream log(ProbePath("vase-hammer-track.txt"),std::ios::app);
        Require(bool(log),"Cannot append vase hammer evidence");
        log<<"finished-after-updates="<<app.mUpdateCount-strikeStarted<<" owner-cleared=1"<<std::endl;
        bool dropped=false;Coin* coin=nullptr;
        while(board.IterateCoins(coin)) if(coin->mType==COIN_USABLE_SEED_PACKET && coin->mUsableSeedType==openedSeed) dropped=true;
        Require(dropped,"Broken seed vase did not drop its configured seed");
        Report("portable-vase-hammer-animation-drop",app);
        board.Pause(true);saved=Snapshot(board);
        Require(LawnSaveGame(&board,ProbePath("vase.dat64")),"Cannot save vase fixture");
        app.DoBackToMain();deadline=app.mUpdateCount+50;stage=4;return;
    }
    if(stage==4) {
        Require(!app.mBoard && app.mGameSelector,"Vase save did not leave to the actual menu");
        RequireDeletionBoundary(app,"vase-endless-board-deleted");
        app.KillGameSelector();app.MakeNewBoard();
        Require(app.mBoard->LoadGame(ProbePath("vase.dat64")),"Cannot reload vase dat64");
        Require(Snapshot(*app.mBoard)==saved && app.IsScaryPotterLevel(),"Vase IDs or contents changed on load");
        app.mBoard->Pause(true);deadline=app.mUpdateCount+50;stage=5;return;
    }
    RequireDeletionBoundary(app,"vase-endless-loaded-selector-deleted");
    auto& board=*app.mBoard;
    Require(Snapshot(board)==saved,"Deferred menu cleanup changed reloaded vases");
    Report("portable-vase-dat64-menu-reload",app);
    Capture("vase-endless",app);ProbeScreenshot(app);
    // Fixture: complete a non-prize streak. Exercise the actual final-pot ->
    // FadeOutLevel -> UpdateLevelEndSequence -> next-grid route, not a direct
    // ScaryPotterPopulate call that could bypass the broken mode classification.
    auto pots=Pots(board);GridItem* last=nullptr;
    for(auto* pot:pots) if(pot->mScaryPotType==SCARYPOT_SEED){last=pot;break;}
    Require(last!=nullptr,"No final seed vase in restored fixture");
    for(auto* pot:pots) if(pot!=last) pot->GridItemDie();
    board.ProcessDeleteQueue();board.mChallenge->mSurvivalStage=1;
    board.mChallenge->ScaryPotterOpenPot(last);
    Require(board.mNextSurvivalStageCounter==500 && !board.mLevelComplete,"Endless vase completed instead of advancing its streak");
    for(int tick=0;tick<500;++tick) board.UpdateLevelEndSequence();
    Require(board.mChallenge->mSurvivalStage==2 && !board.mLevelComplete && board.mNextSurvivalStageCounter==0,
        "Endless vase transition did not advance exactly one stage");
    CheckInitialPots(board);
    Report("portable-vase-next-grid-through-level-end",app);
    PortableVaseRewardSmoke(app);
    app.DoBackToMain();deadline=app.mUpdateCount+50;stage=6;
}
