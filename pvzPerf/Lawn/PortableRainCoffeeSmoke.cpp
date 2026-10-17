#include "PortableRainCoffeeSmoke.h"
#include "ModernVulkanSmoke.h"
#include "LawnApp.h"
#include "Resources.h"
#include "Board.h"
#include "Challenge.h"
#include "Cutscene.h"
#include "Plant.h"
#include "Sexy.TodLib/EffectSystem.h"
#include "Sexy.TodLib/Reanimator.h"
#include "Sexy.TodLib/TodCommon.h"
#include "graphics/DDImage.h"
#include "graphics/DDInterface.h"
#include "graphics/Graphics.h"
#include "graphics/RenderInterface.h"
#include <algorithm>
#include <bit>
#include <fstream>
#include <stdexcept>

namespace {
void Require(bool ok,const char* message){if(!ok)throw std::runtime_error(message);}

bool CoffeeCases(LawnApp& app,std::ostream& log) {
    auto& board=*app.mBoard;
    board.ProcessDeleteQueue();app.mEffectSystem->ProcessDeleteQueue();
    const auto baseline=board.mPlants.mSize;
    unsigned cases=0,wrong=0;
    // First probe one plant per cell. On a bad build this diagnoses the slot
    // without deliberately provoking the duplicate-normal-plant assertion.
    for(auto seed:{SEED_INSTANT_COFFEE,SEED_FLOWERPOT,SEED_LILYPAD,SEED_PUMPKINSHELL,SEED_PUFFSHROOM}) {
        for(bool imitater:{false,true}) {
            auto* plant=board.NewPlant(5,0,imitater?SEED_IMITATER:seed,imitater?seed:SEED_NONE);
            PlantsOnLawn actual{};board.GetPlantsOnLawn(5,0,&actual);
            const bool flying=seed==SEED_INSTANT_COFFEE;
            const bool under=seed==SEED_FLOWERPOT || seed==SEED_LILYPAD;
            const bool pumpkin=seed==SEED_PUMPKINSHELL;
            const bool good=actual.mFlyingPlant==(flying?plant:nullptr) &&
                actual.mUnderPlant==(under?plant:nullptr) && actual.mPumpkinPlant==(pumpkin?plant:nullptr) &&
                actual.mNormalPlant==(!flying&&!under&&!pumpkin?plant:nullptr);
            ++cases;wrong+=!good;
            log<<"coffee-slot seed="<<int(seed)<<" imitater="<<imitater<<" pass="<<good<<std::endl;
            plant->Die();board.ProcessDeleteQueue();app.mEffectSystem->ProcessDeleteQueue();
        }
    }
    log<<"coffee-slot-cases="<<cases<<" wrong="<<wrong<<std::endl;
    Require(board.mPlants.mSize==baseline,"Slot probe retained a plant");
    if(wrong)return false;

    auto* pot=board.NewPlant(5,0,SEED_FLOWERPOT);
    auto* mushroom=board.NewPlant(5,0,SEED_PUFFSHROOM);mushroom->SetSleeping(true);
    auto* pumpkin=board.NewPlant(5,0,SEED_PUMPKINSHELL);
    Require(board.CanPlantAt(5,0,SEED_INSTANT_COFFEE)==PLANTING_OK,"Sleeping fixture rejects coffee");
    board.AddPlant(5,0,SEED_IMITATER,SEED_INSTANT_COFFEE);
    unsigned ticks=0;bool morphed=false,scheduledWake=false,finished=false;
    for(;ticks<600;++ticks) {
        PlantsOnLawn cell{};board.GetPlantsOnLawn(5,0,&cell);
        Require(cell.mUnderPlant==pot && cell.mNormalPlant==mushroom && cell.mPumpkinPlant==pumpkin,
            "Coffee replaced another plant slot");
        if(!cell.mFlyingPlant && !mushroom->mIsAsleep){finished=true;break;}
        if(auto* coffee=cell.mFlyingPlant) {
            Require(board.CanPlantAt(5,0,SEED_INSTANT_COFFEE)==PLANTING_NOT_HERE,"Second coffee accepted while occupied");
            morphed|=coffee->mSeedType==SEED_INSTANT_COFFEE;
            // Advance the real plant/animation routines, not a forced morph or
            // forced wake counter. Do not advance unrelated board objects.
            coffee->Update();
            if(!coffee->mDead)app.ReanimationGet(coffee->mBodyReanimID)->Update();
        }
        scheduledWake|=mushroom->mWakeUpCounter>0;
        mushroom->UpdateAbilities();
        board.ProcessDeleteQueue();app.mEffectSystem->ProcessDeleteQueue();
    }
    log<<"coffee-real-morph-and-wake ticks="<<ticks<<" morphed="<<morphed
        <<" wake-scheduled="<<scheduledWake<<" finished="<<finished<<std::endl;
    Require(morphed && scheduledWake && finished,"Imitater coffee did not morph, wake and disappear");
    Require(board.CanPlantAt(5,0,SEED_INSTANT_COFFEE)==PLANTING_NEEDS_SLEEPING,"Awake mushroom accepts coffee");
    pot->Die();pumpkin->Die();mushroom->Die();board.ProcessDeleteQueue();app.mEffectSystem->ProcessDeleteQueue();
    Require(board.mPlants.mSize==baseline,"Coffee lifecycle left an extra plant");
    return true;
}

// Independent translation of 1073's signed IDIV + stored-float interpolation
// and round-away-from-zero. Do not call the production curve function here.
int OriginalOffset(std::uint32_t bits,int period,int start,int end) {
    const std::int64_t signedValue=bits<=0x7fffffffu?std::int64_t(bits):std::int64_t(bits)-0x100000000ll;
    float fraction=static_cast<float>(double(signedValue%period)/period);
    fraction=std::clamp(fraction,0.0f,1.0f);
    const float value=static_cast<float>(double(start)+double(end-start)*fraction);
    return static_cast<int>(double(value)+(value>=0?0.5:-0.5));
}

void OriginalRain(Sexy::Graphics& g,std::uint32_t time,int boardX) {
    // 0042968E adds 100 only for positive board X, before signed division.
    const int offset=-100*((boardX>0?boardX+100:boardX)/100);
    int x=OriginalOffset(time,100,0,-100)+offset;
    for(int column=0;column<9;++column,x+=100) {
        int y=OriginalOffset(time,20,-100,0);
        for(int row=0;row<7;++row,y+=100)g.DrawImage(Sexy::IMAGE_RAIN,x,y);
    }
    const int nearX=OriginalOffset(time,161,0,-100),nearY=OriginalOffset(time,33,-100,0);
    for(int column=0;column<9;++column)for(int row=0;row<7;++row)
        TodDrawImageScaledF(&g,Sexy::IMAGE_RAIN,(100*column+nearX)*1.5f+offset,
            (100*row+nearY)*1.5f,1.5f,1.5f);
}

bool RainCases(LawnApp& app,std::ostream& log) {
    auto& board=*app.mBoard;
    Require(Sexy::IMAGE_RAIN && !board.mCutScene->IsBeforePreloading(),"Rain fixture is not loaded");
    struct Restore { Board& board;int x,counter;
        ~Restore(){board.mX=x;board.mEffectCounter=counter;board.MarkAllDirty();}
    } restore{board,board.mX,board.mEffectCounter};
    auto* screen=app.mDDInterface->mScreenImage;auto& render=*app.mDDInterface->mRenderInterface;
    const auto* cpu=screen->mBits;const auto version=screen->mBitsChangedCount;
    unsigned cases=0,wrongFrames=0;std::uint64_t wrongPixels=0;
    auto frame=[&](std::uint32_t counter,int x) {
        board.mEffectCounter=std::bit_cast<std::int32_t>(counter);board.mX=x;
        screen->FillRect(Sexy::Rect(0,0,800,600),Sexy::Color(17,29,43),0);
        Sexy::Graphics actual(screen);board.mChallenge->DrawRain(&actual);render.Flush();
        const auto pixels=render.mRenderer->ReadScenePixels();
        screen->FillRect(Sexy::Rect(0,0,800,600),Sexy::Color(17,29,43),0);
        Sexy::Graphics expected(screen);OriginalRain(expected,counter,x);render.Flush();
        const auto reference=render.mRenderer->ReadScenePixels();
        Require(pixels.size()==480000 && reference.size()==pixels.size(),"Rain GPU capture size is not 800x600");
        unsigned delta=0;for(std::size_t i=0;i<pixels.size();++i)delta+=pixels[i]!=reference[i];
        Require(std::any_of(reference.begin()+1,reference.end(),[&](auto pixel){return pixel!=reference[0];}),
            "Rain reference is blank");
        ++cases;wrongFrames+=delta!=0;wrongPixels+=delta;
        log<<"rain frame="<<counter<<" board-x="<<x<<" wrong-pixels="<<delta<<'\n';
    };
    for(std::uint32_t tick=0;tick<100;++tick)frame(tick,0);
    for(int x:{-301,-100,-1,1,99,100,199})
        for(std::uint32_t tick:{0u,20u,33u,100u,160u,161u,0x7fffffffu,0x80000000u,0xffffffffu})frame(tick,x);
    log<<"rain-gpu-frames="<<cases<<" wrong-frames="<<wrongFrames<<" wrong-pixels="<<wrongPixels<<std::endl;
    Require(screen->mBits==cpu && screen->mBitsChangedCount==version,"Rain used CPU screen storage");
    return wrongFrames==0;
}

void FrameBoundaryCases(LawnApp& app,std::ostream& log) {
    auto& board=*app.mBoard;
    Require(!board.mPaused && !board.mTimeStopCounter,"Board frame probe requires normal play");
    struct Restore {
        Board& board;int effect,draw,start;DWORD startTime,intervalTime;float fps;bool preloaded;
        ~Restore(){
            board.mEffectCounter=effect;board.mDrawCount=draw;board.mIntervalDrawCountStart=start;
            board.mStartDrawTime=startTime;board.mIntervalDrawTime=intervalTime;board.mMinFPS=fps;
            board.mCutScene->mPreloaded=preloaded;
        }
    } restore{board,board.mEffectCounter,board.mDrawCount,board.mIntervalDrawCountStart,
        board.mStartDrawTime,board.mIntervalDrawTime,board.mMinFPS,board.mCutScene->mPreloaded};
    auto* screen=app.mDDInterface->mScreenImage;
    auto& render=*app.mDDInterface->mRenderInterface;
    auto* cpu=screen->mBits;const auto cpuVersion=screen->mBitsChangedCount;
    unsigned cases=0;
    for(std::uint32_t bits:{0u,1u,0x7ffffffeu,0x7fffffffu,0x80000000u,0xfffffffeu,0xffffffffu}) {
        board.mEffectCounter=std::bit_cast<std::int32_t>(bits);
        board.Update(); // Real game update, not a direct helper-only assignment.
        Require(std::bit_cast<std::uint32_t>(board.mEffectCounter)==bits+1u,
            "Actual Board::Update did not retain original low-32-bit counter increment");
        board.mDrawCount=std::bit_cast<std::int32_t>(bits);
        board.mIntervalDrawCountStart=board.mDrawCount;
        board.mIntervalDrawTime=GetTickCount();
        board.mCutScene->mPreloaded=true;
        Sexy::Graphics graphics(screen);board.Draw(&graphics);render.Flush();
        Require(std::bit_cast<std::uint32_t>(board.mDrawCount)==(bits?bits+1u:2u),
            "Actual Board::Draw changed zero-sentinel or wrap semantics");
        const auto pixels=render.mRenderer->ReadScenePixels();
        Require(pixels.size()==480000 && std::any_of(pixels.begin()+1,pixels.end(),
            [&](auto p){return p!=pixels.front();}),"Board frame boundary draw was blank");
        Require(screen->mBits==cpu && screen->mBitsChangedCount==cpuVersion,"Board frame probe changed CPU screen backing");
        log<<"actual-board-frame bits="<<bits<<" update-next="<<std::uint32_t(board.mEffectCounter)
            <<" draw-next="<<std::uint32_t(board.mDrawCount)<<" pass=1\n";++cases;
    }
    Require(cases==7,"Board frame boundary coverage changed");
    ModernSmoke::Report("portable-board-frame-seven-real-update-draw-boundaries",app);
}
}

void PortableRainCoffeeSmoke(LawnApp& app) {
    Require(getenv("PVZ_MODERN_HIDDEN") && getenv("PVZ_APPDATA_DIR") && app.mGameScene==SCENE_PLAYING,
        "Rain/coffee fixture requires isolated gameplay");
    std::ofstream log(ModernSmoke::ProbePath("rain-coffee-cases.txt"));Require(bool(log),"Cannot write rain/coffee evidence");
    const bool coffee=CoffeeCases(app,log);
    const bool rain=RainCases(app,log);
    FrameBoundaryCases(app,log);
    Require(coffee && rain,"Coffee/rain differs from 1073; see rain-coffee-cases.txt");
    ModernSmoke::Report("portable-coffee-slots-real-morph-wake-and-rain-163-gpu-frames",app);
}
