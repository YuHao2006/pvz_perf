#include "SexyAppBase.h"
#include "DSoundManager.h"
#include "DSoundBufferWrite.h"
#include <mmreg.h>
#include <cstring>
#include <stdexcept>
#include <utility>
#include "misc/Debug.h"
#include "DSoundInstance.h"
#include <math.h>
#include "paklib/PakInterface.h"

using namespace Sexy;

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
				// Keep the DirectSound mixing boundary in float as well.
				WAVEFORMATEX aWaveFormat;
				DSBUFFERDESC aBufferDesc;

				// Set up wave format structure.
				int aBitCount = 32;
				int aChannelCount = 2;
				int aSampleRate = 44100;

				// Set up wave format structure.
				memset(&aWaveFormat, 0, sizeof(WAVEFORMATEX));
				aWaveFormat.cbSize = 0;
				aWaveFormat.wFormatTag = WAVE_FORMAT_IEEE_FLOAT;
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
					if (FAILED(aResult))
					{
						mPrimaryBuffer->Release();
						mPrimaryBuffer = nullptr;
						mDirectSound->Release();
						mDirectSound = nullptr;
						throw std::runtime_error("DirectSound float primary format failed");
					}
				}
				else
				{
					mDirectSound->Release();
					mDirectSound = nullptr;
					throw std::runtime_error("DirectSound primary buffer creation failed");
				}
			}
			else
			{
				mDirectSound->Release();
				mDirectSound = nullptr;
				throw std::runtime_error("DirectSound priority cooperative level failed");
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


bool DSoundManager::LoadSound(unsigned int theSfxID, const std::string& theFilename)
{
	if (theSfxID >= MAX_SOURCE_SOUNDS)
		return false;
	// The argument can refer to the slot being replaced.
	std::string name = theFilename;
	ReleaseSound(theSfxID);
	if (!mDirectSound)
		return true;
	DecodedSound decoded;
	if (!DecodeSound(name, decoded))
		return false;
	const auto size = static_cast<DWORD>(decoded.samples.size() * sizeof(float));
	WAVEFORMATEX format{};
	format.wFormatTag = WAVE_FORMAT_IEEE_FLOAT;
	format.nChannels = static_cast<WORD>(decoded.channels);
	format.nSamplesPerSec = decoded.frequency;
	format.wBitsPerSample = 32;
	format.nBlockAlign = static_cast<WORD>(decoded.channels * sizeof(float));
	format.nAvgBytesPerSec = decoded.frequency * format.nBlockAlign;
	DSBUFFERDESC desc{};
	desc.dwSize = sizeof(desc);
	desc.dwFlags = SOUND_FLAGS;
	desc.dwBufferBytes = size;
	desc.lpwfxFormat = &format;
	LPDIRECTSOUNDBUFFER candidate = nullptr;
	const HRESULT created = mDirectSound->CreateSoundBuffer(&desc, &candidate, nullptr);
	DSoundBufferOwner buffer(candidate);
	if (FAILED(created))
		throw std::runtime_error("DirectSound float sound buffer creation failed: " + name);
	DSoundBufferWrite write(buffer.get(), size);
	if (!write.Ready(size))
		throw std::runtime_error("DirectSound float sound buffer lock failed: " + name);
	std::memcpy(write.mData, decoded.samples.data(), size);
	if (FAILED(write.Finish()))
		throw std::runtime_error("DirectSound float sound buffer unlock failed: " + name);
	mSourceFileNames[theSfxID] = std::move(name);
	mSourceDataSizes[theSfxID] = size;
	mSourceSounds[theSfxID] = buffer.release();
	return true;
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
