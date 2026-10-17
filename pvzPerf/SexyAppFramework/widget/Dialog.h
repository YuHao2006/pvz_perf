#pragma once
#include "Widget.h"
#include "ButtonListener.h"

namespace Sexy
{

class DialogListener;
class ButtonWidget;
class DialogButton;
class _Font;


typedef std::vector<std::string> StringVector;

class Dialog : public Widget, public ButtonListener
{
public:
	enum
	{
		BUTTONS_NONE,
		BUTTONS_YES_NO,
		BUTTONS_OK_CANCEL,
		BUTTONS_FOOTER
	};

	enum
	{
		ID_YES		= 1000,
		ID_NO		= 1001,
		ID_OK		= 1000,
		ID_CANCEL	= 1001,
		ID_FOOTER	= 1000
	};
	
	enum
	{
		COLOR_HEADER = 0,
		COLOR_LINES,
		COLOR_FOOTER,
		COLOR_BUTTON_TEXT,
		COLOR_BUTTON_TEXT_HILITE,
		COLOR_BKG,
		COLOR_OUTLINE,		
		NUM_COLORS
	};

	DialogListener*			mDialogListener;
	Image*					mComponentImage;	
	DialogButton*			mYesButton;
	DialogButton*			mNoButton;
	int						mNumButtons;
	
	SexyString				mDialogHeader;
	SexyString				mDialogFooter;
	SexyString				mDialogLines;

	// Classic layout/registration mode; subclasses may supply child buttons with NONE.
	int						mButtonMode;
	_Font*					mHeaderFont;
	_Font*					mLinesFont;	
	int						mTextAlign;
	int						mLineSpacingOffset;
	int						mButtonHeight;
	Insets					mBackgroundInsets;
	Insets					mContentInsets;
	int						mSpaceAfterHeader;
	bool					mDragging;
	int						mDragMouseX;
	int						mDragMouseY;
	int						mId;
	bool					mIsModal;
	int						mResult;	

	int						mButtonHorzSpacing;
	int						mButtonSidePadding;
	// Opt-in for modal callers that must preserve the manager's live focus
	// restoration rather than the game's usual Board/selector fallback.
	bool                    mRestoreFocusFromModalStack = false;
	

public:
	void					EnsureFonts();

public:
	Dialog(Image* theComponentImage, Image* theButtonComponentImage, 
		int theId, bool isModal, const SexyString& theDialogHeader, const SexyString& theDialogLines, const SexyString& theDialogFooter, int theButtonMode); //UNICODE

	virtual ~Dialog();

	virtual void			SetButtonFont(_Font* theFont);
	virtual void			SetHeaderFont(_Font* theFont);
	virtual void			SetLinesFont(_Font* theFont);

	virtual void			SetColor(int theIdx, const Color& theColor);
	virtual int				GetPreferredHeight(int theWidth);

	virtual void			Draw(Graphics* g);
	virtual void			AddedToManager(WidgetManager* theWidgetManager);
	virtual void			RemovedFromManager(WidgetManager* theWidgetManager);
	virtual void			OrderInManagerChanged();
	virtual void			Resize(int theX, int theY, int theWidth, int theHeight);

	virtual void			MouseDown(int x, int y, int theClickCount) { Widget::MouseDown(x, y, theClickCount); }
	virtual void			MouseDown(int x, int y, int theBtnNum, int theClickCount);
	virtual void			MouseDrag(int x, int y);
	virtual void			MouseUp(int x, int y) { Widget::MouseUp(x, y); }
	virtual void			MouseUp(int x, int y, int theClickCount) { Widget::MouseUp(x, y, theClickCount); }
	virtual void			MouseUp(int x, int y, int theBtnNum, int theClickCount);
	virtual void			Update();
	virtual int				WaitForResult(bool autoKill = true);

	virtual void			ButtonPress(int theId);
	virtual void			ButtonDepress(int theId);
	virtual void			ButtonDownTick(int){}
	virtual void			ButtonMouseEnter(int){}
	virtual void			ButtonMouseLeave(int){}
	virtual void			ButtonMouseMove(int, int, int){}
};

}

