#pragma once
#include "widget/Widget.h"

class LawnApp;

enum ZombatarColorMode
{
	ZOMBATAR_COLOR_SKIN = 0,
	ZOMBATAR_COLOR_HAIR = 1,
	ZOMBATAR_COLOR_BRIGHT = 2,
	ZOMBATAR_COLOR_ITEM_NOT_CHOSEN = 3,
	ZOMBATAR_COLOR_NOT_APPLICABLE = 4
};

class ZombatarColors : public Sexy::Widget
{
public:
	LawnApp* mApp;
	int mColumns;
	int mGap;
	int mColorCount;
	int mPaletteStart;
	int mHoveredColor;
	int mSelectedColor;
	ZombatarColorMode mColorMode;
	bool mSelectionChanged;
	bool mSelectionChangedLastFrame;

	explicit ZombatarColors(LawnApp* theApp);
	~ZombatarColors() override = default;

	void Update() override;
	void Draw(Sexy::Graphics* g) override;
	void MouseMove(int x, int y) override;
	void MouseLeave() override;
	void MouseUp(int x, int y, int theClickCount) override;

	void SetColorMode(ZombatarColorMode theMode, int theSelectedColor);
	int HitTest(int x, int y) const;
};

