cmake_minimum_required(VERSION 3.25)
if(CMAKE_SOURCE_DIR STREQUAL CMAKE_CURRENT_SOURCE_DIR)
    project(SexyFrameworkMetal LANGUAGES CXX OBJCXX)
endif()
if(NOT APPLE)
    message(FATAL_ERROR "The native Metal renderer requires macOS")
endif()
enable_language(OBJCXX)
find_program(PVZ_XCRUN xcrun REQUIRED)
find_library(PVZ_METAL_FRAMEWORK Metal REQUIRED)
find_library(PVZ_QUARTZCORE_FRAMEWORK QuartzCore REQUIRED)
find_library(PVZ_FOUNDATION_FRAMEWORK Foundation REQUIRED)
set(shaderDirectory "${CMAKE_CURRENT_BINARY_DIR}/shaders")
# Both animation definitions and particles use the resident GPU arenas.
# Particle rendering has no CPU path, so this kernel is required on Metal.
file(GLOB metalSources CONFIGURE_DEPENDS "${CMAKE_CURRENT_SOURCE_DIR}/shaders/*.metal")
if(NOT metalSources)
    message(FATAL_ERROR "Hand-written Metal shader sources are required")
endif()
set(metalObjects)
foreach(source IN LISTS metalSources)
    get_filename_component(name "${source}" NAME_WE)
    set(object "${shaderDirectory}/${name}.air")
    add_custom_command(OUTPUT "${object}"
        COMMAND "${CMAKE_COMMAND}" -E make_directory "${shaderDirectory}"
        COMMAND "${PVZ_XCRUN}" -sdk macosx metal -std=metal3.0 -fno-fast-math
            -c "${source}" -o "${object}"
        DEPENDS "${source}" "${CMAKE_CURRENT_SOURCE_DIR}/MetalShaderTypes.h"
        VERBATIM)
    list(APPEND metalObjects "${object}")
endforeach()
add_custom_command(OUTPUT "${shaderDirectory}/game.metallib"
    COMMAND "${PVZ_XCRUN}" -sdk macosx metallib ${metalObjects}
        -o "${shaderDirectory}/game.metallib"
    DEPENDS ${metalObjects}
    VERBATIM)
add_custom_target(sexy_metal_shaders DEPENDS "${shaderDirectory}/game.metallib")
add_library(sexy_metal STATIC MetalContext.mm MetalRenderer.mm)
target_sources(sexy_metal PRIVATE ../PoolMesh.cpp)
target_compile_features(sexy_metal PUBLIC cxx_std_23)
set_target_properties(sexy_metal PROPERTIES
    OBJCXX_STANDARD 23 OBJCXX_STANDARD_REQUIRED YES OBJCXX_EXTENSIONS NO)
target_compile_options(sexy_metal PRIVATE -fobjc-arc -Wall -Wextra)
target_include_directories(sexy_metal PUBLIC
    "${CMAKE_CURRENT_SOURCE_DIR}" "${CMAKE_CURRENT_SOURCE_DIR}/../../..")
target_link_libraries(sexy_metal PRIVATE
    "${PVZ_METAL_FRAMEWORK}" "${PVZ_QUARTZCORE_FRAMEWORK}" "${PVZ_FOUNDATION_FRAMEWORK}")
add_dependencies(sexy_metal sexy_metal_shaders)
add_library(sexy_metal_effects STATIC
    ../../effect/ScaleEffectCompiler.cpp
    ../../effect/ScaleEffectSizing.cpp
    MetalScalePipeline.mm)
target_compile_features(sexy_metal_effects PUBLIC cxx_std_23)
target_compile_definitions(sexy_metal_effects PUBLIC SEXY_SCALE_EFFECT_AUTHORING=1)
target_compile_options(sexy_metal_effects PRIVATE
    "$<$<COMPILE_LANGUAGE:OBJCXX>:-fobjc-arc>")
target_link_libraries(sexy_metal_effects PRIVATE PVZ::MacShaderCompiler
    "${PVZ_METAL_FRAMEWORK}" "${PVZ_FOUNDATION_FRAMEWORK}")
target_link_libraries(sexy_metal PRIVATE sexy_metal_effects)
target_include_directories(sexy_metal_effects PUBLIC
    "${CMAKE_CURRENT_SOURCE_DIR}/../../effect")
set_target_properties(sexy_metal sexy_metal_effects PROPERTIES
    OBJCXX_STANDARD 23 OBJCXX_STANDARD_REQUIRED YES OBJCXX_EXTENSIONS NO
    INTERPROCEDURAL_OPTIMIZATION_RELEASE TRUE)
