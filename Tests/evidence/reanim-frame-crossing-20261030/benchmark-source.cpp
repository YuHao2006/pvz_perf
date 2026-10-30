// Forward cached-frame crossing only; no game initialization or instrumentation.
// Inputs use integer-nanosecond frame periods, including exact boundaries.
#include <algorithm>
#include <array>
#include <chrono>
#include <cstdio>
#include <cstdlib>
#include <stdexcept>
#include <vector>
#ifdef _WIN32
#define WIN32_LEAN_AND_MEAN
#define NOMINMAX
#include <windows.h>
#endif
#if defined(_MSC_VER)
#define NOINLINE __declspec(noinline)
#else
#define NOINLINE __attribute__((noinline))
#endif
namespace {
using U = unsigned long long;
struct Input { U age, period; };
struct Result { U crossed, remainder; };
volatile U sink;
constexpr int Count=4096, Repetitions=128, Rounds=7;
U Mix(Result r) { return r.remainder + r.crossed*0x9e3779b97f4a7c15ULL; }
Result Divide(Input x) { return {x.age/x.period,x.age%x.period}; }
Result Subtract(Input x) {
    U crossed=0;
    // >= is essential: an exact frame endpoint belongs to the next frame.
    while (x.age>=x.period) { x.age-=x.period; ++crossed; }
    return {crossed,x.age};
}
Result GuardDivide(Input x) {
    if(x.age<x.period) return {0,x.age};
    return Divide(x);
}
Result ZeroOneThenDivide(Input x) {
    if(x.age<x.period) return {0,x.age};
    x.age-=x.period;
    if(x.age<x.period) return {1,x.age};
    return {1+x.age/x.period,x.age%x.period};
}
NOINLINE U RunDivide(const Input* inputs,int count) {
    U sum=0; for(int i=0;i<count;++i) sum+=Mix(Divide(inputs[i])); return sum;
}
NOINLINE U RunSubtract(const Input* inputs,int count) {
    U sum=0; for(int i=0;i<count;++i) sum+=Mix(Subtract(inputs[i])); return sum;
}
NOINLINE U RunGuardDivide(const Input* inputs,int count) {
    U sum=0; for(int i=0;i<count;++i) sum+=Mix(GuardDivide(inputs[i])); return sum;
}
NOINLINE U RunZeroOneThenDivide(const Input* inputs,int count) {
    U sum=0; for(int i=0;i<count;++i) sum+=Mix(ZeroOneThenDivide(inputs[i])); return sum;
}
using Kernel=U(*)(const Input*,int);
struct Method { const char* name; Kernel function; };
U Random(U& state) { state^=state<<13; state^=state>>7; state^=state<<17; return state; }
void Case(const char* name,U step,int forcedCrossings) {
    std::vector<Input> inputs; inputs.reserve(Count);
    U rng=0x8123abc89173ULL, reference=0;
    const std::array<U,6> rates{12,24,30,47,60,100};
    U totalCrossings=0; int noCross=0;
    for(int i=0;i<Count;++i) {
        const U frames=24+Random(rng)%100, rate=rates[Random(rng)%rates.size()];
        const U period=(frames*1'000'000'000ULL/rate)/(frames-1);
        const U age=forcedCrossings>=0 ? U(forcedCrossings)*period+Random(rng)%period : Random(rng)%period+step;
        const Input x{age,period}; const auto expected=Divide(x);
        const auto repeated=Subtract(x),guarded=GuardDivide(x),hybrid=ZeroOneThenDivide(x);
        if(expected.crossed!=repeated.crossed || expected.remainder!=repeated.remainder ||
           expected.crossed!=guarded.crossed || expected.remainder!=guarded.remainder ||
           expected.crossed!=hybrid.crossed || expected.remainder!=hybrid.remainder)
            throw std::runtime_error("unequal frame crossing");
        reference+=Mix(expected);totalCrossings+=expected.crossed;noCross+=expected.crossed==0;
        inputs.push_back(x);
    }
    // Explicit exact-boundary and long-jump validation outside timing.
    for(U q:{1ULL,10'000'003ULL,83'333'333ULL}) for(U k:{0ULL,1ULL,2ULL,127ULL})
        for(U extra:{0ULL,q-1}) {
            const Input x{k*q+extra,q};const auto a=Divide(x),b=Subtract(x);
            if(a.crossed!=b.crossed || a.remainder!=b.remainder) throw std::runtime_error("boundary mismatch");
        }
    const std::array<Method,4> methods{{{"divide_mod",RunDivide},{"while_subtract",RunSubtract},{"guard_divide_mod",RunGuardDivide},{"zero_one_then_divide",RunZeroOneThenDivide}}};
    for(const auto& method:methods) { Kernel volatile fn=method.function; for(int w=0;w<32;++w) sink=fn(inputs.data(),Count); }
    for(int round=0;round<Rounds;++round) for(int m=0;m<4;++m) {
        const auto& method=methods[(m+round)%4];Kernel volatile fn=method.function;
        U hash=0;const auto begin=std::chrono::steady_clock::now();
        for(int rep=0;rep<Repetitions;++rep) hash+=fn(inputs.data(),Count);
        const auto end=std::chrono::steady_clock::now();sink=hash;
        if(hash!=reference*Repetitions) throw std::runtime_error("benchmark checksum mismatch");
        const double ns=std::chrono::duration<double,std::nano>(end-begin).count()/(Count*Repetitions);
        std::printf("%s,%s,%d,%d,%.6f,%.6f,%.6f,%llu\n",name,method.name,round,Count*Repetitions,ns,
            double(totalCrossings)/Count,double(noCross)/Count,hash);
    }
    std::fflush(stdout);
}
}
int main() {
#ifdef _WIN32
    SetThreadAffinityMask(GetCurrentThread(),DWORD_PTR(1)<<14);
#endif
    try {
        std::puts("case,method,round,operations,ns_per_operation,mean_crossings,no_cross_fraction,checksum");
        Case("1000Hz",1'000'000,-1);Case("240Hz",1'000'000'000/240,-1);
        Case("120Hz",1'000'000'000/120,-1);Case("100Hz",10'000'000,-1);
        Case("60Hz_hypothetical",1'000'000'000/60,-1);Case("30Hz_hypothetical",1'000'000'000/30,-1);
        Case("15Hz_hypothetical",1'000'000'000/15,-1);
        Case("jump_32_frames",0,32);Case("jump_128_frames",0,128);
    } catch(const std::exception& e) {std::fprintf(stderr,"FAIL %s\n",e.what());return 1;}
}
