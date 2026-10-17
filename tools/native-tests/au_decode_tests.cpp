#include "SexyAppFramework/sound/LegacyAuDecode.h"
#include "SexyAppFramework/sound/bass.h"
#include <algorithm>
#include <dlfcn.h>
#include <fstream>
#include <iostream>
#include <iterator>
#include <string>

namespace {
void Require(bool condition, const std::string& message)
{
	if (!condition) throw std::runtime_error(message);
}
void WriteBigWord(std::vector<unsigned char>& bytes, unsigned int offset, unsigned int value)
{
	for (unsigned int index = 0; index < 4; ++index)
		bytes[offset + index] = static_cast<unsigned char>(value >> (24 - index * 8));
}
unsigned int ReadLittleWord(std::span<const unsigned char> bytes, unsigned int offset)
{
	return static_cast<unsigned int>(bytes[offset]) |
		(static_cast<unsigned int>(bytes[offset + 1]) << 8) |
		(static_cast<unsigned int>(bytes[offset + 2]) << 16) |
		(static_cast<unsigned int>(bytes[offset + 3]) << 24);
}
std::vector<unsigned char> MakeAu(unsigned int encoding, unsigned int channels,
	std::span<const unsigned char> payload, unsigned int headerSize = 24)
{
	std::vector<unsigned char> bytes(headerSize + payload.size());
	WriteBigWord(bytes, 0, 0x2e736e64U);
	WriteBigWord(bytes, 4, headerSize);
	WriteBigWord(bytes, 8, static_cast<unsigned int>(payload.size()));
	WriteBigWord(bytes, 12, encoding);
	WriteBigWord(bytes, 16, 8012);
	WriteBigWord(bytes, 20, channels);
	std::copy(payload.begin(), payload.end(), bytes.begin() + headerSize);
	return bytes;
}
void RequireRejected(std::span<const unsigned char> bytes)
{
	try { (void)Sexy::DecodeLegacyAuToWave(bytes); }
	catch (const std::runtime_error&) { return; }
	throw std::runtime_error("Malformed AU was accepted");
}
int ReferenceMuLaw(unsigned char code)
{
	const unsigned int segment = 7 - ((code >> 4) & 7);
	const unsigned int mantissa = 15 - (code & 15);
	const int magnitude = (code & 127) == 0 ? 255 :
		static_cast<int>(mantissa * (2U << segment) + 32 * ((1U << segment) - 1));
	return (code < 128 ? -1 : 1) * magnitude * 4;
}
void CheckParser()
{
	std::vector<unsigned char> codes(256);
	for (unsigned int index = 0; index < codes.size(); ++index)
		codes[index] = static_cast<unsigned char>(index);
	const auto au = MakeAu(1, 1, codes, 28);
	const auto wave = Sexy::DecodeLegacyAuToWave(au);
	Require(wave.size() == 44 + 512 && ReadLittleWord(wave, 40) == 512,
		"mu-law WAV length mismatch");
	Require(ReadLittleWord(wave, 24) == 8012 && ReadLittleWord(wave, 28) == 16024,
		"mu-law WAV rate mismatch");
	for (unsigned int index = 0; index < codes.size(); ++index)
	{
		const auto actual = static_cast<unsigned int>(wave[44 + index * 2]) |
			(static_cast<unsigned int>(wave[45 + index * 2]) << 8);
		Require(actual == (static_cast<unsigned int>(ReferenceMuLaw(codes[index])) & 65535U),
			"Legacy mu-law PCM mismatch for code " + std::to_string(index));
	}
	Require(Sexy::DecodeLegacyAuMuLaw(0x80) == 1020 &&
		Sexy::DecodeLegacyAuMuLaw(0x00) == -1020 &&
		Sexy::DecodeLegacyAuMuLaw(0xff) == 0 &&
		Sexy::DecodeLegacyAuMuLaw(0x81) == 30592, "Legacy endpoint behavior changed");

	const std::vector<unsigned char> raw{0, 127, 128, 254, 255};
	auto rawAu = MakeAu(2, 1, raw, 32);
	rawAu.push_back(90); // Bytes outside the declared data must not become samples.
	const auto rawWave = Sexy::DecodeLegacyAuToWave(rawAu);
	Require(rawWave.size() == 50 && ReadLittleWord(rawWave, 40) == 5 &&
		std::equal(raw.begin(), raw.end(), rawWave.begin() + 44) && rawWave.back() == 0,
		"Encoding 2 copy or RIFF padding changed");
	const auto stereo = Sexy::DecodeLegacyAuToWave(MakeAu(1, 2, codes));
	Require(stereo[22] == 2 && stereo[32] == 4 && ReadLittleWord(stereo, 28) == 32048,
		"Stereo frame metadata mismatch");

	for (size_t length = 0; length < au.size(); ++length)
		RequireRejected(std::span<const unsigned char>(au).first(length));
	for (const auto [offset, value] : std::vector<std::pair<unsigned int, unsigned int>>{
		{0, 0}, {4, 23}, {4, 0xffffffffU}, {8, 0}, {8, 0xffffffffU},
		{8, 0x08000000U}, {12, 0}, {12, 3}, {16, 0}, {16, 0xffffffffU},
		{20, 0}, {20, 3}, {20, 65536}})
	{
		auto malformed = au;
		WriteBigWord(malformed, offset, value);
		RequireRejected(malformed);
	}
	const std::vector<unsigned char> tooSmall{1};
	RequireRejected(MakeAu(2, 1, tooSmall));
	std::cout << "AU parser: 256 mu-law values, legacy endpoints, PCM8, stereo, "
		"RIFF padding and malformed/truncated inputs passed\n";
}
template<class Function>
Function Resolve(void* library, const char* name)
{
	const auto function = reinterpret_cast<Function>(dlsym(library, name));
	Require(function != nullptr, std::string("Missing native BASS symbol: ") + name);
	return function;
}
void CheckNativeBass(int argc, char** argv)
{
	Require(argc >= 3, "Usage: au_decode_tests LIBBASS AU_FILE...");
	void* library = dlopen(argv[1], RTLD_NOW | RTLD_LOCAL);
	if (!library)
		throw std::runtime_error(std::string("Cannot load native BASS: ") + dlerror());
	const auto init = Resolve<decltype(&BASS_Init)>(library, "BASS_Init");
	const auto free = Resolve<decltype(&BASS_Free)>(library, "BASS_Free");
	const auto load = Resolve<decltype(&BASS_SampleLoad)>(library, "BASS_SampleLoad");
	const auto sampleFree = Resolve<decltype(&BASS_SampleFree)>(library, "BASS_SampleFree");
	const auto info = Resolve<decltype(&BASS_SampleGetInfo)>(library, "BASS_SampleGetInfo");
	const auto getData = Resolve<decltype(&BASS_SampleGetData)>(library, "BASS_SampleGetData");
	const auto error = Resolve<decltype(&BASS_ErrorGetCode)>(library, "BASS_ErrorGetCode");
	// Device 0 is BASS's no-output device: decode only, never play audio.
	Require(init(0, 44100, 0, nullptr, nullptr) != FALSE, "BASS no-output initialization failed");
	try
	{
		for (int index = 2; index < argc; ++index)
		{
			std::ifstream input(argv[index], std::ios::binary);
			Require(bool(input), std::string("Cannot open AU fixture: ") + argv[index]);
			const std::vector<unsigned char> source{
				std::istreambuf_iterator<char>(input), std::istreambuf_iterator<char>()};
			const auto wave = Sexy::DecodeLegacyAuToWave(source);
			const auto sample = load(TRUE, wave.data(), 0,
				static_cast<unsigned int>(wave.size()), 32, 0);
			Require(sample != 0, "BASS rejected decoded AU/WAV, error " + std::to_string(error()));
			BASS_SAMPLE metadata{};
			Require(info(sample, &metadata) != FALSE, "BASS sample metadata query failed");
			Require(metadata.freq == ReadLittleWord(wave, 24) &&
				metadata.length == ReadLittleWord(wave, 40) &&
				metadata.chans == static_cast<unsigned int>(wave[22]),
				"BASS sample metadata differs from converted WAV");
			std::vector<unsigned char> actual(metadata.length);
			Require(getData(sample, actual.data()) != FALSE &&
				std::equal(actual.begin(), actual.end(), wave.begin() + 44),
				"BASS sample data differs from legacy PCM");
			Require(sampleFree(sample) != FALSE, "BASS sample release failed");
			std::cout << argv[index] << ": BASS accepted " << metadata.length
				<< " PCM bytes, " << metadata.freq << " Hz, " << metadata.chans << " channel(s)\n";
		}
	}
	catch (...)
	{
		free();
		dlclose(library);
		throw;
	}
	Require(free() != FALSE, "BASS no-output device release failed");
	dlclose(library);
}
}
int main(int argc, char** argv)
{
	try { CheckParser(); CheckNativeBass(argc, argv); return 0; }
	catch (const std::exception& error) { std::cerr << error.what() << '\n'; return 1; }
}
