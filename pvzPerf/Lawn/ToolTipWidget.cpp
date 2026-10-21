#include "Sexy.TodLib/generated/EntityStrings.h"
#include "Resources.h"
#include "ToolTipWidget.h"
#include "ToolTipLayout.h"
#include "GameConstants.h"
#include "Sexy.TodLib/TodCommon.h"
#include "graphics/Font.h"
#include "Sexy.TodLib/TodStringFile.h"

using namespace Sexy;

ToolTipWidget::ToolTipWidget()
{
	mX = 0;
	mY = 0;
	mWidth = 0;
	mHeight = 0;
	mVisible = 1;
	mCenter = 0;
	mMinLeft = 0;
	mMaxBottom = BOARD_HEIGHT;
	mGetsLinesWidth = 0;
	mWarningFlashCounter = 0;
}

// 1051: 0x51A530; 1073: 0x524C20.
void ToolTipWidget::GetLines(std::vector<SexyString>& theLines)
{
	int aLineWidth = 0;
	unsigned int aIndexStart = 0;
	unsigned int aIndexInLine = 0;

	// 1073 continues at 0x524C60 after consuming a space, even at EOF.
	// Finish only after emitting the pending line, not merely scanning it.
	while (aIndexStart != mLabel.size())
	{
		while (aIndexInLine < mLabel.size() && mLabel[aIndexInLine] != ' ' && mLabel[aIndexInLine] != '\n')
		{
			aLineWidth += FONT_PICO129->CharWidth(mLabel[aIndexInLine]);
			aIndexInLine++;
		}

		if (aIndexInLine != mLabel.size() && aLineWidth < mGetsLinesWidth && mLabel[aIndexInLine] != '\n')
		{
			aLineWidth += FONT_PICO129->CharWidth(mLabel[aIndexInLine]);
			aIndexInLine++;
		}
		else
		{
			SexyString aLine = mLabel.substr(aIndexStart, aIndexInLine - aIndexStart);
			aLineWidth = 0;
			theLines.push_back(std::move(aLine));

			if (aIndexInLine < mLabel.size() && mLabel[aIndexInLine] == '\n')
			{
				aIndexInLine++;
			}
			while (aIndexInLine < mLabel.size() && mLabel[aIndexInLine] == ' ')
			{
				aIndexInLine++;
			}

			aIndexStart = aIndexInLine;
		}
	}
}

//0x51A710
void ToolTipWidget::CalculateSize()
{
	// C++23 第一批·条目7：行数组在此算好缓存（mLines），Draw 直接复用，不再每帧重建
	int aTitleWidth = FONT_TINYBOLD->StringWidth(mTitle);
	int aWarningWidth = FONT_PICO129->StringWidth(mWarningText);
	int aMaxWidth = std::max(aTitleWidth, aWarningWidth);

	mGetsLinesWidth = std::max(aMaxWidth - 30, 100);
	mLines.clear();
	GetLines(mLines);

	for (size_t i = 0; i < mLines.size(); i++)
	{
		int aLineWidth = FONT_PICO129->StringWidth(mLines[i]);
		aMaxWidth = std::max(aMaxWidth, aLineWidth);
	}

	int aHeight = 6;
	if (!mTitle.empty())
	{
		aHeight = FONT_TINYBOLD->mAscent + 8;
	}
	if (!mWarningText.empty())
	{
		aHeight += FONT_TINYBOLD->mAscent + 2;
	}
	aHeight += (int)mLines.size() * FONT_PICO129->mAscent;

	mWidth = aMaxWidth + 10;
	mHeight = aHeight + (int)mLines.size() * 2 - 2;
}

//0x51A8D0
void ToolTipWidget::SetLabel(const SexyString& theLabel)
{
	mLabel = theLabel;
	CalculateSize();
}

//0x51A950
void ToolTipWidget::SetTitle(const SexyString& theTitle)
{
	mTitle = theTitle;
	CalculateSize();
}

//0x51A9D0
void ToolTipWidget::SetWarningText(const SexyString& theWarningText)
{
	mWarningText = theWarningText;
	CalculateSize();
}

//0x51AA50
void ToolTipWidget::Draw(Graphics* g)
{
	if (!mVisible)
		return;
	const int x = ToolTipLayout::LegacyX(mX, mWidth, mCenter, mMinLeft, BOARD_WIDTH, g->mTransX);
	const int y = ToolTipLayout::LegacyY(mY, mHeight, mMaxBottom, g->mTransY);
	DrawAt(g, x, y);
}

void ToolTipWidget::Draw(Graphics* g, const Rect& theLocalBounds)
{
	if (!mVisible)
		return;

	const int x = ToolTipLayout::Position(mX, mWidth, mCenter,
		theLocalBounds.mX, theLocalBounds.mX + theLocalBounds.mWidth);
	const int y = ToolTipLayout::Position(mY, mHeight, false,
		theLocalBounds.mY, theLocalBounds.mY + theLocalBounds.mHeight);
	DrawAt(g, x, y);
}

void ToolTipWidget::DrawAt(Graphics* g, int aPosX, int aPosY)
{
	g->mColor = Color(255, 255, 200, 255);
	g->FillRect(aPosX, aPosY, mWidth, mHeight);
	g->mColor = Color::Black;
	g->DrawRect(aPosX, aPosY, mWidth - 1, mHeight - 1);
	aPosY++;

	if (!mTitle.empty())
	{
		g->mFont = FONT_TINYBOLD;
		g->DrawString(mTitle, aPosX + (mWidth - FONT_TINYBOLD->StringWidth(mTitle)) / 2, aPosY + FONT_TINYBOLD->mAscent);
		aPosY += FONT_TINYBOLD->mAscent + 2;
	}

	if (!mWarningText.empty())
	{
		g->mFont = FONT_PICO129;
		int x = aPosX + (mWidth - FONT_PICO129->StringWidth(mWarningText)) / 2;
		int y = aPosY + FONT_PICO129->mAscent;

		Color aWarningColor(255, 0, 0);
		if (mWarningFlashCounter > 0 && mWarningFlashCounter % 20 < 10)
		{
			aWarningColor = Color(0, 0, 0);
		}

		g->mColor = aWarningColor;
		g->DrawString(mWarningText, x, y);
		g->mColor = Color::Black;

		aPosY += FONT_PICO129->mAscent + 2;
	}

	// 条目7：直接复用 CalculateSize 缓存的行数组（不再每帧重建 vector + substr 分配）
	g->mFont = FONT_PICO129;
	for (size_t i = 0; i < mLines.size(); i++)
	{
		const SexyString& aLine = mLines[i];  // 条目6：引用取代逐行值拷贝
		g->DrawString(aLine, aPosX + (mWidth - FONT_PICO129->StringWidth(aLine)) / 2, aPosY + FONT_PICO129->mAscent);
		aPosY += FONT_PICO129->mAscent + 2;
	}
}
