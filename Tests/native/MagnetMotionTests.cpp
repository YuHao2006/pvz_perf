#include "Lawn/MagnetMotion.h"
#include <cstdio>
#include <stdexcept>

struct Item
{
    float mPosX, mPosY, mOriginDeltaX, mOriginDeltaY, mCaptureFactor;
    std::uint64_t mCenterDurationNs;
};
static void Require(bool value, const char* text)
{
    if (!value) throw std::runtime_error(text);
}
int main()
{
    try
    {
        for (unsigned n = 1; n < 4096; ++n)
        {
            const double q = MagnetMotion::Curve[n];
            const double phase = 2 / 3.14159265358979323846 *
                (std::acos(std::sqrt(q)) + std::sqrt(q * (1 - q)));
            Require(std::abs(phase - double(n) / 4096) < 2e-6,
                "Generated curve does not solve inverse-square acceleration");
            Require(q <= MagnetMotion::Curve[n - 1], "Magnet curve is not monotonic");
        }
        for (const float radius : {10.0f, 20.0f, 100.0f, 300.0f, 500.0f, 800.0f, 1200.0f, 1000000.0f})
        {
            Item item{radius, 0};
            MagnetMotion::Bind(item, 0, 0);
            Require(item.mCenterDurationNs <= 900'000'000,
                "Very distant magnet target exceeds the flight-time cap");
            const auto duration = item.mCenterDurationNs;
            const auto radiusAt = [&](unsigned percent) {
                Item copy = item;
                MagnetMotion::Sample(copy, 0, 0, duration * percent / 100);
                return copy.mPosX;
            };
            if (radius >= 100)
            {
                const auto first = radiusAt(10) - radiusAt(20);
                const auto middle = radiusAt(40) - radiusAt(50);
                const auto last = radiusAt(70) - radiusAt(80);
                Require(first > 0 && middle > first && last > middle,
                    "Inverse-square attraction did not accelerate toward its target");
            }
            Require(MagnetMotion::Sample(item, 0, 0, duration) &&
                std::abs(item.mPosX) < 0.001f && std::abs(item.mPosY) < 0.001f,
                "Magnet item did not snap to its receiving plant");
            const double endpointDistance = std::sqrt(
                double(item.mPosX) * item.mPosX + double(item.mPosY) * item.mPosY);
            Require(endpointDistance == 0.0,
                "Snapped magnet endpoint is not exact");
        }
        Require(MagnetMotion::Advance(123, UINT64_MAX) == MagnetMotion::MaxFlightNs,
            "Large step wrapped magnet batch time");
        std::puts("PASS magnet inverse-square curve, acceleration, capture and sub-second limit");
        return 0;
    }
    catch (const std::exception& error)
    {
        std::fprintf(stderr, "%s\n", error.what());
        return 1;
    }
}
