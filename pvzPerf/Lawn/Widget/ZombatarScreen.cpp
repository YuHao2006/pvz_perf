#include "ZombatarScreen.h"

#include "LawnApp.h"
#include "Resources.h"
#include "Sexy.TodLib/TodCommon.h"
#include "Lawn/Zombie.h"
#include "ZombatarItems.h"
#include "graphics/Graphics.h"
#include "graphics/AtlasDraw.h"
#include "Sexy.TodLib/generated/SceneAtlasData.h"
#include "widget/WidgetManager.h"

namespace
{
	// These are the transparent openings in ZombatarImage::DISPLAY_WINDOW
	// (the image is drawn at 5,0).  Keeping the composition inside the actual
	// openings prevents a portrait/reanimation from leaking through the frame
	// when a source component has an oversized art rectangle.
	constexpr int ZOMBATAR_DISPLAY_INNER_X = 615;
	constexpr int ZOMBATAR_PORTRAIT_INNER_Y = 119;
	constexpr int ZOMBATAR_PORTRAIT_INNER_WIDTH = 134;
	constexpr int ZOMBATAR_PORTRAIT_INNER_HEIGHT = 174;
	constexpr int ZOMBATAR_AVATAR_INNER_Y = 320;
	constexpr int ZOMBATAR_AVATAR_INNER_HEIGHT = 157;
}

ZombatarScreen::ZombatarScreen(LawnApp* theApp) :
	LawnDialog(
		theApp,
		Dialogs::DIALOG_ZOMBATAR,
		true,
		("Zombatar"),
		(""),
		(""),
		Dialog::BUTTONS_NONE),
	mZombatarApp(theApp),
	mZombiePreview(nullptr),
	mPreviewOffsetX(80),
	mPreviewY(350),
	mZombatarItems(nullptr)
{
	// Almanac ground art is shared with the zombie preview.
	// The Zombatar atlas is already resident from application loading.
	TodLoadResources(ResourceGroupId::DelayLoad_Almanac);
	mDrawStandardBack = false;
	LawnDialog::Resize(0, 0, BOARD_WIDTH, BOARD_HEIGHT);

	mZombatarItems = new ZombatarItems(mZombatarApp);
	AddWidget(mZombatarItems);
}

ZombatarScreen::~ZombatarScreen()
{
	ClearZombiePreview();
	if (mZombatarItems && mZombatarItems->mParent == this)
		RemoveWidget(mZombatarItems);
	delete mZombatarItems;
	mZombatarItems = nullptr;
}

void ZombatarScreen::SetupZombiePreview()
{
	if (mZombiePreview)
	{
		ApplyCurrentZombatar();
		return;
	}
	mZombiePreview = new Zombie();
	// The 1073 UI creates this preview outside a board.  Zombie's base
	// constructor inherits the current board pointer, so clear it before
	// ZombieInitialize to keep board-only positioning logic disabled.
	mZombiePreview->mBoard = nullptr;
	mZombiePreview->ZombieInitialize(
		0,
		// 1073 constructs the dedicated Zombatar flag-zombie type here. It keeps
		// the flag attachment while exposing the extra custom-head render groups.
		ZombieType::ZOMBIE_ZOMBATAR,
		false,
		nullptr,
		Zombie::ZOMBIE_WAVE_UI);
	// Original 1073 (FUN_00531b50): the preview lives in the right-hand
	// panel. items+0x48 is the panel width (560), so the zombie sits at
	// (560+80, 350) = (640,350), next to the frame drawn at (600,300).
	mZombiePreview->mX = mZombatarItems->mWidth + mPreviewOffsetX;
	mZombiePreview->mY = mPreviewY;
	mZombiePreview->mRootBindingGeneration = 0;
	ApplyCurrentZombatar();
}

void ZombatarScreen::ClearZombiePreview()
{
	if (!mZombiePreview)
		return;

	// LawnApp::Shutdown disposes the effect system before the top-level widget
	// tree is destroyed.  The normal zombie death path removes reanimations and
	// attachments through that system, so calling it after shutdown dereferences
	// an already released holder.  The preview is only an owned UI object; once
	// the effect system is gone, discard its effect IDs and let the object die.
	if (mZombatarApp && mZombatarApp->mEffectSystem)
	{
		mZombiePreview->DieNoLoot();
	}
	else
	{
		mZombiePreview->mAttachmentID = AttachmentID::ATTACHMENTID_NULL;
	}
	delete mZombiePreview;
	mZombiePreview = nullptr;
}

void ZombatarScreen::ApplyCurrentZombatar()
{
	if (!mZombiePreview || !mZombatarItems)
		return;
	Zombatar& aZombatar = mZombatarItems->mZombatar;
	mZombiePreview->ApplyZombatarHead(mZombatarApp, &aZombatar);
}

void ZombatarScreen::PrepareToShow()
{
	if (mZombatarItems)
		mZombatarItems->EnterInitialState();
	if (mWidgetManager)
		SetupZombiePreview();
}

void ZombatarScreen::Update()
{
	LawnDialog::Update();
	if (mZombiePreview)
	{
		mZombiePreview->Update();
		if (mZombatarItems && mZombatarItems->HasVisualSelectionChanged())
			ApplyCurrentZombatar();
	}
	MarkDirty();
}

void ZombatarScreen::DrawBackground(Graphics* g)
{
    // The adjacent main-menu art overlaps this background and is painted above it.
    DrawZombatarImage(g, ZombatarImage::MAIN_BG, 0, 0);
}

void ZombatarScreen::Draw(Graphics* g)
{
	if (g->mClipRect.mWidth <= 0 || g->mClipRect.mHeight <= 0)
		return;

	if (mZombiePreview)
	{
		// 1073 DAT_00726ec4 is IMAGE_ALMANAC_GROUNDDAY (resource-table index
		// 606), a 200x200 image drawn at (600,300).  The same temporary clip
		// must cover both the background and the Zombie reanimation; clipping
		// only the background still lets the flag zombie leak below the frame.
		GraphicsAutoState aAvatarState(g);
		g->ClipRect(
			ZOMBATAR_DISPLAY_INNER_X,
			ZOMBATAR_AVATAR_INNER_Y,
			ZOMBATAR_PORTRAIT_INNER_WIDTH,
			ZOMBATAR_AVATAR_INNER_HEIGHT);
		if (AlmanacAtlas::Texture)
		{
			const Sexy::TextureSource texture{AlmanacAtlas::Texture, AlmanacAtlas::Width, AlmanacAtlas::Height};
			Sexy::DrawAtlasImage(g, texture,
				AlmanacAtlas::Images[size_t(AlmanacAtlas::Sprite::ALMANAC_GROUNDDAY)], 600, 300);
		}

		// FUN_00531c50 constructs a child Graphics and draws the Zombie through
		// its normal GameObject anchor path.  ZOMBIE_ZOMBATAR creates the
		// attached Zombie_flag reanimation internally.
		Graphics aZombieGraphics(*g);
		if (mZombiePreview->BeginDraw(&aZombieGraphics))
		{
			mZombiePreview->Draw(&aZombieGraphics);
			mZombiePreview->EndDraw(&aZombieGraphics);
		}
	}

	// FUN_00531c50 draws the flat portrait in the right-hand panel as well.
	// The original coordinates use the selector widget's width, not its x
	// origin; using mX here moves the portrait into the editor panel.
	if (mZombatarItems)
	{
		const int aPortraitX = mZombatarItems->mWidth + 32;
		const int aPortraitY = mZombatarItems->mY + 90;
		// The original clips the portrait to the right panel before calling
		// FUN_00530970.  The panel-bound clip used by the old port ended at the
		// logical screen bounds, which let oversized portrait components extend
		// below the PORTRAIT frame.  Use the opening of the frame itself.
		GraphicsAutoState aState(g);
		g->ClipRect(
			ZOMBATAR_DISPLAY_INNER_X,
			ZOMBATAR_PORTRAIT_INNER_Y,
			ZOMBATAR_PORTRAIT_INNER_WIDTH,
			ZOMBATAR_PORTRAIT_INNER_HEIGHT);
		DrawZombatarPortrait(
			g,
			mZombatarItems->mZombatar,
			aPortraitX,
			aPortraitY);
	}

	// The display window is drawn last in the original so its border remains
	// above the portrait and preview contents.
	DrawZombatarImage(g, ZombatarImage::DISPLAY_WINDOW, 5, 0);
}

// ZombatarScreen is a full-screen page, not a draggable popup dialog. Without
// these overrides the inherited Dialog::MouseDown/Drag would move the whole
// page when clicking the preview area, exposing the black selector backdrop
// (only clouds remain visible).
void ZombatarScreen::MouseDown(int x, int y, int theClickCount)
{
	Widget::MouseDown(x, y, theClickCount);
}

void ZombatarScreen::MouseDown(int x, int y, int theBtnNum, int theClickCount)
{
	// ZombatarScreen is a selector page, not a movable Dialog.  Dialog's
	// four-argument overload is the one that starts mDragging and switches to
	// the Windows drag cursor, so overriding only the three-argument wrapper
	// is insufficient.
	Widget::MouseDown(x, y, theBtnNum, theClickCount);
}

void ZombatarScreen::MouseDrag(int x, int y)
{
	(void)x;
	(void)y;
}

void ZombatarScreen::MouseUp(int x, int y, int theBtnNum, int theClickCount)
{
	Widget::MouseUp(x, y, theBtnNum, theClickCount);
}

void ZombatarScreen::AddedToManager(WidgetManager* theWidgetManager)
{
	LawnDialog::AddedToManager(theWidgetManager);
	if (!mZombiePreview)
		SetupZombiePreview();
	else
		ApplyCurrentZombatar();
}

void ZombatarScreen::RemovedFromManager(WidgetManager* theWidgetManager)
{
    if (mZombatarItems)
        mZombatarItems->CancelDeleteDialog();
    LawnDialog::RemovedFromManager(theWidgetManager);
}
