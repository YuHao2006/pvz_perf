#pragma once
#include "misc/TimeCounter.h"
#include "ConstEnums.h"
#include "SexyAppFramework/Common.h"
#include "LawnApp.h"

#define MAX_MESSAGE_LENGTH 128
#define MAX_REANIM_LINES 5

class LawnApp;
namespace Sexy
{
	class _Font;
	class Graphics;
}

class MessageWidget
{
public:
	LawnApp*			mApp;									//+0x0
	SexyChar			mLabel[MAX_MESSAGE_LENGTH];				//+0x4
	Sexy::TimeCounter					mDisplayTime;							//+0x84
	std::int64_t        mEndTimeNs; // INT64_MAX means an indefinite message.								//+0x88
	MessageStyle		mMessageStyle;							//+0x8C
	ReanimationID		mTextReanimID[MAX_MESSAGE_LENGTH];		//+0x90
	ReanimationType		mReanimType;							//+0x290
	Sexy::TimeCounter					mSlideOffTime;							//+0x294
	SexyChar			mLabelNext[MAX_MESSAGE_LENGTH];			//+0x298
	MessageStyle		mMessageStyleNext;						//+0x318

public:
	MessageWidget(LawnApp* theApp);
	~MessageWidget();

	/*inline*/ void		SetLabel(const SexyString& theNewLabel, MessageStyle theMessageStyle);
	void				Update();
	void				Draw(Sexy::Graphics* g);
	void				ClearReanim();
	/*inline*/ void		ClearLabel();
	bool                IsBeingDisplayed();
	/*inline*/ _Font*	GetFont();
	void				DrawReanimatedText(Sexy::Graphics* g, Sexy::_Font* theFont, const Sexy::Color& theColor, float thePosY);
	void				LayoutReanimText();
};
