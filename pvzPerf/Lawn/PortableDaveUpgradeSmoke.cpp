#include "PortableDaveUpgradeSmoke.h"
#include "PortableStoreRegistration.h"
#include "ModernVulkanSmoke.h"
#include "LawnApp.h"
#include "Board.h"
#include "Cutscene.h"
#include "SeedPacket.h"
#include "System/PlayerInfo.h"
#include "Widget/LawnDialog.h"
#include "Widget/StoreScreen.h"
#include "Sexy.TodLib/TodStringFile.h"
#include "widget/WidgetManager.h"
#include "widget/WidgetLifetimeHold.h"
#include <algorithm>
#include <fstream>
#include <limits>
#include <memory>
#include <optional>
#include <stdexcept>

namespace {
using namespace ModernSmoke;
void Require(bool ok,const char* why){if(!ok)throw std::runtime_error(why);}
struct AppAccess:LawnApp{
    static constexpr auto Cleanup=&AppAccess::ProcessSafeDeleteList;
    static constexpr auto Queue=&AppAccess::mSafeDeleteList;
};
void Init(PlayerInfo& p,int id,int stock){
    p.mId=id;p.mUseSeq=1;p.mName="Dave upgrade fixture "+std::to_string(id);
    p.mLevel=stock?16:13;p.mCoins=5000;p.mPurchases[STORE_ITEM_PACKET_UPGRADE]=stock;p.SaveDetails();
}
Board* Open(LawnApp& app){
    app.KillBoard();app.KillGameSelector();app.KillChallengeScreen();(app.*AppAccess::Cleanup)();
    app.PreNewGame(GAMEMODE_ADVENTURE,false);app.KillSeedChooserScreen();
    auto* board=app.mBoard;board->mWidgetFlagsMod.mRemoveFlags|=WIDGETFLAGS_UPDATE;
    app.CrazyDaveDie();app.CrazyDaveEnter();return board;
}
enum class Change{Yes,No,Cancel,Skip,MoneyDrop,MoneyRise,Stock,Profile,Reuse,Epoch,Message,BoardGone,Replace,Reenter,Throw};
class Reply final:public Widget{
    LawnApp& app;Board& board;CutScene& cut;std::optional<PlayerInfo>& a;PlayerInfo& b;
    int stock;Change change;unsigned ticks=0;
public:
    bool answered=false,held=false,text=true,ownedClose=true,reentry=true;
    int expectedMessage=-1;
    Board* replacement=nullptr;
    std::unique_ptr<WidgetLifetimeHold> emergency;
    Reply(LawnApp& x,Board& original,std::optional<PlayerInfo>& first,PlayerInfo& second,int q,Change c)
      :app(x),board(original),cut(*original.mCutScene),a(first),b(second),stock(q),change(c){
        mMouseVisible=false;mWidgetFlagsMod.mAddFlags=WIDGETFLAGS_UPDATE;app.mWidgetManager->AddWidget(this);
    }
    ~Reply()override{if(mWidgetManager)mWidgetManager->RemoveWidget(this);}
    void Update()override{
        if(answered)return;
        Require(++ticks<700,"Dave upgrade responder timed out");
        auto* d=dynamic_cast<LawnDialog*>(app.GetDialog(DIALOG_PURCHASE_PACKET_SLOT));if(!d)return;
        if(d->mButtonDelay>=0&&d->mUpdateCnt<=unsigned(d->mButtonDelay))return;
        answered=true;held=board.mDeferredDeleteHolds>0;
        if(!held)emergency=std::make_unique<WidgetLifetimeHold>(board);
        WidgetLifetimeHold child(*d);
        const int price=stock?500:75;
        text=d->mDialogHeader==app.GetMoneyString(price)&&d->mDialogLines==TodReplaceNumberString(gStr.UPGRADE_DIALOG_BODY,UiTextPlaceholder::Slots,stock+7);
        switch(change){
        case Change::MoneyDrop:a->mCoins=1;a->SaveDetails();break;
        case Change::MoneyRise:a->mCoins+=500;a->SaveDetails();break;
        case Change::Stock:++a->mPurchases[STORE_ITEM_PACKET_UPGRADE];a->SaveDetails();break;
        case Change::Profile:app.mPlayerInfo=&b;break;
        case Change::Reuse:a.reset();a.emplace();Init(*a,950003,stock);app.mPlayerInfo=&*a;break;
        case Change::Epoch:++a->mUseSeq;break;
        case Change::Message:app.mCrazyDaveMessageIndex=1234;break;
        case Change::BoardGone:app.KillBoard();ownedClose=!app.GetDialog(DIALOG_PURCHASE_PACKET_SLOT);break;
        case Change::Replace:app.KillBoard();ownedClose=!app.GetDialog(DIALOG_PURCHASE_PACKET_SLOT);replacement=Open(app);replacement->mSunMoney=777;break;
        case Change::Reenter:cut.AdvanceCrazyDaveDialog(false);reentry=app.mCrazyDaveMessageIndex==(stock?1553:1503);break;
        case Change::Throw:throw std::runtime_error("Expected Dave upgrade unwind");
        default:break;
        }
        expectedMessage=app.mCrazyDaveMessageIndex;
        (app.*AppAccess::Cleanup)();
        if(app.GetDialog(DIALOG_PURCHASE_PACKET_SLOT)!=d)return;
        if(change==Change::Cancel)app.KillDialog(DIALOG_PURCHASE_PACKET_SLOT);
        else d->ButtonDepress(change==Change::No?Dialog::ID_NO:Dialog::ID_YES);
    }
};
bool Run(LawnApp& app,int stock,Change change,std::ostream& log){
    log<<"begin stock="<<stock<<" change="<<int(change)<<std::endl;
    app.KillDialog(DIALOG_PURCHASE_PACKET_SLOT);app.KillBoard();app.KillGameSelector();(app.*AppAccess::Cleanup)();
    auto* original=app.mPlayerInfo;std::optional<PlayerInfo> a{std::in_place};PlayerInfo b;
    Init(*a,950001,stock);Init(b,950002,stock);app.mPlayerInfo=&*a;
    auto* board=Open(app);auto* cut=board->mCutScene;
    Require(cut->mCrazyDaveDialogStart==(stock?1551:1501),"Fixture did not enter the original upgrade-offer level");
    app.CrazyDaveTalkIndex(stock?1552:1502);
    Reply reply(app,*board,a,b,stock,change);
    bool unwound=false;const int depth=app.mUpdateAppDepth;
    try{cut->AdvanceCrazyDaveDialog(change==Change::Skip);}
    catch(const std::runtime_error& error){
        if(change!=Change::Throw||std::string(error.what())!="Expected Dave upgrade unwind")throw;
        unwound=true;
    }
    const bool bought=change==Change::Yes||change==Change::MoneyRise||change==Change::Reenter;
    const bool declined=change==Change::No||change==Change::Cancel||change==Change::MoneyDrop;
    const int price=stock?500:75;
    const int coins=(change==Change::MoneyDrop?1:5000)+(change==Change::MoneyRise?500:0)-(bought?price:0);
    const int quantity=stock+int(bought)+int(change==Change::Stock);
    const bool memory=a->mCoins==coins&&a->mPurchases[STORE_ITEM_PACKET_UPGRADE]==quantity&&
        a->mDidntPurchasePacketUpgrade==int(declined)&&b.mCoins==5000&&
        b.mPurchases[STORE_ITEM_PACKET_UPGRADE]==stock&&!b.mDidntPurchasePacketUpgrade;
    PlayerInfo diskA,diskB;diskA.mId=a->mId;diskB.mId=b.mId;
    const bool disk=diskA.LoadDetails()&&diskB.LoadDetails()&&diskA.mCoins==coins&&
        diskA.mPurchases[STORE_ITEM_PACKET_UPGRADE]==quantity&&diskB.mCoins==5000&&diskB.mPurchases[STORE_ITEM_PACKET_UPGRADE]==stock;
    bool state=!app.GetDialog(DIALOG_PURCHASE_PACKET_SLOT)&&app.mUpdateAppDepth==depth&&unwound==(change==Change::Throw)&&reply.ownedClose;
    if(change==Change::Replace)state &= app.mBoard==reply.replacement&&app.mBoard->mSunMoney==777;
    else if(change==Change::BoardGone)state &= !app.mBoard;
    else state &= app.mBoard==board;
    if(bought)state &= board->mSeedBank->mNumPackets==stock+7&&app.mCrazyDaveMessageIndex==(stock?1560:1510);
    else if(declined)state &= app.mCrazyDaveMessageIndex==(stock?1570:1520);
    else if(change!=Change::Throw)state &= app.mCrazyDaveMessageIndex==(change==Change::Skip?(stock?1553:1503):reply.expectedMessage);
    const bool ok=memory&&disk&&state&&reply.text&&reply.reentry&&(change==Change::Skip?!reply.answered:reply.answered&&reply.held);
    log<<"memory="<<memory<<" disk="<<disk<<" state="<<state<<" text="<<reply.text<<" hold="<<reply.held
       <<" owned-close="<<reply.ownedClose<<" depth="<<app.mUpdateAppDepth<<" pass="<<ok
       <<" coins="<<a->mCoins<<" stock="<<a->mPurchases[STORE_ITEM_PACKET_UPGRADE]
       <<" declined="<<a->mDidntPurchasePacketUpgrade<<" message="<<app.mCrazyDaveMessageIndex<<std::endl;
    reply.emergency.reset();app.KillDialog(DIALOG_PURCHASE_PACKET_SLOT);app.KillBoard();(app.*AppAccess::Cleanup)();
    for(const auto& pending:app.*AppAccess::Queue)Require(pending.mWidget!=board,"Dave purchase retained its old Board");
    app.mPlayerInfo=original;return ok;
}
void Hover(LawnApp& app,std::ostream& log){
    auto* original=app.mPlayerInfo;PlayerInfo fixture;Init(fixture,950004,0);fixture.mFinishedAdventure=1;app.mPlayerInfo=&fixture;
    app.mGameMode=GAMEMODE_ADVENTURE;app.mGameScene=SCENE_MENU;
    const int oldX=app.mWidgetManager->mLastMouseX,oldY=app.mWidgetManager->mLastMouseY;
    {
        StoreScreen shop(&app);PortableStoreRegistration registration(app,shop);shop.StorePreload();shop.mStoreTime=120;
        int x,y;StoreScreen::GetStorePosition(0,x,y);app.mWidgetManager->mLastMouseX=x+25;app.mWidgetManager->mLastMouseY=y+40;
        for(int stock:{0,1,2,3,4,-1,std::numeric_limits<int>::min(),std::numeric_limits<int>::max()}){
            fixture.mPurchases[STORE_ITEM_PACKET_UPGRADE]=stock;shop.UpdateMouse();
            const int expected=stock==0?2011:stock==1?2012:stock==2?2013:2014;
            log<<"hover stock="<<stock<<" message="<<app.mCrazyDaveMessageIndex<<" expected="<<expected<<std::endl;
            Require(shop.mMouseOverItem==STORE_ITEM_PACKET_UPGRADE&&app.mCrazyDaveMessageIndex==expected,"Slot hover description differs from original switch");
        }
    }
    app.mWidgetManager->mLastMouseX=oldX;app.mWidgetManager->mLastMouseY=oldY;app.mPlayerInfo=original;
    Report("portable-store-eight-slot-description-original-switch",app);
}
}
void PortableDaveUpgradeSmoke(LawnApp& app){
    Require(app.mNoSoundNeeded&&getenv("PVZ_APPDATA_DIR")&&!app.mUpdateAppDepth,"Dave upgrade fixture must be isolated/no-audio");
    std::ofstream log(ProbePath("dave-slot-upgrade.txt"));Require(bool(log),"Cannot write Dave upgrade evidence");
    unsigned count=0,failures=0;
    const auto run=[&](int stock,Change change){failures+=!Run(app,stock,change,log);++count;};
    for(int stock:{0,1})for(Change change:{Change::Yes,Change::No,Change::Cancel,Change::Skip,Change::MoneyDrop,Change::MoneyRise,
        Change::Stock,Change::Profile,Change::Reuse,Change::Epoch,Change::Message})run(stock,change);
    log<<"safe-prefix cases="<<count<<" failures="<<failures<<std::endl;
    Require(!failures,"Dave upgrade committed an expired or unaffordable quote");
    // Owner destruction/reentry can dereference disposed animations in the
    // unfixed build; exercise them only after current-session checks pass.
    for(int stock:{0,1})for(Change change:{Change::BoardGone,Change::Replace,Change::Reenter,Change::Throw})run(stock,change);
    Require(count==30&&!failures,"Dave upgrade did not release or isolate its Board-owned wait");
    Hover(app,log);
    Report("portable-dave-30-upgrade-quote-session-dialogue-save-cases",app);
}
