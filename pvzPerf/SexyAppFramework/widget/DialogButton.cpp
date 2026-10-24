#include "DialogButton.h"
#include "graphics/Font.h"
#include "WidgetManager.h"

using namespace Sexy;

static int gDialogButtonColors[][3] = {
	{255, 255, 255},
	{255, 255, 255},
	{0, 0, 0},
	{255, 255, 255},
	{132, 132, 132},
	{212, 212, 212}};

DialogButton::DialogButton(Image* theComponentImage, int theId, ButtonListener* theListener) :
	ButtonWidget(theId, theListener)
{
	mComponentImage = theComponentImage;

	mTextOffsetX = mTextOffsetY = 0;
	mTranslateX = mTranslateY = 1;
	mDoFinger = true;

	SetColors(gDialogButtonColors, NUM_COLORS);
}

void DialogButton::Draw(Graphics* g)
{
	if (mBtnNoDraw)
		return;

	if (mComponentImage==NULL)
	{
		ButtonWidget::Draw(g);
		return;
	}

	if ((mFont == NULL) && (mLabel.length() > 0))
		throw FontNotConfigured{};

	bool doTranslate = IsButtonDown();

	if (mNormalRegion.mWidth==0)
	{
		if (doTranslate)
			g->Translate(mTranslateX, mTranslateY);

		g->DrawImageBox(Rect(0, 0, mWidth, mHeight), mComponentImage);
	}
	else
	{
		if (mDisabled && (mDisabledRegion.mWidth > 0) && (mDisabledRegion.mHeight > 0))
			g->DrawImageBox(mDisabledRegion, Rect(0, 0, mWidth, mHeight), mComponentImage);
		else if (IsButtonDown())	
			g->DrawImageBox(mDownRegion, Rect(0, 0, mWidth, mHeight), mComponentImage);
		else if ((mOverAlpha > 0))
		{
			if (mOverAlpha<1)
				g->DrawImageBox(mNormalRegion, Rect(0, 0, mWidth, mHeight), mComponentImage);

			g->mColorizeImages = true;
			g->mColor = Color(255,255,255,(int)(mOverAlpha * 255));
			g->DrawImageBox(mOverRegion, Rect(0, 0, mWidth, mHeight), mComponentImage);
			g->mColorizeImages = false;
		}
		else if(mIsOver)
			g->DrawImageBox(mOverRegion, Rect(0, 0, mWidth, mHeight), mComponentImage);
		else
			g->DrawImageBox(mNormalRegion, Rect(0, 0, mWidth, mHeight), mComponentImage);
		
		if (doTranslate)
			g->Translate(mTranslateX, mTranslateY);
	}

	if (mFont != NULL)
	{
		g->mFont = mFont;		

		if (mIsOver)
			g->mColor = mColors[COLOR_LABEL_HILITE];
		else
			g->mColor = mColors[COLOR_LABEL];
		
		int aFontX = (mWidth - mFont->StringWidth(mLabel))/2;
		int aFontY = (mHeight + mFont->mAscent - mFont->mAscentPadding - mFont->mAscent/6 - 1)/2;

		g->DrawString(mLabel, aFontX + mTextOffsetX, aFontY + mTextOffsetY);
	}

	if (doTranslate)
		g->Translate(-mTranslateX, -mTranslateY);
}
