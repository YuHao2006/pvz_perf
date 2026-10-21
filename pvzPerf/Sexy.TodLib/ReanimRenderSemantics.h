#pragma once
#include "ReanimTrackId.h"

namespace ReanimRenderSemantics
{
// Retail 1073 compares the complete track name with "fullscreen".
// A prefix match also draws fullscreen2, whose default color is white.
constexpr bool IsFullscreenTrack(ReanimTrackId track)
{
    return track == ReanimTrackId::fullscreen;
}
}
