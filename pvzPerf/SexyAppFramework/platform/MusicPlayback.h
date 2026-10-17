#pragma once
#ifdef _WIN32
#include "windows/audio/MusicPlayback.h"
#else
#include "linux/audio/OpenALMusicPlayback.h"
#endif
