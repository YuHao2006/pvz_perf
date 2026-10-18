#include "SexyAppFramework/platform/audio/openal/OpenALDevice.h"
#include "SexyAppFramework/platform/audio/openal/OpenALMusicPlayback.h"
#include "SexyAppFramework/sound/BassLoader.h"
#include <pulse/simple.h>
#include <algorithm>
#include <chrono>
#include <cmath>
#include <cstdio>
#include <cstdlib>
#include <dlfcn.h>
#include <stdexcept>
#include <thread>
#include <vector>

namespace Sexy {
std::string GetExecutableDirectory() { throw std::logic_error("Use explicit test decoder path"); }
}
namespace {
void Require(bool condition, const char* message)
{
    if (!condition) throw std::runtime_error(message);
}
void Word(std::vector<unsigned char>& data, unsigned int value, int bytes)
{
    for (int i = 0; i < bytes; ++i)
        data.push_back(static_cast<unsigned char>(value >> (i * 8)));
}
void Tag(std::vector<unsigned char>& data, const char* text)
{
    data.insert(data.end(), text, text + 4);
}
std::vector<unsigned char> Wave()
{
    std::vector<unsigned char> data;
    constexpr unsigned int samples = 44100 * 2;
    Tag(data, "RIFF"); Word(data, 36 + samples * 2, 4); Tag(data, "WAVE");
    Tag(data, "fmt "); Word(data, 16, 4); Word(data, 1, 2); Word(data, 1, 2);
    Word(data, 44100, 4); Word(data, 88200, 4); Word(data, 2, 2); Word(data, 16, 2);
    Tag(data, "data"); Word(data, samples * 2, 4);
    for (unsigned int i = 0; i < samples; ++i)
        Word(data, static_cast<unsigned int>(static_cast<short>(
            6000 * std::sin(i * 440 * 6.283185307179586 / 44100))), 2);
    return data;
}
}
int main(int argc, char** argv)
{
    if (argc != 2) return 2;
    using namespace Sexy;
    using namespace std::chrono_literals;
    try {
        OpenALDevice device;
        setenv("PVZ_BASS_LIBRARY", argv[1], 1);
        LoadBassDLL();
        const auto currentDevice = reinterpret_cast<unsigned int (*)()>(
            dlsym(gBass->mModule, "BASS_GetDevice"));
        Require(currentDevice && currentDevice() == 0, "BASS must be decoder-only device zero");
        const auto wave = Wave();
        const auto decoder = gBass->BASS_StreamCreateFile(TRUE, wave.data(), 0, wave.size(),
            BASS_STREAM_DECODE | BASS_SAMPLE_LOOP);
        Require(decoder != 0, "Decoder creation failed");
        {
            NativeMusicPlayback voice;
            voice.Initialize(decoder, false);
            NativeMusicPlayback::SetMasterGain(1);
            voice.SetGain(1);
            Require(voice.Seek(0, BASS_POS_BYTE), "Initial stream seek failed");
            voice.Play();
            std::this_thread::sleep_for(100ms);
            Require(voice.State() == BASS_ACTIVE_PLAYING && voice.Position(BASS_POS_BYTE) > 0,
                "OpenAL callback playback did not advance");
            const auto alreadyPlaying = voice.Position(BASS_POS_BYTE);
            voice.Play(false);
            std::this_thread::sleep_for(50ms);
            Require(voice.Position(BASS_POS_BYTE) > alreadyPlaying,
                "Play(false) restarted an already playing callback source");
            voice.Pause();
            std::this_thread::sleep_for(50ms);
            const auto paused = voice.Position(BASS_POS_BYTE);
            std::this_thread::sleep_for(100ms);
            Require(voice.State() == BASS_ACTIVE_PAUSED && voice.Position(BASS_POS_BYTE) == paused,
                "Paused OpenAL stream advanced");
            voice.Resume();
            std::this_thread::sleep_for(100ms);
            Require(voice.Position(BASS_POS_BYTE) > paused, "OpenAL resume did not advance");
            Require(voice.Seek(44100, BASS_POS_BYTE), "Live stream seek failed");
            std::this_thread::sleep_for(50ms);
            Require(voice.Position(BASS_POS_BYTE) >= 44100, "OpenAL seek lost byte origin");
            voice.Check();

            const pa_sample_spec format{PA_SAMPLE_S16LE, 44100, 2};
            int error = 0;
            pa_simple* monitor = pa_simple_new(nullptr, "PVZ OpenAL verification",
                PA_STREAM_RECORD, "@DEFAULT_MONITOR@", "native-output", &format, nullptr, nullptr, &error);
            Require(monitor != nullptr, "Pulse loopback monitor unavailable");
            std::vector<short> captured(44100 * 2);
            Require(pa_simple_read(monitor, captured.data(), captured.size() * sizeof(short), &error) == 0,
                "Pulse loopback read failed");
            int peak = 0;
            for (const auto value : captured)
                peak = std::max(peak, std::abs(static_cast<int>(value)));
            pa_simple_free(monitor);
            Require(peak > 100, "OpenAL output never reached the native sink");
            voice.Stop();
            Require(voice.State() == BASS_ACTIVE_STOPPED, "OpenAL stop failed");
            std::printf("PASS OpenAL callback output peak=%d BASS-device=%u pause/resume/seek/loop\n",
                peak, currentDevice());
        }
        gBass->BASS_StreamFree(decoder);
        for (int iteration = 0; iteration < 64; ++iteration) {
            const auto handle = gBass->BASS_StreamCreateFile(TRUE, wave.data(), 0, wave.size(),
                BASS_STREAM_DECODE | BASS_SAMPLE_LOOP);
            Require(handle != 0, "Lifetime decoder creation failed");
            {
                NativeMusicPlayback voice;
                voice.Initialize(handle, false);
                voice.SetGain(0);
                voice.Play();
                std::this_thread::sleep_for(2ms);
            }
            gBass->BASS_StreamFree(handle);
        }
        device.Close();
        FreeBassDLL();
        std::puts("PASS 64 callback/source/decoder destruction cycles");
    } catch (const std::exception& error) {
        std::fprintf(stderr, "FAIL %s\n", error.what());
        return 1;
    }
}
