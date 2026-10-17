#include "Sexy.TodLib/TodArray.h"
#include "ConstEnums.h"
#include <cstdint>
#include <iostream>
#include <type_traits>

namespace {
int requestedRange, nextIndex, calls;
void Require(bool ok) { if (!ok) throw std::runtime_error("array pick regression"); }
template<class T, std::size_t N>
void Check(const T (&values)[N]) {
    for (int count=1; count<=int(N); ++count) {
        for (int index=0; index<count; ++index) {
            nextIndex=index; calls=0;
            Require(TodPickFromArray(values,count)==values[index]);
            Require(calls==1 && requestedRange==count);
        }
    }
    for (int bad : {-1,0,int(N)+1}) {
        bool rejected=false; calls=0;
        try { (void)TodPickFromArray(values,bad); }
        catch (const std::invalid_argument&) { rejected=true; }
        Require(rejected && calls==0);
    }
}
template<class T> concept AcceptsDecayedPointer = requires(T* pointer) { TodPickFromArray(pointer,1); };
static_assert(!AcceptsDecayedPointer<std::intptr_t>);
static_assert(sizeof(ZombieType)==4 && sizeof(SeedType)==4);
}
int Sexy::Rand(int count) { ++calls; requestedRange=count; return nextIndex; }

int main() {
    try {
        constexpr ZombieType zombies[]={ZOMBIE_TRAFFIC_CONE,ZOMBIE_PAIL,ZOMBIE_FOOTBALL,
            ZOMBIE_POLEVAULTER,ZOMBIE_JACK_IN_THE_BOX,ZOMBIE_LADDER,ZOMBIE_ZAMBONI,
            ZOMBIE_CATAPULT,ZOMBIE_POGO,ZOMBIE_NEWSPAPER,ZOMBIE_DOOR,ZOMBIE_GARGANTUAR};
        static_assert(std::is_same_v<decltype(TodPickFromArray(zombies,12)),ZombieType>);
        Check(zombies); // Every index, including index 10 which crashed the game.
        SeedType seeds[40];
        for(int i=0;i<40;++i) seeds[i]=SeedType(i);
        Check(seeds);
        std::intptr_t rows[]={0,1,2,3,4}; Check(rows);
        int a=1,b=2,c=3; int* pointers[]={&a,&b,&c}; Check(pointers);
        std::cout << "PASS typed enums, prefix counts, pointer identity, one RNG call, invalid counts\n";
        return 0;
    } catch(const std::exception& error) { std::cerr << error.what() << '\n'; return 1; }
}
