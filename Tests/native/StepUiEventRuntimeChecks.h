#pragma once
#include "GameConstants.h"

// Include after the usual ImageRuntimeTests game headers. Real resources,
// compiled definitions, portrait caches and dummy audio must be initialized.
// These are real widget/CutScene calls on isolated Boards, never player files.
inline void CheckStepUiEvents(LawnApp& app)
{
    using namespace Sexy;
    const auto require=[](bool value,const char* message) {
        if(!value)throw std::runtime_error(message);
    };
    require(!app.mBoard&&!app.mSeedChooserScreen,
        "UI interval fixture requires no existing Board or seed chooser");
    auto& clocks=*app.mEffectSystem->mReanimationHolder;
    struct Restore {
        LawnApp& app;PlayerInfo* player=app.mPlayerInfo;ZenGarden* garden=app.mZenGarden;
        GameMode mode=app.mGameMode;GameScenes scene=app.mGameScene;Rect bounds=app.mScreenBounds;
        int daveMessage=app.mCrazyDaveMessageIndex;
        bool landscape=app.mLandscapeUI,active=app.mLandscapeUIActive,mute=app.mMuteSoundsForCutscene;
        Widget* focus=app.mWidgetManager->mFocusWidget;
        unsigned long long interval=Sexy::gUpdateIntervalNs,phase=Sexy::gLegacyTickPhaseNs;
        int whole=Sexy::gWholeLegacyTicks;
        double ticks=Sexy::gUpdateTicks,steps=Sexy::gStepsPerLegacyTick;
        std::int64_t visual=app.mEffectSystem->mReanimationHolder->mVisualTimeNs;
        std::int64_t battle=app.mEffectSystem->mReanimationHolder->mBattleTimeNs;
        ~Restore() {
            app.mBoard=nullptr;app.mSeedChooserScreen=nullptr;
            app.mPlayerInfo=player;app.mZenGarden=garden;app.mGameMode=mode;app.mGameScene=scene;
            app.mCrazyDaveMessageIndex=daveMessage;
            app.mScreenBounds=bounds;app.mLandscapeUI=landscape;app.mLandscapeUIActive=active;
            app.mMuteSoundsForCutscene=mute;app.mWidgetManager->SetFocus(focus);
            Sexy::gUpdateIntervalNs=interval;Sexy::gLegacyTickPhaseNs=phase;
            Sexy::gWholeLegacyTicks=whole;Sexy::gUpdateTicks=ticks;Sexy::gStepsPerLegacyTick=steps;
            app.mEffectSystem->mReanimationHolder->mVisualTimeNs=visual;
            app.mEffectSystem->mReanimationHolder->mBattleTimeNs=battle;
        }
    } restore{app};
    PlayerInfo profile;ZenGarden garden;
    profile.mId=47;profile.mLevel=50;profile.mFinishedAdventure=0;
    app.mPlayerInfo=&profile;app.mZenGarden=&garden;
    app.mWidgetManager->SetFocus(nullptr);
    app.mGameMode=GAMEMODE_ADVENTURE;app.mGameScene=SCENE_LEVEL_INTRO;
    app.mCrazyDaveMessageIndex=-1;
    app.mScreenBounds=Rect(-100,0,1000,600);
    clocks.mVisualTimeNs=clocks.mBattleTimeNs=0;

    for(const bool landscape:{false,true})
    for(const bool conveyor:{false,true}) {
        app.mLandscapeUI=app.mLandscapeUIActive=landscape;
        profile.mLevel=conveyor?50:8;
        {
            Board board(&app);
            board.mLevel=conveyor?50:8;
            board.mCurrentWave=0;board.mNumWaves=20;
            board.mBackground=BACKGROUND_1_DAY;
            board.mSeedBank->mNumPackets=6;
            for(int row=0;row<MAX_GRID_SIZE_Y;++row)
                board.mPlantRow[row]=row==5?PLANTROW_DIRT:PLANTROW_NORMAL;
            require(board.HasConveyorBeltSeedBank()==conveyor,
                "UI interval fixture did not create its requested conveyor rule");
            auto& cut=*board.mCutScene;
            SeedChooserScreen chooser;
            app.mSeedChooserScreen=&chooser;
            app.mWidgetManager->AddWidget(&chooser);
            struct ClearChooser {
                LawnApp& app;SeedChooserScreen& chooser;
                ~ClearChooser(){app.mWidgetManager->SetFocus(nullptr);app.mWidgetManager->RemoveWidget(&chooser);app.mSeedChooserScreen=nullptr;}
            } clearChooser{app,chooser};

            if(!conveyor) {
                // The scheduler freezes at this overshot sample as soon as
                // StartSeedChooser runs. It must not rely on a later frame.
                cut.mCutsceneTime=4251;
                chooser.Move(123,27);chooser.mMenuButton->mY=-23;
                chooser.mMenuButton->mBtnNoDraw=true;
                cut.StartSeedChooser();
                require(cut.mSeedChoosing&&chooser.mY==0&&chooser.mX==app.mScreenBounds.mX&&
                    chooser.mMenuButton->mY==-10&&!chooser.mMenuButton->mBtnNoDraw,
                    "Seed chooser froze beyond its slide deadline without committing its endpoint");
                cut.mSeedChoosing=false;

                // A single delayed update can cross both the selection and
                // intro-end points. Selection must remain an input barrier.
                board.mDrawCount=1;
                cut.mPreloaded=cut.mPlacedZombies=cut.mPlacedLawnItems=true;
                cut.mCutsceneTime=4100;
                Sexy::ApplySimulationStep(3'000'000'000ULL);
                cut.Update();
                require(app.mGameScene==SCENE_LEVEL_INTRO&&cut.mSeedChoosing&&
                    cut.mCutsceneTime.mNanoseconds==TimeCounter::Encode(4250),
                    "A delayed intro update skipped the seed-selection interaction barrier");
                cut.Update();
                require(cut.mCutsceneTime.mNanoseconds==TimeCounter::Encode(4250),
                    "Seed selection did not keep its pinned intro timestamp");
                cut.mSeedChoosing=false;

                // Existing Dave and shovel interactions must also prevent a
                // delayed update from starting the level behind their UI.
                cut.mCutsceneTime=5900;
                app.mCrazyDaveMessageIndex=123;
                cut.Update();
                require(cut.mCutsceneTime.mNanoseconds==TimeCounter::Encode(5900)&&
                    app.mGameScene==SCENE_LEVEL_INTRO,"Intro crossed an active Dave dialogue barrier");
                app.mCrazyDaveMessageIndex=-1;
                board.mTutorialState=TUTORIAL_SHOVEL_PICKUP;
                cut.Update();
                require(cut.mCutsceneTime.mNanoseconds==TimeCounter::Encode(5900)&&
                    app.mGameScene==SCENE_LEVEL_INTRO,"Intro crossed an active shovel tutorial barrier");
                board.mTutorialState=TUTORIAL_OFF;
            }

            // TimeCounter stores the previous sample in the same authored
            // units. Exercise a real sample on either side of the end, not
            // an equality hit; no unrelated intro event is crossed here.
            const int bankEnd=conveyor?6250:4250;
            cut.mCutsceneTime=bankEnd-100;
            cut.AnimateBoard();
            cut.mCutsceneTime.mPreviousNanoseconds=cut.mCutsceneTime.mNanoseconds;
            cut.mCutsceneTime.mNanoseconds=TimeCounter::Encode(bankEnd+1);
            cut.AnimateBoard();
            require(board.mSeedBank->mY==0,
                "SeedBank retained a negative slide position after crossing its deadline");

            if(!conveyor) {
                chooser.Move(app.mScreenBounds.mX,3);
                cut.mCutsceneTime=4650;cut.AnimateBoard();
                cut.mCutsceneTime.mPreviousNanoseconds=cut.mCutsceneTime.mNanoseconds;
                cut.mCutsceneTime.mNanoseconds=TimeCounter::Encode(4751);cut.AnimateBoard();
                require(chooser.mY==(landscape?BOARD_HEIGHT:SEED_CHOOSER_OFFSET_Y)&&
                    chooser.mMenuButton->mDisabled,
                    "Seed chooser exit discarded the sample crossing its hidden endpoint");

                chooser.mChooseState=CHOOSE_VIEW_LAWN;
                chooser.mViewLawnStartTimeNs=1'000'000'000;
                chooser.mViewLawnReturnTimeNs=2'000'000'000;
                clocks.mVisualTimeNs=chooser.mViewLawnReturnTimeNs+800'000'000;
                chooser.UpdateViewLawn();
                clocks.mVisualTimeNs=chooser.mViewLawnReturnTimeNs+1'010'000'000;
                chooser.UpdateViewLawn();
                const int finalY=landscape?0:SEED_CHOOSER_OFFSET_Y-
                    DesktopUIAtlas::Images[size_t(DesktopUIAtlas::Sprite::SEEDCHOOSER_BACKGROUND)].mHeight;
                require(chooser.mY==finalY&&chooser.mChooseState==CHOOSE_NORMAL&&
                    chooser.mViewLawnReturnTimeNs==-1&&!chooser.mMenuButton->mDisabled,
                    "View Lawn returned to selection without committing its final pose and input state");
            }
        }
        app.mBoard=nullptr;
        app.mEffectSystem->ProcessDeleteQueue();
        std::cout<<"PASS real UI interval endpoints landscape="<<landscape<<" conveyor="<<conveyor<<'\n';
    }
}
