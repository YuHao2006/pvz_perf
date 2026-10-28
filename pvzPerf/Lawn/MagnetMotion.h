#pragma once
#include <cmath>
#include <cstdint>

namespace MagnetMotion
{
inline constexpr double Strength = 1'000'000'000.0;
inline constexpr std::uint64_t MaxFlightNs = 900'000'000;
inline constexpr float CaptureRadius = 20.0f;
float SizeAt(std::uint64_t ageNs);

template<class Item>
void Bind(Item& item, float, float)
{
    item.mVelocityX=0;
    item.mVelocityY=0;
}

// Discrete simulation in pixels/seconds. Age is supplied by the owning clock;
// it enforces the existing sub-second cap, never an independently accumulated age.
template<class Item>
bool Advance(Item& item,float targetX,float targetY,std::uint64_t ageNs,std::uint64_t deltaNs)
{
    if(deltaNs==0) return item.mPosX==targetX && item.mPosY==targetY;
    const double dx=double(targetX)-item.mPosX,dy=double(targetY)-item.mPosY;
    const double squared=dx*dx+dy*dy;
    if(ageNs>=MaxFlightNs || squared<=double(CaptureRadius)*CaptureRadius)
    {
        item.mPosX=targetX;item.mPosY=targetY;
        item.mVelocityX=item.mVelocityY=0;
        return true;
    }
    const double inverseRadius=1.0/std::sqrt(squared);
    // Extremely distant modded objects receive stronger initial attraction;
    // otherwise a hard capture deadline would create a large final teleport.
    const double inverseSquare=Strength/squared;
    const double acceleration=squared>800.0*800.0 && 16.0/inverseRadius>inverseSquare
        ? 16.0/inverseRadius : inverseSquare;
    const double seconds=double(deltaNs)*1e-9;
    item.mVelocityX=static_cast<float>(item.mVelocityX+dx*inverseRadius*acceleration*seconds);
    item.mVelocityY=static_cast<float>(item.mVelocityY+dy*inverseRadius*acceleration*seconds);
    const float nextX=static_cast<float>(item.mPosX+double(item.mVelocityX)*seconds);
    const float nextY=static_cast<float>(item.mPosY+double(item.mVelocityY)*seconds);
    const double nextDx=double(targetX)-nextX,nextDy=double(targetY)-nextY;
    if(dx*nextDx+dy*nextDy<=0 || nextDx*nextDx+nextDy*nextDy<=double(CaptureRadius)*CaptureRadius)
    {
        item.mPosX=targetX;item.mPosY=targetY;
        item.mVelocityX=item.mVelocityY=0;
        return true;
    }
    item.mPosX=nextX;item.mPosY=nextY;
    return false;
}
}
