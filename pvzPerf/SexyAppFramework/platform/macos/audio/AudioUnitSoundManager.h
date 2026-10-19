#pragma once
#include "AudioUnitDevice.h"
#include "sound/SoundDecode.h"
#include "sound/SoundManager.h"
#include "sound/SoundInstance.h"
#include <array>
#include <atomic>
#include <mutex>
#include <vector>

namespace Sexy {
class AudioUnitSoundManager;
class AudioUnitSoundInstance final : public SoundInstance {
    friend class AudioUnitSoundManager;
    AudioUnitSoundManager* mManager = nullptr;
    AudioUnitVoice* mVoice = nullptr;
    const float* mPCM = nullptr;
    unsigned int mSoundId = MAX_SOURCE_SOUNDS;
    unsigned int mFrames = 0, mSourceChannels = 0, mFrameBytes = 0, mDefaultFrequency = 0;
    bool mClaimed = false, mReleased = true, mHasPlayed = false;
    bool mLooping = false, mAutoRelease = false;
    double mPosition = 0, mFrequency = 44100;
    std::atomic<unsigned int> mBytePosition{0};
    double mBaseVolume = 1, mVolume = 1;
    int mBasePan = 0, mPan = 0;
    static void Render(void* context, float* output, unsigned int frames) noexcept;
    void RehupGain();
    void ReleaseVoice();
public:
    void Release() override;
    void SetBaseVolume(double value) override;
    void SetBasePan(int value) override;
    void SetVolume(double value) override;
    void SetPan(int value) override;
    void AdjustPitch(double steps) override;
    bool Play(bool looping, bool autoRelease) override;
    void Stop() override;
    bool IsPlaying() override;
    bool IsReleased() override;
    int GetSoundPosition();
    void SetSoundPosition(int position);
    void PausePlayback(int& offset);
    void ResumePlayback(int offset, bool looping);
};
class AudioUnitSoundManager final : public SoundManager {
    friend class AudioUnitSoundInstance;
    SoundDecoderLease mDecoder;
    struct Sample {
        std::vector<float> pcm;
        std::string name;
        unsigned int frequency = 0, channels = 0, frameBytes = 0;
        double volume = 1;
        int pan = 0;
    };
    AudioUnitDevice mDevice;
    std::mutex mControls;
    std::array<Sample, MAX_SOURCE_SOUNDS> mSamples{};
    std::array<AudioUnitSoundInstance, MAX_CHANNELS> mChannels{};
    double mMasterVolume = 1;
    void ReleaseSample(unsigned int id);
public:
    explicit AudioUnitSoundManager(NativeWindowHandle);
    ~AudioUnitSoundManager() override;
    bool LoadSound(unsigned int id, const std::string& name) override;
    int LoadSound(const std::string& name) override;
    void ReleaseSound(unsigned int id) override;
    void SetVolume(double volume) override;
    bool SetBaseVolume(unsigned int id, double volume) override;
    bool SetBasePan(unsigned int id, int pan) override;
    SoundInstance* GetSoundInstance(unsigned int id) override;
    void ReleaseSounds() override;
    void ReleaseChannels() override;
    void Flush() override;
    void SetCooperativeWindow(NativeWindowHandle) override;
    void StopAllSounds() override;
    int GetFreeSoundId() override;
    int GetNumSounds() override;
};
}
