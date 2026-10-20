#include "Lawn/Board.h"
#include "Lawn/Zombie.h"
#include "Lawn/Plant.h"
#include "Lawn/Projectile.h"
#include "Lawn/Coin.h"
#include "Lawn/LawnMower.h"
#include "Lawn/GridItem.h"
#include "Lawn/Challenge.h"
#include "Lawn/SeedPacket.h"
#include "Lawn/CursorObject.h"
#include "Lawn/MessageWidget.h"
#include "Lawn/System/Music.h"
#include "Sexy.TodLib/Attachment.h"
#include "Sexy.TodLib/Reanimator.h"
#include "Sexy.TodLib/TodParticle.h"
#include "Lawn/System/TimeCounterFields.h"
#include "Lawn/System/LevelSaveFormat.h"
#include "misc/FrameTiming.h"
#include <array>
#include <iostream>
#include <stdexcept>
#include <vector>

namespace
{
void Configure(unsigned int fps)
{
    Sexy::gUpdateTicks = static_cast<double>(Sexy::FrameTiming::FromTargetFps(fps).mIntervalNs) /
        Sexy::FrameTiming::LegacyTickNs;
    Sexy::gStepsPerLegacyTick = 1.0 / Sexy::gUpdateTicks;
}

template<class T>
void CheckRecord()
{
    std::vector<unsigned char> legacy(sizeof(T), 0);
    unsigned int counterCount = 0;
    VisitTimeCounterOffsets<T>([&](size_t offset, bool isUnsigned) {
        const int value = !isUnsigned && counterCount % 3 == 0 ? -1 : 25 + counterCount * 725;
        std::memcpy(legacy.data() + offset, &value, sizeof(value));
        ++counterCount;
    });
    if (!counterCount)
        throw std::runtime_error("Save record is missing its timer field description");
    for (unsigned int source : {100u, 144u, 240u, 250u, 1000u})
    {
        Configure(source);
        auto live = legacy;
        ImportTimeCounters<T>(live.data());
        auto wire = live;
        ExportTimeCounters<T>(wire.data(), live.data(), 0, 0, wire.size());
        if (wire != legacy)
            throw std::runtime_error("DAT64 counter payload changed when saving at another FPS");
        for (unsigned int destination : {100u, 144u, 240u, 250u, 1000u})
        {
            Configure(destination);
            auto restored = wire;
            ImportTimeCounters<T>(restored.data());
            auto exported = restored;
            ExportTimeCounters<T>(exported.data(), restored.data(), 0, 0, exported.size());
            if (exported != legacy)
                throw std::runtime_error("Cross-FPS save roundtrip changed a timer or adjacent bytes");
        }
    }
}
}

int main()
{
    try
    {
        CheckRecord<Board>();
        CheckRecord<Zombie>();
        CheckRecord<Plant>();
        CheckRecord<Projectile>();
        CheckRecord<Coin>();
        CheckRecord<LawnMower>();
        CheckRecord<GridItem>();
        CheckRecord<TodParticle>();
        CheckRecord<TodParticleEmitter>();
        CheckRecord<ReanimatorTrackInstance>();
        CheckRecord<CursorObject>();
        CheckRecord<MessageWidget>();
        CheckRecord<SeedPacket>();
        CheckRecord<SeedBank>();
        CheckRecord<Challenge>();
        CheckRecord<Music>();
        Configure(100);
        std::cout << "PASS: 16 save record types, five FPS settings, byte-exact counter roundtrips\n";
        return 0;
    }
    catch (const std::exception& error)
    {
        std::cerr << error.what() << '\n';
        return 1;
    }
}
