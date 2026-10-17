#pragma once
#include "Common.h"
#include <stdio.h>

#include "bass.h"

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
namespace Sexy
{

struct BASS_INSTANCE
{
	BASS_INSTANCE(const char *dllName);
	~BASS_INSTANCE();

	// 函数指针签名与项目内 bass.h（BASS 2.4）逐一对应。历史上这里残留过
	// BASS 2.2 的 DWORD 音量/无 mode 定位签名；2.4 全部改为 float 音量和
	// 带 mode 的 64 位定位，签名错位属于 ABI 未定义行为。
	BOOL BASS_MusicSetAmplify(HMUSIC handle, float amp);
	BOOL BASS_MusicPlay(HMUSIC handle);
	BOOL BASS_MusicPlayEx(HMUSIC handle, DWORD pos, int flags, BOOL reset);
	BOOL BASS_ChannelResume(DWORD handle);
	BOOL BASS_StreamPlay(HSTREAM handle, BOOL flush, DWORD flags);



#ifdef _WIN32
    HMODULE         mModule;
#else
    void*           mModule;
#endif

	DWORD(WINAPI *BASS_GetVersion)();

#ifdef _WIN32
	BOOL(WINAPI *BASS_Init)(int device, DWORD freq, DWORD flags, NativeWindowHandle win, const void* dsguid);
#else
	BOOL(*BASS_Init)(int device, DWORD freq, DWORD flags, void* win, const void* dsguid);
#endif
//	BOOL(WINAPI *BASS_Init2)(int device, DWORD freq, DWORD flags, HWND win, GUID* clsid);
	BOOL(WINAPI *BASS_Free)();
	BOOL(WINAPI *BASS_Stop)();
	BOOL(WINAPI *BASS_Start)();
//	void(WINAPI *BASS_SetGlobalVolumes)(int musvol, int samvol, int strvol);
	BOOL(WINAPI *BASS_GetInfo)(BASS_INFO* info);
	BOOL(WINAPI *BASS_ChannelGetInfo)(DWORD handle, BASS_CHANNELINFO* info);

	BOOL(WINAPI *BASS_SetConfig)(DWORD option, DWORD value);
	DWORD(WINAPI *BASS_GetConfig)(DWORD option);

	BOOL(WINAPI *BASS_ChannelStop)(DWORD handle);
	BOOL(WINAPI *BASS_ChannelPlay)(DWORD handle, BOOL restart);
	BOOL(WINAPI *BASS_ChannelPause)(DWORD handle);
	BOOL(WINAPI *BASS_ChannelSetAttribute)(DWORD handle, DWORD attrib, float value);
	BOOL(WINAPI *BASS_ChannelGetAttribute)(DWORD handle, DWORD attrib, float *value);
	BOOL(WINAPI *BASS_ChannelSetPosition)(DWORD handle, QWORD pos, DWORD mode);
	QWORD(WINAPI *BASS_ChannelGetPosition)(DWORD handle, DWORD mode);
	DWORD (WINAPI *BASS_ChannelFlags)(DWORD handle, DWORD flags, DWORD mask);
	DWORD(WINAPI *BASS_ChannelIsActive)(DWORD handle);
	//BOOL (WINAPI *BASS_ChannelSlideAttributes)(DWORD handle, int freq, int volume, int pan, DWORD time);
	BOOL (WINAPI *BASS_ChannelSlideAttribute)(DWORD handle, DWORD attrib, float value, DWORD time);
	BOOL (WINAPI *BASS_ChannelIsSliding)(DWORD handle, DWORD attrib);
	DWORD (WINAPI *BASS_ChannelGetLevel)(DWORD handle);
	HFX (WINAPI *BASS_ChannelSetFX)(DWORD handle, DWORD theType, int priority);
	BOOL (WINAPI *BASS_ChannelRemoveFX)(DWORD handle, HFX fx);
	QWORD (WINAPI *BASS_ChannelGetLength)(DWORD handle, DWORD mode);
	DWORD (WINAPI *BASS_ChannelGetData)(DWORD handle, void* buffer, DWORD length);
	//BOOL (WINAPI *BASS_ChannelPreBuf)(DWORD handle, DWORD length);
	HSYNC (WINAPI *BASS_ChannelSetSync)(DWORD handle, DWORD type, QWORD param, SYNCPROC *proc, void *user);
	BOOL (WINAPI *BASS_ChannelRemoveSync)(DWORD handle, HSYNC sync);
	
	HMUSIC(WINAPI *BASS_MusicLoad)(BOOL mem, const void *file, QWORD offset, DWORD length, DWORD flags, DWORD freq);
	//HMUSIC(WINAPI *BASS_MusicLoad2)(BOOL mem, void *file, DWORD offset, DWORD length, DWORD flags, DWORD freq);
	BOOL (WINAPI *BASS_MusicFree)(HMUSIC handle);

	HSTREAM(WINAPI *BASS_StreamCreateFile)(BOOL mem, const void *file, QWORD offset, QWORD length, DWORD flags); 
	BOOL(WINAPI *BASS_StreamFree)(HSTREAM handle);

	BOOL (WINAPI *BASS_FXSetParameters)(HFX handle, const void *params);
	BOOL (WINAPI *BASS_FXGetParameters)(HFX handle, void *params);

	//DWORD(WINAPI *BASS_MusicGetAttribute)(DWORD handle, DWORD attrib);
	//void(WINAPI *BASS_MusicSetAttribute)(DWORD handle, DWORD attrib,DWORD value);

	//DWORD (WINAPI *BASS_MusicGetOrders)(HMUSIC handle);
	//DWORD (WINAPI *BASS_MusicGetOrderPosition)(HMUSIC handle);

	HPLUGIN (WINAPI *BASS_PluginLoad)(const char *file, DWORD flags);

	HSAMPLE (WINAPI *BASS_SampleLoad)(BOOL mem, const void *file, QWORD offset, DWORD length, DWORD max, DWORD flags);
	BOOL (WINAPI *BASS_SampleFree)(HSAMPLE handle);
	BOOL (WINAPI *BASS_SampleSetInfo)(HSAMPLE handle, const BASS_SAMPLE *info);
	BOOL (WINAPI *BASS_SampleGetInfo)(HSAMPLE handle, BASS_SAMPLE *info);
	DWORD (WINAPI *BASS_SampleGetChannel)(HSAMPLE handle, DWORD flags);
	BOOL (WINAPI *BASS_SampleStop)(HSAMPLE handle);	

	int (WINAPI *BASS_ErrorGetCode)();
};


extern BASS_INSTANCE *gBass;

BASS_INSTANCE* BASS_CreateInstance(char *dllName);
void BASS_FreeInstance(BASS_INSTANCE *instance);
void LoadBassDLL(); // exits on failure
void FreeBassDLL();

} // namespace Sexy

