#pragma once
#include "SexyAppFramework/SexyAppBase.h"
#include <stdexcept>

namespace Sexy::DemoTools {
[[noreturn]] inline void ReplayError(const SexyAppBase& app, const std::string& why) {
    throw std::runtime_error("Demo replay error: tick=" + std::to_string(app.mUpdateCount) +
        " due=" + std::to_string(app.mLastDemoUpdateCnt) +
        " command=" + std::to_string(app.mDemoCmdNum) +
        " bit=" + std::to_string(app.mDemoBuffer.mReadBitPos) + ": " + why);
}
inline bool IsCallsiteCommand(int command) {
    switch (command) {
    case DEMO_REGISTRY_GETSUBKEYS: case DEMO_REGISTRY_READ:
    case DEMO_REGISTRY_WRITE: case DEMO_REGISTRY_ERASE:
    case DEMO_FILE_EXISTS: case DEMO_FILE_READ: case DEMO_FILE_WRITE:
    case DEMO_SYNC: case DEMO_ASSERT_STRING_EQUAL: case DEMO_ASSERT_INT_EQUAL:
    case DEMO_HANDLE_COMPLETE: return true;
    default: return false;
    }
}
inline bool HasPendingCallsite(const SexyAppBase& app) {
    return !app.mDemoNeedsCommand && !app.mDemoIsShortCmd &&
        IsCallsiteCommand(app.mDemoCmdNum) && app.mUpdateCount == app.mLastDemoUpdateCnt;
}

// Read-only lookahead: no Buffer underflow zero-filling, payload copies or input
// side effects. Respect the declared bit length as well as its backing storage.
class ReplayBits {
    const SexyAppBase& app;
public:
    int pos;
    explicit ReplayBits(const SexyAppBase& value) : app(value), pos(value.mDemoBuffer.mReadBitPos) {}
    std::uint64_t Remaining() const {
        const auto& data=app.mDemoBuffer;
        if (pos < 0 || data.mDataBitSize < pos ||
            static_cast<std::uint64_t>(data.mDataBitSize) > data.mData.size()*8ULL)
            ReplayError(app,"invalid bit cursor");
        return static_cast<std::uint64_t>(data.mDataBitSize-pos);
    }
    void Skip(std::uint64_t bits) {
        if (bits > Remaining()) ReplayError(app,"truncated command payload");
        pos += static_cast<int>(bits);
    }
    std::uint32_t Read(unsigned count) {
        if (count>32 || count>Remaining()) ReplayError(app,"truncated command header or payload");
        std::uint32_t value=0;
        for (unsigned i=0;i<count;++i,++pos)
            value |= static_cast<std::uint32_t>((app.mDemoBuffer.mData[pos/8]>>(pos%8))&1u)<<i;
        return value;
    }
    void String() {
        const auto length=Read(16);
        if (length>0x7fff) ReplayError(app,"negative string length");
        Skip(length*8ULL);
    }
};
inline void ValidatePayload(const SexyAppBase& app, int command, bool shortCommand, ReplayBits bits) {
    if (shortCommand) {bits.Skip(command==0?12:4);return;}
    switch(command) {
    case DEMO_MOUSE_POSITION: bits.Skip(24);break;
    case DEMO_ACTIVATE_APP: bits.Skip(1);break;
    case DEMO_SIZE: case DEMO_KEY_DOWN: case DEMO_KEY_UP: case DEMO_MOUSE_WHEEL: bits.Skip(8);break;
    case DEMO_KEY_CHAR: {const auto width=bits.Read(1);bits.Skip((width+1)*8);break;}
    case DEMO_CLOSE: case DEMO_MOUSE_ENTER: case DEMO_MOUSE_EXIT:
    case DEMO_LOADING_COMPLETE: case DEMO_IDLE: break;
    case DEMO_VIDEO_DATA: bits.Skip(16);break;
    case DEMO_HANDLE_COMPLETE: case DEMO_ASSERT_INT_EQUAL: bits.Skip(32);break;
    case DEMO_ASSERT_STRING_EQUAL: bits.String();break;
    case DEMO_REGISTRY_WRITE: case DEMO_REGISTRY_ERASE:
    case DEMO_FILE_EXISTS: case DEMO_FILE_WRITE: bits.Skip(1);break;
    case DEMO_FILE_READ:
        if (bits.Read(1)) {const auto bytes=bits.Read(32);bits.Skip(bytes*8ULL);}
        break;
    case DEMO_SYNC: {const auto bytes=bits.Read(32);bits.Skip(bytes*8ULL);break;}
    case DEMO_REGISTRY_READ:
        if (bits.Read(1)) {bits.Skip(32);const auto bytes=bits.Read(32);bits.Skip(bytes*8ULL);}
        break;
    case DEMO_REGISTRY_GETSUBKEYS:
        if (bits.Read(1)) {
            const auto count=bits.Read(32);
            if (count>bits.Remaining()/16) ReplayError(app,"invalid subkey count");
            for(std::uint32_t i=0;i<count;++i) bits.String();
        }
        break;
    default: ReplayError(app,"unknown command " + std::to_string(command));
    }
}
} // namespace Sexy::DemoTools
