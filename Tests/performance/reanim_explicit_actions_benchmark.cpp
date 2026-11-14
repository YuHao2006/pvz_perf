// Actual Release runtime; old range scan is retained here only as the comparison kernel.
#define WIN32_LEAN_AND_MEAN
#define NOMINMAX
#include <windows.h>
#include "LawnApp.h"
#include "Sexy.TodLib/Reanimator.h"
#include "Sexy.TodLib/ReanimActionLayout.h"
#include "Sexy.TodLib/ReanimTrackMphfGlobal.h"
#include "Sexy.TodLib/generated/ReanimActionData.h"
#include "Sexy.TodLib/generated/GeneratedDefinitions.h"
#include <chrono>
#include <cstdio>
#include <stdexcept>
#include <vector>
bool (*gAppCloseRequest)();
struct Query {Reanimation* animation;int index;ReanimTrackId id;};
volatile std::uint64_t sink;
std::uint64_t Pack(int first,int count){return (std::uint64_t(unsigned(first))<<32)|unsigned(count);}
__declspec(noinline) std::uint64_t OldScan(const Query&q){const auto&t=q.animation->mDefinition->mTracks.tracks[q.index].mTransforms;int first=0,count=1;for(int f=0;f<t.count;++f)if(t.mTransforms[f].mFrame>=0){first=f;break;}for(int f=first;f<t.count;++f)if(t.mTransforms[f].mFrame>=0)count=f-first+1;return Pack(first,count);}
__declspec(noinline) std::uint64_t NewIndex(const Query&q){int first,count;q.animation->GetFramesForTrackIndex(q.index,first,count);return Pack(first,count);}
__declspec(noinline) std::uint64_t NewAction(const Query&q){int first,count;q.animation->GetFramesForLayer(q.id,first,count);return Pack(first,count);}
void Check(bool b){if(!b)throw std::runtime_error("Range, lookup or legacy mapping changed");}
int main(){try {
 Check(SetProcessAffinityMask(GetCurrentProcess(),0x4000)!=0);
 ReanimatorLoadDefinitions(gLawnReanimationArray,(int)ReanimationType::NUM_REANIMS);
 Reanimation animations[(int)ReanimationType::NUM_REANIMS];std::vector<Query> tracks,actions;int legacy=0;
 for(unsigned type=0;type<(unsigned)ReanimationType::NUM_REANIMS;++type){auto&a=animations[type];a.mDead=true;a.mReanimationType=ReanimationType(type);a.mDefinition=&GeneratedDefinitions::Reanimations[type];const auto&l=ReanimActionData::Layouts[type];legacy+=l.savedCount;
  for(int i=0;i<a.mDefinition->mTracks.count;++i){Query q{&a,i,a.mDefinition->mTracks.tracks[i].mTrackId};Check(OldScan(q)==NewIndex(q));tracks.push_back(q);}
  for(unsigned id=1;id<=PVZ_REANIM_TRACK_ID_COUNT;++id){const int saved=MphfLookupGlobal(type,id);if(saved<0)continue;const int runtime=l.savedToRuntime[saved];Check(a.TrackExists(ReanimTrackId(id))==(runtime>=0));if(runtime>=0)Check(unsigned(a.mDefinition->mTracks.tracks[runtime].mTrackId)==id);const auto&r=l.actions[saved];Check(a.ActionExists(ReanimTrackId(id))==(r.count>0));if(r.count){Query q{&a,runtime,ReanimTrackId(id)};Check(NewAction(q)==Pack(r.first,r.count));actions.push_back(q);}}
 }
 std::fprintf(stderr,"PASS full generated corpus: runtime=%zu legacy=%d removed=%zu actions=%zu\n",tracks.size(),legacy,legacy-tracks.size(),actions.size());
 std::puts("kernel,round,operations,ns_per_operation,checksum");
 auto measure=[&](const char*name,int round,const auto&queries,auto fn){const auto start=std::chrono::steady_clock::now();std::uint64_t sum=0;constexpr int loops=2048;for(int k=0;k<loops;++k)for(const auto&q:queries)sum+=fn(q);const auto end=std::chrono::steady_clock::now();sink=sum;std::printf("%s,%d,%zu,%.6f,%llu\n",name,round,queries.size()*loops,std::chrono::duration<double,std::nano>(end-start).count()/(queries.size()*loops),(unsigned long long)sum);};
 for(int round=0;round<7;++round){if(round&1){measure("cached_physical_range",round,tracks,NewIndex);measure("old_physical_range_scan",round,tracks,OldScan);}else{measure("old_physical_range_scan",round,tracks,OldScan);measure("cached_physical_range",round,tracks,NewIndex);}measure("explicit_action_lookup",round,actions,NewAction);}return 0;
}catch(const std::exception&e){std::fprintf(stderr,"FAIL %s\n",e.what());return 1;}}
