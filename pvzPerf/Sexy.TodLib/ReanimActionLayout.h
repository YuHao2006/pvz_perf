#pragma once
#include <cstdint>
#include "ConstEnums.h"

// Immutable generated data. Actions are indexed by the legacy MPHF result;
// physical ranges are indexed by the compact runtime transform index.
struct ReanimActionRange { int first; int count; };
struct ReanimActionLayout {
    const std::int16_t* savedToRuntime; // -1 denotes a removed, action-only marker.
    const ReanimActionRange* actions; // count == 0 denotes no declared action.
    const ReanimActionRange* tracks;
    int savedCount;
    int groundIndex;
};
struct ReanimSavedTrackLayout {
    const std::int16_t* savedToRuntime;
    int savedCount;
};
ReanimSavedTrackLayout ReanimatorGetSavedTrackLayout(ReanimationType type);
