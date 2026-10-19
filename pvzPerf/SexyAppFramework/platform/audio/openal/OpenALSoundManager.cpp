#include "OpenALSoundManager.h"
#include <algorithm>
#include <cmath>
#include <utility>

namespace Sexy {
OpenALSoundManager::OpenALSoundManager(NativeWindowHandle)
{
    if (!alIsExtensionPresent("AL_EXT_FLOAT32"))
        throw std::runtime_error("OpenAL sound requires AL_EXT_FLOAT32");
    mVolumes.fill(1);
    for (auto& channel : mChannels) {
        channel.mManager = this;
        alGenSources(1, &channel.mSource);
        alSourcei(channel.mSource, AL_SOURCE_RELATIVE, AL_TRUE);
        alSourcef(channel.mSource, AL_ROLLOFF_FACTOR, 0);
        CheckOpenAL("OpenAL sound source creation failed");
    }
    mInitialized = true;
}
OpenALSoundManager::~OpenALSoundManager()
{
    mInitialized = false;
    ReleaseChannels();
    ReleaseSounds();
    for (auto& channel : mChannels)
        alDeleteSources(1, &channel.mSource);
}
bool OpenALSoundManager::LoadSound(unsigned int id, const std::string& name)
{
    if (id >= mBuffers.size()) return false;
    std::string resourceName = name;
    ReleaseSound(id);
    DecodedSound decoded;
    if (!DecodeSound(resourceName, decoded)) return false;
    unsigned int buffer = 0;
    alGenBuffers(1, &buffer);
    const int format = decoded.channels == 1 ? AL_FORMAT_MONO_FLOAT32 : AL_FORMAT_STEREO_FLOAT32;
    try {
        alBufferData(buffer, format, decoded.samples.data(),
            static_cast<int>(decoded.samples.size() * sizeof(float)), static_cast<int>(decoded.frequency));
        CheckOpenAL("OpenAL sound buffer upload failed");
    } catch (...) {
        if (buffer) alDeleteBuffers(1, &buffer);
        throw;
    }
    mBuffers[id] = buffer;
    mNames[id] = std::move(resourceName);
    mFrequencies[id] = static_cast<int>(decoded.frequency);
    mFrameBytes[id] = static_cast<int>(decoded.channels * sizeof(float));
    return true;
}
int OpenALSoundManager::LoadSound(const std::string& name)
{
    for (unsigned int id = 0; id < mBuffers.size(); ++id)
        if (mBuffers[id] && mNames[id] == name) return static_cast<int>(id);
    for (int id = MAX_SOURCE_SOUNDS - 1; id >= 0; --id)
        if (!mBuffers[id]) return LoadSound(id, name) ? id : -1;
    return -1;
}
void OpenALSoundManager::ReleaseSound(unsigned int id)
{
    if (id >= mBuffers.size()) return;
    for (auto& channel : mChannels)
        if (channel.mClaimed && channel.mBuffer == mBuffers[id]) channel.Release();
    if (mBuffers[id]) alDeleteBuffers(1, &mBuffers[id]);
    mBuffers[id] = 0;
    mNames[id].clear();
}
void OpenALSoundManager::SetVolume(double volume)
{
    mMasterVolume = volume;
    for (auto& channel : mChannels) if (channel.mClaimed) channel.RehupVolume();
}
bool OpenALSoundManager::SetBaseVolume(unsigned int id, double volume)
{
    if (id >= mBuffers.size()) return false;
    mVolumes[id] = volume;
    return true;
}
bool OpenALSoundManager::SetBasePan(unsigned int id, int pan)
{
    if (id >= mBuffers.size()) return false;
    mPans[id] = pan;
    return true;
}
SoundInstance* OpenALSoundManager::GetSoundInstance(unsigned int id)
{
    if (id >= mBuffers.size() || !mBuffers[id]) return nullptr;
    for (auto& channel : mChannels) {
        if (channel.mClaimed && !channel.IsReleased()) continue;
        channel.mClaimed = true;
        channel.mReleased = channel.mHasPlayed = channel.mAutoRelease = false;
        channel.mBuffer = mBuffers[id];
        channel.mFrequency = mFrequencies[id];
        channel.mFrameBytes = mFrameBytes[id];
        channel.mBaseVolume = mVolumes[id];
        channel.mBasePan = mPans[id];
        channel.mVolume = 1;
        channel.mPan = 0;
        alSourcei(channel.mSource, AL_BUFFER, channel.mBuffer);
        alSourcef(channel.mSource, AL_PITCH, 1);
        channel.RehupVolume();
        channel.RehupPan();
        CheckOpenAL("OpenAL sound source binding failed");
        return &channel;
    }
    return nullptr;
}
void OpenALSoundManager::ReleaseSounds()
{
    for (unsigned int id = 0; id < mBuffers.size(); ++id) ReleaseSound(id);
}
void OpenALSoundManager::ReleaseChannels()
{
    for (auto& channel : mChannels) if (channel.mClaimed) channel.Release();
}
void OpenALSoundManager::Flush()
{
    for (auto& channel : mChannels) if (channel.mClaimed) channel.IsReleased();
}
void OpenALSoundManager::SetCooperativeWindow(NativeWindowHandle) {}
void OpenALSoundManager::StopAllSounds()
{
    for (auto& channel : mChannels) if (channel.mClaimed) {
        const bool autoRelease = channel.mAutoRelease;
        channel.Stop();
        channel.mAutoRelease = autoRelease;
    }
}
int OpenALSoundManager::GetFreeSoundId()
{
    for (unsigned int id = 0; id < mBuffers.size(); ++id) if (!mBuffers[id]) return id;
    return -1;
}
int OpenALSoundManager::GetNumSounds()
{
    return static_cast<int>(std::count_if(mBuffers.begin(), mBuffers.end(),
        [](auto buffer) { return buffer != 0; }));
}
void OpenALSoundInstance::RehupVolume()
{
    const double volume = std::max(0.0, mBaseVolume * mVolume * mManager->mMasterVolume);
    const int db = static_cast<int>((std::log10(1 + volume * 9) - 1) * 2333);
    alSourcef(mSource, AL_GAIN, db < -2000 ? 0.0f :
        static_cast<float>(std::pow(10.0, db / 2000.0)));
}
void OpenALSoundInstance::RehupPan()
{
    const int pan = std::clamp(mBasePan + mPan, -10000, 10000);
    const double offset = (1 - std::pow(10.0, -std::abs(pan) / 2000.0)) * (pan < 0 ? -1 : 1);
    alSource3f(mSource, AL_POSITION, static_cast<float>(offset), 0,
        -static_cast<float>(std::sqrt(1 - offset * offset)));
}
void OpenALSoundInstance::Release()
{
    Stop();
    alSourcei(mSource, AL_BUFFER, 0);
    mReleased = true;
    mClaimed = false;
}
void OpenALSoundInstance::SetBaseVolume(double value) { mBaseVolume = value; RehupVolume(); }
void OpenALSoundInstance::SetBasePan(int value) { mBasePan = value; RehupPan(); }
void OpenALSoundInstance::SetVolume(double value) { mVolume = value; RehupVolume(); }
void OpenALSoundInstance::SetPan(int value) { mPan = value; RehupPan(); }
void OpenALSoundInstance::AdjustPitch(double steps)
{
    alSourcef(mSource, AL_PITCH, static_cast<float>(std::clamp(
        std::pow(2.0, steps / 12), 100.0 / mFrequency, 200000.0 / mFrequency)));
}
bool OpenALSoundInstance::Play(bool looping, bool autoRelease)
{
    Stop();
    mHasPlayed = true;
    mAutoRelease = autoRelease;
    alSourcei(mSource, AL_LOOPING, looping ? AL_TRUE : AL_FALSE);
    alSourcePlay(mSource);
    CheckOpenAL("OpenAL sound playback failed");
    return true;
}
void OpenALSoundInstance::Stop()
{
    alSourceStop(mSource);
    alSourceRewind(mSource);
    mAutoRelease = false;
}
bool OpenALSoundInstance::IsPlaying()
{
    int state = 0;
    alGetSourcei(mSource, AL_SOURCE_STATE, &state);
    return mHasPlayed && state == AL_PLAYING;
}
bool OpenALSoundInstance::IsReleased()
{
    if (!mReleased && mAutoRelease && mHasPlayed && !IsPlaying()) Release();
    return mReleased;
}
int OpenALSoundInstance::GetSoundPosition()
{
    int frames = 0;
    alGetSourcei(mSource, AL_SAMPLE_OFFSET, &frames);
    CheckOpenAL("OpenAL sound position query failed");
    return frames * mFrameBytes;
}
void OpenALSoundInstance::SetSoundPosition(int position)
{
    if (position < 0 || position % mFrameBytes)
        throw std::invalid_argument("OpenAL sound position must align to a PCM frame");
    alSourcei(mSource, AL_SAMPLE_OFFSET, position / mFrameBytes);
    CheckOpenAL("OpenAL sound seek failed");
}
}
