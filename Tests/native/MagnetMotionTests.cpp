#include "Lawn/MagnetMotion.h"
#include <cstdio>
#include <stdexcept>

struct Item {float mPosX,mPosY,mVelocityX,mVelocityY;};
static void Require(bool value,const char* text){if(!value)throw std::runtime_error(text);}
int main()
{
    try
    {
        Item oracle{800,0,0,0};
        MagnetMotion::Advance(oracle,0,0,10'000'000,10'000'000);
        Require(oracle.mVelocityX==-15.625f && oracle.mVelocityY==0 && oracle.mPosX==799.84375f,
            "Inverse-square force did not update velocity before position");
        const Item held=oracle;
        MagnetMotion::Advance(oracle,0,0,10'000'000,0);
        Require(oracle.mPosX==held.mPosX && oracle.mVelocityX==held.mVelocityX,"Zero step advanced magnet simulation");
        for(float distance:{10.f,20.f,100.f,300.f,500.f,800.f,1200.f,1000000.f})
            for(std::uint64_t step:{1'000'000ULL,10'000'000ULL,100'000'000ULL,1'000'000'000ULL})
            {
                Item item{distance,0,2,3};MagnetMotion::Bind(item,0,0);
                Require(item.mVelocityX==0 && item.mVelocityY==0,"Magnet birth retained reused velocity");
                bool captured=false;float previous=distance;
                for(std::uint64_t now=step;now<MagnetMotion::MaxFlightNs+step;now+=step)
                {
                    captured=MagnetMotion::Advance(item,0,0,now,step);
                    Require(item.mPosX<=previous && item.mPosX>=0,"Magnet simulation moved away or overshot its target");
                    previous=item.mPosX;if(captured)break;
                }
                Require(captured && item.mPosX==0 && item.mPosY==0,"Magnet item exceeded capture deadline");
            }
        Require(MagnetMotion::SizeAt(0)==1 && MagnetMotion::SizeAt(7'500'000'000)==.5f &&
            MagnetMotion::SizeAt(15'000'000'000)==0 && MagnetMotion::SizeAt(UINT64_MAX)==0,
            "Magnet size is not linear from suction start through fifteen seconds");
        std::puts("PASS discrete inverse-square magnet acceleration, integration, zero-step, capture and shrink");
        return 0;
    }
    catch(const std::exception& error){std::fprintf(stderr,"%s\n",error.what());return 1;}
}
