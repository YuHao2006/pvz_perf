#include "AudioUnitSoundManager.h"
#include "sound/BassLoader.h"
#include "sound/LegacyAuDecode.h"
#include "paklib/PakInterface.h"
#include <algorithm>
#include <cmath>
#include <cstring>
#include <limits>
#include <memory>
#include <stdexcept>
#include <string_view>
#include <utility>

namespace Sexy {
namespace {
struct Decoder {
    unsigned int handle;
    ~Decoder() { if (handle) gBass->BASS_StreamFree(handle); }
};
float ReadPCM(const unsigned char* bytes, unsigned int sampleBytes)
{
    if (sampleBytes == 1) return (static_cast<int>(*bytes) - 128) / 128.0f;
    if (sampleBytes == 2) {
        short value;
        std::memcpy(&value, bytes, sizeof(value));
        return value / 32768.0f;
    }
    float value;
    std::memcpy(&value, bytes, sizeof(value));
    if (!std::isfinite(value))
        throw std::runtime_error("Sound PCM contains a non-finite sample");
    return value;
}
}
static_assert(std::atomic<unsigned int>::is_always_lock_free);

AudioUnitSoundManager::DecoderLease::DecoderLease() { LoadBassDLL(); }
AudioUnitSoundManager::DecoderLease::~DecoderLease() { FreeBassDLL(); }
AudioUnitSoundManager::AudioUnitSoundManager(NativeWindowHandle)
{
    try {
        for (auto& channel : mChannels) {
            channel.mManager = this;
            channel.mVoice = mDevice.AcquireVoice(&channel, AudioUnitSoundInstance::Render);
        }
        mDevice.Check();
        mInitialized = true;
    } catch (...) {
        for (auto& channel : mChannels)
            if (channel.mVoice) mDevice.ReleaseVoice(channel.mVoice);
        throw;
    }
}
AudioUnitSoundManager::~AudioUnitSoundManager()
{
    mInitialized = false;
    ReleaseSounds();
    for (auto& channel : mChannels)
        if (channel.mVoice) mDevice.ReleaseVoice(channel.mVoice);
}
void AudioUnitSoundInstance::Render(void* context, float* output, unsigned int frames) noexcept
{
    auto& voice = *static_cast<AudioUnitSoundInstance*>(context);
    const double step = voice.mFrequency / AudioUnitDevice::SampleRate;
    for (unsigned int frame = 0; frame < frames; ++frame) {
        const auto first = static_cast<unsigned int>(voice.mPosition);
        const auto next = first + 1 < voice.mFrames ? first + 1 :
            (voice.mLooping ? 0U : first);
        const float fraction = static_cast<float>(voice.mPosition - first);
        const unsigned int left = first * voice.mSourceChannels;
        const unsigned int right = next * voice.mSourceChannels;
        output[frame * 2] = voice.mPCM[left] +
            (voice.mPCM[right] - voice.mPCM[left]) * fraction;
        const unsigned int stereo = voice.mSourceChannels - 1;
        output[frame * 2 + 1] = voice.mPCM[left + stereo] +
            (voice.mPCM[right + stereo] - voice.mPCM[left + stereo]) * fraction;
        voice.mPosition += step;
        if (voice.mPosition >= voice.mFrames) {
            if (voice.mLooping) voice.mPosition = std::fmod(voice.mPosition, voice.mFrames);
            else {
                voice.mPosition = 0;
                voice.mBytePosition.store(0, std::memory_order_relaxed);
                voice.mVoice->state.store(AudioUnitVoiceState::Stopped);
                return;
            }
        }
    }
    voice.mBytePosition.store(static_cast<unsigned int>(voice.mPosition) * voice.mFrameBytes,
        std::memory_order_relaxed);
}
bool AudioUnitSoundManager::LoadSound(unsigned int id, const std::string& name)
{
    if (id >= mSamples.size()) return false;
    const std::string resourceName = name;
    ReleaseSound(id);
    for (const char* extension : {".wav", ".ogg", ".au"}) {
        const std::string path = resourceName + extension;
        std::unique_ptr<PFILE, decltype(&p_fclose)> file(p_fopen(path.c_str(), "rb"), &p_fclose);
        if (!file) continue;
        if (p_fseek(file.get(), 0, SEEK_END) != 0)
            throw std::runtime_error("Sound seek failed: " + path);
        const int size = p_ftell(file.get());
        if (size <= 0 || p_fseek(file.get(), 0, SEEK_SET) != 0)
            throw std::runtime_error("Invalid sound size: " + path);
        std::vector<unsigned char> encoded(static_cast<size_t>(size));
        if (p_fread(encoded.data(), 1, size, file.get()) != encoded.size())
            throw std::runtime_error("Sound read failed: " + path);
        file.reset();
        if (std::string_view(extension) == ".au") encoded = DecodeLegacyAuToWave(encoded);
        Decoder decoder{gBass->BASS_StreamCreateFile(TRUE, encoded.data(), 0, encoded.size(),
            BASS_STREAM_DECODE)};
        if (!decoder.handle) throw std::runtime_error("BASS sound decode failed: " + path);
        BASS_CHANNELINFO info{};
        if (!gBass->BASS_ChannelGetInfo(decoder.handle, &info) ||
            !info.freq || (info.chans != 1 && info.chans != 2))
            throw std::runtime_error("Sound requires mono/stereo PCM: " + path);
        const unsigned int sampleBytes = info.flags & BASS_SAMPLE_FLOAT ? 4 :
            (info.flags & BASS_SAMPLE_8BITS ? 1 : 2);
        const unsigned int frameBytes = info.chans * sampleBytes;
        const unsigned long long bytes = gBass->BASS_ChannelGetLength(decoder.handle, BASS_POS_BYTE);
        if (!bytes || bytes > static_cast<unsigned long long>(std::numeric_limits<int>::max()) ||
            bytes % frameBytes)
            throw std::runtime_error("Invalid decoded sound size: " + path);
        std::vector<unsigned char> pcm(static_cast<size_t>(bytes));
        unsigned int decoded = 0;
        while (decoded < bytes) {
            const auto count = gBass->BASS_ChannelGetData(decoder.handle, pcm.data() + decoded,
                static_cast<unsigned int>(bytes - decoded));
            if (!count || count == ~0U || count > bytes - decoded)
                throw std::runtime_error("Incomplete sound decode: " + path);
            decoded += count;
        }
        Sample candidate;
        candidate.pcm.resize(pcm.size() / sampleBytes);
        for (size_t index = 0; index < candidate.pcm.size(); ++index)
            candidate.pcm[index] = ReadPCM(pcm.data() + index * sampleBytes, sampleBytes);
        candidate.frequency = info.freq;
        candidate.channels = info.chans;
        candidate.frameBytes = frameBytes;
        candidate.name = resourceName;
        std::lock_guard lock(mControls);
        candidate.volume = mSamples[id].volume;
        candidate.pan = mSamples[id].pan;
        ReleaseSample(id);
        mSamples[id] = std::move(candidate);
        return true;
    }
    return false;
}
int AudioUnitSoundManager::LoadSound(const std::string& name)
{
    int freeId = -1;
    {
        std::lock_guard lock(mControls);
        for (unsigned int id = 0; id < mSamples.size(); ++id) {
            if (!mSamples[id].pcm.empty() && mSamples[id].name == name) return static_cast<int>(id);
            if (mSamples[id].pcm.empty()) freeId = static_cast<int>(id);
        }
    }
    return freeId >= 0 && LoadSound(static_cast<unsigned int>(freeId), name) ? freeId : -1;
}
void AudioUnitSoundManager::ReleaseSample(unsigned int id)
{
    for (auto& voice : mChannels)
        if (voice.mSoundId == id) voice.ReleaseVoice();
    std::vector<float>().swap(mSamples[id].pcm);
    mSamples[id].name.clear();
}
void AudioUnitSoundManager::ReleaseSound(unsigned int id)
{
    if (id >= mSamples.size()) return;
    std::lock_guard lock(mControls);
    ReleaseSample(id);
}
void AudioUnitSoundManager::SetVolume(double volume)
{
    std::lock_guard lock(mControls);
    mMasterVolume = volume;
    for (auto& voice : mChannels) if (voice.mClaimed) voice.RehupGain();
}
bool AudioUnitSoundManager::SetBaseVolume(unsigned int id, double volume)
{
    if (id >= mSamples.size()) return false;
    std::lock_guard lock(mControls);
    mSamples[id].volume = volume;
    return true;
}
bool AudioUnitSoundManager::SetBasePan(unsigned int id, int pan)
{
    if (id >= mSamples.size()) return false;
    std::lock_guard lock(mControls);
    mSamples[id].pan = pan;
    return true;
}
SoundInstance* AudioUnitSoundManager::GetSoundInstance(unsigned int id)
{
    if (id >= mSamples.size()) return nullptr;
    std::lock_guard lock(mControls);
    mDevice.Check();
    const auto& sample = mSamples[id];
    if (sample.pcm.empty()) return nullptr;
    for (auto& voice : mChannels) {
        if (voice.mClaimed && !(voice.mAutoRelease && voice.mHasPlayed &&
            voice.mVoice->state.load() == AudioUnitVoiceState::Stopped)) continue;
        voice.ReleaseVoice();
        voice.mClaimed = true;
        voice.mReleased = false;
        voice.mHasPlayed = false;
        voice.mSoundId = id;
        voice.mPCM = sample.pcm.data();
        voice.mFrames = static_cast<unsigned int>(sample.pcm.size() / sample.channels);
        voice.mSourceChannels = sample.channels;
        voice.mFrameBytes = sample.frameBytes;
        voice.mDefaultFrequency = sample.frequency;
        voice.mFrequency = sample.frequency;
        voice.mBaseVolume = sample.volume;
        voice.mBasePan = sample.pan;
        voice.mVolume = 1;
        voice.mPan = 0;
        voice.RehupGain();
        return &voice;
    }
    return nullptr;
}
void AudioUnitSoundManager::ReleaseSounds()
{
    std::lock_guard lock(mControls);
    for (unsigned int id = 0; id < mSamples.size(); ++id) ReleaseSample(id);
}
void AudioUnitSoundManager::ReleaseChannels()
{
    std::lock_guard lock(mControls);
    for (auto& voice : mChannels) voice.ReleaseVoice();
}
void AudioUnitSoundManager::Flush()
{
    std::lock_guard lock(mControls);
    mDevice.Check();
    for (auto& voice : mChannels)
        if (voice.mAutoRelease && voice.mHasPlayed &&
            voice.mVoice->state.load() == AudioUnitVoiceState::Stopped) voice.ReleaseVoice();
}
void AudioUnitSoundManager::SetCooperativeWindow(NativeWindowHandle) {}
void AudioUnitSoundManager::StopAllSounds()
{
    std::lock_guard lock(mControls);
    for (auto& voice : mChannels) {
        QuiesceAudioUnitVoice(*voice.mVoice);
        voice.mPosition = 0;
        voice.mBytePosition.store(0, std::memory_order_relaxed);
    }
}
int AudioUnitSoundManager::GetFreeSoundId()
{
    std::lock_guard lock(mControls);
    for (unsigned int id = 0; id < mSamples.size(); ++id)
        if (mSamples[id].pcm.empty()) return static_cast<int>(id);
    return -1;
}
int AudioUnitSoundManager::GetNumSounds()
{
    std::lock_guard lock(mControls);
    return static_cast<int>(std::count_if(mSamples.begin(), mSamples.end(),
        [](const auto& sample) { return !sample.pcm.empty(); }));
}
void AudioUnitSoundInstance::RehupGain()
{
    const double volume = std::max(0.0, mBaseVolume * mVolume * mManager->mMasterVolume);
    const double db = std::trunc((std::log10(1 + volume * 9) - 1) * 2333);
    const double gain = db < -2000 ? 0 : std::pow(10.0, db / 2000);
    const auto pan = std::clamp(static_cast<long long>(mBasePan) + mPan, -10000LL, 10000LL);
    mVoice->leftGain.store(static_cast<float>(gain *
        (pan > 0 ? std::pow(10.0, -pan / 2000.0) : 1)), std::memory_order_relaxed);
    mVoice->rightGain.store(static_cast<float>(gain *
        (pan < 0 ? std::pow(10.0, pan / 2000.0) : 1)), std::memory_order_relaxed);
}
void AudioUnitSoundInstance::ReleaseVoice()
{
    QuiesceAudioUnitVoice(*mVoice);
    mClaimed = mAutoRelease = false;
    mReleased = true;
    mPosition = 0;
    mBytePosition.store(0, std::memory_order_relaxed);
    mPCM = nullptr;
    mFrames = 0;
    mSoundId = MAX_SOURCE_SOUNDS;
}
void AudioUnitSoundInstance::Release()
{
    std::lock_guard lock(mManager->mControls);
    ReleaseVoice();
}
void AudioUnitSoundInstance::SetBaseVolume(double value)
{
    std::lock_guard lock(mManager->mControls);
    mBaseVolume = value; RehupGain();
}
void AudioUnitSoundInstance::SetBasePan(int value)
{
    std::lock_guard lock(mManager->mControls);
    mBasePan = value; RehupGain();
}
void AudioUnitSoundInstance::SetVolume(double value)
{
    std::lock_guard lock(mManager->mControls);
    mVolume = value; RehupGain();
}
void AudioUnitSoundInstance::SetPan(int value)
{
    std::lock_guard lock(mManager->mControls);
    mPan = value; RehupGain();
}
void AudioUnitSoundInstance::AdjustPitch(double steps)
{
    std::lock_guard lock(mManager->mControls);
    if (!mClaimed) return;
    if (std::isnan(steps)) throw std::invalid_argument("Audio Unit pitch is NaN");
    const auto state = QuiesceAudioUnitVoice(*mVoice);
    mFrequency = std::clamp(mDefaultFrequency * std::pow(2.0, steps / 12), 100.0, 200000.0);
    mVoice->state.store(state);
}
bool AudioUnitSoundInstance::Play(bool looping, bool autoRelease)
{
    std::lock_guard lock(mManager->mControls);
    if (!mClaimed) return false;
    mManager->mDevice.Check();
    QuiesceAudioUnitVoice(*mVoice);
    mPosition = 0;
    mBytePosition.store(0, std::memory_order_relaxed);
    mHasPlayed = true;
    mLooping = looping;
    mAutoRelease = autoRelease;
    mVoice->state.store(AudioUnitVoiceState::Playing);
    return true;
}
void AudioUnitSoundInstance::Stop()
{
    std::lock_guard lock(mManager->mControls);
    QuiesceAudioUnitVoice(*mVoice);
    mAutoRelease = false;
    mPosition = 0;
    mBytePosition.store(0, std::memory_order_relaxed);
}
bool AudioUnitSoundInstance::IsPlaying()
{
    std::lock_guard lock(mManager->mControls);
    mManager->mDevice.Check();
    return mHasPlayed && mVoice->state.load() == AudioUnitVoiceState::Playing;
}
bool AudioUnitSoundInstance::IsReleased()
{
    std::lock_guard lock(mManager->mControls);
    if (mAutoRelease && mHasPlayed && mVoice->state.load() == AudioUnitVoiceState::Stopped)
        ReleaseVoice();
    return mReleased;
}
int AudioUnitSoundInstance::GetSoundPosition()
{
    return static_cast<int>(mBytePosition.load(std::memory_order_relaxed));
}
void AudioUnitSoundInstance::SetSoundPosition(int position)
{
    std::lock_guard lock(mManager->mControls);
    if (!mClaimed) return;
    if (position < 0 || position % mFrameBytes ||
        static_cast<unsigned int>(position) / mFrameBytes >= mFrames)
        throw std::invalid_argument("Audio Unit sound position is outside PCM frames");
    const auto state = QuiesceAudioUnitVoice(*mVoice);
    mPosition = static_cast<unsigned int>(position) / mFrameBytes;
    mBytePosition.store(static_cast<unsigned int>(position), std::memory_order_relaxed);
    mVoice->state.store(state);
}
void AudioUnitSoundInstance::PausePlayback(int& offset)
{
    std::lock_guard lock(mManager->mControls);
    QuiesceAudioUnitVoice(*mVoice);
    offset = static_cast<int>(mBytePosition.load(std::memory_order_relaxed));
    mAutoRelease = false;
    if (mClaimed) mVoice->state.store(AudioUnitVoiceState::Paused);
}
void AudioUnitSoundInstance::ResumePlayback(int offset, bool looping)
{
    std::lock_guard lock(mManager->mControls);
    if (!mClaimed) return;
    if (offset < 0 || offset % mFrameBytes ||
        static_cast<unsigned int>(offset) / mFrameBytes >= mFrames)
        throw std::invalid_argument("Audio Unit resume position is outside PCM frames");
    mManager->mDevice.Check();
    QuiesceAudioUnitVoice(*mVoice);
    mPosition = static_cast<unsigned int>(offset) / mFrameBytes;
    mBytePosition.store(static_cast<unsigned int>(offset), std::memory_order_relaxed);
    mLooping = looping;
    mHasPlayed = true;
    mAutoRelease = false;
    mVoice->state.store(AudioUnitVoiceState::Playing);
}
}
