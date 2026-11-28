set(PVZ_HARMONY_JSON_INCLUDE "" CACHE PATH "Directory containing nlohmann/json.hpp")
set(PVZ_HARMONY_JPEG_HEADERS "" CACHE STRING "libjpeg-turbo source and generated header directories")
set(PVZ_HARMONY_JPEG_LIBRARY "" CACHE FILEPATH "ABI-matched HarmonyOS libjpeg.a")
set(PVZ_HARMONY_SPNG_SOURCE "" CACHE PATH "libspng directory containing spng.c")
set(PVZ_HARMONY_OPENMPT_SOURCE "" CACHE PATH "libopenmpt 0.8.10 release source directory")
set(PVZ_HARMONY_AUDIO_DEPS "" CACHE PATH "Directory containing minimp3/ and stb_vorbis/")

foreach(path IN ITEMS
        "${PVZ_HARMONY_JSON_INCLUDE}/nlohmann/json.hpp"
        "${PVZ_HARMONY_JPEG_LIBRARY}"
        "${PVZ_HARMONY_SPNG_SOURCE}/spng.c"
        "${PVZ_HARMONY_OPENMPT_SOURCE}/Makefile.am"
        "${PVZ_HARMONY_AUDIO_DEPS}/minimp3/minimp3.h"
        "${PVZ_HARMONY_AUDIO_DEPS}/stb_vorbis/stb_vorbis.c")
    if(NOT EXISTS "${path}")
        message(FATAL_ERROR "Missing HarmonyOS dependency: ${path}. See docs/harmonyos.md.")
    endif()
endforeach()
if(NOT PVZ_HARMONY_JPEG_HEADERS)
    message(FATAL_ERROR "Set PVZ_HARMONY_JPEG_HEADERS to the source and generated libjpeg header directories.")
endif()

add_library(nlohmann_json::nlohmann_json INTERFACE IMPORTED GLOBAL)
set_property(TARGET nlohmann_json::nlohmann_json PROPERTY
    INTERFACE_INCLUDE_DIRECTORIES "${PVZ_HARMONY_JSON_INCLUDE}")

# Clang 15 names the experimental C++23 mode c++2b.
set(CMAKE_CXX23_STANDARD_COMPILE_OPTION "-std=c++2b")
set(CMAKE_CXX23_EXTENSION_COMPILE_OPTION "-std=gnu++2b")
add_compile_options(-Wno-invalid-offsetof -Wno-inconsistent-missing-override)

function(pvz_add_harmony_host target platform)
    set(openmpt "${PVZ_HARMONY_OPENMPT_SOURCE}")
    file(STRINGS "${openmpt}/Makefile.am" source_lines
        REGEX "^(MPT_FILES_(COMMON|SOUNDBASE|SOUNDLIB|SOUNDDSP|SRC_OPENMPT|SRC_MPT)|libopenmpt_la_SOURCES) [+]= .*\\.cpp$")
    add_library(pvz_harmony_tracker STATIC "${platform}/Mp3Decode.c")
    foreach(line IN LISTS source_lines)
        string(REGEX REPLACE "^.* [^ ]* " "" source "${line}")
        target_sources(pvz_harmony_tracker PRIVATE "${openmpt}/${source}")
    endforeach()
    target_include_directories(pvz_harmony_tracker PRIVATE
        "${openmpt}" "${openmpt}/common" "${openmpt}/src" "${PVZ_HARMONY_AUDIO_DEPS}")
    target_compile_options(pvz_harmony_tracker PRIVATE "$<$<COMPILE_LANGUAGE:CXX>:-std=c++20>" -O2)
    target_compile_definitions(pvz_harmony_tracker PRIVATE
        LIBOPENMPT_BUILD MPT_WITH_STBVORBIS MPT_WITH_MINIMP3 MPT_WITH_ZLIB)

    target_sources(${target} PRIVATE
        "${platform}/HarmonyHost.cpp"
        "${platform}/HarmonyAudio.cpp"
        "${platform}/HarmonySound.cpp"
        "${platform}/HarmonyMusicBridge.cpp"
        "${platform}/HarmonyMusicPlayback.cpp"
        "${platform}/../web/WebOggDecoder.cpp"
        "${PVZ_HARMONY_AUDIO_DEPS}/stb_vorbis/stb_vorbis.c"
        "${PVZ_HARMONY_SPNG_SOURCE}/spng.c")
    target_include_directories(${target} BEFORE PRIVATE
        ${PVZ_HARMONY_JPEG_HEADERS} "${PVZ_HARMONY_SPNG_SOURCE}"
        "${openmpt}" "${PVZ_HARMONY_AUDIO_DEPS}"
        "${PVZ_HARMONY_AUDIO_DEPS}/stb_vorbis"
        "${platform}/../audio/openal")
    target_compile_definitions(${target} PRIVATE SEXY_RENDER_GPU=1 SPNG_STATIC AL_APIENTRY=)
    target_link_options(${target} PRIVATE -Wl,--no-undefined)
    target_link_libraries(${target} PRIVATE pvz_harmony_tracker "${PVZ_HARMONY_JPEG_LIBRARY}"
        z native_window hilog_ndk.z ace_napi.z ohaudio)
    if(PVZ_VULKAN_LEGACY)
        target_compile_definitions(${target} PRIVATE PVZ_HARMONY_BACKEND_MODULE=1)
        target_link_options(${target} PRIVATE -Wl,-Bsymbolic -Wl,--exclude-libs,ALL)
    else()
        target_link_libraries(${target} PRIVATE dl deviceinfo_ndk.z)
    endif()
endfunction()
