#pragma once
#include "AudioUnitDevice.h"
#include <array>

namespace Sexy {
class NativeMusicPlayback final {
    std::unique_ptr<AudioUnitDevice> mDevice;
    AudioUnitVoice* mVoice = nullptr;
    unsigned int mHandle = 0, mChannels = 0, mSampleBytes = 0, mFrameBytes = 0;
    bool mModule = false, mFloat = false, mPrimed = false, mLastFrame = false;
    double mStep = 1, mPhase = 0, mSourceCursor = 0;
    float mCurrent[2]{}, mNext[2]{};
    std::array<unsigned char, 512 * 8> mPCM{};
    size_t mReadFrame = 0, mDecodedFrames = 0;
    unsigned long long mByteStart = 0;
    std::atomic<unsigned long long> mPlayedFrames{0};
    std::atomic<int> mDecodeError{0};
    static inline std::atomic<float> sMasterGain{1};
    bool ReadFrame(float (&frame)[2]) noexcept;
    void ResetDecode();
    static void Render(void* context, float* output, unsigned int frames) noexcept;
public:
    static constexpr bool PerVoiceMasterGain = true;
    NativeMusicPlayback() = default;
    ~NativeMusicPlayback();
    NativeMusicPlayback(const NativeMusicPlayback&) = delete;
    NativeMusicPlayback& operator=(const NativeMusicPlayback&) = delete;
    void Initialize(unsigned int handle, bool module);
    void Close();
    void Play(bool restart = false);
    void Stop();
    void Pause();
    void Resume();
    unsigned int State() const;
    void SetGain(float value);
    bool Seek(unsigned long long position, unsigned int mode);
    unsigned long long Position(unsigned int mode) const;
    void Check() const;
    static void SetMasterGain(float value);
};
}
