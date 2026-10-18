# macOS arm64 runtime HLSL -> SPIR-V -> MSL prerequisites.
# Include after project(), before consumers. This module deliberately does not
# add DXC's old LLVM tree to the game's C++23 / LTO build.
#
# Integration (macOS branches only):
#   include(CMake/MacShaderCompiler.cmake)
#   target_link_libraries(<effect-compiler-target> PRIVATE PVZ::MacShaderCompiler)
#   pvz_stage_macos_shader_compiler(LawnProject)
#
# PVZ::MacDXC is the command-line executable; PVZ::MacDXCompiler supplies
# dxcapi.h and WinAdapter.h. Runtime code can load libdxcompiler.dylib relative
# to the executable, or link it through PVZ::MacShaderCompiler.
# spirv-cross-msl supplies the C++ MSL compiler, including its GLSL/core deps.
# Existing spirv-cross-msl targets (e.g. from vcpkg) are reused if already found.
include_guard(GLOBAL)
if(NOT APPLE)
    return()
endif()

if(CMAKE_CROSSCOMPILING OR NOT CMAKE_HOST_SYSTEM_NAME STREQUAL "Darwin"
        OR NOT CMAKE_OSX_ARCHITECTURES STREQUAL "arm64")
    message(FATAL_ERROR "MacShaderCompiler requires a native macOS arm64 build")
endif()

include(ExternalProject)
find_program(PVZ_MAC_SHADER_SH sh REQUIRED)
find_program(PVZ_MAC_SHADER_CMAKE cmake REQUIRED)
find_program(PVZ_MAC_SHADER_NINJA ninja REQUIRED)
find_package(Git REQUIRED)
find_package(Python3 REQUIRED COMPONENTS Interpreter)

set(PVZ_MAC_SHADER_TOOLS_ROOT "${CMAKE_BINARY_DIR}/macos-shader-tools"
    CACHE PATH "Isolated macOS shader dependency source, build and install tree")
set(PVZ_MAC_SHADER_TOOLS_JOBS "3" CACHE STRING
    "Maximum simultaneous compilation jobs for macOS shader dependencies")
get_filename_component(PVZ_MAC_SHADER_TOOLS_ROOT
    "${PVZ_MAC_SHADER_TOOLS_ROOT}" ABSOLUTE BASE_DIR "${CMAKE_BINARY_DIR}")
set(PVZ_MAC_SHADER_TOOLS_PREFIX "${PVZ_MAC_SHADER_TOOLS_ROOT}/install")
set(_pvz_mac_shader_script
    "${CMAKE_CURRENT_LIST_DIR}/../tools/build-macos-shader-tools.sh")
set(_pvz_mac_shader_args
    --work-dir "${PVZ_MAC_SHADER_TOOLS_ROOT}"
    --prefix "${PVZ_MAC_SHADER_TOOLS_PREFIX}"
    --jobs "${PVZ_MAC_SHADER_TOOLS_JOBS}")
if(CMAKE_OSX_DEPLOYMENT_TARGET)
    list(APPEND _pvz_mac_shader_args
        --deployment-target "${CMAKE_OSX_DEPLOYMENT_TARGET}")
endif()
if(CMAKE_OSX_SYSROOT)
    list(APPEND _pvz_mac_shader_args --sdk "${CMAKE_OSX_SYSROOT}")
endif()
if(TARGET spirv-cross-msl)
    list(APPEND _pvz_mac_shader_args --dxc-only)
endif()

# Imported include paths must exist at generation time, before the first build.
file(MAKE_DIRECTORY "${PVZ_MAC_SHADER_TOOLS_PREFIX}/include/dxc"
    "${PVZ_MAC_SHADER_TOOLS_PREFIX}/include/spirv_cross")
set(_pvz_mac_shader_byproducts
    "${PVZ_MAC_SHADER_TOOLS_PREFIX}/lib/libdxcompiler.dylib"
    "${PVZ_MAC_SHADER_TOOLS_PREFIX}/bin/dxc")
if(NOT TARGET spirv-cross-msl)
    foreach(_part IN ITEMS core glsl msl)
        list(APPEND _pvz_mac_shader_byproducts
            "${PVZ_MAC_SHADER_TOOLS_PREFIX}/lib/libspirv-cross-${_part}.a")
    endforeach()
endif()
ExternalProject_Add(pvz_macos_shader_tools
    PREFIX "${PVZ_MAC_SHADER_TOOLS_ROOT}/external-project"
    DOWNLOAD_COMMAND ""
    UPDATE_COMMAND ""
    CONFIGURE_COMMAND ""
    BUILD_COMMAND "${CMAKE_COMMAND}" -E env
        "PVZ_SHADER_CMAKE=${PVZ_MAC_SHADER_CMAKE}"
        "PVZ_SHADER_NINJA=${PVZ_MAC_SHADER_NINJA}"
        "PVZ_SHADER_GIT=${GIT_EXECUTABLE}"
        "PVZ_SHADER_PYTHON=${Python3_EXECUTABLE}"
        "${PVZ_MAC_SHADER_SH}" "${_pvz_mac_shader_script}" ${_pvz_mac_shader_args}
    BUILD_BYPRODUCTS ${_pvz_mac_shader_byproducts}
    # The script verifies the pins and runs incremental Ninja builds. Re-running
    # also picks up script edits and repairs removed staged artifacts.
    BUILD_ALWAYS TRUE
    INSTALL_COMMAND ""
    USES_TERMINAL_BUILD TRUE)

add_library(pvz_macos_dxcompiler SHARED IMPORTED GLOBAL)
set_target_properties(pvz_macos_dxcompiler PROPERTIES
    IMPORTED_LOCATION "${PVZ_MAC_SHADER_TOOLS_PREFIX}/lib/libdxcompiler.dylib"
    IMPORTED_SONAME "@rpath/libdxcompiler.dylib"
    INTERFACE_INCLUDE_DIRECTORIES "${PVZ_MAC_SHADER_TOOLS_PREFIX}/include/dxc")
add_dependencies(pvz_macos_dxcompiler pvz_macos_shader_tools)
add_library(PVZ::MacDXCompiler ALIAS pvz_macos_dxcompiler)
add_executable(pvz_macos_dxc IMPORTED GLOBAL)
set_target_properties(pvz_macos_dxc PROPERTIES
    IMPORTED_LOCATION "${PVZ_MAC_SHADER_TOOLS_PREFIX}/bin/dxc")
add_dependencies(pvz_macos_dxc pvz_macos_shader_tools)
add_executable(PVZ::MacDXC ALIAS pvz_macos_dxc)

if(NOT TARGET spirv-cross-msl)
    foreach(_part IN ITEMS core glsl msl)
        add_library(spirv-cross-${_part} STATIC IMPORTED GLOBAL)
        set_target_properties(spirv-cross-${_part} PROPERTIES
            IMPORTED_LOCATION
                "${PVZ_MAC_SHADER_TOOLS_PREFIX}/lib/libspirv-cross-${_part}.a"
            INTERFACE_INCLUDE_DIRECTORIES
                "${PVZ_MAC_SHADER_TOOLS_PREFIX}/include/spirv_cross;${PVZ_MAC_SHADER_TOOLS_PREFIX}/include")
        add_dependencies(spirv-cross-${_part} pvz_macos_shader_tools)
    endforeach()
    set_property(TARGET spirv-cross-glsl PROPERTY
        INTERFACE_LINK_LIBRARIES spirv-cross-core)
    set_property(TARGET spirv-cross-msl PROPERTY
        INTERFACE_LINK_LIBRARIES spirv-cross-glsl)
endif()

add_library(pvz_macos_shader_compiler INTERFACE)
target_link_libraries(pvz_macos_shader_compiler INTERFACE
    PVZ::MacDXCompiler spirv-cross-msl)
add_dependencies(pvz_macos_shader_compiler pvz_macos_shader_tools)
add_library(PVZ::MacShaderCompiler ALIAS pvz_macos_shader_compiler)

function(pvz_stage_macos_shader_compiler target)
    if(NOT TARGET "${target}")
        message(FATAL_ERROR "Cannot stage DXC for missing target: ${target}")
    endif()
    # A link dependency also triggers staging again when the dylib changes.
    target_link_libraries("${target}" PRIVATE PVZ::MacDXCompiler)
    set_property(TARGET "${target}" APPEND PROPERTY BUILD_RPATH "@loader_path")
    set_property(TARGET "${target}" APPEND PROPERTY INSTALL_RPATH "@loader_path")
    add_custom_command(TARGET "${target}" POST_BUILD
        COMMAND "${CMAKE_COMMAND}" -E copy_if_different
            "$<TARGET_FILE:PVZ::MacDXCompiler>"
            "$<TARGET_FILE_DIR:${target}>/libdxcompiler.dylib"
        VERBATIM)
endfunction()
