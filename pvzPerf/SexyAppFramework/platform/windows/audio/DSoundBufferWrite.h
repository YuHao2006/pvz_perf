#pragma once
#include "dsoundversion.h"
#include <memory>
#include <utility>

namespace Sexy {
struct DSoundBufferRelease {
    void operator()(IDirectSoundBuffer* buffer) const noexcept { buffer->Release(); }
};
using DSoundBufferOwner = std::unique_ptr<IDirectSoundBuffer, DSoundBufferRelease>;

// Scoped write ownership, not another audio backend. No allocation or copy:
// decode/read directly into the existing DirectSound write region.
class DSoundBufferWrite {
    IDirectSoundBuffer* mBuffer = nullptr;
public:
    void* mData = nullptr;
private:
    DWORD mSize = 0;
public:
    DSoundBufferWrite(IDirectSoundBuffer* buffer, DWORD size) {
        if (buffer->Lock(0, size, &mData, &mSize, nullptr, nullptr, 0) == DS_OK)
            mBuffer = buffer;
    }
    ~DSoundBufferWrite() {
        if (mBuffer) mBuffer->Unlock(mData, mSize, nullptr, 0);
    }
    DSoundBufferWrite(const DSoundBufferWrite&) = delete;
    DSoundBufferWrite& operator=(const DSoundBufferWrite&) = delete;
    bool Ready(DWORD size) const noexcept { return mBuffer && mData && mSize == size; }
    HRESULT Finish() noexcept {
        auto* buffer = std::exchange(mBuffer, nullptr);
        return buffer->Unlock(mData, mSize, nullptr, 0);
    }
};
}
