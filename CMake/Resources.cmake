find_package(Python3 COMPONENTS Interpreter REQUIRED)
add_subdirectory("${CMAKE_SOURCE_DIR}/tools/resourceCompiler/src"
    "${CMAKE_BINARY_DIR}/tools/resourceCompiler/build")

set(PVZ_RESOURCE_CACHE "${CMAKE_BINARY_DIR}/cache/resources")
file(GLOB_RECURSE PVZ_RESOURCE_INPUTS CONFIGURE_DEPENDS
    "${CMAKE_SOURCE_DIR}/assets/definitions/*"
    "${CMAKE_SOURCE_DIR}/assets/runtime/*"
    "${PVZ_GAME_SOURCE_DIR}/*.cpp"
    "${PVZ_GAME_SOURCE_DIR}/*.h")
list(FILTER PVZ_RESOURCE_INPUTS EXCLUDE REGEX "/generated/")
list(FILTER PVZ_RESOURCE_INPUTS EXCLUDE REGEX "/ReanimTrack(Id|MphfGlobal)\\.h$")

add_custom_command(
    OUTPUT "${PVZ_RESOURCE_CACHE}/resources.stamp" "${PVZ_RESOURCE_CACHE}/main.pak64"
    COMMAND "${Python3_EXECUTABLE}" -B
        "${CMAKE_SOURCE_DIR}/tools/resourcePipeline/src/build_resources.py"
        --compiler "$<TARGET_FILE:reanimc>" --cache "${PVZ_RESOURCE_CACHE}"
    DEPENDS reanimc ${PVZ_RESOURCE_INPUTS}
        "${CMAKE_SOURCE_DIR}/tools/resourcePipeline/src/build_resources.py"
        "${CMAKE_SOURCE_DIR}/tools/compile_numeric_resources.py"
        "${CMAKE_SOURCE_DIR}/tools/compile_numeric_fonts.py"
        "${CMAKE_SOURCE_DIR}/tools/build_numeric_runtime_pak64.py"
        "${CMAKE_SOURCE_DIR}/tools/gen_image_symbol_registry.py"
        "${CMAKE_SOURCE_DIR}/tools/gen_reanim_attacher_masks.py"
        "${CMAKE_SOURCE_DIR}/tools/reanim_type_map.txt"
        "${CMAKE_SOURCE_DIR}/tools/reanim_track_families.txt"
        "${CMAKE_SOURCE_DIR}/tools/font_symbol_ids.bin"
        "${PVZ_GAME_SOURCE_DIR}/Sexy.TodLib/generated/image_symbol_ids.bin"
    COMMENT "Compiling definitions, generated C++ and runtime PAK64"
    VERBATIM)
add_custom_target(pvz_resources
    COMMAND "${CMAKE_COMMAND}" -E make_directory "${CMAKE_BINARY_DIR}/$<CONFIG>"
    COMMAND "${CMAKE_COMMAND}" -E copy_if_different
        "${PVZ_RESOURCE_CACHE}/main.pak64" "${CMAKE_BINARY_DIR}/$<CONFIG>/main.pak64"
    DEPENDS "${PVZ_RESOURCE_CACHE}/resources.stamp" "${PVZ_RESOURCE_CACHE}/main.pak64"
    VERBATIM)
