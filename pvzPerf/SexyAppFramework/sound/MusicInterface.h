#pragma once
#include "Common.h"

namespace Sexy
{

class MusicInterface
{
public:
	MusicInterface() {}
	virtual ~MusicInterface() {}

	virtual bool			LoadMusic(int theSongId, const std::string& theFileName) = 0;
	virtual void			PlayMusic(int theSongId, int theOffset = 0, bool noLoop = false) = 0;
	virtual void			StopMusic(int theSongId) = 0;
	virtual void			PauseMusic(int theSongId) = 0;
	virtual void			ResumeMusic(int theSongId) = 0;
	virtual void			StopAllMusic() = 0;

	virtual void			UnloadMusic(int theSongId) = 0;
	virtual void			UnloadAllMusic() = 0;
	virtual void			PauseAllMusic() = 0;
	virtual void			ResumeAllMusic() = 0;
	
	virtual void			FadeIn(int theSongId, int theOffset = -1, float theSpeed = 0.002f, bool noLoop = false) = 0;
	virtual void			FadeOut(int theSongId, bool stopSong = true, float theSpeed = 0.004f) = 0;
	virtual void			FadeOutAll(bool stopSong = true, float theSpeed = 0.004f) = 0;
	virtual void			SetSongVolume(int theSongId, float theVolume) = 0;
	virtual void			SetSongMaxVolume(int theSongId, float theMaxVolume) = 0;
	virtual bool			IsPlaying(int theSongId) = 0;
	
	virtual void			SetVolume(float theVolume) = 0;
	virtual void			SetMusicAmplify(int theSongId, float theAmp) = 0;
	virtual void			Update() = 0;
};
}

