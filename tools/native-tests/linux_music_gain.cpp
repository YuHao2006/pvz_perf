#include "sound/BassMusicInterface.h"
#include "sound/BassLoader.h"
#include "platform/audio/openal/OpenALSoundManager.h"
#include <cmath>
#include <cstdarg>
#include <chrono>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <filesystem>
#include <exception>
#include <semaphore>
#include <stdexcept>
#include <string>
#include <thread>
#include <vector>
#include <unistd.h>

// The standalone fixture reports fatal contract violations to its captured stderr.
void TodLog(const char* format, ...)
{
    va_list arguments;
    va_start(arguments, format);
    std::vfprintf(stderr, format, arguments);
    va_end(arguments);
    std::fputc('\n', stderr);
}

namespace {
thread_local ALuint gLastGainSource = 0;
struct LoadInterleave {
    std::binary_semaphore initialized{0};
    std::binary_semaphore proceed{0};
};
thread_local LoadInterleave* gLoadInterleave = nullptr;
int gChecks = 0;
int gFailures = 0;

void Require(bool condition, const char* message)
{
    if (!condition)
        throw std::runtime_error(message);
}

void Word(std::vector<unsigned char>& data, unsigned int value, int bytes)
{
    for (int i = 0; i < bytes; ++i)
        data.push_back(static_cast<unsigned char>(value >> (i * 8)));
}

void Tag(std::vector<unsigned char>& data, const char* tag)
{
    data.insert(data.end(), tag, tag + 4);
}

class WaveFixture {
public:
    std::string mPath;
    explicit WaveFixture(const char* directory)
    {
        std::filesystem::create_directories(directory);
        std::string pattern = (std::filesystem::absolute(directory) /
            "linux-music-gain-XXXXXX.wav").string();
        const int descriptor = mkstemps(pattern.data(), 4);
        Require(descriptor >= 0, "Cannot create WAV fixture in log directory");
        FILE* file = fdopen(descriptor, "wb");
        if (!file) {
            close(descriptor);
            unlink(pattern.c_str());
            throw std::runtime_error("Cannot open WAV fixture");
        }
        // Silent PCM provides a second silence guarantee besides the null driver.
        constexpr unsigned int samples = 44100 * 2;
        std::vector<unsigned char> data;
        Tag(data, "RIFF"); Word(data, 36 + samples * 2, 4); Tag(data, "WAVE");
        Tag(data, "fmt "); Word(data, 16, 4); Word(data, 1, 2); Word(data, 1, 2);
        Word(data, 44100, 4); Word(data, 88200, 4); Word(data, 2, 2); Word(data, 16, 2);
        Tag(data, "data"); Word(data, samples * 2, 4);
        data.resize(data.size() + samples * 2, 0);
        const bool written = fwrite(data.data(), 1, data.size(), file) == data.size();
        const int closed = fclose(file);
        if (!written || closed != 0) {
            unlink(pattern.c_str());
            throw std::runtime_error("Cannot write WAV fixture");
        }
        mPath = std::move(pattern);
    }
    ~WaveFixture() { unlink(mPath.c_str()); }
};

ALuint Load(Sexy::BassMusicInterface& music, int slot, const WaveFixture& fixture)
{
    gLastGainSource = 0;
    Require(music.LoadMusic(slot, fixture.mPath), "Real LoadMusic failed");
    Require(!music.mSlotsPublished.load(), "Load unexpectedly published the table");
    Require(music.mMusicSlots[slot]->mHStream != 0, "WAV did not create a real BASS stream");
    Require(gLastGainSource != 0 && alIsSource(gLastGainSource),
        "LoadMusic did not initialize a real OpenAL source");
    return gLastGainSource;
}

void Gain(int cycle, const char* label, ALuint source, float expected)
{
    float actual = -1;
    alGetSourcef(source, AL_GAIN, &actual);
    Sexy::CheckOpenAL("Actual AL_GAIN query failed");
    const bool passed = std::isfinite(actual) && std::abs(actual - expected) <= 0.00001f;
    ++gChecks;
    if (!passed) ++gFailures;
    std::printf("%s cycle=%d %s source=%u actual=%.6f expected=%.6f\n",
        passed ? "PASS" : "FAIL", cycle, label, source, actual, expected);
}

void Cycle(int cycle, const WaveFixture& fixture)
{
    using namespace Sexy;
    Require(alcGetCurrentContext() == nullptr && gBass == nullptr,
        "Previous cycle leaked an audio context or BASS instance");
    {
        OpenALSoundManager output(nullptr);
        auto* device = alcGetContextsDevice(alcGetCurrentContext());
        Require(alcIsExtensionPresent(device, "ALC_ENUMERATE_ALL_EXT"),
            "Cannot verify the actual null output device");
        const char* name = alcGetString(device, ALC_ALL_DEVICES_SPECIFIER);
        Require(name && std::strcmp(name, "No Output") == 0,
            "Refusing to run without the OpenAL Soft null device");
        std::printf("PASS cycle=%d actual-device=%s\n", cycle, name);
        ALuint mainSource = 0;
        ALuint layerSource = 0;
        {
            BassMusicInterface music(nullptr);
            mainSource = Load(music, 1, fixture);
            auto& slot = *music.mMusicSlots[1];
            music.SetVolume(0);
            // Match Music::PlayFromOffset's direct use of the loaded main slot.
            slot.mVolume = 1;
            slot.mPlayback.SetGain(1);
            slot.mPlayback.Play(false);
            Require(slot.mPlayback.State() == BASS_ACTIVE_PLAYING,
                "Main source did not enter actual OpenAL playback");
            Gain(cycle, "unpublished-start-muted", mainSource, 0);
            music.SetVolume(.85);
            Gain(cycle, "unpublished-focus-restore", mainSource, .85f);

            // Establish a known nonzero source independently of the previous failure.
            slot.mPlayback.SetGain(1);
            Gain(cycle, "unpublished-before-mute", mainSource, .85f);
            music.SetVolume(0);
            Gain(cycle, "unpublished-immediate-mute", mainSource, 0);

            layerSource = Load(music, 2, fixture);
            Require(layerSource != mainSource, "Two loaded songs share a source");
            auto& layer = *music.mMusicSlots[2];
            layer.mVolume = .4;
            layer.mPlayback.SetGain(layer.mVolume);
            layer.mPlayback.Play(false);
            music.PublishSlots();
            Require(music.mSlotsPublished.load() && music.IsMusicLoaded(1) &&
                music.IsMusicLoaded(2), "Slot publication failed");
            music.SetVolume(.85);
            Gain(cycle, "published-main-restore", mainSource, .85f);
            Gain(cycle, "published-layer-restore", layerSource, .34f);
            music.SetVolume(0);
            Gain(cycle, "published-main-mute", mainSource, 0);
            Gain(cycle, "published-layer-mute", layerSource, 0);
            music.SetVolume(.85);
            music.SetSongVolume(2, .25);
            Gain(cycle, "published-song-volume", layerSource, .2125f);
            slot.mPlayback.Check();
            layer.mPlayback.Check();
        }
        Require(!alIsSource(mainSource) && !alIsSource(layerSource),
            "Interface destruction leaked OpenAL sources");
        CheckOpenAL("Source destruction check failed");
        Require(gBass != nullptr, "Output DecoderLease released BASS before closing the mixer");
    }
    Require(alcGetCurrentContext() == nullptr && gBass == nullptr,
        "Output destruction retained its context or decoder lease");
    std::printf("PASS cycle=%d real-load/publish/destruction\n", cycle);
}

void BackgroundLoad(const WaveFixture& fixture)
{
    using namespace Sexy;
    Require(alcGetCurrentContext() == nullptr && gBass == nullptr,
        "Background-load test inherited audio state");
    {
        OpenALSoundManager output(nullptr);
        auto* device = alcGetContextsDevice(alcGetCurrentContext());
        const char* name = alcGetString(device, ALC_ALL_DEVICES_SPECIFIER);
        Require(name && std::strcmp(name, "No Output") == 0,
            "Background-load test requires the null device");
        ALuint mainSource = 0;
        ALuint layerSource = 0;
        {
            BassMusicInterface music(nullptr);
            mainSource = Load(music, 1, fixture);
            auto& main = *music.mMusicSlots[1];
            music.SetVolume(.85);
            main.mVolume = 1;
            main.mPlayback.SetGain(1);
            main.mPlayback.Play(false);
            LoadInterleave gate;
            std::exception_ptr workerError;
            std::exception_ptr mainError;
            std::thread worker([&] {
                try {
                    gLoadInterleave = &gate;
                    layerSource = Load(music, 2, fixture);
                } catch (...) {
                    workerError = std::current_exception();
                }
                gLoadInterleave = nullptr;
            });
            try {
                Require(gate.initialized.try_acquire_for(std::chrono::seconds(5)),
                    "Background source did not reach the initialization gate");
                Require(!music.mMusicSlots[2] && !music.mSlotsPublished.load(),
                    "Background slot was published before initialization finished");
                music.SetVolume(0);
                Gain(4, "background-initialize-main-mute", mainSource, 0);
                music.SetVolume(.85);
                Gain(4, "background-initialize-main-restore", mainSource, .85f);
            } catch (...) {
                mainError = std::current_exception();
            }
            gate.proceed.release();
            worker.join();
            if (workerError) std::rethrow_exception(workerError);
            if (mainError) std::rethrow_exception(mainError);
            Require(!music.mSlotsPublished.load() && layerSource != mainSource,
                "Background load changed full-table publication or reused a live source");
            auto& layer = *music.mMusicSlots[2];
            layer.mVolume = .4;
            layer.mPlayback.SetGain(.4);
            layer.mPlayback.Play(false);
            Gain(4, "background-joined-layer-baseline", layerSource, .34f);
            music.SetVolume(0);
            Gain(4, "background-joined-layer-mute", layerSource, 0);
            music.SetVolume(.85);
            Gain(4, "background-joined-layer-restore", layerSource, .34f);
            main.mPlayback.Check();
            layer.mPlayback.Check();
        }
        Require(!alIsSource(mainSource) && !alIsSource(layerSource),
            "Background-load test leaked music sources");
        CheckOpenAL("Background source destruction check failed");
        Require(gBass != nullptr, "Background output lost its decoder lease before mixer shutdown");
    }
    Require(alcGetCurrentContext() == nullptr && gBass == nullptr,
        "Background output retained its context or decoder lease");
    std::puts("PASS controlled background LoadMusic/SetVolume interleave and destruction");
}
}

extern "C" void AL_APIENTRY __real_alSourcef(ALuint source, ALenum parameter, ALfloat value);
extern "C" void AL_APIENTRY __wrap_alSourcef(ALuint source, ALenum parameter, ALfloat value)
{
    if (parameter == AL_GAIN)
        gLastGainSource = source;
    __real_alSourcef(source, parameter, value);
    // Pause the real background initialization before LoadMusic publishes its slot.
    if (parameter == AL_GAIN && gLoadInterleave) {
        auto* gate = gLoadInterleave;
        gLoadInterleave = nullptr;
        gate->initialized.release();
        gate->proceed.acquire();
    }
}

int main(int argc, char** argv)
{
    setvbuf(stdout, nullptr, _IONBF, 0);
    if (argc != 3) {
        std::fprintf(stderr, "Usage: linux_music_gain /absolute/libbass.so /absolute/log\n");
        return 2;
    }
    try {
        Require(setenv("ALSOFT_DRIVERS", "null", 1) == 0 &&
            setenv("PVZ_BASS_LIBRARY", argv[1], 1) == 0 &&
            setenv("PVZ_LOG_DIR", argv[2], 1) == 0, "Cannot configure silent test environment");
        WaveFixture fixture(argv[2]);
        for (int cycle = 1; cycle <= 3; ++cycle)
            Cycle(cycle, fixture);
        BackgroundLoad(fixture);
        std::printf("AL_GAIN checks=%d failures=%d; lifecycle cycles=3; controlled-interleaves=1; driver=null; PCM=silence\n",
            gChecks, gFailures);
        return gFailures ? 1 : 0;
    } catch (const std::exception& error) {
        std::fprintf(stderr, "ERROR: %s\n", error.what());
        return 2;
    }
}
