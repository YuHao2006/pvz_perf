#include "CheatDialog.h"
#include "LawnApp.h"
#include "Lawn/LawnCommon.h"
#include "ChallengeScreen.h"
#include "Resources.h"
#include "GameConstants.h"
#include "Lawn/System/PlayerInfo.h"
#include "widget/WidgetManager.h"

CheatDialog::CheatDialog(LawnApp* theApp) : LawnDialog(theApp, Dialogs::DIALOG_CHEAT, true, ("CHEAT"), ("Enter New Level:"), (""), Dialog::BUTTONS_OK_CANCEL)
{
	mApp = theApp;
	mVerticalCenterText = false;
	mLevelEditWidget = CreateEditWidget(0, this, this);
	mLevelEditWidget->mMaxChars = 12;
	mLevelEditWidget->AddWidthCheckFont(FONT_BRIANNETOD12, 220);

	SexyString aCheatStr;
	if (mApp->mGameMode != GameMode::GAMEMODE_ADVENTURE)
	{
		aCheatStr = StrFormat(("C%d"), (int)mApp->mGameMode);
	}
	else if (mApp->HasFinishedAdventure())
	{
		aCheatStr = StrFormat(("F%s"), mApp->GetStageString(mApp->mPlayerInfo->mLevel).c_str());
	}
	else
	{
		aCheatStr = mApp->GetStageString(mApp->mPlayerInfo->mLevel);
	}
	mLevelEditWidget->SetText(aCheatStr, true);

	CalcSize(110, 40);
}

CheatDialog::~CheatDialog()
{
	delete mLevelEditWidget;
}

int CheatDialog::GetPreferredHeight(int theWidth)
{
	return LawnDialog::GetPreferredHeight(theWidth);
}

void CheatDialog::Resize(int theX, int theY, int theWidth, int theHeight)
{
	LawnDialog::Resize(theX, theY, theWidth, theHeight);
	mLevelEditWidget->Resize(mContentInsets.mLeft + 12, mHeight - 155, mWidth - mContentInsets.mLeft - mContentInsets.mRight - 24, 28);
}

void CheatDialog::AddedToManager(WidgetManager* theWidgetManager)
{
	LawnDialog::AddedToManager(theWidgetManager);
	AddWidget(mLevelEditWidget);
	theWidgetManager->SetFocus(mLevelEditWidget);
}

void CheatDialog::RemovedFromManager(WidgetManager* theWidgetManager)
{
	LawnDialog::RemovedFromManager(theWidgetManager);
	RemoveWidget(mLevelEditWidget);
}

void CheatDialog::Draw(Graphics* g)
{
	LawnDialog::Draw(g);
	DrawEditBox(g, mLevelEditWidget);
}

void CheatDialog::EditWidgetText(int theId, const SexyString& theString)
{
	(void)theId;(void)theString;
	mApp->ButtonDepress(mId + 2000);
}

bool CheatDialog::AllowChar(int theId, SexyChar theChar)
{
	(void)theId;
	return sexyisdigit(theChar) || theChar == ('-') || theChar == ('c') || theChar == ('C') || theChar == ('f') || theChar == ('F');
}

bool CheatDialog::ApplyCheat()
{
	int aChallengeIndex;
	if (sexysscanf(mLevelEditWidget->mString.c_str(), ("c%d"), &aChallengeIndex) == 1 ||
		sexysscanf(mLevelEditWidget->mString.c_str(), ("C%d"), &aChallengeIndex) == 1)
	{
		// c<行号> 走定义表行内字段换模式值（原版 index 直转型只在 v1 枚举序
		// 下成立）。行号界内但行不存在的输入回落第 0 行。
		mApp->mGameMode = GetChallengeDefinition(
			ClampInt(aChallengeIndex, 0, NUM_CHALLENGE_MODES - 1)).mChallengeMode;
		return true;
	}

	int aLevel = -1;
	int aFinishedAdventure = 0;
	int aArea, aSubArea;
	if (sexysscanf(mLevelEditWidget->mString.c_str(), ("f%d-%d"), &aArea, &aSubArea) == 2 ||
		sexysscanf(mLevelEditWidget->mString.c_str(), ("F%d-%d"), &aArea, &aSubArea) == 2)
	{
		aLevel = (aArea - 1) * LEVELS_PER_AREA + aSubArea;
		aFinishedAdventure = 1;
	}
	else if (sexysscanf(mLevelEditWidget->mString.c_str(), ("f%d"), &aLevel) == 1 || sexysscanf(mLevelEditWidget->mString.c_str(), ("F%d"), &aLevel) == 1)
	{
		aFinishedAdventure = 1;
	}
	else if (sexysscanf(mLevelEditWidget->mString.c_str(), ("%d-%d"), &aArea, &aSubArea) == 2)
	{
		aLevel = (aArea - 1) * LEVELS_PER_AREA + aSubArea;
	}
	else
	{
		sexysscanf(mLevelEditWidget->mString.c_str(), ("%d"), &aLevel);
	}

	if (aLevel <= 0)
	{
		mApp->DoDialog(
			Dialogs::DIALOG_CHEATERROR, 
			true, 
			("Enter Level"), 
			("Invalid Level. Do 'number' or 'area-subarea' or 'Cnumber' or 'Farea-subarea'."), 
			("OK"), 
			Dialog::BUTTONS_FOOTER
		);
		return false;
	}

	mApp->mGameMode = GameMode::GAMEMODE_ADVENTURE;
	mApp->mPlayerInfo->mLevel = aLevel;
	mApp->mPlayerInfo->mFinishedAdventure = aFinishedAdventure;
	mApp->WriteCurrentUserConfig();
	return true;
}
