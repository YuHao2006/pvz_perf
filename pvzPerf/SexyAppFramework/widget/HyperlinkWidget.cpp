#include "HyperlinkWidget.h"
#include "graphics/Graphics.h"
#include "graphics/ImageFont.h"
#include "graphics/Font.h"
#include "WidgetManager.h"

using namespace Sexy;

HyperlinkWidget::HyperlinkWidget(int theId, ButtonListener* theButtonListener) :
	ButtonWidget(theId, theButtonListener),
	mColor(255, 255, 255),
	mOverColor(255, 255, 255)
{	
	mDoFinger = true;
	mUnderlineOffset = 3;
	mUnderlineSize = 1;
}

void HyperlinkWidget::Draw(Graphics* g)
{
	if (mFont == NULL)
		throw FontNotConfigured{};

	int aFontX = (mWidth - mFont->StringWidth(mLabel))/2;
	int aFontY = (mHeight + mFont->mAscent)/2 - 1;

	if (mIsOver)
		g->mColor = mOverColor;
	else
		g->mColor = mColor;

	g->mFont = mFont;	
	g->DrawString(mLabel, aFontX, aFontY);

	for (int i = 0; i < mUnderlineSize; i++)
		g->FillRect(aFontX, aFontY+mUnderlineOffset+i, mFont->StringWidth(mLabel), 1);
}

void HyperlinkWidget::MouseEnter()
{
	ButtonWidget::MouseEnter();

	MarkDirtyFull();
}

void HyperlinkWidget::MouseLeave()
{
	ButtonWidget::MouseLeave();

	MarkDirtyFull();
}