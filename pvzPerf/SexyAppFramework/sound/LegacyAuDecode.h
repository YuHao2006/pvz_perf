#pragma once
#include <cstring>
#include <limits>
#include <span>
#include <stdexcept>
#include <string>
#include <vector>

namespace Sexy {
static_assert(sizeof(unsigned int) == 4);
static_assert(sizeof(unsigned long long) == 8);

// Preserve the original game's mu-law endpoints, including code 0x80.
inline constexpr int DecodeLegacyAuMuLaw(unsigned char encoded)
{
	const int sign = encoded < 128 ? -1 : 1;
	int sample = encoded | 0x80;
	if (sample > 239) sample = (255 - sample) * 2;
	else if (sample > 223) sample = (239 - sample) * 4 + 32;
	else if (sample > 207) sample = (223 - sample) * 8 + 96;
	else if (sample > 191) sample = (207 - sample) * 16 + 224;
	else if (sample > 175) sample = (191 - sample) * 32 + 480;
	else if (sample > 159) sample = (175 - sample) * 64 + 992;
	else if (sample > 143) sample = (159 - sample) * 128 + 2016;
	else if (sample > 128) sample = (143 - sample) * 256 + 4064;
	else sample = 255;
	return sign * sample * 4;
}

inline std::vector<unsigned char> DecodeLegacyAuToWave(std::span<const unsigned char> source)
{
	if (source.size() < 24) throw std::runtime_error("AU header is truncated");
	const auto readWord = [&](unsigned int offset) {
		return (static_cast<unsigned int>(source[offset]) << 24) |
			(static_cast<unsigned int>(source[offset + 1]) << 16) |
			(static_cast<unsigned int>(source[offset + 2]) << 8) |
			static_cast<unsigned int>(source[offset + 3]);
	};
	if (readWord(0) != 0x2e736e64U) throw std::runtime_error("AU magic must be .snd");
	const unsigned int headerSize = readWord(4), dataSize = readWord(8);
	const unsigned int encoding = readWord(12), rate = readWord(16), channels = readWord(20);
	if (encoding != 1 && encoding != 2)
		throw std::runtime_error("Unsupported legacy AU encoding: " + std::to_string(encoding));
	const unsigned int bytesPerSample = encoding == 1 ? 2 : 1;
	// Match the DirectSound path's finite-data, frame and buffer-size limits.
	if (headerSize < 24 || headerSize > source.size() ||
		dataSize == 0 || dataSize > 0x0fffffffU / bytesPerSample ||
		dataSize > source.size() - headerSize)
		throw std::runtime_error("Invalid AU header offset or data length");
	if (channels == 0 || channels > 65535U / bytesPerSample || dataSize % channels != 0)
		throw std::runtime_error("Invalid AU channel count or incomplete sample frame");
	const unsigned int pcmSize = dataSize * bytesPerSample;
	const unsigned int blockAlign = channels * bytesPerSample;
	if (pcmSize < 4 || rate == 0 || rate > std::numeric_limits<unsigned int>::max() / blockAlign)
		throw std::runtime_error("Invalid AU PCM size or sample rate");

	const unsigned int paddedSize = pcmSize + (pcmSize & 1U);
	std::vector<unsigned char> wave(44ULL + paddedSize, 0);
	const auto writeWord = [&](unsigned int offset, unsigned int value, unsigned int bytes) {
		for (unsigned int index = 0; index < bytes; ++index)
			wave[offset + index] = static_cast<unsigned char>(value >> (index * 8));
	};
	std::memcpy(wave.data(), "RIFF", 4);
	writeWord(4, 36 + paddedSize, 4);
	std::memcpy(wave.data() + 8, "WAVEfmt ", 8);
	writeWord(16, 16, 4);
	writeWord(20, 1, 2);
	writeWord(22, channels, 2);
	writeWord(24, rate, 4);
	writeWord(28, rate * blockAlign, 4);
	writeWord(32, blockAlign, 2);
	writeWord(34, bytesPerSample * 8, 2);
	std::memcpy(wave.data() + 36, "data", 4);
	writeWord(40, pcmSize, 4);
	if (encoding == 1)
	{
		for (unsigned int index = 0; index < dataSize; ++index)
			writeWord(44 + index * 2,
				static_cast<unsigned int>(DecodeLegacyAuMuLaw(source[headerSize + index])), 2);
	}
	else
	{
		// The Windows loader copies encoding 2 unchanged; retain its byte contract.
		std::memcpy(wave.data() + 44, source.data() + headerSize, dataSize);
	}
	return wave;
}
}
