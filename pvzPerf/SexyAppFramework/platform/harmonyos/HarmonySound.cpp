#include "HarmonySound.h"
#include "HarmonyAudio.h"
#include "platform/web/WebOggDecoder.h"
#include "paklib/PakInterface.h"
#include <cstring>
#include <algorithm>
#include <stdexcept>
namespace Sexy {
void HarmonySoundInstance::Release() { Stop(); released = true; }
void HarmonySoundInstance::SetBaseVolume(double v) { baseVolume=v; sfx_parameters(channel,baseVolume*volume,pitch,basePan+pan); }
void HarmonySoundInstance::SetBasePan(int v) { basePan=v; sfx_parameters(channel,baseVolume*volume,pitch,basePan+pan); }
void HarmonySoundInstance::AdjustPitch(double v) { pitch=v; sfx_parameters(channel,baseVolume*volume,pitch,basePan+pan); }
void HarmonySoundInstance::SetVolume(double v) { volume=v; sfx_parameters(channel,baseVolume*volume,pitch,basePan+pan); }
void HarmonySoundInstance::SetPan(int v) { pan=v; sfx_parameters(channel,baseVolume*volume,pitch,basePan+pan); }
bool HarmonySoundInstance::Play(bool loop, bool releaseWhenDone) { autoRelease = releaseWhenDone; return sfx_play(source, channel, loop, baseVolume * volume, pitch, basePan+pan); }
void HarmonySoundInstance::Stop() { sfx_stop(channel); }
bool HarmonySoundInstance::IsPlaying() { return sfx_playing(channel); }
bool HarmonySoundInstance::IsReleased() { return released; }
void HarmonySoundInstance::PausePlayback(int& offset) { offset = sfx_pause(channel); }
void HarmonySoundInstance::ResumePlayback(int offset, bool loop) { sfx_resume(channel, offset, loop); }
HarmonySoundManager::HarmonySoundManager(NativeWindowHandle) {
    startOutput(); mInitialized = true; volumes.fill(1);
    for (int i = 0; i < MAX_CHANNELS; ++i) channels[i].channel = i;
}
HarmonySoundManager::~HarmonySoundManager() { ReleaseChannels(); ReleaseSounds(); stopOutput(); }
bool HarmonySoundManager::LoadSound(unsigned int id, const std::string& filename) {
    if (id >= loaded.size()) return false;
    PFILE* file = nullptr;
    for (const char* extension : {".ogg", ".wav", ".au"}) {
        file = p_fopen((filename + extension).c_str(), "rb");
        if (file) break;
    }
    if (!file) return false;
    p_fseek(file, 0, SEEK_END); const auto size = p_ftell(file); p_fseek(file, 0, SEEK_SET);
    std::vector<unsigned char> data(size);
    const auto read = p_fread(data.data(), 1, data.size(), file); p_fclose(file);
    if (read != data.size()) return false;
    try {
        if (data.size() >= 4 && std::memcmp(data.data(), "OggS", 4) == 0) {
            const auto pcm = DecodeWebOgg(data);
            sfx_pcm(id, pcm.samples.data(), static_cast<int>(pcm.samples.size()), pcm.channels, pcm.sampleRate);
        } else sfx_load(id, data.data(), data.size());
    } catch (const std::exception& error) {
        throw std::runtime_error("Sound load failed: " + filename + ": " + error.what());
    }
    loaded[id] = true; return true;
}
int HarmonySoundManager::LoadSound(const std::string& name) { const int id = GetFreeSoundId(); return id >= 0 && LoadSound(id, name) ? id : -1; }
void HarmonySoundManager::ReleaseSound(unsigned int id) { if (id < loaded.size() && loaded[id]) { sfx_release(id); loaded[id] = false; } }
void HarmonySoundManager::SetVolume(double v) { sfx_volume(v); }
bool HarmonySoundManager::SetBaseVolume(unsigned int id, double v) { if (id >= volumes.size()) return false; volumes[id] = v; return true; }
bool HarmonySoundManager::SetBasePan(unsigned int id, int value) { if(id>=pans.size())return false;pans[id]=value;return true; }
SoundInstance* HarmonySoundManager::GetSoundInstance(unsigned int id) {
    if (id >= loaded.size() || !loaded[id]) return nullptr;
    for (auto& c : channels) if (c.released || (c.autoRelease && !c.IsPlaying())) {
        c.source = id; c.baseVolume = volumes[id]; c.volume = 1; c.pitch = 0; c.basePan=pans[id]; c.pan=0;
        c.released = false; c.autoRelease = false; return &c;
    }
    return nullptr;
}
void HarmonySoundManager::ReleaseSounds() { for (unsigned i = 0; i < loaded.size(); ++i) ReleaseSound(i); }
void HarmonySoundManager::ReleaseChannels() { for (auto& c : channels) c.Release(); }
void HarmonySoundManager::Flush() {}
void HarmonySoundManager::SetCooperativeWindow(NativeWindowHandle) {}
void HarmonySoundManager::StopAllSounds() { ReleaseChannels(); }
int HarmonySoundManager::GetFreeSoundId() { for (int i = 0; i < MAX_SOURCE_SOUNDS; ++i) if (!loaded[i]) return i; return -1; }
int HarmonySoundManager::GetNumSounds() { return std::count(loaded.begin(), loaded.end(), true); }
}
