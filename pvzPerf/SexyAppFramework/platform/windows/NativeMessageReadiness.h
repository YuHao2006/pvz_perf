#pragma once

#include <windows.h>
#include <stdexcept>
#include <string>

namespace Sexy {
struct NativeFrameMotionPoll {
    unsigned mLastUpdate=~0u;
    unsigned mLastHeartbeatUpdate=~0u;

    bool PollHeartbeat(unsigned update) noexcept {
        if(update==mLastHeartbeatUpdate) return false;
        mLastHeartbeatUpdate=update;
        // USER needs a general queue check; a sent-only peek still appears hung.
        // Observe once per update, leaving queued mouse/button events untouched.
        MSG message{};
        PeekMessageW(&message,nullptr,0,0,PM_NOREMOVE);
        return true;
    }

    bool Allow(unsigned update,bool inGame) noexcept {
        if(inGame || update==mLastUpdate) return false;
        mLastUpdate=update;
        return true;
    }
};

inline bool NativeNonMoveReady() {
    constexpr DWORD mask=(QS_ALLINPUT|QS_ALLPOSTMESSAGE)&~QS_MOUSEMOVE;
    const DWORD result=MsgWaitForMultipleObjectsEx(
        0,nullptr,0,mask,MWMO_INPUTAVAILABLE);
    if(result==WAIT_FAILED) {
        const DWORD error=GetLastError();
        throw std::runtime_error("MsgWaitForMultipleObjectsEx failed: "+std::to_string(error));
    }
    return result==WAIT_OBJECT_0;
}
}
