// Isolated domain-worker experiment: production CPU reanim math, no game mutation/GPU.
#define WIN32_LEAN_AND_MEAN
#define NOMINMAX
#include <windows.h>
#include "LawnApp.h"
#include "Sexy.TodLib/Reanimator.h"
#include "Sexy.TodLib/ReanimClock.h"
#include "Sexy.TodLib/generated/GeneratedDefinitions.h"
#include <algorithm>
#include <array>
#include <chrono>
#include <condition_variable>
#include <cstdio>
#include <cstring>
#include <exception>
#include <memory>
#include <mutex>
#include <stdexcept>
#include <thread>
#include <vector>
bool (*gAppCloseRequest)();
namespace {
using Clock=std::chrono::steady_clock;
constexpr int Frames=300;
bool VisibleOnly=false;
struct Snapshot {
    Reanimation animation;
    std::vector<ReanimatorTrackInstance> tracks;
    Snapshot() {
        auto& a=animation;
        a.mReanimationType=ReanimationType::REANIM_ZOMBIE;
        a.mDefinition=&GeneratedDefinitions::Reanimations[int(a.mReanimationType)];
        tracks.resize(a.mDefinition->mTracks.count);a.mTrackInstances=tracks.data();
        a.GetFramesForLayer(ReanimTrackId::anim_walk,a.mFrameStart,a.mFrameCount);
        a.mAnimRate=12;a.mLoopType=REANIM_LOOP;
        a.mFramePeriodNs=ReanimClock::PeriodFromRate(a.mFrameCount,a.mAnimRate)/(a.mFrameCount-1);
        a.mPeriodNs=a.mFramePeriodNs*(a.mFrameCount-1);
        a.mRootFrameScale=double(a.mFrameCount)/(a.mFrameCount-1);
        a.mDead=false;
    }
    ~Snapshot(){animation.mTrackInstances=nullptr;animation.mDead=true;}
};
struct Domain {
    std::vector<std::unique_ptr<Snapshot>> objects;
    std::array<std::vector<SexyMatrix3>,2> outputs;
    std::size_t writtenCount=0;
    explicit Domain(int n) {
        for(int i=0;i<n;++i)objects.push_back(std::make_unique<Snapshot>());
        const auto size=std::size_t(n)*objects.front()->tracks.size();
        for(auto& buffer:outputs)buffer.resize(size);
    }
    double Evaluate(int frame) {
        const long long now=(frame+1)*8'333'333LL;
        auto& output=outputs[frame&1];std::size_t pos=0;
        double checksum=0;
        for(auto& s:objects) {
            auto& a=s->animation;
            a.Advance(now-a.mLastUpdateTimeNs);
            ReanimatorFrameTime time;a.GetFrameTime(&time);
            for(int track=0;track<a.mDefinition->mTracks.count;++track) {
                if(VisibleOnly) {
                    const auto& before=a.mDefinition->mTracks.tracks[track].mTransforms.mTransforms[time.mAnimFrameBeforeInt];
                    if(before.mFrame<0 || before.mImageSlot==0)continue;
                }
                ReanimatorTransform transform;
                a.GetCurrentTransform(track,&transform,&time);
                auto& matrix=output[pos++];
                // Same pure transform kernel as drawing; no attachment/font/GPU calls.
                a.MatrixFromTransform(transform,matrix);
                checksum+=double(matrix.m00)+matrix.m02+matrix.m11+matrix.m12;
            }
        }
        writtenCount=pos;
        return checksum;
    }
};
// One persistent visual worker. Only it mutates its domain; job publication and
// completion use a mutex/condition variable. Main owns the battle snapshot.
class Lane {
public:
    Domain& domain;
    std::mutex mutex;std::condition_variable wake,done;
    bool quit=false,busy=false;int job=0;
    std::array<double,Frames> checks{};
    std::exception_ptr failure;
    std::thread worker;
    Lane(Domain& d,bool pinned):domain(d),worker([this,pinned]{
        if(pinned&&!SetThreadAffinityMask(GetCurrentThread(),DWORD_PTR(1)<<15)) {
            std::lock_guard lock(mutex);failure=std::make_exception_ptr(std::runtime_error("worker affinity failed"));
        }
        std::unique_lock lock(mutex);
        for(;;){
            wake.wait(lock,[this]{return quit||busy;});if(quit)return;
            const int frame=job;lock.unlock();
            try{checks[frame]=domain.Evaluate(frame);}catch(...){failure=std::current_exception();}
            lock.lock();busy=false;done.notify_one();
        }
    }){}
    void Wait(){std::unique_lock lock(mutex);done.wait(lock,[this]{return !busy;});if(failure)std::rethrow_exception(failure);}
    void Submit(int frame){Wait();{std::lock_guard lock(mutex);job=frame;busy=true;}wake.notify_one();}
    ~Lane(){ {std::lock_guard lock(mutex);quit=true;}wake.notify_one();worker.join();}
};
}
int main(int argc,char**argv) {
    try {
        const bool pinned=argc>1 && std::string(argv[1])=="pinned";
        VisibleOnly=argc>2 && std::string(argv[2])=="visible";
        const bool unbalanced=argc>3 && std::string(argv[3])=="unbalanced";
        if(pinned&&!SetThreadAffinityMask(GetCurrentThread(),DWORD_PTR(1)<<14))throw std::runtime_error("main affinity failed");
        LawnApp app;gLawnApp=&app;app.mReadFromRegistry=false;
        ReanimatorLoadDefinitions(gLawnReanimationArray,NUM_REANIMS);
        std::puts("affinity,battle_objects,visual_objects,scope,mode,round,frames,mean_us,p50_us,p95_us,max_us,checksum");
        for(const int count:{4,32,128,512}) {
            std::array<double,Frames> reference{},visualReference{};
            const int visualCount=unbalanced?std::max(1,count/8):count;
            // Untimed bitwise oracle, including the full published matrix buffer.
            {
                Domain expected(visualCount),actual(visualCount);Lane lane(actual,pinned);
                for(int frame=0;frame<24;++frame){
                    expected.Evaluate(frame);lane.Submit(frame);lane.Wait();
                    if(expected.writtenCount!=actual.writtenCount ||
                        std::memcmp(expected.outputs[frame&1].data(),actual.outputs[frame&1].data(),
                            expected.writtenCount*sizeof(SexyMatrix3))!=0)
                        throw std::runtime_error("parallel matrix bytes differ from serial oracle");
                }
            }
            for(int round=0;round<3;++round)for(int order=0;order<3;++order){
                const int mode=round%2?(2-order):order;
                Domain battle(count),visual(visualCount);
                std::unique_ptr<Lane> lane;
                if(mode)lane=std::make_unique<Lane>(visual,pinned);
                std::vector<double> times;double checksum=0;
                const auto batchStart=Clock::now();
                for(int frame=0;frame<Frames;++frame){
                    const auto start=Clock::now();
                    if(lane)lane->Submit(frame);
                    const double b=battle.Evaluate(frame);
                    if(!mode){const auto v=visual.Evaluate(frame);reference[frame]=b+v;visualReference[frame]=v;checksum+=b+v;}
                    else if(mode==1){lane->Wait();const double value=b+lane->checks[frame];if(value!=reference[frame])throw std::runtime_error("same-frame output mismatch");checksum+=value;}
                    else {
                        // One-frame visual latency; do not consume the slot being written.
                        if(frame){const double value=lane->checks[frame-1];checksum+=value;}
                        checksum+=b;
                    }
                    times.push_back(std::chrono::duration<double,std::micro>(Clock::now()-start).count());
                }
                if(lane){lane->Wait();if(mode==2)checksum+=lane->checks[Frames-1];}
                if(mode==2){double exact=0;for(int frame=0;frame<Frames;++frame){if(lane->checks[frame]!=visualReference[frame])throw std::runtime_error("async snapshot mismatch");exact+=reference[frame];}if(std::abs(exact-checksum)>std::abs(exact)*1e-12)throw std::runtime_error("async checksum mismatch");}
                const double batchUs=std::chrono::duration<double,std::micro>(Clock::now()-batchStart).count();
                auto sorted=times;std::sort(sorted.begin(),sorted.end());
                std::printf("%s,%d,%d,%s,%s,%d,%d,%.6f,%.6f,%.6f,%.6f,%.9g\n",pinned?"LP14_15":"OS",count,visualCount,VisibleOnly?"visible_image_tracks":"all_tracks",mode==0?"serial":mode==1?"same_frame_worker":"one_frame_visual_latency",round,Frames,batchUs/Frames,sorted[Frames/2],sorted[Frames*95/100],sorted.back(),checksum);std::fflush(stdout);
            }
        }
        return 0;
    }catch(const std::exception&e){std::fprintf(stderr,"FAIL %s\n",e.what());return 1;}
}
