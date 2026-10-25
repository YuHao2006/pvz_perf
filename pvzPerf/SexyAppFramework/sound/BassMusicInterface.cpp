#include "BassMusicInterface.h"
#include "SexyAppFramework/Common.h"
#include "BassLoader.h"
#include "Sexy.TodLib/TodDebug.h"
#include "paklib/PakInterface.h"
#include <cstddef>
#include <csignal>
#include <stdexcept>
#include <utility>

using namespace Sexy;

// 只对接 BASS 2.4。旧的 mVersion2 双版本分支（BASS 2.2 检测）已被移除：
// 版本检测被注释后恒为 false，实际永远走错分支；当前 bass.dll 是 2.4，
// 全部签名/单位按 2.4 语义（float 音量、带 mode 定位）直接对接。

#define BASS_CONFIG_BUFFER			0

namespace
{

// Per-tick fade math for every loaded song. Only entries with an active
// fade (mVolumeAdd != 0) touch the channel.
void ApplyVolumeFade(BassMusicInfo* aMusicInfo)
{
	if (aMusicInfo->mVolumeAdd == 0.0)
		return;

	aMusicInfo->mFadeElapsedNs = std::min<std::uint64_t>(
		aMusicInfo->mFadeDurationNs,
		aMusicInfo->mFadeElapsedNs + Sexy::gUpdateIntervalNs);
	const double fraction = aMusicInfo->mFadeDurationNs == 0 ? 1.0 :
		double(aMusicInfo->mFadeElapsedNs) / double(aMusicInfo->mFadeDurationNs);
	aMusicInfo->mVolume = aMusicInfo->mFadeOrigin +
		(aMusicInfo->mFadeTarget - aMusicInfo->mFadeOrigin) * fraction;

	if (fraction >= 1.0)
	{
		aMusicInfo->mVolume = aMusicInfo->mFadeTarget;
		aMusicInfo->mVolumeAdd = 0.0;
		if (aMusicInfo->mVolume <= 0.0 && aMusicInfo->mStopOnFade)
			aMusicInfo->mPlayback.Stop();
	}
	else if (aMusicInfo->mFadeTarget > aMusicInfo->mFadeOrigin &&
		aMusicInfo->mVolume >= aMusicInfo->mVolumeCap)
	{
		aMusicInfo->mVolume = aMusicInfo->mVolumeCap;
		aMusicInfo->mVolumeAdd = 0.0;
	}
	else if (aMusicInfo->mFadeTarget < aMusicInfo->mFadeOrigin &&
		aMusicInfo->mVolume <= 0.0)
	{
		aMusicInfo->mVolume = 0.0;
		aMusicInfo->mVolumeAdd = 0.0;

		if (aMusicInfo->mStopOnFade)
			aMusicInfo->mPlayback.Stop();
	}

	aMusicInfo->mPlayback.SetGain(aMusicInfo->mVolume);
}

}

BassMusicInfo::BassMusicInfo()
{	
	mVolume = 0.0;
	mVolumeAdd = 0.0;
	mVolumeCap = 1.0;
	mFadeOrigin = 0.0;
	mFadeTarget = 0.0;
	mFadeElapsedNs = 0;
	mFadeDurationNs = 0;
	mStopOnFade = false;
	mHMusic = 0;
	mHStream = 0;
}

BassMusicInfo::~BassMusicInfo()
{
	mPlayback.Close();
	// Free the decoder BEFORE mStreamData's member destructor frees its input.
	if (mHStream)
		gBass->BASS_StreamFree(mHStream);
	else if (mHMusic)
		gBass->BASS_MusicFree(mHMusic);
}

BassMusicInterface::BassMusicInterface(NativeWindowHandle theHWnd)
{
	mMusicSlots.resize(static_cast<size_t>(kMusicSlotCount));

	LoadBassDLL();

	// Only initialize our playback engine. Never read/write the Windows mixer
	// as an initialization workaround; failed reads formerly wrote uninitialized
	// volume data back to a system control. Game volume uses GVOL_* below.
#ifdef _WIN32
	bool initialized = false;
#endif
	try
	{
#ifdef _WIN32
		if (!NativeMusicPlayback::OpenOutput(theHWnd))
			throw std::runtime_error("BASS_Init failed: " + std::to_string(gBass->BASS_ErrorGetCode()));
		initialized = true;
#else
		(void)theHWnd; // LoadBassDLL owns the shared native output device.
#endif
		if (!gBass->BASS_SetConfig(BASS_CONFIG_BUFFER, 2000))
			throw std::runtime_error("BASS_CONFIG_BUFFER failed: " + std::to_string(gBass->BASS_ErrorGetCode()));
		// BASS_Init already starts output; no extra BASS_Start is required.
	}
	catch (...)
	{
#ifdef _WIN32
		if (initialized) NativeMusicPlayback::CloseOutput();
#endif
		FreeBassDLL();
		throw;
	}

	mMaxMusicVolume = 40;

	mMusicLoadFlags = BASS_MUSIC_LOOP | BASS_MUSIC_RAMP;
#ifndef _WIN32
	mMusicLoadFlags |= BASS_MUSIC_DECODE;
#endif
}

BassMusicInterface::~BassMusicInterface()
{
	UnloadAllMusic(); // Destroy handles and input buffers while BASS is still loaded.
#ifdef _WIN32
	NativeMusicPlayback::CloseOutput();
#endif
	FreeBassDLL();
}

void BassMusicInterface::PublishSlots()
{
	// release 发布：与主线程的 acquire 配对，建立槽位内容的 happens-before。
	mSlotsPublished.store(true, std::memory_order_release);
}

bool BassMusicInterface::LoadMusic(int theSongId, const std::string& theFileName)
{
	// 标题曲先由主线程加载，其余槽由加载线程独占；全表发布后禁止装载。
	if (mSlotsPublished.load(std::memory_order_acquire))
	{
		TodLog("BassMusicInterface::LoadMusic after PublishSlots: the music table is immutable once published.");
		std::abort();
	}
	if (!SlotIndexValid(theSongId) || mMusicSlots[theSongId])
		return false; // Never replace a playing song or report a rejected insert as success.
#ifdef _WIN32
	// BASS selects its device per thread. The title loads on the main thread,
	// but MusicInit loads the other layers on a fresh worker, whose default is
	// the silent decoding device 0. Bind every playback channel to the same output
	// used by OpenOutput before creating either a module or a stream.
	if (!gBass->BASS_SetDevice(NativeMusicPlayback::OutputDevice))
		throw std::runtime_error("BASS music output device selection failed: " +
			std::to_string(gBass->BASS_ErrorGetCode()));
#endif
	std::string anExt;
	const size_t aDot = theFileName.find_last_of('.');
	if (aDot != std::string::npos)
		anExt = StringToLower(theFileName.substr(aDot + 1));

	std::unique_ptr<PFILE, decltype(&p_fclose)> aFile(p_fopen(theFileName.c_str(), "rb"), &p_fclose);
	if (!aFile || p_fseek(aFile.get(), 0, SEEK_END) != 0)
		return false;
	const int aSize = p_ftell(aFile.get());
	if (aSize <= 0 || p_fseek(aFile.get(), 0, SEEK_SET) != 0)
		return false;
	auto aData = std::make_unique_for_overwrite<char[]>(static_cast<size_t>(aSize));
	if (p_fread(aData.get(), 1, aSize, aFile.get()) != static_cast<size_t>(aSize))
		return false;
	aFile.reset();

	auto aSong = std::make_unique<BassMusicInfo>();
	auto& aMusicInfo = *aSong;
	if (anExt == "wav" || anExt == "ogg" || anExt == "mp3")
	{
		// BASS reads this memory for the stream's entire lifetime. Keep it with
		// the handle, including failures while registering the completed song.
		aMusicInfo.mStreamData = std::move(aData);
		aMusicInfo.mHStream = gBass->BASS_StreamCreateFile(TRUE,
			aMusicInfo.mStreamData.get(), 0, aSize,
#ifdef _WIN32
			0);
#else
			BASS_STREAM_DECODE);
#endif
	}
	else
	{
		aMusicInfo.mHMusic = gBass->BASS_MusicLoad(TRUE, aData.get(), 0, aSize, mMusicLoadFlags, 0);
		aData.reset(); // MOD loading finishes reading the source before returning.
	}
	if (aMusicInfo.GetHandle() == 0)
		return false;

	// Callback userdata must point at the final, immovable slot object.
	aMusicInfo.mPlayback.Initialize(aMusicInfo.GetHandle(), aMusicInfo.mHMusic != 0);
	mMusicSlots[theSongId] = std::move(aSong);
	if constexpr (NativeMusicPlayback::PerVoiceMasterGain)
		mGainReadySlots.fetch_or(1u << theSongId, std::memory_order_release);
	return true;
}

void BassMusicInterface::PlayMusic(int theSongId, int theOffset, bool noLoop)
{
	// 主线程入口：装载发布前槽位未就绪，安全 no-op（零锁——发布后不可变）。
	if (!mSlotsPublished.load(std::memory_order_acquire))
		return;
	if (!SlotIndexValid(theSongId))
		return;
	BassMusicInfo* aMusicInfo = mMusicSlots[theSongId].get();
	if (aMusicInfo != nullptr)
	{
		aMusicInfo->mVolume = aMusicInfo->mVolumeCap;
		aMusicInfo->mVolumeAdd = 0.0;
		aMusicInfo->mFadeElapsedNs = 0;
		aMusicInfo->mFadeDurationNs = 0;
		aMusicInfo->mStopOnFade = noLoop;
		aMusicInfo->mPlayback.SetGain(aMusicInfo->mVolume);
		aMusicInfo->mPlayback.Stop();
		if (aMusicInfo->mHMusic)
		{
			gBass->BASS_ChannelFlags(aMusicInfo->mHMusic,
				BASS_MUSIC_POSRESET | BASS_MUSIC_RAMP | (noLoop ? 0 : BASS_MUSIC_LOOP),
				BASS_MUSIC_POSRESET | BASS_MUSIC_RAMP | BASS_MUSIC_LOOP);
			if (!aMusicInfo->mPlayback.Seek(static_cast<unsigned int>(theOffset), BASS_POS_MUSIC_ORDER))
				throw std::runtime_error("Music order seek failed");
			aMusicInfo->mPlayback.Play(false);
		}
		else
		{
			gBass->BASS_ChannelFlags(aMusicInfo->mHStream, noLoop ? 0 : BASS_SAMPLE_LOOP, BASS_SAMPLE_LOOP);
			if (theOffset >= 0 && !aMusicInfo->mPlayback.Seek(theOffset, BASS_POS_BYTE))
				throw std::runtime_error("Music stream seek failed");
			aMusicInfo->mPlayback.Play(false);
		}
	}
}

void BassMusicInterface::StopMusic(int theSongId)
{
	// 主线程入口：装载发布前槽位未就绪，安全 no-op（零锁——发布后不可变）。
	if (!mSlotsPublished.load(std::memory_order_acquire))
		return;
	if (!SlotIndexValid(theSongId))
		return;
	BassMusicInfo* aMusicInfo = mMusicSlots[theSongId].get();
	if (aMusicInfo != nullptr)
	{
		aMusicInfo->mVolume = 0.0;
		aMusicInfo->mVolumeAdd = 0.0;
		aMusicInfo->mFadeElapsedNs = 0;
		aMusicInfo->mFadeDurationNs = 0;
		aMusicInfo->mPlayback.Stop();
	}
}

void BassMusicInterface::StopAllMusic()
{
	// 主线程入口：装载发布前槽位未就绪，安全 no-op（零锁——发布后不可变）。
	if (!mSlotsPublished.load(std::memory_order_acquire))
		return;
	for (const std::unique_ptr<BassMusicInfo>& aSlot : mMusicSlots)
	{
		if (!aSlot)
			continue;
		BassMusicInfo* aMusicInfo = aSlot.get();
		aMusicInfo->mVolume = 0.0;
		aMusicInfo->mPlayback.Stop();
	}
}

void BassMusicInterface::UnloadMusic(int theSongId)
{
	if (!SlotIndexValid(theSongId))
		return;
	// Simple ownership: stop the channel, then drop the entry. Destroying it
	// frees the BASS handle right here while BASS is still loaded.
	StopMusic(theSongId);
	if constexpr (NativeMusicPlayback::PerVoiceMasterGain)
		mGainReadySlots.fetch_and(~(1u << theSongId), std::memory_order_release);
	mMusicSlots[theSongId] = nullptr;
}

void BassMusicInterface::UnloadAllMusic()
{
	StopAllMusic();
	if constexpr (NativeMusicPlayback::PerVoiceMasterGain)
		mGainReadySlots.store(0, std::memory_order_release);
	// Every handle must be released here while BASS is still loaded (this is
	// also the destructor path before BASS_Free/FreeBassDLL).
	for (std::unique_ptr<BassMusicInfo>& aSlot : mMusicSlots)
		aSlot = nullptr;
}

void BassMusicInterface::PauseMusic(int theSongId)
{
	// 主线程入口：装载发布前槽位未就绪，安全 no-op（零锁——发布后不可变）。
	if (!mSlotsPublished.load(std::memory_order_acquire))
		return;
	if (!SlotIndexValid(theSongId))
		return;
	BassMusicInfo* aMusicInfo = mMusicSlots[theSongId].get();
	if (aMusicInfo != nullptr)
	{
		aMusicInfo->mPlayback.Pause();
	}
}

void BassMusicInterface::PauseAllMusic()
{
	// 主线程入口：装载发布前槽位未就绪，安全 no-op（零锁——发布后不可变）。
	if (!mSlotsPublished.load(std::memory_order_acquire))
		return;
	for (const std::unique_ptr<BassMusicInfo>& aSlot : mMusicSlots)
	{
		if (!aSlot)
			continue;
		BassMusicInfo* aMusicInfo = aSlot.get();
		if (aMusicInfo->mPlayback.State() == BASS_ACTIVE_PLAYING)
			aMusicInfo->mPlayback.Pause();
	}
}

void BassMusicInterface::ResumeAllMusic()
{
	// 主线程入口：装载发布前槽位未就绪，安全 no-op（零锁——发布后不可变）。
	if (!mSlotsPublished.load(std::memory_order_acquire))
		return;
	for (const std::unique_ptr<BassMusicInfo>& aSlot : mMusicSlots)
	{
		if (!aSlot)
			continue;
		BassMusicInfo* aMusicInfo = aSlot.get();

		if (aMusicInfo->mPlayback.State() == BASS_ACTIVE_PAUSED)
			aMusicInfo->mPlayback.Resume();
	}
}

void BassMusicInterface::ResumeMusic(int theSongId)
{
	// 主线程入口：装载发布前槽位未就绪，安全 no-op（零锁——发布后不可变）。
	if (!mSlotsPublished.load(std::memory_order_acquire))
		return;
	if (!SlotIndexValid(theSongId))
		return;
	BassMusicInfo* aMusicInfo = mMusicSlots[theSongId].get();
	if (aMusicInfo != nullptr)
	{
		aMusicInfo->mPlayback.Resume();
	}
}

void BassMusicInterface::FadeIn(int theSongId, int theOffset, double theSpeed, bool noLoop)
{
	// 主线程入口：装载发布前槽位未就绪，安全 no-op（零锁——发布后不可变）。
	if (!mSlotsPublished.load(std::memory_order_acquire))
		return;
	if (!SlotIndexValid(theSongId))
		return;
	BassMusicInfo* aMusicInfo = mMusicSlots[theSongId].get();
	if (aMusicInfo != nullptr)
	{
		aMusicInfo->mFadeOrigin = aMusicInfo->mVolume;
		aMusicInfo->mFadeTarget = aMusicInfo->mVolumeCap;
		aMusicInfo->mFadeElapsedNs = 0;
		aMusicInfo->mFadeDurationNs = theSpeed > 0.0
			? static_cast<std::uint64_t>(std::ceil(
				std::max(0.0, aMusicInfo->mFadeTarget - aMusicInfo->mFadeOrigin) /
				theSpeed * 10'000'000.0))
			: 0;
		aMusicInfo->mVolumeAdd = theSpeed > 0.0 ? theSpeed : 0.0;
		aMusicInfo->mStopOnFade = noLoop;

		aMusicInfo->mPlayback.Stop();
		aMusicInfo->mPlayback.SetGain(aMusicInfo->mVolume);
		if (aMusicInfo->mHMusic)
		{
			if (theOffset == -1)
				aMusicInfo->mPlayback.Play(true);
			else
			{
				gBass->BASS_ChannelFlags(aMusicInfo->mHMusic,
					BASS_MUSIC_RAMP | (noLoop ? 0 : BASS_MUSIC_LOOP),
					BASS_MUSIC_RAMP | BASS_MUSIC_LOOP);
				if (!aMusicInfo->mPlayback.Seek(static_cast<unsigned int>(theOffset), BASS_POS_MUSIC_ORDER))
					throw std::runtime_error("Music fade-in seek failed");
				aMusicInfo->mPlayback.Play(false);
			}
		}
		else
		{
			gBass->BASS_ChannelFlags(aMusicInfo->mHStream, noLoop ? 0 : BASS_SAMPLE_LOOP, BASS_SAMPLE_LOOP);
			if (theOffset >= 0 && !aMusicInfo->mPlayback.Seek(theOffset, BASS_POS_BYTE))
				throw std::runtime_error("Music stream fade-in seek failed");
			aMusicInfo->mPlayback.Play(false);
		}

	}
}

void BassMusicInterface::FadeOut(int theSongId, bool stopSong, double theSpeed)
{
	// 主线程入口：装载发布前槽位未就绪，安全 no-op（零锁——发布后不可变）。
	if (!mSlotsPublished.load(std::memory_order_acquire))
		return;
	if (!SlotIndexValid(theSongId))
		return;
	BassMusicInfo* aMusicInfo = mMusicSlots[theSongId].get();
	if (aMusicInfo != nullptr)
	{		
		if (aMusicInfo->mVolume != 0.0)
		{
			aMusicInfo->mFadeOrigin = aMusicInfo->mVolume;
			aMusicInfo->mFadeTarget = 0.0;
			aMusicInfo->mFadeElapsedNs = 0;
			aMusicInfo->mFadeDurationNs = theSpeed > 0.0
				? static_cast<std::uint64_t>(std::ceil(
					aMusicInfo->mFadeOrigin / theSpeed * 10'000'000.0))
				: 0;
			aMusicInfo->mVolumeAdd = theSpeed > 0.0 ? -theSpeed : 0.0;
		}

		aMusicInfo->mStopOnFade = stopSong;
	}
}

void BassMusicInterface::FadeOutAll(bool stopSong, double theSpeed)
{
	// 主线程入口：装载发布前槽位未就绪，安全 no-op（零锁——发布后不可变）。
	if (!mSlotsPublished.load(std::memory_order_acquire))
		return;
	for (const std::unique_ptr<BassMusicInfo>& aSlot : mMusicSlots)
	{
		if (!aSlot)
			continue;
		BassMusicInfo* aMusicInfo = aSlot.get();
				
		aMusicInfo->mFadeOrigin = aMusicInfo->mVolume;
		aMusicInfo->mFadeTarget = 0.0;
		aMusicInfo->mFadeElapsedNs = 0;
		aMusicInfo->mFadeDurationNs = theSpeed > 0.0
			? static_cast<std::uint64_t>(std::ceil(
				aMusicInfo->mFadeOrigin / theSpeed * 10'000'000.0))
			: 0;
		aMusicInfo->mVolumeAdd = theSpeed > 0.0 ? -theSpeed : 0.0;
		aMusicInfo->mStopOnFade = stopSong;
	}
}

void BassMusicInterface::SetVolume(double theVolume)
{
	// Ready voices own stable slots even while other songs are still loading.
	NativeMusicPlayback::SetMasterGain(theVolume);
	if constexpr (NativeMusicPlayback::PerVoiceMasterGain)
	{
		const auto ready = mGainReadySlots.load(std::memory_order_acquire);
		for (int slot = 0; slot < kMusicSlotCount; ++slot)
			if (ready & (1u << slot))
				mMusicSlots[slot]->mPlayback.SetGain(mMusicSlots[slot]->mVolume);
	}
}

void BassMusicInterface::SetSongVolume(int theSongId, double theVolume)
{
	// 主线程入口：装载发布前槽位未就绪，安全 no-op（零锁——发布后不可变）。
	if (!mSlotsPublished.load(std::memory_order_acquire))
		return;
	if (!SlotIndexValid(theSongId))
		return;
	BassMusicInfo* aMusicInfo = mMusicSlots[theSongId].get();
	if (aMusicInfo != nullptr)
	{		
		aMusicInfo->mVolume = theVolume;
		aMusicInfo->mPlayback.SetGain(aMusicInfo->mVolume);
	}
}

void BassMusicInterface::SetSongMaxVolume(int theSongId, double theMaxVolume)
{
	// 主线程入口：装载发布前槽位未就绪，安全 no-op（零锁——发布后不可变）。
	if (!mSlotsPublished.load(std::memory_order_acquire))
		return;
	if (!SlotIndexValid(theSongId))
		return;
	BassMusicInfo* aMusicInfo = mMusicSlots[theSongId].get();
	if (aMusicInfo != nullptr)
	{		
		aMusicInfo->mVolumeCap = theMaxVolume;
		aMusicInfo->mVolume = std::min(aMusicInfo->mVolume, theMaxVolume);
		aMusicInfo->mPlayback.SetGain(aMusicInfo->mVolume);
	}
}

bool BassMusicInterface::IsPlaying(int theSongId)
{
	// 主线程入口：装载发布前槽位未就绪，安全 no-op（零锁——发布后不可变）。
	if (!mSlotsPublished.load(std::memory_order_acquire))
		return false;
	if (!SlotIndexValid(theSongId))
		return false;
	BassMusicInfo* aMusicInfo = mMusicSlots[theSongId].get();
	if (aMusicInfo != nullptr)
	{		
		return aMusicInfo->mPlayback.State() == BASS_ACTIVE_PLAYING;
	}

	return false;
}

bool BassMusicInterface::IsMusicLoaded(int theSongId)
{
	// 主线程入口：装载发布前槽位未就绪，安全 no-op（零锁——发布后不可变）。
	if (!mSlotsPublished.load(std::memory_order_acquire))
		return false;
	return SlotIndexValid(theSongId) && mMusicSlots[theSongId] != nullptr;
}

void BassMusicInterface::SetMusicAmplify(int theSongId, double theAmp)
{
	// 主线程入口：装载发布前槽位未就绪，安全 no-op（零锁——发布后不可变）。
	if (!mSlotsPublished.load(std::memory_order_acquire))
		return;
	if (!SlotIndexValid(theSongId))
		return;
	BassMusicInfo* aMusicInfo = mMusicSlots[theSongId].get();
	if (aMusicInfo != nullptr)
	{		
		gBass->BASS_MusicSetAmplify(aMusicInfo->GetHandle(), (int) (theAmp * 100));
	}
}

void BassMusicInterface::Update()
{
	// 主线程入口：装载发布前槽位未就绪，安全 no-op（零锁——发布后不可变）。
	if (!mSlotsPublished.load(std::memory_order_acquire))
		return;
	for (const std::unique_ptr<BassMusicInfo>& aSlot : mMusicSlots)
	{
		if (!aSlot)
			continue;
		aSlot->mPlayback.Check();
		ApplyVolumeFade(aSlot.get());
	}
}

////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////
// MODs are broken up into several orders or patterns. This returns the current order a song is on.
int BassMusicInterface::GetMusicOrder(int theSongId)
{
	if (!SlotIndexValid(theSongId))
		return -1;
	BassMusicInfo* aMusicInfo = mMusicSlots[theSongId].get();
	if (aMusicInfo != nullptr)
	{
		// order/row packed position only exists for HMUSIC channels; asking a
		// stream for BASS_POS_MUSIC_ORDER fails (returns -1) in BASS 2.4.
		if (aMusicInfo->mHMusic == 0)
			return -1;
		int aPosition = aMusicInfo->mPlayback.Position(BASS_POS_MUSIC_ORDER);
		return aPosition;
	}
	return -1;
}
