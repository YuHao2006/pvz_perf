#include "PortableDemoDispatchSmoke.h"
#include "ModernVulkanSmoke.h"
#include "LawnApp.h"
#include "misc/SEHCatcher.h"
#include "widget/WidgetManager.h"
#include "widget/Dialog.h"
#include <fstream>
#include <stdexcept>
#include <vector>

namespace {
using namespace Sexy;
void Require(bool ok,const char* why){if(!ok) throw std::runtime_error(why);}
class ReplayApp final:public SexyAppBase {
public:
    using SexyAppBase::ProcessDemo;
    using SexyAppBase::DoUpdateFrames;
    unsigned closes=0,steps=0,updates=0;
    void ButtonPress(int) override {} void ButtonDepress(int) override {}
    void ButtonDownTick(int) override {} void ButtonMouseEnter(int) override {}
    void ButtonMouseLeave(int) override {} void ButtonMouseMove(int,int,int) override {}
    void EnforceCursor() override {} // No OS cursor/UI side effects in this probe.
    void Shutdown() override {mShutdown=true;++closes;}
    void UpdateFrames() override {++mUpdateCount;++updates;}
    bool UpdateAppStep(bool* updated) override {
        Require(++steps<8,"Demo modal wait spun without returning its result");
        Require(mUpdateAppState==UPDATESTATE_MESSAGES,"Modal result failed to unwind before the update stage");
        // The real two-stage message step: no GpuContext was created, so its
        // native pump returns without polling OS events; timer bookkeeping is
        // time-only. Do not replace the step with a direct ProcessDemo call.
        return SexyAppBase::UpdateAppStep(updated);
    }
    ~ReplayApp() override {mPlayingDemoBuffer=false;mRecordingDemoBuffer=false;}
};
class ReplayDialog final:public Dialog {
public:
    ReplayDialog():Dialog(nullptr,nullptr,8127,true,"","","",BUTTONS_NONE){
        // This pre-renderer input fixture has no text or automatic text layout.
        Resize(0,0,128,64);
    }
    void KeyChar(SexyChar c) override {if(c=='y') ButtonDepress(ID_YES);}
};
void Header(Buffer& data,int command,unsigned delta=0) {
    data.WriteNumBits(delta,4);data.WriteNumBits(0,1);data.WriteNumBits(command,5);
}
void Reset(ReplayApp& app,std::uint32_t tick) {
    app.mDemoBuffer.Clear();app.mLastDemoUpdateCnt=tick;app.mUpdateCount=tick;
    app.mDemoNeedsCommand=true;app.mDemoCmdOrder=std::uint32_t(-1);app.mDemoCmdBitPos=0;
    app.mDemoIsShortCmd=false;app.mDemoCmdNum=0;app.mShutdown=false;app.closes=0;
    app.mPlayingDemoBuffer=true;app.mRecordingDemoBuffer=false;app.mManualShutdown=false;
    app.mLoaded=true;app.mDemoLoadingComplete=true;app.mLoadingThreadCompleted=false;
    app.mUpdateAppState=UPDATESTATE_MESSAGES;
}
}

void PortableDemoDispatchSmoke(LawnApp& realApp) {
    using namespace Sexy;
    Require(!realApp.mDDInterface && !realApp.mLoadingThreadStarted,"Replay probe must precede real Init");
    struct Restore {LawnApp& app;~Restore(){gSexyAppBase=&app;SEHCatcher::mApp=&app;}} restore{realApp};
    ReplayApp app;app.mReadFromRegistry=false;app.mRandSeed=0x1073;app.mTimeLoaded=GetTickCount();
    app.mPrimaryThreadId=GetCurrentThreadId();app.mMinimized=true;
    std::ofstream log(ModernSmoke::ProbePath("demo-dispatch.txt"));Require(bool(log),"Cannot open replay evidence");
    // Bounded old-code witness: a failed FILE_EXISTS payload followed by a
    // future IDLE makes the old parser consume the payload as another header.
    Reset(app,0);Header(app.mDemoBuffer,DEMO_FILE_EXISTS);app.mDemoBuffer.WriteNumBits(0,1);
    Header(app.mDemoBuffer,DEMO_IDLE,1);app.mDemoBuffer.mReadBitPos = 0;app.ProcessDemo();
    const bool kept=!app.mDemoNeedsCommand && app.mDemoCmdNum==DEMO_FILE_EXISTS &&
        app.mDemoBuffer.mReadBitPos==10 && app.mLastDemoUpdateCnt==0 && app.mDemoCmdOrder==0;
    log<<"callsite-header-retained="<<kept<<" read-bit="<<app.mDemoBuffer.mReadBitPos
        <<" command="<<app.mDemoCmdNum<<" tick="<<app.mLastDemoUpdateCnt<<std::endl;
    Require(kept,"ProcessDemo consumed a game-logic command payload as an input header");

    unsigned cases=0;
    for(std::uint32_t tick:{0u,0x7fffffffu,0xffffffffu}) {
        Reset(app,tick);Header(app.mDemoBuffer,DEMO_FILE_EXISTS);app.mDemoBuffer.WriteNumBits(1,1);
        Header(app.mDemoBuffer,DEMO_CLOSE,1);app.mDemoBuffer.mReadBitPos = 0;
        for(int repeat=0;repeat<4;++repeat) app.ProcessDemo();
        Require(app.mDemoBuffer.mReadBitPos==10 && app.mDemoCmdOrder==0,"Same-tick lookahead re-read the pending header");
        Require(app.FileExists(ModernSmoke::ProbePath("must-not-read-real-file")),"FILE_EXISTS did not consume recorded success");
        app.ProcessDemo();Require(!app.mShutdown,"Future close fired early");
        Require(app.DoUpdateFrames() && app.mUpdateCount==tick+1,"Real demo scheduler failed to advance to future command");
        app.ProcessDemo();Require(app.closes==1,"Due close was not dispatched exactly once");++cases;

        Reset(app,tick);Header(app.mDemoBuffer,DEMO_FILE_EXISTS);app.mDemoBuffer.WriteNumBits(0,1);
        Header(app.mDemoBuffer,DEMO_CLOSE,1);app.mDemoBuffer.mReadBitPos = 0;app.ProcessDemo();
        Require(app.DoUpdateFrames() && app.mUpdateCount==tick+1,"Unclaimed command pins the scheduler forever");
        bool rejected=false;
        try {app.ProcessDemo();} catch(const std::runtime_error& error) {
            const std::string text=error.what();rejected=text.find("Demo replay")!=std::string::npos && text.find("tick")!=std::string::npos;
            log<<"unclaimed tick="<<tick<<" diagnostic="<<text<<std::endl;
        }
        Require(rejected && app.mDemoBuffer.mReadBitPos==10 && app.closes==0,"Overdue IO was skipped or treated as normal shutdown");++cases;
    }

    // Actual message-stage UpdateAppStep, Dialog::WaitForResult and ButtonDepress.
    // No native window exists, hence no OS events are pumped or injected.
    Reset(app,12);Header(app.mDemoBuffer,DEMO_KEY_CHAR);app.mDemoBuffer.WriteNumBits(0,1);app.mDemoBuffer.WriteNumBits('y',8);
    Header(app.mDemoBuffer,DEMO_FILE_WRITE);app.mDemoBuffer.WriteNumBits(1,1);Header(app.mDemoBuffer,DEMO_CLOSE,1);
    app.mDemoBuffer.mReadBitPos = 0;auto* dialog=new ReplayDialog;
    app.AddDialog(8127,dialog);app.mWidgetManager->SetFocus(dialog);
    Require(dialog->WaitForResult(false)==Dialog::ID_YES,"Real modal result failed to return");
    Require(!app.mDemoNeedsCommand && app.mDemoCmdNum==DEMO_FILE_WRITE,"Post-dialog write did not stay queued");
    const auto untouched=ModernSmoke::ProbePath("replay-must-not-write.bin");
    Require(app.WriteBytesToFile(untouched,"x",1),"Post-dialog write result not consumed");
    app.KillDialog(8127);app.ProcessDemo();Require(app.DoUpdateFrames(),"Close after modal write did not advance");app.ProcessDemo();
    Require(app.closes==1 && app.steps==1,"Modal replay used unexpected message steps or closes");++cases;
    std::ifstream forbidden(untouched,std::ios::binary);Require(!forbidden,"Playback wrote a real file");
    log<<"real-modal-result-post-wait-write=1 real-file-created=0"<<std::endl;

    Reset(app,0);Header(app.mDemoBuffer,DEMO_FILE_EXISTS);app.mDemoBuffer.WriteNumBits(1,1);Header(app.mDemoBuffer,DEMO_CLOSE,1);
    app.mDemoBuffer.mReadBitPos = 0;bool mismatch=false;
    try {app.WriteBytesToFile(untouched,"x",1);} catch(const std::runtime_error& error) {
        mismatch=std::string(error.what()).find("Demo replay")!=std::string::npos;
        log<<"wrong-callsite="<<error.what()<<std::endl;
    }
    Require(mismatch && !app.mDemoNeedsCommand && app.mDemoBuffer.mReadBitPos==10,"Wrong caller consumed another command");++cases;
    std::vector<Buffer> commands;
    const auto command=[&](int id,auto payload) {
        Buffer data;Header(data,id);payload(data);commands.push_back(data);
    };
    const auto bits=[&](int id,unsigned width) {command(id,[&](Buffer& b){b.WriteNumBits(0,width);});};
    bits(DEMO_MOUSE_POSITION,24);bits(DEMO_ACTIVATE_APP,1);bits(DEMO_SIZE,8);
    bits(DEMO_KEY_DOWN,8);bits(DEMO_KEY_UP,8);bits(DEMO_MOUSE_WHEEL,8);
    bits(DEMO_KEY_CHAR,9);command(DEMO_KEY_CHAR,[](Buffer& b){b.WriteNumBits(1,1);b.WriteNumBits(0x4e2d,16);});
    for(int id:{DEMO_CLOSE,DEMO_MOUSE_ENTER,DEMO_MOUSE_EXIT,DEMO_LOADING_COMPLETE,DEMO_IDLE}) bits(id,0);
    bits(DEMO_VIDEO_DATA,16);bits(DEMO_HANDLE_COMPLETE,32);bits(DEMO_ASSERT_INT_EQUAL,32);
    command(DEMO_ASSERT_STRING_EQUAL,[](Buffer& b){b.WriteString("abc");});
    for(int id:{DEMO_REGISTRY_WRITE,DEMO_REGISTRY_ERASE,DEMO_FILE_EXISTS,DEMO_FILE_WRITE}) bits(id,1);
    bits(DEMO_FILE_READ,1);command(DEMO_FILE_READ,[](Buffer& b){b.WriteNumBits(1,1);b.WriteLong(3);b.WriteByte(5);b.WriteByte(0);b.WriteByte(7);});
    command(DEMO_SYNC,[](Buffer& b){b.WriteLong(3);b.WriteByte(5);b.WriteByte(0);b.WriteByte(7);});
    bits(DEMO_REGISTRY_READ,1);command(DEMO_REGISTRY_READ,[](Buffer& b){b.WriteNumBits(1,1);b.WriteLong(REG_DWORD);b.WriteLong(4);b.WriteLong(7);});
    bits(DEMO_REGISTRY_GETSUBKEYS,1);command(DEMO_REGISTRY_GETSUBKEYS,[](Buffer& b){b.WriteNumBits(1,1);b.WriteLong(2);b.WriteString("");b.WriteString("abc");});
    for(int shortId:{0,1}) {
        Buffer data;data.WriteNumBits(0,4);data.WriteNumBits(1,1);data.WriteNumBits(shortId,1);
        data.WriteNumBits(0,shortId?4:12);commands.push_back(data);
    }
    unsigned prefixes=0;
    for(const auto& complete:commands) {
        Reset(app,0);app.mDemoBuffer=complete;app.mDemoBuffer.mReadBitPos = 0;
        Require(app.PrepareDemoCommand(false),"Complete command failed payload validation");
        for(int end=0;end<complete.mDataBitSize;++end) {
            Reset(app,0);app.mDemoBuffer=complete;app.mDemoBuffer.mDataBitSize=end;app.mDemoBuffer.mReadBitPos = 0;
            bool failed=false;
            try {app.PrepareDemoCommand(false);} catch(const std::runtime_error& e) {failed=std::string(e.what()).find("Demo replay")!=std::string::npos;}
            Require(failed && app.mDemoBuffer.mReadBitPos==0 && app.mDemoNeedsCommand && app.mDemoCmdOrder==std::uint32_t(-1),
                "Truncated header/payload was accepted or partially consumed");++prefixes;
        }
    }
    // The caller APIs consume validated payload, not just the header probe.
    Reset(app,0);Header(app.mDemoBuffer,DEMO_FILE_READ);app.mDemoBuffer.WriteNumBits(1,1);
    app.mDemoBuffer.WriteLong(3);app.mDemoBuffer.WriteByte(5);app.mDemoBuffer.WriteByte(0);app.mDemoBuffer.WriteByte(7);
    app.mDemoBuffer.mReadBitPos = 0;app.ProcessDemo();Buffer read;
    Require(app.ReadBufferFromFile(untouched,&read) && read.mData==ByteVector({5,0,7}),"Real file-read consumer lost payload");
    Reset(app,0);Header(app.mDemoBuffer,DEMO_SYNC);Buffer string;string.WriteString("recorded");
    app.mDemoBuffer.WriteLong(string.GetDataLen());app.mDemoBuffer.WriteBytes(string.GetDataPtr(),string.GetDataLen());
    app.mDemoBuffer.mReadBitPos = 0;app.ProcessDemo();std::string synced="before";app.DemoSyncString(&synced);
    Require(synced=="recorded","Real sync consumer lost string payload");
    unsigned explicitErrors=0;
    for(int kind=0;kind<4;++kind) {
        Reset(app,0);
        if(kind==0) Header(app.mDemoBuffer,30); // Undefined command, not normal completion.
        if(kind==1) {Header(app.mDemoBuffer,DEMO_FILE_EXISTS,1);app.mDemoBuffer.WriteNumBits(1,1);}
        if(kind==2) Header(app.mDemoBuffer,DEMO_IDLE); // EOF after IDLE is not a recorded CLOSE.
        if(kind==3) {Header(app.mDemoBuffer,DEMO_SYNC);app.mDemoBuffer.WriteLong(-1);}
        app.mDemoBuffer.mReadBitPos = 0;bool failed=false;
        try {
            if(kind==1) app.FileExists(untouched);else app.ProcessDemo();
        } catch(const std::runtime_error& e) {
            failed=std::string(e.what()).find("Demo replay")!=std::string::npos;
            log<<"explicit-error-case="<<kind<<" "<<e.what()<<std::endl;
        }
        Require(failed && app.closes==0,"Invalid/early/truncated replay was swallowed as ordinary shutdown");++explicitErrors;
    }
    log<<"explicit-error-cases="<<explicitErrors<<std::endl;
    log<<"complete-command-cases="<<commands.size()<<" all-bit-prefixes-rejected="<<prefixes<<" real-read-and-sync=1"<<std::endl;
    log<<"scheduler-and-modal-cases="<<cases<<" PASS"<<std::endl;
    std::ofstream result(ModernSmoke::ProbePath("result.log"),std::ios::app);
    Require(bool(result),"Cannot write replay result");result<<"portable-demo-callsite-dispatch-modal-wrap-errors before-renderer=1\n";
}
