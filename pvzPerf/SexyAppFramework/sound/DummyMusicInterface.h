#include "MusicInterface.h"
#include "SexyAppBase.h"

using namespace Sexy;

class DummyMusicInterface : public MusicInterface
{
public:
	DummyMusicInterface() {}
	virtual ~DummyMusicInterface() {};

	virtual bool			LoadMusic(int, const std::string&){return false;}
	virtual void 			PlayMusic(int, int, bool){}
	virtual void 			StopMusic(int){}
	virtual void 			PauseMusic(int){}
	virtual void 			ResumeMusic(int){}
	virtual void 			StopAllMusic(){}
	virtual void 			UnloadMusic(int){}
	virtual void 			UnloadAllMusic(){}
	virtual void 			PauseAllMusic(){}
	virtual void 			ResumeAllMusic(){}
	virtual void 			FadeIn(int, int, float, bool){}
	virtual void 			FadeOut(int, bool, float){}
	virtual void 			FadeOutAll(bool, float){}
	virtual void 			SetSongVolume(int, float){}
	virtual void 			SetSongMaxVolume(int, float){}
	virtual bool			IsPlaying(int){return false;};
	
	virtual void			SetVolume(float){}
	virtual void			SetMusicAmplify(int, float){}
	virtual void			Update(){}
};
