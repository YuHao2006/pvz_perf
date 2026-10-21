cmake_minimum_required(VERSION 3.25)

if(CMAKE_SOURCE_DIR STREQUAL CMAKE_CURRENT_SOURCE_DIR)
    project(PvzDat64Converter LANGUAGES CXX)
endif()

get_filename_component(PVZ_CONVERTER_ROOT "${CMAKE_CURRENT_SOURCE_DIR}/../../.." ABSOLUTE)
add_executable(pvz_dat64_converter
    main.cpp
    LevelSaveConverter.cpp
    LevelSaveConverter.h
    "${PVZ_CONVERTER_ROOT}/pvzPerf/Lawn/System/LevelSaveFormat.h"
    "${PVZ_CONVERTER_ROOT}/pvzPerf/Lawn/System/Dat64TimeSchema.h"
)

target_compile_features(pvz_dat64_converter PRIVATE cxx_std_23)
target_include_directories(pvz_dat64_converter PRIVATE
    "${PVZ_CONVERTER_ROOT}" "${PVZ_CONVERTER_ROOT}/pvzPerf")

if(MSVC)
    set_property(TARGET pvz_dat64_converter PROPERTY
        MSVC_RUNTIME_LIBRARY "MultiThreaded$<$<CONFIG:Debug>:Debug>")
    target_compile_options(pvz_dat64_converter PRIVATE /utf-8 /W4 /permissive-)
    target_compile_definitions(pvz_dat64_converter PRIVATE
        _SILENCE_CXX20_U8PATH_DEPRECATION_WARNING)
endif()

include(CheckIPOSupported)
check_ipo_supported(RESULT PVZ_DAT64_IPO_SUPPORTED OUTPUT PVZ_DAT64_IPO_ERROR)
if(PVZ_DAT64_IPO_SUPPORTED)
    set_property(TARGET pvz_dat64_converter PROPERTY
        INTERPROCEDURAL_OPTIMIZATION_RELEASE TRUE)
endif()

install(TARGETS pvz_dat64_converter RUNTIME DESTINATION data)
