#include "ModernVulkanSmoke.h"
#include "LawnApp.h"
#include "Board.h"
#include "Challenge.h"
#include "GridItem.h"
#include "Plant.h"
#include "Zombie.h"
#include "Cutscene.h"
#include "System/PlayerInfo.h"
#include "Widget/TitleScreen.h"
#include "Sexy.TodLib/EffectSystem.h"
#include "graphics/DDInterface.h"
#include "graphics/DDImage.h"
#include "graphics/RenderInterface.h"
#include <array>
#include <set>
#include <stdexcept>
#include <vector>

namespace {
static_assert(int(GRIDITEM_SQUIRREL)==8 &&
    int(GAMEMODE_LIMBO_SQUIRREL)>=GAME_MODE_LIMBO_FIRST && int(GAMEMODE_LIMBO_SQUIRREL)<=GAME_MODE_LIMBO_LAST);
void Require(bool condition,const char* message){if(!condition) throw std::runtime_error(message);}
std::vector<GridItem*> Squirrels(Board& board) {
    std::vector<GridItem*> result;
    GridItem* item=nullptr;
    while(board.IterateGridItems(item)) if(item->mGridItemType==GRIDITEM_SQUIRREL && !item->mDead) result.push_back(item);
    return result;
}
void ClearSquirrels(Board& board) {
    for(auto* item:Squirrels(board)){item->GridItemDie();board.mGridItems.DataArrayFree(item);}
}
void ClearCell(Board& board,int x,int y) {
    while(auto* plant=board.GetTopPlantAt(x,y,TOPPLANT_EATING_ORDER)) plant->Die();
    board.ProcessDeleteQueue();
}
GridItem* MakeSquirrel(Board& board,int x,int y,GridItemState state=GRIDITEM_STATE_SQUIRREL_WAITING) {
    auto* item=board.mGridItems.DataArrayAlloc();
    item->mGridItemType=GRIDITEM_SQUIRREL;item->mGridItemState=state;
    item->mGridX=x;item->mGridY=y;item->mGridItemCounter=17;
    return item;
}
void RunSquirrelCases(LawnApp& app) {
    using namespace ModernSmoke;
    auto& board=*app.mBoard;auto& challenge=*board.mChallenge;
    Require(app.IsSquirrelLevel() && Squirrels(board).size()==8,
        "Squirrel mode did not start seven squirrels and one zombie marker");
    bool sawLongDelay=false;
    for(int repeat=0;repeat<16;++repeat) {
        ClearSquirrels(board);challenge.SquirrelStart();
        auto items=Squirrels(board);Require(items.size()==8,"Squirrel start produced the wrong object count");
        std::set<std::pair<int,int>> cells;
        int zombies=0,regular=0;
        for(auto* item:items) {
            Require(item->mGridX>=0 && item->mGridX<9 && item->mGridY>=0 && item->mGridY<5,
                "Squirrel spawn escaped the original 9x5 area");
            Require(cells.emplace(item->mGridX,item->mGridY).second,"Squirrel spawn reused an occupied cell");
            if(item->mGridItemState==GRIDITEM_STATE_SQUIRREL_ZOMBIE) {
                ++zombies;Require(item->mGridX>=4,"Zombie marker spawned in the first four columns");
            } else {
                ++regular;Require(item->mGridItemState==GRIDITEM_STATE_SQUIRREL_WAITING &&
                    item->mGridItemCounter>=100 && item->mGridItemCounter<=500,
                    "Squirrel start has the wrong state or delay range");
                sawLongDelay|=item->mGridItemCounter>400;
            }
        }
        Require(zombies==1 && regular==7 && challenge.SquirrelCountUncaught()==7,
            "Squirrel counting includes the zombie marker or misses regular squirrels");
    }
    Require(sawLongDelay,"Squirrel delay still appears limited to 400 ticks");
    Report("squirrel-start-16-layouts-seven-plus-one-delay500",app);

    struct Direction{int x,y;GridItemState state;};
    constexpr Direction directions[]={{3,2,GRIDITEM_STATE_SQUIRREL_RUNNING_LEFT},
        {5,2,GRIDITEM_STATE_SQUIRREL_RUNNING_RIGHT},{4,1,GRIDITEM_STATE_SQUIRREL_RUNNING_UP},
        {4,3,GRIDITEM_STATE_SQUIRREL_RUNNING_DOWN}};
    const auto clearCross=[&]{ClearCell(board,4,2);for(auto d:directions) ClearCell(board,d.x,d.y);};
    for(auto direction:directions) {
        ClearSquirrels(board);clearCross();board.AddPlant(direction.x,direction.y,SEED_WALLNUT);
        auto* item=MakeSquirrel(board,4,2);
        challenge.SquirrelFound(item);
        Require(item->mGridItemState==direction.state && item->mGridX==direction.x &&
            item->mGridY==direction.y && item->mGridItemCounter==50,
            "Squirrel direction or movement duration differs from 1073");
        for(int tick=0;tick<49;++tick) challenge.SquirrelUpdateOne(item);
        Require(item->mGridItemState==direction.state && item->mGridItemCounter==1,
            "Squirrel movement ended before 50 ticks");
        challenge.SquirrelUpdateOne(item);
        Require(item->mGridItemState==GRIDITEM_STATE_SQUIRREL_WAITING && item->mGridItemCounter>=100 &&
            item->mGridItemCounter<=500,"Squirrel movement did not return to its waiting state");
        item->mGridItemCounter = 50;
        item->mGridItemState = GRIDITEM_STATE_SQUIRREL_PEEKING;
        Require(item->mGridItemState==GRIDITEM_STATE_SQUIRREL_PEEKING && item->mGridItemCounter==50,
            "Squirrel peek duration changed");
        challenge.SquirrelChew(item);
        Require(item->mGridItemCounter>=100 && item->mGridItemCounter<=500,
            "Squirrel chew delay differs from 1073");
    }
    Report("squirrel-four-directions-move50-peek-chew",app);
    ClearSquirrels(board);clearCross();
    auto* caught=MakeSquirrel(board,4,2);
    ClearCell(board,8,4);board.AddPlant(8,4,SEED_WALLNUT);
    MakeSquirrel(board,8,4);
    challenge.SquirrelFound(caught);
    Require(caught->mGridItemState==GRIDITEM_STATE_SQUIRREL_CAUGHT && caught->mGridItemCounter==100 &&
        challenge.SquirrelCountUncaught()==1,"Squirrel with no escape route was not caught");
    challenge.SquirrelUpdate();
    Require(challenge.mChallengeScore==6,"Squirrel score did not update through its mode update");
    for(int tick=0;tick<99;++tick) challenge.SquirrelUpdateOne(caught);
    Require(caught->mDead,"Caught squirrel did not retire after its timer");
    ClearSquirrels(board);board.ProcessDeleteQueue();
    auto* decoy=MakeSquirrel(board,4,2,GRIDITEM_STATE_SQUIRREL_ZOMBIE);
    const auto before=board.mZombies.mSize;
    challenge.SquirrelFound(decoy);
    Require(decoy->mDead && board.mZombies.mSize==before+1,"Squirrel zombie marker did not reveal a zombie");
    Report("squirrel-catch-score-retire-zombie-decoy",app);
    auto* invisible=MakeSquirrel(board,4,2);
    auto& render=*app.mDDInterface->mRenderInterface;
    auto* screen=app.mDDInterface->mScreenImage;
    screen->FillRect(Rect(0,0,800,600),Color(32,48,64),0);render.Flush();
    const auto pixels=render.mRenderer->ReadScenePixels();
    Graphics graphics(screen);invisible->DrawGridItem(&graphics);render.Flush();
    Require(pixels==render.mRenderer->ReadScenePixels(),"Squirrel drew a sprite absent from original 1073");
    Report("squirrel-invisible-original-draw",app);
}
}

void ModernVulkanSquirrelSmokeTick(LawnApp& app) {
    using namespace ModernSmoke;
    static int stage=0;
    static std::uint32_t deadline=0,started=0;
    if(stage==0) {
        if(!app.mLoaded || !app.mTitleScreen || !app.mTitleScreen->mLoadingThreadComplete) return;
        Require(getenv("PVZ_MODERN_HIDDEN") && getenv("PVZ_APPDATA_DIR"),"Squirrel probe is not isolated/hidden");
        app.LoadingCompleted();stage=1;started=app.mUpdateCount;deadline=started+100;return;
    }
    if(stage==4) return;
    Require(app.mUpdateCount-started<3500,"Squirrel startup timed out");
    if(app.mUpdateCount<deadline) return;
    if(stage==1) {
        app.KillGameSelector();app.mPlayerInfo->mFinishedAdventure=1;app.mPlayerInfo->mLevel=50;
        app.PreNewGame(GAMEMODE_LIMBO_SQUIRREL,false);
        app.mBoard->mCutScene->CancelIntro();stage=2;return;
    }
    if(stage==2) {
        if(app.mGameScene!=SCENE_PLAYING) return;
        RunSquirrelCases(app);app.mBoard->Pause(true);stage=3;deadline=app.mUpdateCount+10;return;
    }
    Capture("squirrel-mode",app);ProbeScreenshot(app);
    auto& board=*app.mBoard;
    ClearSquirrels(board);ClearCell(board,0,0);ClearCell(board,1,0);ClearCell(board,0,1);
    auto* last=MakeSquirrel(board,0,0);
    Require(!board.mLevelAwardSpawned,"Squirrel award appeared before the last capture");
    board.mChallenge->SquirrelFound(last);
    Require(last->mGridItemState==GRIDITEM_STATE_SQUIRREL_CAUGHT &&
        board.mChallenge->SquirrelCountUncaught()==0 && board.mLevelAwardSpawned &&
        app.mBoardResult==BOARDRESULT_WON,"Last squirrel capture did not produce the level award");
    Report("squirrel-final-capture-award",app);
    Report("PASS squirrel; original startup, timings, movement, capture, zombie marker and invisible draw",app);
    app.CloseRequestAsync();stage=4;
}
