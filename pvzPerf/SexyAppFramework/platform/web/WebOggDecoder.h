#pragma once
#include <functional>
#include <span>
#include <vector>

namespace Sexy {
struct WebAudioPcm {
    int channels = 0, sampleRate = 0;
    std::vector<float> samples;
};
void DecodeWebOggFrames(std::span<const unsigned char> bytes,
    const std::function<void(int channels, int rate, int frames)>& begin,
    const std::function<void(int channel, int offset, std::span<const float>)>& write);
WebAudioPcm DecodeWebOgg(std::span<const unsigned char> bytes);
}
