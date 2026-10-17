#include "Sexy.TodLib/generated/EntityStrings.h"
#include "PortableShovelSmoke.h"
#include "ModernVulkanSmoke.h"
#include "LawnApp.h"
#include "Board.h"
#include "Challenge.h"
#include "CursorObject.h"
#include "Cutscene.h"
#include "Plant.h"
#include "Zombie.h"
#include "ToolTipWidget.h"
#include "System/PlayerInfo.h"
#include "System/SaveGame.h"
#include "Widget/TitleScreen.h"
#include "Widget/SeedChooserScreen.h"
#include "Sexy.TodLib/EffectSystem.h"
#include "Sexy.TodLib/TodStringFile.h"
#include "widget/WidgetManager.h"
#include "graphics/GpuBackend.h"
#include <array>
#include <fstream>
#include <stdexcept>

namespace {
using namespace ModernSmoke;
void Require(bool ok,const char* text){if(!ok)throw std::runtime_error(text);}
bool CheckWallnuts(Board& board,bool dug,std::ostream& log) {
    std::array<std::array<unsigned,6>,9> cells{};
    unsigned count=0,wrong=0;Plant* plant=nullptr;
    while(board.IteratePlants(plant)) {
        if(plant->mDead)continue;
        ++count;
        if(plant->mSeedType!=SEED_WALLNUT || plant->mPlantCol<0 || plant->mPlantCol>=9 || plant->mRow<0 || plant->mRow>=6)
            ++wrong;
        else ++cells[plant->mPlantCol][plant->mRow];
    }
    for(int y=0;y<6;++y)for(int x=0;x<9;++x)
        wrong+=cells[x][y]!=(y<5 && !(dug && x==4 && y==4)?1u:0u);
    log<<"wallnuts mode="<<int(board.mApp->mGameMode)<<" dug="<<dug<<" count="<<count
        <<" expected="<<(dug?44:45)<<" wrong-cells="<<wrong<<std::endl;
    return count==(dug?44u:45u) && wrong==0;
}
}

void PortablePreviewTooltipSmoke(LawnApp& app) {
    auto& board=*app.mBoard;auto& widgets=*app.mWidgetManager;
    Require(app.mSeedChooserScreen && app.mGameScene==SCENE_LEVEL_INTRO && board.mCutScene->mSeedChoosing,
        "Tooltip probe needs the real seed chooser");
    struct Restore {
        LawnApp& app;int x,y,mouseX,mouseY,level,finished;bool active,inside;ToolTipWidget tip;
        ~Restore(){auto& b=*app.mBoard;b.mX=x;b.mY=y;app.mActive=active;
            app.mWidgetManager->mLastMouseX=mouseX;app.mWidgetManager->mLastMouseY=mouseY;
            app.mWidgetManager->mMouseIn=inside;app.mPlayerInfo->mLevel=level;
            app.mPlayerInfo->mFinishedAdventure=finished;*b.mToolTip=tip;}
    } restore{app,board.mX,board.mY,widgets.mLastMouseX,widgets.mLastMouseY,
        app.mPlayerInfo->mLevel,app.mPlayerInfo->mFinishedAdventure,app.mActive,widgets.mMouseIn,*board.mToolTip};
    board.mX=board.mY=0;
    std::ofstream log(ProbePath("preview-tooltip-cases.txt"));Require(bool(log),"Cannot write tooltip evidence");
    const auto zombiesBefore=board.mZombies.mSize;
    unsigned cases=0,wrong=0;
    for(auto type:{ZOMBIE_NORMAL,ZOMBIE_GARGANTUAR,ZOMBIE_REDEYE_GARGANTUAR}) {
        auto* zombie=board.AddZombieInRow(type,0,Zombie::ZOMBIE_WAVE_CUTSCENE);
        Require(zombie!=nullptr,"Cannot create preview fixture");
        zombie->mPosX=600;zombie->mX=600;zombie->mPosY=250;zombie->mY=250;
        const auto rect=zombie->GetZombieRect();
        widgets.mLastMouseX=rect.mX+rect.mWidth/2;widgets.mLastMouseY=rect.mY+rect.mHeight/2;
        Require(board.ZombieHitTest(widgets.mLastMouseX,widgets.mLastMouseY)==zombie,
            "Tooltip fixture hits another zombie");
        for(int profile=0;profile<3;++profile)for(int gate=0;gate<3;++gate) {
            app.mPlayerInfo->mLevel=profile==1?15:14;app.mPlayerInfo->mFinishedAdventure=profile==2?1:0;
            app.mActive=gate!=1;widgets.mMouseIn=gate!=2;
            board.UpdateToolTip();
            const bool visible=gate==0;
            const auto expected=profile!=0 && type!=ZOMBIE_REDEYE_GARGANTUAR?EntityTranslate(gStr.CLICK_TO_VIEW):SexyString();
            const bool correct=board.mToolTip->mVisible==visible && (!visible || board.mToolTip->mLabel==expected);
            ++cases;wrong+=!correct;
            log<<"type="<<int(type)<<" profile="<<profile<<" gate="<<gate<<" visible="<<board.mToolTip->mVisible
                <<" label="<<board.mToolTip->mLabel<<" expected-visible="<<visible<<" expected-label="<<expected<<" pass="<<correct<<'\n';
        }
        zombie->DieNoLoot();board.ProcessDeleteQueue();app.mEffectSystem->ProcessDeleteQueue();
        Require(board.mZombies.mSize==zombiesBefore,"Preview probe retained an extra zombie");
    }
    log<<"preview-tooltip-cases="<<cases<<" wrong="<<wrong<<std::endl;
    Require(wrong==0,"Preview tooltip differs from 1073; see preview-tooltip-cases.txt");
    Report("portable-preview-tooltip-27-type-profile-focus-cases",app);
}

void PortableShovelSmokeTick(LawnApp& app) {
    using namespace ModernSmoke;
    static unsigned stage=0,modeIndex=0;
    static std::uint32_t started=0,deadline=0;
    static bool allCorrect=true;
    Require(getenv("PVZ_MODERN_HIDDEN") && getenv("PVZ_APPDATA_DIR") && app.mNoSoundNeeded &&
        app.mGpuContext && !IsWindowVisible(app.mHWnd),"Shovel test is not hidden/isolated/silent");
    if(stage==0) {
        if(!app.mLoaded || !app.mTitleScreen || !app.mTitleScreen->mLoadingThreadComplete)return;
        app.LoadingCompleted();started=app.mUpdateCount;deadline=started+100;stage=1;return;
    }
    if(stage==5)return;
    Require(app.mUpdateCount-started<4000,"Shovel fixture timed out");
    if(app.mUpdateCount<deadline)return;
    const auto mode=modeIndex==0?GAMEMODE_LIMBO_SHOVEL:GAMEMODE_LIMBO_SQUIRREL;
    const char* save=modeIndex==0?"shovel.dat64":"squirrel-walnuts.dat64";
    if(stage==1) {
        app.KillGameSelector();app.mPlayerInfo->mFinishedAdventure=1;app.mPlayerInfo->mLevel=50;
        app.PreNewGame(mode,false);app.mBoard->mCutScene->CancelIntro();stage=2;return;
    }
    if(stage==2) {
        if(app.mGameScene!=SCENE_PLAYING)return;
        auto& board=*app.mBoard;
        Require(board.mBackground==BACKGROUND_1_DAY,"Walnut test is not on the original day board");
        std::ofstream log(ProbePath("wallnut-layout-cases.txt"),std::ios::app);Require(bool(log),"Cannot write walnut evidence");
        allCorrect &= CheckWallnuts(board,false,log);
        if(modeIndex==0) {
            auto* target=board.GetTopPlantAt(4,4,TOPPLANT_ONLY_NORMAL_POSITION);
            Require(target && target->mSeedType==SEED_WALLNUT,"Bottom-row shovel target is missing");
            const int x=target->mX+target->mWidth/2,y=target->mY+target->mHeight/2;
            board.PickUpTool(OBJECT_TYPE_SHOVEL);
            Require(board.mCursorObject->mCursorType==CURSOR_TYPE_SHOVEL,"Actual shovel pickup failed");
            const int before=board.mPlantsShoveled;
            board.MouseDownWithTool(x,y,1,CURSOR_TYPE_SHOVEL);board.ProcessDeleteQueue();
            Require(board.mPlantsShoveled==before+1 && !board.GetTopPlantAt(4,4,TOPPLANT_ONLY_NORMAL_POSITION),
                "Actual bottom-row shovel did not remove exactly its target");
            allCorrect &= CheckWallnuts(board,true,log);
        }
        board.Pause(true);
        Require(LawnSaveGame(&board,ProbePath(save)),"Could not save walnut layout");
        Report(modeIndex==0?"portable-shovel-startup-and-bottom-row-dig":"portable-squirrel-original-five-row-wallnuts",app);
        app.DoBackToMain();stage=3;deadline=app.mUpdateCount+50;return;
    }
    if(stage==3) {
        Require(!app.mBoard && app.mGameSelector,"Walnut mode did not return to menu");
        app.KillGameSelector();app.mGameMode=mode;app.MakeNewBoard();
        Require(app.mBoard->LoadGame(ProbePath(save)),"Could not reload walnut layout");
        app.mBoard->Pause(true);stage=4;deadline=app.mUpdateCount+50;return;
    }
    std::ofstream log(ProbePath("wallnut-layout-cases.txt"),std::ios::app);Require(bool(log),"Cannot append walnut evidence");
    allCorrect &= CheckWallnuts(*app.mBoard,modeIndex==0,log);
    app.mBoard->MarkAllDirty();if(!app.mWidgetManager->DrawScreen())return;
    Capture(modeIndex==0?"shovel-restored":"squirrel-wallnuts-restored",app);
    if(modeIndex==0)ProbeScreenshot(app);
    Report(modeIndex==0?"portable-shovel-dat64-layout":"portable-squirrel-dat64-layout",app);
    app.DoBackToMain();
    if(++modeIndex<2){stage=1;deadline=app.mUpdateCount+50;return;}
    Require(allCorrect,"Original 9x5 wallnut layout differs; see wallnut-layout-cases.txt");
    Report("PASS shovel; both original five-row layouts, real digging and dat64",app);
    app.CloseRequestAsync();stage=5;
}
