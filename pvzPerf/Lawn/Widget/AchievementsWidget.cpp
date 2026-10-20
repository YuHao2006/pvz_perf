// @Patoke: implement file
#include "AchievementsWidget.h"
#include "Lawn/Board.h"
#include "GameButton.h"
#include "GameSelector.h"
#include "LawnApp.h"
#include "Almanac.h"
#include "Resources.h"
#include "Lawn/System/Music.h"
#include "GameConstants.h"
#include "Lawn/System/PlayerInfo.h"
#include "Lawn/System/ProfileMgr.h"
#include "Sexy.TodLib/TodFoley.h"
#include "Sexy.TodLib/TodDebug.h"
#include "graphics/Font.h"
#include "Sexy.TodLib/Reanimator.h"
#include "Sexy.TodLib/TodParticle.h"
#include "widget/Dialog.h"
#include "widget/WidgetManager.h"

namespace
{
Rect aBackButtonRect = { 120, 35, 130, 80 };
}  // namespace

AchievementItem gAchievementList[MAX_ACHIEVEMENTS] = {
	{ "Home Lawn Security", "Complete Adventure Mode." },
	{ "Nobel Peas Prize", "Get the golden sunflower trophy." },
	{ "Better Off Dead", "Get to a streak of 10 in I, Zombie Endless" },
	{ "China Shop", "Get to a streak of 15 in Vasebreaker Endless" },
	{ "SPUDOW!", "Blow up a zombie using a Potato Mine." },
	{ "Explodonator", "Take out 10 full-sized zombies with a single Cherry Bomb." },
	{ "Morticulturalist", "Collect all 49 plants (including plants from Crazy Dave's shop)." },
	{ "Don't Pea in the Pool", "Complete a daytime pool level without using pea shooters of any kind." },
	{ "Roll Some Heads", "Bowl over 5 zombies with a single Wall-Nut." },
	{ "Grounded", "Defeat a normal roof level without using any catapult plants." },
	{ "Zombologist", "Discover the Yeti zombie." },
	{ "Penny Pincher", "Pick up 30 coins in a row on a single level without letting any disappear." },
	{ "Sunny Days", "Get 8000 sun during a single level." },
	{ "Popcorn Party", "Defeat 2 Gargantuars with Corn Cob missiles in a single level." },
	{ "Good Morning", "Complete a daytime level by planting only Mushrooms and Coffee Beans." },
	{ "No Fungus Among Us", "Complete a nighttime level without planting any Mushrooms." },
	{ "Beyond the Grave", "Beat all 20 mini games." },
	{ "Immortal", "Survive 20 waves of pure zombie ferocity." },
	{ "Towering Wisdom", "Grow the Tree of Wisdom to 100 feet." },
	{ "Mustache Mode", "Enable Mustache Mode" }
};

// GOTY @Patoke: 0x401000
AchievementsWidget::AchievementsWidget(LawnApp* theApp) {
	mApp = theApp;
	mWidth = 800;
	mHeight = IMAGE_ACHEESEMENTS_CHINA->mHeight + IMAGE_SELECTORSCREEN_ACHIEVEMENTS_BG->mHeight + 15700;
	mScrollDirection = -1;
	mScrollValue = 0;
	mDefaultScrollValue = 30;
	mScrollDecay = 1;
	mDidPressMoreButton = false;
	mMoreRockRect = Rect(710, 470, IMAGE_ACHEESEMENTS_MORE_ROCK->mWidth - 25, IMAGE_ACHEESEMENTS_MORE_ROCK->mHeight - 50);
}

// GOTY @Patoke: 0x4010E0
AchievementsWidget::~AchievementsWidget() {

}

// GOTY @Patoke: 0x401A10
void AchievementsWidget::Update() {
	if (mScrollValue <= 0)
		return;

	if (mScrollValue > mDefaultScrollValue)
		mScrollValue = mDefaultScrollValue;

	mScrollValue -= mScrollDecay * Sexy::gWholeLegacyTicks;

	int aNewY = mY + mScrollValue * mScrollDirection * Sexy::gWholeLegacyTicks;
	if (aNewY >= mApp->mHeight)
		aNewY = mApp->mHeight;

	int aMaxScroll = 2 * mApp->mHeight + 50 - mHeight;
	if (aNewY <= aMaxScroll)
		aNewY = aMaxScroll;

	int aOldY = mY;
	mY = aNewY;

	int aDelta = aNewY - aOldY;
	mMoreRockRect.mY += aDelta;
	aBackButtonRect.mY += aDelta;

	if (mScrollValue <= 0)
		mScrollValue = 0;
}

// GOTY @Patoke: 0x401160
void AchievementsWidget::Draw(Graphics* g) {
	if (g->mClipRect.mWidth <= 0 || g->mClipRect.mHeight <= 0)
		return;

	const Point anAbsolutePosition = GetAbsPos();
	const Point aMousePosition(
		mWidgetManager->mLastMouseX - anAbsolutePosition.mX,
		mWidgetManager->mLastMouseY - anAbsolutePosition.mY);

	g->DrawImage(IMAGE_SELECTORSCREEN_ACHIEVEMENTS_BG, 0, 0);

	int aHeight = IMAGE_SELECTORSCREEN_ACHIEVEMENTS_BG->mHeight;
	for (int i = 1; i <= 70; i++)
		g->DrawImage(IMAGE_ACHEESEMENTS_HOLE_TILE, 0, aHeight * i);

	g->DrawImage(IMAGE_ACHEESEMENTS_BOOKWORM, 0, 1125);
	g->DrawImage(IMAGE_ACHEESEMENTS_BEJEWELED, 0, 2250);
	g->DrawImage(IMAGE_ACHEESEMENTS_CHUZZLE, 0, 4500);
	g->DrawImage(IMAGE_ACHEESEMENTS_PEGGLE, 0, 6750);
	g->DrawImage(IMAGE_ACHEESEMENTS_PIPE, 0, 9000);
	g->DrawImage(IMAGE_ACHEESEMENTS_ZUMA, 0, 11250);

	g->DrawImage(IMAGE_ACHEESEMENTS_CHINA, 0, mHeight - IMAGE_ACHEESEMENTS_CHINA->mHeight - 50);
	
	if (aBackButtonRect.Contains(aMousePosition))
		g->DrawImage(IMAGE_ACHEESEMENTS_BACK_HIGHLIGHT, 128, 55);

	for (int i = 0; i < MAX_ACHIEVEMENTS; i++) {
		bool aHasAchievement;
		if (mApp->mPlayerInfo) aHasAchievement = mApp->mPlayerInfo->mEarnedAchievements[i];
		else aHasAchievement = false;

		int aCurrAchievementOff = 57 * int(i / 2);
		int aImageXPos = i % 2 == 0 ? 120 : 410;
		int aImageYPos = 178 + aCurrAchievementOff;
		int aTextXPos = aImageXPos + 70;
		int aTextYPos = aImageYPos + 16;

		// Achievement images
		Rect aSrcRect(70 * (i % 7), 70 * (i / 7), 70, 70);
		Rect aDestRect(aImageXPos, aImageYPos, 56, 56);
		
		g->mColorizeImages = true;
		g->mColor = aHasAchievement ? Color(255, 255, 255) : Color(255, 255, 255, 32);

		g->DrawImage(IMAGE_ACHEESEMENTS_ICONS, aDestRect, aSrcRect);
		g->mColorizeImages = false;
		
		// Achievement titles
		g->mFont = FONT_DWARVENTODCRAFT15;
		g->mColor = Color(21, 175, 0);

		g->DrawString(gAchievementList[i].name, aTextXPos, aTextYPos);

		// Achievement descriptions	
		Rect aPos = Rect(aTextXPos, aTextYPos + 3, 212, 60);
		
		g->mFont = FONT_DWARVENTODCRAFT12;
		g->mColor = Color(255, 255, 255);

		g->WriteWordWrapped(aPos, gAchievementList[i].description, 12);
	}

	g->DrawImage(IMAGE_ACHEESEMENTS_MORE_ROCK, 700, 450);

	bool aIsHighlight = mMoreRockRect.Contains(aMousePosition);
	if (mDidPressMoreButton) {
		g->DrawImage(aIsHighlight ? IMAGE_ACHEESEMENTS_TOP_BUTTON_HIGHLIGHT : IMAGE_ACHEESEMENTS_TOP_BUTTON, 700, 450);
	}
	else {
		g->DrawImage(aIsHighlight ? IMAGE_ACHEESEMENTS_MORE_BUTTON_HIGHLIGHT : IMAGE_ACHEESEMENTS_MORE_BUTTON, 700, 450);
	}
}

// GOTY @Patoke: 0x4019D0
void AchievementsWidget::KeyDown(KeyCode theKey) {
	if (theKey == KEYCODE_UP) {
		mScrollValue = mDefaultScrollValue;
		mScrollDirection = 1;
	}
	else if (theKey == KEYCODE_DOWN) {
		mScrollValue = mDefaultScrollValue;
		mScrollDirection = -1;
	}
}

// GOTY @Patoke: 0x4017F0
void AchievementsWidget::MouseDown(int x, int y, int theClickCount) {
	(void)theClickCount;
	if (aBackButtonRect.Contains(x, y))
		mApp->PlaySample(SOUND_GRAVEBUTTON);

	if (mMoreRockRect.Contains(x, y))
		mApp->PlaySample(SOUND_GRAVEBUTTON);
}

// GOTY @Patoke: 0x401890
void AchievementsWidget::MouseUp(int x, int y, int theClickCount) {
	(void)theClickCount;
	Point aPos = Point(x, y);
	if (aBackButtonRect.Contains(aPos)) {
		mApp->mGameSelector->SlideTo(-800, 0);
		mApp->mGameSelector->mWidgetManager->SetFocus(mApp->mGameSelector);
	}

	if (mMoreRockRect.Contains(aPos)) {
		mDidPressMoreButton = !mDidPressMoreButton;
		mScrollDirection = mDidPressMoreButton ? -1 : 1;
		mScrollValue = 20;
	}
}

void AchievementsWidget::MouseMove(int x, int y) {
	const bool aIsOver = aBackButtonRect.Contains(x, y) || mMoreRockRect.Contains(x, y);
	ShowFinger(aIsOver);
}

void AchievementsWidget::MouseLeave() {
	ShowFinger(false);
}

// GOTY @Patoke: 0x4019A0
void AchievementsWidget::MouseWheel(int theDelta) {
	mScrollValue = mDefaultScrollValue;

	if (theDelta > 0)
		mScrollDirection = 1;
	else if (theDelta < 0)
		mScrollDirection = -1;
}

// GOTY @Patoke: 0x459670
bool ReportAchievement::GiveAchievement(LawnApp* theApp, int theAchievement, bool theForceGive) {
	if (!theApp || !theApp->mPlayerInfo ||
		theAchievement < 0 || theAchievement >= MAX_ACHIEVEMENTS)
		return false;

	if (theApp->mPlayerInfo->mEarnedAchievements[theAchievement])
		return false;

	theApp->mPlayerInfo->mEarnedAchievements[theAchievement] = true;

	// GOTY 1.2.0.1073 records menu-time reconciliation without trying to
	// display board advice. Immediate in-level awards also mark the popup as
	// shown so the award screen does not present the same achievement again.
	if (!theForceGive || !theApp->mBoard)
		return true;
	theApp->mPlayerInfo->mShownAchievements[theAchievement] = true;

	std::string aAchievementName = gAchievementList[theAchievement].name;
	aAchievementName.append(" Achievement!");

	theApp->mBoard->DisplayAdvice(aAchievementName, MESSAGE_STYLE_ACHIEVEMENT, AdviceType::ADVICE_NONE);
	theApp->PlaySample(SOUND_ACHIEVEMENT);

	return true;
}

// GOTY @Patoke: 0x44D5B0
void ReportAchievement::AchievementInitForPlayer(GameSelector* theSelector) {
	if (!theSelector->mApp || !theSelector->mApp->mPlayerInfo)
		return;

	if (theSelector->mApp->HasFinishedAdventure()) {
		GiveAchievement(theSelector->mApp, AchievementId::HomeSecurity, true);
	}

	if (theSelector->mApp->EarnedGoldTrophy()) {
		GiveAchievement(theSelector->mApp, AchievementId::NovelPeasPrize, true);
	}

	if (theSelector->mApp->CanSpawnYetis()) {
		GiveAchievement(theSelector->mApp, AchievementId::Zombologist, true);
	}

	int aTreeSize = theSelector->mApp->mPlayerInfo->mChallengeRecords[(int)GameMode::GAMEMODE_TREE_OF_WISDOM];  // 存档 v13 直下标
	if (aTreeSize >= 100) {
		GiveAchievement(theSelector->mApp, AchievementId::ToweringWisdom, true);
	}

	bool aGiveAchievement = true;
	for (int aSeedType = SEED_GATLINGPEA; aSeedType <= SEED_IMITATER; aSeedType++) {
		if (!theSelector->mApp->SeedTypeAvailable(SeedType(aSeedType)))
			aGiveAchievement = false;
	}

	if (aGiveAchievement) {
		GiveAchievement(theSelector->mApp, AchievementId::Morticulturalist, aGiveAchievement);
	}
}
