#include "PortableStorePurchaseSmoke.h"
#include "LawnCommon.h"
#include "ModernVulkanSmoke.h"
#include "LawnApp.h"
#include "Board.h"
#include "SeedPacket.h"
#include "ZenGarden.h"
#include "System/PlayerInfo.h"
#include "Widget/StoreScreen.h"
#include "Widget/LawnDialog.h"
#include "widget/WidgetManager.h"
#include "widget/WidgetLifetimeHold.h"
#include <array>
#include <fstream>
#include <memory>
#include <optional>
#include <stdexcept>

namespace {
using namespace ModernSmoke;
void Require(bool ok,const char* why){if(!ok)throw std::runtime_error(why);}
struct AppAccess:LawnApp{static constexpr auto Cleanup=&AppAccess::ProcessSafeDeleteList;};
class ObservedStore final:public StoreScreen{
    bool& dead;
public:
    ObservedStore(LawnApp& app,bool& flag):StoreScreen(&app),dead(flag){}
    ~ObservedStore()override{dead=true;}
};
ObservedStore* Open(LawnApp& app,bool& dead){
    Require(!app.GetDialog(DIALOG_STORE),"Fixture already has a store");
    auto* store=new ObservedStore(app,dead);app.AddDialog(store);app.mWidgetManager->SetFocus(store);store->StorePreload();
    return store;
}
void Init(PlayerInfo& p,int id,int coins){
    p.mId=id;p.mUseSeq=1;p.mName="Purchase fixture "+std::to_string(id);
    p.mCoins=coins;p.mLevel=50;p.mFinishedAdventure=1;p.SaveDetails();
}
enum class Change{Yes,No,Cancel,MoneyDrop,MoneyRise,Stock,Profile,Reincarnate,Epoch,Close,Replace,Reenter,Board,Spec,Full,ChildReplace,Keyboard,Throw};
struct Case{const char* name;StoreItem item;Change change=Change::Yes;int stage=0,coins=5000,stock=0;bool visit=false;};
constexpr std::array cases{
    Case{"buy",STORE_ITEM_POOL_CLEANER},Case{"no",STORE_ITEM_POOL_CLEANER,Change::No},
    Case{"cancel",STORE_ITEM_POOL_CLEANER,Change::Cancel},Case{"poor",STORE_ITEM_POOL_CLEANER,Change::Yes,0,50},
    Case{"balance-fell",STORE_ITEM_POOL_CLEANER,Change::MoneyDrop},Case{"balance-grew",STORE_ITEM_POOL_CLEANER,Change::MoneyRise},
    Case{"stock-changed",STORE_ITEM_POOL_CLEANER,Change::Stock},Case{"user-changed",STORE_ITEM_POOL_CLEANER,Change::Profile},
    Case{"same-address-new-user",STORE_ITEM_POOL_CLEANER,Change::Reincarnate},Case{"user-reloaded",STORE_ITEM_POOL_CLEANER,Change::Epoch},
    Case{"closed-before-buy",STORE_ITEM_POOL_CLEANER,Change::Close},Case{"replaced-before-buy",STORE_ITEM_POOL_CLEANER,Change::Replace},
    Case{"reentrant-buy",STORE_ITEM_POOL_CLEANER,Change::Reenter},Case{"slot-buy",STORE_ITEM_PACKET_UPGRADE},
    Case{"slot-price-changed",STORE_ITEM_PACKET_UPGRADE,Change::Stock},
    Case{"slot-info-close",STORE_ITEM_PACKET_UPGRADE,Change::Close,1},
    Case{"slot-info-user",STORE_ITEM_PACKET_UPGRADE,Change::Profile,1},
    Case{"slot-info-board",STORE_ITEM_PACKET_UPGRADE,Change::Board,1},
    Case{"tree-stay",STORE_ITEM_TREE_OF_WISDOM},Case{"tree-visit",STORE_ITEM_TREE_OF_WISDOM,Change::Yes,0,5000,0,true},
    Case{"tree-info-close",STORE_ITEM_TREE_OF_WISDOM,Change::Close,1,5000,0,true},
    Case{"tree-info-user",STORE_ITEM_TREE_OF_WISDOM,Change::Profile,1,5000,0,true},
    Case{"fertilizer",STORE_ITEM_FERTILIZER,Change::Yes,0,5000,PURCHASE_COUNT_OFFSET},
    Case{"fertilizer-stock",STORE_ITEM_FERTILIZER,Change::Stock,0,5000,PURCHASE_COUNT_OFFSET},
    Case{"potted",STORE_ITEM_POTTED_MARIGOLD_1},Case{"potted-quote",STORE_ITEM_POTTED_MARIGOLD_1,Change::Spec},
    Case{"same-id-late-input",STORE_ITEM_POOL_CLEANER,Change::ChildReplace},
    Case{"keyboard-buy",STORE_ITEM_POOL_CLEANER,Change::Keyboard},
    Case{"exception-unwind",STORE_ITEM_POOL_CLEANER,Change::Throw}};

class NestedCancel final:public Widget{
    LawnApp& app;Dialog* original;
public:
    unsigned answers=0;
    NestedCancel(LawnApp& a,Dialog* d):app(a),original(d){mMouseVisible=false;mWidgetFlagsMod.mAddFlags=WIDGETFLAGS_UPDATE;app.mWidgetManager->AddWidget(this);}
    ~NestedCancel()override{if(mWidgetManager)mWidgetManager->RemoveWidget(this);}
    void Update()override{
        auto* d=app.GetDialog(DIALOG_STORE_PURCHASE);
        if(d&&d!=original){++answers;d->ButtonDepress(Dialog::ID_NO);}
    }
};
class Reply final:public Widget{
    LawnApp& app;ObservedStore& store;std::optional<PlayerInfo>& a;PlayerInfo& b;const Case& test;bool& dead;bool& replacementDead;
    Dialog* last=nullptr;unsigned ticks=0;
public:
    unsigned answers=0,nestedAnswers=0;
    bool changed=false,held=true,earlyDurable=true,information=false,lateInputSafe=true;
    std::unique_ptr<WidgetLifetimeHold> emergency;
    Board* replacementBoard=nullptr;
    Reply(LawnApp& x,ObservedStore& s,std::optional<PlayerInfo>& first,PlayerInfo& second,const Case& c,bool& gone,bool& newGone)
      :app(x),store(s),a(first),b(second),test(c),dead(gone),replacementDead(newGone){
        mMouseVisible=false;mWidgetFlagsMod.mAddFlags=WIDGETFLAGS_UPDATE;app.mWidgetManager->AddWidget(this);
    }
    ~Reply()override{if(mWidgetManager)mWidgetManager->RemoveWidget(this);}
    void Update()override{
        if(++ticks>800)throw std::runtime_error("Purchase responder timed out");
        Dialog* d=app.GetDialog(DIALOG_NOT_ENOUGH_MONEY);
        if(!d)d=app.GetDialog(DIALOG_UPGRADED);
        if(!d)d=app.GetDialog(DIALOG_STORE_PURCHASE);
        if(!d||d==last)return;
        if(auto* lawn=dynamic_cast<LawnDialog*>(d);lawn&&lawn->mButtonDelay>=0&&lawn->mUpdateCnt<=unsigned(lawn->mButtonDelay))return;
        last=d;
        const int stage=answers?1:0;++answers;
        WidgetLifetimeHold child(*d);
        held &= store.mDeferredDeleteHolds>0;
        if(!store.mDeferredDeleteHolds&&!emergency)emergency=std::make_unique<WidgetLifetimeHold>(store);
        if(stage==1&&d->mId!=DIALOG_NOT_ENOUGH_MONEY){
            information=true;PlayerInfo loaded;loaded.mId=a->mId;
            earlyDurable &= loaded.LoadDetails()&&loaded.mCoins==a->mCoins&&loaded.mPurchases[test.item]==a->mPurchases[test.item];
        }
        if(!changed&&stage==test.stage){
            changed=true;
            switch(test.change){
            case Change::MoneyDrop:a->mCoins=1;a->SaveDetails();break;
            case Change::MoneyRise:a->mCoins+=500;a->SaveDetails();break;
            case Change::Stock:++a->mPurchases[test.item];a->SaveDetails();break;
            case Change::Profile:app.mPlayerInfo=&b;break;
            case Change::Reincarnate:a.reset();a.emplace();Init(*a,930003,5000);app.mPlayerInfo=&*a;break;
            case Change::Epoch:++a->mUseSeq;break;
            case Change::Close:app.KillStoreScreen();break;
            case Change::Replace:app.KillStoreScreen();Open(app,replacementDead);break;
            case Change::Reenter:{NestedCancel nested(app,d);store.PurchaseItem(STORE_ITEM_ROOF_CLEANER);nestedAnswers=nested.answers;break;}
            case Change::Board:
                app.PreNewGame(GAMEMODE_MINIGAME_WAR_AND_PEAS,false);replacementBoard=app.mBoard;
                replacementBoard->mSeedBank->mWidth=123;break;
            case Change::Spec:
                store.mPottedPlantSpecs.mDrawVariation=store.mPottedPlantSpecs.mDrawVariation==VARIATION_MARIGOLD_WHITE?
                    VARIATION_MARIGOLD_LIGHT_GREEN:VARIATION_MARIGOLD_WHITE;break;
            case Change::Full:
                a->mNumPottedPlants=MAX_POTTED_PLANTS;
                for(auto& p:a->mPottedPlant){p.InitializePottedPlant(SEED_MARIGOLD);p.mWhichZenGarden=GARDEN_MAIN;}
                a->SaveDetails();break;
            case Change::ChildReplace:{
                auto* newer=app.DoDialog(DIALOG_STORE_PURCHASE,true,"Replacement","Unanswered successor","",Dialog::BUTTONS_YES_NO);
                d->ButtonDepress(Dialog::ID_YES);
                d->KeyDown(KEYCODE_RETURN);
                lateInputSafe=app.GetDialog(DIALOG_STORE_PURCHASE)==newer&&newer->mResult==0x7fffffff;
                app.SexyAppBase::KillDialog(newer);
                break;
            }
            case Change::Throw:throw std::runtime_error("Expected purchase callback unwind");
            default:break;
            }
        }
        (app.*AppAccess::Cleanup)();Require(!dead,"Purchase caller died inside its own modal wait");
        if(app.GetDialog(d->mId)!=d)return;
        if(test.change==Change::Cancel&&stage==0){app.KillDialog(d->mId);return;}
        const int response=d->mId==DIALOG_NOT_ENOUGH_MONEY?Dialog::ID_YES:
            (test.change==Change::No&&stage==0)||(test.item==STORE_ITEM_TREE_OF_WISDOM&&stage==1&&!test.visit)?Dialog::ID_NO:Dialog::ID_YES;
        if(test.change==Change::Keyboard)d->KeyDown(KEYCODE_RETURN);
        else d->ButtonDepress(response);
    }
};
bool Run(LawnApp& app,const Case& test,std::ostream& log){
    log<<"begin "<<test.name<<std::endl;
    app.KillStoreScreen();app.KillBoard();app.KillGameSelector();(app.*AppAccess::Cleanup)();app.CrazyDaveDie();
    auto* original=app.mPlayerInfo;
    std::optional<PlayerInfo> a{std::in_place};PlayerInfo b;
    Init(*a,930001,test.coins);Init(b,930002,7000);a->mPurchases[test.item]=test.stock;a->SaveDetails();
    app.mPlayerInfo=&*a;app.mGameMode=GAMEMODE_ADVENTURE;app.mGameScene=SCENE_MENU;
    const int price=StoreScreen::GetItemCost(test.item);
    const bool preserves=test.change==Change::Yes||test.change==Change::MoneyRise||test.change==Change::Reenter||test.change==Change::Spec||test.change==Change::Keyboard;
    const bool bought=test.coins>=price&&(test.stage==1||preserves);
    bool dead=false,newDead=false;auto* store=Open(app,dead);const auto offered=store->mPottedPlantSpecs.mDrawVariation;
    Reply reply(app,*store,a,b,test,dead,newDead);
    const int depthBefore=app.mUpdateAppDepth;
    bool unwound=false;
    try { store->PurchaseItem(test.item); }
    catch(const std::runtime_error& e) {
        if(test.change!=Change::Throw||std::string(e.what())!="Expected purchase callback unwind")throw;
        unwound=true;
    }
    Require(!dead&&reply.answers>0,"Purchase returned without a live caller or confirmation");
    int coins=test.change==Change::MoneyDrop?1:test.coins+(test.change==Change::MoneyRise?500:0);
    if(test.change==Change::Reincarnate)coins=5000;
    if(bought)coins-=price;
    int stock=test.stock+(test.change==Change::Stock?1:0);
    if(bought){
        if(test.item==STORE_ITEM_PACKET_UPGRADE)++stock;
        else if(test.item==STORE_ITEM_FERTILIZER)stock=std::max(stock,PURCHASE_COUNT_OFFSET)+5;
        else if(StoreScreen::IsPottedPlant(test.item))stock=GetCurrentDaysSince2000();
        else stock=1;
    }
    bool memory=a->mCoins==coins&&a->mPurchases[test.item]==stock&&b.mCoins==7000&&!b.mPurchases[test.item];
    if(test.item==STORE_ITEM_TREE_OF_WISDOM)memory &= a->mChallengeRecords[(int)GameMode::GAMEMODE_TREE_OF_WISDOM]==int(bought);  // v13 直下标
    if(StoreScreen::IsPottedPlant(test.item)){
        const int count=test.change==Change::Full?MAX_POTTED_PLANTS:int(bought);
        memory &= a->mNumPottedPlants==count;
        if(bought)memory &= a->mPottedPlant[0].mDrawVariation==offered;
    }
    PlayerInfo diskA,diskB;diskA.mId=a->mId;diskB.mId=b.mId;
    bool disk=diskA.LoadDetails()&&diskB.LoadDetails()&&diskA.mCoins==coins&&diskA.mPurchases[test.item]==stock&&
        diskB.mCoins==7000&&!diskB.mPurchases[test.item];
    if(test.item==STORE_ITEM_TREE_OF_WISDOM)disk &= diskA.mChallengeRecords[(int)GameMode::GAMEMODE_TREE_OF_WISDOM]==int(bought);
    if(StoreScreen::IsPottedPlant(test.item)){
        disk &= diskA.mNumPottedPlants==a->mNumPottedPlants;
        if(bought)disk &= diskA.mPottedPlant[0].mDrawVariation==offered;
    }
    bool ui=!store->mWaitForDialog&&!store->mPurchaseDialog&&!app.GetDialog(DIALOG_STORE_PURCHASE)&&!app.GetDialog(DIALOG_UPGRADED)&&
        !app.GetDialog(DIALOG_NOT_ENOUGH_MONEY)&&!reply.nestedAnswers&&reply.lateInputSafe&&
        unwound==(test.change==Change::Throw)&&app.mUpdateAppDepth==depthBefore;
    const bool shouldVisit=test.item==STORE_ITEM_TREE_OF_WISDOM&&test.visit&&test.change==Change::Yes&&bought;
    ui &= store->mGoToTreeNow==shouldVisit;
    if(reply.replacementBoard)ui &= app.mBoard==reply.replacementBoard&&app.mBoard->mSeedBank->mWidth==123;
    const bool retired=test.change==Change::Close||test.change==Change::Replace;
    const bool ok=memory&&disk&&ui&&(!reply.information||reply.earlyDurable)&&(!retired||reply.held);
    log<<test.name<<" answers="<<reply.answers<<" memory="<<memory<<" disk="<<disk<<" ui="<<ui
       <<" early-durable="<<reply.earlyDurable<<" hold="<<reply.held<<" pass="<<ok
       <<" coinsA="<<a->mCoins<<" stockA="<<a->mPurchases[test.item]<<" coinsB="<<b.mCoins
       <<" update-depth="<<app.mUpdateAppDepth<<std::endl;
    reply.emergency.reset();app.KillStoreScreen();app.KillBoard();(app.*AppAccess::Cleanup)();
    Require(dead&&(test.change!=Change::Replace||newDead),"Purchase retained a retired shop");
    app.mPlayerInfo=original;
    return ok;
}
}
void PortableStorePurchaseSmoke(LawnApp& app){
    Require(app.mNoSoundNeeded&&getenv("PVZ_APPDATA_DIR")&&!app.mUpdateAppDepth,"Purchase probe must be isolated/no-audio");
    std::ofstream log(ProbePath("store-purchase-sessions.txt"));Require(bool(log),"Cannot write purchase evidence");
    unsigned failures=0;
    for(const auto& test:cases)failures+=!Run(app,test,log);
    log<<"cases="<<cases.size()<<" failures="<<failures<<std::endl;
    Require(!failures,"Purchase used a stale quote/caller/user or failed to persist its committed grant");
    // This full-capacity input would intentionally hit AddPottedPlant's fatal
    // bound in the unfixed build, so run it only after pre-commit checks pass.
    Require(Run(app,{"potted-became-full",STORE_ITEM_POTTED_MARIGOLD_1,Change::Full},log),"Full garden purchase was not cancelled");
    Report("portable-store-30-quote-user-owner-grant-persistence-cases",app);
}
