#include "WebOggDecoder.h"
#define STB_VORBIS_HEADER_ONLY
#include "stb_vorbis.c"
#include <limits>
#include <stdexcept>
#include <string>

namespace Sexy {
void DecodeWebOggFrames(std::span<const unsigned char> bytes,
    const std::function<void(int, int, int)>& begin,
    const std::function<void(int, int, std::span<const float>)>& write)
{
    if (bytes.size() > std::numeric_limits<int>::max())
        throw std::runtime_error("OGG file is too large");
    int error = 0;
    auto* decoder = stb_vorbis_open_memory(bytes.data(), static_cast<int>(bytes.size()), &error, nullptr);
    if (!decoder) throw std::runtime_error("OGG header decode failed (" + std::to_string(error) + ")");
    try {
        const auto info = stb_vorbis_get_info(decoder);
        const auto length = stb_vorbis_stream_length_in_samples(decoder);
        if (info.channels < 1 || info.channels > 2 || !info.sample_rate || !length ||
            length > std::numeric_limits<int>::max() / info.channels)
            throw std::runtime_error("Invalid OGG channel count, rate or sample length");
        begin(info.channels, static_cast<int>(info.sample_rate), static_cast<int>(length));
        unsigned offset = 0;
        while (offset < length) {
            float** planes = nullptr;
            const int frames = stb_vorbis_get_frame_float(decoder, nullptr, &planes);
            if (frames <= 0 || static_cast<unsigned>(frames) > length - offset)
                throw std::runtime_error("Incomplete OGG sample data");
            for (int channel = 0; channel < info.channels; ++channel)
                write(channel, static_cast<int>(offset), {planes[channel], static_cast<size_t>(frames)});
            offset += frames;
        }
        stb_vorbis_close(decoder);
    } catch (...) { stb_vorbis_close(decoder); throw; }
}
WebAudioPcm DecodeWebOgg(std::span<const unsigned char> bytes)
{
    WebAudioPcm result;
    DecodeWebOggFrames(bytes, [&](int channels, int rate, int frames) {
        result.channels = channels;
        result.sampleRate = rate;
        result.samples.resize(static_cast<size_t>(frames) * channels);
    }, [&](int channel, int offset, std::span<const float> plane) {
        auto index = static_cast<size_t>(offset) * result.channels + channel;
        for (const float sample : plane) {
            result.samples[index] = sample;
            index += result.channels;
        }
    });
    return result;
}
}
