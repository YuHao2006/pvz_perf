#include "Sexy.TodLib/generated/EntityStrings.h"
#include "Board.h"
#include "Challenge.h"
#include "LawnApp.h"
#include "Resources.h"
#include "MessageWidget.h"
#include "graphics/Font.h"
#include "Sexy.TodLib/TodCommon.h"
#include "Sexy.TodLib/Reanimator.h"
#include "Sexy.TodLib/TodStringFile.h"
#include <cstdlib>
#include <cstring>

namespace
{
void CopyMessageLabel(SexyChar (&theDestination)[MAX_MESSAGE_LENGTH], const SexyString& theLabel)
{
	size_t aLineCount = 1;
	for (SexyChar aChar : theLabel)
	{
		if (aChar == ('\n'))
			++aLineCount;
	}

	if (theLabel.size() >= MAX_MESSAGE_LENGTH || aLineCount > MAX_REANIM_LINES)
	{
		TodAssertFailed(
			"message label fits its fixed storage",
			__FILE__,
			__LINE__,
			"translated message has %zu bytes and %zu lines (limits: %d bytes, %d lines)",
			theLabel.size(),
			aLineCount,
			MAX_MESSAGE_LENGTH - 1,
			MAX_REANIM_LINES);
		std::abort();
	}

	std::memcpy(theDestination, theLabel.c_str(), theLabel.size() + 1);
}
}

// C++23 第一批·条目5：mLabel 的 SexyString 镜像（Draw 传引用，避免每帧 2-3 次 char[128]→string 隐式临时）。
// 注：文件域缓存而非 MessageWidget 成员——其布局被存档层锁定（SaveGame static_assert(sizeof==800)
// + ClearNativeObject 会 memset 整对象）；存档载入直改 mLabel 不经 SetLabel，故按内容 compare 自动失效。
namespace
{
const MessageWidget* gLabelStrOwner = nullptr;
SexyString gLabelStr;
}

//(0x4081F1)
MessageWidget::MessageWidget(LawnApp* theApp)
{
	mApp = theApp;
	mDuration = 0;
	mDisplayTime = 0;
	mLabel[0] = ('\0');
	mMessageStyle = MessageStyle::MESSAGE_STYLE_OFF;
	mLabelNext[0] = ('\0');
	mMessageStyleNext = MessageStyle::MESSAGE_STYLE_OFF;
	mSlideOffTime = 100;
	mReanimType = ReanimationType::REANIM_NONE;
	std::fill(std::begin(mTextReanimID), std::end(mTextReanimID), ReanimationID::REANIMATIONID_NULL);
}

//0x458FC0
void MessageWidget::ClearReanim()
{
	for (int i = 0; i < MAX_MESSAGE_LENGTH; i++)
	{
		Reanimation* aReanim = mApp->ReanimationTryToGet(mTextReanimID[i]);
		if (aReanim)
		{
			aReanim->ReanimationDie();
			mTextReanimID[i] = ReanimationID::REANIMATIONID_NULL;
		}
	}
}

void MessageWidget::ClearLabel()
{
	if (mReanimType != ReanimationType::REANIM_NONE)
	{
		mDuration = std::min<Sexy::TimeCounter>(mDuration, 100 + mSlideOffTime + 1);
	}
	else
	{
		mDuration = 0;
	}
}


//0x459010
// GOTY @Patoke: inlined 0x459715
void MessageWidget::SetLabel(const SexyString& theNewLabel, MessageStyle theMessageStyle)
{
	// MessageWidget::SetLabel 时长表：表内匿名 lambda = 原 case 体逐句迁移
	//（生成器 + 逆变换 token 对拍 0 差异）；HUGE_WAVE 双效（时长+文字淡出
	// reanim）随体迁移；default 具名并被缺槽/越界复用。
	using MessageDurationCaseFn = void (*)(MessageWidget&, int);

	// 标签共体（匿名 lambda 无法跨槽复用，复用即具名）
	// 原 case MESSAGE_STYLE_HINT_LONG, MESSAGE_STYLE_BIG_MIDDLE, MESSAGE_STYLE_ZEN_GARDEN_LONG, MESSAGE_STYLE_HINT_TALL_LONG
	static constexpr auto MsgDurationMessageStyleHintLong = [](MessageWidget& w, int theMessageStyle)
	{
	w.mDuration = 1500;
	};

	// 标签共体（匿名 lambda 无法跨槽复用，复用即具名）
	// 原 case MESSAGE_STYLE_HINT_FAST, MESSAGE_STYLE_HINT_TALL_FAST, MESSAGE_STYLE_BIG_MIDDLE_FAST, MESSAGE_STYLE_TUTORIAL_LEVEL1, MESSAGE_STYLE_TUTORIAL_LEVEL2, MESSAGE_STYLE_TUTORIAL_LATER
	static constexpr auto MsgDurationMessageStyleHintFast = [](MessageWidget& w, int theMessageStyle)
	{
	w.mDuration = 500;
	};

	// 标签共体（匿名 lambda 无法跨槽复用，复用即具名）
	// 原 case MESSAGE_STYLE_HINT_STAY, MESSAGE_STYLE_TUTORIAL_LEVEL1_STAY, MESSAGE_STYLE_TUTORIAL_LATER_STAY
	static constexpr auto MsgDurationMessageStyleHintStay = [](MessageWidget& w, int theMessageStyle)
	{
	w.mDuration = 10000;
	};

	// 原 default（无 case 的 1 型与表外哨兵共用）
	static constexpr auto MsgDurationDefault = [](MessageWidget& w, int theMessageStyle)
	{
	TOD_ASSERT(false);
	};

	// 匿名 lambda 函数指针表，行序 = MessageStyle 枚举值序（0..18）。
	static constexpr MessageDurationCaseFn kMessageDurations[(int)MessageStyle::MESSAGE_STYLE_ACHIEVEMENT + 1] = {
	MsgDurationDefault,  // 0 MESSAGE_STYLE_OFF（原 default）
	MsgDurationMessageStyleHintFast,  // 1 MESSAGE_STYLE_TUTORIAL_LEVEL1（共体）
	MsgDurationMessageStyleHintStay,  // 2 MESSAGE_STYLE_TUTORIAL_LEVEL1_STAY（共体）
	MsgDurationMessageStyleHintFast,  // 3 MESSAGE_STYLE_TUTORIAL_LEVEL2（共体）
	MsgDurationMessageStyleHintFast,  // 4 MESSAGE_STYLE_TUTORIAL_LATER（共体）
	MsgDurationMessageStyleHintStay,  // 5 MESSAGE_STYLE_TUTORIAL_LATER_STAY（共体）
	MsgDurationMessageStyleHintLong,  // 6 MESSAGE_STYLE_HINT_LONG（共体）
	MsgDurationMessageStyleHintFast,  // 7 MESSAGE_STYLE_HINT_FAST（共体）
	MsgDurationMessageStyleHintStay,  // 8 MESSAGE_STYLE_HINT_STAY（共体）
	MsgDurationMessageStyleHintFast,  // 9 MESSAGE_STYLE_HINT_TALL_FAST（共体）
	// 原 case MESSAGE_STYLE_HINT_TALL_UNLOCKMESSAGE
	[](MessageWidget& w, int theMessageStyle)
	{
	w.mDuration = 500;
	},  // 10 MESSAGE_STYLE_HINT_TALL_UNLOCKMESSAGE
	MsgDurationMessageStyleHintLong,  // 11 MESSAGE_STYLE_HINT_TALL_LONG（共体）
	MsgDurationMessageStyleHintLong,  // 12 MESSAGE_STYLE_BIG_MIDDLE（共体）
	MsgDurationMessageStyleHintFast,  // 13 MESSAGE_STYLE_BIG_MIDDLE_FAST（共体）
	// 原 case MESSAGE_STYLE_HOUSE_NAME
	[](MessageWidget& w, int theMessageStyle)
	{
	w.mDuration = 250;
	},  // 14 MESSAGE_STYLE_HOUSE_NAME
	// 原 case MESSAGE_STYLE_HUGE_WAVE
	[](MessageWidget& w, int theMessageStyle)
	{
	w.mDuration = 750;
	w.mReanimType = ReanimationType::REANIM_TEXT_FADE_ON;
	},  // 15 MESSAGE_STYLE_HUGE_WAVE
	// 原 case MESSAGE_STYLE_SLOT_MACHINE
	[](MessageWidget& w, int theMessageStyle)
	{
	w.mDuration = 750;
	},  // 16 MESSAGE_STYLE_SLOT_MACHINE
	MsgDurationMessageStyleHintLong,  // 17 MESSAGE_STYLE_ZEN_GARDEN_LONG（共体）
	// 原 case MESSAGE_STYLE_ACHIEVEMENT
	[](MessageWidget& w, int theMessageStyle)
	{
	// @Patoke: implemented
	w.mDuration = 250;
	},  // 18 MESSAGE_STYLE_ACHIEVEMENT
	};
	static_assert(sizeof(kMessageDurations) / sizeof(kMessageDurations[0]) ==
	(int)MessageStyle::MESSAGE_STYLE_ACHIEVEMENT + 1, "kMessageDurations 槽位数须与 MessageStyle 枚举同步");

	SexyString aLabel = theNewLabel;

	if (mReanimType != ReanimationType::REANIM_NONE && mDuration > 0)
	{
		mMessageStyleNext = theMessageStyle;
		CopyMessageLabel(mLabelNext, aLabel);
		ClearLabel();
	}
	else
	{
		ClearReanim();
		CopyMessageLabel(mLabel, aLabel);
		mMessageStyle = theMessageStyle;
		mReanimType = ReanimationType::REANIM_NONE;

		// C 形态 -> 匿名 lambda 函数指针表：行序 = MessageStyle 枚举序（0..18，
		// 无 NUM 哨兵=末值 ACHIEVEMENT 锚定）；default（TOD_ASSERT）具名并被
		// 缺槽/越界复用。
		const unsigned aStyleIndex = static_cast<unsigned>(theMessageStyle);
		if (aStyleIndex <= static_cast<unsigned>(MessageStyle::MESSAGE_STYLE_ACHIEVEMENT))
		{
			kMessageDurations[aStyleIndex](*this, (int)theMessageStyle);
		}
		else
		{
			MsgDurationDefault(*this, (int)theMessageStyle);
		}

		
		if (mReanimType != ReanimationType::REANIM_NONE)
		{
			LayoutReanimText();
		}
		mDisplayTime = mDuration;
	}
}

//0x4591E0
void MessageWidget::LayoutReanimText()
{
	float aMaxWidth = 0;
	int aCurLine = 0, aCurPos = 0;
	_Font* aFont = GetFont();
	int aLabelLen = sexystrlen(mLabel);
	mSlideOffTime = aLabelLen + 100;

	float aLineWidth[MAX_REANIM_LINES];
	for (int aPos = 0; aPos <= aLabelLen; aPos++)
	{
		if (aPos == aLabelLen || mLabel[aPos] == ('\n'))
		{
			TOD_ASSERT(aCurLine < MAX_REANIM_LINES);

			int aLen = aPos - aCurPos;
			int aOff = aCurPos;
			aCurPos = aPos + 1;
			SexyString aLine(&mLabel[aOff], aLen);
			
			aLineWidth[aCurLine] = aFont->StringWidth(aLine);
			aMaxWidth = std::max(aMaxWidth, aLineWidth[aCurLine]);
			aCurLine++;
		}
	}

	aCurLine = 0;
	float aCurPosY = 0.0f;
	float aCurPosX = -aLineWidth[0] * 0.5f;
	// 以下遍历字幕中的所有文本，分别在适当的位置创建每一个文字的动画
	for (int aPos = 0; aPos < aLabelLen; aPos++)
	{
		// 创建文字的动画
		Reanimation* aReanimText = mApp->AddReanimation(aCurPosX, aCurPosY, 0, mReanimType);
		aReanimText->mIsAttachment = true;
		aReanimText->PlayReanim(ReanimTrackId::anim_enter, ReanimLoopType::REANIM_PLAY_ONCE_AND_HOLD, 0.0f, 0.0f);
		mTextReanimID[aPos] = mApp->ReanimationGetID(aReanimText);

		aCurPosX += aFont->CharWidth(mLabel[aPos]);  // 坐标调整至下一个文字的位置
		if (mLabel[aPos] == ('\n'))  // 换行处理
		{
			aCurLine++;
			TOD_ASSERT(aCurLine < MAX_REANIM_LINES);
			aCurPosX = -aLineWidth[aCurLine] * 0.5f;
			aCurPosY += aFont->GetLineSpacing();
		}
	}
}

//0x4594B0
void MessageWidget::Update()
{
	if (!mApp->mBoard || mApp->mBoard->mPaused)
		return;

	// 更新字幕的剩余时间倒计时和下一轮字幕的切换
	if (mDuration < 10000 && mDuration > 0)
	{
		mDuration--;
		if (mDuration == 0)
		{
			mMessageStyle = MessageStyle::MESSAGE_STYLE_OFF;
			if (mMessageStyleNext != MessageStyle::MESSAGE_STYLE_OFF)
			{
				SetLabel(mLabelNext, mMessageStyleNext);
				mMessageStyleNext = MessageStyle::MESSAGE_STYLE_OFF;
			}
		}
	}

	int aLabelLen = sexystrlen(mLabel);
	// 以下遍历每个文字的动画，设置其动画速率并更新其动画
	for (int aPos = 0; aPos < aLabelLen; aPos++)
	{
		Reanimation* aTextReanim = mApp->ReanimationTryToGet(mTextReanimID[aPos]);
		if (aTextReanim == nullptr)
		{
			break;  // 当不存在文本动画时，跳出循环，直接返回
		}

		// 设置动画速率
		int aTextSpeed = mReanimType == ReanimationType::REANIM_TEXT_FADE_ON ? 100 : 1;
		if (mDuration > mSlideOffTime)
		{
			if (mReanimType == ReanimationType::REANIM_TEXT_FADE_ON)
			{
				aTextReanim->ApplyRate(60.0f);
			}
			else
			{
				aTextReanim->ApplyRate(TodAnimateCurveNs(0, 500'000'000,
					(mDisplayTime.mNanoseconds - mDuration.mNanoseconds) * aTextSpeed -
						std::int64_t(aPos) * 10'000'000, 0.0f, 40.0f, Curves::Linear));
			}
		}
		else
		{
			if (mDuration == mSlideOffTime)
			{
				aTextReanim->PlayReanim(ReanimTrackId::anim_leave, ReanimLoopType::REANIM_PLAY_ONCE_AND_HOLD, 0, 0.0f);
			}
			aTextReanim->ApplyRate(TodAnimateCurveNs(0, 500'000'000,
				(mSlideOffTime.mNanoseconds - mDuration.mNanoseconds) * aTextSpeed -
					std::int64_t(aPos) * 10'000'000, 0.0f, 40.0f, Curves::Linear));
		}

		aTextReanim->Update();  //更新动画
	}
}

//0x459710
void MessageWidget::DrawReanimatedText(Graphics* g, _Font* theFont, const Color& theColor, float thePosY)
{
	int aLabelLen = sexystrlen(mLabel);
	for (int aPos = 0; aPos < aLabelLen; aPos++)
	{
		Reanimation* aTextReanim = mApp->ReanimationTryToGet(mTextReanimID[aPos]);
		if (aTextReanim == nullptr)
		{
			break;  // 当不存在文本动画时，跳出循环，直接返回
		}

		ReanimatorTransform aTransform;
		aTextReanim->GetCurrentTransform(2, &aTransform);

		int anAlpha = ClampInt(FloatRoundToInt(theColor.mAlpha * aTransform.mAlpha), 0, 255);
		if (anAlpha <= 0)
		{
			break;  // 文本动画完全透明时，直接返回
		}
		Color aFinalColor(theColor);
		aFinalColor.mAlpha = anAlpha;

		aTransform.mTransX += aTextReanim->mOverlayMatrix.m02;
		aTransform.mTransY += aTextReanim->mOverlayMatrix.m12 + thePosY - BOARD_HEIGHT / 2;
		if (mReanimType == ReanimationType::REANIM_TEXT_FADE_ON && mDisplayTime - mDuration < mSlideOffTime)
		{
			float aStretch = 1.0f - static_cast<float>(static_cast<double>(aTextReanim->SamplePlayback().clock) / (aTextReanim->mFrameCount * ReanimClock::Frame));
			aTransform.mTransX += aStretch * aTextReanim->mOverlayMatrix.m02;
		}

		SexyMatrix3 aMatrix;
		Reanimation::MatrixFromTransform(aTransform, aMatrix);
		SexyString aLetter;
		aLetter.append(1, mLabel[aPos]);
		TodDrawStringMatrix(g, theFont, aMatrix, aLetter, aFinalColor);
	}
}

//0x459990
// GOTY @Patoke: inlined 0x45CAEF
_Font* MessageWidget::GetFont()
{
	// 字体按 MessageStyle 槽位直查（行序 = 枚举序 0..18；FONT_* 为运行期
	// 装载全局，表存变量地址用时解引用）。OFF 行 nullptr = 断言拦截。
	static constexpr _Font* const* kStyleFonts[] = {
		nullptr,                          // MESSAGE_STYLE_OFF（不可达，断言）
		&Sexy::FONT_HOUSEOFTERROR28,      // MESSAGE_STYLE_TUTORIAL_LEVEL1
		&Sexy::FONT_HOUSEOFTERROR28,      // MESSAGE_STYLE_TUTORIAL_LEVEL1_STAY
		&Sexy::FONT_HOUSEOFTERROR28,      // MESSAGE_STYLE_TUTORIAL_LEVEL2
		&Sexy::FONT_HOUSEOFTERROR28,      // MESSAGE_STYLE_TUTORIAL_LATER
		&Sexy::FONT_HOUSEOFTERROR28,      // MESSAGE_STYLE_TUTORIAL_LATER_STAY
		&Sexy::FONT_HOUSEOFTERROR28,      // MESSAGE_STYLE_HINT_LONG
		&Sexy::FONT_HOUSEOFTERROR28,      // MESSAGE_STYLE_HINT_FAST
		&Sexy::FONT_HOUSEOFTERROR28,      // MESSAGE_STYLE_HINT_STAY
		&Sexy::FONT_HOUSEOFTERROR28,      // MESSAGE_STYLE_HINT_TALL_FAST
		&Sexy::FONT_HOUSEOFTERROR28,      // MESSAGE_STYLE_HINT_TALL_UNLOCKMESSAGE
		&Sexy::FONT_HOUSEOFTERROR28,      // MESSAGE_STYLE_HINT_TALL_LONG
		&Sexy::FONT_HOUSEOFTERROR28,      // MESSAGE_STYLE_BIG_MIDDLE
		&Sexy::FONT_HOUSEOFTERROR28,      // MESSAGE_STYLE_BIG_MIDDLE_FAST
		&Sexy::FONT_HOUSEOFTERROR28,      // MESSAGE_STYLE_HOUSE_NAME
		&Sexy::FONT_HOUSEOFTERROR28,      // MESSAGE_STYLE_HUGE_WAVE
		&Sexy::FONT_HOUSEOFTERROR16,      // MESSAGE_STYLE_SLOT_MACHINE
		&Sexy::FONT_HOUSEOFTERROR28,      // MESSAGE_STYLE_ZEN_GARDEN_LONG
		&Sexy::FONT_HOUSEOFTERROR28,      // MESSAGE_STYLE_ACHIEVEMENT
	};
	static_assert(sizeof(kStyleFonts) / sizeof(kStyleFonts[0]) == (int)MessageStyle::MESSAGE_STYLE_ACHIEVEMENT + 1,
		"字体槽位须与 MessageStyle 枚举同步");
	if (_Font* const* aFontPtr = kStyleFonts[mMessageStyle])
	{
		return *aFontPtr;
	}
	TOD_ASSERT(false);
	return Sexy::FONT_HOUSEOFTERROR16;
}

//0x4599E0
// GOTY @Patoke: 0x45D2B0
void MessageWidget::Draw(Graphics* g)
{
	if (mDuration <= 0)
		return;
	
	_Font* aFont = GetFont();
	_Font* aOutlineFont = nullptr;
	int aPosX = BOARD_WIDTH / 2;
	int aPosY = 596;
	int aTextOffsetY = 0;
	int aRectHeight = 0;
	int aMinAlpha = 255;
	Color aColor(250, 250, 0, 255);
	Color aOutlineColor(0, 0, 0, 255);
	bool aFadeOut = false;
	if (aFont == Sexy::FONT_CONTINUUMBOLD14)
	{
		aOutlineFont = Sexy::FONT_CONTINUUMBOLD14OUTLINE;
	}

	// 绘制参数按 MessageStyle 槽位直查（行序 = 枚举序 0..18）。Color 构造
	// 非 constexpr，颜色以 RGBA 整数列存表，用时构造。
	static constexpr struct
	{
		int mPosX, mPosY, mRectHeight, mTextOffsetY, mMinAlpha, mR, mG, mB, mA;
		bool mFadeOut;
	} kStyleDraw[] = {
		{ BOARD_WIDTH / 2, 596,   0,   0, 255, 250, 250,   0, 255, false },  // OFF（不可达）
		{ BOARD_WIDTH / 2, 400, 110,  -4, 192, 253, 245, 173, 255, false },  // TUTORIAL_LEVEL1
		{ BOARD_WIDTH / 2, 400, 110,  -4, 192, 253, 245, 173, 255, false },  // TUTORIAL_LEVEL1_STAY
		{ BOARD_WIDTH / 2, 476, 100,  -4, 192, 253, 245, 173, 255, false },  // TUTORIAL_LEVEL2
		{ BOARD_WIDTH / 2, 476, 100,  -4, 192, 253, 245, 173, 255, false },  // TUTORIAL_LATER
		{ BOARD_WIDTH / 2, 476, 100,  -4, 192, 253, 245, 173, 255, false },  // TUTORIAL_LATER_STAY
		{ BOARD_WIDTH / 2, 527,  55,  -4, 192, 253, 245, 173, 255, false },  // HINT_LONG
		{ BOARD_WIDTH / 2, 527,  55,  -4, 192, 253, 245, 173, 255, false },  // HINT_FAST
		{ BOARD_WIDTH / 2, 527,  55,  -4, 192, 253, 245, 173, 255, false },  // HINT_STAY
		{ BOARD_WIDTH / 2, 476, 100,  -4, 192, 253, 245, 173, 255, false },  // HINT_TALL_FAST
		{ BOARD_WIDTH / 2, 476, 100,  -4, 192, 253, 245, 173, 255, false },  // HINT_TALL_UNLOCKMESSAGE
		{ BOARD_WIDTH / 2, 476, 100,  -4, 192, 253, 245, 173, 255, false },  // HINT_TALL_LONG
		{ BOARD_WIDTH / 2, 300, 110,   0, 192, 253, 245, 173, 255, false },  // BIG_MIDDLE
		{ BOARD_WIDTH / 2, 300, 110,   0, 192, 253, 245, 173, 255, false },  // BIG_MIDDLE_FAST
		{ BOARD_WIDTH / 2, 550,   0,   0, 255, 255, 255, 255, 255, true  },  // HOUSE_NAME
		{ BOARD_WIDTH / 2, 330,   0,   0, 255, 255,   0,   0, 255, false },  // HUGE_WAVE
		{            340,   93,   0,   0,  64, 250, 250,   0, 255, false },  // SLOT_MACHINE
		{ BOARD_WIDTH / 2, 514,  55,  -4, 192, 253, 245, 173, 255, false },  // ZEN_GARDEN_LONG
		{ BOARD_WIDTH / 2, 476, 100,  -4, 192, 253, 245, 173, 255, false },  // ACHIEVEMENT
	};
	static_assert(sizeof(kStyleDraw) / sizeof(kStyleDraw[0]) == (int)MessageStyle::MESSAGE_STYLE_ACHIEVEMENT + 1,
		"绘制参数槽位须与 MessageStyle 枚举同步");
	TOD_ASSERT(mMessageStyle != MessageStyle::MESSAGE_STYLE_OFF);
	{
		const auto& aParams = kStyleDraw[mMessageStyle];
		aPosX = aParams.mPosX;
		aPosY = aParams.mPosY;
		aRectHeight = aParams.mRectHeight;
		aTextOffsetY = aParams.mTextOffsetY;
		aMinAlpha = aParams.mMinAlpha;
		aColor = Color(aParams.mR, aParams.mG, aParams.mB, aParams.mA);
		aFadeOut = aParams.mFadeOut;
	}

	if (mReanimType != ReanimationType::REANIM_NONE)
	{
		if (aFont == Sexy::FONT_CONTINUUMBOLD14)
		{
			DrawReanimatedText(g, Sexy::FONT_CONTINUUMBOLD14OUTLINE, Color::Black, aPosY);
		}
		DrawReanimatedText(g, aFont, aColor, aPosY);
	}
	else
	{
		// 条目5：镜像串按 (属主, 内容) 比对刷新，值不变零分配
		if (gLabelStrOwner != this || gLabelStr.compare(mLabel) != 0)
		{
			gLabelStrOwner = this;
			gLabelStr.assign(mLabel);
		}
		const SexyString& aLabelStr = gLabelStr;

		if (aMinAlpha != 255)
		{
			aColor.mAlpha = TodAnimateCurveNs(750'000'000, 0,
				static_cast<std::int64_t>(mApp->mBoard->mMainCounter.mNanoseconds % 750'000'000),
				aMinAlpha, 255, Curves::BounceSlowMiddle);
			aOutlineColor.mAlpha = aColor.mAlpha;
		}
		if (aFadeOut)
		{
			aColor.mAlpha = ClampInt(mDuration * 15, 0, 255);
			aOutlineColor.mAlpha = aColor.mAlpha;
		}

		if (aRectHeight > 0)
		{
			aOutlineColor = Color(0, 0, 0, 128);
			const Rect& aBounds = mApp->mScreenBounds;
			Rect aRect(aBounds.mX - mApp->mBoard->mX, aPosY, aBounds.mWidth, aRectHeight);
			g->mColor = aOutlineColor;
			g->FillRect(aRect);

			aRect.mY += aTextOffsetY;
			TodDrawStringWrapped(g, aLabelStr, aRect, aFont, aColor, DrawStringJustification::DS_ALIGN_CENTER_VERTICAL_MIDDLE);
		}
		else
		{
			Rect aRect(aPosX - mApp->mBoard->mX - BOARD_WIDTH / 2, aPosY - aFont->mAscent, BOARD_WIDTH, BOARD_HEIGHT);
			if (aOutlineFont)
			{
				TodDrawStringWrapped(g, aLabelStr, aRect, aOutlineFont, aOutlineColor, DrawStringJustification::DS_ALIGN_CENTER);
			}
			TodDrawStringWrapped(g, aLabelStr, aRect, aFont, aColor, DrawStringJustification::DS_ALIGN_CENTER);
		}

		if (mMessageStyle == MessageStyle::MESSAGE_STYLE_HOUSE_NAME)
		{
			SexyString aSubStr;
			if (mApp->IsSurvivalMode() && mApp->mBoard->mChallenge->mSurvivalStage > 0)
			{
				int aFlags = mApp->mBoard->GetNumWavesPerSurvivalStage() * mApp->mBoard->mChallenge->mSurvivalStage / mApp->mBoard->GetNumWavesPerFlag();
				SexyString aFlagStr = mApp->Pluralize(aFlags, gStr.ONE_FLAG.c_str(), gStr.COUNT_FLAGS.c_str());
				aSubStr = TodReplaceString(gStr.FLAGS_COMPLETED, UiTextPlaceholder::Flags, aFlagStr);
			}

			if (aSubStr.size() > 0)
			{
				TodDrawString(
					g, 
					aSubStr, 
					BOARD_WIDTH / 2 - mApp->mBoard->mX, 
					aPosY + 26, 
					Sexy::FONT_HOUSEOFTERROR16, 
					Color(224, 187, 98, aColor.mAlpha),
					DrawStringJustification::DS_ALIGN_CENTER
				);
			}
		}
	}
}
