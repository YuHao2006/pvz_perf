#include "platform/windows/audio/DSoundManager.h"
#include "platform/windows/audio/DSoundInstance.h"
#include "paklib/PakInterface.h"
#define NOBASSOVERLOADS
#include "sound/bass.h"
#include "sound/LegacyAuDecode.h"
#include "audio_process_loopback.h"
#include <nlohmann/json.hpp>
#include <psapi.h>
#include <algorithm>
#include <array>
#include <cmath>
#include <filesystem>
#include <fstream>
#include <iostream>
#include <limits>
#include <memory>
#include <numeric>
#include <stdexcept>
#include <vector>

HMODULE gDSoundDLL = nullptr;

namespace {
using Json = nlohmann::json;
using namespace Sexy;
constexpr unsigned int VoiceCount = MAX_CHANNELS;
constexpr std::array Names{
    "sounds/throw", "sounds/splat", "sounds/chomp", "sounds/shieldhit",
    "sounds/kernelpult", "sounds/fume", "sounds/firepea", "sounds/melonimpact",
    "sounds/cherrybomb", "sounds/buttonclick", "sounds/groan", "sounds/groan2",
    "sounds/plant", "sounds/zombie_falling_1", "sounds/gargantuar_thump", "sounds/rain"
};

void Require(bool condition, const char* message)
{
    if (!condition) throw std::runtime_error(message);
}
void Check(HRESULT result, const char* message) { Require(SUCCEEDED(result), message); }
unsigned long long Counter()
{
    LARGE_INTEGER value{};
    Require(QueryPerformanceCounter(&value) != FALSE, "QPC failed");
    return value.QuadPart;
}
unsigned long long Cycles()
{
    unsigned long long value = 0;
    Require(QueryProcessCycleTime(GetCurrentProcess(), &value) != FALSE, "Cycle query failed");
    return value;
}
double CPUSeconds()
{
    FILETIME created{}, exited{}, kernel{}, user{};
    Require(GetProcessTimes(GetCurrentProcess(), &created, &exited, &kernel, &user) != FALSE,
        "CPU time query failed");
    const auto value = [](FILETIME time) {
        return (static_cast<unsigned long long>(time.dwHighDateTime) << 32) | time.dwLowDateTime;
    };
    return (value(kernel) + value(user)) / 10000000.0;
}
unsigned long long PrivateBytes()
{
    PROCESS_MEMORY_COUNTERS_EX memory{};
    Require(GetProcessMemoryInfo(GetCurrentProcess(),
        reinterpret_cast<PROCESS_MEMORY_COUNTERS*>(&memory), sizeof(memory)) != FALSE,
        "Memory query failed");
    return memory.PrivateUsage;
}

struct Window {
    HWND handle = nullptr;
    Window() {
        WNDCLASSW type{};
        type.lpfnWndProc = DefWindowProcW;
        type.hInstance = GetModuleHandleW(nullptr);
        type.lpszClassName = L"pvz_audio_backend_bench";
        Require(RegisterClassW(&type) != 0, "Register audio window failed");
        handle = CreateWindowW(type.lpszClassName, L"", WS_OVERLAPPED, 0, 0, 1, 1,
            nullptr, nullptr, type.hInstance, nullptr);
        Require(handle != nullptr, "Create hidden audio window failed");
    }
    ~Window() { if (handle) DestroyWindow(handle); }
};

struct Bass {
    HMODULE module = nullptr;
#define BASS_FUNCTIONS(X) \
    X(BASS_Init) X(BASS_Free) X(BASS_GetVersion) X(BASS_GetInfo) X(BASS_GetDeviceInfo) \
    X(BASS_SetConfig) X(BASS_GetConfig) X(BASS_ErrorGetCode) \
    X(BASS_SampleCreate) X(BASS_SampleSetData) X(BASS_SampleGetData) \
    X(BASS_SampleGetChannel) X(BASS_SampleFree) \
    X(BASS_ChannelPlay) X(BASS_ChannelStop) X(BASS_ChannelPause) \
    X(BASS_ChannelSetPosition) X(BASS_ChannelGetPosition) X(BASS_ChannelIsActive) \
    X(BASS_ChannelSetAttribute) X(BASS_ChannelFlags) X(BASS_MusicLoad) X(BASS_MusicFree) \
    X(BASS_StreamCreateFile) X(BASS_StreamFree) X(BASS_ChannelGetInfo) \
    X(BASS_ChannelGetLength) X(BASS_ChannelGetData)
#define DECLARE(name) decltype(&::name) name = nullptr;
    BASS_FUNCTIONS(DECLARE)
#undef DECLARE
    Bass(const std::filesystem::path& path, HWND window, unsigned int sampleSrc) {
        auto nativePath = std::filesystem::absolute(path);
        nativePath.make_preferred();
        module = LoadLibraryW(nativePath.c_str());
        Require(module != nullptr, "Cannot load benchmark BASS DLL");
#define LOAD(name) name = reinterpret_cast<decltype(name)>(GetProcAddress(module, #name)); \
        Require(name != nullptr, "Missing " #name);
        BASS_FUNCTIONS(LOAD)
#undef LOAD
#undef BASS_FUNCTIONS
        Require((BASS_GetVersion() >> 16) == BASSVERSION, "Unexpected BASS ABI");
        BASS_DEVICEINFO device{};
        Require(BASS_GetDeviceInfo(1, &device) != FALSE &&
            (device.flags & BASS_DEVICE_DEFAULT), "BASS device 1 is not the default output");
        Ok(BASS_Init(1, 44100, BASS_DEVICE_DSOUND, window, nullptr), "BASS_Init");
        // Match the production music configuration; sample voices have their own global gain.
        Ok(BASS_SetConfig(BASS_CONFIG_BUFFER, 2000), "BASS music buffer");
        Ok(BASS_SetConfig(BASS_CONFIG_GVOL_SAMPLE, 10000), "BASS sample gain");
        Ok(BASS_SetConfig(BASS_CONFIG_SRC_SAMPLE, sampleSrc), "BASS sample resampling");
    }
    void Ok(BASSBOOL value, const char* operation) const {
        if (!value) throw std::runtime_error(std::string(operation) + ": BASS error " +
            std::to_string(BASS_ErrorGetCode()));
    }
    void Handle(unsigned int value, const char* operation) const { Ok(value != 0, operation); }
    ~Bass() {
        if (module) {
            BASS_Free();
            FreeLibrary(module);
        }
    }
};

class SourceManager final : public DSoundManager {
public:
    using DSoundManager::DSoundManager;
    using DSoundManager::mSourceSounds;
    using DSoundManager::mPrimaryBuffer;
};
struct PCM {
    WAVEFORMATEX format{};
    std::vector<unsigned char> bytes;
};
using Fixture = std::array<PCM, Names.size()>;

Fixture ReadFixture(SourceManager& manager)
{
    Fixture result;
    for (unsigned int id = 0; id < Names.size(); ++id) {
        Require(manager.LoadSound(id, Names[id]), "Cannot decode benchmark game sound");
        auto* buffer = manager.mSourceSounds[id];
        auto& sample = result[id];
        Check(buffer->GetFormat(&sample.format, sizeof(sample.format), nullptr), "Source format");
        Require(sample.format.wFormatTag == WAVE_FORMAT_IEEE_FLOAT &&
            sample.format.wBitsPerSample == 32, "Fixture requires float PCM");
        DSBCAPS caps{}; caps.dwSize = sizeof(caps);
        Check(buffer->GetCaps(&caps), "Source caps");
        void* first = nullptr; void* second = nullptr;
        DWORD firstSize = 0, secondSize = 0;
        Check(buffer->Lock(0, caps.dwBufferBytes, &first, &firstSize, &second, &secondSize, 0),
            "Source PCM lock");
        Require(firstSize == caps.dwBufferBytes && secondSize == 0, "Unexpected source split");
        // Keep playback quiet without using mute or a zero-volume fast path.
        auto* values = static_cast<float*>(first);
        for (unsigned int index = 0; index < firstSize / sizeof(float); ++index)
            values[index] /= 8;
        sample.bytes.assign(static_cast<unsigned char*>(first),
            static_cast<unsigned char*>(first) + firstSize);
        Check(buffer->Unlock(first, firstSize, second, secondSize), "Source PCM unlock");
        Require(std::any_of(sample.bytes.begin(), sample.bytes.end(),
            [](unsigned char value) { return value != 0; }), "Silent test sound");
    }
    return result;
}
std::vector<unsigned char> ReadMusic()
{
    std::unique_ptr<PFILE, decltype(&p_fclose)> file(
        p_fopen("sounds/mainmusic.mo3", "rb"), &p_fclose);
    Require(file != nullptr, "Cannot open benchmark game music");
    Require(p_fseek(file.get(), 0, SEEK_END) == 0, "Music seek");
    const int bytes = p_ftell(file.get());
    Require(bytes > 0 && p_fseek(file.get(), 0, SEEK_SET) == 0, "Music size");
    std::vector<unsigned char> result(static_cast<size_t>(bytes));
    Require(p_fread(result.data(), 1, bytes, file.get()) == result.size(), "Music read");
    return result;
}
struct VoiceParameters {
    double volume;
    int pan;
    double steps;
};
VoiceParameters Parameters(unsigned int serial)
{
    return {0.12 + (serial % 4) * 0.04, (static_cast<int>(serial % 5) - 2) * 400,
        static_cast<double>(static_cast<int>(serial % 5) - 2)};
}
void Configure(SoundInstance& voice, VoiceParameters parameters)
{
    voice.SetVolume(parameters.volume);
    voice.SetPan(parameters.pan);
    voice.AdjustPitch(parameters.steps);
}

template<bool Pooled>
class DirectSoundVoices {
    SourceManager& manager;
    std::array<SoundInstance*, VoiceCount> active{};
    std::array<std::array<std::unique_ptr<DSoundInstance>, VoiceCount>, Names.size()> pool{};
public:
    static constexpr bool UsesDirectSound = true;
    DirectSoundVoices(SourceManager& source, Bass&, const Fixture&) : manager(source) {
        if constexpr (Pooled)
            for (unsigned int id = 0; id < Names.size(); ++id)
                for (auto& voice : pool[id])
                    voice = std::make_unique<DSoundInstance>(&manager, manager.mSourceSounds[id]);
    }
    void Stop(unsigned int slot) {
        if (active[slot]) {
            if constexpr (Pooled) active[slot]->Stop();
            else active[slot]->Release();
            active[slot] = nullptr;
        }
    }
    void Start(unsigned int slot, unsigned int id, unsigned int serial) {
        Stop(slot);
        if constexpr (Pooled) {
            active[slot] = pool[id][slot].get();
            active[slot]->SetVolume(1);
            active[slot]->SetBasePan(0);
            active[slot]->SetBaseVolume(1);
        } else {
            active[slot] = manager.GetSoundInstance(id);
        }
        Require(active[slot] != nullptr, "DirectSound voice exhaustion");
        Configure(*active[slot], Parameters(serial));
        Require(active[slot]->Play(true, false), "DirectSound play failed");
    }
    bool Playing(unsigned int slot) { return active[slot] && active[slot]->IsPlaying(); }
    unsigned int Position(unsigned int slot) {
        return static_cast<DSoundInstance*>(active[slot])->GetSoundPosition();
    }
    void Finish() { for (unsigned int slot = 0; slot < VoiceCount; ++slot) Stop(slot); }
    ~DirectSoundVoices() { Finish(); }
};

template<bool Pooled>
class BassVoices {
    Bass& bass;
    std::array<unsigned int, Names.size()> samples{};
    std::array<std::array<unsigned int, VoiceCount>, Names.size()> pool{};
    std::array<unsigned int, VoiceCount> active{};
    std::array<unsigned int, Names.size()> frequencies{};
public:
    static constexpr bool UsesDirectSound = false;
    BassVoices(SourceManager&, Bass& api, const Fixture& fixture) : bass(api) {
        for (unsigned int id = 0; id < Names.size(); ++id) {
            const auto& pcm = fixture[id];
            frequencies[id] = pcm.format.nSamplesPerSec;
            samples[id] = bass.BASS_SampleCreate(static_cast<DWORD>(pcm.bytes.size()),
                frequencies[id], pcm.format.nChannels, VoiceCount, BASS_SAMPLE_FLOAT);
            bass.Handle(samples[id], "BASS sample create");
            bass.Ok(bass.BASS_SampleSetData(samples[id], pcm.bytes.data()), "BASS sample upload");
            std::vector<unsigned char> returned(pcm.bytes.size());
            bass.Ok(bass.BASS_SampleGetData(samples[id], returned.data()), "BASS sample readback");
            Require(returned == pcm.bytes, "BASS PCM differs from DirectSound PCM");
            if constexpr (Pooled)
                for (auto& channel : pool[id]) {
                    channel = bass.BASS_SampleGetChannel(samples[id], BASS_SAMCHAN_NEW);
                    bass.Handle(channel, "BASS preallocated channel");
                }
        }
    }
    void Stop(unsigned int slot) {
        if (!active[slot]) return;
        if constexpr (Pooled) {
            bass.Ok(bass.BASS_ChannelPause(active[slot]), "BASS pooled pause");
            bass.Ok(bass.BASS_ChannelSetPosition(active[slot], 0, BASS_POS_BYTE), "BASS pooled rewind");
        } else {
            bass.Ok(bass.BASS_ChannelStop(active[slot]), "BASS sample stop");
        }
        active[slot] = 0;
    }
    void Start(unsigned int slot, unsigned int id, unsigned int serial) {
        Stop(slot);
        unsigned int channel;
        if constexpr (Pooled) channel = pool[id][slot];
        else channel = bass.BASS_SampleGetChannel(samples[id], BASS_SAMCHAN_NEW);
        bass.Handle(channel, "BASS channel acquire");
        const auto parameters = Parameters(serial);
        const int db = static_cast<int>((std::log10(1 + parameters.volume * 9) - 1) * 2333);
        const float volume = db < -2000 ? 0.0f : static_cast<float>(std::pow(10.0, db / 2000.0));
        const float pan = static_cast<float>(std::copysign(
            1 - std::pow(10.0, -std::abs(parameters.pan) / 2000.0), parameters.pan));
        const auto frequency = static_cast<DWORD>(std::clamp(
            frequencies[id] * std::pow(1.05946309435929526456, parameters.steps),
            static_cast<double>(DSBFREQUENCY_MIN), static_cast<double>(DSBFREQUENCY_MAX)));
        bass.Ok(bass.BASS_ChannelSetAttribute(channel, BASS_ATTRIB_VOL, volume), "BASS volume");
        bass.Ok(bass.BASS_ChannelSetAttribute(channel, BASS_ATTRIB_PAN, pan), "BASS pan");
        bass.Ok(bass.BASS_ChannelSetAttribute(channel, BASS_ATTRIB_FREQ,
            static_cast<float>(frequency)), "BASS pitch");
        Require(bass.BASS_ChannelFlags(channel, BASS_SAMPLE_LOOP, BASS_SAMPLE_LOOP) != ~0U,
            "BASS loop flag failed");
        bass.Ok(bass.BASS_ChannelPlay(channel, TRUE), "BASS play");
        active[slot] = channel;
    }
    bool Playing(unsigned int slot) {
        return active[slot] && bass.BASS_ChannelIsActive(active[slot]) == BASS_ACTIVE_PLAYING;
    }
    unsigned int Position(unsigned int slot) {
        const auto position = bass.BASS_ChannelGetPosition(active[slot], BASS_POS_BYTE);
        Require(position != ~0ULL, "BASS position query failed");
        return static_cast<unsigned int>(position);
    }
    void Finish() { for (unsigned int slot = 0; slot < VoiceCount; ++slot) Stop(slot); }
    ~BassVoices() {
        Finish();
        for (const auto sample : samples) if (sample) bass.BASS_SampleFree(sample);
    }
};

struct Options {
    std::string backend;
    std::filesystem::path pak, dll, trace;
    unsigned int voices = 0, starts = 0, seconds = 6, warmup = 2, sampleSrc = 0;
    bool outputCheck = false, floatCheck = false;
};


Json CheckFloatUploads(SourceManager& manager, Bass& bass)
{
    unsigned int files = 0, overrangeFiles = 0;
    unsigned long long samples = 0, overrangeSamples = 0, fractionalSamples = 0;
    float peak = 0;
    const auto checkUpload = [&](const std::string& name, const void* expected,
            size_t bytes, unsigned int frequency, unsigned int channels) {
        Require(manager.LoadSound(0, name), "Float sound load failed");
        auto* buffer = manager.mSourceSounds[0];
        WAVEFORMATEX format{};
        Check(buffer->GetFormat(&format, sizeof(format), nullptr), "Float sound format");
        Require(format.wFormatTag == WAVE_FORMAT_IEEE_FLOAT && format.wBitsPerSample == 32 &&
            format.nSamplesPerSec == frequency && format.nChannels == channels &&
            format.nBlockAlign == channels * sizeof(float), "Float upload format mismatch");
        DSBCAPS caps{}; caps.dwSize = sizeof(caps);
        Check(buffer->GetCaps(&caps), "Float upload size");
        Require(caps.dwBufferBytes == bytes, "Float upload length mismatch");
        void* storage = nullptr; DWORD length = 0;
        Check(buffer->Lock(0, caps.dwBufferBytes, &storage, &length, nullptr, nullptr, 0),
            "Float upload readback");
        const bool equal = length == bytes && std::memcmp(storage, expected, bytes) == 0;
        Check(buffer->Unlock(storage, length, nullptr, 0), "Float upload release");
        Require(equal, "Float sound samples changed during decode/upload");
    };
    for (const auto& [key, entry] : gPakInterface->mPakRecordMap) {
        const std::string name = entry.mFileName;
        const auto dot = name.find_last_of('.');
        if (dot == std::string::npos) continue;
        std::string extension = name.substr(dot);
        std::transform(extension.begin(), extension.end(), extension.begin(),
            [](unsigned char value) { return static_cast<char>(std::tolower(value)); });
        if (extension != ".ogg" && extension != ".au" && extension != ".wav") continue;
        if (key.find("ZOMBIESONYOURLAWN") != std::string::npos) continue;
        std::unique_ptr<PFILE, decltype(&p_fclose)> file(p_fopen(name.c_str(), "rb"), &p_fclose);
        Require(file && p_fseek(file.get(), 0, SEEK_END) == 0, "Encoded float fixture read");
        const int size = p_ftell(file.get());
        Require(size > 0 && p_fseek(file.get(), 0, SEEK_SET) == 0, "Encoded float fixture size");
        std::vector<unsigned char> encoded(static_cast<size_t>(size));
        Require(p_fread(encoded.data(), 1, size, file.get()) == encoded.size(),
            "Encoded float fixture truncated");
        file.reset();
        if (extension == ".au") encoded = DecodeLegacyAuToWave(encoded);
        const auto stream = bass.BASS_StreamCreateFile(TRUE, encoded.data(), 0, encoded.size(),
            BASS_STREAM_DECODE | BASS_SAMPLE_FLOAT);
        bass.Handle(stream, "Independent float decode");
        BASS_CHANNELINFO info{};
        bass.Ok(bass.BASS_ChannelGetInfo(stream, &info), "Independent float format");
        Require((info.flags & BASS_SAMPLE_FLOAT) != 0, "BASS returned integer PCM");
        const auto bytes = bass.BASS_ChannelGetLength(stream, BASS_POS_BYTE);
        Require(bytes && bytes <= 0x0fffffffULL && bytes % (info.chans * sizeof(float)) == 0,
            "Independent float length");
        std::vector<float> decoded(static_cast<size_t>(bytes / sizeof(float)));
        size_t offset = 0;
        while (offset < bytes) {
            const auto count = bass.BASS_ChannelGetData(stream,
                reinterpret_cast<unsigned char*>(decoded.data()) + offset,
                static_cast<DWORD>(bytes - offset));
            Require(count && count != ~0U && count <= bytes - offset, "Incomplete float fixture");
            offset += count;
        }
        bass.Ok(bass.BASS_StreamFree(stream), "Independent float release");
        checkUpload(name.substr(0, dot), decoded.data(), static_cast<size_t>(bytes),
            info.freq, info.chans);
        bool overrange = false;
        for (const float value : decoded) {
            Require(std::isfinite(value), "Non-finite float sample");
            peak = std::max(peak, std::abs(value));
            if (std::abs(value) > 1) { ++overrangeSamples; overrange = true; }
            if (std::trunc(static_cast<double>(value) * 32768) !=
                    static_cast<double>(value) * 32768)
                ++fractionalSamples;
        }
        ++files;
        overrangeFiles += overrange;
        samples += decoded.size();
    }
    Require(files != 0 && fractionalSamples != 0, "Packaged float corpus was not covered");

    // PCM16 cannot represent these peaks or retain the sub-LSB samples.
    constexpr std::array<float, 8> extremes{-2.0f, -1.5f, -0.000001f, 0,
        0.000001f, 0.5f, 1.5f, 2.0f};
    std::array<unsigned char, 44 + sizeof(extremes)> wave{};
    const auto word = [&](size_t offset, unsigned int value, unsigned int count) {
        for (unsigned int byte = 0; byte < count; ++byte)
            wave[offset + byte] = static_cast<unsigned char>(value >> (byte * 8));
    };
    std::memcpy(wave.data(), "RIFF", 4); word(4, wave.size() - 8, 4);
    std::memcpy(wave.data() + 8, "WAVEfmt ", 8); word(16, 16, 4);
    word(20, WAVE_FORMAT_IEEE_FLOAT, 2); word(22, 2, 2); word(24, 48000, 4);
    word(28, 48000 * 8, 4); word(32, 8, 2); word(34, 32, 2);
    std::memcpy(wave.data() + 36, "data", 4); word(40, sizeof(extremes), 4);
    std::memcpy(wave.data() + 44, extremes.data(), sizeof(extremes));
    struct TemporaryWave {
        std::filesystem::path path;
        ~TemporaryWave() { std::error_code error; std::filesystem::remove(path, error); }
    } temporary{std::filesystem::temp_directory_path() /
        ("pvz-float-" + std::to_string(GetCurrentProcessId()) + ".wav")};
    {
        std::ofstream file(temporary.path, std::ios::binary);
        file.write(reinterpret_cast<const char*>(wave.data()), wave.size());
        Require(file.good(), "Cannot create float boundary fixture");
    }
    auto base = temporary.path; base.replace_extension();
    checkUpload(base.string(), extremes.data(), sizeof(extremes), 48000, 2);
    return {{"phase", "float-upload-result"}, {"files", files}, {"samples", samples},
        {"different_upload_bytes", 0}, {"fractional_pcm16_samples", fractionalSamples},
        {"overrange_files", overrangeFiles}, {"overrange_samples", overrangeSamples},
        {"peak", peak}, {"synthetic_overrange_preserved", true}};
}

Json ComparePCM(const std::vector<float>& left, const std::vector<float>& right,
    unsigned int rate)
{
    const auto onset = [](const std::vector<float>& values) {
        float peak = 0;
        for (const auto value : values) peak = std::max(peak, std::abs(value));
        // Locate the signal, not a preceding mixer tail. Comparison below keeps raw samples.
        const float threshold = peak / 64;
        for (size_t frame = 0; frame < values.size() / 2; ++frame)
            if (std::abs(values[frame * 2]) > threshold ||
                std::abs(values[frame * 2 + 1]) > threshold)
                return frame;
        throw std::runtime_error("Captured output is silent");
    };
    const auto startLeft = onset(left), startRight = onset(right);
    Require(startLeft >= 128 && startRight >= 128, "Capture has no leading silence");
    int bestLag = 0;
    double bestError = std::numeric_limits<double>::infinity();
    for (int lag = -64; lag <= 64; ++lag) {
        const auto other = static_cast<size_t>(static_cast<long long>(startRight) + lag);
        double error = 0;
        for (size_t index = 0; index < 4096; ++index) {
            const double difference = left[startLeft * 2 + index] - right[other * 2 + index];
            error += difference * difference;
        }
        if (error < bestError) { bestError = error; bestLag = lag; }
    }
    const size_t a = startLeft - 128;
    const size_t b = static_cast<size_t>(static_cast<long long>(startRight) + bestLag) - 128;
    const size_t frames = rate / 2 + 128;
    Require((a + frames) * 2 <= left.size() && (b + frames) * 2 <= right.size(),
        "Captured waveform is too short");
    size_t differences = 0, first = frames * 2;
    double squared = 0, maximum = 0, bodySquared = 0, bodyMaximum = 0;
    for (size_t index = 0; index < frames * 2; ++index) {
        const float x = left[a * 2 + index], y = right[b * 2 + index];
        Require(std::isfinite(x) && std::isfinite(y), "Non-finite captured sample");
        const double delta = std::abs(static_cast<double>(x) - y);
        if (x != y) {
            if (first == frames * 2) first = index;
            ++differences;
        }
        maximum = std::max(maximum, delta);
        squared += delta * delta;
        if (index >= 2048) {
            bodySquared += delta * delta;
            bodyMaximum = std::max(bodyMaximum, delta);
        }
    }
    Json result{{"compared_float_samples", frames * 2}, {"different_samples", differences},
        {"rmse", std::sqrt(squared / (frames * 2))}, {"max_abs_error", maximum},
        {"after_1024_frames_rmse", std::sqrt(bodySquared / (frames * 2 - 2048))},
        {"after_1024_frames_max_error", bodyMaximum},
        {"integer_frame_shift", static_cast<long long>(b) - static_cast<long long>(a)},
        {"reference_onset", startLeft}, {"candidate_onset", startRight}};
    if (differences) {
        result["first_difference_frame"] = first / 2;
        result["reference_value"] = left[a * 2 + first];
        result["candidate_value"] = right[b * 2 + first];
    }
    return result;
}

Json CompareOutput(SourceManager& manager, Bass& bass, Fixture& fixture)
{
    BASS_INFO info{};
    bass.Ok(bass.BASS_GetInfo(&info), "Output rate");
    // A native-rate, unity-gain control separates capture timing from SRC/gain differences.
    manager.ReleaseSound(0);
    auto& synthetic = fixture[0];
    synthetic.format = {};
    auto& format = synthetic.format;
    format.wFormatTag = WAVE_FORMAT_PCM;
    format.nSamplesPerSec = info.freq;
    format.nChannels = 2;
    format.wBitsPerSample = 16;
    format.nBlockAlign = 4;
    format.nAvgBytesPerSec = format.nSamplesPerSec * format.nBlockAlign;
    synthetic.bytes.resize(4096 * format.nBlockAlign);
    unsigned int random = 0x56781234;
    for (size_t index = 0; index < synthetic.bytes.size() / 2; ++index) {
        random = random * 1664525U + 1013904223U;
        const short value = static_cast<short>(static_cast<int>(random >> 20) - 2048);
        std::memcpy(synthetic.bytes.data() + index * 2, &value, 2);
    }
    DSBUFFERDESC desc{};
    desc.dwSize = sizeof(desc);
    desc.dwFlags = DSBCAPS_CTRLPAN | DSBCAPS_CTRLVOLUME | DSBCAPS_STATIC |
        DSBCAPS_LOCSOFTWARE | DSBCAPS_GLOBALFOCUS | DSBCAPS_CTRLFREQUENCY;
    desc.dwBufferBytes = static_cast<DWORD>(synthetic.bytes.size());
    desc.lpwfxFormat = &format;
    Check(manager.mDirectSound->CreateSoundBuffer(&desc, &manager.mSourceSounds[0], nullptr),
        "Native rate reference buffer");
    void* storage = nullptr; DWORD length = 0;
    Check(manager.mSourceSounds[0]->Lock(0, desc.dwBufferBytes, &storage, &length, nullptr, nullptr, 0),
        "Native reference write");
    Require(length == synthetic.bytes.size(), "Native reference size");
    std::memcpy(storage, synthetic.bytes.data(), length);
    Check(manager.mSourceSounds[0]->Unlock(storage, length, nullptr, 0), "Native reference unlock");

    const auto record = [&](unsigned int id, bool useBass, double volume, int pan, double steps) {
        const auto& pcm = fixture[id];
        const auto rate = static_cast<DWORD>(pcm.format.nSamplesPerSec *
            std::pow(1.05946309435929526456, steps));
        unsigned int sample = 0, channel = 0;
        SoundInstance* direct = nullptr;
        if (useBass) {
            sample = bass.BASS_SampleCreate(static_cast<DWORD>(pcm.bytes.size()),
                pcm.format.nSamplesPerSec, pcm.format.nChannels, 1,
                pcm.format.wFormatTag == WAVE_FORMAT_IEEE_FLOAT ? BASS_SAMPLE_FLOAT : 0);
            bass.Handle(sample, "Output test sample");
            bass.Ok(bass.BASS_SampleSetData(sample, pcm.bytes.data()), "Output PCM upload");
            channel = bass.BASS_SampleGetChannel(sample, BASS_SAMCHAN_NEW);
            bass.Handle(channel, "Output test channel");
            const int db = static_cast<int>((std::log10(1 + volume * 9) - 1) * 2333);
            bass.Ok(bass.BASS_ChannelSetAttribute(channel, BASS_ATTRIB_VOL,
                db < -2000 ? 0.0f : static_cast<float>(std::pow(10.0, db / 2000.0))), "Output gain");
            bass.Ok(bass.BASS_ChannelSetAttribute(channel, BASS_ATTRIB_PAN,
                static_cast<float>(std::copysign(1 - std::pow(10.0, -std::abs(pan) / 2000.0), pan))),
                "Output pan");
            bass.Ok(bass.BASS_ChannelSetAttribute(channel, BASS_ATTRIB_FREQ,
                static_cast<float>(rate)), "Output rate");
            Require(bass.BASS_ChannelFlags(channel, BASS_SAMPLE_LOOP, BASS_SAMPLE_LOOP) != ~0U,
                "Output loop flag");
        } else {
            direct = manager.GetSoundInstance(id);
            Require(direct != nullptr, "Reference output channel");
            direct->SetVolume(volume); direct->SetPan(pan); direct->AdjustPitch(steps);
        }
        AudioOutputTest::Capture capture;
        Require(capture.rate == info.freq, "Capture would introduce a different sample rate");
        capture.Pump(180);
        if (useBass) bass.Ok(bass.BASS_ChannelPlay(channel, TRUE), "Output playback");
        else Require(direct->Play(true, false), "Reference playback");
        capture.Pump(800);
        if (useBass) {
            bass.Ok(bass.BASS_ChannelStop(channel), "Output stop");
            bass.Ok(bass.BASS_SampleFree(sample), "Output sample free");
        } else direct->Release();
        capture.Pump(100);
        return std::move(capture.samples);
    };
    Json tests = Json::array();
    WAVEFORMATEXTENSIBLE primary{};
    Check(manager.mPrimaryBuffer->GetFormat(&primary.Format, sizeof(primary), nullptr),
        "DirectSound primary format");
    const auto checkCase = [&](unsigned int id, const char* name,
        double volume, int pan, double steps) {
        const auto first = record(id, false, volume, pan, steps);
        const auto repeat = record(id, false, volume, pan, steps);
        const auto candidate = record(id, true, volume, pan, steps);
        Json result{{"case", name}, {"rate", info.freq},
            {"directsound_primary_rate", primary.Format.nSamplesPerSec},
            {"bass_sample_src", bass.BASS_GetConfig(BASS_CONFIG_SRC_SAMPLE)},
            {"reference_repeat", ComparePCM(first, repeat, info.freq)},
            {"bass_compare", ComparePCM(first, candidate, info.freq)}};
        const bool repeatable = result["reference_repeat"]["different_samples"] == 0;
        const bool same = result["bass_compare"]["different_samples"] == 0;
        result["status"] = !repeatable ? "reference-not-repeatable" :
            (same ? "equal" : "not-equal");
        tests.push_back(result);
        return repeatable && same;
    };
    if (!checkCase(0, "native-rate-unity-stereo", 1, 0, 0))
        return {{"phase", "output-result"}, {"equivalent", false}, {"tests", tests}};
    fixture = ReadFixture(manager);
    if (!checkCase(0, "game-throw-unity", 1, 0, 0) ||
        !checkCase(2, "game-chomp-gain", 0.2, 0, 0) ||
        !checkCase(10, "game-groan-pitch-pan", 0.2, 800, 2))
        return {{"phase", "output-result"}, {"equivalent", false}, {"tests", tests}};
    return {{"phase", "output-result"}, {"equivalent", true}, {"tests", tests}};
}
struct Tick {
    unsigned int tick, active, starts;
    double elapsed, calls, trigger, late;
};
struct Timer {
    HANDLE handle = CreateWaitableTimerExW(nullptr, nullptr,
        CREATE_WAITABLE_TIMER_HIGH_RESOLUTION, TIMER_MODIFY_STATE | SYNCHRONIZE);
    Timer() { Require(handle != nullptr, "High resolution timer unavailable"); }
    ~Timer() { CloseHandle(handle); }
    void Until(unsigned long long deadline, unsigned long long frequency) {
        const auto now = Counter();
        if (now >= deadline) return;
        LARGE_INTEGER due{};
        due.QuadPart = -static_cast<long long>(
            ((deadline - now) * 10000000ULL + frequency - 1) / frequency);
        Require(SetWaitableTimer(handle, &due, 0, nullptr, nullptr, FALSE) != FALSE, "Timer arm");
        Require(WaitForSingleObject(handle, INFINITE) == WAIT_OBJECT_0, "Timer wait");
    }
};
double Percentile(std::vector<double> values, double fraction)
{
    if (values.empty()) return 0;
    std::sort(values.begin(), values.end());
    return values[static_cast<size_t>((values.size() - 1) * fraction)];
}
template<class Voices>
Json Measure(const Options& options, std::unique_ptr<SourceManager>& manager, Bass& bass,
    Fixture& fixture, unsigned int music)
{
    LARGE_INTEGER clock{};
    Require(QueryPerformanceFrequency(&clock) != FALSE, "QPC frequency");
    const auto frequency = static_cast<unsigned long long>(clock.QuadPart);
    Voices voices(*manager, bass, fixture);
    if constexpr (!Voices::UsesDirectSound) manager.reset();
    Json samples = Json::array();
    for (unsigned int id = 0; id < fixture.size(); ++id) {
        samples.push_back({{"name", Names[id]}, {"bytes", fixture[id].bytes.size()},
            {"rate", fixture[id].format.nSamplesPerSec}, {"channels", fixture[id].format.nChannels}});
        std::vector<unsigned char>().swap(fixture[id].bytes);
    }
    unsigned int serial = 0;
    for (unsigned int slot = 0; slot < options.voices; ++slot)
        voices.Start(slot, slot % Names.size(), serial++);
    Timer timer;
    // Force a stop/restart before timing: a stale BASS sample handle must fail here.
    voices.Finish();
    for (unsigned int slot = 0; slot < options.voices; ++slot)
        voices.Start(slot, slot % Names.size(), serial++);
    unsigned int advanced = 0;
    const auto timedSerial = serial;
    unsigned int warmTriggers = 0;
    bass.Ok(bass.BASS_ChannelPlay(music, TRUE), "Aligned music restart");
    auto next = Counter();
    for (unsigned int tick = 0; tick < options.warmup * 100; ++tick) {
        for (unsigned int slot = 0; slot < options.voices; ++slot) {
            Require(voices.Playing(slot), "Warmup lost a voice");
            if (voices.Position(slot)) ++advanced;
        }
        if (options.starts &&
            (tick * options.starts / 100 != (tick + 1) * options.starts / 100)) {
            voices.Start(warmTriggers++ % options.voices, (serial / 3) % Names.size(), serial);
            ++serial;
        }
        next += frequency / 100;
        timer.Until(next, frequency);
    }
    Require(!options.voices || advanced != 0, "Playback cursors did not advance");
    serial = timedSerial;
    std::vector<Tick> trace;
    trace.reserve(options.seconds * 100);
    const auto privateBytes = PrivateBytes();
    const auto begin = Counter();
    std::cout << Json({{"phase", "measure"}, {"qpc", begin}, {"frequency", frequency}}).dump()
        << std::endl;
    const auto cpuBegin = CPUSeconds();
    const auto cyclesBegin = Cycles();
    next = begin;
    unsigned int triggerCount = 0;
    for (unsigned int tick = 0; tick < options.seconds * 100; ++tick) {
        const auto started = Counter();
        unsigned int playing = 0;
        for (unsigned int slot = 0; slot < options.voices; ++slot)
            playing += voices.Playing(slot);
        Require(playing == options.voices, "Measured interval lost a voice");
        const bool trigger = options.starts &&
            (tick * options.starts / 100 != (tick + 1) * options.starts / 100);
        double triggerTime = 0;
        if (trigger) {
            const auto before = Counter();
            voices.Start(triggerCount % options.voices,
                (serial / 3) % Names.size(), serial);
            ++serial;
            ++triggerCount;
            triggerTime = (Counter() - before) * 1000000.0 / frequency;
        }
        if (tick % 100 == 0) {
            Require(bass.BASS_ChannelIsActive(music) == BASS_ACTIVE_PLAYING, "Music stopped");
            if (options.voices) {
                Require(voices.Position(tick % options.voices) != ~0U, "Voice cursor failed");
            }
        }
        const auto finished = Counter();
        trace.push_back({tick, playing, trigger ? 1U : 0U,
            (started - begin) / static_cast<double>(frequency),
            (finished - started) * 1000000.0 / frequency, triggerTime,
            (started > next ? started - next : 0ULL) * 1000000.0 / frequency});
        next = begin + (static_cast<unsigned long long>(tick) + 1) * frequency / 100;
        timer.Until(next, frequency);
    }
    const auto cycles = Cycles() - cyclesBegin;
    const double cpu = CPUSeconds() - cpuBegin;
    const auto end = Counter();
    const double elapsed = (end - begin) / static_cast<double>(frequency);
    voices.Finish();
    for (unsigned int slot = 0; slot < options.voices; ++slot)
        Require(!voices.Playing(slot), "Stopped voice remained playing");
    std::vector<double> costs, triggers, lateness;
    for (const auto& item : trace) {
        costs.push_back(item.calls);
        lateness.push_back(item.late);
        if (item.starts) triggers.push_back(item.trigger);
    }
    std::ofstream output(options.trace);
    Require(output.good(), "Cannot create timing trace");
    output << "tick,elapsed_s,active_voices,starts,api_us,trigger_us,late_us\n";
    for (const auto& item : trace)
        output << item.tick << ',' << item.elapsed << ',' << item.active << ',' << item.starts
            << ',' << item.calls << ',' << item.trigger << ',' << item.late << '\n';
    SYSTEM_POWER_STATUS power{};
    Require(GetSystemPowerStatus(&power) != FALSE, "Power status query");
    BASS_INFO info{};
    bass.Ok(bass.BASS_GetInfo(&info), "BASS info");
    BASS_DEVICEINFO device{};
    bass.Ok(bass.BASS_GetDeviceInfo(1, &device), "BASS device");
    return {
        {"backend", options.backend}, {"voices", options.voices}, {"starts_per_second", options.starts},
        {"seconds", elapsed}, {"ticks", trace.size()}, {"triggers", triggerCount},
        {"cpu_seconds", cpu}, {"cpu_percent_one_core", cpu * 100 / elapsed},
        {"cpu_ms_per_tick", cpu * 1000 / trace.size()}, {"cycles", cycles},
        {"cycles_per_tick", static_cast<double>(cycles) / trace.size()},
        {"api_us_mean", std::accumulate(costs.begin(), costs.end(), 0.0) / costs.size()},
        {"api_us_p90", Percentile(costs, 0.90)}, {"api_us_p99", Percentile(costs, 0.99)},
        {"trigger_us_p50", Percentile(triggers, 0.50)}, {"trigger_us_p90", Percentile(triggers, 0.90)},
        {"trigger_us_mean", triggers.empty() ? 0.0 :
            std::accumulate(triggers.begin(), triggers.end(), 0.0) / triggers.size()},
        {"late_us_p99", Percentile(lateness, 0.99)}, {"private_bytes", privateBytes},
        {"ac_line_status", power.ACLineStatus}, {"affinity", 0x4000},
        {"frequency_label", "unverified"}, {"bass_version", bass.BASS_GetVersion()},
        {"bass_init_flags", info.initflags}, {"output_hz", info.freq},
        {"music_buffer_ms", bass.BASS_GetConfig(BASS_CONFIG_BUFFER)},
        {"sample_src", bass.BASS_GetConfig(BASS_CONFIG_SRC_SAMPLE)},
        {"volume_curve", bass.BASS_GetConfig(BASS_CONFIG_CURVE_VOL)},
        {"pan_curve", bass.BASS_GetConfig(BASS_CONFIG_CURVE_PAN)},
        {"device", device.name}, {"pcm_attenuation", 8}, {"samples", samples},
        {"measure_begin_qpc", begin}, {"measure_end_qpc", end}, {"qpc_frequency", frequency}
    };
}
}

int main(int argc, char** argv)
{
    try {
        Require(SetProcessAffinityMask(GetCurrentProcess(), 0x4000) != FALSE, "Cannot bind LP14");
        Options options;
        for (int index = 1; index < argc; index += 2) {
            Require(index + 1 < argc, "Missing benchmark argument");
            const std::string key = argv[index], value = argv[index + 1];
            if (key == "--backend") options.backend = value;
            else if (key == "--pak") options.pak = value;
            else if (key == "--bass") options.dll = value;
            else if (key == "--trace") options.trace = value;
            else if (key == "--voices") options.voices = std::stoul(value);
            else if (key == "--starts") options.starts = std::stoul(value);
            else if (key == "--seconds") options.seconds = std::stoul(value);
            else if (key == "--warmup") options.warmup = std::stoul(value);
            else if (key == "--sample-src") options.sampleSrc = std::stoul(value);
            else if (key == "--output-check") options.outputCheck = value == "yes";
            else if (key == "--float-check") options.floatCheck = value == "yes";
            else throw std::runtime_error("Unknown benchmark argument");
        }
        Require(options.voices <= VoiceCount && (!options.starts || options.voices) &&
            options.starts <= 100 && options.seconds > 0 && options.warmup > 0 && options.sampleSrc <= 4,
            "Invalid benchmark workload");
        struct Apartment {
            bool active;
            explicit Apartment(bool enabled) : active(enabled) {
                if (active)
                    AudioOutputTest::Check(CoInitializeEx(nullptr, COINIT_MULTITHREADED),
                        "Comparison COM apartment");
            }
            ~Apartment() { if (active) CoUninitialize(); }
        } apartment(options.outputCheck);
        Require(gPakInterface->AddPakFile(options.pak.string()), "Cannot open source main.pak64");
        Require(_wputenv_s(L"PVZ_BASS_DLL",
            std::filesystem::absolute(options.dll).c_str()) == 0, "BASS test path");
        gDSoundDLL = LoadLibraryW(L"dsound.dll");
        Require(gDSoundDLL != nullptr, "Cannot load DirectSound");
        Window window;
        auto manager = std::make_unique<SourceManager>(window.handle);
        Require(manager->mInitialized, "DirectSound output initialization failed");
        if (options.floatCheck)
            Require(manager->LoadSound(0, Names[0]), "Decode before BASS output initialization");
        Bass bass(options.dll, window.handle, options.sampleSrc);
        if (options.floatCheck) {
            const auto result = CheckFloatUploads(*manager, bass);
            std::cout << result.dump() << std::endl;
            manager.reset();
            FreeLibrary(gDSoundDLL);
            gDSoundDLL = nullptr;
            return 0;
        }
        auto fixture = ReadFixture(*manager);
        if (options.outputCheck) {
            const auto result = CompareOutput(*manager, bass, fixture);
            std::cout << result.dump() << std::endl;
            manager.reset();
            FreeLibrary(gDSoundDLL);
            gDSoundDLL = nullptr;
            return result["equivalent"].get<bool>() ? 0 : 2;
        }
        const auto encodedMusic = ReadMusic();
        const auto music = bass.BASS_MusicLoad(TRUE, encodedMusic.data(), 0,
            static_cast<DWORD>(encodedMusic.size()), BASS_MUSIC_LOOP | BASS_MUSIC_RAMP, 0);
        bass.Handle(music, "Game music load");
        bass.Ok(bass.BASS_ChannelSetAttribute(music, BASS_ATTRIB_VOL, 0.025f), "Music gain");
        bass.Ok(bass.BASS_ChannelPlay(music, TRUE), "Music play");
        Json result;
        if (options.backend == "dsound")
            result = Measure<DirectSoundVoices<false>>(options, manager, bass, fixture, music);
        else if (options.backend == "dsound-pool")
            result = Measure<DirectSoundVoices<true>>(options, manager, bass, fixture, music);
        else if (options.backend == "bass")
            result = Measure<BassVoices<false>>(options, manager, bass, fixture, music);
        else if (options.backend == "bass-pool")
            result = Measure<BassVoices<true>>(options, manager, bass, fixture, music);
        else throw std::runtime_error("Unknown benchmark backend");
        bass.Ok(bass.BASS_MusicFree(music), "Music free");
        result["phase"] = "result";
        std::cout << result.dump() << std::endl;
        manager.reset();
        FreeLibrary(gDSoundDLL);
        gDSoundDLL = nullptr;
        return 0;
    } catch (const std::exception& error) {
        std::cerr << error.what() << '\n';
        return 1;
    }
}
