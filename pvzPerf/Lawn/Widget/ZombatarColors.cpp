#include "Sexy.TodLib/generated/EntityStrings.h"
#include "ZombatarColors.h"

#include "LawnApp.h"
#include "Resources.h"
#include "Sexy.TodLib/TodCommon.h"
#include "Sexy.TodLib/TodStringFile.h"
#include "ZombatarItems.h"

using namespace Sexy;

namespace
{
constexpr int COLOR_PICKER_X = 23;
constexpr int COLOR_PICKER_Y = 32;
constexpr int COLOR_PICKER_GAP = 4;

bool IsPaletteMode(ZombatarColorMode theMode)
{
	return theMode == ZOMBATAR_COLOR_SKIN ||
		theMode == ZOMBATAR_COLOR_HAIR ||
		theMode == ZOMBATAR_COLOR_BRIGHT;
}
}

ZombatarColors::ZombatarColors(LawnApp* theApp) :
	mApp(theApp),
	mColumns(9),
	mGap(COLOR_PICKER_GAP),
	mColorCount(0),
	mPaletteStart(-1),
	mHoveredColor(-1),
	mSelectedColor(-1),
	mColorMode(ZOMBATAR_COLOR_NOT_APPLICABLE),
	mSelectionChanged(false),
	mSelectionChangedLastFrame(false)
{
	Resize(190, 310, gZombatarAtlas.mImages[static_cast<size_t>(ZombatarImage::COLORS_BG)].mWidth, gZombatarAtlas.mImages[static_cast<size_t>(ZombatarImage::COLORS_BG)].mHeight);
	SetColorMode(ZOMBATAR_COLOR_NOT_APPLICABLE, -1);
}

void ZombatarColors::Update()
{
	Widget::Update();
	mSelectionChangedLastFrame = mSelectionChanged;
	mSelectionChanged = false;
}

void ZombatarColors::Draw(Graphics* g)
{
	DrawZombatarImage(g, ZombatarImage::COLORS_BG, 6, 0);

	if (!IsPaletteMode(mColorMode))
	{
		const SexyString& aLabel =
			mColorMode == ZOMBATAR_COLOR_ITEM_NOT_CHOSEN
				? gStr.ZOMBATAR_COLOR_ITEM_NOT_CHOSEN
				: gStr.ZOMBATAR_COLOR_NOT_APPLICABLE;
		TodDrawStringWrapped(
			g,
			aLabel,
			Rect(25, 45, mWidth - 40, mHeight - 45),
			FONT_BRIANNETOD12,
			Color::White,
			DrawStringJustification::DS_ALIGN_CENTER);
		return;
	}

	g->mColorizeImages = true;
	for (int anOffset = 0; anOffset < mColorCount; ++anOffset)
	{
		const int aColorIndex = mPaletteStart + anOffset;
		const int aColumn = anOffset % mColumns;
		const int aRow = anOffset / mColumns;
		const int aX = COLOR_PICKER_X + aColumn * (gZombatarAtlas.mImages[static_cast<size_t>(ZombatarImage::COLORPICKER)].mWidth + mGap);
		const int aY = COLOR_PICKER_Y + aRow * (gZombatarAtlas.mImages[static_cast<size_t>(ZombatarImage::COLORPICKER)].mHeight + mGap);

		Color aColor = ZombatarGetColor(aColorIndex);
		aColor.mAlpha = aColorIndex == mSelectedColor
			? 255
			: aColorIndex == mHoveredColor ? 128 : 64;
		g->mColor = aColor;
		DrawZombatarImage(g,
			aColorIndex == 29 || aColorIndex == 47
				? ZombatarImage::COLORPICKER_NONE
				: ZombatarImage::COLORPICKER,
			aX,
			aY);
	}
	g->mColorizeImages = false;
}

void ZombatarColors::MouseMove(int x, int y)
{
	mHoveredColor = HitTest(x, y);
}

void ZombatarColors::MouseLeave()
{
	mHoveredColor = -1;
}

void ZombatarColors::MouseUp(int x, int y, int theClickCount)
{
	(void)theClickCount;
	const int aColor = HitTest(x, y);
	if (aColor == -1)
		return;

	mSelectedColor = aColor;
	mSelectionChanged = true;
}


void ZombatarColors::SetColorMode(ZombatarColorMode theMode, int theSelectedColor)
{
	// ZombatarColors::SetColorMode 调色板区间表（B 形态手工迁移）：调色板模式 ->
	//（起始色, 颜色数）；后两行 = 原 default（-1, 0，非调色板模式）。行序 =
	// ZombatarColorMode 枚举序（0..4，全覆盖），逐槽对照原 switch 0 差异。
	struct ZombatarPaletteRange
	{
	int mStart;
	int mCount;
	};
	static constexpr ZombatarPaletteRange kZombatarPaletteRange[5] = {
	{0, 12},   // 0 ZOMBATAR_COLOR_SKIN
	{12, 18},  // 1 ZOMBATAR_COLOR_HAIR
	{30, 18},  // 2 ZOMBATAR_COLOR_BRIGHT
	{-1, 0},   // 3 ZOMBATAR_COLOR_ITEM_NOT_CHOSEN（原 default）
	{-1, 0},   // 4 ZOMBATAR_COLOR_NOT_APPLICABLE（原 default）
	};
	static_assert(sizeof(kZombatarPaletteRange) / sizeof(kZombatarPaletteRange[0]) == 5,
	"kZombatarPaletteRange 槽位须与 ZombatarColorMode 枚举同步");

	mColorMode = theMode;
	mHoveredColor = -1;
	mSelectedColor = theSelectedColor;

	// B 形态 -> 常量表（见上 kZombatarPaletteRange）：调色板模式取（起始色,
	// 颜色数）；越界（非法枚举值）落 NOT_APPLICABLE 行 = 原 default。
	const ZombatarPaletteRange& aRange =
		static_cast<unsigned>(mColorMode) < static_cast<unsigned>(5)
			? kZombatarPaletteRange[static_cast<int>(mColorMode)]
			: kZombatarPaletteRange[ZOMBATAR_COLOR_NOT_APPLICABLE];
	mPaletteStart = aRange.mStart;
	mColorCount = aRange.mCount;
}

int ZombatarColors::HitTest(int x, int y) const
{
	if (!IsPaletteMode(mColorMode))
		return -1;

	for (int anOffset = 0; anOffset < mColorCount; ++anOffset)
	{
		const int aColumn = anOffset % mColumns;
		const int aRow = anOffset / mColumns;
		const Rect aRect(
			COLOR_PICKER_X + aColumn * (gZombatarAtlas.mImages[static_cast<size_t>(ZombatarImage::COLORPICKER)].mWidth + mGap),
			COLOR_PICKER_Y + aRow * (gZombatarAtlas.mImages[static_cast<size_t>(ZombatarImage::COLORPICKER)].mHeight + mGap),
			gZombatarAtlas.mImages[static_cast<size_t>(ZombatarImage::COLORPICKER)].mWidth,
			gZombatarAtlas.mImages[static_cast<size_t>(ZombatarImage::COLORPICKER)].mHeight);
		if (aRect.Contains(x, y))
			return mPaletteStart + anOffset;
	}
	return -1;
}
