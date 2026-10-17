#include "SexyAppBase.h"
#include "DSoundManager.h"
#include "DSoundBufferWrite.h"
#include "sound/LegacyAuDecode.h"
#include <cerrno>
#include <io.h>
#include <fcntl.h>
#include <array>
#include <bit>
#include <cstdint>
#include <cstring>
#include <limits>
#include <memory>
#include <utility>
#include "misc/Debug.h"
#include "DSoundInstance.h"
#include <math.h>
#include "paklib/PakInterface.h"

using namespace Sexy;

#define USE_OGG_LIB


#ifdef USE_OGG_LIB
#include "ogg/ivorbiscodec.h"
#include "ogg/ivorbisfile.h"
#endif

#define SOUND_FLAGS (DSBCAPS_CTRLPAN | DSBCAPS_CTRLVOLUME |  DSBCAPS_STATIC | DSBCAPS_LOCSOFTWARE | DSBCAPS_GLOBALFOCUS | DSBCAPS_CTRLFREQUENCY)
DSoundManager::DSoundManager(HWND theHWnd)
{
	mLastReleaseTick = 0;
	mPrimaryBuffer = NULL;

	int i;

	for (i = 0; i < MAX_SOURCE_SOUNDS; i++)
	{
		mSourceSounds[i] = NULL;
		mSourceDataSizes[i] = 0;
		mBaseVolumes[i] = 1;
		mBasePans[i] = 0;
	}

	for (i = 0; i < MAX_CHANNELS; i++)
		mPlayingSounds[i] = NULL;

	mDirectSound = NULL;

	mMasterVolume = 1.0;

	if (theHWnd != NULL)
	{
		//extern HMODULE gDSoundDLL;
		typedef HRESULT (WINAPI *DirectSoundCreateFunc)(LPCGUID lpcGuid, LPDIRECTSOUND * ppDS, LPUNKNOWN  pUnkOuter);
		DirectSoundCreateFunc aDirectSoundCreateFunc = (DirectSoundCreateFunc)GetProcAddress(gDSoundDLL,"DirectSoundCreate");

		if (aDirectSoundCreateFunc != NULL && aDirectSoundCreateFunc(NULL, &mDirectSound, NULL) == DS_OK)
		{
			HRESULT aResult = mDirectSound->SetCooperativeLevel(theHWnd,DSSCL_PRIORITY);
			if (SUCCEEDED(aResult))
			{
				// Set primary buffer to 16-bit 44.1Khz
				WAVEFORMATEX aWaveFormat;
				DSBUFFERDESC aBufferDesc;

				// Set up wave format structure.
				int aBitCount = 16;
				int aChannelCount = 2;
				int aSampleRate = 44100;

				// Set up wave format structure.
				memset(&aWaveFormat, 0, sizeof(WAVEFORMATEX));
				aWaveFormat.cbSize = 0;
				aWaveFormat.wFormatTag = WAVE_FORMAT_PCM;
				aWaveFormat.nChannels = aChannelCount;
				aWaveFormat.nSamplesPerSec = aSampleRate;
				aWaveFormat.nBlockAlign = aChannelCount*aBitCount/8;
				aWaveFormat.nAvgBytesPerSec = 
						aWaveFormat.nSamplesPerSec * aWaveFormat.nBlockAlign;
				aWaveFormat.wBitsPerSample = aBitCount;

				// Set up DSBUFFERDESC structure.
				memset(&aBufferDesc, 0, sizeof(DSBUFFERDESC)); // Zero it out.
				aBufferDesc.dwSize = sizeof(DSBUFFERDESC1);
				aBufferDesc.dwFlags = DSBCAPS_PRIMARYBUFFER;//| DSBCAPS_CTRL3D; // Need default controls (pan, volume, frequency).
				aBufferDesc.dwBufferBytes = 0;
				aBufferDesc.lpwfxFormat =NULL;//(LPWAVEFORMATEX)&aWaveFormat;

				HRESULT aResult = mDirectSound->CreateSoundBuffer(&aBufferDesc, &mPrimaryBuffer, NULL);
				if (aResult == DS_OK)
				{
					aResult = mPrimaryBuffer->SetFormat(&aWaveFormat);
				}
			}
			else
			{
				aResult = mDirectSound->SetCooperativeLevel(theHWnd,DSSCL_NORMAL);
			}
		}
	}
	mInitialized = mDirectSound != nullptr;
}

DSoundManager::~DSoundManager()
{
	mInitialized = false;
	ReleaseChannels();
	ReleaseSounds();

	if (mPrimaryBuffer)
		mPrimaryBuffer->Release();

	if (mDirectSound != NULL)
	{
		mDirectSound->Release();
		mDirectSound = nullptr;
	}
}

int	DSoundManager::FindFreeChannel()
{
	DWORD aTick = GetTickCount();
	if (aTick-mLastReleaseTick > 1000)
	{
		ReleaseFreeChannels();
		mLastReleaseTick = aTick;
	}

	for (int i = 0; i < MAX_CHANNELS; i++)
	{		
		if (mPlayingSounds[i] == NULL)
			return i;
		
		if (mPlayingSounds[i]->IsReleased())
		{
			delete mPlayingSounds[i];
			mPlayingSounds[i] = NULL;
			return i;
		}
	}
	
	return -1;
}

int DSoundManager::VolumeToDB(double theVolume)
{
	int aVol = (int) ((log10(1 + theVolume*9) - 1.0) * 2333);
	if (aVol < -2000)
		aVol = -10000;

	return aVol;
}

void DSoundManager::SetVolume(double theVolume)
{
	mMasterVolume = theVolume;

	for (int i = 0; i < MAX_CHANNELS; i++)
		if (mPlayingSounds[i] != NULL)
			mPlayingSounds[i]->RehupVolume();
}

bool DSoundManager::LoadWAVSound(unsigned int theSfxID, const std::string& theFilename)
{
	using PFilePtr = std::unique_ptr<PFILE, decltype(&p_fclose)>;
	PFilePtr file(p_fopen(theFilename.c_str(), "rb"), &p_fclose);
	if (!file || p_fseek(file.get(), 0, SEEK_END) != 0)
		return false;
	const int fileSize = p_ftell(file.get());
	if (fileSize < 12 || p_fseek(file.get(), 0, SEEK_SET) != 0)
		return false;
	const auto le32 = [](const unsigned char* p) {
		return std::uint32_t(p[0]) | (std::uint32_t(p[1]) << 8) |
			(std::uint32_t(p[2]) << 16) | (std::uint32_t(p[3]) << 24);
	};
	const auto le16 = [](const unsigned char* p) {
		return static_cast<WORD>(p[0] | (unsigned(p[1]) << 8));
	};
	std::array<unsigned char, 12> riff{};
	if (p_fread(riff.data(), 1, riff.size(), file.get()) != riff.size() ||
		std::memcmp(riff.data(), "RIFF", 4) != 0 ||
		std::memcmp(riff.data() + 8, "WAVE", 4) != 0)
		return false;
	const std::uint64_t end = 8ULL + le32(riff.data() + 4);
	if (end < 12 || end > static_cast<unsigned int>(fileSize))
		return false;

	WAVEFORMATEX format{};
	bool haveFormat = false;
	std::uint64_t position = 12;
	while (end - position >= 8)
	{
		std::array<unsigned char, 8> chunk{};
		if (p_fread(chunk.data(), 1, chunk.size(), file.get()) != chunk.size())
			return false;
		position += chunk.size();
		const DWORD size = le32(chunk.data() + 4);
		const std::uint64_t paddedSize = std::uint64_t(size) + (size & 1U);
		if (paddedSize > end - position)
			return false;
		if (std::memcmp(chunk.data(), "fmt ", 4) == 0)
		{
			std::array<unsigned char, 16> pcm{};
			if (size < pcm.size() || p_fread(pcm.data(), 1, pcm.size(), file.get()) != pcm.size())
				return false;
			format.wFormatTag = le16(pcm.data());
			format.nChannels = le16(pcm.data() + 2);
			format.nSamplesPerSec = le32(pcm.data() + 4);
			format.nAvgBytesPerSec = le32(pcm.data() + 8);
			format.nBlockAlign = le16(pcm.data() + 12);
			format.wBitsPerSample = le16(pcm.data() + 14);
			const std::uint64_t align = std::uint64_t(format.nChannels) * (format.wBitsPerSample / 8);
			if (format.wFormatTag != WAVE_FORMAT_PCM || !format.nChannels ||
				!format.nSamplesPerSec || !format.wBitsPerSample || format.wBitsPerSample % 8 ||
				!align || align > std::numeric_limits<WORD>::max() || format.nBlockAlign != align ||
				std::uint64_t(format.nSamplesPerSec) * align != format.nAvgBytesPerSec)
				return false;
			haveFormat = true;
		}
		else if (std::memcmp(chunk.data(), "data", 4) == 0)
		{
			if (!haveFormat || size < DSBSIZE_MIN || size > DSBSIZE_MAX || size % format.nBlockAlign)
				return false;
			DSBUFFERDESC desc{};
			desc.dwSize = sizeof(desc); desc.dwFlags = SOUND_FLAGS;
			desc.dwBufferBytes = size; desc.lpwfxFormat = &format;
			LPDIRECTSOUNDBUFFER candidate = nullptr;
			const auto created = mDirectSound->CreateSoundBuffer(&desc, &candidate, nullptr);
			DSoundBufferOwner buffer(candidate);
			if (created != DS_OK) return false;
			DSoundBufferWrite write(buffer.get(), size);
			if (!write.Ready(size)) return false;
			if (p_fread(write.mData, 1, static_cast<int>(size), file.get()) != size)
				return false;
			if (write.Finish() != DS_OK) return false;
			mSourceSounds[theSfxID] = buffer.release();
			mSourceDataSizes[theSfxID] = size;
			return true;
		}
		// RIFF chunk sizes exclude the pad byte. Even empty chunks advance by
		// their header, and all arithmetic stays bounded by the containing RIFF.
		position += paddedSize;
		if (p_fseek(file.get(), static_cast<long>(position), SEEK_SET) != 0)
			return false;
	}
	return false;
}

#ifdef USE_OGG_LIB

static size_t ogg_pak_read(void* ptr, size_t size, size_t count, void* source)
{
	if (!size || !count) return 0;
	if (!source || size > std::numeric_limits<int>::max() || count > std::numeric_limits<int>::max())
	{
		errno = EINVAL;
		return 0;
	}
	return p_fread(ptr, static_cast<int>(size), static_cast<int>(count), static_cast<PFILE*>(source));
}
static int ogg_pak_seek(void* source, ogg_int64_t offset, int whence)
{
	if (!source || offset < std::numeric_limits<long>::min() || offset > std::numeric_limits<long>::max())
	{
		errno = EINVAL;
		return -1;
	}
	return p_fseek(static_cast<PFILE*>(source), static_cast<long>(offset), whence);
}
static int ogg_pak_close(void* source) { return p_fclose(static_cast<PFILE*>(source)); }
static long ogg_pak_tell(void* source) { return p_ftell(static_cast<PFILE*>(source)); }

static int ov_pak_open(PFILE* file, OggVorbis_File* vf, char* initial, long ibytes)
{
	// Exact callback signatures: no size_t/int or void*/PFILE* function casts.
	const ov_callbacks callbacks{ogg_pak_read, ogg_pak_seek, ogg_pak_close, ogg_pak_tell};
	return ov_open_callbacks(file, vf, initial, ibytes, callbacks);
}

bool DSoundManager::LoadOGGSound(unsigned int theSfxID, const std::string& theFilename)
{
	using PFilePtr = std::unique_ptr<PFILE, decltype(&p_fclose)>;
	PFilePtr file(p_fopen(theFilename.c_str(), "rb"), &p_fclose);
	if (!file) return false;
	OggVorbis_File vf{};
	if (ov_pak_open(file.get(), &vf, nullptr, 0) < 0) return false;
	file.release(); // ov_clear owns/closes the datasource only after successful open.
	const auto clear = [](OggVorbis_File* p) { ov_clear(p); };
	std::unique_ptr<OggVorbis_File, decltype(clear)> decoder(&vf, clear);

	const vorbis_info* info = ov_info(&vf, -1);
	if (!info || info->channels <= 0 || info->channels > std::numeric_limits<WORD>::max() / 2 ||
		info->rate <= 0)
		return false;
	WAVEFORMATEX format{};
	format.wFormatTag = WAVE_FORMAT_PCM;
	format.nChannels = static_cast<WORD>(info->channels);
	format.nSamplesPerSec = static_cast<DWORD>(info->rate);
	format.wBitsPerSample = 16;
	format.nBlockAlign = static_cast<WORD>(info->channels * 2);
	if (std::uint64_t(info->rate) * format.nBlockAlign > std::numeric_limits<DWORD>::max())
		return false;
	format.nAvgBytesPerSec = format.nSamplesPerSec * format.nBlockAlign;
	const auto frames = ov_pcm_total(&vf, -1);
	if (frames <= 0 || frames > DSBSIZE_MAX / format.nBlockAlign) return false;
	const DWORD size = static_cast<DWORD>(frames * format.nBlockAlign);
	if (size < DSBSIZE_MIN) return false;
	// One DirectSound source has a single format. Refuse a chained format
	// change before decoding, not after differently packed samples were written.
	const long links = ov_streams(&vf);
	if (links <= 0) return false;
	for (long i = 0; i < links; ++i)
	{
		const auto* link = ov_info(&vf, i);
		if (!link || link->channels != format.nChannels || link->rate != format.nSamplesPerSec)
			return false;
	}
	DSBUFFERDESC desc{};
	desc.dwSize = sizeof(desc); desc.dwFlags = SOUND_FLAGS;
	desc.dwBufferBytes = size; desc.lpwfxFormat = &format;
	LPDIRECTSOUNDBUFFER candidate = nullptr;
	const auto created = mDirectSound->CreateSoundBuffer(&desc, &candidate, nullptr);
	DSoundBufferOwner buffer(candidate);
	if (created != DS_OK) return false;
	DSoundBufferWrite write(buffer.get(), size);
	if (!write.Ready(size)) return false;
	char* ptr = static_cast<char*>(write.mData);
	DWORD remaining = size;
	while (remaining)
	{
		int section = -1;
		const long count = ov_read(&vf, ptr, static_cast<int>(remaining), &section);
		if (count <= 0 || static_cast<unsigned long>(count) > remaining) return false;
		ptr += count;
		remaining -= static_cast<DWORD>(count);
	}
	if (write.Finish() != DS_OK) return false;
	mSourceSounds[theSfxID] = buffer.release();
	mSourceDataSizes[theSfxID] = size;
	return true;
}
#else
bool DSoundManager::LoadOGGSound(unsigned int theSfxID, const std::string& theFilename)
{
	return false;
}
#endif


bool DSoundManager::LoadAUSound(unsigned int theSfxID, const std::string& theFilename)
{
	using PFilePtr = std::unique_ptr<PFILE, decltype(&p_fclose)>;
	PFilePtr fp(p_fopen(theFilename.c_str(), "rb"), &p_fclose);
	if (!fp)
		return false;

	// AU stores six big-endian 32-bit header words. Do not use unread stack
	// bytes or truncate header sizes before passing them to the pak reader.
	std::array<std::uint32_t, 6> aHeader{};
	if (p_fread(aHeader.data(), 1, sizeof(aHeader), fp.get()) != sizeof(aHeader))
		return false;
	if constexpr (std::endian::native == std::endian::little)
		for (auto& aWord : aHeader) aWord = std::byteswap(aWord);
	if (aHeader[0] != 0x2e736e64U) // ".snd"
		return false;
	const auto aHeaderSize = aHeader[1];
	const auto aDataSize = aHeader[2];
	const auto anEncoding = aHeader[3];
	const auto aSampleRate = aHeader[4];
	const auto aChannelCount = aHeader[5];
	if (anEncoding != 1 && anEncoding != 2)
		return false; // Preserve the original two supported encodings.
	const bool ulaw = anEncoding == 1;
	const DWORD aBitCount = ulaw ? 16 : 8;
	const DWORD aBytesPerSample = aBitCount / 8;
	if (aHeaderSize < sizeof(aHeader) || aDataSize == 0 ||
		aDataSize > DSBSIZE_MAX / aBytesPerSample || aChannelCount == 0 ||
		aChannelCount > std::numeric_limits<WORD>::max() / aBytesPerSample ||
		aDataSize % aChannelCount != 0 || aSampleRate == 0)
		return false;
	const DWORD aDestSize = aDataSize * aBytesPerSample;
	const WORD aBlockAlign = static_cast<WORD>(aChannelCount * aBytesPerSample);
	if (aDestSize < DSBSIZE_MIN ||
		aSampleRate > std::numeric_limits<DWORD>::max() / aBlockAlign)
		return false;

	if (p_fseek(fp.get(), 0, SEEK_END) != 0)
		return false;
	const int aFileSize = p_ftell(fp.get());
	if (aFileSize < 0 || aHeaderSize > static_cast<unsigned int>(aFileSize) ||
		aDataSize > static_cast<unsigned int>(aFileSize) - aHeaderSize ||
		p_fseek(fp.get(), static_cast<long>(aHeaderSize), SEEK_SET) != 0)
		return false;

	// Finish all potentially throwing allocation/I/O before locking DirectSound.
	// A short read is a failed resource, never partially converted sample data.
	auto aSrcBuffer = std::make_unique_for_overwrite<uchar[]>(aDataSize);
	if (p_fread(aSrcBuffer.get(), 1, static_cast<int>(aDataSize), fp.get()) != aDataSize)
		return false;
	fp.reset();

	WAVEFORMATEX aWaveFormat{};
	aWaveFormat.wFormatTag = WAVE_FORMAT_PCM;
	aWaveFormat.nChannels = static_cast<WORD>(aChannelCount);
	aWaveFormat.nSamplesPerSec = aSampleRate;
	aWaveFormat.nBlockAlign = aBlockAlign;
	aWaveFormat.nAvgBytesPerSec = aSampleRate * aBlockAlign;
	aWaveFormat.wBitsPerSample = static_cast<WORD>(aBitCount);
	DSBUFFERDESC aBufferDesc{};
	aBufferDesc.dwSize = sizeof(aBufferDesc);
	aBufferDesc.dwFlags = SOUND_FLAGS;
	aBufferDesc.dwBufferBytes = aDestSize;
	aBufferDesc.lpwfxFormat = &aWaveFormat;

	LPDIRECTSOUNDBUFFER aCandidate = nullptr;
	const HRESULT aCreated = mDirectSound->CreateSoundBuffer(&aBufferDesc, &aCandidate, nullptr);
	const auto aRelease = [](IDirectSoundBuffer* p) { p->Release(); };
	std::unique_ptr<IDirectSoundBuffer, decltype(aRelease)> aBuffer(aCandidate, aRelease);
	if (aCreated != DS_OK)
		return false;

	void* lpvPtr = nullptr;
	DWORD dwBytes = 0;
	if (aBuffer->Lock(0, aDestSize, &lpvPtr, &dwBytes, nullptr, nullptr, 0) != DS_OK)
		return false;
	if (dwBytes != aDestSize)
	{
		aBuffer->Unlock(lpvPtr, dwBytes, nullptr, 0);
		return false;
	}

	// Keep the 1073 sample conversion, including its mu-law endpoint behavior.
	if (ulaw)
	{
		short* aDestBuffer = (short*) lpvPtr;

		for (unsigned int i = 0; i < aDataSize; i++)
		{
			aDestBuffer[i] = static_cast<short>(DecodeLegacyAuMuLaw(aSrcBuffer[i]));
		}		
	}
	else
		memcpy(lpvPtr, aSrcBuffer.get(), aDataSize);

	if (aBuffer->Unlock(lpvPtr, dwBytes, nullptr, 0) != DS_OK)
		return false;
	// Publish only a complete, unlocked source. Failures release the candidate.
	mSourceSounds[theSfxID] = aBuffer.release();
	mSourceDataSizes[theSfxID] = aDestSize;
	return true;
}

bool DSoundManager::LoadSound(unsigned int theSfxID, const std::string& theFilename)
{
	if (theSfxID >= MAX_SOURCE_SOUNDS)
		return false;

	// Copy before clearing the old slot (the argument may alias its name).
	std::string aFilename = theFilename;
	ReleaseSound(theSfxID);
	if (!mDirectSound)
		return true; // Preserve the original no-device behavior.

	// PAK64 may contain WAV, OGG or AU resources. Keep the original probe order;
	// neither a failed decoder's buffer nor its name may become a cached success.
	try
	{
		bool aLoaded = LoadWAVSound(theSfxID, aFilename + ".wav");
#ifdef USE_OGG_LIB
		if (!aLoaded)
		{
			ReleaseSound(theSfxID);
			aLoaded = LoadOGGSound(theSfxID, aFilename + ".ogg");
		}
#endif
		if (!aLoaded)
		{
			ReleaseSound(theSfxID);
			aLoaded = LoadAUSound(theSfxID, aFilename + ".au");
		}
		if (!aLoaded)
		{
			ReleaseSound(theSfxID);
			return false;
		}
		mSourceFileNames[theSfxID] = std::move(aFilename);
		return true;
	}
	catch (...)
	{
		ReleaseSound(theSfxID);
		throw; // Cleanup only; allocation/decoder exceptions are not hidden.
	}
}

int DSoundManager::LoadSound(const std::string& theFilename)
{
	int i;
	for (i = 0; i < MAX_SOURCE_SOUNDS; i++)
		if (mSourceFileNames[i] == theFilename)
			return i;

	for (i = MAX_SOURCE_SOUNDS-1; i >= 0; i--)
	{		
		if (mSourceSounds[i] == NULL)
		{
			if (!LoadSound(i, theFilename))
				return -1;
			else
				return i;
		}
	}	

	return -1;
}

void DSoundManager::ReleaseSound(unsigned int theSfxID)
{
	if (theSfxID >= MAX_SOURCE_SOUNDS)
		return;

	if (mSourceSounds[theSfxID] != nullptr)
	{
		mSourceSounds[theSfxID]->Release();
		mSourceSounds[theSfxID] = nullptr;
	}
	mSourceDataSizes[theSfxID] = 0;
	mSourceFileNames[theSfxID].clear();
}

int DSoundManager::GetFreeSoundId()
{
	for (int i=0; i<MAX_SOURCE_SOUNDS; i++)
	{
		if (mSourceSounds[i]==NULL)
			return i;
	}

	return -1;
}

int DSoundManager::GetNumSounds()
{
	int aCount = 0;
	for (int i=0; i<MAX_SOURCE_SOUNDS; i++)
	{
		if (mSourceSounds[i]!=NULL)
			aCount++;
	}

	return aCount;
}

bool DSoundManager::SetBaseVolume(unsigned int theSfxID, double theBaseVolume)
{
	if (theSfxID >= MAX_SOURCE_SOUNDS)
		return false;

	mBaseVolumes[theSfxID] = theBaseVolume;
	return true;
}

bool DSoundManager::SetBasePan(unsigned int theSfxID, int theBasePan)
{
	if (theSfxID >= MAX_SOURCE_SOUNDS)
		return false;

	mBasePans[theSfxID] = theBasePan;
	return true;
}

SoundInstance* DSoundManager::GetSoundInstance(unsigned int theSfxID)
{
	if (theSfxID >= MAX_SOURCE_SOUNDS)
		return NULL;

	int aFreeChannel = FindFreeChannel();
	if (aFreeChannel < 0)
		return NULL;

	if (mDirectSound==NULL)
	{
		mPlayingSounds[aFreeChannel] = new DSoundInstance(this, NULL);
	}
	else
	{
		if (mSourceSounds[theSfxID] == NULL)
			return NULL;

		mPlayingSounds[aFreeChannel] = new DSoundInstance(this, mSourceSounds[theSfxID]);
	}

	mPlayingSounds[aFreeChannel]->SetBasePan(mBasePans[theSfxID]);
	mPlayingSounds[aFreeChannel]->SetBaseVolume(mBaseVolumes[theSfxID]);

	return mPlayingSounds[aFreeChannel];
}

void DSoundManager::ReleaseSounds()
{
	for (int i = 0; i < MAX_SOURCE_SOUNDS; i++)
		if (mSourceSounds[i] != NULL)
		{
			mSourceSounds[i]->Release();
			mSourceSounds[i] = NULL;
			mSourceDataSizes[i] = 0;
		}
}

void DSoundManager::ReleaseChannels()
{
	for (int i = 0; i < MAX_CHANNELS; i++)
		if (mPlayingSounds[i] != NULL)
		{
			delete mPlayingSounds[i];
			mPlayingSounds[i] = NULL;
		}
}

void DSoundManager::ReleaseFreeChannels()
{
	for (int i = 0; i < MAX_CHANNELS; i++)
		if (mPlayingSounds[i] != NULL && mPlayingSounds[i]->IsReleased())
		{
			delete mPlayingSounds[i];
			mPlayingSounds[i] = NULL;
		}
}

void DSoundManager::StopAllSounds()
{
	for (int i = 0; i < MAX_CHANNELS; i++)
		if (mPlayingSounds[i] != NULL)
		{
			bool isAutoRelease = mPlayingSounds[i]->mAutoRelease;
			mPlayingSounds[i]->Stop();
			mPlayingSounds[i]->mAutoRelease = isAutoRelease;
		}
}


void DSoundManager::Flush()
{
}

void DSoundManager::SetCooperativeWindow(HWND theHWnd)
{
	if (mDirectSound != NULL)
		mDirectSound->SetCooperativeLevel(theHWnd,DSSCL_NORMAL);
	/*
	if (isWindowed==true) mDirectSound->SetCooperativeLevel(theHWnd,DSSCL_NORMAL);
	else mDirectSound->SetCooperativeLevel(theHWnd,DSSCL_EXCLUSIVE);
	*/
}
#undef SOUND_FLAGS
