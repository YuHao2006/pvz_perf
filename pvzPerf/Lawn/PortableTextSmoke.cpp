#include "Sexy.TodLib/generated/EntityStrings.h"
#include "PortableFixesSmoke.h"
#include "ModernVulkanSmoke.h"
#include "LawnApp.h"
#include "Resources.h"
#include "Board.h"
#include "Challenge.h"
#include "CursorObject.h"
#include "Cutscene.h"
#include "Plant.h"
#include "SeedPacket.h"
#include "ToolTipWidget.h"
#include "MessageWidget.h"
#include "System/PlayerInfo.h"
#include "Widget/SeedChooserScreen.h"
#include "Widget/LawnDialog.h"
#include "Widget/GameButton.h"
#include "Sexy.TodLib/TodStringFile.h"
#include "graphics/DDImage.h"
#include "graphics/DDInterface.h"
#include "graphics/RenderInterface.h"
#include "widget/WidgetManager.h"
#include <array>
#include <fstream>
#include <limits>
#include <memory>
#include <stdexcept>

namespace {
void Require(bool value, const char* message) { if (!value) throw std::runtime_error(message); }
unsigned modalChecks = 0, modalWrong = 0;
bool chooserChecked = false;

// Expectations read actual UI values, without runtime localization keys.
SexyString Text(const SexyString& value) {
    Require(!value.empty() && value.find("<Missing ") == SexyString::npos, "Missing text fixture resource");
    return value;
}

void SurvivalCaptionProbe(LawnApp& app) {
    auto& board=*app.mBoard;
    struct Restore {
        LawnApp& app;GameMode mode;int x,stage;
        ~Restore(){app.mGameMode=mode;app.mBoard->mX=x;app.mBoard->mChallenge->mSurvivalStage=stage;}
    } restore{app,app.mGameMode,board.mX,board.mChallenge->mSurvivalStage};
    std::ofstream log(ModernSmoke::ProbePath("survival-caption.txt"));Require(bool(log),"Cannot write survival caption evidence");
    auto replace=[](SexyString text,const SexyString& token,const SexyString& value) {
        size_t pos=0;
        while((pos=text.find(token,pos))!=SexyString::npos){text.replace(pos,token.size(),value);pos+=value.size();}
        return text;
    };
    auto render=[&](MessageWidget& message,bool reference,int flags) {
        auto* screen=app.mDDInterface->mScreenImage;
        screen->FillRect(Sexy::Rect(0,0,800,600),Sexy::Color(19,31,47),0);
        Sexy::Graphics g(screen);
        const GameMode mode=app.mGameMode;
        if(reference)app.mGameMode=GAMEMODE_ADVENTURE; // Header-only control, not the caption under test.
        message.Draw(&g);app.mGameMode=mode;
        if(reference && flags>0 && message.mDuration>0) {
            auto unit=replace(Text(flags==1?gStr.ONE_FLAG:gStr.COUNT_FLAGS),UiTextPlaceholderToken(UiTextPlaceholder::Count),std::to_string(flags));
            auto caption=replace(Text(gStr.FLAGS_COMPLETED),UiTextPlaceholderToken(UiTextPlaceholder::Flags),unit);
            TodDrawString(&g,caption,400-board.mX,576,Sexy::FONT_HOUSEOFTERROR16,
                Sexy::Color(224,187,98,std::min(message.mDuration*15,255)),DS_ALIGN_CENTER);
        }
        auto& renderer=*app.mDDInterface->mRenderInterface;
        renderer.Flush();return renderer.mRenderer->ReadScenePixels();
    };
    MessageWidget message(&app);message.SetLabel("Survival intro",MESSAGE_STYLE_HOUSE_NAME);
    Require(message.mReanimType==REANIM_NONE && message.mDuration==250,"House-name advice has unexpected entry state");
    unsigned cases=0,wrong=0,captionCases=0,controls=0;
    auto check=[&](GameMode mode,int stage,int duration,int x) {
        app.mGameMode=mode;board.mChallenge->mSurvivalStage=stage;board.mX=x;message.mDuration=duration;
        // 1073 has one flag per normal stage, two per hard/endless stage.
        const int flags=mode==GAMEMODE_ADVENTURE?0:stage*(mode==GAMEMODE_SURVIVAL_NORMAL_STAGE_1?1:2);
        const auto actual=render(message,false,flags),expected=render(message,true,flags);
        Require(actual.size()==480000 && expected.size()==actual.size(),"Caption readback dimensions changed");
        unsigned different=0;for(size_t i=0;i<actual.size();++i)different+=actual[i]!=expected[i];
        ++cases;wrong+=different!=0;
        if(flags>0 && duration>0)++captionCases;else ++controls;
        log<<"case="<<cases<<" mode="<<int(mode)<<" stage="<<stage<<" flags="<<flags<<" duration="<<duration
            <<" board-x="<<x<<" different-pixels="<<different<<std::endl;
    };
    const std::array modes{GAMEMODE_SURVIVAL_NORMAL_STAGE_1,GAMEMODE_SURVIVAL_HARD_STAGE_1,
        GAMEMODE_SURVIVAL_ENDLESS_STAGE_3,GAMEMODE_ADVENTURE};
    for(auto mode:modes)for(int stage:{0,1,3})for(int duration:{1,17})for(int x:{0,80})check(mode,stage,duration,x);
    for(auto mode:modes)check(mode,3,0,0);
    // The assertion bound is observable here even in Release, where TOD_ASSERT
    // itself is compiled out. The last column is -1 in all three 1073 tables.
    bool artBound=ART_CHALLEGE_SIZE_X==9 && ART_CHALLEGE_SIZE_X==MAX_GRID_SIZE_X;
    unsigned border=0;
    for(auto mode:{GAMEMODE_LIMBO_ART_CHALLENGE_WALLNUT,GAMEMODE_LIMBO_ART_CHALLENGE_SUNFLOWER,GAMEMODE_MINIGAME_SEEING_STARS}) {
        app.mGameMode=mode;
        for(int row=0;row<6;++row){artBound&=board.mChallenge->GetArtChallengeSeed(8,row)==SEED_NONE;++border;}
    }
    log<<"cases="<<cases<<" wrong="<<wrong<<" captions="<<captionCases<<" controls="<<controls
        <<" art-width="<<ART_CHALLEGE_SIZE_X<<" border-cases="<<border<<" art-bound="<<artBound<<std::endl;
    Require(cases==52 && captionCases==24 && controls==28 && wrong==0 && border==18 && artBound,
        "Survival caption/art boundary differs from 1073; see survival-caption.txt");
    ModernSmoke::Report("portable-survival-caption-52-gpu-18-art-edge-cases",app);
}

class WarningAnswer final : public Sexy::Widget {
    LawnApp& app;
    std::ostream& log;
    bool stars, advance;
    unsigned updates = 0;
public:
    unsigned answers = 0;
    WarningAnswer(LawnApp& a, std::ostream& l, bool s, bool next) : app(a), log(l), stars(s), advance(next) {
        mMouseVisible = false;
        mWidgetFlagsMod.mAddFlags = WIDGETFLAGS_UPDATE;
        app.mWidgetManager->AddWidget(this);
    }
    ~WarningAnswer() override { if (mWidgetManager) mWidgetManager->RemoveWidget(this); }
    void Update() override {
        Require(++updates < 500, "Warning modal did not complete within 500 updates");
        auto* dialog = dynamic_cast<LawnDialog*>(app.GetDialog(DIALOG_CHOOSER_WARNING));
        if (!dialog || dialog->mResult != std::numeric_limits<int>::max()) return;
        if (dialog->mButtonDelay >= 0 && dialog->mUpdateCnt <= static_cast<std::uint32_t>(dialog->mButtonDelay)) return;
        Require(answers < (advance ? 2u : 1u), "Unexpected extra chooser warning");
        const SexyString& message = answers == 0 ? (stars ? gStr.SEED_CHOOSER_SEEING_STARS_WARNING : gStr.SEED_CHOOSER_PUFFSHROOM_WARNING) :
            (stars ? gStr.SEED_CHOOSER_SUN_WARNING : gStr.SEED_CHOOSER_NIGHT_SUN_WARNING);
        const bool correct = dialog->mDialogLines == Text(message) && dialog->mDialogHeader == Text(gStr.DIALOG_WARNING) &&
            dialog->mYesButton && dialog->mNoButton &&
            dialog->mYesButton->mLabel == Text(gStr.DIALOG_BUTTON_YES) && dialog->mNoButton->mLabel == Text(gStr.REPICK_BUTTON);
        ++modalChecks; modalWrong += !correct;
        const int reply = advance && answers == 0 ? Sexy::Dialog::ID_YES : Sexy::Dialog::ID_NO;
        log << "modal stars=" << stars << " advance=" << advance << " ordinal=" << answers
            << " actual=" << dialog->mDialogLines << " expected=" << Text(message) << " reply=" << reply << " pass=" << correct << std::endl;
        ++answers;
        // Real derived-button dispatch and nested modal wait; no OS input.
        dialog->ButtonDepress(reply);
    }
};
}

void PortableChooserTextSmoke(LawnApp& app) {
    Require(getenv("PVZ_MODERN_HIDDEN") && getenv("PVZ_APPDATA_DIR") && app.mBoard && app.mSeedChooserScreen &&
        app.mDialogMap.empty(), "Chooser text fixture needs hidden isolated chooser with no dialogs");
    auto& board = *app.mBoard; auto& chooser = *app.mSeedChooserScreen;
    Require(chooser.mMouseVisible && chooser.mSeedsInBank == 0 && chooser.mSeedsInFlight == 0 &&
        app.mGameScene == SCENE_LEVEL_INTRO, "Warning fixture needs an empty ready chooser");
    auto fixture = std::make_unique<PlayerInfo>(*app.mPlayerInfo);
    struct Restore {
        LawnApp& app; PlayerInfo* profile; GameMode mode; int level; bool paused;
        Sexy::FlagsMod boardFlags, chooserFlags; Sexy::Widget* focus;
        ~Restore() { app.mPlayerInfo = profile; app.mGameMode = mode; app.mBoard->mLevel = level;
            app.mBoard->mPaused = paused; app.mBoard->mWidgetFlagsMod = boardFlags;
            app.mSeedChooserScreen->mWidgetFlagsMod = chooserFlags; app.mWidgetManager->SetFocus(focus); }
    } restore{app, app.mPlayerInfo, app.mGameMode, board.mLevel, board.mPaused,
        board.mWidgetFlagsMod, chooser.mWidgetFlagsMod, app.mWidgetManager->mFocusWidget};
    app.mPlayerInfo = fixture.get();
    board.mWidgetFlagsMod.mRemoveFlags |= WIDGETFLAGS_UPDATE;
    chooser.mWidgetFlagsMod.mRemoveFlags |= WIDGETFLAGS_UPDATE;
    fixture->mFinishedAdventure = 0;
    const auto widgetCount = app.mWidgetManager->mWidgets.size();
    std::ofstream log(ModernSmoke::ProbePath("chooser-text.txt"));
    Require(bool(log), "Cannot write chooser text evidence");
    for (bool stars : {true, false}) for (bool advance : {false, true}) {
        app.mGameMode = stars ? GAMEMODE_MINIGAME_SEEING_STARS : GAMEMODE_ADVENTURE;
        fixture->mLevel = board.mLevel = stars ? 50 : 11;
        {
            WarningAnswer answer(app, log, stars, advance);
            chooser.OnStartButton();
            Require(answer.answers == (advance ? 2u : 1u), "Start button skipped a warning or failed to return on Repick");
        }
        Require(app.mBoard == &board && app.mSeedChooserScreen == &chooser && app.mGameScene == SCENE_LEVEL_INTRO &&
            chooser.mSeedsInBank == 0 && chooser.mSeedsInFlight == 0 && app.mDialogMap.empty() && app.mDialogList.empty() &&
            app.mWidgetManager->mWidgets.size() == widgetCount, "Repick changed chooser or leaked a registered dialog/widget");
    }
    log << "modal-cases=" << modalChecks << " wrong=" << modalWrong << std::endl;
    chooserChecked = true;
    // Accumulate all four regressions before failing so a baseline run exposes
    // the tooltip/advice bugs as well as the two warning text bugs.
}

void PortableBoardTextSmoke(LawnApp& app) {
    Require(chooserChecked && getenv("PVZ_MODERN_HIDDEN") && getenv("PVZ_APPDATA_DIR") && app.mBoard &&
        app.mGameScene == SCENE_PLAYING && !app.mSeedChooserScreen && app.mDialogMap.empty(), "Board text fixture prerequisites failed");
    SurvivalCaptionProbe(app);
    auto& board = *app.mBoard; auto& widgets = *app.mWidgetManager;
    auto& packet = board.mSeedBank->mSeedPackets[0];
    auto advice = std::make_unique<MessageWidget>(&app);
    struct Restore {
        LawnApp& app; GameMode mode; BackgroundType background; int sun, mouseX, mouseY;
        bool active, inside, helped; AdviceType help; MessageWidget* advice; SeedPacket packet;
        CursorObject cursor; ToolTipWidget tip;
        ~Restore() { auto& b = *app.mBoard; app.mGameMode = mode; b.mBackground = background; b.mSunMoney = sun;
            app.mActive = active; app.mWidgetManager->mMouseIn = inside; app.mWidgetManager->mLastMouseX = mouseX;
            app.mWidgetManager->mLastMouseY = mouseY; b.mHelpDisplayed[ADVICE_PLANT_WRONG_ART_TYPE] = helped;
            b.mHelpIndex = help; b.mAdvice = advice; b.mSeedBank->mSeedPackets[0] = packet;
            *b.mCursorObject = cursor; *b.mToolTip = tip; }
    } restore{app, app.mGameMode, board.mBackground, board.mSunMoney, widgets.mLastMouseX, widgets.mLastMouseY,
        app.mActive, widgets.mMouseIn, board.mHelpDisplayed[ADVICE_PLANT_WRONG_ART_TYPE], board.mHelpIndex,
        board.mAdvice, packet, *board.mCursorObject, *board.mToolTip};
    Require(board.CanInteractWithBoardButtons() && board.mTimeStopCounter <= 0, "Board text fixture cannot interact");
    board.mSunMoney = 10000;
    packet.mActive = true; packet.mSlotMachineCountDown = 0;
    const int px = board.mSeedBank->mX + packet.mX + packet.mOffsetX + 10;
    const int py = board.mSeedBank->mY + packet.mY + 10;
    widgets.mLastMouseX = board.mX + px; widgets.mLastMouseY = board.mY + py;
    std::ofstream log(ModernSmoke::ProbePath("board-text.txt")); Require(bool(log), "Cannot write board text evidence");
    unsigned tips = 0, tipWrong = 0, art = 0, artWrong = 0, suppression = 0;
    for (int seed = 0; seed <= 48; ++seed) for (bool imitater : {false, true}) {
        if (imitater && seed >= 40) continue; // Upgrade plants cannot be selected as Imitater targets.
        packet.mPacketType = imitater ? SEED_IMITATER : static_cast<SeedType>(seed);
        packet.mImitaterType = imitater ? static_cast<SeedType>(seed) : SEED_NONE;
        HitResult hit;
        Require(board.MouseHitTest(px, py, &hit) && hit.mObjectType == OBJECT_TYPE_SEEDPACKET && hit.mObject == &packet,
            "Tooltip fixture did not hit its actual seed packet");
        SexyString expected = Text(EntityPlantName(static_cast<SeedType>(seed)));
        if (imitater) expected = Text(gStr.IMITATER) + " " + expected;
        for (int gate = 0; gate < 3; ++gate) {
            app.mActive = gate != 1; widgets.mMouseIn = gate != 2;
            board.UpdateToolTip();
            const bool correct = board.mToolTip->mVisible == (gate == 0) && (gate != 0 || board.mToolTip->mLabel == expected);
            ++tips; tipWrong += !correct;
            if (gate == 0 || !correct) log << "tooltip seed=" << seed << " imitater=" << imitater << " gate=" << gate
                << " actual=" << board.mToolTip->mLabel << " expected=" << expected << " pass=" << correct << '\n';
        }
    }

    board.mAdvice = advice.get(); board.mBackground = BACKGROUND_1_DAY;
    const auto plants = board.mPlants.mSize;
    const int sun = board.mSunMoney;
    for (auto mode : {GAMEMODE_LIMBO_ART_CHALLENGE_WALLNUT, GAMEMODE_LIMBO_ART_CHALLENGE_SUNFLOWER,
                     GAMEMODE_MINIGAME_SEEING_STARS}) {
        app.mGameMode = mode;
        unsigned modeCases = 0;
        for (int row = 0; row < 5; ++row) for (int col = 0; col < 9; ++col) {
            const auto wanted = board.mChallenge->GetArtChallengeSeed(col, row);
            if (wanted == SEED_NONE) continue;
            const auto wrongPlant = wanted == SEED_PEASHOOTER ? SEED_SNOWPEA : SEED_PEASHOOTER;
            auto& cursor = *board.mCursorObject;
            cursor.mCursorType = CURSOR_TYPE_PLANT_FROM_BANK; cursor.mType = wrongPlant; cursor.mImitaterType = SEED_NONE;
            cursor.mSeedBankIndex = 0;
            const int x = board.GridToPixelX(col, row) + 40, y = board.GridToPixelY(col, row) + 40;
            Require(board.PlantingPixelToGridX(x, y, wrongPlant) == col && board.PlantingPixelToGridY(x, y, wrongPlant) == row &&
                board.CanPlantAt(col, row, wrongPlant) == PLANTING_NOT_ON_ART, "Art fixture would not take wrong-art branch");
            board.mHelpDisplayed[ADVICE_PLANT_WRONG_ART_TYPE] = false;
            advice->ClearLabel();
            board.MouseDownWithPlant(x, y, 1);
            auto expected = Text(gStr.ADVICE_WRONG_ART_TYPE);
            const auto token = UiTextPlaceholderToken(UiTextPlaceholder::Seed);
            auto at = expected.find(token); Require(at != SexyString::npos, "Art fixture lacks seed placeholder");
            expected.replace(at, token.size(), Text(EntityPlantName(wanted)));
            const bool correct = advice->mLabel == expected && advice->mDuration == 500 &&
                advice->mMessageStyle == MESSAGE_STYLE_HINT_FAST && board.mHelpIndex == ADVICE_PLANT_WRONG_ART_TYPE &&
                board.mHelpDisplayed[ADVICE_PLANT_WRONG_ART_TYPE] && board.mPlants.mSize == plants && board.mSunMoney == sun &&
                cursor.mType == wrongPlant && cursor.mCursorType == CURSOR_TYPE_PLANT_FROM_BANK;
            ++art; ++modeCases; artWrong += !correct;
            log << "art mode=" << int(mode) << " col=" << col << " row=" << row << " wanted=" << int(wanted)
                << " actual=" << advice->mLabel << " expected=" << expected << " pass=" << correct << '\n';
            // Existing one-time advice semantics must stay intact on a repeat click.
            advice->SetLabel("Already shown probe", MESSAGE_STYLE_HINT_FAST);
            board.MouseDownWithPlant(x, y, 1);
            Require(SexyString(advice->mLabel) == "Already shown probe" && board.mPlants.mSize == plants && board.mSunMoney == sun,
                "Repeated wrong-art click changed advice or game state");
            ++suppression;
        }
        Require(modeCases > 0, "Art fixture exercised no required cells");
    }
    log << "tooltip-cases=" << tips << " wrong=" << tipWrong << " art-cases=" << art << " wrong=" << artWrong
        << " repeat-suppression=" << suppression << " prior-modal-cases=" << modalChecks << " prior-modal-wrong=" << modalWrong << std::endl;
    Require(modalChecks == 6 && tips == 267 && !modalWrong && !tipWrong && !artWrong,
        "1073 warning/Imitater/art text regression; see chooser-text.txt and board-text.txt");
    ModernSmoke::Report("portable-text-six-modals-267-tooltips-three-art-patterns", app);
}
