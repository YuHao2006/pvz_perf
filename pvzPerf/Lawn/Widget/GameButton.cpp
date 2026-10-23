#include "Sexy.TodLib/generated/EntityStrings.h"
#include "GameButton.h"
#include "LawnApp.h"
#include "Resources.h"
#include "Sexy.TodLib/TodCommon.h"
#include "graphics/Font.h"
#include "graphics/Graphics.h"
#include "Sexy.TodLib/TodStringFile.h"
#include "widget/WidgetManager.h"
#include "graphics/AtlasDraw.h"
#include "Sexy.TodLib/generated/SceneAtlasData.h"

static Color gGameButtonColors[6] = { Color(0, 0, 0), Color(0, 0, 0), Color(0, 0, 0), Color(255, 255, 255), Color(132, 132, 132), Color(212, 212, 212) };

//0x447B00
static void DrawStoneButton(Graphics* g, int x, int y, int theWidth, int theHeight, bool isDown, bool isHighLighted, const SexyString& theLabel)
{
	using enum FixedUIAtlas::Sprite;
	const Rect& left = FixedUIAtlas::Images[static_cast<size_t>(isDown ? BUTTON_DOWN_LEFT : BUTTON_LEFT)];
	const Rect& middle = FixedUIAtlas::Images[static_cast<size_t>(isDown ? BUTTON_DOWN_MIDDLE : BUTTON_MIDDLE)];
	const Rect& right = FixedUIAtlas::Images[static_cast<size_t>(isDown ? BUTTON_DOWN_RIGHT : BUTTON_RIGHT)];
	const Sexy::TextureSource texture{FixedUIAtlas::Texture, FixedUIAtlas::Width, FixedUIAtlas::Height};
	int aFontX = x;
	int aFontY = y;
	int aImageX = x;
	if (isDown)
	{
		aFontX++;
		aFontY++;
		aImageX++;
	}

	int aRepeat = (theWidth - left.mWidth - right.mWidth) / middle.mWidth;
	Sexy::DrawAtlasImage(g, texture, left, aImageX, y);
	aImageX += left.mWidth;
	while (aRepeat > 0)
	{
		Sexy::DrawAtlasImage(g, texture, middle, aImageX, y);
		aImageX += middle.mWidth;
		--aRepeat;
	}
	Sexy::DrawAtlasImage(g, texture, right, aImageX, y);

	g->mFont = isHighLighted ? Sexy::FONT_DWARVENTODCRAFT18BRIGHTGREENINSET : Sexy::FONT_DWARVENTODCRAFT18GREENINSET;
	aFontX += (theWidth - Sexy::FONT_DWARVENTODCRAFT18GREENINSET->StringWidth(theLabel)) / 2 + 1;
	aFontY += (theHeight - Sexy::FONT_DWARVENTODCRAFT18GREENINSET->mAscent / 6 - 1 + Sexy::FONT_DWARVENTODCRAFT18GREENINSET->mAscent) / 2 - 4;
	g->mColor = Color::White;
	g->DrawString(theLabel, aFontX, aFontY);
}

//0x447C60
GameButton::GameButton(int theId)
{
	mLabel = "";
	mNormalRect = mOverRect = mDownRect = mDisabledRect = Rect();
	mOverAlpha = mOverAlphaSpeed = mOverAlphaFadeInSpeed = 0;
	mApp = (LawnApp*)gSexyAppBase;
	mId = theId;
	mLabelJustify = 0;
	mFont = nullptr;
	mButtonImage = mOverImage = mDownImage = mDisabledImage = mOverOverlayImage = nullptr;
	mInverted = mBtnNoDraw = mFrameNoDraw = false;
	mIsOver = mIsDown = mDisabled = false;
	mX = mY = mWidth = mHeight = 0;
	mParentWidget = nullptr;
	mDrawStoneButton = false;
	mTextOffsetX = mTextOffsetY = mButtonOffsetX = mButtonOffsetY = 0;
	for (int i = 0; i < 6; i++) mColors[i] = gGameButtonColors[i];
}

//0x447DE0
GameButton::~GameButton()
{
	if (mFont)
		delete mFont;
}

bool GameButton::HaveButtonImage(Image* theImage, Rect& theRect)
{ 
	return theImage != nullptr || theRect.mWidth != 0;
}

//0x447E60
void GameButton::DrawButtonImage(Graphics* g, Image* theImage, Rect& theRect, int theX, int theY)
{
	int aPosX = theX + mButtonOffsetX;
	int aPosY = theY + mButtonOffsetY;
	if (theRect.mWidth != 0)
		g->DrawImage(mButtonImage, aPosX, aPosY, theRect);
	else
		g->DrawImage(theImage, aPosX, aPosY);
}

void GameButton::SetFont(_Font* theFont)
{
	if (mFont)
		delete mFont;
	
	mFont = theFont->Duplicate();
}

bool GameButton::IsButtonDown()
{ 
	return mIsDown && mIsOver && !mDisabled && !mBtnNoDraw;
}

//0x447EC0
// GOTY @Patoke: 0x44AAC0
void GameButton::Draw(Graphics* g)
{
	if (mBtnNoDraw)
		return;

	bool isDown = IsButtonDown() ^ mInverted;
	bool isHighLighted = IsMouseOver();
	if (mDrawStoneButton)
	{
		DrawStoneButton(g, mX, mY, mWidth, mHeight, isDown, isHighLighted, mLabel);
		return;
	}

	g->mTransX += mX;
	g->mTransY += mY;
	if (!mFont && mLabel.size() > 0)
		throw FontNotConfigured{};
	
	int aFontX = mTextOffsetX;
	int aFontY = mTextOffsetY;
	if (mFont)
	{
		if (mLabelJustify == GameButton::BUTTON_LABEL_CENTER)
			aFontX += (mWidth - mFont->StringWidth(mLabel)) / 2;
		else if (mLabelJustify == GameButton::BUTTON_LABEL_RIGHT)
			aFontX += mWidth - mFont->StringWidth(mLabel);

		aFontY += (mHeight - mFont->mAscent / 6 + mFont->mAscent - 1) / 2;
	}
	g->mFont = mFont;

	if (!isDown)
	{
		if (mDisabled && HaveButtonImage(mDisabledImage, mDisabledRect))
			DrawButtonImage(g, mDisabledImage, mDisabledRect, 0, 0);
		else if (mOverAlpha > 0.0f && HaveButtonImage(mOverImage, mOverRect))
		{
			if (HaveButtonImage(mButtonImage, mNormalRect) && mOverAlpha < 1.0f)  // 未完全过渡结束
				DrawButtonImage(g, mButtonImage, mNormalRect, 0, 0);

			g->mColorizeImages = true;
			g->mColor = Color(255, 255, 255, mOverAlpha * 255);
			DrawButtonImage(g, mOverImage, mOverRect, 0, 0);
			g->mColorizeImages = false;
		}
		else if (isHighLighted && HaveButtonImage(mOverImage, mOverRect))
			DrawButtonImage(g, mOverImage, mOverRect, 0, 0);
		else if (HaveButtonImage(mButtonImage, mNormalRect))
			DrawButtonImage(g, mButtonImage, mNormalRect, 0, 0);

		g->mColor = mColors[isHighLighted ? GameButton::COLOR_LABEL_HILITE : GameButton::COLOR_LABEL];
		g->DrawString(StringToSexyStringFast(mLabel), aFontX, aFontY);

		if (isHighLighted && mOverOverlayImage)
		{
			g->mDrawMode = Graphics::DRAWMODE_ADDITIVE;
			DrawButtonImage(g, mOverOverlayImage, mNormalRect, 0, 0);
			g->mDrawMode = Graphics::DRAWMODE_NORMAL;
		}
	}
	else
	{
		if (HaveButtonImage(mDownImage, mDownRect))
			DrawButtonImage(g, mDownImage, mDownRect, 0, 0);
		else if (HaveButtonImage(mOverImage, mOverRect))
			DrawButtonImage(g, mOverImage, mOverRect, 1, 1);
		else
			DrawButtonImage(g, mButtonImage, mNormalRect, 1, 1);
		
		g->mColor = mColors[GameButton::COLOR_LABEL_HILITE];
		g->DrawString(StringToSexyStringFast(mLabel), aFontX + 1, aFontY + 1);

		if (isHighLighted && mOverOverlayImage)
		{
			g->mDrawMode = Graphics::DRAWMODE_ADDITIVE;
			DrawButtonImage(g, mOverOverlayImage, mNormalRect, 0, 0);
			g->mDrawMode = Graphics::DRAWMODE_NORMAL;
		}
	}

	g->Translate(-mX, -mY);
}

void GameButton::DrawAtlas(Graphics* g, const Sexy::TextureSource& texture, const Rect* overlay)
{
	if (mBtnNoDraw)
		return;
	const bool down = IsButtonDown() ^ mInverted;
	const bool highlighted = IsMouseOver();
	if (!mFont && !mLabel.empty())
		throw FontNotConfigured{};
	int fontX = mTextOffsetX;
	int fontY = mTextOffsetY;
	if (mFont)
	{
		if (mLabelJustify == BUTTON_LABEL_CENTER)
			fontX += (mWidth - mFont->StringWidth(mLabel)) / 2;
		else if (mLabelJustify == BUTTON_LABEL_RIGHT)
			fontX += mWidth - mFont->StringWidth(mLabel);
		fontY += (mHeight - mFont->mAscent / 6 + mFont->mAscent - 1) / 2;
	}
	g->Translate(mX, mY);
	g->mFont = mFont;
	const auto draw = [&](const Rect& rectangle, int x = 0, int y = 0) {
		Sexy::DrawAtlasImage(g, texture, rectangle,
			x + mButtonOffsetX, y + mButtonOffsetY);
	};
	if (!down)
	{
		if (mDisabled && mDisabledRect.mWidth)
			draw(mDisabledRect);
		else if (mOverAlpha > 0 && mOverRect.mWidth)
		{
			if (mNormalRect.mWidth && mOverAlpha < 1)
				draw(mNormalRect);
			g->mColorizeImages = true;
			g->mColor = Color(255, 255, 255, mOverAlpha * 255);
			draw(mOverRect);
			g->mColorizeImages = false;
		}
		else if (highlighted && mOverRect.mWidth)
			draw(mOverRect);
		else
			draw(mNormalRect);
		g->mColor = mColors[highlighted ? COLOR_LABEL_HILITE : COLOR_LABEL];
		g->DrawString(mLabel, fontX, fontY);
	}
	else
	{
		if (mDownRect.mWidth)
			draw(mDownRect);
		else if (mOverRect.mWidth)
			draw(mOverRect, 1, 1);
		else
			draw(mNormalRect, 1, 1);
		g->mColor = mColors[COLOR_LABEL_HILITE];
		g->DrawString(mLabel, fontX + 1, fontY + 1);
	}
	if (highlighted && overlay)
	{
		g->mDrawMode = Graphics::DRAWMODE_ADDITIVE;
		draw(*overlay);
		g->mDrawMode = Graphics::DRAWMODE_NORMAL;
	}
	g->Translate(-mX, -mY);
}

//0x448130
bool GameButton::IsMouseOver()
{
	if (mDisabled || mBtnNoDraw)
		return false;

	// Input can arrive before the next Update; query the current logical mouse
	// position without advancing the button's press or highlight animation.
	WidgetManager* aManager = mApp->mWidgetManager;
	const bool aFocusMatches = aManager->mFocusWidget && aManager->mFocusWidget == mParentWidget;
	if (!aFocusMatches && mApp->GetDialogCount() > 0)
		return false;

	int aMouseX = aManager->mLastMouseX, aMouseY = aManager->mLastMouseY;
	if (mParentWidget)
	{
		Point anAbsPos = mParentWidget->GetAbsPos();
		aMouseX -= anAbsPos.mX;
		aMouseY -= anAbsPos.mY;
	}
	return Rect(mX, mY, mWidth, mHeight).Contains(aMouseX, aMouseY);
}

//0x448330
// GOTY @Patoke: 0x44AF50
void GameButton::Update()
{
	WidgetManager* aManager = mApp->mWidgetManager;
	int aMouseX = aManager->mLastMouseX, aMouseY = aManager->mLastMouseY;
	if (mParentWidget)
	{
		Point anAbsPos = mParentWidget->GetAbsPos();
		aMouseX -= anAbsPos.mX;
		aMouseY -= anAbsPos.mY;
	}

	if ((aManager->mFocusWidget && aManager->mFocusWidget == mParentWidget) || mApp->GetDialogCount() <= 0)
	{
		mIsOver = Rect(mX, mY, mWidth, mHeight).Contains(aMouseX, aMouseY);
		mIsDown = aManager->mDownButtons & 5;
	}
	else
	{
		mIsOver = false;
		mIsDown = false;
	}

	if (!mIsDown && !mIsOver && mOverAlpha > 0)
	{
		if (mOverAlphaSpeed < 0)
		{ 
			mOverAlpha = 0;
			return;
		}
		mOverAlpha -= Sexy::UpdateDelta(mOverAlphaSpeed);
		if (mOverAlpha < 0)
			mOverAlpha = 0;
	}
	else if (mIsOver && mOverAlphaFadeInSpeed > 0 && mOverAlpha < 1)
	{
		if (mOverAlphaFadeInSpeed > 0)
		{
			mOverAlpha += Sexy::UpdateDelta(mOverAlphaFadeInSpeed);
			if (mOverAlpha > 1)
				mOverAlpha = 1;
		}
		else
			mOverAlpha = 1;
	}
}

//0x4485C0
void LawnStoneButton::Draw(Graphics* g)
{
	if (mBtnNoDraw)
		return;

	bool isDown = (mIsDown && mIsOver && !mDisabled) ^ mInverted;
	DrawStoneButton(g, 0, 0, mWidth, mHeight, isDown, mIsOver, mLabel);
}

//0x448620
LawnStoneButton* MakeButton(int theId, ButtonListener* theListener, const SexyString& theText)
{
	LawnStoneButton* aButton = new LawnStoneButton(nullptr, theId, theListener);
	aButton->mLabel = theText;

	aButton->mTranslateX = 1;
	aButton->mTranslateY = 1;
	aButton->mHasAlpha = true;
	aButton->mHasTransparencies = true;
	aButton->mHeight = 33;
	return aButton;
}

//0x4486C0
// GOTY @Patoke: 0x44B2B0
NewLawnButton::NewLawnButton(Image* theComponentImage, int theId, ButtonListener* theListener) : DialogButton(theComponentImage, theId, theListener)
{
	mHiliteFont = nullptr;
	mTextDownOffsetX = 0;
	mTextDownOffsetY = 0;
	mButtonOffsetX = 0;
	mButtonOffsetY = 0;
	mUsePolygonShape = false;
	SetColor(ButtonWidget::COLOR_BKG, Color::White);
}

NewLawnButton::~NewLawnButton()
{
	//if (mHiliteFont)
	//	delete mHiliteFont;
}

//0x448790
// GOTY @Patoke: 0x44B383
void NewLawnButton::Draw(Graphics* g)
{
	if (mBtnNoDraw)
		return;

	bool isDown = (mIsDown && mIsOver && !mDisabled) ^ mInverted;
	int aFontX = mTextOffsetX + mTranslateX;
	int aFontY = mTextOffsetY + mTranslateY;
	if (mFont)
	{
		if (mLabelJustify == ButtonWidget::BUTTON_LABEL_CENTER)
			aFontX += (mWidth - mFont->StringWidth(mLabel)) / 2;
		else if (mLabelJustify == ButtonWidget::BUTTON_LABEL_RIGHT)
			aFontX += mWidth - mFont->StringWidth(mLabel);

		aFontY += (mHeight - mFont->mAscent / 6 + mFont->mAscent - 1) / 2;
	}

	g->mColorizeImages = true;
	if (!isDown)
	{
		g->mColor = mColors[ButtonWidget::COLOR_BKG];
		if (mDisabled && HaveButtonImage(mDisabledImage, mDisabledRect))
			DrawButtonImage(g, mDisabledImage, mDisabledRect, mButtonOffsetX, mButtonOffsetY);
		else if (mOverAlpha > 0.0f && HaveButtonImage(mOverImage, mOverRect))
		{
			if (HaveButtonImage(mButtonImage, mNormalRect) && mOverAlpha < 1.0f)  // 未完全过渡结束
				DrawButtonImage(g, mButtonImage, mNormalRect, mButtonOffsetX, mButtonOffsetY);

			g->mColor.mAlpha = mOverAlpha * 255;
			DrawButtonImage(g, mOverImage, mOverRect, mButtonOffsetX, mButtonOffsetY);
		}
		else if ((mIsOver || mIsDown) && HaveButtonImage(mOverImage, mOverRect))
			DrawButtonImage(g, mOverImage, mOverRect, mButtonOffsetX, mButtonOffsetY);
		else if (HaveButtonImage(mButtonImage, mNormalRect))
			DrawButtonImage(g, mButtonImage, mNormalRect, mButtonOffsetX, mButtonOffsetY);

		g->mColorizeImages = false;
		if (mIsOver)
		{
			g->mFont = mHiliteFont ? mHiliteFont : mFont;
			g->mColor = mColors[ButtonWidget::COLOR_LABEL_HILITE];
		}
		else
		{
			g->mFont = mFont;
			g->mColor = mColors[ButtonWidget::COLOR_LABEL];
		}
		g->DrawString(mLabel, aFontX, aFontY);
	}
	else
	{
		g->mColor = mColors[ButtonWidget::COLOR_BKG];
		if (HaveButtonImage(mDownImage, mDownRect))
			DrawButtonImage(g, mDownImage, mDownRect, mButtonOffsetX + mTranslateX, mButtonOffsetY + mTranslateY);
		else if (HaveButtonImage(mOverImage, mOverRect))
			DrawButtonImage(g, mOverImage, mOverRect, mButtonOffsetX + mTranslateX, mButtonOffsetY + mTranslateY);
		else
			DrawButtonImage(g, mButtonImage, mNormalRect, mButtonOffsetX + mTranslateX, mButtonOffsetY + mTranslateY);

		g->mColorizeImages = false;
		g->mFont = mHiliteFont ? mHiliteFont : mFont;
		g->mColor = mColors[ButtonWidget::COLOR_LABEL_HILITE];
		g->DrawString(mLabel, aFontX + mTextDownOffsetX, aFontY + mTextDownOffsetY);
	}
}

//0x448B70
// GOTY @Patoke: 0x44B7C0
bool NewLawnButton::IsPointVisible(int x, int y)
{
	if (!mUsePolygonShape)
		return DialogButton::IsPointVisible(x, y);

	return TodIsPointInPolygon(mPolygonShape, 4, SexyVector2(x, y));
}

//0x448BC0
// GOTY @Patoke: 0x44B810
NewLawnButton* MakeNewButton(int theId, ButtonListener* theListener, const SexyString& theText, _Font* theFont, Image* theImageNormal, Image* theImageOver, Image* theImageDown)
{
	NewLawnButton* aButton = new NewLawnButton(nullptr, theId, theListener);
	aButton->SetFont(theFont == nullptr ? Sexy::FONT_BRIANNETOD12 : theFont);
	aButton->mLabel = theText;

	aButton->mWidth = theImageNormal->mWidth;
	aButton->mHeight = theImageNormal->mHeight;
	aButton->mButtonImage = theImageNormal;
	aButton->mDownImage = theImageDown;
	aButton->mOverImage = theImageOver;
	aButton->mHasAlpha = true;
	aButton->mHasTransparencies = true;
	aButton->mTranslateX = 1;
	aButton->mTranslateY = 1;

	return aButton;
}

namespace {
class FixedUIBackButton final : public NewLawnButton
{
public:
	FixedUIBackButton(int id, ButtonListener* listener, const SexyString& text)
		: NewLawnButton(nullptr, id, listener)
	{
		using enum FixedUIAtlas::Sprite;
		mNormalRect = FixedUIAtlas::Images[static_cast<size_t>(SEEDCHOOSER_BUTTON2)];
		mOverRect = mDownRect = FixedUIAtlas::Images[static_cast<size_t>(SEEDCHOOSER_BUTTON2_GLOW)];
		mLabel = text;
		SetFont(Sexy::FONT_BRIANNETOD12);
		mWidth = mNormalRect.mWidth;
		mHeight = mNormalRect.mHeight;
		mHasAlpha = mHasTransparencies = true;
		mTranslateX = mTranslateY = 1;
	}

	void Draw(Graphics* g) override
	{
		if (mBtnNoDraw)
			return;
		const Sexy::TextureSource texture{
			FixedUIAtlas::Texture, FixedUIAtlas::Width, FixedUIAtlas::Height};
		const bool down = (mIsDown && mIsOver && !mDisabled) ^ mInverted;
		int fontX = mTextOffsetX + mTranslateX;
		int fontY = mTextOffsetY + mTranslateY;
		if (mFont)
		{
			if (mLabelJustify == ButtonWidget::BUTTON_LABEL_CENTER)
				fontX += (mWidth - mFont->StringWidth(mLabel)) / 2;
			else if (mLabelJustify == ButtonWidget::BUTTON_LABEL_RIGHT)
				fontX += mWidth - mFont->StringWidth(mLabel);
			fontY += (mHeight - mFont->mAscent / 6 + mFont->mAscent - 1) / 2;
		}
		const auto draw = [&](const Rect& rectangle, bool pressed) {
			Sexy::DrawAtlasImage(g, texture, rectangle,
				mButtonOffsetX + (pressed ? mTranslateX : 0),
				mButtonOffsetY + (pressed ? mTranslateY : 0));
		};
		g->mColorizeImages = true;
		g->mColor = mColors[ButtonWidget::COLOR_BKG];
		if (down)
			draw(mDownRect, true);
		else if (mDisabled && mDisabledRect.mWidth)
			draw(mDisabledRect, false);
		else if (mOverAlpha > 0)
		{
			if (mOverAlpha < 1)
				draw(mNormalRect, false);
			g->mColor.mAlpha = mOverAlpha * 255;
			draw(mOverRect, false);
		}
		else
			draw(mIsOver || mIsDown ? mOverRect : mNormalRect, false);
		g->mColorizeImages = false;
		g->mFont = down || mIsOver ? (mHiliteFont ? mHiliteFont : mFont) : mFont;
		g->mColor = mColors[down || mIsOver
			? ButtonWidget::COLOR_LABEL_HILITE : ButtonWidget::COLOR_LABEL];
		g->DrawString(mLabel, fontX + (down ? mTextDownOffsetX : 0),
			fontY + (down ? mTextDownOffsetY : 0));
	}
};
}

NewLawnButton* MakeFixedUIBackButton(int id, ButtonListener* listener, const SexyString& text)
{
	return new FixedUIBackButton(id, listener, text);
}

