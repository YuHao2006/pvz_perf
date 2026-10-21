#include "Sexy.TodLib/generated/EntityStrings.h"
#include "Lawn/LawnCommon.h"
#include <time.h>
#include "Lawn/Coin.h"
#include "Lawn/Board.h"
#include "Lawn/Plant.h"
#include "LawnDialog.h"
#include "GameButton.h"
#include "StoreScreen.h"
#include "Lawn/ZenGarden.h"
#include "Lawn/SeedPacket.h"
#include "LawnApp.h"
#include "Resources.h"
#include "Lawn/System/Music.h"
#include "Lawn/System/StinkyTimestamp.h"
#include "SeedChooserScreen.h"
#include "GameConstants.h"
#include "Lawn/System/PopDRMComm.h"
#include "Sexy.TodLib/TodFoley.h"
#include "Sexy.TodLib/TodCommon.h"
#include "Sexy.TodLib/Reanimator.h"
#include "misc/Debug.h"
#include "Sexy.TodLib/TodStringFile.h"
#include "graphics/ImageFont.h"
#include "widget/WidgetManager.h"
#include "AchievementsWidget.h"
#include "widget/WidgetLifetimeHold.h"
#include <algorithm>
#include <limits>
#include <memory>

namespace
{
// Modal waits keep pumping events. Retaining the shop does not retain its
// user or Board; all three must still belong to this purchase on return.
class StorePurchaseSession
{
    WidgetLifetimeHold mCaller;
    StoreScreen& mStore;
    LawnApp& mApp;
    Board* mBoard;
    std::uint64_t mBoardRevision;
    PlayerInfo* mPlayer;
    unsigned int mPlayerId;
    unsigned int mPlayerUseSeq;
public:
    explicit StorePurchaseSession(StoreScreen& store)
        : mCaller(store), mStore(store), mApp(*store.mApp), mBoard(mApp.mBoard),
          mBoardRevision(mApp.mBoardRevision), mPlayer(mApp.mPlayerInfo),
          mPlayerId(mPlayer ? mPlayer->mId : 0), mPlayerUseSeq(mPlayer ? mPlayer->mUseSeq : 0) {}
    bool IsCurrent() const
    {
        return !mApp.mShutdown && !mApp.mCloseRequest &&
            mApp.GetDialog(DIALOG_STORE) == &mStore && mStore.mWidgetManager &&
            mStore.mResult == std::numeric_limits<int>::max() &&
            mApp.mBoard == mBoard && mApp.mBoardRevision == mBoardRevision &&
            mApp.mPlayerInfo == mPlayer && mPlayer &&
            mPlayer->mId == mPlayerId && mPlayer->mUseSeq == mPlayerUseSeq;
    }
};

class StorePurchaseDialog final : public LawnDialog
{
    StoreScreen* mOwner;
    bool IsCurrent() const
    {
        return mApp->GetDialog(mId) == this && mApp->GetDialog(DIALOG_STORE) == mOwner;
    }
public:
    StorePurchaseDialog(StoreScreen& owner, int id, const SexyString& header,
        const SexyString& lines, const SexyString& footer, int buttons)
        : LawnDialog(owner.mApp, id, true, header, lines, footer, buttons), mOwner(&owner) {}
    void ButtonDepress(int id) override
    {
        if (IsCurrent()) LawnDialog::ButtonDepress(id);
    }
    void KeyDown(KeyCode key) override
    {
        if (IsCurrent()) LawnDialog::KeyDown(key);
    }
};
}

LawnDialog* StoreScreen::ShowPurchaseDialog(int id, const SexyString& header,
    const SexyString& lines, const SexyString& footer, int buttons)
{
    auto dialog = std::make_unique<StorePurchaseDialog>(*this, id, header, lines, footer, buttons);
    const Rect& bounds = mApp->mScreenBounds;
    dialog->Resize(bounds.mX + (bounds.mWidth - dialog->mWidth) / 2,
        bounds.mY + (bounds.mHeight - dialog->mHeight) / 2,
        dialog->mWidth, dialog->mHeight);
    mApp->AddDialog(dialog.get());
    return dialog.release();
}

int StoreScreen::WaitForPurchaseDialog(Dialog* dialog)
{
    struct PendingWait
    {
        StoreScreen& store;
        Dialog* child;
        WidgetLifetimeHold childLifetime;
        explicit PendingWait(StoreScreen& owner, Dialog* dialog)
            : store(owner), child(dialog), childLifetime(*dialog)
        {
            store.mWaitForDialog = true;
            store.mPurchaseDialog = child;
        }
        ~PendingWait()
        {
            // Also close on exception unwind; do not leave an orphaned child
            // after dropping the shop's pending-dialog borrow.
            store.mApp->SexyAppBase::KillDialog(child);
            store.mPurchaseDialog = nullptr;
            store.mWaitForDialog = false;
        }
    } pending(*this, dialog);
    return dialog->WaitForResult(true);
}

static StoreItem gStoreItemSpots[NUM_STORE_PAGES][MAX_PAGE_SPOTS] =
{
    { STORE_ITEM_PACKET_UPGRADE,    STORE_ITEM_POOL_CLEANER,        STORE_ITEM_RAKE,                STORE_ITEM_ROOF_CLEANER,
      STORE_ITEM_PLANT_GATLINGPEA,  STORE_ITEM_PLANT_TWINSUNFLOWER, STORE_ITEM_PLANT_GLOOMSHROOM,   STORE_ITEM_PLANT_CATTAIL },
    { STORE_ITEM_PLANT_SPIKEROCK,   STORE_ITEM_PLANT_GOLD_MAGNET,   STORE_ITEM_PLANT_WINTERMELON,   STORE_ITEM_PLANT_COBCANNON,
      STORE_ITEM_PLANT_IMITATER,    STORE_ITEM_FIRSTAID,            STORE_ITEM_INVALID,             STORE_ITEM_INVALID },
    { STORE_ITEM_POTTED_MARIGOLD_1, STORE_ITEM_POTTED_MARIGOLD_2,   STORE_ITEM_POTTED_MARIGOLD_3,   STORE_ITEM_GOLD_WATERINGCAN,
      STORE_ITEM_FERTILIZER,        STORE_ITEM_BUG_SPRAY,           STORE_ITEM_PHONOGRAPH,          STORE_ITEM_GARDENING_GLOVE },
    { STORE_ITEM_MUSHROOM_GARDEN,   STORE_ITEM_AQUARIUM_GARDEN,     STORE_ITEM_WHEEL_BARROW,        STORE_ITEM_STINKY_THE_SNAIL,
      STORE_ITEM_TREE_OF_WISDOM,    STORE_ITEM_TREE_FOOD,           STORE_ITEM_INVALID,             STORE_ITEM_INVALID }
};

StoreScreenOverlay::StoreScreenOverlay(StoreScreen* theParent)
{
    mParent = theParent;
    mMouseVisible = false;
    mHasAlpha = true;
}

void StoreScreenOverlay::Draw(Graphics* g)
{
    mParent->DrawOverlay(g);
}

//0x489DA0
StoreScreen::StoreScreen(LawnApp* theApp) : Dialog(nullptr, nullptr, DIALOG_STORE, true, ("Store"), (""), (""), BUTTONS_NONE)
{
	mApp = theApp;
    mClip = false;
    mStoreTime = 0;
    mBubbleCountDown = 0;
    mBubbleClickToContinue = false;
    mAmbientSpeechCountDown = 200;
    mPreviousAmbientSpeechIndex = -1;
    mPage = STORE_PAGE_SLOT_UPGRADES;
    mMouseOverItem = STORE_ITEM_INVALID;
    mHatchTimer = 0;
    mShakeX = 0;
    mShakeY = 0;
    mStartDialog = -1;
    mHatchOpen = true;
    mEasyBuyingCheat = false;
    mWaitForDialog = false;
    mCoins.DataArrayInitialize(1024U, DataArrayKind::Coins);
    TodLoadResources(ResourceGroupId::DelayLoad_Store);
    Resize(0, 0, BOARD_WIDTH, BOARD_HEIGHT);
    mPottedPlantSpecs.InitializePottedPlant(SEED_MARIGOLD);
    mPottedPlantSpecs.mDrawVariation = (DrawVariation)RandRangeInt(VARIATION_MARIGOLD_WHITE, VARIATION_MARIGOLD_LIGHT_GREEN);

    mBackButton = new NewLawnButton(nullptr, StoreScreen::StoreScreen_Back, this);
    mBackButton->mDoFinger = true;
    mBackButton->mLabel = gStr.STORE_MAIN_MENU_BUTTON;
    Image* aMenuImage = Sexy::IMAGE_STORE_MAINMENUBUTTON;
    mBackButton->mButtonImage = aMenuImage;
    mBackButton->mOverImage = Sexy::IMAGE_STORE_MAINMENUBUTTONHIGHLIGHT;
    mBackButton->mDownImage = Sexy::IMAGE_STORE_MAINMENUBUTTONDOWN;
    mBackButton->SetFont(Sexy::FONT_HOUSEOFTERROR20);
    mBackButton->mColors[ButtonWidget::COLOR_LABEL] = Color(98, 153, 235);
    mBackButton->mColors[ButtonWidget::COLOR_LABEL_HILITE] = Color(167, 192, 235);
    mBackButton->Resize(366, 512, aMenuImage->mWidth, aMenuImage->mHeight);
    mBackButton->mTextOffsetX = -7;
    mBackButton->mTextOffsetY = 1;
    mBackButton->mTextDownOffsetX = 2;
    mBackButton->mTextDownOffsetY = 1;

    mPrevButton = new NewLawnButton(nullptr, StoreScreen::StoreScreen_Prev, this);
    mPrevButton->mDoFinger = true;
    mPrevButton->mLabel = ("");
    Image* aPrevImage = Sexy::IMAGE_STORE_PREVBUTTON;
    mPrevButton->mButtonImage = aPrevImage;
    mPrevButton->mOverImage = Sexy::IMAGE_STORE_PREVBUTTONHIGHLIGHT;
    mPrevButton->mDownImage = Sexy::IMAGE_STORE_PREVBUTTONHIGHLIGHT;
    mPrevButton->mColors[ButtonWidget::COLOR_LABEL] = Color(255, 240, 0);
    mPrevButton->mColors[ButtonWidget::COLOR_LABEL_HILITE] = Color(200, 200, 255);
    mPrevButton->Resize(252, 402, aPrevImage->mWidth, aPrevImage->mHeight);

    mNextButton = new NewLawnButton(nullptr, StoreScreen::StoreScreen_Next, this);
    mNextButton->mDoFinger = true;
    mNextButton->mLabel = ("");
    Image* aNextImage = Sexy::IMAGE_STORE_NEXTBUTTON;
    mNextButton->mButtonImage = aNextImage;
    mNextButton->mOverImage = Sexy::IMAGE_STORE_NEXTBUTTONHIGHLIGHT;
    mNextButton->mDownImage = Sexy::IMAGE_STORE_NEXTBUTTONHIGHLIGHT;
    mNextButton->mColors[ButtonWidget::COLOR_LABEL] = Color(255, 240, 0);
    mNextButton->mColors[ButtonWidget::COLOR_LABEL_HILITE] = Color(200, 200, 255);
    mNextButton->Resize(596, 402, aNextImage->mWidth, aNextImage->mHeight);

    mOverlayWidget = new StoreScreenOverlay(this);
    mOverlayWidget->Resize(0, 0, BOARD_WIDTH, BOARD_HEIGHT);

    if (!IsPageShown(STORE_PAGE_PLANT_UPGRADES))
    {
        mPrevButton->mDisabledImage = Sexy::IMAGE_STORE_PREVBUTTONDISABLED;
        mPrevButton->SetDisabled(true);
        mNextButton->mDisabledImage = Sexy::IMAGE_STORE_NEXTBUTTONDISABLED;
        mNextButton->SetDisabled(true);
    }
    mDrawnOnce = false;
    mGoToTreeNow = false;
    mPurchasedFullVersion = false;
    mTrialLockedWhenStoreOpened = mApp->IsTrialStageLocked();
    RefreshLayout();
}

void StoreScreen::RefreshLayout()
{
    const Rect& bounds = mApp->mScreenBounds;
    // Use the actual viewport center, including asymmetrically clamped battle
    // bounds. All authored positions remain local to the same 800-pixel core.
    Move(bounds.mX + (bounds.mWidth - BOARD_WIDTH) / 2,
        bounds.mY + (bounds.mHeight - BOARD_HEIGHT) / 2);
    mMouseInsets.mLeft = std::min(0, bounds.mX - mX);
    mMouseInsets.mRight = std::min(0, mX + mWidth - bounds.mX - bounds.mWidth);
}

//0x48A610、0x48A630
StoreScreen::~StoreScreen()
{
    mCoins.DataArrayDispose();
    if (mBackButton) delete mBackButton;
    if (mPrevButton) delete mPrevButton;
    if (mNextButton) delete mNextButton;
    if (mOverlayWidget) delete mOverlayWidget;
}

//0x48A760
StoreItem StoreScreen::GetStoreItemType(int theSpotIndex)
{
    // 这个函数原版是穷举判断的，这里优化一下……

    if (mPage < NUM_STORE_PAGES && theSpotIndex < MAX_PAGE_SPOTS)
    {
        if (mPage == STORE_PAGE_SLOT_UPGRADES && theSpotIndex == 6 && mApp->IsTrialStageLocked())
        {
            return STORE_ITEM_PVZ;
        }
        return gStoreItemSpots[mPage][theSpotIndex];
    }

    TOD_ASSERT(false);
    return STORE_ITEM_INVALID;
}

//0x48A8D0
bool StoreScreen::IsFullVersionOnly(StoreItem theStoreItem)
{
    if (!mApp->IsTrialStageLocked())
        return false;

    if (theStoreItem == STORE_ITEM_PACKET_UPGRADE && mApp->mPlayerInfo->mPurchases[STORE_ITEM_PACKET_UPGRADE] >= 2)
        return true;
    
    return theStoreItem == STORE_ITEM_PLANT_TWINSUNFLOWER;
}

bool StoreScreen::IsPottedPlant(StoreItem theStoreItem)
{
    return theStoreItem == STORE_ITEM_POTTED_MARIGOLD_1 || theStoreItem == STORE_ITEM_POTTED_MARIGOLD_2 || theStoreItem == STORE_ITEM_POTTED_MARIGOLD_3;
}


//0x48A940
bool StoreScreen::IsComingSoon(StoreItem theStoreItem)
{
    // StoreScreen::IsComingSoon 谓词表（C 形态 -> 匿名 lambda 函数指针表）：行序 =
    // StoreItem 枚举值序 0..30（原链书写序 PACKET_UPGRADE/WHEEL_BARROW/POTTED/
    // TREE_FOOD 与值序不同，勿照抄链序）。nullptr = 原 default 支（false）。
    // TWINSUNFLOWER/PACKET_UPGRADE 槽委托 IsFullVersionOnly（= 原链首支，试玩锁
    // 语义单点维护）；三盆栽槽共体具名函数。
    static constexpr auto StoreComingSoonPotted = [](StoreScreen& s)
    {
    return !s.mApp->HasFinishedAdventure();
    };

    using StoreComingSoonFn = bool (*)(StoreScreen&);

    static constexpr StoreComingSoonFn kStoreComingSoon[(int)StoreItem::STORE_ITEM_PVZ + 1] = {
    nullptr,                                                                                       // 0 STORE_ITEM_PLANT_GATLINGPEA
    [](StoreScreen& s) { return s.IsFullVersionOnly(STORE_ITEM_PLANT_TWINSUNFLOWER); },            // 1 STORE_ITEM_PLANT_TWINSUNFLOWER
    nullptr,                                                                                       // 2 STORE_ITEM_PLANT_GLOOMSHROOM
    nullptr,                                                                                       // 3 STORE_ITEM_PLANT_CATTAIL
    nullptr,                                                                                       // 4 STORE_ITEM_PLANT_WINTERMELON
    nullptr,                                                                                       // 5 STORE_ITEM_PLANT_GOLD_MAGNET
    nullptr,                                                                                       // 6 STORE_ITEM_PLANT_SPIKEROCK
    nullptr,                                                                                       // 7 STORE_ITEM_PLANT_COBCANNON
    nullptr,                                                                                       // 8 STORE_ITEM_PLANT_IMITATER
    nullptr,                                                                                       // 9 STORE_ITEM_BONUS_LAWN_MOWER
    StoreComingSoonPotted,                                                                        // 10 STORE_ITEM_POTTED_MARIGOLD_1
    StoreComingSoonPotted,                                                                        // 11 STORE_ITEM_POTTED_MARIGOLD_2
    StoreComingSoonPotted,                                                                        // 12 STORE_ITEM_POTTED_MARIGOLD_3
    nullptr,                                                                                       // 13 STORE_ITEM_GOLD_WATERINGCAN
    nullptr,                                                                                       // 14 STORE_ITEM_FERTILIZER
    nullptr,                                                                                       // 15 STORE_ITEM_BUG_SPRAY
    nullptr,                                                                                       // 16 STORE_ITEM_PHONOGRAPH
    nullptr,                                                                                       // 17 STORE_ITEM_GARDENING_GLOVE
    nullptr,                                                                                       // 18 STORE_ITEM_MUSHROOM_GARDEN
    [](StoreScreen& s) { return !s.mApp->mPlayerInfo->mPurchases[STORE_ITEM_MUSHROOM_GARDEN] && !s.mApp->mPlayerInfo->mPurchases[STORE_ITEM_AQUARIUM_GARDEN]; },  // 19 STORE_ITEM_WHEEL_BARROW
    nullptr,                                                                                       // 20 STORE_ITEM_STINKY_THE_SNAIL
    [](StoreScreen& s) { return s.IsFullVersionOnly(STORE_ITEM_PACKET_UPGRADE); },                 // 21 STORE_ITEM_PACKET_UPGRADE
    nullptr,                                                                                       // 22 STORE_ITEM_POOL_CLEANER
    nullptr,                                                                                       // 23 STORE_ITEM_ROOF_CLEANER
    nullptr,                                                                                       // 24 STORE_ITEM_RAKE
    nullptr,                                                                                       // 25 STORE_ITEM_AQUARIUM_GARDEN
    nullptr,                                                                                       // 26 STORE_ITEM_CHOCOLATE
    nullptr,                                                                                       // 27 STORE_ITEM_TREE_OF_WISDOM
    [](StoreScreen& s) { return !s.mApp->mPlayerInfo->mPurchases[STORE_ITEM_TREE_OF_WISDOM] || s.mApp->mPlayerInfo->mPurchases[STORE_ITEM_TREE_FOOD] < PURCHASE_COUNT_OFFSET; },  // 28 STORE_ITEM_TREE_FOOD
    nullptr,                                                                                       // 29 STORE_ITEM_FIRSTAID
    nullptr,                                                                                       // 30 STORE_ITEM_PVZ
    };
    static_assert(sizeof(kStoreComingSoon) / sizeof(kStoreComingSoon[0]) ==
    (int)StoreItem::STORE_ITEM_PVZ + 1, "kStoreComingSoon 槽位须与 StoreItem 枚举同步");
    static_assert(kStoreComingSoon[(int)StoreItem::STORE_ITEM_POTTED_MARIGOLD_1] == +StoreComingSoonPotted &&
    kStoreComingSoon[(int)StoreItem::STORE_ITEM_POTTED_MARIGOLD_3] == +StoreComingSoonPotted &&
    kStoreComingSoon[(int)StoreItem::STORE_ITEM_WHEEL_BARROW] != nullptr &&
    kStoreComingSoon[(int)StoreItem::STORE_ITEM_TREE_FOOD] != nullptr &&
    kStoreComingSoon[(int)StoreItem::STORE_ITEM_PLANT_GATLINGPEA] == nullptr,
    "kStoreComingSoon 关键槽位锚定（盆栽三槽共体，WHEEL_BARROW/TREE_FOOD 有支，植物槽默认）");

    // C 形态 -> lambda 表 kStoreComingSoon（上方）：StoreItem 键控，越界（含
    // STORE_ITEM_INVALID）与 nullptr 槽 = 原 default 支（false）。
    if ((unsigned)theStoreItem < sizeof(kStoreComingSoon) / sizeof(kStoreComingSoon[0]) &&
        kStoreComingSoon[theStoreItem] != nullptr)
    {
        return kStoreComingSoon[theStoreItem](*this);
    }
    return false;
}

//0x48A9D0
bool StoreScreen::IsItemSoldOut(StoreItem theStoreItem)
{
    PlayerInfo* aPlayer = mApp->mPlayerInfo;
    if (theStoreItem == STORE_ITEM_INVALID)
        return false;
    else if (theStoreItem == STORE_ITEM_PACKET_UPGRADE)
        return aPlayer->mPurchases[STORE_ITEM_PACKET_UPGRADE] >= 4;
    else if (theStoreItem == STORE_ITEM_FERTILIZER || theStoreItem == STORE_ITEM_BUG_SPRAY)
        return aPlayer->mPurchases[theStoreItem] - PURCHASE_COUNT_OFFSET > 15;
    else if (theStoreItem == STORE_ITEM_TREE_FOOD)
        // GOTY 1073 (004955C0): ten portions is already sold out.
        return aPlayer->mPurchases[STORE_ITEM_TREE_FOOD] - PURCHASE_COUNT_OFFSET >= 10;
    else if (theStoreItem == STORE_ITEM_BONUS_LAWN_MOWER)
        return aPlayer->mPurchases[STORE_ITEM_BONUS_LAWN_MOWER] >= 2;
    else if (IsPottedPlant(theStoreItem))
        return mApp->mZenGarden->IsZenGardenFull(true) || aPlayer->mPurchases[theStoreItem] == GetCurrentDaysSince2000();
    else return aPlayer->mPurchases[theStoreItem];

    return false;
}

//0x48AAD0
bool StoreScreen::IsItemUnavailable(StoreItem theStoreItem)
{
    if (mEasyBuyingCheat)
        return false;

    /*
    if (mApp->HasFinishedAdventure())
        return true;

    bool aTrialStageLocked = mApp->IsTrialStageLocked();
    int aCurrentLevel = mApp->mPlayerInfo->mLevel;
    if (theStoreItem == STORE_ITEM_ROOF_CLEANER)
    {
        return aTrialStageLocked || aCurrentLevel < 42;
    }
    else if (theStoreItem == STORE_ITEM_PLANT_GLOOMSHROOM || theStoreItem == STORE_ITEM_PLANT_CATTAIL)
    {
        return aTrialStageLocked || aCurrentLevel < 35;
    }
    else if (theStoreItem == STORE_ITEM_PLANT_SPIKEROCK || theStoreItem == STORE_ITEM_PLANT_GOLD_MAGNET)
    {
        return aCurrentLevel < 41;
    }

    return 
        theStoreItem != STORE_ITEM_PLANT_WINTERMELON && 
        theStoreItem != STORE_ITEM_PLANT_COBCANNON &&
        theStoreItem != STORE_ITEM_PLANT_IMITATER && 
        theStoreItem != STORE_ITEM_FIRSTAID;
    */

    if (theStoreItem == STORE_ITEM_ROOF_CLEANER)
    {
        return mApp->IsTrialStageLocked() || (!mApp->HasFinishedAdventure() && mApp->mPlayerInfo->mLevel < 42);
    }
    if (theStoreItem == STORE_ITEM_PLANT_GLOOMSHROOM)
    {
        return mApp->IsTrialStageLocked() || (!mApp->HasFinishedAdventure() && mApp->mPlayerInfo->mLevel < 35);
    }
    if (theStoreItem == STORE_ITEM_PLANT_CATTAIL)
    {
        return mApp->IsTrialStageLocked() || (!mApp->HasFinishedAdventure() && mApp->mPlayerInfo->mLevel < 35);
    }
    if (theStoreItem == STORE_ITEM_PLANT_SPIKEROCK)
    {
        return !mApp->HasFinishedAdventure() && mApp->mPlayerInfo->mLevel < 41;
    }
    if (theStoreItem == STORE_ITEM_PLANT_GOLD_MAGNET)
    {
        return !mApp->HasFinishedAdventure() && mApp->mPlayerInfo->mLevel < 41;
    }
    if (theStoreItem == STORE_ITEM_PLANT_WINTERMELON || theStoreItem == STORE_ITEM_PLANT_COBCANNON ||
        theStoreItem == STORE_ITEM_PLANT_IMITATER || theStoreItem == STORE_ITEM_FIRSTAID)
    {
        return !mApp->HasFinishedAdventure();
    }
    return false;
}

void StoreScreen::GetStorePosition(int theSpotIndex, int& thePosX, int& thePosY)
{
    if (theSpotIndex <= 3)
    {
        thePosX = STORESCREEN_ITEMOFFSET_1_X + STORESCREEN_ITEMSIZE * theSpotIndex;
        thePosY = STORESCREEN_ITEMOFFSET_1_Y;
    }
    else
    {
        thePosX = STORESCREEN_ITEMOFFSET_2_X + STORESCREEN_ITEMSIZE * (theSpotIndex - 4);
        thePosY = STORESCREEN_ITEMOFFSET_2_Y;
    }
}


//0x48AC50
void StoreScreen::DrawItemIcon(Graphics* g, int theItemPosition, StoreItem theItemType, bool theIsForHighlight)
{
    // StoreScreen::DrawItemIcon 图标绘制表（B 形态）：行序 = StoreItem 枚举值序
    // 0..30（原链书写序与枚举值序不同，勿照抄链序）。图像槽存 Image* const*
    // （资源指针运行期才填充，存址取值，同 AwardScreen kAwardDrawRows 先例）；
    // nullptr = 无专属图标行，走函数末尾 DrawSeedPacket 默认支。mDrawX5 = 绘制后
    // 附加 "x5" 数量角标（原 FERTILIZER/BUG_SPRAY 两支共体）。
    static constexpr struct
    {
    Image* const* mImage;
    int mDx;
    int mDy;
    bool mDrawX5;
    } kStoreIconDrawRows[(int)StoreItem::STORE_ITEM_PVZ + 1] = {
    { nullptr, 0, 0, false },                                   // 0 STORE_ITEM_PLANT_GATLINGPEA（种子包默认支）
    { nullptr, 0, 0, false },                                   // 1 STORE_ITEM_PLANT_TWINSUNFLOWER（种子包默认支）
    { nullptr, 0, 0, false },                                   // 2 STORE_ITEM_PLANT_GLOOMSHROOM（种子包默认支）
    { nullptr, 0, 0, false },                                   // 3 STORE_ITEM_PLANT_CATTAIL（种子包默认支）
    { nullptr, 0, 0, false },                                   // 4 STORE_ITEM_PLANT_WINTERMELON（种子包默认支）
    { nullptr, 0, 0, false },                                   // 5 STORE_ITEM_PLANT_GOLD_MAGNET（种子包默认支）
    { nullptr, 0, 0, false },                                   // 6 STORE_ITEM_PLANT_SPIKEROCK（种子包默认支）
    { nullptr, 0, 0, false },                                   // 7 STORE_ITEM_PLANT_COBCANNON（种子包默认支）
    { &Sexy::IMAGE_IMITATERSEED, 0, 0, false },                 // 8 STORE_ITEM_PLANT_IMITATER
    { nullptr, 0, 0, false },                                   // 9 STORE_ITEM_BONUS_LAWN_MOWER（种子包默认支）
    { nullptr, 0, 0, false },                                   // 10 STORE_ITEM_POTTED_MARIGOLD_1（表外 IsPottedPlant 支）
    { nullptr, 0, 0, false },                                   // 11 STORE_ITEM_POTTED_MARIGOLD_2（表外 IsPottedPlant 支）
    { nullptr, 0, 0, false },                                   // 12 STORE_ITEM_POTTED_MARIGOLD_3（表外 IsPottedPlant 支）
    { &Sexy::IMAGE_WATERINGCANGOLD, -14, -4, false },           // 13 STORE_ITEM_GOLD_WATERINGCAN
    { &Sexy::IMAGE_FERTILIZER, -11, -2, true },                 // 14 STORE_ITEM_FERTILIZER
    { &Sexy::IMAGE_BUG_SPRAY, -12, 3, true },                   // 15 STORE_ITEM_BUG_SPRAY
    { &Sexy::IMAGE_PHONOGRAPH, -12, 3, false },                 // 16 STORE_ITEM_PHONOGRAPH
    { &Sexy::IMAGE_ZEN_GARDENGLOVE, -12, 3, false },            // 17 STORE_ITEM_GARDENING_GLOVE
    { &Sexy::IMAGE_STORE_MUSHROOMGARDENICON, -8, 2, false },    // 18 STORE_ITEM_MUSHROOM_GARDEN
    { &Sexy::IMAGE_ZEN_WHEELBARROW, -12, 3, false },            // 19 STORE_ITEM_WHEEL_BARROW
    { &Sexy::IMAGE_REANIM_STINKY_TURN3, -24, 14, false },       // 20 STORE_ITEM_STINKY_THE_SNAIL
    { nullptr, 0, 0, false },                                   // 21 STORE_ITEM_PACKET_UPGRADE（表外特例支）
    { &Sexy::IMAGE_ICON_POOLCLEANER, 1, 7, false },             // 22 STORE_ITEM_POOL_CLEANER
    { &Sexy::IMAGE_ICON_ROOFCLEANER, 0, 28, false },            // 23 STORE_ITEM_ROOF_CLEANER
    { &Sexy::IMAGE_ICON_RAKE, -5, 10, false },                  // 24 STORE_ITEM_RAKE
    { &Sexy::IMAGE_STORE_AQUARIUMGARDENICON, -8, 2, false },    // 25 STORE_ITEM_AQUARIUM_GARDEN
    { nullptr, 0, 0, false },                                   // 26 STORE_ITEM_CHOCOLATE（种子包默认支）
    { &Sexy::IMAGE_STORE_TREEOFWISDOMICON, -8, 2, false },      // 27 STORE_ITEM_TREE_OF_WISDOM
    { &Sexy::IMAGE_TREEFOOD, -8, -2, false },                   // 28 STORE_ITEM_TREE_FOOD
    { &Sexy::IMAGE_STORE_FIRSTAIDWALLNUTICON, -1, 13, false },  // 29 STORE_ITEM_FIRSTAID
    { &Sexy::IMAGE_STORE_PVZICON, 0, -9, false },               // 30 STORE_ITEM_PVZ
    };
    static_assert(sizeof(kStoreIconDrawRows) / sizeof(kStoreIconDrawRows[0]) ==
    (int)StoreItem::STORE_ITEM_PVZ + 1, "kStoreIconDrawRows 槽位须与 StoreItem 枚举同步");
    static_assert(kStoreIconDrawRows[(int)StoreItem::STORE_ITEM_POOL_CLEANER].mImage == &Sexy::IMAGE_ICON_POOLCLEANER &&
    kStoreIconDrawRows[(int)StoreItem::STORE_ITEM_WHEEL_BARROW].mImage == &Sexy::IMAGE_ZEN_WHEELBARROW &&
    kStoreIconDrawRows[(int)StoreItem::STORE_ITEM_PLANT_IMITATER].mImage == &Sexy::IMAGE_IMITATERSEED &&
    kStoreIconDrawRows[(int)StoreItem::STORE_ITEM_PACKET_UPGRADE].mImage == nullptr &&
    kStoreIconDrawRows[(int)StoreItem::STORE_ITEM_PLANT_GATLINGPEA].mImage == nullptr,
    "kStoreIconDrawRows 关键槽位锚定（POOL_CLEANER/WHEEL_BARROW/IMITATER 有图，PACKET_UPGRADE/GATLINGPEA 默认）");

    if (theIsForHighlight)
    {
        g->mDrawMode = Graphics::DRAWMODE_ADDITIVE;
        g->mColor = Color(255, 255, 255, 96);
        g->mColorizeImages = true;
    }

    int aPosX, aPosY;
    GetStorePosition(theItemPosition, aPosX, aPosY);
    // 表外特例：PACKET_UPGRADE 支（原链首支；底色叠加 + 槽位数文字 + 高亮中途
    // 复原绘制模式，异构体整体保留）。
    if (theItemType == STORE_ITEM_PACKET_UPGRADE)
    {
        g->mColor = Color(255, 255, 255, 32);
        g->DrawImage(Sexy::IMAGE_STORE_PACKETUPGRADE, aPosX - 7, aPosY + 7);
        if (theIsForHighlight)
        {
            g->mDrawMode = Graphics::DRAWMODE_NORMAL;
            g->mColorizeImages = false;
        }

        SexyString aSlotText = TodReplaceNumberString(gStr.STORE_UPGRADE_SLOTS, UiTextPlaceholder::Slots, mApp->mPlayerInfo->mPurchases[STORE_ITEM_PACKET_UPGRADE] + 7);
        Rect aRect(aPosX, aPosY + 6, 55, 70);
        TodDrawStringWrapped(g, aSlotText, aRect, Sexy::FONT_HOUSEOFTERROR16, Color::White, DS_ALIGN_CENTER_VERTICAL_MIDDLE);
    }
    // 表外特例：三盆栽槽共体（盆栽图标走禅花园绘制，非静态贴图行）。
    else if (IsPottedPlant(theItemType))
    {
        mApp->mZenGarden->DrawPottedPlantIcon(g, aPosX, aPosY, &mPottedPlantSpecs);
    }
    else
    {
        // B 形态 -> 常量表 kStoreIconDrawRows（上方）：StoreItem 键控，越界
        // （含 STORE_ITEM_INVALID）与 nullptr 槽走原 default 支（种子包）。
        const unsigned anIconIndex = (unsigned)theItemType;
        if (anIconIndex < sizeof(kStoreIconDrawRows) / sizeof(kStoreIconDrawRows[0]) &&
            kStoreIconDrawRows[anIconIndex].mImage != nullptr)
        {
            const auto& anIconRow = kStoreIconDrawRows[anIconIndex];
            g->DrawImage(*anIconRow.mImage, aPosX + anIconRow.mDx, aPosY + anIconRow.mDy);
            if (anIconRow.mDrawX5)
            {
                TodDrawString(g, ("x5"), aPosX + 56, aPosY + 62, Sexy::FONT_HOUSEOFTERROR16, Color::White, DS_ALIGN_RIGHT);
            }
        }
        else
        {
            DrawSeedPacket(g, aPosX, aPosY, (SeedType)(theItemType + 40), SEED_NONE, 0, 255, false, false);
        }
    }

    g->mDrawMode = Graphics::DRAWMODE_NORMAL;
    g->mColorizeImages = false;
}

//0x48B170
void StoreScreen::DrawItem(Graphics* g, int theItemPosition, StoreItem theItemType)
{
    if (IsItemUnavailable(theItemType))
        return;

    DrawItemIcon(g, theItemPosition, theItemType, false);

    int aPosX, aPosY;
    GetStorePosition(theItemPosition, aPosX, aPosY);
    if (theItemType != STORE_ITEM_PVZ)
    {
        g->DrawImage(Sexy::IMAGE_STORE_PRICETAG, aPosX - 3, aPosY + 70);
        SexyString aCostString = LawnApp::GetMoneyString(GetItemCost(theItemType));
        TodDrawString(g, aCostString, aPosX + 23, aPosY + 85, Sexy::FONT_BRIANNETOD12, Color::Black, DS_ALIGN_CENTER);
    }
    if (IsComingSoon(theItemType))
    {
        Rect aRect(aPosX, aPosY, 60, 70);
        if (theItemType == STORE_ITEM_PLANT_TWINSUNFLOWER || theItemType == STORE_ITEM_PACKET_UPGRADE)
        {
            aRect.mX -= 4;
        }
        TodDrawStringWrapped(g, gStr.COMING_SOON, aRect, Sexy::FONT_HOUSEOFTERROR16, Color(255, 0, 0), DS_ALIGN_CENTER_VERTICAL_MIDDLE);
    }
    else if (IsItemSoldOut(theItemType))
    {
        Rect aRect(aPosX, aPosY, 50, 70);
        TodDrawStringWrapped(g, gStr.SOLD_OUT, aRect, Sexy::FONT_HOUSEOFTERROR16, Color(255, 0, 0), DS_ALIGN_CENTER_VERTICAL_MIDDLE);
    }
    else if (mMouseOverItem == theItemType)
    {
        if (theItemType >= 0 && theItemType <= 8)
        {
            g->DrawImage(Sexy::IMAGE_SEEDPACKETFLASH, aPosX, aPosY);
        }
        else
        {
            DrawItemIcon(g, theItemPosition, theItemType, true);
        }
    }
}

//0x48B4C0
void StoreScreen::Draw(Graphics* g)
{
    const int previousX = mX, previousY = mY;
    RefreshLayout();
    Graphics centered(*g);
    centered.Translate(mX - previousX, mY - previousY);
    g = &centered;
    g->mLinearBlend = true;
    mDrawnOnce = true;

    int aStoreSignPosY = TodAnimateCurve(50, 110, mStoreTime, -150, 0, Curves::EaseInOut);
    if (mApp->IsNight())
    {
        g->DrawImage(Sexy::IMAGE_STORE_BACKGROUNDNIGHT,
            (BOARD_WIDTH - Sexy::IMAGE_STORE_BACKGROUNDNIGHT->mWidth) / 2, 0);
    }
    else
    {
        g->DrawImage(Sexy::IMAGE_STORE_BACKGROUND,
            (BOARD_WIDTH - Sexy::IMAGE_STORE_BACKGROUND->mWidth) / 2, 0);
    }

    // Foreground extensions keep their authored left edges; centering each
    // layer separately would move the shelves away from their item hit boxes.
    if (!mHatchTimer && mHatchOpen)
    {
        g->DrawImage(Sexy::IMAGE_STORE_CAR, mShakeX + 196, mShakeY + 138);
        g->DrawImage(Sexy::IMAGE_STORE_HATCHBACKOPEN, mShakeX + 299, mShakeY);
        if (mApp->IsNight())
        {
            g->DrawImage(Sexy::IMAGE_STORE_CAR_NIGHT, mShakeX + 688, mShakeY + 193);
        }
    }
    else
    {
        g->DrawImage(Sexy::IMAGE_STORE_CARCLOSED, mShakeX + 196, mShakeY + 138);
        if (mApp->IsNight())
        {
            g->DrawImage(Sexy::IMAGE_STORE_CAR_NIGHT, mShakeX + 688, mShakeY + 193);
            g->DrawImage(Sexy::IMAGE_STORE_CARCLOSED_NIGHT, mShakeX + 337, mShakeY + 187);
        }
    }
    g->DrawImage(Sexy::IMAGE_STORE_SIGN, 285, aStoreSignPosY);

    Graphics gCrazyDave = Graphics(*g);
    gCrazyDave.mTransX -= 42.0f;
    gCrazyDave.mTransY += 68.0f;
    mApp->DrawCrazyDave(&gCrazyDave);

    if (!mHatchTimer && mHatchOpen)
    {
        for (int i = 0; i < MAX_PAGE_SPOTS; i++)
        {
            StoreItem aStoreItem = GetStoreItemType(i);
            if (aStoreItem != STORE_ITEM_INVALID)
            {
                DrawItem(g, i, aStoreItem);
            }
        }
    }

    g->DrawImage(Sexy::IMAGE_COINBANK, STORESCREEN_COINBANK_X, STORESCREEN_COINBANK_Y);
    g->mColor = Color(180, 255, 90);
    g->mFont = Sexy::FONT_CONTINUUMBOLD14;
    SexyString aCoinLabel = mApp->GetMoneyString(mApp->mPlayerInfo->mCoins);
    g->DrawString(aCoinLabel, STORESCREEN_COINBANK_X + 116 - Sexy::FONT_CONTINUUMBOLD14->StringWidth(aCoinLabel), STORESCREEN_COINBANK_Y + 24);

    if (!mPrevButton->mDisabled)
    {
        int aNumPages = 0;
        for (StorePages aPage = STORE_PAGE_SLOT_UPGRADES; aPage < NUM_STORE_PAGES; aPage = (StorePages)(aPage + 1))
        {
            if (IsPageShown(aPage))
            {
                aNumPages++;
            }
        }

        SexyString aPageString = TodReplaceNumberString(TodReplaceNumberString(gStr.STORE_PAGE, UiTextPlaceholder::Page, mPage + 1), UiTextPlaceholder::NumPages, aNumPages);
        TodDrawString(g, aPageString, STORESCREEN_PAGESTRING_X, STORESCREEN_PAGESTRING_Y, Sexy::FONT_BRIANNETOD12, Color(80, 80, 80), DS_ALIGN_CENTER);
    }
}

//0x48BA30
void StoreScreen::DrawOverlay(Graphics* g)
{
    Coin* aCoin = nullptr;
    while (mCoins.IterateNext(aCoin))
    {
        if (!aCoin->mDead)
        {
            aCoin->Draw(g);
        }
    }
}

//0x48BAA0
// GOTY @Patoke: 0x4578F0
void StoreScreen::SetBubbleText(int theCrazyDaveMessage, int theTime, bool theClickToContinue)
{
    mApp->CrazyDaveTalkIndex(theCrazyDaveMessage);
    mBubbleCountDown = theTime;
    mBubbleClickToContinue = theClickToContinue;
}

namespace
{
// 商店气泡消息索引表：原 UpdateMouse 31 case 纯常量（生成器解析原 switch 生成，
// 逐槽对拍 0 差异）。-1 = 无提示（CHOCOLATE 及无 case 槽）；PACKET_UPGRADE 依
// 购买量三段+default 特例保留表外；default=TOD_ASSERT 由越界分支保留。
constexpr int kStoreBubbleMessage[(int)StoreItem::STORE_ITEM_PVZ + 1] = {
    2000,  // 0 STORE_ITEM_PLANT_GATLINGPEA
    2001,  // 1 STORE_ITEM_PLANT_TWINSUNFLOWER
    2002,  // 2 STORE_ITEM_PLANT_GLOOMSHROOM
    2003,  // 3 STORE_ITEM_PLANT_CATTAIL
    2004,  // 4 STORE_ITEM_PLANT_WINTERMELON
    2005,  // 5 STORE_ITEM_PLANT_GOLD_MAGNET
    2006,  // 6 STORE_ITEM_PLANT_SPIKEROCK
    2007,  // 7 STORE_ITEM_PLANT_COBCANNON
    2008,  // 8 STORE_ITEM_PLANT_IMITATER
    2009,  // 9 STORE_ITEM_BONUS_LAWN_MOWER
    2010,  // 10 STORE_ITEM_POTTED_MARIGOLD_1
    2010,  // 11 STORE_ITEM_POTTED_MARIGOLD_2
    2010,  // 12 STORE_ITEM_POTTED_MARIGOLD_3
    2019,  // 13 STORE_ITEM_GOLD_WATERINGCAN
    2020,  // 14 STORE_ITEM_FERTILIZER
    2022,  // 15 STORE_ITEM_BUG_SPRAY
    2021,  // 16 STORE_ITEM_PHONOGRAPH
    2023,  // 17 STORE_ITEM_GARDENING_GLOVE
    2032,  // 18 STORE_ITEM_MUSHROOM_GARDEN
    2024,  // 19 STORE_ITEM_WHEEL_BARROW
    2025,  // 20 STORE_ITEM_STINKY_THE_SNAIL
    -1,  // 21 STORE_ITEM_PACKET_UPGRADE  // 无提示（原 case 空/无 case）
    2026,  // 22 STORE_ITEM_POOL_CLEANER
    2027,  // 23 STORE_ITEM_ROOF_CLEANER
    2028,  // 24 STORE_ITEM_RAKE
    2029,  // 25 STORE_ITEM_AQUARIUM_GARDEN
    -1,  // 26 STORE_ITEM_CHOCOLATE  // 无提示（原 case 空；r3 对拍抓获曾被误填 2030 树智慧台词）
    2030,  // 27 STORE_ITEM_TREE_OF_WISDOM
    2031,  // 28 STORE_ITEM_TREE_FOOD
    2033,  // 29 STORE_ITEM_FIRSTAID
    2034,  // 30 STORE_ITEM_PVZ
};
static_assert(sizeof(kStoreBubbleMessage) / sizeof(kStoreBubbleMessage[0]) ==
    (int)StoreItem::STORE_ITEM_PVZ + 1, "槽位须与 StoreItem 枚举同步");
}  // namespace

//0x48BAD0
void StoreScreen::UpdateMouse()
{
    mMouseOverItem = STORE_ITEM_INVALID;
    if (!CanInteractWithButtons()) return;
    int aMouseX = mApp->mWidgetManager->mLastMouseX - mX, aMouseY = mApp->mWidgetManager->mLastMouseY - mY;
    bool aShowFinger = false;
    for (int aItemPos = 0; aItemPos < MAX_PAGE_SPOTS; aItemPos++)
    {
        StoreItem aItemType = GetStoreItemType(aItemPos);
        if (aItemType != STORE_ITEM_INVALID && !IsItemUnavailable(aItemType))
        {
            int aItemX, aItemY;
            GetStorePosition(aItemPos, aItemX, aItemY);
            if (Rect(aItemX, aItemY, 50, 87).Contains(aMouseX, aMouseY))
            {
                mMouseOverItem = aItemType;
                int aMessageIndex = -1;
                // B 形态 -> 数据表（见上 kStoreBubbleMessage）；PACKET_UPGRADE 依
                // 购买量特例与 default 断言保留表外。
                if (aItemType == StoreItem::STORE_ITEM_PACKET_UPGRADE)
                {
        // 1073 004966D0 uses three exact cases and a default.
        // Avoid overflow in count+2011 and preserve that default.
        // （原 switch 的 break 落到 SetBubbleText；r3 对拍抓获本处 break 曾误出
        // for 循环跳过气泡与手指——2026-10-03 修复，不 break 向下流入）
        const int aCount = mApp->mPlayerInfo->mPurchases[STORE_ITEM_PACKET_UPGRADE];
        aMessageIndex = aCount == 0 ? 2011 : aCount == 1 ? 2012 : aCount == 2 ? 2013 : 2014;
                }
                else if (static_cast<unsigned>(aItemType) < static_cast<unsigned>((int)StoreItem::STORE_ITEM_PVZ + 1))
                {
                    aMessageIndex = kStoreBubbleMessage[aItemType];
                }
                else
                {
                    TOD_ASSERT(false);
                }

                if (mApp->mCrazyDaveMessageIndex != aMessageIndex)
                    SetBubbleText(aMessageIndex, 100, false);
                else mBubbleCountDown = 100;
                if (IsFullVersionOnly(aItemType) || (!IsItemSoldOut(aItemType) && !IsItemUnavailable(aItemType) && !IsComingSoon(aItemType)))
                    aShowFinger = true;
                break;
            }
        }
    }

    mApp->SetCursor(mBackButton->mIsOver || mPrevButton->mIsOver || mNextButton->mIsOver || aShowFinger ? CURSOR_HAND : CURSOR_POINTER);
}

//0x48BE30
void StoreScreen::StorePreload()
{
    ReanimatorEnsureDefinitionLoaded(REANIM_CRAZY_DAVE, true);
    ReanimatorEnsureDefinitionLoaded(REANIM_ZENGARDEN_FERTILIZER, true);
    mApp->CrazyDaveEnter();

    Plant::PreloadPlantResources(SeedType::SEED_GARLIC);
    Plant::PreloadPlantResources(SeedType::SEED_TWINSUNFLOWER);

    if (mApp->HasFinishedAdventure())
    {
        Plant::PreloadPlantResources(SeedType::SEED_GLOOMSHROOM);
        Plant::PreloadPlantResources(SeedType::SEED_CATTAIL);
        Plant::PreloadPlantResources(SeedType::SEED_WINTERMELON);
        Plant::PreloadPlantResources(SeedType::SEED_GOLD_MAGNET);
        Plant::PreloadPlantResources(SeedType::SEED_SPIKEROCK);
        Plant::PreloadPlantResources(SeedType::SEED_COBCANNON);
        Plant::PreloadPlantResources(SeedType::SEED_IMITATER);
    }
}

bool StoreScreen::CanInteractWithButtons()
{
    return mStoreTime >= 120 && !mBubbleClickToContinue && !mPurchaseDialoguePending &&
        mHatchTimer <= 0 && !mWaitForDialog;
}

//0x48BF60
void StoreScreen::Update()
{
    RefreshLayout();
    mApp->mMusic->MakeSureMusicIsPlaying(MUSIC_TUNE_TITLE_CRAZY_DAVE_MAIN_THEME);
    mApp->UpdateCrazyDave();

    // 更新 DataArray<Coin> 中的所有 Coin
    Coin* aCoin = nullptr;
    while (mCoins.IterateNext(aCoin))
    {
        if (!aCoin->mDead)
        {
            aCoin->Update();
        }
    }

    if (mWaitForDialog)
        return;

    if (mApp->mCrazyDaveState == CRAZY_DAVE_OFF)
    {
        if (mDrawnOnce)
        {
            StorePreload();
        }
        return;
    }

    mStoreTime++;
    if (mApp->mCrazyDaveState != CRAZY_DAVE_OFF && mApp->mCrazyDaveState != CRAZY_DAVE_ENTERING)
    {
        if (mHatchTimer > 0)
        {
            mHatchTimer--;
            mBackButton->mX -= mShakeX;
            mBackButton->mY -= mShakeY;
            mPrevButton->mX -= mShakeX;
            mPrevButton->mY -= mShakeY;
            mNextButton->mX -= mShakeX;
            mNextButton->mY -= mShakeY;

            /*
            if (mHatchTimer <= 35)
            {
                if (mHatchTimer == 0)
                {
                    EnableButtons(true);
                }
                mShakeY = 0;
            }
            else
            {
                mShakeY = RandRangeInt(1, 3);
            }
            mShakeX = 0;
            */

            if (mHatchTimer == 0)
            {
                EnableButtons(true);
                mShakeX = 0;
                mShakeY = 0;
            }
            else
            {
                mShakeX = 0;
                if (mHatchTimer > 35)
                {
                    mShakeY = RandRangeInt(1, 3);
                }
                else
                {
                    mShakeY = 0;
                }
            }
            
            mBackButton->mX += mShakeX;
            mBackButton->mY += mShakeY;
            mPrevButton->mX += mShakeX;
            mPrevButton->mY += mShakeY;
            mNextButton->mX += mShakeX;
            mNextButton->mY += mShakeY;
        }
        else if (mStartDialog != -1)
        {
            SetBubbleText(mStartDialog, 0, true);
            mStartDialog = -1;
        }
        else if (!mBubbleClickToContinue)
        {
            if (mBubbleCountDown > 0)
            {
                mBubbleCountDown--;
                if (mBubbleCountDown == 0)
                {
                    if (mApp->mSoundSystem->IsFoleyPlaying(FOLEY_CRAZY_DAVE_SHORT) || 
                        mApp->mSoundSystem->IsFoleyPlaying(FOLEY_CRAZY_DAVE_LONG) ||
                        mApp->mSoundSystem->IsFoleyPlaying(FOLEY_CRAZY_DAVE_EXTRA_LONG))
                    {
                        mBubbleCountDown = 1;
                    }
                    else
                    {
                        if (mPurchaseDialoguePending)
                            AdvanceCrazyDaveDialog();
                        else
                            mApp->CrazyDaveStopTalking();
                    }
                }
            }
            else
            {
                mAmbientSpeechCountDown--;
                if (mAmbientSpeechCountDown <= 0)
                {
                    TodWeightedArray aPickArray[4];
                    for (int i = 0; i < 4; i++)
                    {
                        int aMessage = 2015 + i;
                        aPickArray[i].mItem = aMessage;
                        if (mPreviousAmbientSpeechIndex == aMessage)
                        {
                            aPickArray[i].mWeight = 0;
                        }
                        else if (i == 3)
                        {
                            aPickArray[i].mWeight = mApp->HasFinishedAdventure() ? 20 : 0;
                        }
                        else
                        {
                            aPickArray[i].mWeight = 100;
                        }
                    }

                    int aDaveMessage = TodPickFromWeightedArray(aPickArray, 4);
                    mPreviousAmbientSpeechIndex = aDaveMessage;
                    SetBubbleText(aDaveMessage, 800, false);
                    mAmbientSpeechCountDown = RandRangeInt(500, 1000);
                }
            }
        }
    }

    UpdateMouse();
    // 如果进入商店时为试玩版，而当前为完整版，且可以与按钮进行交互，则可以判断玩家已购买完整版
    if (CanInteractWithButtons() && mTrialLockedWhenStoreOpened && !mApp->IsTrialStageLocked())
    {
        mPurchasedFullVersion = true;
        mResult = Dialog::ID_OK;
    }
    else
    {
        Widget::Update();
        MarkDirty();
    }
}

//0x48C350
void StoreScreen::AddedToManager(WidgetManager* theWidgetManager)
{
    RefreshLayout();
    WidgetContainer::AddedToManager(theWidgetManager);
    AddWidget(mBackButton);
    AddWidget(mPrevButton);
    AddWidget(mNextButton);
    AddWidget(mOverlayWidget);
}

//0x48C3B0
void StoreScreen::RemovedFromManager(WidgetManager* theWidgetManager)
{
    // Finish only our own child, never a later dialog reusing the same id.
    if (mPurchaseDialog)
        mApp->SexyAppBase::KillDialog(mPurchaseDialog);
    WidgetContainer::RemovedFromManager(theWidgetManager);
    RemoveWidget(mBackButton);
    RemoveWidget(mPrevButton);
    RemoveWidget(mNextButton);
    RemoveWidget(mOverlayWidget);
    mApp->CrazyDaveDie();
}

//0x48C410
void StoreScreen::ButtonPress(int theId)
{
    if (theId != StoreScreen::StoreScreen_Prev && theId != StoreScreen::StoreScreen_Next)
        mApp->PlaySample(Sexy::SOUND_BUTTONCLICK);
}

//0x48C440
bool StoreScreen::IsPageShown(StorePages thePage)
{
    // 试玩模式下，仅显示默认页
    if (mApp->IsTrialStageLocked()) return thePage == STORE_PAGE_SLOT_UPGRADES;
    // 一周目完成后，所有页全解锁
    if (mApp->HasFinishedAdventure()) return true;
    // 到达或已通过冒险模式 5-2 关卡时，显示紫卡页
    if (thePage == STORE_PAGE_PLANT_UPGRADES) return mApp->mPlayerInfo->mLevel >= 42;
    // 到达或已通过冒险模式 5-5 关卡时，显示花园工具页
    if (thePage == STORE_PAGE_ZEN1) return mApp->mPlayerInfo->mLevel >= 45;
    // 冒险模式未完成时，不显示智慧树工具页
    return thePage != STORE_PAGE_ZEN2;
}

//0x48C4D0
void StoreScreen::ButtonDepress(int theId)
{
    if (theId == StoreScreen::StoreScreen_Back)
        mResult = 1000;
    else if (theId == StoreScreen::StoreScreen_Prev || theId == StoreScreen::StoreScreen_Next)
    {
        mHatchTimer = 50;
        mApp->PlaySample(Sexy::SOUND_HATCHBACK_CLOSE);
        mBubbleCountDown = 0;
        mApp->CrazyDaveStopTalking();
        EnableButtons(false);
        do
        {
            if (theId == StoreScreen::StoreScreen_Prev)
            {
                mPage = (StorePages)(mPage - 1);
                if (mPage < STORE_PAGE_SLOT_UPGRADES)
                {
                    mPage = STORE_PAGE_ZEN2;
                }
            }
            else
            {
                mPage = (StorePages)(mPage + 1);
                if (mPage >= NUM_STORE_PAGES)
                {
                    mPage = STORE_PAGE_SLOT_UPGRADES;
                }
            }
        } while (!IsPageShown(mPage));
    }
}

//0x48C5F0
void StoreScreen::KeyChar(char theChar)
{
    if (mBubbleClickToContinue && (theChar == ' ' || theChar == '\r')) AdvanceCrazyDaveDialog();
}

//0x48C620
int StoreScreen::GetItemCost(StoreItem theStoreItem)
{
    if (theStoreItem == STORE_ITEM_BONUS_LAWN_MOWER)    return gLawnApp->mPlayerInfo->mPurchases[STORE_ITEM_BONUS_LAWN_MOWER] ? 500 : 200;
    if (theStoreItem == STORE_ITEM_PACKET_UPGRADE)
    {
        int aPurchase = gLawnApp->mPlayerInfo->mPurchases[STORE_ITEM_PACKET_UPGRADE];
        return aPurchase == 0 ? 75 : aPurchase == 1 ? 500 : aPurchase == 2 ? 2000 : 8000;
    }

    // 商店常量价：按 StoreItem 槽位直查（行序 = 枚举序）；-1 = 无定价项（断言拦截）。
    static constexpr int kStoreItemCosts[] = {
        500,    // STORE_ITEM_PLANT_GATLINGPEA
        500,    // STORE_ITEM_PLANT_TWINSUNFLOWER
        750,    // STORE_ITEM_PLANT_GLOOMSHROOM
        1000,   // STORE_ITEM_PLANT_CATTAIL
        1000,   // STORE_ITEM_PLANT_WINTERMELON
        300,    // STORE_ITEM_PLANT_GOLD_MAGNET
        750,    // STORE_ITEM_PLANT_SPIKEROCK
        2000,   // STORE_ITEM_PLANT_COBCANNON
        3000,   // STORE_ITEM_PLANT_IMITATER
        -1,     // STORE_ITEM_BONUS_LAWN_MOWER（动态价，前置分支处理）
        250,    // STORE_ITEM_POTTED_MARIGOLD_1
        250,    // STORE_ITEM_POTTED_MARIGOLD_2
        250,    // STORE_ITEM_POTTED_MARIGOLD_3
        1000,   // STORE_ITEM_GOLD_WATERINGCAN
        75,     // STORE_ITEM_FERTILIZER
        100,    // STORE_ITEM_BUG_SPRAY
        1500,   // STORE_ITEM_PHONOGRAPH
        100,    // STORE_ITEM_GARDENING_GLOVE
        3000,   // STORE_ITEM_MUSHROOM_GARDEN
        20,     // STORE_ITEM_WHEEL_BARROW
        300,    // STORE_ITEM_STINKY_THE_SNAIL
        -1,     // STORE_ITEM_PACKET_UPGRADE（阶梯价，前置分支处理）
        100,    // STORE_ITEM_POOL_CLEANER
        300,    // STORE_ITEM_ROOF_CLEANER
        20,     // STORE_ITEM_RAKE
        3000,   // STORE_ITEM_AQUARIUM_GARDEN
        -1,     // STORE_ITEM_CHOCOLATE（无定价）
        1000,   // STORE_ITEM_TREE_OF_WISDOM
        250,    // STORE_ITEM_TREE_FOOD
        200,    // STORE_ITEM_FIRSTAID
        -1,     // STORE_ITEM_PVZ（无定价）
    };
    if ((unsigned)theStoreItem < sizeof(kStoreItemCosts) / sizeof(kStoreItemCosts[0]) && kStoreItemCosts[theStoreItem] >= 0)
    {
        return kStoreItemCosts[theStoreItem];
    }
    TOD_ASSERT(false);
    return 0;
}

bool StoreScreen::CanAffordItem(StoreItem theStoreItem)
{
    return mApp->mPlayerInfo->mCoins >= GetItemCost(theStoreItem);
}

//0x48C740
// GOTY @Patoke: 0x497340
void StoreScreen::PurchaseItem(StoreItem theStoreItem)
{
    if (mWaitForDialog)
        return;
    StorePurchaseSession aSession(*this);
    if (!aSession.IsCurrent() || IsComingSoon(theStoreItem) ||
        IsItemUnavailable(theStoreItem) || IsItemSoldOut(theStoreItem))
        return;

    const int aQuotedCost = GetItemCost(theStoreItem);
    const int aQuotedStock = mApp->mPlayerInfo->mPurchases[theStoreItem];
    PottedPlant aQuotedPlant = mPottedPlantSpecs;
    mApp->SetCursor(CURSOR_POINTER);
    mBubbleCountDown = 0;
    mApp->CrazyDaveStopTalking();
    if (!CanAffordItem(theStoreItem))
    {
        // @Patoke: fix locals
        Dialog* aDialog = ShowPurchaseDialog(DIALOG_NOT_ENOUGH_MONEY,
            ("Not enough money"), 
            ("You can't afford this item yet. Earn more coins by killing zombies!"), 
            gStr.DIALOG_BUTTON_OK, BUTTONS_FOOTER);
        WaitForPurchaseDialog(aDialog);
    }
    else
    {
        LawnDialog* aComfirmDialog = ShowPurchaseDialog(
            DIALOG_STORE_PURCHASE, 
            ("Buy this item?"), 
            ("Are you sure you want to buy this item?"), 
            (""), 
            BUTTONS_YES_NO
        );
        aComfirmDialog->mYesButton->mLabel = gStr.DIALOG_BUTTON_YES;
        aComfirmDialog->mNoButton->mLabel = gStr.DIALOG_BUTTON_NO;

        int aComfirmResult = WaitForPurchaseDialog(aComfirmDialog);

        if (aComfirmResult == ID_OK && aSession.IsCurrent())
        {
            // Revalidate the quoted inventory before committing. In particular,
            // AddCoins clamps at zero; it must not grant an unaffordable item.
            if (mApp->mPlayerInfo->mPurchases[theStoreItem] != aQuotedStock ||
                GetItemCost(theStoreItem) != aQuotedCost || IsComingSoon(theStoreItem) ||
                IsItemUnavailable(theStoreItem) || IsItemSoldOut(theStoreItem) ||
                (IsPottedPlant(theStoreItem) && mApp->mPlayerInfo->mNumPottedPlants >= MAX_POTTED_PLANTS))
                return;
            if (mApp->mPlayerInfo->mCoins < aQuotedCost)
            {
                WaitForPurchaseDialog(ShowPurchaseDialog(DIALOG_NOT_ENOUGH_MONEY,
                    ("Not enough money"),
                    ("You can't afford this item yet. Earn more coins by killing zombies!"),
                    gStr.DIALOG_BUTTON_OK, BUTTONS_FOOTER));
                return;
            }
            mApp->mPlayerInfo->AddCoins(-aQuotedCost);
            if (theStoreItem == STORE_ITEM_PACKET_UPGRADE)
            {
                ++mApp->mPlayerInfo->mPurchases[theStoreItem];
                SexyString aDialogLines = StrFormat(("Now you can choose to take %d seeds with you per level!"), 6 + mApp->mPlayerInfo->mPurchases[theStoreItem]);
                // This is already a completed purchase. Persist before another
                // modal wait can close the shop or replace the active user.
                mApp->WriteCurrentUserConfig();
                Dialog* aDialog = ShowPurchaseDialog(DIALOG_UPGRADED, ("More slots!"), aDialogLines, gStr.DIALOG_BUTTON_OK, BUTTONS_FOOTER);

                WaitForPurchaseDialog(aDialog);
                if (!aSession.IsCurrent())
                    return;

                if (mApp->mBoard)
                {
                    mApp->mBoard->mSeedBank->UpdateWidth();
                }
            }
            else if (theStoreItem == STORE_ITEM_BONUS_LAWN_MOWER)
            {
                mApp->mPlayerInfo->mPurchases[theStoreItem]++;
            }
            else if (theStoreItem == STORE_ITEM_RAKE)
            {
                mApp->mPlayerInfo->mPurchases[theStoreItem] = 3;
            }
            else if (theStoreItem == STORE_ITEM_STINKY_THE_SNAIL)
            {
                mApp->mPlayerInfo->mPurchases[theStoreItem] = StinkyTimestamp::EncodeWakeTime(std::time(nullptr));
            }
            else if (theStoreItem == STORE_ITEM_FERTILIZER || theStoreItem == STORE_ITEM_BUG_SPRAY)
            {
                if (mApp->mPlayerInfo->mPurchases[theStoreItem] < PURCHASE_COUNT_OFFSET)
                {
                    mApp->mPlayerInfo->mPurchases[theStoreItem] = PURCHASE_COUNT_OFFSET;
                }
                mApp->mPlayerInfo->mPurchases[theStoreItem] += 5;
            }
            else if (theStoreItem == STORE_ITEM_TREE_FOOD)
            {
                if (mApp->mPlayerInfo->mPurchases[theStoreItem] < PURCHASE_COUNT_OFFSET)
                {
                    mApp->mPlayerInfo->mPurchases[theStoreItem] = PURCHASE_COUNT_OFFSET;
                }
                mApp->mPlayerInfo->mPurchases[theStoreItem]++;
            }
            else if (theStoreItem == STORE_ITEM_TREE_OF_WISDOM)
            {
                mApp->mPlayerInfo->mPurchases[theStoreItem] = 1;
                // GOTY 1073 (00497340): challenge record slot 49 = v1 TREE(50)-1。
                // 存档 v13 起槽位=GameMode 直下标，即 records[TREE_OF_WISDOM]。
                mApp->mPlayerInfo->mChallengeRecords[(int)GameMode::GAMEMODE_TREE_OF_WISDOM] = 1;

                mApp->WriteCurrentUserConfig();
                LawnDialog* aDialog = ShowPurchaseDialog(
                    DIALOG_STORE_PURCHASE, 
                    gStr.VISIT_TREE_HEADER, 
                    gStr.VISIT_TREE_BODY, 
                    (""), 
                    BUTTONS_YES_NO
                );
                aDialog->mYesButton->mLabel = gStr.DIALOG_BUTTON_YES;
                aDialog->mNoButton->mLabel = gStr.DIALOG_BUTTON_NO;

                int aResult = WaitForPurchaseDialog(aDialog);
                if (!aSession.IsCurrent())
                    return;

                if (aResult == ID_OK)
                {
                    mGoToTreeNow = true;
                    mResult = aResult;
                }
            }
            else if (IsPottedPlant(theStoreItem))
            {
                mApp->mZenGarden->AddPottedPlant(&aQuotedPlant);
                mPottedPlantSpecs.InitializePottedPlant(SEED_MARIGOLD);
                mPottedPlantSpecs.mDrawVariation = (DrawVariation)RandRangeInt(VARIATION_MARIGOLD_WHITE, VARIATION_MARIGOLD_LIGHT_GREEN);
                mApp->mPlayerInfo->mPurchases[theStoreItem] = GetCurrentDaysSince2000();
            }
            else
            {
                TOD_ASSERT(theStoreItem >= STORE_ITEM_PLANT_GATLINGPEA && theStoreItem < (StoreItem)MAX_PURCHASES);
                mApp->mPlayerInfo->mPurchases[theStoreItem] = 1;
            }

            if (theStoreItem == STORE_ITEM_FIRSTAID)
            {
                SetBubbleText(3400, 800, false);
            }

            if (mApp->mSeedChooserScreen)
            {
                mApp->mSeedChooserScreen->UpdateAfterPurchase();
            }

            bool aGiveAchievement = theStoreItem >= STORE_ITEM_PLANT_GATLINGPEA &&
                                    theStoreItem <= STORE_ITEM_PLANT_IMITATER;
            for (int aSeedType = SEED_GATLINGPEA; aGiveAchievement && aSeedType <= SEED_IMITATER; aSeedType++) {
                if (!mApp->SeedTypeAvailable(SeedType(aSeedType)))
                    aGiveAchievement = false;
            }

            if (aGiveAchievement) {
                ReportAchievement::GiveAchievement(mApp, Morticulturalist, aGiveAchievement); // @Patoke: add achievement
                // 1073 PurchaseItem (00497340): first line is timed, then the
                // normal click-through continuation takes over.
                SetBubbleText(4000, 150, false);
                mPurchaseDialoguePending = true;
            }

            mApp->WriteCurrentUserConfig();
        }
    }
}

//0x48CF50
void StoreScreen::AdvanceCrazyDaveDialog()
{
    if (!mBubbleClickToContinue && !mPurchaseDialoguePending)
        return;

    // “嘿，我的邻居！我有一些新东西出售啦！”
    if (mApp->mCrazyDaveMessageIndex == 3100)
    {
        mHatchTimer = 150;
        mHatchOpen = true;
        mApp->PlaySample(Sexy::SOUND_HATCHBACK_OPEN);
    }
    if (!mApp->AdvanceCrazyDaveText())
    {
        mApp->CrazyDaveStopTalking();
        mBubbleClickToContinue = false;
        mPurchaseDialoguePending = false;
        mAmbientSpeechCountDown = 500;
        if (mHatchTimer == 0)
        {
            EnableButtons(true);
        }
    }
    else
    {
        SetBubbleText(mApp->mCrazyDaveMessageIndex, 0, true);
    }

    int aMessage = mApp->mCrazyDaveMessageIndex;
    if (aMessage == 303 || aMessage == 606 || aMessage == 2601)
    {
        mHatchTimer = 150;
        mHatchOpen = true;
        mApp->PlaySample(Sexy::SOUND_HATCHBACK_OPEN);
    }
    else if (aMessage == 603)
    {
        mApp->mPlayerInfo->mNeedsMagicTacoReward = false;
        mApp->WriteCurrentUserConfig();
        mApp->PlaySample(Sexy::SOUND_DIAMOND);
        Coin* aCoin = mCoins.DataArrayAlloc();
        aCoin->CoinInitialize(80, 520, COIN_DIAMOND, COIN_MOTION_FROM_PRESENT);
        aCoin->mVelX = 0;
        aCoin->mVelY = -5;
    }
    else if (aMessage == 902 || aMessage == 1002)
    {
        mApp->mPlayerInfo->AddCoins(100);
    }
}

//0x48D130
void StoreScreen::MouseDown(int x, int y, int theClickCount)
{
    const int previousX = mX, previousY = mY;
    RefreshLayout();
    x += previousX - mX;
    y += previousY - mY;
    (void)theClickCount;
    if (mBubbleClickToContinue)
    {
        AdvanceCrazyDaveDialog();
        return;
    }
    if (!CanInteractWithButtons()) return;
    for (int aItemPos = 0; aItemPos < MAX_PAGE_SPOTS; aItemPos++)
    {
        StoreItem aItemType = GetStoreItemType(aItemPos);
        if (aItemType == STORE_ITEM_INVALID) continue;
        int aItemX, aItemY;
        GetStorePosition(aItemPos, aItemX, aItemY);
        if (Rect(aItemX, aItemY, 50, 87).Contains(x, y))
        {
            if (IsFullVersionOnly(aItemType))
            {
                mWaitForDialog = true;
                mApp->LawnMessageBox(DIALOG_MESSAGE, gStr.GET_FULL_VERSION_TITLE.c_str(), gStr.FULL_VERSION_TO_BUY.c_str(), gStr.DIALOG_BUTTON_OK.c_str(), "", BUTTONS_FOOTER);
                mWaitForDialog = false;
            }
            else if (aItemType == STORE_ITEM_PVZ)
            {
                mWaitForDialog = true;
                int aResult = mApp->LawnMessageBox(
                    DIALOG_MESSAGE, gStr.BUY_PVZ_TITLE.c_str(), gStr.BUY_PVZ_BODY.c_str(), gStr.GET_FULL_VERSION_YES_BUTTON.c_str(), gStr.GET_FULL_VERSION_NO_BUTTON.c_str(), BUTTONS_YES_NO);
                mWaitForDialog = false;
                if (aResult == ID_OK)
                {
                    if (mApp->mDRM) mApp->mDRM->BuyGame();
                }
            }
            else if(!IsItemSoldOut(aItemType) && !IsItemUnavailable(aItemType) && !IsComingSoon(aItemType))
                PurchaseItem(aItemType);
            break;
        }
    }
}

//0x48D2E0
void StoreScreen::EnableButtons(bool theEnable)
{
    if (mEasyBuyingCheat || IsPageShown(STORE_PAGE_PLANT_UPGRADES) || !theEnable)
    {
        mNextButton->mMouseVisible = theEnable;
        mNextButton->SetDisabled(!theEnable);
        mPrevButton->mMouseVisible = theEnable;
        mPrevButton->SetDisabled(!theEnable);
    }
    mBackButton->mMouseVisible = theEnable;
    mBackButton->SetDisabled(!theEnable);
}

//0x48D3A0
// GOTY @Patoke: 0x498110
void StoreScreen::SetupForIntro(int theDialogIndex)
{
    mStartDialog = theDialogIndex;
    mHatchOpen = false;
    mBackButton->mLabel = gStr.STORE_NEXT_LEVEL_BUTTON;
    EnableButtons(false);
}
