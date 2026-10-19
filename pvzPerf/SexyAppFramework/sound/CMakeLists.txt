target_sources(${PROJECT_NAME} PRIVATE
    "SoundDecode.h"
    "SoundDecode.cpp"
    "BassMusicInterface.h"
    "DummyMusicInterface.h"
    "MusicInterface.h"
    "SoundInstance.h"
    "SoundManager.h"
    "BassLoader.cpp"
    "BassLoader.h"
    "BassMusicInterface.cpp"
    #"SoundBuild.cpp"
)
if(WIN32)
    target_sources(${PROJECT_NAME} PRIVATE
        "../platform/windows/audio/DSoundManager.cpp"
        "../platform/windows/audio/DSoundInstance.cpp")
elseif(APPLE)
    target_sources(${PROJECT_NAME} PRIVATE
        "../platform/macos/audio/AudioUnitDevice.mm"
        "../platform/macos/audio/AudioUnitSoundManager.mm"
        "../platform/macos/audio/AudioUnitMusicPlayback.mm")
else()
    find_package(OpenAL REQUIRED)
    target_sources(${PROJECT_NAME} PRIVATE
        "../platform/audio/openal/OpenALDevice.cpp"
        "../platform/audio/openal/OpenALSoundManager.cpp"
        "../platform/audio/openal/OpenALMusicPlayback.cpp")
    target_link_libraries(${PROJECT_NAME} PRIVATE OpenAL::OpenAL)
endif()
