cmake_minimum_required(VERSION 3.16.0 FATAL_ERROR)

if(CMAKE_HOST_WIN32)
    set(_PVZ_DEFAULT_VCPKG_ROOT "C:/UserProgram/vcpkg")
    if(DEFINED ENV{VCPKG_ROOT} AND NOT "$ENV{VCPKG_ROOT}" STREQUAL "")
        set(_PVZ_DEFAULT_VCPKG_ROOT "$ENV{VCPKG_ROOT}")
    endif()
    set(PVZ_VCPKG_ROOT "${_PVZ_DEFAULT_VCPKG_ROOT}" CACHE PATH
        "Root of the vcpkg checkout used by this project")
    set(_PVZ_VCPKG_TOOLCHAIN
        "${PVZ_VCPKG_ROOT}/scripts/buildsystems/vcpkg.cmake")
    if(NOT EXISTS "${_PVZ_VCPKG_TOOLCHAIN}")
        message(FATAL_ERROR "vcpkg toolchain not found: ${_PVZ_VCPKG_TOOLCHAIN}")
    endif()
    if(NOT DEFINED CMAKE_TOOLCHAIN_FILE)
        set(CMAKE_TOOLCHAIN_FILE "${_PVZ_VCPKG_TOOLCHAIN}" CACHE FILEPATH
            "vcpkg toolchain file")
    endif()
    if(NOT DEFINED VCPKG_TARGET_TRIPLET)
        set(VCPKG_TARGET_TRIPLET "x64-windows-static-md" CACHE STRING
            "vcpkg target triplet")
    endif()
    if(NOT DEFINED VCPKG_INSTALLED_DIR)
        set(VCPKG_INSTALLED_DIR "${CMAKE_CURRENT_LIST_DIR}/out/vcpkg_installed"
            CACHE PATH "Project-local vcpkg installed tree")
    endif()
    if(NOT DEFINED VCPKG_OVERLAY_PORTS)
        set(VCPKG_OVERLAY_PORTS "${CMAKE_CURRENT_LIST_DIR}/vcpkg-overlay-ports"
            CACHE STRING "Project-local vcpkg overlay ports")
    endif()
endif()

if(CMAKE_HOST_APPLE AND NOT DEFINED CMAKE_OSX_ARCHITECTURES)
    set(CMAKE_OSX_ARCHITECTURES arm64 CACHE STRING "macOS target architecture")
endif()
project(PlantsVsZombies C CXX)
if(APPLE)
    enable_language(OBJCXX)
    # AppleClang accepts C++23 in .mm files; older CMake tables omit the flags.
    set(CMAKE_OBJCXX23_STANDARD_COMPILE_OPTION "-std=c++23")
    set(CMAKE_OBJCXX23_EXTENSION_COMPILE_OPTION "-std=gnu++23")
    add_compile_options("$<$<AND:$<COMPILE_LANGUAGE:OBJCXX>,$<CONFIG:Release>>:-flto=thin>")
    if(NOT CMAKE_OSX_ARCHITECTURES STREQUAL "arm64")
        message(FATAL_ERROR "The experimental macOS build currently supports arm64 only")
    endif()
    include(CheckIPOSupported)
    check_ipo_supported(RESULT PVZ_MAC_IPO_SUPPORTED OUTPUT PVZ_MAC_IPO_ERROR
        LANGUAGES C CXX)
    if(NOT PVZ_MAC_IPO_SUPPORTED)
        message(FATAL_ERROR "macOS Release requires LTO: ${PVZ_MAC_IPO_ERROR}")
    endif()
    set(CMAKE_INTERPROCEDURAL_OPTIMIZATION_RELEASE ON)
endif()
set(PVZ_GAME_SOURCE_DIR "${CMAKE_CURRENT_SOURCE_DIR}/pvzPerf")
add_library(pvz_source_headers INTERFACE)
target_include_directories(pvz_source_headers INTERFACE
    "${PVZ_GAME_SOURCE_DIR}"
    "${PVZ_GAME_SOURCE_DIR}/SexyAppFramework"
    "${PVZ_GAME_SOURCE_DIR}/Sexy.TodLib"
    "${CMAKE_CURRENT_SOURCE_DIR}")
add_compile_definitions("$<$<CONFIG:Release>:NDEBUG>")

include(CTest)

option(PVZ_BUILD_LEGACY_GAME "Build the inherited SexyAppFramework game target" ON)
option(PVZ_BUILD_NATIVE_WINDOW_ADAPTER "Build the selected independent Linux window adapter" OFF)
if(WIN32)
    set(_PVZ_DEFAULT_WINDOW_BACKEND "WIN32")
elseif(APPLE)
    set(_PVZ_DEFAULT_WINDOW_BACKEND "COCOA")
else()
    set(_PVZ_DEFAULT_WINDOW_BACKEND "X11")
endif()
set(PVZ_WINDOW_BACKEND "${_PVZ_DEFAULT_WINDOW_BACKEND}" CACHE STRING "Native window backend")
set_property(CACHE PVZ_WINDOW_BACKEND PROPERTY STRINGS WIN32 X11 WAYLAND COCOA ANDROID)
if(WIN32)
    set(_PVZ_DEFAULT_RENDER_BACKEND "D3D12")
elseif(APPLE)
    set(_PVZ_DEFAULT_RENDER_BACKEND "METAL")
else()
    set(_PVZ_DEFAULT_RENDER_BACKEND "VULKAN")
endif()
set(PVZ_RENDER_BACKEND "${_PVZ_DEFAULT_RENDER_BACKEND}" CACHE STRING "Native graphics backend")
set_property(CACHE PVZ_RENDER_BACKEND PROPERTY STRINGS VULKAN D3D12 METAL OPENGL D3D9)
set(PVZ_CONFIG_WINDOWS_API NotApplicable)
if(WIN32)
    set(PVZ_WINDOWS_PLATFORM "WIN10" CACHE STRING "Windows API baseline")
    set_property(CACHE PVZ_WINDOWS_PLATFORM PROPERTY STRINGS WIN7 WIN10)
    if(PVZ_WINDOWS_PLATFORM STREQUAL "WIN7")
        if(MSVC AND MSVC_VERSION GREATER_EQUAL 1950)
            message(FATAL_ERROR
                "Win7 requires a downlevel-capable MSVC toolset; use the tested 14.44 toolset, not VS2026")
        endif()
        set(PVZ_CONFIG_WINDOWS_API Win7)
        set(PVZ_WINDOWS_API_DIRECTORY win7)
        add_compile_definitions(WINVER=0x0601 _WIN32_WINNT=0x0601)
        if(MSVC)
            add_link_options(/OSVERSION:6.1)
        endif()
        if(NOT PVZ_RENDER_BACKEND MATCHES "^(VULKAN|OPENGL|D3D9)$")
            message(FATAL_ERROR "The Win7 platform supports Vulkan, desktop OpenGL 3.0 or Direct3D 9")
        endif()
    elseif(PVZ_WINDOWS_PLATFORM STREQUAL "WIN10")
        set(PVZ_CONFIG_WINDOWS_API Win10)
        set(PVZ_WINDOWS_API_DIRECTORY win10)
        add_compile_definitions(WINVER=0x0A00 _WIN32_WINNT=0x0A00)
    else()
        message(FATAL_ERROR "PVZ_WINDOWS_PLATFORM must be WIN7 or WIN10")
    endif()
endif()
set(_PVZ_DEFAULT_VULKAN OFF)
set(_PVZ_DEFAULT_D3D12 OFF)
if(PVZ_RENDER_BACKEND STREQUAL "VULKAN")
    set(_PVZ_DEFAULT_VULKAN ON)
elseif(PVZ_RENDER_BACKEND STREQUAL "D3D12")
    set(_PVZ_DEFAULT_D3D12 ON)
endif()
option(PVZ_BUILD_FRAMEWORK_VULKAN "Build the native Vulkan renderer inside SexyFramework" ${_PVZ_DEFAULT_VULKAN})
option(PVZ_BUILD_FRAMEWORK_D3D12 "Build the native D3D12 backend and its independent gates" ${_PVZ_DEFAULT_D3D12})
if(PVZ_RENDER_BACKEND MATCHES "^(OPENGL|D3D9)$")
    if(NOT WIN32)
        message(FATAL_ERROR "The ${PVZ_RENDER_BACKEND} backend currently requires Win32")
    endif()
    if(NOT PVZ_WINDOWS_PLATFORM STREQUAL "WIN7" OR NOT CMAKE_SIZEOF_VOID_P EQUAL 8)
        message(FATAL_ERROR "The ${PVZ_RENDER_BACKEND} integration currently requires the WIN7 x64 baseline")
    endif()
    if(PVZ_BUILD_FRAMEWORK_VULKAN OR PVZ_BUILD_FRAMEWORK_D3D12)
        message(FATAL_ERROR "${PVZ_RENDER_BACKEND} builds must disable PVZ_BUILD_FRAMEWORK_VULKAN and PVZ_BUILD_FRAMEWORK_D3D12")
    endif()
endif()
if(APPLE AND (PVZ_BUILD_FRAMEWORK_VULKAN OR PVZ_BUILD_FRAMEWORK_D3D12))
    message(FATAL_ERROR "macOS uses native Metal; Vulkan/MoltenVK and D3D12 are unsupported")
endif()
if(NOT WIN32 AND PVZ_BUILD_FRAMEWORK_D3D12)
    message(FATAL_ERROR "The D3D12 backend is Windows-only; Linux builds use Vulkan")
endif()
if(WIN32 AND PVZ_WINDOWS_PLATFORM STREQUAL "WIN7" AND PVZ_BUILD_FRAMEWORK_D3D12)
    message(FATAL_ERROR "Do not build D3D12 in the Win7 configuration")
endif()
if(PVZ_BUILD_LEGACY_GAME)
    if(WIN32 AND NOT PVZ_WINDOW_BACKEND STREQUAL "WIN32")
        message(FATAL_ERROR "Windows requires the WIN32 window backend")
    elseif(CMAKE_SYSTEM_NAME STREQUAL "Linux")
        if(NOT PVZ_WINDOW_BACKEND MATCHES "^(X11|WAYLAND)$")
            message(FATAL_ERROR "Linux requires X11 or WAYLAND")
        endif()
        if(NOT PVZ_RENDER_BACKEND STREQUAL "VULKAN")
            message(FATAL_ERROR "Linux requires the VULKAN graphics backend")
        endif()
        set(PVZ_BUILD_NATIVE_WINDOW_ADAPTER ON)
    elseif(APPLE)
        if(NOT PVZ_WINDOW_BACKEND STREQUAL "COCOA" OR NOT PVZ_RENDER_BACKEND STREQUAL "METAL")
            message(FATAL_ERROR "macOS requires COCOA and native METAL")
        endif()
        if(PVZ_BUILD_NATIVE_WINDOW_ADAPTER)
            message(FATAL_ERROR "The independent Linux window adapter is unavailable on macOS")
        endif()
    elseif(NOT WIN32)
        message(FATAL_ERROR "The game implements Windows, Linux and experimental macOS")
    endif()
    if(PVZ_RENDER_BACKEND STREQUAL "VULKAN")
        if(NOT PVZ_BUILD_FRAMEWORK_VULKAN)
            message(FATAL_ERROR "VULKAN selection requires PVZ_BUILD_FRAMEWORK_VULKAN")
        endif()
    elseif(PVZ_RENDER_BACKEND STREQUAL "D3D12")
        if(NOT PVZ_BUILD_FRAMEWORK_D3D12)
            message(FATAL_ERROR "D3D12 selection requires PVZ_BUILD_FRAMEWORK_D3D12")
        endif()
    elseif(NOT ((APPLE AND PVZ_RENDER_BACKEND STREQUAL "METAL") OR
            (WIN32 AND PVZ_RENDER_BACKEND MATCHES "^(OPENGL|D3D9)$")))
        message(FATAL_ERROR "Unsupported graphics backend for this platform")
    endif()
endif()
option(PVZ_BUILD_DAT64_CONVERTER "Build the 1073 level-save dat/dat64 converter" ON)
if(PVZ_BUILD_LEGACY_GAME AND NOT PVZ_BUILD_DAT64_CONVERTER)
    message(FATAL_ERROR "Game builds require PVZ_BUILD_DAT64_CONVERTER for data/ deployment")
endif()
if(WIN32)
    set(PVZ_BASS_DLL "" CACHE FILEPATH "Native Windows bass.dll to stage beside the executable")
elseif(APPLE)
    set(PVZ_BASS_LIBRARY "" CACHE FILEPATH "Native macOS libbass.dylib to stage beside the executable")
else()
    set(PVZ_BASS_LIBRARY "" CACHE FILEPATH "Native Linux libbass.so to stage beside the executable")
endif()

# Publish build choices as typed constants without importing platform SDKs.
set(_PVZ_SYSTEM_Windows Windows)
set(_PVZ_SYSTEM_Linux Linux)
set(_PVZ_SYSTEM_Darwin MacOS)
set(_PVZ_SYSTEM_Android Android)
set(_PVZ_WINDOW_WIN32 Win32)
set(_PVZ_WINDOW_X11 X11)
set(_PVZ_WINDOW_WAYLAND Wayland)
set(_PVZ_WINDOW_COCOA Cocoa)
set(_PVZ_WINDOW_ANDROID Android)
set(_PVZ_GRAPHICS_VULKAN Vulkan)
set(_PVZ_GRAPHICS_D3D12 D3d12)
set(_PVZ_GRAPHICS_METAL Metal)
set(_PVZ_GRAPHICS_OPENGL OpenGL)
set(_PVZ_GRAPHICS_D3D9 D3d9)
set(PVZ_CONFIG_TARGET_SYSTEM "${_PVZ_SYSTEM_${CMAKE_SYSTEM_NAME}}")
set(PVZ_CONFIG_WINDOW_SYSTEM "${_PVZ_WINDOW_${PVZ_WINDOW_BACKEND}}")
set(PVZ_CONFIG_GRAPHICS_API "${_PVZ_GRAPHICS_${PVZ_RENDER_BACKEND}}")
if(PVZ_CONFIG_TARGET_SYSTEM STREQUAL "" OR
        PVZ_CONFIG_WINDOW_SYSTEM STREQUAL "" OR PVZ_CONFIG_GRAPHICS_API STREQUAL "")
    message(FATAL_ERROR "Unsupported target/window/graphics build configuration")
endif()
configure_file(CMake/BuildConfig.h.in
    "${CMAKE_CURRENT_BINARY_DIR}/generated/pvz/BuildConfig.h" @ONLY)
if(WIN32)
    configure_file(CMake/WindowsWindowApi.h.in
        "${CMAKE_CURRENT_BINARY_DIR}/generated/pvz/WindowsWindowApi.h" @ONLY)
endif()
target_include_directories(pvz_source_headers INTERFACE
    "${CMAKE_CURRENT_BINARY_DIR}/generated")

################################################################################
# Global configuration types
################################################################################
set(CMAKE_CONFIGURATION_TYPES
    "Debug"
    "Release"
    CACHE STRING "List of supported configurations." FORCE
)

set(CMAKE_CXX_STANDARD 23)

if(MSVC)
    # Keep every Windows target on the dynamic MSVC CRT.  The generator
    # expression selects /MDd only for Debug and /MD for every distribution
    # configuration (Release, RelWithDebInfo, and MinSizeRel).
    set(CMAKE_MSVC_RUNTIME_LIBRARY
        "MultiThreaded$<$<CONFIG:Debug>:Debug>DLL")
endif()

# @Patoke todo: probably add MSVC counterparts?
if(MSVC)
    set(universal_compiler_flags "")
elseif(APPLE)
    set(universal_compiler_flags "-pthread -fms-extensions -fdiagnostics-color=always")
else()
    #set(universal_compiler_flags "-fsanitize=undefined -fsanitize-trap -pthread -fuse-ld=lld -fno-omit-frame-pointer -fstack-protector-all -fms-extensions -fdiagnostics-color=always -gdwarf-2 -O0")
    set(PVZ_CPU_BASELINE "x86-64" CACHE STRING "Linux release CPU baseline")
    if(CMAKE_SYSTEM_PROCESSOR MATCHES "^(x86_64|amd64|AMD64)$")
        set(universal_compiler_flags "-pthread -fms-extensions -march=${PVZ_CPU_BASELINE} -fdiagnostics-color=always -O3")
    else()
        set(universal_compiler_flags "-pthread -fms-extensions -fdiagnostics-color=always -O3")
    endif()
endif()
set(universal_cxxflags "${CMAKE_CXX_FLAGS} ${universal_compiler_flags}")
set(universal_cflags   "${CMAKE_C_FLAGS} ${universal_compiler_flags}")

if(MSVC)
    set(warn_flags "")
elseif(CMAKE_SYSTEM_NAME STREQUAL "Linux" OR APPLE)
    set(warn_flags "-Wall -Wextra -Wno-unknown-pragmas")
else()
    set(warn_flags "-Wall -Wextra -Werror")
endif()

set(CMAKE_CXX_FLAGS "${universal_cxxflags} ${warn_flags}")
set(CMAKE_C_FLAGS   "${universal_cflags} ${warn_flags}")
if(APPLE)
    set(CMAKE_OBJCXX_FLAGS "${CMAKE_OBJCXX_FLAGS} ${universal_compiler_flags} ${warn_flags}")
endif()
if(NOT CMAKE_CONFIGURATION_TYPES AND NOT CMAKE_BUILD_TYPE)
    set(CMAKE_BUILD_TYPE Debug CACHE STRING "Build type" FORCE)
endif()
set(CMAKE_EXPORT_COMPILE_COMMANDS 1)

if(WIN32)
    if(NOT MSVC)
        set(CMAKE_RC_COMPILER_INIT windres)
    endif()
    enable_language(RC)
endif()

################################################################################
# Nuget packages function stub.
################################################################################
function(use_package TARGET PACKAGE VERSION)
    message(WARNING "No implementation of use_package. Create yours. "
                    "Package \"${PACKAGE}\" with version \"${VERSION}\" "
                    "for target \"${TARGET}\" is ignored!")
endfunction()

################################################################################
# Common utils
################################################################################
include(CMake/Utils.cmake)

################################################################################
# Additional Global Settings(add specific info there)
################################################################################
include(CMake/GlobalSettingsInclude.cmake OPTIONAL)

################################################################################
# Use solution folders feature
################################################################################
set_property(GLOBAL PROPERTY USE_FOLDERS ON)

################################################################################
# Sub-projects
################################################################################
if(PVZ_BUILD_DAT64_CONVERTER)
    add_subdirectory(tools/saveConverter/src tools/saveConverter/build)
endif()

if(PVZ_BUILD_LEGACY_GAME)
    include(CMake/Resources.cmake)
endif()

if(PVZ_BUILD_NATIVE_WINDOW_ADAPTER)
    add_subdirectory(pvzPerf/SexyAppFramework/platform SexyAppFramework/platform)
endif()

if(PVZ_BUILD_FRAMEWORK_VULKAN)
    add_subdirectory(pvzPerf/SexyAppFramework/graphics/vulkan SexyAppFramework/graphics/vulkan)
endif()

if(PVZ_BUILD_FRAMEWORK_D3D12)
    add_subdirectory(pvzPerf/SexyAppFramework/graphics/d3d12 SexyAppFramework/graphics/d3d12)
endif()

if(APPLE AND PVZ_BUILD_LEGACY_GAME)
    include(CMake/MacShaderCompiler.cmake)
    add_subdirectory(pvzPerf/SexyAppFramework/graphics/metal SexyAppFramework/graphics/metal)
endif()

if(PVZ_RENDER_BACKEND STREQUAL "OPENGL")
    target_compile_definitions(pvz_source_headers INTERFACE PVZ_GPU_OPENGL=1)
    add_subdirectory(pvzPerf/SexyAppFramework/graphics/opengl SexyAppFramework/graphics/opengl)
endif()
if(PVZ_RENDER_BACKEND STREQUAL "D3D9")
    target_compile_definitions(pvz_source_headers INTERFACE PVZ_GPU_D3D9=1)
    add_subdirectory(pvzPerf/SexyAppFramework/graphics/d3d9 SexyAppFramework/graphics/d3d9)
endif()

if(PVZ_BUILD_LEGACY_GAME)
    add_subdirectory(pvzPerf/SexyAppFramework SexyAppFramework)
endif()
if(BUILD_TESTING AND PVZ_BUILD_LEGACY_GAME)
    add_test(NAME completed_test_profile
        COMMAND "${Python3_EXECUTABLE}" -B "${CMAKE_SOURCE_DIR}/Tests/native/test_completed_profile.py")
endif()

foreach(pvzTarget IN ITEMS LawnProject sexy_native_window sexy_vulkan
        sexy_vulkan_effects sexy_d3d12 sexy_d3d12_effects
        sexy_metal sexy_metal_effects sexy_opengl sexy_d3d9 compile_numeric_scale)
    if(TARGET ${pvzTarget})
        target_link_libraries(${pvzTarget} PUBLIC pvz_source_headers)
    endif()
endforeach()

if(BUILD_TESTING)
    find_package(Threads REQUIRED)
    if(WIN32)
        add_executable(pvz_windows_platform_tests EXCLUDE_FROM_ALL Tests/native/WindowsPlatformTests.cpp)
        target_link_libraries(pvz_windows_platform_tests PRIVATE pvz_source_headers user32)
        target_compile_features(pvz_windows_platform_tests PRIVATE cxx_std_23)
        add_test(NAME pvz_windows_platform COMMAND pvz_windows_platform_tests)
        if(PVZ_WINDOWS_PLATFORM STREQUAL "WIN7" AND MSVC AND TARGET LawnProject)
            get_filename_component(_PVZ_WIN7_COMPILER_BIN "${CMAKE_CXX_COMPILER}" DIRECTORY)
            add_test(NAME pvz_win7_imports
                COMMAND powershell.exe -NoLogo -NoProfile -ExecutionPolicy Bypass
                    -File "${CMAKE_CURRENT_SOURCE_DIR}/Tests/native/check-win7-imports.ps1"
                    -Executable "$<TARGET_FILE:LawnProject>"
                    -Dumpbin "${_PVZ_WIN7_COMPILER_BIN}/dumpbin.exe")
        endif()
    endif()
    add_executable(pvz_audio_voice_tests EXCLUDE_FROM_ALL Tests/native/AudioUnitVoiceTests.cpp)
    target_link_libraries(pvz_audio_voice_tests PRIVATE pvz_source_headers Threads::Threads)
    target_compile_features(pvz_audio_voice_tests PRIVATE cxx_std_23)
    add_test(NAME pvz_audio_voice_lifetime COMMAND pvz_audio_voice_tests)
    set_tests_properties(pvz_audio_voice_lifetime PROPERTIES TIMEOUT 15)
    if((WIN32 AND MSVC) OR CMAKE_SYSTEM_NAME STREQUAL "Linux")
        add_subdirectory(Tests/performance Tests/performance/build)
    endif()
    add_executable(modern_rng_wire_tests tools/native-tests/portable_rng_tests.cpp
        pvzPerf/SexyAppFramework/misc/MTRand.cpp)
    target_compile_definitions(modern_rng_wire_tests PRIVATE NDEBUG)
    target_include_directories(modern_rng_wire_tests PRIVATE pvzPerf/SexyAppFramework)
    add_test(NAME modern_rng_wire COMMAND modern_rng_wire_tests)
    if(CMAKE_SYSTEM_NAME STREQUAL "Linux")
        add_executable(modern_numeric_buffer_tests
            tools/native-tests/numeric_buffer_tests.cpp
            pvzPerf/SexyAppFramework/misc/Buffer.cpp)
        target_include_directories(modern_numeric_buffer_tests PRIVATE pvzPerf/SexyAppFramework)
        add_test(NAME modern_numeric_buffer COMMAND modern_numeric_buffer_tests)
        foreach(target IN ITEMS modern_rng_wire_tests modern_numeric_buffer_tests)
            target_compile_options(${target} PRIVATE
                -fsanitize=address,undefined -fno-omit-frame-pointer)
            target_link_options(${target} PRIVATE -fsanitize=address,undefined)
            set_target_properties(${target} PROPERTIES
                INTERPROCEDURAL_OPTIMIZATION FALSE
                INTERPROCEDURAL_OPTIMIZATION_RELEASE FALSE)
        endforeach()
    endif()
    add_executable(modern_array_pick_tests tools/native-tests/array_pick_tests.cpp)
    add_test(NAME modern_array_pick COMMAND modern_array_pick_tests)
    if(WIN32 AND MSVC)
        add_executable(modern_typing_check_tests tools/native-tests/typing_check_tests.cpp
            pvzPerf/Lawn/System/TypingCheck.cpp)
        target_include_directories(modern_typing_check_tests PRIVATE pvzPerf/SexyAppFramework)
        add_test(NAME modern_typing_check COMMAND modern_typing_check_tests)
        add_executable(modern_numeric_buffer_asan_tests
            tools/native-tests/numeric_buffer_tests.cpp
            pvzPerf/SexyAppFramework/misc/Buffer.cpp)
        target_include_directories(modern_numeric_buffer_asan_tests PRIVATE pvzPerf/SexyAppFramework)
        target_compile_options(modern_numeric_buffer_asan_tests PRIVATE /fsanitize=address /Zi)
        target_link_options(modern_numeric_buffer_asan_tests PRIVATE /INCREMENTAL:NO /DEBUG)
        set_property(TARGET modern_numeric_buffer_asan_tests PROPERTY INTERPROCEDURAL_OPTIMIZATION FALSE)
        get_filename_component(_PVZ_MSVC_BIN "${CMAKE_CXX_COMPILER}" DIRECTORY)
        add_custom_command(TARGET modern_numeric_buffer_asan_tests POST_BUILD
            COMMAND "${CMAKE_COMMAND}" -E copy_if_different
                "${_PVZ_MSVC_BIN}/clang_rt.asan_dynamic-x86_64.dll"
                "$<TARGET_FILE_DIR:modern_numeric_buffer_asan_tests>" VERBATIM)
        add_test(NAME modern_numeric_buffer_asan COMMAND modern_numeric_buffer_asan_tests)
        set_tests_properties(modern_numeric_buffer_asan PROPERTIES TIMEOUT 60)
        add_executable(modern_crash_dump_tests tools/native-tests/crash_dump_tests.cpp
            pvzPerf/SexyAppFramework/misc/Win32CrashDump.cpp)
        add_test(NAME modern_crash_dump COMMAND modern_crash_dump_tests)
        set_tests_properties(modern_crash_dump PROPERTIES TIMEOUT 30)
    endif()
    find_package(Python3 COMPONENTS Interpreter QUIET)
    if(Python3_Interpreter_FOUND)
        add_test(
            NAME legacy_1073_render_semantics_audit
            COMMAND "${Python3_EXECUTABLE}"
                "${CMAKE_CURRENT_LIST_DIR}/tools/audit_1073_render_semantics.py")
    endif()
endif()

get_property(pvzRootTargets DIRECTORY PROPERTY BUILDSYSTEM_TARGETS)
foreach(pvzTarget IN LISTS pvzRootTargets)
    if(pvzTarget MATCHES "^modern_.*tests$")
        target_link_libraries(${pvzTarget} PRIVATE pvz_source_headers)
    endif()
endforeach()
