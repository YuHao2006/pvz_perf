#include "sound/BassLoader.h"
#include "platform/web/WebOggDecoder.h"
#include "HarmonyAudio.h"
#include <cstring>
#include <stdexcept>
namespace {
int references=0;
unsigned int LoadModule(BASSBOOL memory,const void* data,QWORD offset,DWORD size,DWORD,DWORD) {
    if(!memory||!data||!size||offset)return 0;
    return loadTracker(data,size,false);
}
unsigned int LoadStream(BASSBOOL memory,const void* data,QWORD offset,QWORD size,DWORD) {
    if(!memory||!data||!size||size>0xffffffffULL||offset)return 0;
    unsigned int voice = 0;
    try {
        Sexy::DecodeWebOggFrames({static_cast<const unsigned char*>(data), static_cast<size_t>(size)},
            [&](int channels, int rate, int frames) {
                voice = beginPcm(channels, rate, frames);
                if (!voice) throw std::runtime_error("Unable to allocate credits AudioBuffer");
            }, [&](int channel, int frameOffset, std::span<const float> plane) {
                if (!writePcm(voice, channel, frameOffset, plane.data(), static_cast<int>(plane.size())))
                    throw std::runtime_error("Unable to fill credits AudioBuffer");
            });
    } catch (...) {
        if (voice) musicCommand(voice, "free", 0, 0);
        throw;
    }
    return voice;
}
BASSBOOL FreeVoice(DWORD id) { return musicCommand(id,"free",0,0); }
BASSBOOL Play(DWORD id,BASSBOOL restart) { return musicCommand(id,"play",restart,0); }
BASSBOOL Stop(DWORD id) { return musicCommand(id,"stop",0,0); }
BASSBOOL Pause(DWORD id) { return musicCommand(id,"pause",0,0); }
DWORD State(DWORD id) { return musicCommand(id,"state",0,0); }
BASSBOOL SetAttribute(DWORD id,DWORD attribute,float value) {
    if(attribute>=BASS_ATTRIB_MUSIC_VOL_CHAN)return musicCommand(id,"channel",value,attribute-BASS_ATTRIB_MUSIC_VOL_CHAN);
    switch(attribute){
    case BASS_ATTRIB_VOL:return musicCommand(id,"gain",value,0);
    case BASS_ATTRIB_MUSIC_BPM:return musicCommand(id,"tempo",value,0);
    case BASS_ATTRIB_MUSIC_SPEED:return musicCommand(id,"speed",value,0);
    case BASS_ATTRIB_MUSIC_AMPLIFY:return musicCommand(id,"amplify",value/50.0f,0);
    case BASS_ATTRIB_MUSIC_PSCALER:return musicCommand(id,"pscaler",value,0);
    default:return false;
    }
}
BASSBOOL GetAttribute(DWORD id,DWORD attribute,float* value) {
    if(!value)return false;
    if(attribute==BASS_ATTRIB_MUSIC_BPM)*value=musicCommand(id,"tempoGet",0,0);
    else if(attribute==BASS_ATTRIB_MUSIC_SPEED)*value=musicCommand(id,"speedGet",0,0);
    else return false;
    return true;
}
BASSBOOL Seek(DWORD id,QWORD position,DWORD mode) {
    if((mode&0xffff)!=BASS_POS_BYTE&&(mode&0xffff)!=BASS_POS_MUSIC_ORDER)return false;
    return musicCommand(id,"seek",static_cast<double>(position),0);
}
QWORD Position(DWORD id,DWORD) { return static_cast<QWORD>(musicCommand(id,"position",0,0)); }
DWORD Flags(DWORD id,DWORD flags,DWORD mask) { return musicCommand(id,"flags",flags,mask); }
BASSBOOL Configure(DWORD option,DWORD) { return option==BASS_CONFIG_BUFFER; }
int ErrorCode() { return 0; }
}
namespace Sexy {
BASS_INSTANCE* gBass=nullptr;
BASS_INSTANCE::BASS_INSTANCE(const char*) {
    std::memset(this,0,sizeof(*this));
    BASS_MusicLoad=LoadModule;BASS_MusicFree=FreeVoice;
    BASS_StreamCreateFile=LoadStream;BASS_StreamFree=FreeVoice;
    BASS_ChannelPlay=Play;BASS_ChannelStop=Stop;BASS_ChannelPause=Pause;BASS_ChannelIsActive=State;
    BASS_ChannelSetAttribute=SetAttribute;BASS_ChannelGetAttribute=GetAttribute;
    BASS_ChannelSetPosition=Seek;BASS_ChannelGetPosition=Position;BASS_ChannelFlags=Flags;
    BASS_SetConfig=Configure;BASS_ErrorGetCode=ErrorCode;
}
BASS_INSTANCE::~BASS_INSTANCE() = default;
BASSBOOL BASS_INSTANCE::BASS_MusicSetAmplify(HMUSIC id,float value) { return SetAttribute(id,BASS_ATTRIB_MUSIC_AMPLIFY,value); }
BASSBOOL BASS_INSTANCE::BASS_ChannelResume(DWORD id) { return musicCommand(id,"resume",0,0); }
void LoadBassDLL() { if(references++==0)gBass=new BASS_INSTANCE(nullptr); }
void FreeBassDLL() { if(references>0&&--references==0){delete gBass;gBass=nullptr;} }
}
