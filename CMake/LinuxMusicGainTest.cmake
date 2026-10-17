# Run on Linux: cmake -P CMake/LinuxMusicGainTest.cmake
# Optional -D overrides: CXX, PVZ_BASS_LIBRARY, PVZ_MUSIC_GAIN_LOG_DIR.
# Enable ASan, UBSan and leak detection: -DPVZ_MUSIC_GAIN_SANITIZERS=ON
cmake_minimum_required(VERSION 3.20)
option(PVZ_MUSIC_GAIN_SANITIZERS "Enable ASan, UBSan and leak detection" OFF)
if(NOT CMAKE_HOST_SYSTEM_NAME STREQUAL "Linux")
    message(FATAL_ERROR "This test must be built and run on Linux.")
endif()
get_filename_component(root "${CMAKE_CURRENT_LIST_DIR}/.." ABSOLUTE)
if(NOT DEFINED CXX)
    find_program(CXX NAMES g++ clang++ REQUIRED)
endif()
if(NOT DEFINED PVZ_BASS_LIBRARY)
    set(PVZ_BASS_LIBRARY "${root}/out/linux-window-deps/bass/libs/x86_64/libbass.so")
endif()
if(NOT EXISTS "${PVZ_BASS_LIBRARY}")
    message(FATAL_ERROR "Set PVZ_BASS_LIBRARY to the native Linux libbass.so.")
endif()
if(NOT DEFINED PVZ_MUSIC_GAIN_LOG_DIR)
    set(PVZ_MUSIC_GAIN_LOG_DIR "${root}/log")
endif()
get_filename_component(PVZ_MUSIC_GAIN_LOG_DIR "${PVZ_MUSIC_GAIN_LOG_DIR}" ABSOLUTE)
file(MAKE_DIRECTORY "${PVZ_MUSIC_GAIN_LOG_DIR}")
set(framework "${root}/SexyAppFramework")
set(name linux_music_gain)
set(sanitize_flags)
set(sanitize_environment)
if(PVZ_MUSIC_GAIN_SANITIZERS)
    string(APPEND name "_asan_ubsan")
    list(APPEND sanitize_flags -fsanitize=address,undefined
        -fno-omit-frame-pointer -fno-sanitize-recover=all)
    list(APPEND sanitize_environment
        "ASAN_OPTIONS=detect_leaks=1:halt_on_error=1"
        "LSAN_OPTIONS=exitcode=23"
        "UBSAN_OPTIONS=halt_on_error=1:print_stacktrace=1")
endif()
set(binary "${PVZ_MUSIC_GAIN_LOG_DIR}/${name}")
set(log "${binary}.log")
# Keep real LoadMusic/pak/Common implementations; discard unrelated Common sections.
execute_process(COMMAND "${CXX}"
    -std=c++23 -O1 -g -pthread -ffunction-sections -fdata-sections
    ${sanitize_flags}
    "-I${framework}"
    "${root}/tools/native-tests/linux_music_gain.cpp"
    "${framework}/sound/BassMusicInterface.cpp"
    "${framework}/sound/BassLoader.cpp"
    "${framework}/platform/linux/audio/OpenALMusicPlayback.cpp"
    "${framework}/platform/linux/audio/OpenALDevice.cpp"
    "${framework}/platform/linux/audio/OpenALSoundManager.cpp"
    "${framework}/paklib/PakInterface.cpp"
    "${framework}/Common.cpp"
    "${framework}/misc/MTRand.cpp"
    -Wl,--wrap=alSourcef -Wl,--gc-sections -lopenal -ldl
    -o "${binary}"
    RESULT_VARIABLE compiled)
if(NOT compiled EQUAL 0)
    message(FATAL_ERROR "Linux music gain test compilation failed (${compiled}).")
endif()
execute_process(COMMAND "${CMAKE_COMMAND}" -E env
    --unset=DISPLAY --unset=WAYLAND_DISPLAY "ALSOFT_DRIVERS=null"
    ${sanitize_environment}
    "${binary}" "${PVZ_BASS_LIBRARY}" "${PVZ_MUSIC_GAIN_LOG_DIR}"
    RESULT_VARIABLE tested OUTPUT_VARIABLE output ERROR_VARIABLE errors TIMEOUT 30)
file(WRITE "${log}" "sanitizers=${PVZ_MUSIC_GAIN_SANITIZERS}\n${sanitize_environment}\nexit=${tested}\n${output}${errors}")
message("${output}${errors}")
if(NOT tested EQUAL 0)
    message(FATAL_ERROR "Linux music gain test failed (${tested}); see ${log}")
endif()
