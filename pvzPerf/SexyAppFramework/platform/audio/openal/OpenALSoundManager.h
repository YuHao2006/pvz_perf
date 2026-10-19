#pragma once
#include "OpenALDevice.h"
#include "sound/SoundDecode.h"
#include "sound/SoundManager.h"
#include "sound/SoundInstance.h"
#include <array>

namespace Sexy {
class OpenALSoundManager;
class OpenALSoundInstance final : public SoundInstance {
    friend class OpenALSoundManager;
    OpenALSoundManager* mManager = nullptr;
    unsigned int mSource = 0, mBuffer = 0;
    int mFrequency = 0, mFrameBytes = 0;
    bool mClaimed = false, mAutoRelease = false, mHasPlayed = false, mReleased = false;
    double mBaseVolume = 1, mVolume = 1;
    int mBasePan = 0, mPan = 0;
    void RehupVolume();
    void RehupPan();
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
    inline void PausePlayback(int& offset)
    {
        offset = GetSoundPosition();
        OpenALSoundInstance::Stop();
    }
    inline void ResumePlayback(int offset, bool looping)
    {
        OpenALSoundInstance::Play(looping, false);
        SetSoundPosition(offset);
    }
};
class OpenALSoundManager final : public SoundManager {
    friend class OpenALSoundInstance;
    SoundDecoderLease mDecoder;
    // Reverse member destruction closes mixer threads before the decoder module.
    OpenALDevice mDevice;
    std::array<unsigned int, MAX_SOURCE_SOUNDS> mBuffers{};
    std::array<std::string, MAX_SOURCE_SOUNDS> mNames{};
    std::array<double, MAX_SOURCE_SOUNDS> mVolumes{};
    std::array<int, MAX_SOURCE_SOUNDS> mPans{}, mFrequencies{}, mFrameBytes{};
    std::array<OpenALSoundInstance, MAX_CHANNELS> mChannels{};
    double mMasterVolume = 1;
public:
    explicit OpenALSoundManager(NativeWindowHandle);
    ~OpenALSoundManager() override;
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
