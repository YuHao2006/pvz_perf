#include "Sexy.TodLib/generated/EntityStrings.h"
#include "TitleScreen.h"
#include "widget/HyperlinkWidget.h"
#include "widget/WidgetManager.h"
#include "LawnApp.h"
#include "Resources.h"
#include "Sexy.TodLib/TodCommon.h"
#include "misc/SexyMatrix.h"
#include "Sexy.TodLib/TodStringFile.h"
#include "Sexy.TodLib/EffectSystem.h"
#include "Sexy.TodLib/TodDebug.h"
#include "Sexy.TodLib/Reanimator.h"
#include "GameConstants.h"
#include "Lawn/System/Music.h"

//0x48D4B0
// GOTY @Patoke: 0x498220
TitleScreen::TitleScreen(LawnApp* theApp)
{
	mCurBarWidth = 0.0f;
	mTotalBarWidth = 314.0f;
	mBarVel = 0.2f;
	mBarStartProgress = 0.0f;
	mPrevLoadingPercent = 0.0f;
	mApp = theApp;
	mTitleAge = 0;
	mRegisterClicked = false;
	mNeedShowRegisterBox = false;
	mLoadingThreadComplete = false;
	mDrawnYet = false;
	mNeedToInit = true;
	mQuickLoadKey = KeyCode::KEYCODE_UNKNOWN;
	mDisplayPartnerLogo = false;
	mTitleState = TitleState::TITLESTATE_WAITING_FOR_FIRST_DRAW;
	mTitleStateDuration = 0;
	mTitleStateCounter = 0;
	mLoaderScreenIsLoaded = false;

	mStartButton = new Sexy::HyperlinkWidget(0, this);
	mStartButton->mColor = Sexy::Color(218, 184, 33);
	mStartButton->mOverColor = Sexy::Color(250, 90, 15);
	mStartButton->mUnderlineSize = 0;
	mStartButton->mDisabled = true;
	mStartButton->mVisible = false;
}

//0x48D6B0��0x48D6D0
TitleScreen::~TitleScreen()
{
	if (mStartButton)
	{
		delete mStartButton;
	}
}

void TitleScreen::DrawToPreload(Graphics* g)
{
	g->DrawImageF(IMAGE_PLANTSHADOW, 1000.0f, 0.0f);
}

//0x48D730
void TitleScreen::Draw(Graphics* g)
{
	g->mLinearBlend = true;

	if (mTitleState == TitleState::TITLESTATE_WAITING_FOR_FIRST_DRAW)
	{
		g->mColor = Color::Black;
		g->FillRect(0, 0, mWidth, mHeight);

		if (!mDrawnYet)
		{
			TodHesitationTrace("TitleScreen First Draw");
			mDrawnYet = true;
		}

		return;
	}
	
	if (mTitleState == TitleState::TITLESTATE_POPCAP_LOGO)
	{
		g->mColor = Color::Black;
		g->FillRect(0, 0, mWidth, mHeight);

		int anAlpha = 255;
		if (mTitleStateCounter < mTitleStateDuration - 50)
		{
			anAlpha = TodAnimateCurve(50, 0, mTitleStateCounter, 255, 0, Curves::Linear);
		}
		else
		{
			anAlpha = TodAnimateCurve(mTitleStateDuration, mTitleStateDuration - 50, mTitleStateCounter, 0, 255, Curves::Linear);
		}
		g->mColorizeImages = true;
		g->mColor = Color(255, 255, 255, anAlpha);
		g->DrawImage(IMAGE_POPCAP_LOGO, (mWidth - IMAGE_POPCAP_LOGO->mWidth) / 2, (mHeight - IMAGE_POPCAP_LOGO->mHeight) / 2);
		g->mColorizeImages = false;

		return;
	}

	if (!mLoaderScreenIsLoaded)
	{
		g->mColor = Color::Black;
		g->FillRect(0, 0, mWidth, mHeight);
		return;
	}

	g->DrawImage(IMAGE_TITLESCREEN, 0, 0);
	if (mNeedToInit)
	{
		return;
	}

	int aLogoY;
	if (mTitleStateCounter > 60)
	{
		aLogoY = TodAnimateCurve(100, 60, mTitleStateCounter, -150, 10, Curves::EaseIn);
	}
	else
	{
		aLogoY = TodAnimateCurve(60, 50, mTitleStateCounter, 10, 15, Curves::Bounce);
	}
	g->DrawImage(IMAGE_PVZ_LOGO, mWidth / 2 - IMAGE_PVZ_LOGO->mWidth / 2, aLogoY);

	int aGrassX = mStartButton->mX;
	int aGrassY = mStartButton->mY - 17;
	g->DrawImage(IMAGE_LOADBAR_DIRT, aGrassX, aGrassY + 18);

	if (mCurBarWidth >= mTotalBarWidth)
	{
		g->DrawImage(IMAGE_LOADBAR_GRASS, aGrassX, aGrassY);

		if (mLoadingThreadComplete)
		{
			DrawToPreload(g);
		}
	}
	else
	{
		Graphics aClipG(*g);
		aClipG.ClipRect(240, aGrassY, mCurBarWidth, IMAGE_LOADBAR_GRASS->mHeight);
		aClipG.DrawImage(IMAGE_LOADBAR_GRASS, aGrassX, aGrassY);

		float aRollLen = mCurBarWidth * 0.94f;
		float aRotation = -aRollLen / 180 * PI * 2;
		float aScale = TodAnimateCurveFloatTime(0, mTotalBarWidth, mCurBarWidth, 1, 0.5f, Curves::Linear);
		SexyTransform2D aTransform;
		TodScaleRotateTransformMatrix(aTransform, aGrassX + 11.0f + aRollLen, aGrassY - 3.0f - 35.0f * aScale + 35.0f, aRotation, aScale, aScale);
		Rect aSrcRect(0, 0, IMAGE_REANIM_SODROLLCAP->mWidth, IMAGE_REANIM_SODROLLCAP->mHeight);
		TodBltMatrix(g, IMAGE_REANIM_SODROLLCAP, aTransform, g->mClipRect, Color::White, g->mDrawMode, aSrcRect);
	}

	Reanimation* aReanim = nullptr;
	while (mApp->mEffectSystem->mReanimationHolder->mReanimations.IterateNext(aReanim))
	{
		aReanim->Draw(g);
	}
}

//0x48DCB0
// GOTY @Patoke: 0x498A20

void TitleScreen::Update()
{
	// TitleScreen::Update 快捷载入动作表（C 形态 -> 匿名 lambda 函数指针表）：
	// 行 = 键值配对，行序 = KeyCode 键值升序（原链书写序 Z,M,S,C,I,P,R 与键值
	// 序不同；键唯一，扫描命中序与原链判定序等价）。T(0x54) 支原链带
	// mTodCheatKeys/mPlayerInfo 复合判别式（混排），与 default 支（SetVisible）
	// 均表外保留在 Update 内。
	using TitleQuickLoadFn = void (*)(LawnApp*);

	// S/C/P 三支共体：载入完成 -> 关卡选择器 -> 跳对应挑战页。
	static constexpr auto TitleQuickLoadChallengePage = [](LawnApp* theApp, ChallengePage thePage)
	{
	theApp->LoadingCompleted();
	theApp->KillGameSelector();
	theApp->ShowChallengeScreen(thePage);
	};

	static constexpr struct { KeyCode mKey; TitleQuickLoadFn mAction; } kTitleQuickLoadRows[] = {
	{ (KeyCode)0x43, [](LawnApp* theApp) { TitleQuickLoadChallengePage(theApp, ChallengePage::CHALLENGE_PAGE_CHALLENGE); } },  // [0x43 'C'] 挑战页
	{ (KeyCode)0x49, [](LawnApp* theApp) { theApp->LoadingCompleted(); theApp->KillGameSelector(); theApp->PreNewGame(GameMode::GAMEMODE_INTRO, false); } },  // [0x49 'I'] 序章
	{ (KeyCode)0x4D, [](LawnApp* theApp) { theApp->LoadingCompleted(); } },  // [0x4D 'M'] 载入完成
	{ (KeyCode)0x50, [](LawnApp* theApp) { TitleQuickLoadChallengePage(theApp, ChallengePage::CHALLENGE_PAGE_PUZZLE); } },  // [0x50 'P'] 解谜页
	{ (KeyCode)0x52, [](LawnApp* theApp) { theApp->LoadingCompleted(); theApp->KillGameSelector(); theApp->ShowCreditScreen(); } },  // [0x52 'R'] 制作名单
	{ (KeyCode)0x53, [](LawnApp* theApp) { TitleQuickLoadChallengePage(theApp, ChallengePage::CHALLENGE_PAGE_SURVIVAL); } },  // [0x53 'S'] 生存页
	{ KeyCode::KEYCODE_ASCIIEND, [](LawnApp* theApp) { theApp->FastLoad(GameMode::GAMEMODE_LIMBO_ZEN_GARDEN); } },  // [0x5A 'Z' = KEYCODE_ASCIIEND] 禅花园
	};
	static_assert(sizeof(kTitleQuickLoadRows) / sizeof(kTitleQuickLoadRows[0]) == 7,
	"kTitleQuickLoadRows 槽位=7 快捷键（不含表外 T 支）");
	static_assert(kTitleQuickLoadRows[0].mKey == (KeyCode)0x43 &&
	kTitleQuickLoadRows[6].mKey == KeyCode::KEYCODE_ASCIIEND,
	"kTitleQuickLoadRows 行序=键值升序，首末行锚定 C/KEYCODE_ASCIIEND");

	Widget::Update();
	if (mApp->mShutdown)
	{
		return;
	}

	MarkDirty();
	if (!mDrawnYet)
	{
		return;
	}

	if (mTitleState == TitleState::TITLESTATE_WAITING_FOR_FIRST_DRAW)
	{
		mApp->mMusic->MusicTitleScreenInit();
		mApp->StartLoadingThread();

		mTitleState = TitleState::TITLESTATE_POPCAP_LOGO;
		mTitleStateDuration = 200;
		
		mTitleStateCounter = mTitleStateDuration;
	}

	if (mQuickLoadKey != KeyCode::KEYCODE_UNKNOWN && mTitleState != TitleState::TITLESTATE_SCREEN)
	{
		mTitleState = TitleState::TITLESTATE_SCREEN;
		mTitleStateDuration = 0;
		mTitleStateCounter = 100;
	}

	mTitleAge++;
	if (mTitleStateCounter > 0)
	{
		mTitleStateCounter--;
	}

	if (mTitleState == TitleState::TITLESTATE_POPCAP_LOGO)
	{
		if (mTitleStateCounter == 0)
		{
			mTitleState = TitleState::TITLESTATE_SCREEN;
			mTitleStateDuration = 100;
			mTitleStateCounter = 100;
		}

		return;
	}
	if (!mLoaderScreenIsLoaded)
	{
		return;
	}

	float aCurrentProgress = mApp->GetLoadingThreadProgress();
	if (mNeedToInit)
	{
		mNeedToInit = false;

		mStartButton->mLabel = gStr.LOADING;
		mStartButton->SetFont(FONT_BRIANNETOD16);
		mStartButton->Resize(mWidth / 2 - IMAGE_LOADBAR_DIRT->mWidth / 2, 650, mTotalBarWidth, 50);
		mStartButton->mVisible = true;

		float aEstimatedTotalLoadTime;
		if (aCurrentProgress > 0.000001f)
		{
			aEstimatedTotalLoadTime = mTitleAge / aCurrentProgress;
		}
		else
		{
			aEstimatedTotalLoadTime = 3000;
		}

		float aLoadTime = aEstimatedTotalLoadTime * (1 - aCurrentProgress);
		aLoadTime = ClampFloat(aLoadTime, 100, 3000);
		mBarVel = mTotalBarWidth / aLoadTime;
		mBarStartProgress = std::min(aCurrentProgress, 0.9f);
	}

	float aLoadingPercent = (aCurrentProgress - mBarStartProgress) / (1 - mBarStartProgress);

	int aButtonY;
	if (mTitleStateCounter > 10)
	{
		aButtonY = TodAnimateCurve(60, 10, mTitleStateCounter, 650, 534, Curves::EaseIn);
	}
	else
	{
		aButtonY = TodAnimateCurve(10, 0, mTitleStateCounter, 534, 529, Curves::Bounce);
	}
	mStartButton->Resize(mStartButton->mX, aButtonY, mTotalBarWidth, mStartButton->mHeight);

	if (mTitleStateCounter > 0)
	{
		return;
	}

	mApp->mEffectSystem->Update();

	float aPrevWidth = mCurBarWidth;
	mCurBarWidth += mBarVel;
	if (!mLoadingThreadComplete)
	{
		if (mCurBarWidth > mTotalBarWidth * 0.99f)
		{
			mCurBarWidth = mTotalBarWidth * 0.99f;
		}
	}
	else if (mCurBarWidth > mTotalBarWidth)
	{
		mStartButton->mLabel = gStr.CLICK_TO_START;
		mCurBarWidth = mTotalBarWidth;
	}

	if (aLoadingPercent > mPrevLoadingPercent + 0.01f || mLoadingThreadComplete)
	{
		float aBarWidth = TodAnimateCurveFloatTime(0, 1, aLoadingPercent, 0, mTotalBarWidth, Curves::EaseIn);
		float aDiff = aBarWidth - mCurBarWidth;
		float aAcceleration = TodAnimateCurveFloatTime(0, 1, aLoadingPercent, 0.0001f, 0.00001f, Curves::Linear);
		if (mLoadingThreadComplete)
		{
			aAcceleration = 0.0001f;
		}
		mBarVel += aDiff * abs(aDiff) * aAcceleration;

		float aMinVelocity = TodAnimateCurveFloatTime(0, 1, aLoadingPercent, 0.2f, 0.01f, Curves::Linear);
		float aMaxVelocity = 2;
		if (mApp->mTodCheatKeys)
		{
			aMinVelocity = 0;
			aMaxVelocity = 100;
		}

		if (mBarVel < aMinVelocity)
		{
			mBarVel = aMinVelocity;
		}
		else if (mBarVel > aMaxVelocity)
		{
			mBarVel = aMaxVelocity;
		}

		mPrevLoadingPercent = aLoadingPercent;
	}

	if (!mLoadingThreadComplete && mApp->mLoadingThreadCompleted)
	{
		// GPU caches must finish on the owning thread before the ready UI is released.
		mApp->PreloadForUser();
		mLoadingThreadComplete = true;
		mStartButton->SetDisabled(false);

		// C 形态 -> lambda 表 kTitleQuickLoadRows（上方）：键配对扫描，命中即执行。
		// 表外特例：T(0x54) 支带 mTodCheatKeys/mPlayerInfo 复合守卫，守卫不满足须
		// 回落 default 支，整支保留；default 支 = SetVisible(true)。
		TitleQuickLoadFn aQuickLoad = nullptr;
		for (const auto& aRow : kTitleQuickLoadRows)
		{
			if (aRow.mKey == mQuickLoadKey)
			{
				aQuickLoad = aRow.mAction;
				break;
			}
		}

		if (aQuickLoad != nullptr)
		{
			aQuickLoad(mApp);
		}
		else if (mApp->mTodCheatKeys && mApp->mPlayerInfo && mQuickLoadKey == (KeyCode)0x54)
		{
			mApp->FastLoad(GameMode::GAMEMODE_ADVENTURE);
		}
		else
		{
			mStartButton->SetVisible(true);
		}
	}

	float aTriggerPoint[] = { 
		mTotalBarWidth * 0.11f, 
		mTotalBarWidth * 0.32f, 
		mTotalBarWidth * 0.54f, 
		mTotalBarWidth * 0.72f, 
		mTotalBarWidth * 0.91f 
	};

	for (size_t i = 0; i < LENGTH(aTriggerPoint); i++)
	{
		if (aPrevWidth < aTriggerPoint[i] && mCurBarWidth >= aTriggerPoint[i])
		{
			ReanimationType aReanimType = ReanimationType::REANIM_LOADBAR_SPROUT;
			if (i == 4)
			{
				aReanimType = ReanimationType::REANIM_LOADBAR_ZOMBIEHEAD;
			}
			float aPosX = aTriggerPoint[i] + 225.0f;
			float aPosY = 511.0f;
			Reanimation* aSproutReanim = mApp->AddReanimation(aPosX, aPosY, 0, aReanimType);
			aSproutReanim->mAnimRate = 18.0f;
			aSproutReanim->mLoopType = ReanimLoopType::REANIM_PLAY_ONCE_AND_HOLD;

			if (i == 1 || i == 3)
			{
				aSproutReanim->mOverlayMatrix.m00 = -1.0f;
				aSproutReanim->mOverlayMatrix.m11 = 1.0f;
			}
			else if (i == 2)
			{
				aSproutReanim->mOverlayMatrix.m02 = aPosX;
				aSproutReanim->mOverlayMatrix.m12 = aPosY - 5.0f;
				aSproutReanim->mOverlayMatrix.m00 = 1.1f;
				aSproutReanim->mOverlayMatrix.m11 = 1.3f;
			}
			else if (i == 4)
			{
				aSproutReanim->mOverlayMatrix.m02 = aPosX - 20.0f;
				aSproutReanim->mOverlayMatrix.m12 = aPosY;
			}

			if (i == 4)
			{
				mApp->PlaySample(SOUND_LOADINGBAR_FLOWER);
				mApp->PlaySample(SOUND_LOADINGBAR_ZOMBIE);
			}
			else
			{
				mApp->PlaySample(SOUND_LOADINGBAR_FLOWER);
			}
		}
	}
}

void TitleScreen::Resize(int theX, int theY, int theWidth, int theHeight)
{
	Widget::Resize(theX, theY, theWidth, theHeight);
}

//0x48E5A0
void TitleScreen::AddedToManager(Sexy::WidgetManager* theWidgetManager)
{
	Widget::AddedToManager(theWidgetManager);
	theWidgetManager->AddWidget(mStartButton);
}

//0x48E5D0
void TitleScreen::RemovedFromManager(Sexy::WidgetManager* theWidgetManager)
{
	Widget::RemovedFromManager(theWidgetManager);
	theWidgetManager->RemoveWidget(mStartButton);
}

//0x48E600
void TitleScreen::ButtonPress(int theId)
{
	(void)theId;
	mApp->PlaySample(Sexy::SOUND_BUTTONCLICK);
}

//0x48E620
void TitleScreen::ButtonDepress(int theId)
{
	switch (theId)
	{
	case TitleScreen::TitleScreen_Start:
		mApp->LoadingCompleted();
		break;

	case TitleScreen::TitleScreen_Register:
		mRegisterClicked = true;
		break;
	}
}

//0x48E650
void TitleScreen::MouseDown(int x, int y, int theClickCount)
{
	(void)x;(void)y;(void)theClickCount;
	if (mLoadingThreadComplete)
	{
		mApp->PlaySample(Sexy::SOUND_BUTTONCLICK);
		mApp->LoadingCompleted();
	}
}

//0x48E690
void TitleScreen::KeyDown(KeyCode theKey)
{
	if (mLoadingThreadComplete)
	{
		mApp->PlaySample(Sexy::SOUND_BUTTONCLICK);
		mApp->LoadingCompleted();
	}

	if (mApp->mTodCheatKeys && mApp->mPlayerInfo)
	{
		mQuickLoadKey = theKey;
	}
}
