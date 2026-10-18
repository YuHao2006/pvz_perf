#include "platform/macos/audio/AudioUnitDevice.h"
#include <chrono>
#include <future>
#include <iostream>
#include <latch>
#include <stdexcept>

using namespace Sexy;
namespace {
void Require(bool condition, const char* message)
{
    if (!condition) throw std::runtime_error(message);
}
void ActiveReaderMustFinish()
{
    AudioUnitVoice voice;
    voice.state.store(AudioUnitVoiceState::Playing);
    std::latch reading(1), finish(1);
    std::jthread reader([&] {
        voice.readers.fetch_add(1);
        reading.count_down();
        finish.wait();
        voice.readers.fetch_sub(1);
    });
    reading.wait();
    auto stopped = std::async(std::launch::async, [&] {
        return QuiesceAudioUnitVoice(voice);
    });
    while (voice.state.load() == AudioUnitVoiceState::Playing) std::this_thread::yield();
    const bool waited = stopped.wait_for(std::chrono::seconds(0)) == std::future_status::timeout;
    finish.count_down();
    Require(stopped.get() == AudioUnitVoiceState::Playing, "Lost the previous playback state");
    reader.join();
    Require(waited, "Released source data while its render callback was still reading");
    Require(voice.readers.load() == 0, "Reader remained after quiescence");
}
void ReconfigurationDoesNotTear()
{
    AudioUnitVoice voice;
    unsigned int first = 0, second = ~0u;
    std::atomic<bool> done{false}, torn{false};
    std::jthread reader([&] {
        while (!done.load()) {
            voice.readers.fetch_add(1);
            if (voice.state.load() == AudioUnitVoiceState::Playing)
                if (second != ~first) torn.store(true);
            voice.readers.fetch_sub(1);
        }
    });
    for (unsigned int generation = 0; generation < 100000; ++generation) {
        QuiesceAudioUnitVoice(voice);
        first = generation;
        second = ~generation;
        voice.state.store(AudioUnitVoiceState::Playing);
    }
    done.store(true);
    QuiesceAudioUnitVoice(voice);
    reader.join();
    Require(!torn.load(), "Render callback observed partially replaced source data");
}
}
int main()
{
    try {
        ActiveReaderMustFinish();
        ReconfigurationDoesNotTear();
        std::cout << "PASS reader lifetime and 100000 source replacements\n";
    } catch (const std::exception& error) {
        std::cerr << error.what() << '\n';
        return 1;
    }
}
