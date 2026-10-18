#pragma once
#ifdef _WIN32
#include "windows/audio/DSoundManager.h"
#include "windows/audio/DSoundInstance.h"
namespace Sexy {
using NativeSoundManager = DSoundManager;
using NativeSoundInstance = DSoundInstance;
}
#elif defined(__APPLE__)
#include "macos/audio/AudioUnitSoundManager.h"
namespace Sexy {
using NativeSoundManager = AudioUnitSoundManager;
using NativeSoundInstance = AudioUnitSoundInstance;
}
#else
#include "audio/openal/OpenALSoundManager.h"
namespace Sexy {
using NativeSoundManager = OpenALSoundManager;
using NativeSoundInstance = OpenALSoundInstance;
}
#endif
