#pragma once
#include "dsoundversion.h"
#include "sound/SoundManager.h"

namespace Sexy
{

class DSoundInstance;

class DSoundManager : public SoundManager
{
	friend class DSoundInstance;
	friend class DSoundMusicInterface;

protected:
	LPDIRECTSOUNDBUFFER		mSourceSounds[MAX_SOURCE_SOUNDS];
	std::string				mSourceFileNames[MAX_SOURCE_SOUNDS];
	LPDIRECTSOUNDBUFFER		mPrimaryBuffer;
	unsigned int					mSourceDataSizes[MAX_SOURCE_SOUNDS];
	double					mBaseVolumes[MAX_SOURCE_SOUNDS];
	int						mBasePans[MAX_SOURCE_SOUNDS];
	DSoundInstance*			mPlayingSounds[MAX_CHANNELS];	
	double					mMasterVolume;
	DWORD					mLastReleaseTick;

protected:
	int						FindFreeChannel();
	int						VolumeToDB(double theVolume);
	bool					LoadOGGSound(unsigned int theSfxID, const std::string& theFilename);
	bool					LoadWAVSound(unsigned int theSfxID, const std::string& theFilename);
	bool					LoadAUSound(unsigned int theSfxID, const std::string& theFilename);
	void					ReleaseFreeChannels();

public:
	LPDIRECTSOUND			mDirectSound;

	explicit DSoundManager(NativeWindowHandle theHWnd);
	virtual ~DSoundManager();

	virtual bool			LoadSound(unsigned int theSfxID, const std::string& theFilename);
	virtual int				LoadSound(const std::string& theFilename);
	virtual void			ReleaseSound(unsigned int theSfxID);	

	virtual void			SetVolume(double theVolume);
	virtual bool			SetBaseVolume(unsigned int theSfxID, double theBaseVolume);
	virtual bool			SetBasePan(unsigned int theSfxID, int theBasePan);

	virtual SoundInstance*	GetSoundInstance(unsigned int theSfxID);

	virtual void			ReleaseSounds();
	virtual void			ReleaseChannels();		


	virtual void			Flush();

	virtual void			SetCooperativeWindow(NativeWindowHandle theHWnd);
	virtual void			StopAllSounds();
	virtual int				GetFreeSoundId();
	virtual int				GetNumSounds();
};

}

