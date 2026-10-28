#pragma once
#include "sound/BassLoader.h"

namespace Sexy {
class NativeMusicPlayback final {
    unsigned int mHandle = 0;
public:
    static constexpr unsigned int OutputDevice = 1;
    static constexpr bool PerVoiceMasterGain = false;
    static inline bool OpenOutput(NativeWindowHandle window) {
        return gBass->BASS_Init(OutputDevice, 44100, BASS_DEVICE_DSOUND, window, nullptr) != FALSE;
    }
    static inline void CloseOutput() {
        gBass->BASS_Stop();
        gBass->BASS_Free();
    }
    inline void Initialize(unsigned int handle, bool) { mHandle = handle; }
    inline void Close() {}
    inline void Play(bool restart = false) { gBass->BASS_ChannelPlay(mHandle, restart); }
    inline void Stop() { gBass->BASS_ChannelStop(mHandle); }
    inline void Pause() { gBass->BASS_ChannelPause(mHandle); }
    inline void Resume() { gBass->BASS_ChannelResume(mHandle); }
    inline unsigned int State() const { return gBass->BASS_ChannelIsActive(mHandle); }
    void SetGain(float value);
    inline bool Seek(unsigned long long position, unsigned int mode) {
        return gBass->BASS_ChannelSetPosition(mHandle, position, mode) != FALSE;
    }
    inline unsigned long long Position(unsigned int mode) const {
        return gBass->BASS_ChannelGetPosition(mHandle, mode);
    }
    inline void Check() const {}
    static void SetMasterGain(float value);
};
}
