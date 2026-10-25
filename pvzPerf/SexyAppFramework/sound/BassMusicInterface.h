#pragma once
#include "MusicInterface.h"
#include "platform/MusicPlayback.h"
#include <atomic>
#include "bass.h"
#include <mutex>
#include <memory>
#include <vector>

namespace Sexy
{

class SexyAppBase;

class BassMusicInfo
{
public:
	HMUSIC					mHMusic;
	HSTREAM					mHStream;
	double					mVolume;
	double					mVolumeCap;
	double					mFadeOrigin;
	double					mFadeTarget;
	std::uint64_t			mFadeElapsedNs;
	std::uint64_t			mFadeDurationNs;
	bool					mStopOnFade;
	std::unique_ptr<char[]> mStreamData;
	NativeMusicPlayback mPlayback;

public:
	BassMusicInfo();
	// Frees the BASS handle and stream buffer when the owning slot is
	// cleared (UnloadMusic/UnloadAllMusic) or the interface dies.
	~BassMusicInfo();
	BassMusicInfo(const BassMusicInfo&) = delete;
	BassMusicInfo& operator=(const BassMusicInfo&) = delete;
	BassMusicInfo& operator=(BassMusicInfo&&) = delete;

	DWORD GetHandle() { return mHMusic?mHMusic:mHStream; }
};

class BassMusicInterface : public MusicInterface
{
public:
	// Slot capacity equals MusicFile::NUM_MUSIC_FILES (Lawn/System/Music.h).
	// The sound framework cannot include game headers, so the numeric bound
	// lives here; Music.cpp static_asserts it stays in lockstep with the enum.
	// Slot 0 stays empty: MusicFile values start at 1.
	static constexpr int kMusicSlotCount = 5;

	// Songs keyed by their MusicFile id. Null slot = not loaded; clearing a
	// slot destroys the entry and frees its BASS handle.
	std::vector<std::unique_ptr<BassMusicInfo>> mMusicSlots;
	// OpenAL 总音量必须同步到已创建的声源，包括加载线程启动前的标题曲。
	std::atomic<unsigned int> mGainReadySlots{0};
	// 其余槽由加载线程装载；全表完成后发布，保留原有播放控制准入。
	std::atomic<bool> mSlotsPublished{false};
	int						mMaxMusicVolume;
	int						mMusicLoadFlags;

public:
	BassMusicInterface(NativeWindowHandle theHWnd);
	virtual ~BassMusicInterface();

	virtual bool			LoadMusic(int theSongId, const std::string& theFileName);
	// 装载线程专用：全部曲目装载完成后调用，发布槽位（此后禁止再写入）。
	void				PublishSlots();
	virtual void			PlayMusic(int theSongId, int theOffset = 0, bool noLoop = false);
	virtual void			StopMusic(int theSongId);
	virtual void			StopAllMusic();		
	virtual void			UnloadMusic(int theSongId);
	virtual void			UnloadAllMusic();
	virtual void			PauseAllMusic();
	virtual void			ResumeAllMusic();
	virtual void			PauseMusic(int theSongId);
	virtual void			ResumeMusic(int theSongId);	
	virtual void			FadeIn(int theSongId, int theOffset = -1, double theSpeed = 0.002, bool noLoop = false);
	virtual void			FadeOut(int theSongId, bool stopSong = true, double theSpeed = 0.004);
	virtual void			FadeOutAll(bool stopSong = true, double theSpeed = 0.004);
	virtual void			SetSongVolume(int theSongId, double theVolume);
	virtual void			SetSongMaxVolume(int theSongId, double theMaxVolume);
	virtual bool			IsPlaying(int theSongId);

	virtual void			SetVolume(double theVolume);
	virtual void			SetMusicAmplify(int theSongId, double theAmp); // default is 0.50
	virtual void			Update();

	// True once LoadMusic published a song for theSongId (bounded by the
	// MusicFile key domain; anything else is reported as not loaded).
	bool					IsMusicLoaded(int theSongId);

	// functions for dealing with MODs
	int						GetMusicOrder(int theSongId);

private:
	bool					SlotIndexValid(int theSongId) const
	{
		return theSongId >= 0 && theSongId < static_cast<int>(mMusicSlots.size());
	}
};

}

