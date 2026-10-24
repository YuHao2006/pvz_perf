#include "LawnApp.h"
#include "Lawn/Board.h"
#include "Lawn/Widget/GameSelector.h"
#include "Lawn/Widget/CreditScreen.h"
#include "Lawn/Widget/ContinueDialog.h"
#include "Lawn/Widget/NewOptionsDialog.h"
#include "Lawn/Widget/AwardScreen.h"
#include "Lawn/System/PlayerInfo.h"
#include <cstddef>
#include <cstdio>

int main()
{
    std::printf("{\"pointerBytes\":%zu", sizeof(void*));
#define APP(field) std::printf(",\"" #field "\":%zu", offsetof(LawnApp, field))
    APP(mDrawCount);
    APP(mUpdateCount);
    APP(mGameScene);
    APP(mGameMode);
    APP(mBoard);
    APP(mCreditScreen);
    APP(mGameSelector);
    APP(mTitleScreen);
    APP(mAwardScreen);
    APP(mDialogMap);
    APP(mPlayerInfo);
    APP(mLoaded);
    APP(mCacheFramesPrebuilt);
    APP(mHWnd);
    APP(mActive);
    APP(mHasFocus);
#undef APP
    std::printf(",\"board\":{\"paused\":%zu,\"counter\":%zu,\"wave\":%zu,"
                "\"waves\":%zu,\"sun\":%zu},\"selector\":{\"options\":%zu,"
                "\"survival\":%zu},\"widget\":{\"x\":%zu,\"y\":%zu,"
                "\"width\":%zu,\"height\":%zu,\"parent\":%zu},"
                "\"continueButton\":%zu,\"creditsButton\":%zu,\"awardStart\":%zu}\n",
        offsetof(Board, mPaused), offsetof(Board, mLevelTimeNs),
        offsetof(Board, mCurrentWave), offsetof(Board, mNumWaves),
        offsetof(Board, mSunMoney), offsetof(GameSelector, mOptionsButton),
        offsetof(GameSelector, mSurvivalButton), offsetof(Sexy::Widget, mX),
        offsetof(Sexy::Widget, mY), offsetof(Sexy::Widget, mWidth),
        offsetof(Sexy::Widget, mHeight), offsetof(Sexy::Widget, mParent),
        offsetof(ContinueDialog, mContinueButton),
        offsetof(NewOptionsDialog, mBackToMainButton), offsetof(AwardScreen, mStartButton));
}
