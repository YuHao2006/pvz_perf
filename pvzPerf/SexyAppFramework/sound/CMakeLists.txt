target_sources(${PROJECT_NAME} PRIVATE
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
else()
    find_package(OpenAL REQUIRED)
    target_sources(${PROJECT_NAME} PRIVATE
        "../platform/linux/audio/OpenALDevice.cpp"
        "../platform/linux/audio/OpenALSoundManager.cpp"
        "../platform/linux/audio/OpenALMusicPlayback.cpp")
    target_link_libraries(${PROJECT_NAME} PRIVATE OpenAL::OpenAL)
endif()
