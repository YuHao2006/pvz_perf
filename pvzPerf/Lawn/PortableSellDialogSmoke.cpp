#include "Sexy.TodLib/generated/EntityStrings.h"
#include "PortableSellDialogSmoke.h"
#include "ModernVulkanSmoke.h"
#include "LawnApp.h"
#include "Widget/LawnDialog.h"
#include "Widget/GameButton.h"
#include "widget/WidgetManager.h"
#include "Sexy.TodLib/TodStringFile.h"
#include <fstream>
#include <array>
#include <limits>
#include <memory>
#include <stdexcept>

void PortableSellDialogSmoke(LawnApp& app)
{
    using namespace Sexy;
    auto require=[](bool ok,const char* why){if(!ok) throw std::runtime_error(why);};
    require(!app.GetDialog(DIALOG_ZEN_SELL),"Sell dialog fixture would replace an existing dialog");
    auto* focus=app.mWidgetManager->mFocusWidget;
    struct RestoreFocus {WidgetManager& manager;Widget* focus;~RestoreFocus(){manager.SetFocus(focus);}}
        restoreFocus{*app.mWidgetManager,focus};
    const auto dialogs=app.mDialogMap.size();
    std::ofstream log(ModernSmoke::ProbePath("sell-dialog-cases.txt"));
    require(bool(log),"Cannot write sell dialog evidence");
    for(int result:std::array<int,3>{0,Dialog::ID_YES,Dialog::ID_NO})
    {
        // This auxiliary public API is not currently called by ZenGarden's
        // actual sale transaction. Test it explicitly without selling a plant,
        // entering a nested wait with no result, or changing the user's save.
        log<<"invoke helper result-case="<<result<<std::endl;
        app.DoConfirmSellDialog("Isolated dialog regression; no plant will be sold.");
        auto* dialog=dynamic_cast<LawnDialog*>(app.GetDialog(DIALOG_ZEN_SELL));
        require(dialog && dialog->mResult==std::numeric_limits<int>::max(),"Wrong new sell dialog/result sentinel");
        require(dialog->mYesButton && dialog->mNoButton &&
            dialog->mYesButton->mParent==dialog && dialog->mNoButton->mParent==dialog,
            "Sell dialog buttons must be owned child widgets");
        require(dialog->mYesButton->mLabel=="Yes" && dialog->mNoButton->mLabel=="No",
            "Sell dialog default labels changed");
        require(dialog->mDialogHeader==EntityTranslate(gStr.ZEN_SELL_HEADER),"Sell header translation changed");
        // Remove from the real registry/widget/modal layers, but retain the
        // object to inspect its result before destruction (no stale pointer).
        if(result) dialog->mResult=result;
        require(app.SexyAppBase::KillDialog(DIALOG_ZEN_SELL,true,false),"Registered sell dialog did not close");
        std::unique_ptr<LawnDialog> owned(dialog);
        require(app.GetDialog(DIALOG_ZEN_SELL)==nullptr && app.mDialogMap.size()==dialogs,
            "Sell dialog stayed registered after closing");
        require(dialog->mResult==result && dialog->WaitForResult(false)==result,
            "Closed dialog retained the blocking sentinel or overwrote a chosen result");
        log<<"result="<<result<<" derived-buttons=1 labels=Yes/No removed=1 wait-returned=1"<<std::endl;
    }
    ModernSmoke::Report("portable-sell-helper-derived-buttons-three-close-results",app);
}
