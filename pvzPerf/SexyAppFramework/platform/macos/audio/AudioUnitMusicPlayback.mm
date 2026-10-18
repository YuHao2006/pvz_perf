#include "AudioUnitMusicPlayback.h"
#include "sound/BassLoader.h"
#include <cmath>
#include <cstring>
#include <stdexcept>
#include <string>

namespace Sexy {
NativeMusicPlayback::~NativeMusicPlayback() { Close(); }
void NativeMusicPlayback::ResetDecode()
{
    mReadFrame = mDecodedFrames = 0;
    mPrimed = mLastFrame = false;
    mPhase = mSourceCursor = 0;
    mPlayedFrames.store(0, std::memory_order_relaxed);
    mDecodeError.store(0, std::memory_order_relaxed);
}
bool NativeMusicPlayback::ReadFrame(float (&frame)[2]) noexcept
{
    if (mReadFrame == mDecodedFrames) {
        const auto bytes = gBass->BASS_ChannelGetData(mHandle, mPCM.data(), 512 * mFrameBytes);
        if (bytes == static_cast<unsigned int>(-1)) {
            const int error = gBass->BASS_ErrorGetCode();
            if (error != BASS_ERROR_ENDED) mDecodeError.store(error, std::memory_order_release);
            return false;
        }
        if (!bytes) return false;
        if (bytes > mPCM.size() || bytes % mFrameBytes) {
            mDecodeError.store(BASS_ERROR_FILEFORM, std::memory_order_release);
            return false;
        }
        mReadFrame = 0;
        mDecodedFrames = bytes / mFrameBytes;
    }
    const auto* data = mPCM.data() + mReadFrame++ * mFrameBytes;
    for (unsigned int channel = 0; channel < mChannels; ++channel) {
        if (mFloat) {
            std::memcpy(&frame[channel], data + channel * 4, 4);
        } else if (mSampleBytes == 1) {
            frame[channel] = (int(data[channel]) - 128) / 128.0f;
        } else {
            short sample;
            std::memcpy(&sample, data + channel * 2, 2);
            frame[channel] = sample / 32768.0f;
        }
    }
    if (mChannels == 1) frame[1] = frame[0];
    return true;
}
void NativeMusicPlayback::Render(void* context, float* output, unsigned int frames) noexcept
{
    auto& voice = *static_cast<NativeMusicPlayback*>(context);
    if (!voice.mPrimed) {
        if (!voice.ReadFrame(voice.mCurrent)) {
            voice.mVoice->state.store(AudioUnitVoiceState::Stopped);
            return;
        }
        if (!voice.ReadFrame(voice.mNext)) {
            voice.mNext[0] = voice.mCurrent[0];
            voice.mNext[1] = voice.mCurrent[1];
            voice.mLastFrame = true;
        }
        voice.mPrimed = true;
    }
    for (unsigned int frame = 0; frame < frames; ++frame) {
        const float fraction = static_cast<float>(voice.mPhase);
        for (unsigned int channel = 0; channel < 2; ++channel)
            output[frame * 2 + channel] = voice.mCurrent[channel] +
                (voice.mNext[channel] - voice.mCurrent[channel]) * fraction;
        voice.mSourceCursor += voice.mStep;
        voice.mPhase += voice.mStep;
        while (voice.mPhase >= 1) {
            voice.mPhase -= 1;
            if (voice.mLastFrame) {
                voice.mPlayedFrames.store(static_cast<unsigned long long>(voice.mSourceCursor),
                    std::memory_order_relaxed);
                voice.mVoice->state.store(AudioUnitVoiceState::Stopped);
                return;
            }
            voice.mCurrent[0] = voice.mNext[0];
            voice.mCurrent[1] = voice.mNext[1];
            if (!voice.ReadFrame(voice.mNext)) {
                voice.mNext[0] = voice.mCurrent[0];
                voice.mNext[1] = voice.mCurrent[1];
                voice.mLastFrame = true;
            }
        }
    }
    voice.mPlayedFrames.store(static_cast<unsigned long long>(voice.mSourceCursor),
        std::memory_order_relaxed);
}
void NativeMusicPlayback::Initialize(unsigned int handle, bool module)
{
    mHandle = handle;
    mModule = module;
    BASS_CHANNELINFO info{};
    if (!gBass->BASS_ChannelGetInfo(handle, &info) || !info.freq ||
        (info.chans != 1 && info.chans != 2))
        throw std::runtime_error("Audio Unit music requires mono/stereo PCM");
    mChannels = info.chans;
    mFloat = (info.flags & BASS_SAMPLE_FLOAT) != 0;
    mSampleBytes = mFloat ? 4 : (info.flags & BASS_SAMPLE_8BITS) ? 1 : 2;
    mFrameBytes = mChannels * mSampleBytes;
    mStep = double(info.freq) / AudioUnitDevice::SampleRate;
    mDevice = std::make_unique<AudioUnitDevice>();
    mVoice = mDevice->AcquireVoice(this, Render);
    SetGain(0);
    // Prime decoder-side allocations before playback, then restore its start.
    float sample[2];
    ReadFrame(sample);
    Check();
    if (!Seek(0, module ? BASS_POS_MUSIC_ORDER : BASS_POS_BYTE))
        throw std::runtime_error("Cannot rewind the prepared music decoder");
}
void NativeMusicPlayback::Close()
{
    if (mVoice) {
        mDevice->ReleaseVoice(mVoice);
        mVoice = nullptr;
    }
    mDevice.reset();
}
void NativeMusicPlayback::Play(bool restart)
{
    if (restart && !Seek(0, mModule ? BASS_POS_MUSIC_ORDER : BASS_POS_BYTE))
        throw std::runtime_error("Music decoder rewind failed");
    mVoice->state.store(AudioUnitVoiceState::Playing);
}
void NativeMusicPlayback::Stop() { QuiesceAudioUnitVoice(*mVoice); }
void NativeMusicPlayback::Pause()
{
    if (QuiesceAudioUnitVoice(*mVoice) != AudioUnitVoiceState::Stopped)
        mVoice->state.store(AudioUnitVoiceState::Paused);
}
void NativeMusicPlayback::Resume() { Play(false); }
unsigned int NativeMusicPlayback::State() const
{
    if (!mVoice) return BASS_ACTIVE_STOPPED;
    const auto state = mVoice->state.load();
    return state == AudioUnitVoiceState::Playing ? BASS_ACTIVE_PLAYING :
        state == AudioUnitVoiceState::Paused ? BASS_ACTIVE_PAUSED : BASS_ACTIVE_STOPPED;
}
void NativeMusicPlayback::SetGain(double value)
{
    const float gain = static_cast<float>(value) * sMasterGain.load(std::memory_order_relaxed);
    mVoice->leftGain.store(gain, std::memory_order_relaxed);
    mVoice->rightGain.store(gain, std::memory_order_relaxed);
}
bool NativeMusicPlayback::Seek(unsigned long long position, unsigned int mode)
{
    const auto previous = QuiesceAudioUnitVoice(*mVoice);
    if (!gBass->BASS_ChannelSetPosition(mHandle, position, mode)) return false;
    ResetDecode();
    mByteStart = gBass->BASS_ChannelGetPosition(mHandle, BASS_POS_BYTE);
    if (mByteStart == static_cast<unsigned long long>(-1))
        throw std::runtime_error("Cannot query music decoder position");
    if (previous == AudioUnitVoiceState::Playing)
        mVoice->state.store(AudioUnitVoiceState::Playing);
    return true;
}
unsigned long long NativeMusicPlayback::Position(unsigned int mode) const
{
    if (mode == BASS_POS_BYTE)
        return mByteStart + mPlayedFrames.load(std::memory_order_relaxed) * mFrameBytes;
    return gBass->BASS_ChannelGetPosition(mHandle, mode);
}
void NativeMusicPlayback::Check() const
{
    mDevice->Check();
    const int error = mDecodeError.load(std::memory_order_acquire);
    if (error) throw std::runtime_error("Music decoder failed: " + std::to_string(error));
}
}
