#pragma once
#include "OpenALDevice.h"
#include <atomic>

namespace Sexy {
class NativeMusicPlayback final {
    unsigned int mHandle = 0, mSource = 0, mBuffer = 0;
    int mFrameBytes = 0;
    bool mModule = false;
    unsigned long long mByteStart = 0;
    std::atomic<int> mDecodeError{0};
    static inline std::atomic<float> sMasterGain{1};
    static int AL_APIENTRY Decode(void* context, void* output, int bytes) noexcept;
public:
    static constexpr bool PerVoiceMasterGain = true;
    NativeMusicPlayback() = default;
    NativeMusicPlayback(const NativeMusicPlayback&) = delete;
    NativeMusicPlayback& operator=(const NativeMusicPlayback&) = delete;
    ~NativeMusicPlayback();
    void Initialize(unsigned int handle, bool module);
    void Close();
    void Play(bool restart = false);
    void Stop();
    void Pause();
    void Resume();
    unsigned int State() const;
    void SetGain(double value);
    bool Seek(unsigned long long position, unsigned int mode);
    unsigned long long Position(unsigned int mode) const;
    void Check() const;
    static inline void SetMasterGain(double value) {
        sMasterGain.store(static_cast<float>(value), std::memory_order_relaxed);
    }
};
}
