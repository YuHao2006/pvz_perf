#include "Sexy.TodLib/generated/EntityStrings.h"
#include "Sexy.TodLib/generated/ReanimVariantOptions.h"
#include "Lawn/LawnCommon.h"
#include "Lawn/Board.h"
#include "GameButton.h"
#include "StoreScreen.h"
#include "Lawn/ZenGarden.h"
#include "GameSelector.h"
#include "LawnApp.h"
#include "Almanac.h"
#include "Resources.h"
#include "Lawn/System/Music.h"
#include "Lawn/ToolTipWidget.h"
#include "Lawn/System/SaveGame.h"
#include "GameConstants.h"
#include "Lawn/System/PlayerInfo.h"
#include "Lawn/System/ProfileMgr.h"
#include "Lawn/System/TypingCheck.h"
#include "Sexy.TodLib/TodFoley.h"
#include "Sexy.TodLib/TodDebug.h"
#include "graphics/Font.h"
#include "Sexy.TodLib/Reanimator.h"
#include "Sexy.TodLib/TodParticle.h"
#include "widget/Dialog.h"
#include "widget/WidgetManager.h"
#include "ZombatarScreen.h"
#include "ZombatarItems.h"
#include "SelectorLayout.h"
#include "LawnDialog.h"
#include "Sexy.TodLib/TodStringFile.h"
#include "widget/WidgetLifetimeHold.h"

namespace
{
class SelectorModalSession
{
    WidgetLifetimeHold mCaller;
    GameSelector& mSelector;
    LawnApp& mApp;
    PlayerInfo* mPlayer;
    unsigned int mPlayerId;
    unsigned int mPlayerUseSeq;
    Board* mBoard;
    std::uint64_t mBoardRevision;
    std::uint64_t mProfileRevision;
    bool mStarting;
    bool SameSession() const
    {
        return !mApp.mShutdown && !mApp.mCloseRequest && mApp.mGameScene == SCENE_MENU &&
            mApp.mPlayerInfo == mPlayer && mPlayer && mPlayer->mId == mPlayerId &&
            mPlayer->mUseSeq == mPlayerUseSeq && mApp.mBoard == mBoard &&
            mApp.mBoardRevision == mBoardRevision && mSelector.mProfileRevision == mProfileRevision &&
            mSelector.mStartingGame == mStarting;
    }
public:
    explicit SelectorModalSession(GameSelector& selector)
        : mCaller(selector), mSelector(selector), mApp(*selector.mApp), mPlayer(mApp.mPlayerInfo),
          mPlayerId(mPlayer ? mPlayer->mId : 0), mPlayerUseSeq(mPlayer ? mPlayer->mUseSeq : 0),
          mBoard(mApp.mBoard), mBoardRevision(mApp.mBoardRevision),
          mProfileRevision(selector.mProfileRevision), mStarting(selector.mStartingGame) {}
    bool IsCurrent() const
    {
        return SameSession() && mApp.mGameSelector == &mSelector && mSelector.mWidgetManager;
    }
    bool IsRetiredTransition() const
    {
        // 1073 removes the selector before waiting in the 3-5 taco shop.
        // That deliberate handoff is valid only while no successor scene
        // or user has taken its place.
        return SameSession() && !mApp.mGameSelector && !mSelector.mWidgetManager;
    }
};
}

int GameSelector::WaitForSelectorDialog(Dialog* dialog)
{
    WidgetLifetimeHold callerLifetime(*this);
    struct PendingWait
    {
        GameSelector& owner;
        Dialog* child;
        WidgetLifetimeHold childLifetime;
        PendingWait(GameSelector& selector, Dialog* dialog)
            : owner(selector), child(dialog), childLifetime(*dialog) { owner.mWaitingDialog = child; }
        ~PendingWait()
        {
            owner.mApp->SexyAppBase::KillDialog(child);
            owner.mWaitingDialog = nullptr;
        }
    } pending(*this, dialog);
    return dialog->WaitForResult(true);
}

int GameSelector::SelectorMessageBox(int id, const SexyChar* header, const SexyChar* lines,
    const SexyChar* yes, const SexyChar* no, int buttons)
{
    auto* dialog = static_cast<LawnDialog*>(mApp->DoDialog(id, true, header, lines, yes, buttons));
    // Match LawnMessageBox's visible buttons and modal-stack focus restoration,
    // while recording which child this selector owns during the wait.
    dialog->mRestoreFocusFromModalStack = true;
    if (dialog->mYesButton) dialog->mYesButton->mLabel = yes ? yes : "";
    if (dialog->mNoButton) dialog->mNoButton->mLabel = no ? no : "";
    mApp->mWidgetManager->SetFocus(dialog);
    return WaitForSelectorDialog(dialog);
}

static constexpr float SELECTOR_MAIN_PAGE_X = 800.0f;
static constexpr float SELECTOR_LEFT_ART_EXTENSION = 300.0f;
static constexpr float gFlowerCenter[3][2] = {
	{ 1565.0f, 483.0f }, { 1463.0f, 455.0f }, { 1501.0f, 439.0f }
};  // GOTY 1.2.0.1073: 0x6E3328

//0x448C80
void GameSelectorOverlay::Draw(Graphics* g)
{ 
	mParent->DrawOverlay(g);
}

GameSelectorOverlay::GameSelectorOverlay(GameSelector* theGameSelector)
{
	mParent = theGameSelector;
	mMouseVisible = false;
	mHasAlpha = true;
}

//0x448CB0
// GOTY @Patoke: 0x44B8D0
GameSelector::GameSelector(LawnApp* theApp)
{
	unsigned int aCtorStart = SexyGetTickCount();
	TodLoadResources(ResourceGroupId::DelayLoad_Zombatar);
	unsigned int aAfterResources = SexyGetTickCount();

	mApp = theApp;
    mClip = false; // The background art extends outside the original menu page.
	mLevel = 1;
	mLoading = false;
	mHasTrophy = false;
	mToolTip = new ToolTipWidget();

	mAdventureButton = MakeNewButton(
		GameSelector::GameSelector_Adventure, 
		this, 
		"", 
		nullptr, 
		Sexy::IMAGE_REANIM_SELECTORSCREEN_ADVENTURE_BUTTON, 
		Sexy::IMAGE_REANIM_SELECTORSCREEN_ADVENTURE_HIGHLIGHT, 
		Sexy::IMAGE_REANIM_SELECTORSCREEN_ADVENTURE_HIGHLIGHT
	);
	
	mAdventureButton->Resize(0, 0, Sexy::IMAGE_REANIM_SELECTORSCREEN_ADVENTURE_BUTTON->mWidth, 125);
	mAdventureButton->mClip = false;
	mAdventureButton->mBtnNoDraw = true;
	mAdventureButton->mMouseVisible = false;
	mAdventureButton->mPolygonShape[0] = SexyVector2(7.0f, 1.0f);
	mAdventureButton->mPolygonShape[1] = SexyVector2(328.0f, 30.0f);
	mAdventureButton->mPolygonShape[2] = SexyVector2(314.0f, 125.0f);
	mAdventureButton->mPolygonShape[3] = SexyVector2(1.0f, 78.0f);
	mAdventureButton->mUsePolygonShape = true;

	mMinigameButton = MakeNewButton(
		GameSelector::GameSelector_Minigame, 
		this, 
		"", 
		nullptr, 
		Sexy::IMAGE_REANIM_SELECTORSCREEN_SURVIVAL_BUTTON, 
		Sexy::IMAGE_REANIM_SELECTORSCREEN_SURVIVAL_HIGHLIGHT, 
		Sexy::IMAGE_REANIM_SELECTORSCREEN_SURVIVAL_HIGHLIGHT
	);
	mMinigameButton->Resize(0, 0, Sexy::IMAGE_REANIM_SELECTORSCREEN_SURVIVAL_BUTTON->mWidth, 130);
	mMinigameButton->mClip = false;
	mMinigameButton->mBtnNoDraw = true;
	mMinigameButton->mMouseVisible = false;
	mMinigameButton->mPolygonShape[0] = SexyVector2(4.0f, 2.0f);
	mMinigameButton->mPolygonShape[1] = SexyVector2(312.0f, 51.0f);
	mMinigameButton->mPolygonShape[2] = SexyVector2(296.0f, 130.0f);
	mMinigameButton->mPolygonShape[3] = SexyVector2(7.0f, 77.0f);
	mMinigameButton->mUsePolygonShape = true;

	mPuzzleButton = MakeNewButton(
		GameSelector::GameSelector_Puzzle, 
		this, 
		"", 
		nullptr, 
		Sexy::IMAGE_REANIM_SELECTORSCREEN_CHALLENGES_BUTTON, 
		Sexy::IMAGE_REANIM_SELECTORSCREEN_CHALLENGES_HIGHLIGHT, 
		Sexy::IMAGE_REANIM_SELECTORSCREEN_CHALLENGES_HIGHLIGHT
	);
	mPuzzleButton->Resize(0, 0, Sexy::IMAGE_REANIM_SELECTORSCREEN_CHALLENGES_BUTTON->mWidth, 121);
	mPuzzleButton->mClip = false;
	mPuzzleButton->mBtnNoDraw = true;
	mPuzzleButton->mMouseVisible = false;
	mPuzzleButton->mPolygonShape[0] = SexyVector2(2.0f, 0.0f);
	mPuzzleButton->mPolygonShape[1] = SexyVector2(281.0f, 55.0f);
	mPuzzleButton->mPolygonShape[2] = SexyVector2(268.0f, 121.0f);
	mPuzzleButton->mPolygonShape[3] = SexyVector2(3.0f, 60.0f);
	mPuzzleButton->mUsePolygonShape = true;

	mSurvivalButton = MakeNewButton(
		GameSelector::GameSelector_Survival,
		this, 
		"", 
		nullptr, 
		Sexy::IMAGE_REANIM_SELECTORSCREEN_VASEBREAKER_BUTTON, 
		Sexy::IMAGE_REANIM_SELECTORSCREEN_VASEBREAKER_HIGHLIGHT, 
		Sexy::IMAGE_REANIM_SELECTORSCREEN_VASEBREAKER_HIGHLIGHT
	);
	mSurvivalButton->Resize(0, 0, Sexy::IMAGE_REANIM_SELECTORSCREEN_VASEBREAKER_BUTTON->mWidth, 124);
	mSurvivalButton->mClip = false;
	mSurvivalButton->mBtnNoDraw = true;
	mSurvivalButton->mMouseVisible = false;
	mSurvivalButton->mPolygonShape[0] = SexyVector2(7.0f, 1.0f);
	mSurvivalButton->mPolygonShape[1] = SexyVector2(267.0f, 62.0f);
	mSurvivalButton->mPolygonShape[2] = SexyVector2(257.0f, 124.0f);
	mSurvivalButton->mPolygonShape[3] = SexyVector2(7.0f, 57.0f);
	mSurvivalButton->mUsePolygonShape = true;

	// @Patoke: add these button defs
	mZombatarButton = MakeNewButton(
		GameSelector::GameSelector_Zombatar,
		this,
		"",
		nullptr,
		Sexy::IMAGE_BLANK,
		Sexy::IMAGE_BLANK,
		Sexy::IMAGE_BLANK
	);
	mZombatarButton->Resize(0, 0, Sexy::IMAGE_REANIM_SELECTORSCREEN_WOODSIGN3_PRESS->mWidth, Sexy::IMAGE_REANIM_SELECTORSCREEN_WOODSIGN3_PRESS->mHeight);
	mZombatarButton->mClip = false;
	mZombatarButton->mBtnNoDraw = true;
	mZombatarButton->mMouseVisible = false;

	mAchievementsButton = MakeNewButton(
		GameSelector::GameSelector_Achievements,
		this,
		"",
		nullptr,
		Sexy::IMAGE_SELECTORSCREEN_ACHIEVEMENTS_PEDESTAL,
		Sexy::IMAGE_SELECTORSCREEN_ACHIEVEMENTS_PEDESTAL_PRESS,
		Sexy::IMAGE_SELECTORSCREEN_ACHIEVEMENTS_PEDESTAL_PRESS
	);
	mAchievementsButton->Resize(20, mApp->mHeight - Sexy::IMAGE_SELECTORSCREEN_ACHIEVEMENTS_PEDESTAL->mHeight - 35, Sexy::IMAGE_SELECTORSCREEN_ACHIEVEMENTS_PEDESTAL->mWidth, Sexy::IMAGE_SELECTORSCREEN_ACHIEVEMENTS_PEDESTAL->mHeight);
	mAchievementsButton->mClip = false;
	mAchievementsButton->mBtnNoDraw = false;
	mAchievementsButton->mMouseVisible = false;

	mZenGardenButton = MakeNewButton(
		GameSelector::GameSelector_ZenGarden, 
		this, 
		"", 
		nullptr, 
		Sexy::IMAGE_SELECTORSCREEN_ZENGARDEN, 
		Sexy::IMAGE_SELECTORSCREEN_ZENGARDENHIGHLIGHT, 
		Sexy::IMAGE_SELECTORSCREEN_ZENGARDENHIGHLIGHT
	);
	mZenGardenButton->Resize(0, 0, 130, 130);
	mZenGardenButton->mMouseVisible = false;
	mZenGardenButton->mClip = false;

	mOptionsButton = MakeNewButton(
		GameSelector::GameSelector_Options, 
		this, 
		"", 
		nullptr, 
		Sexy::IMAGE_SELECTORSCREEN_OPTIONS1, 
		Sexy::IMAGE_SELECTORSCREEN_OPTIONS2, 
		Sexy::IMAGE_SELECTORSCREEN_OPTIONS2
	);
	mOptionsButton->Resize(0, 0, Sexy::IMAGE_SELECTORSCREEN_OPTIONS1->mWidth, Sexy::IMAGE_SELECTORSCREEN_OPTIONS1->mHeight + 23);
	mOptionsButton->mClip = false; // @Patoke: not in original but fixes stuff
	mOptionsButton->mBtnNoDraw = true;
	mOptionsButton->mMouseVisible = false;
	mOptionsButton->mButtonOffsetY = 15;

	mHelpButton = MakeNewButton(
		GameSelector::GameSelector_Help, 
		this, 
		"", 
		nullptr, 
		Sexy::IMAGE_SELECTORSCREEN_HELP1, 
		Sexy::IMAGE_SELECTORSCREEN_HELP2, 
		Sexy::IMAGE_SELECTORSCREEN_HELP2
	);
	mHelpButton->Resize(0, 0, Sexy::IMAGE_SELECTORSCREEN_HELP1->mWidth, Sexy::IMAGE_SELECTORSCREEN_HELP1->mHeight + 33);
	mHelpButton->mClip = false; // @Patoke: not in original but fixes stuff
	mHelpButton->mBtnNoDraw = true;
	mHelpButton->mMouseVisible = false;
	mHelpButton->mButtonOffsetY = 30;

	mQuitButton = MakeNewButton(
		GameSelector::GameSelector_Quit, 
		this, 
		"", 
		nullptr, 
		Sexy::IMAGE_SELECTORSCREEN_QUIT1, 
		Sexy::IMAGE_SELECTORSCREEN_QUIT2, 
		Sexy::IMAGE_SELECTORSCREEN_QUIT2
	);
	mQuitButton->Resize(0, 0, Sexy::IMAGE_SELECTORSCREEN_QUIT1->mWidth + 10, Sexy::IMAGE_SELECTORSCREEN_QUIT1->mHeight + 10);
	mQuitButton->mClip = false; // @Patoke: not in original but fixes stuff
	mQuitButton->mBtnNoDraw = true;
	mQuitButton->mMouseVisible = false;
	mQuitButton->mButtonOffsetX = 5;
	mQuitButton->mButtonOffsetY = 5;

	mChangeUserButton = MakeNewButton(
		GameSelector::GameSelector_ChangeUser, 
		this, 
		"", 
		nullptr, 
		Sexy::IMAGE_BLANK, 
		Sexy::IMAGE_BLANK, 
		Sexy::IMAGE_BLANK
	);
	mChangeUserButton->Resize(0, 0, 250, 30);
	mChangeUserButton->mBtnNoDraw = true;
	mChangeUserButton->mMouseVisible = false;

	mOverlayWidget = new GameSelectorOverlay(this);
	mOverlayWidget->Resize((int)SELECTOR_MAIN_PAGE_X, 0, BOARD_WIDTH, BOARD_HEIGHT);

	mStoreButton = MakeNewButton(
		GameSelector::GameSelector_Store, 
		this, 
		"", 
		nullptr, 
		Sexy::IMAGE_SELECTORSCREEN_STORE, 
		Sexy::IMAGE_SELECTORSCREEN_STOREHIGHLIGHT, 
		Sexy::IMAGE_SELECTORSCREEN_STOREHIGHLIGHT
	);
	mStoreButton->Resize(405, 484, Sexy::IMAGE_SELECTORSCREEN_STORE->mWidth, Sexy::IMAGE_SELECTORSCREEN_STORE->mHeight);
	mStoreButton->mClip = false; // @Patoke: not in original but fixes stuff
	mStoreButton->mMouseVisible = false;
	
	mAlmanacButton = MakeNewButton(
		GameSelector::GameSelector_Almanac, 
		this, 
		"", 
		nullptr, 
		Sexy::IMAGE_SELECTORSCREEN_ALMANAC, 
		Sexy::IMAGE_SELECTORSCREEN_ALMANACHIGHLIGHT, 
		Sexy::IMAGE_SELECTORSCREEN_ALMANACHIGHLIGHT
	);
	mAlmanacButton->Resize(327, 428, Sexy::IMAGE_SELECTORSCREEN_ALMANAC->mWidth, Sexy::IMAGE_SELECTORSCREEN_ALMANAC->mHeight);
	mAlmanacButton->mClip = false; // @Patoke: not in original but fixes stuff
	mAlmanacButton->mMouseVisible = false;

	mApp->mMusic->MakeSureMusicIsPlaying(MusicTune::MUSIC_TUNE_TITLE_CRAZY_DAVE_MAIN_THEME);

	mStartingGame = false;
	mStartingGameCounter = 0;
	mMinigamesLocked = false;
	mPuzzleLocked = false;
	mSurvivalLocked = false;
	mUnlockSelectorCheat = false;
	mTrophyParticleID = ParticleSystemID::PARTICLESYSTEMID_NULL;
	mShowStartButton = false;

	Reanimation* aSelectorReanim = mApp->AddReanimation(0.5f, 0.5f, 0, ReanimationType::REANIM_SELECTOR_SCREEN);
	aSelectorReanim->PlayReanim(ReanimTrackId::anim_open, ReanimLoopType::REANIM_PLAY_ONCE_AND_HOLD, 0, 30.0f);
	aSelectorReanim->AssignRenderGroupToRange(ReanimTrackRanges::flower, RENDER_GROUP_HIDDEN);
	aSelectorReanim->AssignRenderGroupToRange(ReanimTrackRanges::leaf, RENDER_GROUP_HIDDEN);
	aSelectorReanim->AssignRenderGroupToTrack(ReanimTrackId::SelectorScreen_BG, 1);
	mSelectorReanimID = mApp->ReanimationGetID(aSelectorReanim);
	// Adventure and StartAdventure share one shadow image (verified identical
	// pixels). Keep a single shadow track always visible, like the other
	// three tombstone buttons, and permanently hide the duplicate so the two
	// semi-transparent shadows do not stack darker.
	aSelectorReanim->AssignRenderGroupToTrack(ReanimTrackId::SelectorScreen_StartAdventure_shadow, RENDER_GROUP_HIDDEN);
	mSelectorState = SelectorAnimState::SELECTOR_OPEN;
	int aFrameStart, aFrameCount;
	aSelectorReanim->GetFramesForLayer(ReanimTrackId::anim_sign, aFrameStart, aFrameCount);
	aSelectorReanim->mFrameBasePose = aFrameStart + aFrameCount - 1;

	for (int i = 0; i < 6; i++)
	{
		Reanimation* aCloudReanim = mApp->AddReanimation(0.5f, 0.5f, 0, ReanimationType::REANIM_SELECTOR_SCREEN);
		static constexpr ReanimTrackId aCloudLayers[] = {
			ReanimTrackId::anim_cloud1, ReanimTrackId::anim_cloud2, ReanimTrackId::anim_cloud4,
			ReanimTrackId::anim_cloud5, ReanimTrackId::anim_cloud6, ReanimTrackId::anim_cloud7};
		aCloudReanim->PlayReanim(aCloudLayers[i], ReanimLoopType::REANIM_PLAY_ONCE_AND_HOLD, 0, 0.0f);
		mCloudReanimID[i] = mApp->ReanimationGetID(aCloudReanim);
		mCloudCounter[i] = RandRangeInt(-6000, 2000);
		if (mCloudCounter[i] < 0)
		{
			aCloudReanim->mAnimTime = -mCloudCounter[i] / 6000.0f;
			aCloudReanim->mAnimRate = 0.5f;
			mCloudCounter[i] = 0;
		}
		else
			aCloudReanim->mAnimRate = 0.0f;
	}

	for (int i = 0; i < 3; i++)
	{
		Reanimation* aFlowerReanim = mApp->AddReanimation(0.5f, 0.5f, 0, ReanimationType::REANIM_SELECTOR_SCREEN);
		static constexpr ReanimTrackId aFlowerLayers[] = {
			ReanimTrackId::anim_flower1, ReanimTrackId::anim_flower2, ReanimTrackId::anim_flower3};
		aFlowerReanim->PlayReanim(aFlowerLayers[i], ReanimLoopType::REANIM_PLAY_ONCE_AND_HOLD, 0, 0.0f);
		aFlowerReanim->mAnimRate = 0.0f;
		aFlowerReanim->AttachToAnotherReanimation(aSelectorReanim, ReanimTrackId::SelectorScreen_BG_Right);
		aFlowerReanim->mIsAttachment = false;
		mFlowerReanimID[i] = mApp->ReanimationGetID(aFlowerReanim);
	}

	Reanimation* aLeafReanim = mApp->AddReanimation(0.5f, 0.5f, 0, ReanimationType::REANIM_SELECTOR_SCREEN);
	aLeafReanim->PlayReanim(ReanimTrackId::anim_grass, ReanimLoopType::REANIM_LOOP, 0, 6.0f);
	aLeafReanim->mAnimRate = 0.0f;
	mLeafReanimID = mApp->ReanimationGetID(aLeafReanim);
	mLeafCounter = 50;

	SyncProfile(false);
	mApp->PlaySample(Sexy::SOUND_ROLL_IN);

	// @Patoke: add new var init
	mSlideCounter = 0;
	mStartX = 0;
	mStartY = 0;
	mDestX = 0;
	mDestY = 0;
	mZombatarScreen = new ZombatarScreen(mApp);
	mZombatarScreen->Move(int(SELECTOR_MAIN_PAGE_X) + BOARD_WIDTH, 0);
    mZombatarScreen->mVisible = false;
    mZombatarScreen->mWidgetFlagsMod.mRemoveFlags |= WIDGETFLAGS_UPDATE;
	mAchievementsWidget = new AchievementsWidget(this->mApp);
	mAchievementsWidget->Move((int)SELECTOR_MAIN_PAGE_X, mApp->mHeight);
	unsigned int aAfterWidgets = SexyGetTickCount();

	this->AddWidget(mAdventureButton);
	this->AddWidget(mMinigameButton);
	this->AddWidget(mPuzzleButton);
	this->AddWidget(mOptionsButton);
	this->AddWidget(mQuitButton);
	this->AddWidget(mHelpButton);
	this->AddWidget(mStoreButton);
	this->AddWidget(mAlmanacButton);
	this->AddWidget(mSurvivalButton);
	this->AddWidget(mZenGardenButton);
	this->AddWidget(mChangeUserButton);
	this->AddWidget(mZombatarButton);
	this->AddWidget(mAchievementsButton);
	this->AddWidget(mZombatarScreen);
	this->AddWidget(mAchievementsWidget);
	// 1073 adds the overlay last so the hand, leaf, flowers, trophy and tooltip
	// draw above every selector button.
	this->AddWidget(mOverlayWidget);

}

//0x449D00、0x449D20
GameSelector::~GameSelector()
{
	// The selector owns these widgets. Remove their parent links before their
	// destructors run; WidgetContainer verifies that invariant in debug builds.
	RemoveAllWidgets(false);

	if (mAdventureButton)
		delete mAdventureButton;
	if (mMinigameButton)
		delete mMinigameButton;
	if (mPuzzleButton)
		delete mPuzzleButton;
	if (mOptionsButton)
		delete mOptionsButton;
	if (mQuitButton)
		delete mQuitButton;
	if (mHelpButton)
		delete mHelpButton;
	if (mOverlayWidget)
		delete mOverlayWidget;
	if (mStoreButton)
		delete mStoreButton;
	if (mAlmanacButton)
		delete mAlmanacButton;
	if (mZenGardenButton)
		delete mZenGardenButton;
	if (mSurvivalButton)
		delete mSurvivalButton;
	if (mChangeUserButton)
		delete mChangeUserButton;
	// @Patoke: new widgets
	if (mZombatarButton)
		delete mZombatarButton;
	if (mZombatarScreen)
		delete mZombatarScreen;
	if (mAchievementsButton)
		delete mAchievementsButton;
	if (mAchievementsWidget)
		delete mAchievementsWidget;

	delete mToolTip;
}

//0x449E60
// GOTY @Patoke: 0x44CDD0
void GameSelector::SyncButtons()
{
	bool aAlmanacAvailable = mApp->CanShowAlmanac() || mUnlockSelectorCheat;
	bool aStoreOpen = mApp->CanShowStore() || mUnlockSelectorCheat;
	bool aZenGardenOpen = mApp->CanShowZenGarden() || mUnlockSelectorCheat;

	mAlmanacButton->mDisabled = !aAlmanacAvailable;
	mAlmanacButton->mVisible = aAlmanacAvailable;
	mStoreButton->mDisabled = !aStoreOpen;
	mStoreButton->mVisible = aStoreOpen;
	mZombatarButton->mDisabled = false; // @Patoke: added these
	mZombatarButton->mVisible = true;

	Reanimation* aSelectorReanim = mApp->ReanimationGet(mSelectorReanimID);
	if (aAlmanacAvailable)
	{
		aSelectorReanim->AssignRenderGroupToRange(ReanimTrackRanges::almanac_key_shadow, RENDER_GROUP_NORMAL);
		if (aStoreOpen)
			aSelectorReanim->SetVariantOption(ReanimTrackId::almanac_key_shadow, 0);
		else
			aSelectorReanim->SetVariantOption(ReanimTrackId::almanac_key_shadow, ReanimOptions::SelectorScreen::almanac_key_shadow::SELECTORSCREEN_ALMANAC_SHADOW);
	}
	else if (aStoreOpen)
	{
		aSelectorReanim->AssignRenderGroupToRange(ReanimTrackRanges::almanac_key_shadow, RENDER_GROUP_NORMAL);
		aSelectorReanim->SetVariantOption(ReanimTrackId::almanac_key_shadow, ReanimOptions::SelectorScreen::almanac_key_shadow::SELECTORSCREEN_KEY_SHADOW);
	}
	else
		aSelectorReanim->AssignRenderGroupToRange(ReanimTrackRanges::almanac_key_shadow, RENDER_GROUP_HIDDEN);

	mZenGardenButton->mDisabled = !aZenGardenOpen;
	mZenGardenButton->mVisible = aZenGardenOpen;

	// @Patoke: all of these are already assigned in the constructor, why assign them here? (this fixes the hover highlight)
	if (mMinigamesLocked)
	{
		//mMinigameButton->mOverImage = Sexy::IMAGE_REANIM_SELECTORSCREEN_SURVIVAL_HIGHLIGHT;
		//mMinigameButton->mDownImage = Sexy::IMAGE_REANIM_SELECTORSCREEN_SURVIVAL_HIGHLIGHT;
		mMinigameButton->SetColor(ButtonWidget::COLOR_BKG, Color(128, 128, 128));
	}
	else
	{
		//mMinigameButton->mOverImage = Sexy::IMAGE_REANIM_SELECTORSCREEN_SURVIVAL_HIGHLIGHT;
		//mMinigameButton->mDownImage = Sexy::IMAGE_REANIM_SELECTORSCREEN_SURVIVAL_HIGHLIGHT;
		mMinigameButton->SetColor(ButtonWidget::COLOR_BKG, Color::White);
	}
	if (mPuzzleLocked)
	{
		//mPuzzleButton->mOverImage = Sexy::IMAGE_REANIM_SELECTORSCREEN_CHALLENGES_HIGHLIGHT;
		//mPuzzleButton->mDownImage = Sexy::IMAGE_REANIM_SELECTORSCREEN_CHALLENGES_HIGHLIGHT;
		mPuzzleButton->SetColor(ButtonWidget::COLOR_BKG, Color(128, 128, 128));
	}
	else
	{
		//mPuzzleButton->mOverImage = Sexy::IMAGE_REANIM_SELECTORSCREEN_CHALLENGES_HIGHLIGHT;
		//mPuzzleButton->mDownImage = Sexy::IMAGE_REANIM_SELECTORSCREEN_CHALLENGES_HIGHLIGHT;
		mPuzzleButton->SetColor(ButtonWidget::COLOR_BKG, Color::White);
	}
	if (mSurvivalLocked)
	{
		//mSurvivalButton->mOverImage = Sexy::IMAGE_REANIM_SELECTORSCREEN_VASEBREAKER_HIGHLIGHT;
		//mSurvivalButton->mDownImage = Sexy::IMAGE_REANIM_SELECTORSCREEN_VASEBREAKER_HIGHLIGHT;
		mSurvivalButton->SetColor(ButtonWidget::COLOR_BKG, Color(128, 128, 128));
	}
	else
	{
		//mSurvivalButton->mOverImage = Sexy::IMAGE_REANIM_SELECTORSCREEN_VASEBREAKER_HIGHLIGHT;
		//mSurvivalButton->mDownImage = Sexy::IMAGE_REANIM_SELECTORSCREEN_VASEBREAKER_HIGHLIGHT;
		mSurvivalButton->SetColor(ButtonWidget::COLOR_BKG, Color::White);
	}

	ReanimatorTrackInstance* aMinigameTrack = aSelectorReanim->GetTrackInstanceByName(ReanimTrackId::SelectorScreen_Survival_button);
	ReanimatorTrackInstance* aPuzzleTrack = aSelectorReanim->GetTrackInstanceByName(ReanimTrackId::SelectorScreen_Challenges_button);
	ReanimatorTrackInstance* aSurvivalTrack = aSelectorReanim->GetTrackInstanceByName(ReanimTrackId::SelectorScreen_ZenGarden_button);
	aMinigameTrack->mTrackColor = mMinigameButton->GetColor(ButtonWidget::COLOR_BKG);
	aPuzzleTrack->mTrackColor = mPuzzleButton->GetColor(ButtonWidget::COLOR_BKG);
	aSurvivalTrack->mTrackColor = mSurvivalButton->GetColor(ButtonWidget::COLOR_BKG);

	if (mShowStartButton)
	{
		// The Adventure/StartAdventure shadow tracks use the same image and are
		// never touched; only swap which button track is visible.
		aSelectorReanim->AssignRenderGroupToTrack(ReanimTrackId::SelectorScreen_Adventure_button, RENDER_GROUP_HIDDEN);
		aSelectorReanim->AssignRenderGroupToTrack(ReanimTrackId::SelectorScreen_StartAdventure_button, RENDER_GROUP_NORMAL);
		mAdventureButton->mButtonImage = Sexy::IMAGE_REANIM_SELECTORSCREEN_STARTADVENTURE_BUTTON;
		mAdventureButton->mOverImage = Sexy::IMAGE_REANIM_SELECTORSCREEN_STARTADVENTURE_HIGHLIGHT;
		mAdventureButton->mDownImage = Sexy::IMAGE_REANIM_SELECTORSCREEN_STARTADVENTURE_HIGHLIGHT;
	}
	else
	{
		aSelectorReanim->AssignRenderGroupToTrack(ReanimTrackId::SelectorScreen_StartAdventure_button, RENDER_GROUP_HIDDEN);
		aSelectorReanim->AssignRenderGroupToTrack(ReanimTrackId::SelectorScreen_Adventure_button, RENDER_GROUP_NORMAL);
		mAdventureButton->mButtonImage = Sexy::IMAGE_REANIM_SELECTORSCREEN_ADVENTURE_BUTTON;
		mAdventureButton->mOverImage = Sexy::IMAGE_REANIM_SELECTORSCREEN_ADVENTURE_HIGHLIGHT;
		mAdventureButton->mDownImage = Sexy::IMAGE_REANIM_SELECTORSCREEN_ADVENTURE_HIGHLIGHT;
	}
	mAdventureButton->MarkDirty();
}

//0x44A2E0
// GOTY @Patoke: 0x44D230
void GameSelector::AddTrophySparkle()
{
	TOD_ASSERT(mTrophyParticleID == PARTICLESYSTEMID_NULL);
	TodParticleSystem* aTrophyParticle = mApp->AddTodParticle(85.0f, 380.0f, RenderLayer::RENDER_LAYER_TOP, ParticleEffect::PARTICLE_TROPHY_SPARKLE);
	mTrophyParticleID = mApp->ParticleGetID(aTrophyParticle);
}

//0x44A320
// GOTY @Patoke: 0x44D270
void GameSelector::SyncProfile(bool theShowLoading)
{
    ++mProfileRevision;
    if (mWaitingDialog)
        mApp->SexyAppBase::KillDialog(mWaitingDialog);
	if (theShowLoading)
	{
		mLoading = true;

		mApp->DoDialog(Dialogs::DIALOG_MESSAGE, true, ("Loading..."), (""), (""), Dialog::BUTTONS_NONE);
		mApp->DrawDirtyStuff();
		mApp->PreloadForUser();
		mApp->KillDialog(Dialogs::DIALOG_MESSAGE);

		mLoading = false;
	}

	TodParticleSystem* aTrophyParticle = mApp->ParticleTryToGet(mTrophyParticleID);
	if (aTrophyParticle)
	{
		aTrophyParticle->ParticleSystemDie();
		mTrophyParticleID = ParticleSystemID::PARTICLESYSTEMID_NULL;
	}

	mLevel = 1;
	if (mApp->mPlayerInfo)
		mLevel = mApp->mPlayerInfo->mLevel;
	mShowStartButton = true;
	mMinigamesLocked = true;
	mPuzzleLocked = true;
	mSurvivalLocked = true;
	if (mApp->mPlayerInfo && !mApp->IsIceDemo())
	{
		if (mLevel >= 2)
			mShowStartButton = false;

		if (mApp->HasFinishedAdventure())
		{
			mMinigamesLocked = false;
			mSurvivalLocked = false;
			mPuzzleLocked = false;
			mShowStartButton = false;
		}

		if (mApp->mPlayerInfo->mHasUnlockedMinigames)
			mMinigamesLocked = false;
		if (mApp->mPlayerInfo->mHasUnlockedPuzzleMode)
			mPuzzleLocked = false;
		if (mApp->mPlayerInfo->mHasUnlockedSurvivalMode)
			mSurvivalLocked = false;

		if (mApp->IsTrialStageLocked())
		{
			mPuzzleLocked = true;
			mSurvivalLocked = true;
		}
	}

	if (mApp->HasFinishedAdventure() && !mApp->IsTrialStageLocked())
		mHasTrophy = true;
	else
		mHasTrophy = false;
	if (mHasTrophy && mSelectorState != SelectorAnimState::SELECTOR_OPEN)
		AddTrophySparkle();

	SyncButtons();
	AlmanacInitForPlayer();
	Board::sShownMoreSunTutorial = false;
	ReportAchievement::AchievementInitForPlayer(this); // @Patoke: add call
}

//0x44A650
// GOTY @Patoke: 0x44D700
void GameSelector::Draw(Graphics* g)
{
	if (mApp->GetDialog(Dialogs::DIALOG_STORE) || mApp->GetDialog(Dialogs::DIALOG_ALMANAC))
		return;

    LayoutZombatarPage();
    {
        Graphics background(*g);
        background.Translate(mZombatarScreen->mX, mZombatarScreen->mY);
        // The overlap's wall and grass belong to the animated menu foreground.
        background.ClipRect(int(SELECTOR_LEFT_ART_EXTENSION), 0,
            BOARD_WIDTH - int(SELECTOR_LEFT_ART_EXTENSION), BOARD_HEIGHT);
        if (background.mClipRect.mWidth > 0 && background.mClipRect.mHeight > 0)
            mZombatarScreen->DrawBackground(&background);
    }
    Graphics menu(*g);
    menu.ClipRect(int(SELECTOR_MAIN_PAGE_X - SELECTOR_LEFT_ART_EXTENSION), 0,
        BOARD_WIDTH + int(SELECTOR_LEFT_ART_EXTENSION * 2), BOARD_HEIGHT);
    // DrawAll still visits the visible page's children after this returns.
    // Avoid walking all menu animation tracks when the page is fully offscreen.
    if (menu.mClipRect.mWidth <= 0 || menu.mClipRect.mHeight <= 0)
        return;
    g = &menu;
    Reanimation* aSelectorReanim = mApp->ReanimationGet(mSelectorReanimID);
	// The original 1073 does not paint a black backdrop here. At rest the page
	// artwork fully covers the viewport, so the fill only exposes black through
	// any hole; it was only masking slide ghosting in earlier port builds.
	// Keep the page opaque and let the artwork do the clearing, like the
	// original.
	// {
	// 	GraphicsAutoState aState(g);
	// 	g->SetColor(Color::Black);
	// 	g->FillRect(-mX, -mY, mApp->mWidth, mApp->mHeight);
	// }

	// @Patoke: decided to manually inline these methods as i cannot be arsed to figure out what the name of the 2 functions called in here are
	// GOTY @Patoke: 0x44FD20
	g->mLinearBlend = true;
	g->Translate(800, 0);

	aSelectorReanim->DrawRenderGroup(g, 1);  // "SelectorScreen_BG"
	for (int i = 0; i < 6; i++)
		mApp->ReanimationGet(mCloudReanimID[i])->Draw(g);
	aSelectorReanim->DrawRenderGroup(g, RENDER_GROUP_NORMAL);

	g->Translate(-800, 0);
	if (mSelectorState == SelectorAnimState::SELECTOR_OPEN)
	{
		int aBGIdx = aSelectorReanim->FindTrackIndex(ReanimTrackId::SelectorScreen_BG_Right);
		ReanimatorTransform aTransform;
		aSelectorReanim->GetCurrentTransform(aBGIdx, &aTransform);
		float aFractionalOffsetX = fmod(aTransform.mTransX, 1.0f);
		float aFractionalOffsetY = fmod(aTransform.mTransY, 1.0f);
		g->DrawImageF(
			mOptionsButton->mButtonImage,
			mOptionsButton->mX + mOptionsButton->mButtonOffsetX + aFractionalOffsetX,
			mOptionsButton->mY + mOptionsButton->mButtonOffsetY + aFractionalOffsetY
		);
		g->DrawImageF(
			mQuitButton->mButtonImage,
			mQuitButton->mX + mQuitButton->mButtonOffsetX + aFractionalOffsetX,
			mQuitButton->mY + mQuitButton->mButtonOffsetY + aFractionalOffsetY
		);
		g->DrawImageF(
			mHelpButton->mButtonImage, 
			mHelpButton->mX + mHelpButton->mButtonOffsetX + aFractionalOffsetX, 
			mHelpButton->mY + mHelpButton->mButtonOffsetY + aFractionalOffsetY
		);
	}

	if (mApp->mPlayerInfo && mApp->mPlayerInfo->mName.size() &&
		mSelectorState != SelectorAnimState::SELECTOR_OPEN && mSelectorState != SelectorAnimState::SELECTOR_NEW_USER)
	{
		SexyString aWelcomeStr = mApp->mPlayerInfo->mName + ('!');

		int aSignIdx = aSelectorReanim->FindTrackIndex(ReanimTrackId::woodsign1);
		SexyTransform2D aOverlayMatrix;
		aSelectorReanim->GetAttachmentOverlayMatrix(aSignIdx, aOverlayMatrix);
		float aStringWidth = Sexy::FONT_BRIANNETOD16->StringWidth(aWelcomeStr);
		SexyTransform2D aOffsetMatrix;
		aOffsetMatrix.Translate(
			SELECTOR_MAIN_PAGE_X + 170.5f - (int)(aStringWidth * 0.5f) + mX,
			102.5f + mY);
        SexyTransform2D aWelcomeMatrix = aOverlayMatrix * aOffsetMatrix;
        aWelcomeMatrix.m02 += g->mTransX - mX;
        aWelcomeMatrix.m12 += g->mTransY - mY;
		TodDrawStringMatrix(g, Sexy::FONT_BRIANNETOD16, aWelcomeMatrix, aWelcomeStr, Color(255, 245, 200));

	}

}

//0x44AB50
// GOTY @Patoke: 0x44D750
void GameSelector::DrawOverlay(Graphics* g)
{
    Graphics menu(*g);
    menu.ClipRect(-int(SELECTOR_LEFT_ART_EXTENSION), 0,
        BOARD_WIDTH + int(SELECTOR_LEFT_ART_EXTENSION * 2), BOARD_HEIGHT);
    if (menu.mClipRect.mWidth <= 0 || menu.mClipRect.mHeight <= 0)
        return;
    g = &menu;
	g->mLinearBlend = true;
	if (mApp->mPlayerInfo == nullptr)
		return;

	if (!mApp->IsIceDemo() && !mShowStartButton)
	{
		int aOffsetX, aOffsetY;
		if (mAdventureButton->mIsDown && mAdventureButton->mIsOver)
		{
			aOffsetX = 1;
			aOffsetY = 1;
		}
		else
		{
			aOffsetX = 0;
			aOffsetY = 0;
		}

		Reanimation* aSelectorReanim = mApp->ReanimationGet(mSelectorReanimID);
		int aRightIdx = aSelectorReanim->FindTrackIndex(ReanimTrackId::SelectorScreen_BG_Right);
		ReanimatorTransform aTransform;
		aSelectorReanim->GetCurrentTransform(aRightIdx, &aTransform);
		float aTransAreaX = aTransform.mTransX + aOffsetX;
		float aTransAreaY = aTransform.mTransY + aOffsetY;
		float aTransSubX = aTransAreaX;
		float aTransSubY = aTransAreaY;

		int aStage = ClampInt((mLevel - 1) / 10 + 1, 1, 6);  // 大关
		int aSub = mLevel - (aStage - 1) * 10;  // 小关
		if (mApp->IsTrialStageLocked() && (mLevel >= 25 || mApp->HasFinishedAdventure()))
		{
			aStage = 3;
			aSub = 4;
		}
		else
		{
			if (aStage == 1)
			{
				aTransAreaY += 1.0f;
			}
			else if (aStage == 4)
			{
				aTransAreaX -= 1.0f;
			}
			if (aSub == 3)
			{
				aTransSubX -= 1.0f;
			}
		}

		g->mColorizeImages = true;
		g->mColor = mAdventureButton->mColors[ButtonWidget::COLOR_BKG];
		// @Patoke: changed positions for GOTY adventure icon
		TodDrawImageRectF(g, Sexy::IMAGE_SELECTORSCREEN_LEVELNUMBERS, aTransAreaX + 486.0f, aTransAreaY + 47.f, Rect(aStage * 12, 0, 12, 17));  // 绘制大关数
		if (aSub < 10)
		{
			TodDrawImageRectF(g, Sexy::IMAGE_SELECTORSCREEN_LEVELNUMBERS, aTransSubX + 509.f, aTransSubY + 50.f, Rect(aSub * 12, 0, 12, 17));
		}
		else if (aSub == 10)
		{
			TodDrawImageRectF(g, Sexy::IMAGE_SELECTORSCREEN_LEVELNUMBERS, aTransSubX + 509.f, aTransSubY + 50.f, Rect(12, 0, 12, 17));
			TodDrawImageRectF(g, Sexy::IMAGE_SELECTORSCREEN_LEVELNUMBERS, aTransSubX + 518.f, aTransSubY + 51.f, Rect(0, 0, 12, 17));
		}
		g->mColorizeImages = false;
	}

	if (mZenGardenButton->mVisible && mApp->mZenGarden->PlantsNeedWater())
	{
		g->DrawImage(Sexy::IMAGE_PLANTSPEECHBUBBLE, mZenGardenButton->mX + 106, mZenGardenButton->mY + 36);
		g->DrawImage(Sexy::IMAGE_WATERDROP, mZenGardenButton->mX + 123, mZenGardenButton->mY + 45);
	}

	Reanimation* aHandReanim = mApp->ReanimationTryToGet(mHandReanimID);
	if (aHandReanim)
	{
		g->SetClipRect(0, 0, BOARD_WIDTH, BOARD_HEIGHT - 40);
		aHandReanim->Draw(g);
		g->ClearClipRect();
	}

    // Leaves share the selector overlay's frame, including its page slide.
	Reanimation* aLeafReanim = mApp->ReanimationTryToGet(mLeafReanimID);
	if (aLeafReanim)
	{
		aLeafReanim->Draw(g);
	}
	for (int i = 0; i < 3; i++)
		mApp->ReanimationGet(mFlowerReanimID[i])->Draw(g);

	if (mApp->mBetaValidate)
	{
		g->mFont = Sexy::FONT_BRIANNETOD16;
		g->mColor = Color(200, 200, 200);

		if (gIsPartnerBuild)
			g->DrawString(("PRESS/PARTNER PREVIEW BUILD: DO NOT DISTRIBUTE"), 27, 594);
		else
			g->DrawString(("BETA BUILD: DO NOT DISTRIBUTE"), 27, 594);
	}

	// @Minerscale: Trophy needs to draw in the DrawOverlay
	Reanimation* aSelectorReanim = mApp->ReanimationGet(mSelectorReanimID);

	int aLeftIdx = aSelectorReanim->FindTrackIndex(ReanimTrackId::SelectorScreen_BG_Left);
	ReanimatorTransform aTransformLeft;
	aSelectorReanim->GetCurrentTransform(aLeftIdx, &aTransformLeft);
    aTransformLeft.mTransX += SELECTOR_LEFT_ART_EXTENSION;
	if (mHasTrophy)
	{
		// @Patoke: updated pos to match GOTY
		if (mApp->EarnedGoldTrophy())
			TodDrawImageRectF(g, Sexy::IMAGE_SUNFLOWER_TROPHY, aTransformLeft.mTransX + 12.f, aTransformLeft.mTransY + 345.f, Rect(157, 0, 157, 269));
		else
			TodDrawImageRectF(g, Sexy::IMAGE_SUNFLOWER_TROPHY, aTransformLeft.mTransX + 12.f, aTransformLeft.mTransY + 345.f, Rect(0, 0, 157, 269));
		
		TodParticleSystem* aTrophyParticle = mApp->ParticleTryToGet(mTrophyParticleID);
		if (aTrophyParticle)
			aTrophyParticle->Draw(g);
	}

	mToolTip->Draw(g);
}

//0x44B0D0
// GOTY @Patoke: 0x44DE6D
void GameSelector::UpdateTooltip()
{
	if (!mApp->HasFinishedAdventure() || mApp->GetDialog(Dialogs::DIALOG_MESSAGE))
		return;

	if (mHasTrophy)
	{
		int aMouseX = mApp->mWidgetManager->mLastMouseX;
		int aMouseY = mApp->mWidgetManager->mLastMouseY;
		if (aMouseX >= 50 && aMouseX < 135 && aMouseY >= 250 && aMouseY < 475)
		{
			if (mApp->EarnedGoldTrophy())
			{
				mToolTip->SetLabel(LawnApp::Pluralize(mApp->mPlayerInfo->mFinishedAdventure, gStr.GOLD_SUNFLOWER_TOOLTIP.c_str(), gStr.GOLD_SUNFLOWER_TOOLTIP_PLURAL.c_str()));
				mToolTip->mX = 32;
				mToolTip->mY = 510;
				mToolTip->mVisible = true;
			}
			else
			{
				mToolTip->SetLabel(gStr.SILVER_SUNFLOWER_TOOLTIP);
				mToolTip->mX = 20;
				mToolTip->mY = 495;
				mToolTip->mVisible = true;
			}

			return;
		}
	}

	mToolTip->mVisible = false;
	mToolTip->Update();
}

//0x44B2A0
// GOTY @Patoke: 0x44E030
void GameSelector::Update()
{
	Widget::Update();
	MarkDirty();
	UpdateTooltip();

	if (mSlideCounter > 0) {
		int aNewX = TodAnimateCurve(75, 0, mSlideCounter, mStartX, mDestX, Curves::EaseInOut);
		int aNewY = TodAnimateCurve(75, 0, mSlideCounter, mStartY, mDestY, Curves::EaseInOut);
		Move(aNewX, aNewY);

		mSlideCounter--;
        if (mSlideCounter <= 0) {
            Move(mDestX, mDestY);
            mZombatarPanning = false;
        }
	}
    LayoutZombatarPage();

	mApp->mZenGarden->UpdatePlantNeeds();

	TodParticleSystem* aParticle = mApp->ParticleTryToGet(mTrophyParticleID);
	if (aParticle)
		aParticle->Update();

	if (mStartingGame && !mWaitingDialog)
	{
		mStartingGameCounter++;
		if (mStartingGameCounter > 450)
		{
			SelectorModalSession aTransition(*this);
			mApp->KillGameSelector();

			if (mApp->IsIceDemo())
			{
				mApp->PreNewGame(GameMode::GAMEMODE_LIMBO_ICE, false);
				return;
			}
			if (mApp->IsFirstTimeAdventureMode() && mLevel == 1 && !mApp->SaveFileExists())
			{
				mApp->PreNewGame(GameMode::GAMEMODE_INTRO, false);
				return;
			}
			if (mApp->mPlayerInfo->mNeedsMagicTacoReward && mLevel == 35)
			{
				StoreScreen* aStore = mApp->ShowStoreScreen();
				aStore->SetupForIntro(601);
				const int aResult = WaitForSelectorDialog(aStore);
				if (aTransition.IsRetiredTransition())
				{
					if (aResult == Dialog::ID_YES)
						mApp->PreNewGame(GameMode::GAMEMODE_ADVENTURE, false);
					else
						mApp->ShowGameSelector();
				}
				return;
			}
			if (ShouldDoZenTuturialBeforeAdventure())
			{
				mApp->PreNewGame(GameMode::GAMEMODE_LIMBO_ZEN_GARDEN, false);
				mApp->mZenGarden->SetupForZenTutorial();
				return;
			}
			mApp->PreNewGame(GameMode::GAMEMODE_ADVENTURE, true);
			return;
		}

		mAdventureButton->SetColor(ButtonWidget::COLOR_BKG, mStartingGameCounter % 20 < 10 ? Color(80, 80, 80) : Color::White);
		if (mStartingGameCounter == 125)
			mApp->PlaySample(Sexy::SOUND_EVILLAUGH);
	}

	Reanimation* aSelectorReanim = mApp->ReanimationGet(mSelectorReanimID);
	switch (mSelectorState)
	{
	case SelectorAnimState::SELECTOR_OPEN:
		if (mWidgetManager)
			mWidgetManager->RehupMouse();
		if (aSelectorReanim->mLoopCount > 0)
		{
			aSelectorReanim->AssignRenderGroupToTrack(ReanimTrackId::SelectorScreen_Adventure_button, RENDER_GROUP_HIDDEN);
			aSelectorReanim->AssignRenderGroupToTrack(ReanimTrackId::SelectorScreen_StartAdventure_button, RENDER_GROUP_HIDDEN);
			aSelectorReanim->AssignRenderGroupToTrack(ReanimTrackId::SelectorScreen_Survival_button, RENDER_GROUP_HIDDEN);
			aSelectorReanim->AssignRenderGroupToTrack(ReanimTrackId::SelectorScreen_Challenges_button, RENDER_GROUP_HIDDEN);
			aSelectorReanim->AssignRenderGroupToTrack(ReanimTrackId::SelectorScreen_ZenGarden_button, RENDER_GROUP_HIDDEN);
			mAdventureButton->mBtnNoDraw = false;
			mMinigameButton->mBtnNoDraw = false;
			mPuzzleButton->mBtnNoDraw = false;
			mSurvivalButton->mBtnNoDraw = false;
			mZenGardenButton->mBtnNoDraw = false;
			mHelpButton->mBtnNoDraw = false;
			mOptionsButton->mBtnNoDraw = false;
			mQuitButton->mBtnNoDraw = false;
			mZombatarButton->mBtnNoDraw = false; // @Patoke: new widgets
			mAchievementsButton->mBtnNoDraw = false;
			mAdventureButton->mMouseVisible = true;
			mMinigameButton->mMouseVisible = true;
			mPuzzleButton->mMouseVisible = true;
			mSurvivalButton->mMouseVisible = true;
			mZenGardenButton->mMouseVisible = true;
			mHelpButton->mMouseVisible = true;
			mOptionsButton->mMouseVisible = true;
			mQuitButton->mMouseVisible = true;
			mStoreButton->mMouseVisible = true;
			mAlmanacButton->mMouseVisible = true;
			mChangeUserButton->mMouseVisible = true;
			mZombatarButton->mMouseVisible = true; // @Patoke: new widgets
			mAchievementsButton->mMouseVisible = true;

			if (mApp->mPlayerInfo == nullptr)
			{
				mApp->DoCreateUserDialog();
				if (gIsPartnerBuild)
					AddPreviewProfiles();

				mSelectorState = SelectorAnimState::SELECTOR_NEW_USER;
			}
			else
			{
				aSelectorReanim->PlayReanim(ReanimTrackId::anim_sign, ReanimLoopType::REANIM_PLAY_ONCE_AND_HOLD, 0, 30.0f);
				mSelectorState = SelectorAnimState::SELECTOR_IDLE;
			}

			if (mHasTrophy)
				AddTrophySparkle();

			if (mApp->mPlayerInfo && mApp->mPlayerInfo->mNeedsMessageOnGameSelector && !mWaitingDialog)
			{
				SelectorModalSession aSession(*this);
				mApp->mPlayerInfo->mNeedsMessageOnGameSelector = 0;
				mApp->WriteCurrentUserConfig();
				SelectorMessageBox(
					Dialogs::DIALOG_MESSAGE, 
					gStr.ADVENTURE_COMPLETE_HEADER.c_str(), 
					gStr.ADVENTURE_COMPLETE_BODY.c_str(), 
					gStr.DIALOG_BUTTON_OK.c_str(), 
					(""), 
					Dialog::BUTTONS_FOOTER
				);
				if (!aSession.IsCurrent())
					return;
			}
		}
		break;
	case SelectorAnimState::SELECTOR_NEW_USER:
		if (mApp->GetDialog(Dialogs::DIALOG_CREATEUSER) == nullptr)
		{
			aSelectorReanim->PlayReanim(ReanimTrackId::anim_sign, ReanimLoopType::REANIM_PLAY_ONCE_AND_HOLD, 0, 30.0f);
			mSelectorState = SelectorAnimState::SELECTOR_SHOW_SIGN;
		}
		break;
	case SelectorAnimState::SELECTOR_SHOW_SIGN:
		if (aSelectorReanim->mLoopCount > 0)
			mSelectorState = SelectorAnimState::SELECTOR_IDLE;
		break;
	case SelectorAnimState::SELECTOR_IDLE:
		break;
	}

	for (int i = 0; i < 6; i++)
	{
		Reanimation* aCloudReanim = mApp->ReanimationGet(mCloudReanimID[i]);
		if (mCloudCounter[i] > 0)
		{
			if (--mCloudCounter[i] == 0)
			{
				aCloudReanim->mLoopCount = 0;
				aCloudReanim->mAnimTime = 0.0f;
				aCloudReanim->mAnimRate = 0.5f;
			}
		}
		else if (aCloudReanim->mLoopCount > 0)
			mCloudCounter[i] = RandRangeInt(2000, 4000);
	}
	aSelectorReanim->Update();

	Reanimation* aLeafReanim = mApp->ReanimationGet(mLeafReanimID);
	aLeafReanim->Update();
	int aLeafTrackIndex = aSelectorReanim->FindTrackIndex(ReanimTrackId::SelectorScreen_BG_Right);
	ReanimatorTransform aLeafTransform;
	aSelectorReanim->GetCurrentTransform(aLeafTrackIndex, &aLeafTransform);
	aLeafReanim->mOverlayMatrix.m02 = aLeafTransform.mTransX - 71.0f;
	aLeafReanim->mOverlayMatrix.m12 = aLeafTransform.mTransY - 41.0f;
	if (--mLeafCounter == 0)
	{
		float aRate = RandRangeFloat(3.0f, 12.0f);
		aLeafReanim->PlayReanim(ReanimTrackId::anim_grass, ReanimLoopType::REANIM_LOOP, 20, aRate);
		mLeafCounter = RandRangeInt(200, 400);
	}

	for (int i = 0; i < 6; i++)
		mApp->ReanimationGet(mCloudReanimID[i])->Update();
	Reanimation* aHandReanim = mApp->ReanimationTryToGet(mHandReanimID);
	if (aHandReanim)
		aHandReanim->Update();

	TrackButton(mAdventureButton, mShowStartButton ? ReanimTrackId::SelectorScreen_StartAdventure_button : ReanimTrackId::SelectorScreen_Adventure_button, SELECTOR_MAIN_PAGE_X, 0.0f);
	TrackButton(mMinigameButton, ReanimTrackId::SelectorScreen_Survival_button, SELECTOR_MAIN_PAGE_X, 0.0f);
	TrackButton(mPuzzleButton, ReanimTrackId::SelectorScreen_Challenges_button, SELECTOR_MAIN_PAGE_X, 0.0f);
	TrackButton(mSurvivalButton, ReanimTrackId::SelectorScreen_ZenGarden_button, SELECTOR_MAIN_PAGE_X, 0.0f);
	TrackButton(mZenGardenButton, ReanimTrackId::SelectorScreen_BG_Right, SELECTOR_MAIN_PAGE_X + 100.0f, 360.0f);
	TrackButton(mOptionsButton, ReanimTrackId::SelectorScreen_BG_Right, SELECTOR_MAIN_PAGE_X + 494.0f, 434.0f);
	TrackButton(mQuitButton, ReanimTrackId::SelectorScreen_BG_Right, SELECTOR_MAIN_PAGE_X + 644.0f, 469.0f);
	TrackButton(mHelpButton, ReanimTrackId::SelectorScreen_BG_Right, SELECTOR_MAIN_PAGE_X + 576.0f, 458.0f);
	TrackButton(mAlmanacButton, ReanimTrackId::SelectorScreen_BG_Right, SELECTOR_MAIN_PAGE_X + 256.0f, 387.0f);
	TrackButton(mStoreButton, ReanimTrackId::SelectorScreen_BG_Right, SELECTOR_MAIN_PAGE_X + 334.0f, 441.0f);
	TrackButton(mChangeUserButton, ReanimTrackId::woodsign2, SELECTOR_MAIN_PAGE_X + 24.0f, 10.0f);
	TrackButton(mZombatarButton, ReanimTrackId::woodsign3, SELECTOR_MAIN_PAGE_X, 0.0f); // @Patoke: add shart here
	TrackButton(mAchievementsButton, ReanimTrackId::SelectorScreen_BG_Left,
        SELECTOR_MAIN_PAGE_X + SELECTOR_LEFT_ART_EXTENSION + 20.0f, 480.0f);
	aSelectorReanim->SetVariantOption(ReanimTrackId::woodsign2, (mChangeUserButton->mIsOver || mChangeUserButton->mIsDown)
		? ReanimOptions::SelectorScreen::woodsign2::SELECTORSCREEN_WOODSIGN2_PRESS : 0);
	aSelectorReanim->SetVariantOption(ReanimTrackId::woodsign3, (mZombatarButton->mIsOver || mZombatarButton->mIsDown)
		? ReanimOptions::SelectorScreen::woodsign3::SELECTORSCREEN_WOODSIGN3_PRESS : 0);
}

//0x44BB20
// GOTY @Patoke: 0x44EA40
void GameSelector::TrackButton(DialogButton* theButton, ReanimTrackId theTrackId, float theOffsetX, float theOffsetY)
{
	Reanimation* aSelectorReanim = mApp->ReanimationGet(mSelectorReanimID);
	int aTrackIndex = aSelectorReanim->FindTrackIndex(theTrackId);
	ReanimatorTransform aTransform;
	aSelectorReanim->GetCurrentTransform(aTrackIndex, &aTransform);
	
	theButton->mX = (int)(aTransform.mTransX + theOffsetX);
	theButton->mY = (int)(aTransform.mTransY + theOffsetY);
}

//0x44BBC0
void GameSelector::AddedToManager(WidgetManager* theWidgetManager)
{
	Widget::AddedToManager(theWidgetManager);
	Move(-800, 0);
}

//0x44BCA0
void GameSelector::RemovedFromManager(WidgetManager* theWidgetManager)
{
    if (mWaitingDialog)
    {
        // WidgetRemovedHelper has already removed this selector from the
        // modal focus stack. Do not let LawnApp's ordinary last-dialog
        // fallback focus the selector again halfway through its removal.
        mWaitingDialog->mRestoreFocusFromModalStack = true;
        mApp->SexyAppBase::KillDialog(mWaitingDialog);
    }
	Widget::RemovedFromManager(theWidgetManager);
}

//0x44BD80
void GameSelector::OrderInManagerChanged()
{
}

//0x44BE60
// GOTY @Patoke: 0x44EB11
void GameSelector::KeyDown(KeyCode theKey)
{
	if (mApp->mKonamiCheck->Check(theKey))
	{
		mApp->PlayFoley(FoleyType::FOLEY_DROP);
		return;
	}
	if (mApp->mMustacheCheck->Check(theKey) || mApp->mMoustacheCheck->Check(theKey))
	{
		mApp->PlayFoley(FoleyType::FOLEY_POLEVAULT);
		mApp->mMustacheMode = !mApp->mMustacheMode;
		ReportAchievement::GiveAchievement(mApp, MustacheMode, false);
		return;
	}
	if (mApp->mSuperMowerCheck->Check(theKey) || mApp->mSuperMowerCheck2->Check(theKey))
	{
		mApp->PlayFoley(FoleyType::FOLEY_ZAMBONI);
		mApp->mSuperMowerMode = !mApp->mSuperMowerMode;
		return;
	}
	if (mApp->mFutureCheck->Check(theKey))
	{
		mApp->PlaySample(Sexy::SOUND_BOING);
		mApp->mFutureMode = !mApp->mFutureMode;
		return;
	}
	if (mApp->mPinataCheck->Check(theKey))
	{
		if (mApp->CanDoPinataMode())
		{
			mApp->PlayFoley(FoleyType::FOLEY_JUICY);
			mApp->mPinataMode = !mApp->mPinataMode;
			return;
		}
		else
		{
			mApp->PlaySample(Sexy::SOUND_BUZZER);
			return;
		}
	}
	if (mApp->mDanceCheck->Check(theKey))
	{
		if (mApp->CanDoDanceMode())
		{
			mApp->PlayFoley(FoleyType::FOLEY_DANCER);
			mApp->mDanceMode = !mApp->mDanceMode;
			return;
		}
		else
		{
			mApp->PlaySample(Sexy::SOUND_BUZZER);
			return;
		}
	}
	if (mApp->mDaisyCheck->Check(theKey))
	{
		if (mApp->CanDoDaisyMode())
		{
			mApp->PlaySample(Sexy::SOUND_LOADINGBAR_FLOWER);
			mApp->mDaisyMode = !mApp->mDaisyMode;
			return;
		}
		else
		{
			mApp->PlaySample(Sexy::SOUND_BUZZER);
			return;
		}
	}
	if (mApp->mSukhbirCheck->Check(theKey))
	{
		mApp->PlaySample(Sexy::SOUND_SUKHBIR);
		mApp->mSukhbirMode = !mApp->mSukhbirMode;
		return;
	}
}

//0x44C200
// GOTY @Patoke: 0x44EEE0
void GameSelector::KeyChar(char theChar)
{
	if (mStartingGame)
		return;

	if ((gIsPartnerBuild || mApp->mDebugKeysEnabled) && theChar == 'u' && mApp->mPlayerInfo)
	{
		TodTraceAndLog(("Selector cheat key '%c'"), theChar);

		mApp->mPlayerInfo->mFinishedAdventure = 2;
		mApp->mPlayerInfo->AddCoins(50000);
		mApp->mPlayerInfo->mHasUsedCheatKeys = true;
		mApp->mPlayerInfo->mHasUnlockedMinigames = true;
		mApp->mPlayerInfo->mHasUnlockedPuzzleMode = true;
		mApp->mPlayerInfo->mHasUnlockedSurvivalMode = true;

		// 1073 原式 records[i-1]=20（i=1..100）在 v1 下=槽位 mode-1 全刷；v13
		// 直下标后槽位=枚举值本身，且死槽（>TREE 的 73..99）必须保持零——
		// 严格转换器会拒非零死槽。范围收至真实模式并按直下标写。
		for (int i = 1; i <= (int)GameMode::GAMEMODE_TREE_OF_WISDOM; i++)
			if (i != (int)GameMode::GAMEMODE_TREE_OF_WISDOM && i != (int)GameMode::GAMEMODE_SCARY_POTTER_ENDLESS &&
				i != (int)GameMode::GAMEMODE_PUZZLE_I_ZOMBIE_ENDLESS && i != (int)GameMode::GAMEMODE_SURVIVAL_ENDLESS_STAGE_3)
				mApp->mPlayerInfo->mChallengeRecords[i] = 20;
		SyncProfile(true);

		mApp->EraseFile(GetSavedGameName(GameMode::GAMEMODE_ADVENTURE, mApp->mPlayerInfo->mId));
	}

	if (mApp->mDebugKeysEnabled)
	{
		TodTraceAndLog(("Selector cheat key '%c'"), theChar);
		if (theChar == 'c' || theChar == 'C')
		{
			mMinigamesLocked = false;
			mPuzzleLocked = false;
			mSurvivalLocked = false;
			SyncButtons();
		}
	}
}

//0x44C360
// GOTY @Patoke: 0x44F040
void GameSelector::MouseDown(int x, int y, int theClickCount)
{
	(void)theClickCount;
	for (int i = 0; i < 3; i++)
	{
		Reanimation* aFlowerReanim = mApp->ReanimationGet(mFlowerReanimID[i]);
		if (aFlowerReanim->mAnimRate <= 0.0f && Distance2D(x, y, gFlowerCenter[i][0], gFlowerCenter[i][1]) < 20.0f)
		{
			aFlowerReanim->mAnimRate = 24.0f;
			mApp->PlayFoley(FoleyType::FOLEY_LIMBS_POP);
		}
	}

	if (mApp->mTodCheatKeys && mStartingGame && mStartingGameCounter < 450)
		mStartingGameCounter = 450;
}

//0x44C4C0
// GOTY @Patoke: 0x44F1A0
void GameSelector::ButtonMouseEnter(int theId)
{
	if ((theId == GameSelector::GameSelector_Minigame && mMinigamesLocked) ||
		(theId == GameSelector::GameSelector_Puzzle && mPuzzleLocked) ||
		(theId == GameSelector::GameSelector_Survival && mSurvivalLocked))
		return;

	mApp->PlayFoley(FoleyType::FOLEY_BLEEP);
}

//0x44C540
// GOTY @Patoke: 0x44F220
void GameSelector::ButtonPress(int theId)
{
	if (theId == GameSelector::GameSelector_Adventure || theId == GameSelector::GameSelector_Minigame ||
		theId == GameSelector::GameSelector_Puzzle || theId == GameSelector::GameSelector_Survival ||
		theId == GameSelector::GameSelector_Zombatar) // @Patoke: add case
		mApp->PlaySample(Sexy::SOUND_GRAVEBUTTON);
	else
		mApp->PlaySample(Sexy::SOUND_TAP);
}

//0x44C590
// GOTY @Patoke: 0x44F270
void GameSelector::ClickedAdventure()
{
    if (mWaitingDialog)
        return;
    SelectorModalSession aSession(*this);
    if (!aSession.IsCurrent())
        return;
	if (mApp->IsTrialStageLocked() && (mLevel >= 25 || mApp->HasFinishedAdventure()))
	{
		if (SelectorMessageBox(
			Dialogs::DIALOG_MESSAGE,
			gStr.REPLAY_LEVEL_HEADER.c_str(),
			gStr.REPLAY_LEVEL_BODY.c_str(),
			gStr.DIALOG_BUTTON_YES.c_str(),
			gStr.DIALOG_BUTTON_NO.c_str(),
			Dialog::BUTTONS_YES_NO) != Dialog::ID_YES || !aSession.IsCurrent())
			return;

		mApp->mPlayerInfo->mLevel = 24;
		mApp->mPlayerInfo->mFinishedAdventure = 0;
		mApp->EraseFile(GetSavedGameName(GameMode::GAMEMODE_ADVENTURE, mApp->mPlayerInfo->mId));
	}

	mApp->mMusic->StopAllMusic();
	mApp->PlaySample(Sexy::SOUND_LOSEMUSIC);
	mStartingGame = true;
	mAdventureButton->SetDisabled(true);
	mMinigameButton->SetDisabled(true);
	mPuzzleButton->SetDisabled(true);
	mOptionsButton->SetDisabled(true);
	mQuitButton->SetDisabled(true);
	mHelpButton->SetDisabled(true);
	mChangeUserButton->SetDisabled(true);
	mStoreButton->SetDisabled(true);
	mAlmanacButton->SetDisabled(true);
	mSurvivalButton->SetDisabled(true);
	mZenGardenButton->SetDisabled(true);
	mZombatarButton->SetDisabled(true); // @Patoke: added new widgets
	mAchievementsButton->SetDisabled(true);

	Reanimation* aHandReanim = mApp->AddReanimation(-70.0f, 10.0f, 0, ReanimationType::REANIM_ZOMBIE_HAND);
	aHandReanim->mLoopType = ReanimLoopType::REANIM_PLAY_ONCE_AND_HOLD;
	mHandReanimID = mApp->ReanimationGetID(aHandReanim);
	mApp->PlayFoley(FoleyType::FOLEY_DIRT_RISE);
	for (int i = 0; i < aHandReanim->mDefinition->mTracks.count; i++)
		if (ReanimTrackRanges::rock.Contains(aHandReanim->GetTrackId(i)))
			aHandReanim->mTrackInstances[i].mIgnoreClipRect = true;
}

//0x44C890
// GOTY @Patoke: 0x44F590
bool GameSelector::ShouldDoZenTuturialBeforeAdventure()
{
	return !mApp->HasFinishedAdventure() && mApp->mPlayerInfo->mLevel == 45 && mApp->mPlayerInfo->mNumPottedPlants == 0;
}

//0x44C8C0
// GOTY @Patoke: 0x44F5C0
void GameSelector::ButtonDepress(int theId)
{
    // 1073 0044F5C3: ButtonListener's this is selector+0xA0; +0xB4
    // is mSlideCounter(+0x154). SlideTo itself remains retargetable.
    if (mSlideCounter != 0 || mWaitingDialog)
        return;
    SelectorModalSession aSession(*this);
    if (!aSession.IsCurrent())
        return;
	if (theId == GameSelector::GameSelector_Minigame && mMinigamesLocked)
	{
		SelectorMessageBox(Dialogs::DIALOG_MESSAGE, gStr.MODE_LOCKED.c_str(), gStr.MINIGAME_LOCKED_MESSAGE.c_str(), gStr.DIALOG_BUTTON_OK.c_str(), (""), Dialog::BUTTONS_FOOTER);
		return;
	}
	if (theId == GameSelector::GameSelector_Puzzle && mPuzzleLocked)
	{
		SelectorMessageBox(Dialogs::DIALOG_MESSAGE, gStr.MODE_LOCKED.c_str(), gStr.PUZZLE_LOCKED_MESSAGE.c_str(), gStr.DIALOG_BUTTON_OK.c_str(), (""), Dialog::BUTTONS_FOOTER);
		return;
	}
	if (theId == GameSelector::GameSelector_Survival && mSurvivalLocked)
	{
		SelectorMessageBox(Dialogs::DIALOG_MESSAGE, gStr.MODE_LOCKED.c_str(), gStr.SURVIVAL_LOCKED_MESSAGE.c_str(), gStr.DIALOG_BUTTON_OK.c_str(), (""), Dialog::BUTTONS_FOOTER);
		return;
	}

	// C 形态 -> 成员函数内 lambda 表（表在类作用域内→lambda 可访问 private 方法；
	// aSession 经引用传入，early return 经标志回传——Store/Almanac 用）
	// 行序 = 按钮枚举**数值序**（100..113 平移 100），每行锚注释即该槽的枚举名。
	// 事故教训（2026-10-03 B 树实测抓获）：初版按原 switch 的**文本 case 序**
	// 排槽，而 Survival 文本位第 4、数值位 110，中间 7 槽整体错位——点生存进
	// 花园、点商店进账户。id 键控表必须按枚举数值序排槽 + 逐行枚举锚注释。
	{
		constexpr int kFirst = GameSelector::GameSelector_Adventure;
		constexpr int kCount = GameSelector::GameSelector_Achievements - kFirst + 1;
		static_assert(GameSelector::GameSelector_Options - kFirst == 3 &&
			GameSelector::GameSelector_Survival - kFirst == 10 &&
			GameSelector::GameSelector_Achievements - kFirst == 13,
			"按钮枚举数值序与表槽注释一致性锚");
		static constexpr void (*kCases[kCount])(GameSelector&, SelectorModalSession&, bool&) = {
		    /* [100] GameSelector_Adventure */
		    [](GameSelector& g, SelectorModalSession&, bool&) { g.ClickedAdventure(); },
		    /* [101] GameSelector_Minigame */
		    [](GameSelector& g, SelectorModalSession&, bool&) { g.mApp->KillGameSelector(); g.mApp->ShowChallengeScreen(ChallengePage::CHALLENGE_PAGE_CHALLENGE); },
		    /* [102] GameSelector_Puzzle */
		    [](GameSelector& g, SelectorModalSession&, bool&) { g.mApp->KillGameSelector(); g.mApp->ShowChallengeScreen(ChallengePage::CHALLENGE_PAGE_PUZZLE); },
		    /* [103] GameSelector_Options */
		    [](GameSelector& g, SelectorModalSession&, bool&) { g.mApp->DoNewOptions(true); },
		    /* [104] GameSelector_Help */
		    [](GameSelector& g, SelectorModalSession&, bool&) { g.mApp->KillGameSelector(); g.mApp->ShowAwardScreen(AwardType::AWARD_HELP_ZOMBIENOTE, false); },
		    /* [105] GameSelector_Quit */
		    [](GameSelector& g, SelectorModalSession&, bool&) { g.mApp->ConfirmQuit(); },
		    /* [106] GameSelector_ChangeUser */
		    [](GameSelector& g, SelectorModalSession&, bool&) { g.mApp->DoUserDialog(); },
		    /* [107] GameSelector_Store */
		    [](GameSelector& g, SelectorModalSession& s, bool& early) {
		        StoreScreen* aStore = g.mApp->ShowStoreScreen();
		        WidgetLifetimeHold aStoreLifetime(*aStore);
		        const int aResult = g.WaitForSelectorDialog(aStore);
		        if (!s.IsCurrent()) { early = true; return; }
		        if (aResult == Dialog::ID_YES && aStore->mGoToTreeNow)
		        {
		            g.mApp->KillGameSelector();
		            g.mApp->PreNewGame(GameMode::GAMEMODE_TREE_OF_WISDOM, false);
		        }
		        else
		            g.mApp->mMusic->MakeSureMusicIsPlaying(MusicTune::MUSIC_TUNE_TITLE_CRAZY_DAVE_MAIN_THEME);
		    },
		    /* [108] GameSelector_Almanac */
		    [](GameSelector& g, SelectorModalSession& s, bool& early) {
		        g.WaitForSelectorDialog(g.mApp->DoAlmanacDialog());
		        if (!s.IsCurrent()) { early = true; return; }
		        g.mApp->mMusic->MakeSureMusicIsPlaying(MusicTune::MUSIC_TUNE_TITLE_CRAZY_DAVE_MAIN_THEME);
		    },
		    /* [109] GameSelector_ZenGarden */
		    [](GameSelector& g, SelectorModalSession&, bool&) {
		        g.mApp->KillGameSelector();
		        g.mApp->PreNewGame(GameMode::GAMEMODE_LIMBO_ZEN_GARDEN, false);
		        if (g.ShouldDoZenTuturialBeforeAdventure())
		            g.mApp->mZenGarden->SetupForZenTutorial();
		    },
		    /* [110] GameSelector_Survival */
		    [](GameSelector& g, SelectorModalSession&, bool&) { g.mApp->KillGameSelector(); g.mApp->ShowChallengeScreen(ChallengePage::CHALLENGE_PAGE_SURVIVAL); },
		    /* [111] GameSelector_Zombatar */
		    [](GameSelector& g, SelectorModalSession&, bool&) { g.ShowZombatarScreen(); },
		    /* [112] GameSelector_AchievementsBack */
		    [](GameSelector& g, SelectorModalSession&, bool&) { g.SlideTo(-(int)SELECTOR_MAIN_PAGE_X, 0); },
		    /* [113] GameSelector_Achievements */
		    [](GameSelector& g, SelectorModalSession&, bool&) { g.ShowAchievementsWidget(); },
		};
		bool anEarlyReturn = false;
		const unsigned aCaseIndex = static_cast<unsigned>(theId - kFirst);
		if (aCaseIndex < kCount)
		{
			kCases[aCaseIndex](*this, aSession, anEarlyReturn);
		}
		if (anEarlyReturn)
			return;
	}
}

//0x44CB00
// GOTY @Patoke: 0x44F880
void GameSelector::AddPreviewProfiles()
{
	PlayerInfo* aProfile;

	aProfile = mApp->mProfileMgr->AddProfile(("2 Night"));
	if (aProfile)
	{
		aProfile->mLevel = 11;
		aProfile->SaveDetails();
	}

	aProfile = mApp->mProfileMgr->AddProfile(("3 Pool"));
	if (aProfile)
	{
		aProfile->mLevel = 21;
		aProfile->mHasUnlockedMinigames = 1;
		aProfile->mCoins = 400;
		aProfile->mPurchases[StoreItem::STORE_ITEM_PACKET_UPGRADE] = 1;
		aProfile->SaveDetails();
	}

	aProfile = mApp->mProfileMgr->AddProfile(("4 Fog"));
	if (aProfile)
	{
		aProfile->mLevel = 31;
		aProfile->mHasUnlockedMinigames = 1;
		aProfile->mHasUnlockedSurvivalMode = 1;
		aProfile->mPurchases[StoreItem::STORE_ITEM_PACKET_UPGRADE] = 2;
		aProfile->mPurchases[StoreItem::STORE_ITEM_POOL_CLEANER] = 1;
		aProfile->mCoins = 400;
		aProfile->SaveDetails();
	}

	aProfile = mApp->mProfileMgr->AddProfile(("5 Roof"));
	if (aProfile)
	{
		aProfile->mLevel = 41;
		aProfile->mHasUnlockedMinigames = 1;
		aProfile->mHasUnlockedPuzzleMode = 1;
		aProfile->mHasUnlockedSurvivalMode = 1;
		aProfile->mPurchases[StoreItem::STORE_ITEM_PACKET_UPGRADE] = 2;
		aProfile->mPurchases[StoreItem::STORE_ITEM_POOL_CLEANER] = 1;
		aProfile->mCoins = 500;
		aProfile->SaveDetails();
	}

	aProfile = mApp->mProfileMgr->AddProfile(("Complete"));
	if (aProfile)
	{
		aProfile->mLevel = 1;
		aProfile->mFinishedAdventure = 1;
		aProfile->mHasUnlockedMinigames = 1;
		aProfile->mHasUnlockedPuzzleMode = 1;
		aProfile->mHasUnlockedSurvivalMode = 1;
		aProfile->mPurchases[StoreItem::STORE_ITEM_PACKET_UPGRADE] = 2;
		aProfile->mPurchases[StoreItem::STORE_ITEM_POOL_CLEANER] = 1;
		aProfile->mPurchases[StoreItem::STORE_ITEM_ROOF_CLEANER] = 1;
		aProfile->mCoins = 1000;
		aProfile->SaveDetails();
	}

	aProfile = mApp->mProfileMgr->AddProfile(("Full Unlock"));
	if (aProfile)
	{
		aProfile->mLevel = 1;
		aProfile->mFinishedAdventure = 2;
		aProfile->AddCoins(50000);
		aProfile->mPurchases[StoreItem::STORE_ITEM_FERTILIZER] = PURCHASE_COUNT_OFFSET + 5;
		aProfile->mPurchases[StoreItem::STORE_ITEM_BUG_SPRAY] = PURCHASE_COUNT_OFFSET + 5;
		aProfile->mPurchases[StoreItem::STORE_ITEM_CHOCOLATE] = PURCHASE_COUNT_OFFSET + 5;
		aProfile->mPurchases[StoreItem::STORE_ITEM_TREE_FOOD] = PURCHASE_COUNT_OFFSET + 5;
		aProfile->mHasUnlockedMinigames = 1;
		aProfile->mHasUnlockedPuzzleMode = 1;
		aProfile->mPurchases[StoreItem::STORE_ITEM_PLANT_GATLINGPEA] = 1;
		aProfile->mPurchases[StoreItem::STORE_ITEM_PLANT_TWINSUNFLOWER] = 1;
		aProfile->mPurchases[StoreItem::STORE_ITEM_PLANT_GLOOMSHROOM] = 1;
		aProfile->mPurchases[StoreItem::STORE_ITEM_PLANT_CATTAIL] = 1;
		aProfile->mPurchases[StoreItem::STORE_ITEM_PLANT_WINTERMELON] = 1;
		aProfile->mPurchases[StoreItem::STORE_ITEM_PLANT_GOLD_MAGNET] = 1;
		aProfile->mPurchases[StoreItem::STORE_ITEM_PLANT_SPIKEROCK] = 1;
		aProfile->mPurchases[StoreItem::STORE_ITEM_PLANT_COBCANNON] = 1;
		aProfile->mPurchases[StoreItem::STORE_ITEM_PLANT_IMITATER] = 1;
		aProfile->mPurchases[StoreItem::STORE_ITEM_PACKET_UPGRADE] = 3;
		aProfile->mPurchases[StoreItem::STORE_ITEM_POOL_CLEANER] = 1;
		aProfile->mPurchases[StoreItem::STORE_ITEM_ROOF_CLEANER] = 1;
		aProfile->mPurchases[StoreItem::STORE_ITEM_PHONOGRAPH] = 1;
		aProfile->mPurchases[StoreItem::STORE_ITEM_GARDENING_GLOVE] = 1;
		aProfile->mPurchases[StoreItem::STORE_ITEM_MUSHROOM_GARDEN] = 1;
		aProfile->mPurchases[StoreItem::STORE_ITEM_WHEEL_BARROW] = 1;
		aProfile->mPurchases[StoreItem::STORE_ITEM_AQUARIUM_GARDEN] = 1;
		aProfile->mPurchases[StoreItem::STORE_ITEM_TREE_OF_WISDOM] = 1;

		aProfile->mChallengeRecords[(int)GameMode::GAMEMODE_TREE_OF_WISDOM] = 1;
		// 同上（'u' 作弊键）：v13 直下标 + 真实模式范围，死槽保持零。
		for (int i = 1; i <= (int)GameMode::GAMEMODE_TREE_OF_WISDOM; i++)
			if (i != (int)GameMode::GAMEMODE_TREE_OF_WISDOM && i != (int)GameMode::GAMEMODE_SCARY_POTTER_ENDLESS &&
				i != (int)GameMode::GAMEMODE_PUZZLE_I_ZOMBIE_ENDLESS && i != (int)GameMode::GAMEMODE_SURVIVAL_ENDLESS_STAGE_3)
				aProfile->mChallengeRecords[i] = 20;

		aProfile->SaveDetails();
	}
}

// @Patoke: implemented functions
// GOTY @Patoke: 0x450140
void GameSelector::SlideTo(int theX, int theY) {
    if (mZombatarScreen)
        mZombatarScreen->mZombatarItems->CancelDeleteDialog();
	mSlideCounter = 75;
	mDestX = theX;
	mDestY = theY;
	mStartX = mX;
	mStartY = mY;
}

void GameSelector::ShowZombatarScreen() {
	if (!mZombatarScreen)
		return;

    mSlideCounter = 0;
    mZombatarPanning = false;
    Move(-(int)SELECTOR_MAIN_PAGE_X, 0);
    LayoutZombatarPage();
	mZombatarScreen->PrepareToShow();
    mZombatarScreen->mWidgetFlagsMod.mRemoveFlags &=
        ~(WIDGETFLAGS_UPDATE | WIDGETFLAGS_ALLOW_MOUSE | WIDGETFLAGS_ALLOW_FOCUS);
    mZombatarScreen->SetVisible(true);
    mZombatarPanning = true;
    SlideTo(-int(SELECTOR_MAIN_PAGE_X) - mZombatarSlideDistance, 0);
	// 1073 focuses the selector child that owns the category controls.  If the
	// outer full-screen Dialog is focused instead, GameButton::Update suppresses
	// all hover/down state while a modal dialog exists and the mouse semantics
	// become inconsistent.
	mWidgetManager->SetFocus(mZombatarScreen->mZombatarItems);
}

void GameSelector::HideZombatarScreen() {
    if (!mZombatarScreen) return;
    mZombatarScreen->mZombatarItems->CancelDeleteDialog();
    mZombatarScreen->SetVisible(false);
    mZombatarScreen->mWidgetFlagsMod.mRemoveFlags |=
        WIDGETFLAGS_UPDATE | WIDGETFLAGS_ALLOW_MOUSE | WIDGETFLAGS_ALLOW_FOCUS;
    mZombatarPanning = true;
    SlideTo(-int(SELECTOR_MAIN_PAGE_X), 0);
    if (mWidgetManager) mWidgetManager->SetFocus(this);
    MarkDirtyFull();
}

void GameSelector::LayoutZombatarPage() {
    const int mainX = int(SELECTOR_MAIN_PAGE_X);
    const Rect& view = mApp->mScreenBounds;
    const int distance = SelectorLayout::ZombatarSlideDistance(view.mX, view.mWidth);
    const int previousDistance = mZombatarSlideDistance;
    if (distance == previousDistance) return;
    if ((mZombatarScreen->mVisible || mZombatarPanning) && previousDistance > 0) {
        // Preserve the opening/closing fraction when resized mid-transition.
        const auto remap = [=](int position) {
            return -mainX + int((position + mainX) * 1LL * distance / previousDistance);
        };
        Move(remap(mX), mY);
        mStartX = remap(mStartX);
        mDestX = remap(mDestX);
    }
    mZombatarSlideDistance = distance;
}

// GOTY @Patoke: 0x450200
void GameSelector::ShowAchievementsWidget() {
	SlideTo(-(int)SELECTOR_MAIN_PAGE_X, -mApp->mHeight);
	mWidgetManager->SetFocus(mAchievementsWidget);
}
