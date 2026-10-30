#define WIN32_LEAN_AND_MEAN
#define NOMINMAX
#include <windows.h>
#include <algorithm>
#include <array>
#include <cstring>
#include <atomic>
#include <condition_variable>
#include <cstdint>
#include <future>
#include <iomanip>
#include <iostream>
#include <mutex>
#include <stdexcept>
#include <string>
#include <thread>
#include <vector>

namespace {
struct FrameState {
    unsigned int frame, definition;
    unsigned long long remainderNs;
    float x, y, scale;
    unsigned int color;
};
static_assert(sizeof(FrameState)==32);
struct Times { long long submitted, started, finished, received, deadline; };
long long frequency;
long long Now() { LARGE_INTEGER q{}; QueryPerformanceCounter(&q); return q.QuadPart; }
void Pin(unsigned int core) {
    if (!SetThreadAffinityMask(GetCurrentThread(),DWORD_PTR{1}<<core))
        throw std::runtime_error("Cannot pin benchmark thread to LP"+std::to_string(core));
}
struct Timer {
    HANDLE handle;
    bool highResolution;
    Timer() {
        handle=CreateWaitableTimerExW(nullptr,nullptr,CREATE_WAITABLE_TIMER_HIGH_RESOLUTION,TIMER_ALL_ACCESS);
        highResolution=handle!=nullptr;
        if (!handle) handle=CreateWaitableTimerW(nullptr,FALSE,nullptr);
        if (!handle) throw std::runtime_error("Cannot create pacing timer");
    }
    ~Timer() { CloseHandle(handle); }
    void Until(long long deadline) {
        for (;;) {
            const auto remaining=deadline-Now();
            if (remaining<=0) return;
            LARGE_INTEGER due{};
            due.QuadPart=-std::max(1LL,(remaining*10'000'000+frequency-1)/frequency);
            if (!SetWaitableTimer(handle,&due,0,nullptr,nullptr,FALSE) || WaitForSingleObject(handle,INFINITE)!=WAIT_OBJECT_0)
                throw std::runtime_error("Pacing timer failed");
        }
    }
};
struct CvTransport {
    std::mutex mutex;
    std::condition_variable request, completion;
    std::thread worker;
    FrameState payload{};
    std::array<FrameState,1024> batchPayload{};
    bool batch;
    Times times{};
    bool pending=false,done=false,stop=false;
    unsigned long long checksum=0;
    explicit CvTransport(bool batchCopy) : batch(batchCopy) {
        std::promise<void> startup;
        auto ready=startup.get_future();
        worker=std::thread([this,&startup] {
            try { Pin(15); startup.set_value(); }
            catch (...) { startup.set_exception(std::current_exception()); return; }
            std::unique_lock lock(mutex);
            for (;;) {
                request.wait(lock,[&]{return pending||stop;});
                if (stop) return;
                times.started=Now();
                const auto frame=payload;
                checksum+=frame.frame+frame.definition+frame.remainderNs+frame.color;
                if(batch) for(unsigned int i=0;i<batchPayload.size();i+=2) checksum+=batchPayload[i].definition;
                times.finished=Now();
                pending=false;done=true;
                lock.unlock();completion.notify_one();lock.lock();
            }
        });
        try { ready.get(); } catch (...) { worker.join();throw; }
    }
    ~CvTransport() {
        { std::lock_guard lock(mutex);stop=true; }
        request.notify_one();worker.join();
    }
    Times Exchange(const FrameState& frame,long long deadline,const std::array<FrameState,1024>& packet) {
        std::unique_lock lock(mutex);
        times.submitted=Now();
        payload=frame;
        if(batch) std::memcpy(batchPayload.data(),packet.data(),sizeof(packet));
        done=false;pending=true;
        lock.unlock();request.notify_one();lock.lock();
        completion.wait(lock,[&]{return done;});
        times.received=Now();times.deadline=deadline;
        return times;
    }
};
struct AtomicTransport {
    alignas(64) std::atomic<unsigned long long> request{0};
    alignas(64) std::atomic<unsigned long long> completion{0};
    std::atomic<bool> stop{false};
    std::thread worker;
    FrameState payload{};
    std::array<FrameState,1024> batchPayload{};
    bool batch;
    Times times{};
    unsigned long long checksum=0;
    explicit AtomicTransport(bool batchCopy) : batch(batchCopy) {
        std::promise<void> startup;
        auto ready=startup.get_future();
        worker=std::thread([this,&startup] {
            try { Pin(15);startup.set_value(); }
            catch (...) { startup.set_exception(std::current_exception());return; }
            unsigned long long previous=0;
            for (;;) {
                request.wait(previous,std::memory_order_acquire);
                const auto sequence=request.load(std::memory_order_acquire);
                if (stop.load(std::memory_order_acquire)) return;
                times.started=Now();
                const auto frame=payload;
                checksum+=frame.frame+frame.definition+frame.remainderNs+frame.color;
                if(batch) for(unsigned int i=0;i<batchPayload.size();i+=2) checksum+=batchPayload[i].definition;
                times.finished=Now();
                previous=sequence;
                completion.store(sequence,std::memory_order_release);
                completion.notify_one();
            }
        });
        try { ready.get(); } catch (...) { worker.join();throw; }
    }
    ~AtomicTransport() {
        stop.store(true,std::memory_order_release);
        request.fetch_add(1,std::memory_order_release);request.notify_one();worker.join();
    }
    Times Exchange(const FrameState& frame,long long deadline,const std::array<FrameState,1024>& packet) {
        const auto previous=request.load(std::memory_order_relaxed);
        times.submitted=Now();
        payload=frame;
        if(batch) std::memcpy(batchPayload.data(),packet.data(),sizeof(packet));
        request.store(previous+1,std::memory_order_release);request.notify_one();
        auto observed=completion.load(std::memory_order_acquire);
        while(observed!=previous+1) {
            completion.wait(observed,std::memory_order_acquire);
            observed=completion.load(std::memory_order_acquire);
        }
        times.received=Now();times.deadline=deadline;
        return times;
    }
};
void Stats(const std::vector<double>& input) {
    auto values=input;
    std::sort(values.begin(),values.end());
    const auto pct=[&](double p){return values[static_cast<std::size_t>((values.size()-1)*p)];};
    double sum=0;for(auto v:values)sum+=v;
    std::cout<<"{\"mean\":"<<sum/values.size()<<",\"p50\":"<<pct(.5)<<",\"p90\":"<<pct(.9)
             <<",\"p95\":"<<pct(.95)<<",\"p99\":"<<pct(.99)<<",\"max\":"<<values.back()<<'}';
}
template<class Transport>
void Run(const char* protocol,bool paced,bool batch,Timer& timer) {
    Transport channel(batch);
    std::array<FrameState,1024> packet{};
    for(unsigned int i=0;i<packet.size();++i) packet[i]={i%47,i,i*12345ull,123.f,456.f,1.f,0xffffffffu};
    const unsigned int warmup=paced?60:2000;
    const unsigned int count=paced?2000:30000;
    std::vector<Times> samples;samples.reserve(count);
    const auto begin=Now();
    unsigned int missedPeriods=0;
    for(unsigned int i=0;i<warmup+count;++i) {
        const auto deadline=paced?begin+(static_cast<long long>(i)+1)*frequency/240:0;
        if(paced)timer.Until(deadline);
        const FrameState payload{i%47,17,i*16381ull,123.f,456.f,1.f,0xffffffffu};
        const auto result=channel.Exchange(payload,deadline,packet);
        if(i>=warmup) {
            samples.push_back(result);
            if(paced && result.submitted-deadline>=frequency/240)++missedPeriods;
        }
    }
    std::vector<double> dispatch,completion,roundtrip,payload,lateness;
    const double scale=1e6/static_cast<double>(frequency);
    for(const auto& t:samples) {
        dispatch.push_back((t.started-t.submitted)*scale);
        completion.push_back((t.received-t.finished)*scale);
        roundtrip.push_back((t.received-t.submitted)*scale);
        payload.push_back((t.finished-t.started)*scale);
        if(paced)lateness.push_back((t.submitted-t.deadline)*scale);
    }
    std::cout<<"{\"protocol\":\""<<protocol<<"\",\"mode\":\""<<(paced?"240Hz_idle_wake":"continuous_roundtrip")
             <<"\",\"payload_bytes\":"<<(batch?sizeof(packet):sizeof(FrameState))<<",\"samples\":"<<count<<",\"warmup\":"<<warmup<<",\"unit\":\"microseconds\",\"dispatch\":";
    Stats(dispatch);std::cout<<",\"completion\":";Stats(completion);
    std::cout<<",\"roundtrip\":";Stats(roundtrip);
    std::cout<<",\"worker_payload_and_qpc\":";Stats(payload);
    std::cout<<",\"checksum\":"<<channel.checksum;
    if(paced) { std::cout<<",\"deadline_lateness\":";Stats(lateness);std::cout<<",\"submissions_late_by_one_period\":"<<missedPeriods; }
    std::cout<<'}'<<std::flush;
}
}
int main() {
    try {
        DWORD_PTR allowed=0,system=0;
        if(!GetProcessAffinityMask(GetCurrentProcess(),&allowed,&system) || (allowed&0xc000)!=0xc000)
            throw std::runtime_error("LP14 and LP15 must be available to the benchmark process");
        Pin(14);
        LARGE_INTEGER q{};QueryPerformanceFrequency(&q);frequency=q.QuadPart;
        Timer timer;
        std::vector<double> qpc;
        for(unsigned int i=0;i<20000;++i) { const auto a=Now(),b=Now();qpc.push_back((b-a)*1e6/static_cast<double>(frequency)); }
        std::cout<<std::fixed<<std::setprecision(6)<<"{\"producer_core\":14,\"consumer_core\":15,\"payload_bytes\":"<<sizeof(FrameState)
            <<",\"qpc_frequency\":"<<frequency<<",\"high_resolution_pacing_timer\":"<<(timer.highResolution?"true":"false")
            <<",\"clock_policy\":\"Does not change CPU/GPU clocks; user lock11x not independently verified\",\"scope\":\"Communication only; no interpolation, trigonometry or GPU submission measured\",\"qpc_pair_overhead_us\":";
        Stats(qpc);std::cout<<",\"cases\":[";
        Run<CvTransport>("condition_variable",false,false,timer);std::cout<<',';
        Run<AtomicTransport>("atomic_wait_notify",false,false,timer);std::cout<<',';
        Run<CvTransport>("condition_variable",false,true,timer);std::cout<<',';
        Run<AtomicTransport>("atomic_wait_notify",false,true,timer);std::cout<<',';
        Run<CvTransport>("condition_variable",true,false,timer);std::cout<<',';
        Run<AtomicTransport>("atomic_wait_notify",true,false,timer);std::cout<<',';
        Run<CvTransport>("condition_variable",true,true,timer);std::cout<<',';
        Run<AtomicTransport>("atomic_wait_notify",true,true,timer);
        std::cout<<"]}\n";
    } catch(const std::exception& e) { std::cerr<<e.what()<<'\n';return 1; }
}
