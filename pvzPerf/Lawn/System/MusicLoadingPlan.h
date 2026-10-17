#pragma once
#include "Music.h"
#include <array>

namespace MusicLoading {
struct Entry {MusicFile file; const char* path;};
inline constexpr int TaskWeight=3500;
inline constexpr auto Files=std::to_array<Entry>({
    {MUSIC_FILE_DRUMS,"sounds\\mainmusic.mo3"},
    {MUSIC_FILE_HIHATS,"sounds\\mainmusic_hihats.mo3"},
    // ~1.6 MB resident; folds the credits OGG into the startup preload so
    // the credits screen no longer pays the library's only frame-visible
    // first-load (2-4 ms) on entry.
    {MUSIC_FILE_CREDITS_ZOMBIES_ON_YOUR_LAWN,"sounds\\ZombiesOnYourLawn.ogg"},
});
constexpr int TaskCount(bool disabled) {
    return disabled?0:static_cast<int>(Files.size())*TaskWeight;
}
}
