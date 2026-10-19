#include "SoundDecode.h"
#include "BassLoader.h"
#include "LegacyAuDecode.h"
#include "paklib/PakInterface.h"
#include <algorithm>
#include <cmath>
#include <limits>
#include <memory>
#include <stdexcept>
#include <string_view>
#include <utility>

namespace Sexy {
namespace {
struct DecodeDevice {
    unsigned int previous = gBass->BASS_GetDevice();
    DecodeDevice()
    {
        if (!gBass->BASS_SetDevice(0))
            throw std::runtime_error("BASS decoder device is not initialized");
    }
    ~DecodeDevice()
    {
        if (previous != ~0U) gBass->BASS_SetDevice(previous);
    }
};
struct Decoder {
    HSTREAM handle;
    ~Decoder() { gBass->BASS_StreamFree(handle); }
};
}

SoundDecoderLease::SoundDecoderLease() { LoadBassDLL(); }
SoundDecoderLease::~SoundDecoderLease() { FreeBassDLL(); }

bool DecodeSound(const std::string& baseName, DecodedSound& output)
{
    static_assert(sizeof(float) == 4 && std::numeric_limits<float>::is_iec559);
    DecodeDevice device;
    for (const char* extension : {".wav", ".ogg", ".au"}) {
        const std::string path = baseName + extension;
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
        if (std::string_view(extension) == ".au")
            encoded = DecodeLegacyAuToWave(encoded);

        // Keep encoded storage alive until the memory-backed decoder closes.
        Decoder decoder{gBass->BASS_StreamCreateFile(TRUE, encoded.data(), 0, encoded.size(),
            BASS_STREAM_DECODE | BASS_SAMPLE_FLOAT)};
        if (!decoder.handle)
            throw std::runtime_error("BASS float sound decode failed: " + path);
        BASS_CHANNELINFO info{};
        if (!gBass->BASS_ChannelGetInfo(decoder.handle, &info) ||
            !(info.flags & BASS_SAMPLE_FLOAT) || !info.freq ||
            info.freq > static_cast<unsigned int>(std::numeric_limits<int>::max()) ||
            (info.chans != 1 && info.chans != 2))
            throw std::runtime_error("Sound requires mono/stereo float PCM: " + path);
        const auto bytes = gBass->BASS_ChannelGetLength(decoder.handle, BASS_POS_BYTE);
        const unsigned int frameBytes = info.chans * sizeof(float);
        if (!bytes || bytes > 0x0fffffffULL || bytes % frameBytes)
            throw std::runtime_error("Invalid decoded sound size: " + path);

        DecodedSound candidate;
        candidate.samples.resize(static_cast<size_t>(bytes / sizeof(float)));
        unsigned int decoded = 0;
        while (decoded < bytes) {
            const auto count = gBass->BASS_ChannelGetData(decoder.handle,
                reinterpret_cast<unsigned char*>(candidate.samples.data()) + decoded,
                static_cast<unsigned int>(bytes - decoded));
            if (!count || count == ~0U || count > bytes - decoded || count % frameBytes)
                throw std::runtime_error("Incomplete float sound decode: " + path);
            decoded += count;
        }
        if (!std::all_of(candidate.samples.begin(), candidate.samples.end(),
                [](float value) { return std::isfinite(value); }))
            throw std::runtime_error("Non-finite float sound sample: " + path);
        candidate.frequency = info.freq;
        candidate.channels = info.chans;
        output = std::move(candidate);
        return true;
    }
    return false;
}
}
