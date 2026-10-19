#pragma once
#include <string>
#include <vector>

namespace Sexy {
struct DecodedSound {
    std::vector<float> samples;
    unsigned int frequency = 0;
    unsigned int channels = 0;
};

class SoundDecoderLease final {
public:
    SoundDecoderLease();
    ~SoundDecoderLease();
    SoundDecoderLease(const SoundDecoderLease&) = delete;
    SoundDecoderLease& operator=(const SoundDecoderLease&) = delete;
};

bool DecodeSound(const std::string& baseName, DecodedSound& output);
}
