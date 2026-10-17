#include "PortableTextProfileSmoke.h"
#include "ModernVulkanSmoke.h"
#include "LawnApp.h"
#include "Resources.h"
#include "System/PlayerInfo.h"
#include "System/ProfileMgr.h"
#include "Widget/GameSelector.h"
#include "Widget/ContinueDialog.h"
#include "Widget/ChallengeScreen.h"
#include "Widget/GameButton.h"
#include "Widget/UserDialog.h"
#include "Widget/NewUserDialog.h"
#include "widget/ListWidget.h"
#include "widget/DialogButton.h"
#include "widget/WidgetManager.h"
#include "Sexy.TodLib/TodStringFile.h"
#include "graphics/Font.h"
#include "graphics/DDInterface.h"
#include "graphics/DDImage.h"
#include "graphics/RenderInterface.h"
#include <array>
#include <algorithm>
#include <fstream>
#include <memory>
#include <numeric>
#include <stdexcept>

namespace {
void Require(bool ok,const char* message){if(!ok) throw std::runtime_error(message);}
class RecordingFont final : public Sexy::_Font {
public:
    struct Draw {int x;SexyString text;Sexy::Color color;int y;};
    std::vector<Draw> draws;
    unsigned widths=0;
    int StringWidth(const SexyString& text) override {++widths;return int(text.size())*10;}
    void DrawString(Sexy::Graphics*,int x,int y,const SexyString& text,const Sexy::Color& color,const Sexy::Rect&) override {
        draws.push_back({x,text,color,y});
    }
    Sexy::_Font* Duplicate() override {return new RecordingFont();}
};

void LinkedListSortCases(LawnApp& app,std::ostream& log) {
    using namespace Sexy;
    unsigned cases=0;
    auto* screen=app.mDDInterface->mScreenImage;
    auto& backend=*app.mDDInterface->mRenderInterface;
    for(bool ascending:{false,true})for(bool childFirst:{false,true})for(int sortColumn=0;sortColumn<3;++sortColumn){
        std::array<std::unique_ptr<ListWidget>,3> actual,reference;
        for(int c=0;c<3;++c){
            actual[c]=std::make_unique<ListWidget>(c,FONT_BRIANNETOD16,nullptr);
            reference[c]=std::make_unique<ListWidget>(c,FONT_BRIANNETOD16,nullptr);
            for(auto* list:{actual[c].get(),reference[c].get()}){
                list->mItemHeight=26;list->Resize(0,0,220,300);
                list->mSelectIdx=1;list->mHiliteIdx=2;list->mMaxNumericPlaces=4;
                for(int row=0;row<8;++row){
                    list->mLines.push_back(std::to_string((7-row)/2+c));
                    list->mLineColors.push_back(Color(60+row*20,60+c*50,100));
                }
            }
        }
        for(int c=0;c<3;++c){
            actual[c]->mParent=c?actual[c-1].get():nullptr;
            actual[c]->mChild=c<2?actual[c+1].get():nullptr;
            actual[c]->mSortFromChild=childFirst&&c<2;
            actual[c]->mDirty=false;
        }
        // Reference concatenation and stable permutation do not call Sort.
        const auto key=[&](auto&& self,int col,int row)->std::string{
            auto text=reference[col]->mLines[row];text.insert(0,4-text.size(),'0');
            if(col==2)return text;
            auto child=self(self,col+1,row);return childFirst?child+text:text+child;
        };
        std::array<int,8> order;std::iota(order.begin(),order.end(),0);
        std::stable_sort(order.begin(),order.end(),[&](int a,int b){
            return ascending?key(key,sortColumn,a)<key(key,sortColumn,b):key(key,sortColumn,a)>key(key,sortColumn,b);
        });
        actual[sortColumn]->Sort(ascending);
        for(int c=0;c<3;++c){
            const auto lines=reference[c]->mLines;const auto colors=reference[c]->mLineColors;
            for(int row=0;row<8;++row){reference[c]->mLines[row]=lines[order[row]];reference[c]->mLineColors[row]=colors[order[row]];}
            Require(actual[c]->mLines==reference[c]->mLines&&actual[c]->mLineColors==reference[c]->mLineColors&&
                actual[c]->mSelectIdx==1&&actual[c]->mHiliteIdx==2&&actual[c]->mDirty,
                "Linked list sort changed stable ordering, row colors or UI indices");
        }
        const auto render=[&](auto& columns){
            screen->FillRect(Rect(0,0,800,600),Color(19,31,47),0);
            for(int c=0;c<3;++c){Graphics g(screen);g.Translate(20+c*250,100);columns[c]->Draw(&g);}
            backend.Flush();return backend.mRenderer->ReadScenePixels();
        };
        const auto pixels=render(actual),expected=render(reference);
        Require(pixels.size()==480000&&pixels==expected,"Linked list sorted GPU rows differ from independent permutation");
        reference[0]->mLines[0]="";
        Require(expected!=render(reference),"Linked list GPU comparison did not contain visible text");
        log<<"sort ascending="<<ascending<<" child-first="<<childFirst<<" source-column="<<sortColumn
            <<" stable-rows-colors=1 gpu-match=1"<<std::endl;++cases;
    }
    Require(cases==12,"Linked list sort scenario coverage incomplete");
    ModernSmoke::Report("portable-list-sort-twelve-linked-column-gpu-cases",app);
}
}

void PortableUserListSmoke(LawnApp& app) {
    Require(getenv("PVZ_MODERN_HIDDEN") && getenv("PVZ_APPDATA_DIR"),"User list probe must be hidden and isolated");
    Require(app.GetDialogCount()==0,"User list probe needs no existing dialogs");
    std::ofstream log(ModernSmoke::ProbePath("user-list-cases.txt"));
    Require(bool(log),"Cannot write user list evidence");
    LinkedListSortCases(app,log);
    constexpr auto createLabel="(Create a New User)"; // 1073 literal 006F1F0C
    log << "original-localization-key-present=" << false << std::endl;  // properties 体系已退役（装载从未执行，键恒缺席）
    struct Profiles {
        ProfileMgr profiles; LawnApp& app; ProfileMgr* oldManager; PlayerInfo* oldPlayer;
        Profiles(LawnApp& a,int count) : app(a),oldManager(a.mProfileMgr),oldPlayer(a.mPlayerInfo) {
            PlayerInfo* active=nullptr;
            for (int i=0;i<count;++i) active=profiles.AddProfile(StrFormat("audit-user-%d",i));
            app.mProfileMgr=&profiles; app.mPlayerInfo=active;
        }
        ~Profiles(){app.mProfileMgr=oldManager;app.mPlayerInfo=oldPlayer;}
    };
    auto labels=[](UserDialog& dialog) {
        std::vector<SexyString> result;
        for (int i=0;i<dialog.mUserList->GetLineCount();++i) result.push_back(dialog.mUserList->GetStringAt(i));
        return result;
    };
    unsigned constructors=0,deletions=0,wrong=0;
    for (int count=0;count<=8;++count) {
        Profiles profiles(app,count); UserDialog dialog(&app);
        const auto lines=labels(dialog);
        const bool pass=dialog.mNumUsers==count && lines.size()==static_cast<size_t>(count+(count<8))
            && (count==8 || lines.back()==createLabel);
        log << "construct count=" << count << " lines=" << lines.size() << " pass=" << pass << std::endl;
        ++constructors; wrong+=!pass;
    }
    for (int count=1;count<=8;++count) for (int selected=0;selected<count;++selected) {
        Profiles profiles(app,count); UserDialog dialog(&app);
        auto expected=labels(dialog); expected.erase(expected.begin()+selected);
        if (count==8) expected.push_back(createLabel);
        dialog.mUserList->SetSelect(selected); dialog.FinishDeleteUser();
        const auto actual=labels(dialog);
        const bool pass=dialog.mNumUsers==count-1 && actual==expected
            && profiles.profiles.GetNumProfiles()==count; // UI helper must not delete any profile
        log << "delete count=" << count << " selected=" << selected << " last=" << actual.back()
            << " pass=" << pass << std::endl;
        ++deletions; wrong+=!pass;
    }
    log << "constructors=" << constructors << " deletions=" << deletions << " wrong=" << wrong << std::endl;
    Require(constructors==9 && deletions==36 && wrong==0,"User list create entry differs from 1073; see user-list-cases.txt");

    auto render=[&](UserDialog& dialog) {
        auto* screen=app.mDDInterface->mScreenImage;
        screen->FillRect(Rect(0,0,800,600),Color(19,31,47),0);
        Graphics g(screen); g.Translate(80,80); dialog.mUserList->Draw(&g);
        auto& backend=*app.mDDInterface->mRenderInterface;
        backend.Flush(); return backend.mRenderer->ReadScenePixels();
    };
    unsigned gpu=0;
    for (int selected=0;selected<8;++selected) {
        Profiles profiles(app,8); UserDialog actual(&app),reference(&app);
        auto expected=labels(reference); expected.erase(expected.begin()+selected); expected.push_back(createLabel);
        actual.mUserList->SetSelect(selected); actual.FinishDeleteUser();
        reference.mUserList->RemoveAll();
        for (const auto& line:expected) reference.mUserList->AddLine(line,false);
        reference.mNumUsers=7; reference.mUserList->SetSelect(std::max(selected-1,0));
        const auto pixels=render(actual),referencePixels=render(reference);
        Require(pixels.size()==480000 && pixels==referencePixels,"User list GPU content differs from expected rows");
        reference.mUserList->SetLine(7,"");
        const auto missing=render(reference);
        unsigned visible=0;
        for (size_t i=0;i<pixels.size();++i) visible+=pixels[i]!=missing[i];
        Require(visible>0 && pixels==render(actual),"Create user row was blank, clipped or unstable");
        log << "gpu selected=" << selected << " create-label-pixels=" << visible << " equal=1" << std::endl;
        ++gpu;
    }

    // Invoke the real row callback and create-dialog construction, but never
    // confirm creation/deletion or call ProfileMgr Save/DeleteProfile/GetProfile.
    unsigned createDialogs=0;
    auto* oldFocus=app.mWidgetManager->mFocusWidget;
    struct RestoreDialog {
        LawnApp& app; Widget* focus;
        ~RestoreDialog(){app.KillDialog(DIALOG_CREATEUSER);app.mWidgetManager->SetFocus(focus);}
    } restore{app,oldFocus};
    for (int count=0;count<=7;++count) {
        Profiles profiles(app,count); UserDialog dialog(&app);
        dialog.ListClicked(0,dialog.mNumUsers,1);
        auto* created=dynamic_cast<NewUserDialog*>(app.GetDialog(DIALOG_CREATEUSER));
        Require(created && created->GetName().empty() && profiles.profiles.GetNumProfiles()==count,
            "Create user row did not open an empty dialog or mutated profiles");
        app.KillDialog(DIALOG_CREATEUSER);
        Require(!app.GetDialog(DIALOG_CREATEUSER),"Create user dialog remained registered after close");
        ++createDialogs;
    }
    log << "gpu-cases=" << gpu << " create-dialogs=" << createDialogs << std::endl;
    Require(gpu==8 && createDialogs==8,"User list regression coverage incomplete");
    ModernSmoke::Report("portable-user-list-nine-construct-36-delete-eight-gpu-eight-create",app);
}

void PortableContinueConfirmSmoke(LawnApp& app) {
    Require(getenv("PVZ_MODERN_HIDDEN") && getenv("PVZ_APPDATA_DIR"),
        "Continue confirmation probe must be hidden and isolated");
    Require(!app.mBoard && app.GetDialogCount()==0,
        "Continue confirmation probe needs no board or existing dialogs");
    struct Restore {
        LawnApp& app; GameMode mode; Widget* focus; int cursor;
        ~Restore(){app.mGameMode=mode;app.mWidgetManager->SetFocus(focus);app.SetCursor(cursor);}
    } restore{app,app.mGameMode,app.mWidgetManager->mFocusWidget,app.mCursorNum};
    // Remove through the actual registry/modal/widget lifecycle, then destroy
    // locally. Never confirm a restart, load/erase a save or leave queued owners.
    struct DialogOwner {
        LawnApp& app; int id;
        ~DialogOwner(){
            if(auto* dialog=app.GetDialog(id)) {
                app.SexyAppBase::KillDialog(id,true,false);
                delete dialog;
            }
        }
    };
    std::ofstream log(ModernSmoke::ProbePath("continue-confirm-cases.txt"));
    Require(bool(log),"Cannot write continue confirmation evidence");
    auto render=[&](LawnDialog& dialog) {
        auto* screen=app.mDDInterface->mScreenImage;
        screen->FillRect(Rect(0,0,800,600),Color(19,31,47),0);
        Graphics g(screen);g.Translate(dialog.mX,dialog.mY);dialog.Draw(&g);
        for(auto* button:{dialog.mYesButton,dialog.mNoButton}) {
            if(button){Graphics child(g);child.Translate(button->mX,button->mY);button->Draw(&child);}
        }
        auto& backend=*app.mDDInterface->mRenderInterface;
        backend.Flush();return backend.mRenderer->ReadScenePixels();
    };
    auto renderEntry=[&](ContinueDialog& dialog) {
        auto* screen=app.mDDInterface->mScreenImage;
        screen->FillRect(Rect(0,0,800,600),Color(19,31,47),0);
        Graphics g(screen);g.Translate(dialog.mX,dialog.mY);dialog.Draw(&g);
        for(auto* button:std::array<Widget*,3>{dialog.mContinueButton,dialog.mNewGameButton,dialog.mYesButton}) {
            Require(button!=nullptr,"Continue entry button absent");
            Graphics child(g);child.Translate(button->mX,button->mY);button->Draw(&child);
        }
        auto& backend=*app.mDDInterface->mRenderInterface;
        backend.Flush();return backend.mRenderer->ReadScenePixels();
    };
    unsigned cases=0,wrong=0,gpu=0,entryWrong=0,entryGPU=0;
    const auto boardResult=app.mBoardResult;
    for(auto mode:{GAMEMODE_ADVENTURE,GAMEMODE_SURVIVAL_ENDLESS_STAGE_3,
            GAMEMODE_MINIGAME_BEGHOULED,GAMEMODE_SCARY_POTTER_1,GAMEMODE_PUZZLE_I_ZOMBIE_1}) {
        app.mGameMode=mode;
        {
            DialogOwner outer{app,DIALOG_CONTINUE};
            app.DoContinueDialog();
            auto* dialog=dynamic_cast<ContinueDialog*>(app.GetDialog(DIALOG_CONTINUE));
            Require(dialog && dialog->mNewGameButton,"Continue entry did not construct its real button");
            // 1073 00435E40: the first dialog says "Restart Level"; only the
            // second confirmation uses "Restart". Do not use a resource key
            // from the production constructor to derive this expectation.
            const char* expectedEntry=mode==GAMEMODE_ADVENTURE?"Restart Level":"New Game";
            ContinueDialog entryReference(&app);
            entryReference.Resize(dialog->mX,dialog->mY,dialog->mWidth,dialog->mHeight);
            entryReference.mContinueButton->mLabel="Continue";
            entryReference.mNewGameButton->mLabel=expectedEntry;
            entryReference.mYesButton->mLabel="CANCEL";
            const auto entryPixels=renderEntry(*dialog),entryExpected=renderEntry(entryReference);
            entryReference.mNewGameButton->mLabel.clear();
            const auto entryEmpty=renderEntry(entryReference);
            Require(entryExpected.size()==480000 && entryEmpty.size()==entryExpected.size() && entryExpected!=entryEmpty,
                "Continue first-dialog reference label is not visible");
            const bool entryLabels=dialog->mContinueButton->mLabel=="Continue" &&
                dialog->mNewGameButton->mLabel==expectedEntry && dialog->mYesButton->mLabel=="CANCEL";
            const bool entryEqual=entryPixels==entryExpected;
            entryWrong+=!(entryLabels && entryEqual);entryGPU+=entryEqual;
            log<<"entry mode="<<int(mode)<<" right="<<dialog->mNewGameButton->mLabel<<" expected="<<expectedEntry
               <<" left="<<dialog->mContinueButton->mLabel<<" footer="<<dialog->mYesButton->mLabel
               <<" labels="<<entryLabels<<" gpu="<<entryEqual<<std::endl;
            DialogOwner confirmation{app,DIALOG_RESTARTCONFIRM};
            dialog->ButtonDepress(dialog->mNewGameButton->mId);
            auto* actual=dynamic_cast<LawnDialog*>(app.GetDialog(DIALOG_RESTARTCONFIRM));
            Require(actual && actual->mIsModal && app.GetDialogCount()==2,
                "Restart button did not open the second modal dialog");
            Require(actual->mYesButton && actual->mNoButton &&
                actual->mYesButton->mParent==actual && actual->mNoButton->mParent==actual,
                "Restart confirmation lost its owned child buttons");
            const bool adventure=mode==GAMEMODE_ADVENTURE;
            // Independent text from 1073 00436420: 006E5DF8/006E5E2C and
            // 006E5E50/006E5E80, not copied from the dialog under test.
            const char* header=adventure?"Restart Level?":"New Game?";
            const char* body=adventure?"Are you sure that you want to restart the level?":
                "Are you sure that you want to start a new game?";
            const char* button=adventure?"Restart":"New Game";
            const bool text=actual->mDialogHeader==header && actual->mDialogLines==body;
            const bool labels=actual->mYesButton->mLabel==button && actual->mNoButton->mLabel=="Cancel";
            LawnDialog reference(&app,DIALOG_RESTARTCONFIRM,true,header,body,"",Dialog::BUTTONS_OK_CANCEL);
            LawnApp::CenterDialog(&reference,reference.mWidth,reference.mHeight);
            reference.mYesButton->mLabel=button;
            const auto pixels=render(*actual),expected=render(reference);
            const bool equal=pixels.size()==480000 && pixels==expected;
            reference.mDialogLines.clear();
            const auto empty=render(reference);
            Require(expected.size()==480000 && empty.size()==expected.size(),
                "Continue reference readback size changed");
            unsigned visible=0;
            for(size_t i=0;i<expected.size();++i)visible+=expected[i]!=empty[i];
            Require(visible>0,
                "Continue reference text was blank or not rendered");
            log<<"mode="<<int(mode)<<" header="<<actual->mDialogHeader<<" body="<<actual->mDialogLines
                <<" text="<<text<<" labels="<<labels<<" gpu="<<equal<<" body-pixels="<<visible<<std::endl;
            ++cases;wrong+=!(text && labels && equal);gpu+=equal;
        }
        Require(app.GetDialogCount()==0 && !app.mBoard && app.mBoardResult==boardResult,
            "Continue confirmation retained dialogs or changed gameplay state");
    }
    log<<"cases="<<cases<<" wrong="<<wrong<<" gpu="<<gpu<<" entry-wrong="<<entryWrong<<" entry-gpu="<<entryGPU<<std::endl;
    Require(cases==5 && wrong==0 && gpu==5 && entryWrong==0 && entryGPU==5,
        "Continue entry/confirmation differs from 1073; see continue-confirm-cases.txt");
    ModernSmoke::Report("portable-continue-confirm-five-modes-gpu-original-text",app);
    ModernSmoke::Report("portable-continue-entry-five-original-labels-gpu",app);
}

void PortableTextFormatSmoke(LawnApp& app) {
    const Color red(200,10,20),blue(10,30,220);
    RecordingFont font;Sexy::_Font* fontSlot=&font;
    TodStringListFormat styles[]={{StringFormatId::Keyword,nullptr,blue,0,0}};
    struct RestoreStyles {
        TodStringListFormat* old;int count;
        ~RestoreStyles(){gTodStringFormats=old;gTodStringFormatCount=count;}
    } restore{gTodStringFormats,gTodStringFormatCount};
    gTodStringFormats=styles;gTodStringFormatCount=1;
    std::ofstream log(ModernSmoke::ProbePath("text-format-ownership.txt"));
    Require(bool(log),"Cannot write text format evidence");
    Graphics graphics(nullptr);
    constexpr DrawStringJustification alignments[]={DS_ALIGN_LEFT,DS_ALIGN_RIGHT,DS_ALIGN_CENTER,
        DS_ALIGN_LEFT_VERTICAL_MIDDLE,DS_ALIGN_RIGHT_VERTICAL_MIDDLE,DS_ALIGN_CENTER_VERTICAL_MIDDLE};
    for(auto alignment:alignments) {
        font.draws.clear();font.widths=0;
        TodStringListFormat format(StringFormatId::None,&fontSlot,red,0,0);
        const int width=TodWriteString(&graphics,"A" + UiTextFormatToken(StringFormatId::Keyword) + "B",10,20,format,100,alignment,true,0,-1);
        const bool left=alignment==DS_ALIGN_LEFT || alignment==DS_ALIGN_LEFT_VERTICAL_MIDDLE;
        const bool right=alignment==DS_ALIGN_RIGHT || alignment==DS_ALIGN_RIGHT_VERTICAL_MIDDLE;
        const int x=left?10:right?90:50;
        log<<"alignment="<<int(alignment)<<" width="<<width<<" measurements="<<font.widths;
        for(const auto& draw:font.draws) log<<" ["<<draw.text<<" x="<<draw.x<<" rgb="
            <<draw.color.mRed<<','<<draw.color.mGreen<<','<<draw.color.mBlue<<']';
        log<<std::endl;
        Require(width==20 && font.draws.size()==2,"Rich-text width or draw segmentation changed");
        Require(font.draws[0].text=="A" && font.draws[0].color==red && font.draws[0].x==x &&
            font.draws[1].text=="B" && font.draws[1].color==blue && font.draws[1].x==x+10,
            "Rich-text measurement polluted the initial draw color/alignment");
        Require(format.mNewColor==blue,"Real rich-text drawing no longer propagates its final format");
        Require(font.widths==(left?2u:4u),"Left-aligned text still performs an unused width prepass");
    }
    font.draws.clear();
    TodStringListFormat measurement(StringFormatId::None,&fontSlot,red,0,0);
    Require(TodWriteString(&graphics,"A" + UiTextFormatToken(StringFormatId::Keyword) + "B",0,0,measurement,100,DS_ALIGN_LEFT,false,0,-1)==20 &&
        font.draws.empty() && measurement.mNewColor==blue,"Explicit format scanning semantics changed");
    ModernSmoke::Report("portable-richtext-six-alignments-color-state",app);

    auto& render=*app.mDDInterface->mRenderInterface;
    auto* screen=app.mDDInterface->mScreenImage;
    _Font* realFont=Sexy::FONT_BRIANNETOD16;
    const int widthA=realFont->StringWidth("A"),widthB=realFont->StringWidth("B");
    for(auto alignment:alignments) {
        screen->FillRect(Rect(0,0,800,600),Color::Black,0);
        Graphics actual(screen);TodStringListFormat format(StringFormatId::None,&realFont,red,0,0);
        TodWriteString(&actual,"A" + UiTextFormatToken(StringFormatId::Keyword) + "B",100,100,format,200,alignment,true,0,-1);
        render.Flush();const auto pixels=render.mRenderer->ReadScenePixels();
        Require(std::count_if(pixels.begin(),pixels.end(),[](auto p){return (p&0xffffffu)!=0;})>10,
            "GPU rich-text fixture did not render glyphs");
        screen->FillRect(Rect(0,0,800,600),Color::Black,0);
        Graphics expected(screen);
        const int spare=200-widthA-widthB;
        const int x=100+(alignment==DS_ALIGN_RIGHT || alignment==DS_ALIGN_RIGHT_VERTICAL_MIDDLE?spare:
            alignment==DS_ALIGN_CENTER || alignment==DS_ALIGN_CENTER_VERTICAL_MIDDLE?spare/2:0);
        realFont->DrawString(&expected,x,100,"A",red,expected.mClipRect);
        realFont->DrawString(&expected,x+widthA,100,"B",blue,expected.mClipRect);
        render.Flush();
        Require(pixels==render.mRenderer->ReadScenePixels(),"GPU rich text differs from independent colored runs");
    }
    ModernSmoke::Report("portable-richtext-gpu-six-alignments",app);
}

void PortablePreviewProfileSmoke(LawnApp& app) {
    Require(app.mGameSelector && !app.mBoard,"Preview profile test requires the actual menu");
    class PreviewManager final : public ProfileMgr {
    public: PreviewManager(){mNextProfileId=1000000;}
    } profiles;
    auto* active=profiles.AddProfile("audit-active");
    Require(active!=nullptr,"Cannot create isolated active profile");
    std::array<int,100> before{};
    for(int i=0;i<100;++i) active->mChallengeRecords[i]=before[i]=1000+i;
    struct RestoreProfile {
        LawnApp& app;ProfileMgr* manager;PlayerInfo* player;
        ~RestoreProfile(){app.mProfileMgr=manager;app.mPlayerInfo=player;}
    } restore{app,app.mProfileMgr,app.mPlayerInfo};
    app.mProfileMgr=&profiles;app.mPlayerInfo=active;
    // This routine writes user1000001..1000006.dat only under the smoke's
    // isolated PVZ_APPDATA_DIR. The real profile manager/player are untouched.
    app.mGameSelector->AddPreviewProfiles();
    Require(std::equal(before.begin(),before.end(),active->mChallengeRecords),
        "AddPreviewProfiles overwrote the active player's challenge records");
    Require(profiles.GetNumProfiles()==7,"Preview profile batch is incomplete");
    auto* unlocked=profiles.GetProfile("Full Unlock"); // reload the newly saved details
    Require(unlocked && !unlocked->mDetailsLoadRejected,"Full Unlock preview did not persist valid details");
    // 与 GameSelector 预览档生成器同步的 v13 槽模型：真实模式 1..71 刷 20，
    // 树=1（购入即苗），三个 endless 例外为 0；槽 0（冒险）与死槽 72..99 恒零。
    for(int slot=0;slot<100;++slot) {
        const bool live=slot>=1 && slot<=(int)GameMode::GAMEMODE_TREE_OF_WISDOM;
        const int expected=slot==(int)GameMode::GAMEMODE_TREE_OF_WISDOM?1:
            slot==(int)GameMode::GAMEMODE_SCARY_POTTER_ENDLESS || slot==(int)GameMode::GAMEMODE_PUZZLE_I_ZOMBIE_ENDLESS ||
            slot==(int)GameMode::GAMEMODE_SURVIVAL_ENDLESS_STAGE_3?0:(live?20:0);
        Require(unlocked->mChallengeRecords[slot]==expected,
            "Preview profile has missing/misdirected challenge records or wrong exceptions");
    }
    ModernSmoke::Report("portable-preview-profiles-correct-owner-all100-persisted",app);
}

void PortableDialogTrophySmoke(LawnApp& app) {
    struct RestoreMode {
        LawnApp& app; GameMode mode; GameScenes scene;
        ~RestoreMode(){app.mGameMode=mode;app.mGameScene=scene;}
    } restore{app,app.mGameMode,app.mGameScene};
    std::ofstream log(ModernSmoke::ProbePath("dialog-trophy-layout.txt"));
    Require(bool(log),"Cannot write dialog/trophy layout evidence");
    bool dialogsOk=true,trophiesOk=true;
    for(auto mode:{GAMEMODE_ADVENTURE,GAMEMODE_SURVIVAL_ENDLESS_STAGE_3}) {
        app.mGameMode=mode;
        ContinueDialog dialog(&app);
        for(int position:{0,37,113}) {
            dialog.Resize(position,position/2,dialog.mWidth,dialog.mHeight);
            auto& left=*dialog.mContinueButton;auto& right=*dialog.mNewGameButton;
            const int gap=right.mX-left.mX-left.mWidth;
            log<<"mode="<<int(mode)<<" width="<<dialog.mWidth<<" x="<<position
                <<" continue=["<<left.mX<<','<<left.mX+left.mWidth<<"] new=["
                <<right.mX<<','<<right.mX+right.mWidth<<"] gap="<<gap<<std::endl;
            dialogsOk &= gap>=0 && left.mX>=0 && right.mX+right.mWidth<=dialog.mWidth &&
                left.mY==right.mY && left.mY+left.mHeight<=dialog.mYesButton->mY;
            const int tile=IMAGE_DIALOG_TOPMIDDLE->mWidth;
            dialogsOk &= (dialog.mWidth-IMAGE_DIALOG_TOPLEFT->mWidth-IMAGE_DIALOG_TOPRIGHT->mWidth)%tile==0;
        }
    }
    // The Limbo constructor does not clear any of the player's new-mode flags.
    // Suppress its music switch; only the detached widget is used for drawing.
    app.mGameMode=GAMEMODE_INTRO;app.mGameScene=SCENE_LEVEL_INTRO;
    ChallengeScreen challenge(&app,CHALLENGE_PAGE_LIMBO);
    app.mGameMode=restore.mode;app.mGameScene=restore.scene;
    RecordingFont font12,font15;
    struct RestoreFonts {
        Sexy::_Font* twelve;Sexy::_Font* fifteen;
        ~RestoreFonts(){FONT_DWARVENTODCRAFT12=twelve;FONT_DWARVENTODCRAFT15=fifteen;}
    } fonts{FONT_DWARVENTODCRAFT12,FONT_DWARVENTODCRAFT15};
    FONT_DWARVENTODCRAFT12=&font12;FONT_DWARVENTODCRAFT15=&font15;
    auto& render=*app.mDDInterface->mRenderInterface;
    for(auto page:{CHALLENGE_PAGE_SURVIVAL,CHALLENGE_PAGE_CHALLENGE,CHALLENGE_PAGE_PUZZLE,CHALLENGE_PAGE_LIMBO}) {
        challenge.mPageIndex=page;challenge.UpdateButtons();
        font12.draws.clear();font15.draws.clear();
        Graphics graphics(app.mDDInterface->mScreenImage);
        challenge.Draw(&graphics);render.Flush();
        const int total=page==CHALLENGE_PAGE_SURVIVAL?10:page==CHALLENGE_PAGE_CHALLENGE?20:
            page==CHALLENGE_PAGE_PUZZLE?18:0;
        const SexyString label=StrFormat(("%d/%d"),app.GetNumTrophies(page),total);
        const auto matches=[&](const RecordingFont::Draw& draw){return draw.text==label && draw.y==73;};
        const auto used12=std::count_if(font12.draws.begin(),font12.draws.end(),matches);
        const auto used15=std::count_if(font15.draws.begin(),font15.draws.end(),matches);
        log<<"page="<<int(page)<<" label="<<label<<" font12="<<used12<<" font15="<<used15<<std::endl;
        trophiesOk &= used12==0 && used15==(total>0?1:0);
        if(total>0 && used15==1) {
            const auto& draw=*std::find_if(font15.draws.begin(),font15.draws.end(),matches);
            trophiesOk &= draw.x==739-int(label.size())*10/2 && draw.color==Color(255,240,0);
        }
    }
    Require(dialogsOk,"Continue dialog buttons overlap or leave their tiled dialog bounds");
    Require(trophiesOk,"Challenge trophy count does not use the 1073 font/position/color");
    ModernSmoke::Report("portable-continue-buttons-disjoint-trophy-font15",app);
}

void PortableButtonHitSmoke(LawnApp& app) {
    auto& manager=*app.mWidgetManager;
    Require(app.GetDialogCount()==0,"Button hit smoke requires no open dialog");
    struct RestoreInput {
        Sexy::WidgetManager& manager;int x,y;Sexy::Widget* focus;
        ~RestoreInput(){manager.mLastMouseX=x;manager.mLastMouseY=y;manager.mFocusWidget=focus;}
    } restore{manager,manager.mLastMouseX,manager.mLastMouseY,manager.mFocusWidget};
    Sexy::Widget parent;parent.Resize(100,80,300,300);
    GameButton button(-1);button.mParentWidget=&parent;button.mX = 10;
    button.mY = 20;
    button.mWidth = 40;
    button.mHeight = 30;
    std::ofstream log(ModernSmoke::ProbePath("button-live-hit.txt"));
    Require(bool(log),"Cannot write live button hit evidence");
    bool ok=true;
    const auto check=[&](const char* name,int x,int y,bool expected){
        manager.mLastMouseX=x;manager.mLastMouseY=y;
        const bool oldOver=button.mIsOver,oldDown=button.mIsDown;
        const double alpha=button.mOverAlpha;
        const bool result=button.IsMouseOver();
        log<<name<<" x="<<x<<" y="<<y<<" cached="<<oldOver
            <<" result="<<result<<" expected="<<expected<<std::endl;
        ok &= result==expected && button.mIsOver==oldOver && button.mIsDown==oldDown && button.mOverAlpha==alpha;
    };
    button.mIsOver=false;
    check("enter-before-update",110,100,true);
    button.mIsOver=true;
    check("leave-before-update",109,100,false);
    check("right-edge-exclusive",150,100,false);
    check("bottom-edge-exclusive",110,130,false);
    check("last-inside-pixel",149,129,true);
    button.mDisabled=true;check("disabled",120,110,false);button.mDisabled=false;
    button.mBtnNoDraw=true;check("hidden",120,110,false);button.mBtnNoDraw=false;
    parent.Resize(200,180,300,300);
    button.mIsOver=true;check("parent-moved-away",120,110,false);
    button.mIsOver=false;check("parent-moved-under-pointer",220,210,true);
    {
        // A detached modal entry tests GetDialogCount without routing input or
        // invoking widget-manager focus changes. Removed before destruction.
        Sexy::Dialog modal(nullptr,nullptr,30000,true,(""),(""),(""),Sexy::Dialog::BUTTONS_NONE);
        const auto inserted=app.mDialogMap.emplace(30000,&modal).second;
        Require(inserted,"Temporary modal id was already present");
        struct RemoveModal {LawnApp& app;~RemoveModal(){app.mDialogMap.erase(30000);}} remove{app};
        manager.mFocusWidget=&modal;button.mIsOver=true;
        check("other-modal-blocks",220,210,false);
        manager.mFocusWidget=&parent;button.mIsOver=false;
        check("focused-parent-dialog",220,210,true);
    }
    button.mParentWidget=nullptr;button.mX = 10;
    button.mY = 20;
    button.mWidth = 40;
    button.mHeight = 30;button.mIsOver=false;
    check("no-parent",10,20,true);
    Require(ok,"GameButton hit test used stale hover state or changed modal/disabled/boundary semantics");
    ModernSmoke::Report("portable-button-live-hit-no-update-side-effects",app);
}
