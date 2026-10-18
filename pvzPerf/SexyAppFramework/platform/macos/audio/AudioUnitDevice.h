#pragma once
#include <atomic>
#include <memory>
#include <thread>

namespace Sexy {
enum class AudioUnitVoiceState { Stopped, Playing, Paused };
using AudioUnitRender = void (*)(void*, float*, unsigned int) noexcept;
struct AudioUnitVoice {
    std::atomic<AudioUnitVoiceState> state{AudioUnitVoiceState::Stopped};
    std::atomic<unsigned int> readers{0};
    std::atomic<float> leftGain{1}, rightGain{1};
    void* context = nullptr;
    AudioUnitRender render = nullptr;
};
inline AudioUnitVoiceState QuiesceAudioUnitVoice(AudioUnitVoice& voice) noexcept
{
    const auto previous = voice.state.exchange(AudioUnitVoiceState::Stopped);
    while (voice.readers.load() != 0) std::this_thread::yield();
    return previous;
}

class AudioUnitDevice final {
    struct Impl;
    std::unique_ptr<Impl> impl_;
public:
    static constexpr unsigned int SampleRate = 44100;
    AudioUnitDevice();
    ~AudioUnitDevice();
    AudioUnitDevice(const AudioUnitDevice&) = delete;
    AudioUnitDevice& operator=(const AudioUnitDevice&) = delete;
    AudioUnitVoice* AcquireVoice(void* context, AudioUnitRender render);
    void ReleaseVoice(AudioUnitVoice* voice);
    void Check() const;
};
}
