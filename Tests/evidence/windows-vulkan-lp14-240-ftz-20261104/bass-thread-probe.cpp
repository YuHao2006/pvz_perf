#include <windows.h>
#include <xmmintrin.h>
#include "pvzPerf/SexyAppFramework/sound/bass.h"
#include <atomic>
#include <cstdio>
#include <cstring>
#include <map>
#include <utility>
struct Record {DWORD tid,csr,kind;};
Record rows[4096];std::atomic<unsigned> count{0};
void Capture(DWORD kind) {auto i=count.fetch_add(1,std::memory_order_relaxed);if(i<4096)rows[i]={GetCurrentThreadId(),_mm_getcsr(),kind};}
DWORD CALLBACK Stream(HSTREAM,void* b,DWORD n,void*) {Capture(0);std::memset(b,0,n);return n;}
void CALLBACK Dsp(HDSP,DWORD,void* b,DWORD,void*) {if(b)Capture(1);}
template<class T>T Load(HMODULE h,const char* name){auto f=GetProcAddress(h,name);if(!f){std::printf("Missing %s\n",name);ExitProcess(2);}return reinterpret_cast<T>(f);}
int main(int argc,char**argv){
 if(argc<2)return 2;
 unsigned saved=_mm_getcsr();bool enable=argc>2;
 _mm_setcsr((saved&~0x8040u)|(enable?0x8040u:0));
 std::printf("caller=%lu explicit_flush=%d before_load=0x%x\n",GetCurrentThreadId(),enable,_mm_getcsr());
 auto dll=LoadLibraryA(argv[1]);if(!dll){std::printf("LoadLibrary failed %lu\n",GetLastError());return 2;}
 auto version=Load<decltype(&BASS_GetVersion)>(dll,"BASS_GetVersion");
 auto init=Load<decltype(&BASS_Init)>(dll,"BASS_Init");
 auto create=Load<decltype(&BASS_StreamCreate)>(dll,"BASS_StreamCreate");
 auto dsp=Load<decltype(&BASS_ChannelSetDSP)>(dll,"BASS_ChannelSetDSP");
 auto play=Load<decltype(&BASS_ChannelPlay)>(dll,"BASS_ChannelPlay");
 auto stop=Load<decltype(&BASS_ChannelStop)>(dll,"BASS_ChannelStop");
 auto freeStream=Load<decltype(&BASS_StreamFree)>(dll,"BASS_StreamFree");
 auto freeBass=Load<decltype(&BASS_Free)>(dll,"BASS_Free");
 auto error=Load<decltype(&BASS_ErrorGetCode)>(dll,"BASS_ErrorGetCode");
 auto config=Load<decltype(&BASS_GetConfig)>(dll,"BASS_GetConfig");
 std::printf("BASS_version=0x%08lx after_load=0x%x\n",version(),_mm_getcsr());
 if(!init(-1,44100,0,nullptr,nullptr)){std::printf("Init failed %d\n",error());return 2;}
 std::printf("after_init=0x%x update_threads=%lu\n",_mm_getcsr(),config(BASS_CONFIG_UPDATETHREADS));
 auto stream=create(44100,2,BASS_SAMPLE_FLOAT,Stream,nullptr);
 if(!stream||!dsp(stream,Dsp,nullptr,0)||!play(stream,FALSE)){std::printf("Stream setup failed %d\n",error());freeBass();return 2;}
 Sleep(2200);stop(stream);freeStream(stream);freeBass();
 std::map<std::pair<DWORD,DWORD>,unsigned> summary;
 for(unsigned i=0;i<count.load()&&i<4096;++i)++summary[{rows[i].tid,(rows[i].csr&0xffc0u)|(rows[i].kind<<24)}];
 for(auto [key,n]:summary)std::printf("callback_thread=%lu kind=%s control=0x%04lx FTZ=%d DAZ=%d samples=%u\n",key.first,(key.second>>24)?"DSP":"stream",key.second&0xffff,!!(key.second&0x8000),!!(key.second&0x40),n);
 std::printf("after_free=0x%x\n",_mm_getcsr());FreeLibrary(dll);_mm_setcsr(saved);return summary.empty()?1:0;
}
