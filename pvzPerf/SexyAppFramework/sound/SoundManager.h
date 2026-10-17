#pragma once
#include "Common.h"

namespace Sexy
{

class SoundInstance;

#define MAX_SOURCE_SOUNDS	256
#define MAX_CHANNELS		32

class SoundManager
{
public:
	// Backend state, maintained by the owner during acquisition and teardown.
	bool mInitialized = false;

	SoundManager() {}
	virtual ~SoundManager() {}

	virtual bool			LoadSound(unsigned int theSfxID, const std::string& theFilename) = 0;
	virtual int				LoadSound(const std::string& theFilename) = 0;
	virtual void			ReleaseSound(unsigned int theSfxID) = 0;

	virtual void			SetVolume(double theVolume) = 0;
	virtual bool			SetBaseVolume(unsigned int theSfxID, double theBaseVolume) = 0;
	virtual bool			SetBasePan(unsigned int theSfxID, int theBasePan) = 0;	

	virtual SoundInstance*	GetSoundInstance(unsigned int theSfxID) = 0;

	virtual void			ReleaseSounds() = 0;
	virtual void			ReleaseChannels() = 0;


	virtual void			Flush() = 0;
	virtual void			SetCooperativeWindow(NativeWindowHandle theHWnd) = 0;
	virtual void			StopAllSounds() = 0;
	virtual int				GetFreeSoundId() = 0;
	virtual int				GetNumSounds() = 0;

};


}

