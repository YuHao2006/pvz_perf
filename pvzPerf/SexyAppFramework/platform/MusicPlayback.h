#pragma once
#ifdef _WIN32
#include "windows/audio/MusicPlayback.h"
#elif defined(__APPLE__)
#include "macos/audio/AudioUnitMusicPlayback.h"
#else
#include "audio/openal/OpenALMusicPlayback.h"
#endif
