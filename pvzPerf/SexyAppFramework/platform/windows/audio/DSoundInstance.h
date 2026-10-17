#pragma once
#include "sound/SoundInstance.h"
#include "dsoundversion.h"
#include <stdexcept>

namespace Sexy
{

class DSoundManager;

class DSoundInstance : public SoundInstance
{
	friend class DSoundManager;

protected:
	DSoundManager*			mSoundManagerP;
	LPDIRECTSOUNDBUFFER		mSourceSoundBuffer;
	LPDIRECTSOUNDBUFFER		mSoundBuffer;
	bool					mAutoRelease;
	bool					mHasPlayed;
	bool					mReleased;

	int						mBasePan;
	double					mBaseVolume;

	int						mPan;
	double					mVolume;	

	DWORD					mDefaultFrequency;

protected:
	void					RehupVolume();
	void					RehupPan();

public:
	DSoundInstance(DSoundManager* theSoundManager, LPDIRECTSOUNDBUFFER theSourceSound);
	virtual ~DSoundInstance();	
	virtual void			Release();
	
	virtual void			SetBaseVolume(double theBaseVolume);
	virtual void			SetBasePan(int theBasePan);

	virtual void			SetVolume(double theVolume); 
	virtual void			SetPan(int thePosition); //-hundredth db to +hundredth db = left to right	
	virtual void			AdjustPitch(double theNumSteps);

	virtual bool			Play(bool looping, bool autoRelease);
	virtual void			Stop();
	virtual bool			IsPlaying();
	virtual bool			IsReleased();
	inline int GetSoundPosition()
	{
		DWORD position;
		if (FAILED(mSoundBuffer->GetCurrentPosition(&position, nullptr)))
			throw std::runtime_error("DirectSound playback position query failed");
		return static_cast<int>(position);
	}
	inline void SetSoundPosition(int position)
	{
		if (FAILED(mSoundBuffer->SetCurrentPosition(position)))
			throw std::runtime_error("DirectSound playback seek failed");
	}
	inline void PausePlayback(int& offset)
	{
		offset = mSoundBuffer ? GetSoundPosition() : 0;
		DSoundInstance::Stop();
	}
	inline void ResumePlayback(int offset, bool looping)
	{
		DSoundInstance::Play(looping, false);
		if (mSoundBuffer)
			SetSoundPosition(offset);
	}

};

}
