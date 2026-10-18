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
    if(APPLE)
        if(NOT VCPKG_INSTALLED_DIR OR NOT VCPKG_TARGET_TRIPLET)
            message(FATAL_ERROR "macOS audio requires vcpkg arm64-osx OpenAL Soft")
        endif()
        get_filename_component(pvzOpenALPrefix
            "${VCPKG_INSTALLED_DIR}/${VCPKG_TARGET_TRIPLET}" REALPATH)
        # CONFIG mode prevents FindOpenAL from choosing Apple's legacy framework.
        find_package(OpenAL CONFIG REQUIRED
            PATHS "${pvzOpenALPrefix}/share/openal-soft" NO_DEFAULT_PATH)
        if(NOT TARGET OpenAL::OpenAL)
            message(FATAL_ERROR "vcpkg OpenAL Soft must export OpenAL::OpenAL")
        endif()
        get_filename_component(pvzOpenALConfig "${OpenAL_CONFIG}" REALPATH)
        file(RELATIVE_PATH pvzOpenALConfigRelative
            "${pvzOpenALPrefix}" "${pvzOpenALConfig}")
        if(IS_ABSOLUTE "${pvzOpenALConfigRelative}" OR
                pvzOpenALConfigRelative MATCHES "^\\.\\.(/|$)")
            message(FATAL_ERROR "OpenAL config is outside vcpkg: ${OpenAL_CONFIG}")
        endif()
        get_target_property(pvzOpenALConfigurations OpenAL::OpenAL IMPORTED_CONFIGURATIONS)
        set(pvzOpenALLocationProperties IMPORTED_LOCATION)
        foreach(config IN LISTS pvzOpenALConfigurations)
            string(TOUPPER "${config}" config)
            list(APPEND pvzOpenALLocationProperties "IMPORTED_LOCATION_${config}")
        endforeach()
        set(pvzOpenALLibraryFound FALSE)
        foreach(property IN LISTS pvzOpenALLocationProperties)
            get_target_property(pvzOpenALLibrary OpenAL::OpenAL "${property}")
            if(pvzOpenALLibrary)
                get_filename_component(pvzOpenALLibraryReal "${pvzOpenALLibrary}" REALPATH)
                file(RELATIVE_PATH pvzOpenALLibraryRelative
                    "${pvzOpenALPrefix}" "${pvzOpenALLibraryReal}")
                if(NOT EXISTS "${pvzOpenALLibrary}" OR
                        IS_ABSOLUTE "${pvzOpenALLibraryRelative}" OR
                        pvzOpenALLibraryRelative MATCHES "^\\.\\.(/|$)" OR
                        pvzOpenALLibrary MATCHES "\\.framework(/|$)")
                    message(FATAL_ERROR "OpenAL must link a vcpkg library, not a framework: ${pvzOpenALLibrary}")
                endif()
                set(pvzOpenALLibraryFound TRUE)
                message(STATUS "macOS OpenAL Soft ${property}: ${pvzOpenALLibrary}")
            endif()
        endforeach()
        if(NOT pvzOpenALLibraryFound)
            message(FATAL_ERROR "OpenAL::OpenAL has no imported vcpkg library")
        endif()
        include(CMakePushCheckState)
        include(CheckCXXSourceCompiles)
        cmake_push_check_state(RESET)
        set(CMAKE_REQUIRED_LIBRARIES OpenAL::OpenAL)
        unset(PVZ_OPENAL_SOFT_CALLBACK_LINKS CACHE)
        check_cxx_source_compiles("
            #include <AL/al.h>
            #include <AL/alext.h>
            #ifndef AL_SOFT_callback_buffer
            #error OpenAL Soft callback buffer support is required
            #endif
            int main() {
                LPALBUFFERCALLBACKSOFT callback = nullptr;
                (void)callback;
                return alGetError() != AL_NO_ERROR;
            }" PVZ_OPENAL_SOFT_CALLBACK_LINKS)
        cmake_pop_check_state()
        if(NOT PVZ_OPENAL_SOFT_CALLBACK_LINKS)
            message(FATAL_ERROR "vcpkg OpenAL Soft callback headers/library failed to compile and link")
        endif()
    else()
        find_package(OpenAL REQUIRED)
    endif()
    target_sources(${PROJECT_NAME} PRIVATE
        "../platform/audio/openal/OpenALDevice.cpp"
        "../platform/audio/openal/OpenALSoundManager.cpp"
        "../platform/audio/openal/OpenALMusicPlayback.cpp")
    target_link_libraries(${PROJECT_NAME} PRIVATE OpenAL::OpenAL)
endif()
