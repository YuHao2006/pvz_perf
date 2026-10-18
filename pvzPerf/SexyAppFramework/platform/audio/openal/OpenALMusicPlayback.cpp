#include "OpenALMusicPlayback.h"
#include "sound/BassLoader.h"
#include <string>

namespace Sexy {
int AL_APIENTRY NativeMusicPlayback::Decode(void* context, void* output, int bytes) noexcept
{
    auto& voice = *static_cast<NativeMusicPlayback*>(context);
    const auto count = gBass->BASS_ChannelGetData(voice.mHandle, output,
        static_cast<unsigned int>(bytes));
    if (count != static_cast<unsigned int>(-1))
        return static_cast<int>(count);
    const int error = gBass->BASS_ErrorGetCode();
    if (error != BASS_ERROR_ENDED)
        voice.mDecodeError.store(error, std::memory_order_release);
    return 0;
}
NativeMusicPlayback::~NativeMusicPlayback() { Close(); }
void NativeMusicPlayback::Initialize(unsigned int handle, bool module)
{
    mHandle = handle;
    mModule = module;
    BASS_CHANNELINFO info{};
    if (!gBass->BASS_ChannelGetInfo(handle, &info) || (info.chans != 1 && info.chans != 2))
        throw std::runtime_error("OpenAL music requires mono/stereo PCM");
    const bool eightBit = (info.flags & BASS_SAMPLE_8BITS) != 0;
    mFrameBytes = static_cast<int>(info.chans) * (eightBit ? 1 : 2);
    const int format = info.chans == 1 ?
        (eightBit ? AL_FORMAT_MONO8 : AL_FORMAT_MONO16) :
        (eightBit ? AL_FORMAT_STEREO8 : AL_FORMAT_STEREO16);
    const auto callback = reinterpret_cast<LPALBUFFERCALLBACKSOFT>(
        alGetProcAddress("alBufferCallbackSOFT"));
    alGenBuffers(1, &mBuffer);
    alGenSources(1, &mSource);
    callback(mBuffer, format, static_cast<int>(info.freq), Decode, this);
    alSourcei(mSource, AL_BUFFER, mBuffer);
    alSourcei(mSource, AL_SOURCE_RELATIVE, AL_TRUE);
    alSourcef(mSource, AL_ROLLOFF_FACTOR, 0);
    SetGain(0);
    CheckOpenAL("OpenAL music callback setup failed");
}
void NativeMusicPlayback::Close()
{
    if (mSource) {
        alSourceStop(mSource);
        alSourcei(mSource, AL_BUFFER, 0);
        alDeleteSources(1, &mSource);
        mSource = 0;
    }
    if (mBuffer) {
        alDeleteBuffers(1, &mBuffer);
        mBuffer = 0;
    }
}
void NativeMusicPlayback::Play(bool restart)
{
    const auto state = State();
    if (restart) {
        Stop();
        if (!Seek(0, mModule ? BASS_POS_MUSIC_ORDER : BASS_POS_BYTE))
            throw std::runtime_error("Music decoder rewind failed");
    } else if (state == BASS_ACTIVE_PLAYING) {
        return;
    }
    if (restart || state != BASS_ACTIVE_PAUSED)
        mByteStart = gBass->BASS_ChannelGetPosition(mHandle, BASS_POS_BYTE);
    alSourcePlay(mSource);
    CheckOpenAL("OpenAL music playback failed");
}
void NativeMusicPlayback::Stop()
{
    alSourceStop(mSource);
    CheckOpenAL("OpenAL music stop failed");
}
void NativeMusicPlayback::Pause()
{
    alSourcePause(mSource);
    CheckOpenAL("OpenAL music pause failed");
}
void NativeMusicPlayback::Resume() { Play(false); }
unsigned int NativeMusicPlayback::State() const
{
    int state = 0;
    alGetSourcei(mSource, AL_SOURCE_STATE, &state);
    CheckOpenAL("OpenAL music state query failed");
    return state == AL_PLAYING ? BASS_ACTIVE_PLAYING :
        state == AL_PAUSED ? BASS_ACTIVE_PAUSED : BASS_ACTIVE_STOPPED;
}
void NativeMusicPlayback::SetGain(double value)
{
    alSourcef(mSource, AL_GAIN, static_cast<float>(value) *
        sMasterGain.load(std::memory_order_relaxed));
    CheckOpenAL("OpenAL music gain update failed");
}
bool NativeMusicPlayback::Seek(unsigned long long position, unsigned int mode)
{
    const bool playing = State() == BASS_ACTIVE_PLAYING;
    Stop();
    alSourceRewind(mSource);
    if (!gBass->BASS_ChannelSetPosition(mHandle, position, mode))
        return false;
    mByteStart = gBass->BASS_ChannelGetPosition(mHandle, BASS_POS_BYTE);
    mDecodeError.store(0, std::memory_order_relaxed);
    if (playing) Play(false);
    return true;
}
unsigned long long NativeMusicPlayback::Position(unsigned int mode) const
{
    if (mode == BASS_POS_BYTE) {
        int frames = 0;
        alGetSourcei(mSource, AL_SAMPLE_OFFSET, &frames);
        CheckOpenAL("OpenAL music position query failed");
        return mByteStart + static_cast<unsigned long long>(frames) * mFrameBytes;
    }
    return gBass->BASS_ChannelGetPosition(mHandle, mode);
}
void NativeMusicPlayback::Check() const
{
    const int error = mDecodeError.load(std::memory_order_acquire);
    if (error)
        throw std::runtime_error("OpenAL music callback decoder failed: " + std::to_string(error));
}
}
