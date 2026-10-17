#pragma once
#ifdef _WIN32
#include "windows/audio/DSoundManager.h"
#include "windows/audio/DSoundInstance.h"
namespace Sexy {
using NativeSoundManager = DSoundManager;
using NativeSoundInstance = DSoundInstance;
}
#else
#include "linux/audio/OpenALSoundManager.h"
namespace Sexy {
using NativeSoundManager = OpenALSoundManager;
using NativeSoundInstance = OpenALSoundInstance;
}
#endif
