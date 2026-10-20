#pragma once
#include "misc/TimeCounter.h"
#include <atomic>
#include <string>
#include "sound/bass.h"

class LawnApp;
namespace Sexy
{
	class MusicInterface;
};

enum MusicTune
{
	MUSIC_TUNE_NONE = -1,
	MUSIC_TUNE_DAY_GRASSWALK = 1,				// 白天草地关卡
	MUSIC_TUNE_NIGHT_MOONGRAINS,				// 黑夜草地关卡
	MUSIC_TUNE_POOL_WATERYGRAVES,				// 白天泳池关卡
	MUSIC_TUNE_FOG_RIGORMORMIST,				// 黑夜泳池关卡
	MUSIC_TUNE_ROOF_GRAZETHEROOF,				// 屋顶关卡
	MUSIC_TUNE_CHOOSE_YOUR_SEEDS,				// 选卡界面/小游戏界面
	MUSIC_TUNE_TITLE_CRAZY_DAVE_MAIN_THEME,		// 主菜单
	MUSIC_TUNE_ZEN_GARDEN,						// 禅境花园
	MUSIC_TUNE_PUZZLE_CEREBRAWL,				// 解谜模式
	MUSIC_TUNE_MINIGAME_LOONBOON,				// 小游戏
	MUSIC_TUNE_CONVEYER,						// 传送带关卡
	MUSIC_TUNE_FINAL_BOSS_BRAINIAC_MANIAC,		// 僵王博士关卡
	MUSIC_TUNE_CREDITS_ZOMBIES_ON_YOUR_LAWN,	// MV
	NUM_MUSIC_TUNES
};

enum MusicFile
{
	MUSIC_FILE_NONE = -1,
	MUSIC_FILE_MAIN_MUSIC = 1,
	MUSIC_FILE_DRUMS,
	MUSIC_FILE_HIHATS,
	MUSIC_FILE_CREDITS_ZOMBIES_ON_YOUR_LAWN,
	NUM_MUSIC_FILES
};

enum MusicBurstState
{
	MUSIC_BURST_OFF,
	MUSIC_BURST_STARTING,
	MUSIC_BURST_ON,
	MUSIC_BURST_FINISHING
};

enum MusicDrumsState
{
	MUSIC_DRUMS_OFF,
	MUSIC_DRUMS_ON_QUEUED,
	MUSIC_DRUMS_ON,
	MUSIC_DRUMS_OFF_QUEUED,
	MUSIC_DRUMS_FADING
};

class Music
{
public:
	LawnApp*					mApp;								//+0x0
	Sexy::MusicInterface*		mMusicInterface;					//+0x4
	MusicTune					mCurMusicTune;						//+0x8
	MusicFile					mCurMusicFileMain;					//+0xC
	MusicFile					mCurMusicFileDrums;					//+0x10
	MusicFile					mCurMusicFileHihats;				//+0x14
	int							mBurstOverride;						//+0x18
	// 1073/BASS 2.2 stores these module attributes as signed 32-bit integers.
	// BASS 2.4's float-only API is adapted at the call boundary in Music.cpp.
	int							mBaseBPM;							//+0x1C
	int							mBaseModSpeed;						//+0x20
	MusicBurstState				mMusicBurstState;					//+0x24
	Sexy::TimeCounter							mBurstStateCounter;					//+0x28
	MusicDrumsState				mMusicDrumsState;					//+0x2C
	int							mQueuedDrumTrackPackedOrder;		//+0x30
	Sexy::TimeCounter							mDrumsStateCounter;					//+0x34
	int							mPauseOffset;						//+0x38
	int							mPauseOffsetDrums;					//+0x3C
	bool						mPaused;							//+0x40
	mutable bool				mMusicDisabled;						//+0x41
	Sexy::TimeCounter							mFadeOutCounter;					//+0x44
	int							mFadeOutDuration;					//+0x48

public:
	Music();

	// Keep the bool/wire layout. Only the disable flag crosses the loader/main
	// boundary; map publication has its own mutex. Raw save copies require the
	// loader to have finished, just like the rest of Music's state.
	bool IsMusicDisabled() const noexcept
	{
		static_assert(std::atomic_ref<bool>::is_always_lock_free);
		static_assert(std::atomic_ref<bool>::required_alignment <= alignof(bool));
		return std::atomic_ref<bool>(mMusicDisabled).load(std::memory_order_relaxed);
	}
	void SetMusicDisabled(bool theDisabled) noexcept
	{
		static_assert(std::atomic_ref<bool>::is_always_lock_free);
		static_assert(std::atomic_ref<bool>::required_alignment <= alignof(bool));
		std::atomic_ref<bool>(mMusicDisabled).store(theDisabled, std::memory_order_relaxed);
	}

	void						MusicInit();
	void						MusicDispose() { ; }
	void						MusicUpdate();
	void						StopAllMusic();
	/*inline*/ void				PlayMusic(MusicTune theMusicTune, int theOffset = -1, int theDrumsOffset = -1);
	/*inline*/ HMUSIC			GetBassMusicHandle(MusicFile theMusicFile);
	void						StartGameMusic();
	/*inline*/ void				LoadSong(MusicFile theMusicFile, const std::string& theFileName);
	void						MusicResync();
	void						UpdateMusicBurst();
	/*inline*/ void				StartBurst();
	void						GameMusicPause(bool thePause);
	void						PlayFromOffset(MusicFile theMusicFile, int theOffset, double theVolume);
	void						MusicResyncChannel(MusicFile theMusicFileToMatch, MusicFile theMusicFileToSync);
	bool						TodLoadMusic(MusicFile theMusicFile, const std::string& theFileName);
	void						MusicTitleScreenInit();
	/*inline*/ void				MakeSureMusicIsPlaying(MusicTune theMusicTune);
	/*inline*/ void				FadeOut(int theFadeOutDuration);
	void						SetupMusicFileForTune(MusicFile theMusicFile, MusicTune theMusicTune);
	unsigned int				GetMusicOrder(MusicFile theMusicFile);
	void						MusicCreditScreenInit();
	int							GetNumLoadingTasks();
};

#
