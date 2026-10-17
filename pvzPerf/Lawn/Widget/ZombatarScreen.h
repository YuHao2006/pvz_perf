#pragma once
#include "LawnDialog.h"

class LawnApp;
class Zombie;
class ZombatarItems;

class ZombatarScreen : public LawnDialog
{
public:
	LawnApp* mZombatarApp;
	Zombie* mZombiePreview;
	int mPreviewOffsetX;
	int mPreviewY;
	ZombatarItems* mZombatarItems;

	explicit ZombatarScreen(LawnApp* theApp);
	~ZombatarScreen() override;

	void Update() override;
	void Draw(Graphics* g) override;
	void MouseDown(int x, int y, int theClickCount) override;
	void MouseDown(int x, int y, int theBtnNum, int theClickCount) override;
	void MouseDrag(int x, int y) override;
	void MouseUp(int x, int y, int theBtnNum, int theClickCount) override;
	void AddedToManager(WidgetManager* theWidgetManager) override;
	void RemovedFromManager(WidgetManager* theWidgetManager) override;

	void SetupZombiePreview();
	void ClearZombiePreview();
	void ApplyCurrentZombatar();
	void PrepareToShow();
};

