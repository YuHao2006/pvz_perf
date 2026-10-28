find_package(Python3 COMPONENTS Interpreter REQUIRED)
if(ANDROID OR CMAKE_SYSTEM_NAME STREQUAL "Android")
    set(PVZ_RESOURCE_COMPILER_HOST "${CMAKE_SOURCE_DIR}/out/x64-win32-vulkan/tools/resourceCompiler/build/reanimc.exe"
        CACHE FILEPATH "Host reanimc executable used while cross-compiling Android resources")
    if(NOT EXISTS "${PVZ_RESOURCE_COMPILER_HOST}")
        message(FATAL_ERROR "Android resource builds need a host reanimc.exe: ${PVZ_RESOURCE_COMPILER_HOST}")
    endif()
    add_executable(reanimc IMPORTED GLOBAL)
    set_target_properties(reanimc PROPERTIES IMPORTED_LOCATION "${PVZ_RESOURCE_COMPILER_HOST}")
else()
    add_subdirectory("${CMAKE_SOURCE_DIR}/tools/resourceCompiler/src"
        "${CMAKE_BINARY_DIR}/tools/resourceCompiler/build")
endif()

set(PVZ_RESOURCE_CACHE "${CMAKE_BINARY_DIR}/cache/resources" CACHE PATH
    "Resource compiler cache, optionally shared with a verified host build")
set(PVZ_STATIC_DEFINITION_SOURCES
    "${PVZ_GAME_SOURCE_DIR}/Sexy.TodLib/generated/GeneratedDefinitions.cpp"
    "${PVZ_GAME_SOURCE_DIR}/Sexy.TodLib/generated/GeneratedDefinitionLoading.cpp"
    "${PVZ_GAME_SOURCE_DIR}/Sexy.TodLib/generated/ZombatarAtlasData.cpp"
    "${PVZ_GAME_SOURCE_DIR}/Sexy.TodLib/generated/SceneAtlasData.cpp")
foreach(index RANGE 0 7)
    list(APPEND PVZ_STATIC_DEFINITION_SOURCES
        "${PVZ_GAME_SOURCE_DIR}/Sexy.TodLib/generated/definitions/ReanimData0${index}.cpp")
endforeach()
file(GLOB_RECURSE PVZ_RESOURCE_INPUTS CONFIGURE_DEPENDS
    "${CMAKE_SOURCE_DIR}/assets/definitions/*"
    "${CMAKE_SOURCE_DIR}/assets/runtime/*"
    "${CMAKE_SOURCE_DIR}/assets/source-art/ai/runtime/*"
    "${CMAKE_SOURCE_DIR}/assets/source-art/ai/runtime-overlay.json"
    "${PVZ_GAME_SOURCE_DIR}/*.cpp"
    "${PVZ_GAME_SOURCE_DIR}/*.h")
list(FILTER PVZ_RESOURCE_INPUTS EXCLUDE REGEX "/generated/")
list(FILTER PVZ_RESOURCE_INPUTS EXCLUDE REGEX "/ReanimTrack(Id|MphfGlobal)\\.h$")

# Keep generated contract headers visible as explicit compile inputs. MSVC's
# discovered includes may use a relative spelling while BYPRODUCTS use an
# absolute spelling; an order-only target dependency cannot invalidate an
# already-clean object after the resource producer changes that physical file.
set(PVZ_RESOURCE_CONTRACT_HEADERS
    "${PVZ_GAME_SOURCE_DIR}/Sexy.TodLib/generated/DefinitionImageBindings.h"
    "${PVZ_GAME_SOURCE_DIR}/Sexy.TodLib/generated/ZombatarImage.h"
    "${PVZ_GAME_SOURCE_DIR}/Sexy.TodLib/generated/SceneAtlasData.h"
    "${PVZ_GAME_SOURCE_DIR}/Sexy.TodLib/generated/SceneAtlasBindings.h"
    "${PVZ_GAME_SOURCE_DIR}/Sexy.TodLib/generated/GeneratedDefinitions.h"
    "${PVZ_GAME_SOURCE_DIR}/Sexy.TodLib/generated/GeneratedDefinitionStorage.h"
    "${PVZ_GAME_SOURCE_DIR}/Sexy.TodLib/generated/NumericResourceBindings.h"
    "${PVZ_GAME_SOURCE_DIR}/Sexy.TodLib/generated/ResourceLoadBindings.inc"
    "${PVZ_GAME_SOURCE_DIR}/Sexy.TodLib/generated/ParticleEmitterName.h"
    "${PVZ_GAME_SOURCE_DIR}/Sexy.TodLib/generated/ReanimVariantId.h"
    "${PVZ_GAME_SOURCE_DIR}/Sexy.TodLib/generated/ParticleVariantId.h"
    "${PVZ_GAME_SOURCE_DIR}/Sexy.TodLib/generated/LawnStrings.h"
    "${PVZ_GAME_SOURCE_DIR}/Sexy.TodLib/generated/ReanimAttacherMasks.h"
    "${PVZ_GAME_SOURCE_DIR}/Sexy.TodLib/ReanimTrackId.h"
    "${PVZ_GAME_SOURCE_DIR}/Sexy.TodLib/ReanimTrackMphfGlobal.h")

add_custom_command(
    OUTPUT "${PVZ_RESOURCE_CACHE}/resources.stamp" "${PVZ_RESOURCE_CACHE}/main.pak64"
    BYPRODUCTS
        "${PVZ_GAME_SOURCE_DIR}/Sexy.TodLib/generated/DefinitionImageBindings.h"
        "${PVZ_GAME_SOURCE_DIR}/Sexy.TodLib/generated/ZombatarImage.h"
        "${PVZ_GAME_SOURCE_DIR}/Sexy.TodLib/generated/SceneAtlasData.h"
        "${PVZ_GAME_SOURCE_DIR}/Sexy.TodLib/generated/SceneAtlasBindings.h"
        "${PVZ_GAME_SOURCE_DIR}/Sexy.TodLib/generated/GeneratedDefinitions.h"
        "${PVZ_GAME_SOURCE_DIR}/Sexy.TodLib/generated/GeneratedDefinitionStorage.h"
        ${PVZ_STATIC_DEFINITION_SOURCES}
        "${PVZ_GAME_SOURCE_DIR}/Sexy.TodLib/generated/NumericResourceBindings.h"
        "${PVZ_GAME_SOURCE_DIR}/Sexy.TodLib/generated/ResourceLoadBindings.inc"
        "${PVZ_GAME_SOURCE_DIR}/Sexy.TodLib/generated/ParticleEmitterName.h"
        "${PVZ_GAME_SOURCE_DIR}/Sexy.TodLib/generated/ReanimVariantId.h"
        "${PVZ_GAME_SOURCE_DIR}/Sexy.TodLib/generated/ParticleVariantId.h"
        "${PVZ_GAME_SOURCE_DIR}/Sexy.TodLib/generated/LawnStrings.h"
        "${PVZ_GAME_SOURCE_DIR}/Sexy.TodLib/generated/LawnStrings.cpp"
        "${PVZ_GAME_SOURCE_DIR}/Sexy.TodLib/generated/ReanimAttacherMasks.h"
        "${PVZ_GAME_SOURCE_DIR}/Sexy.TodLib/ReanimTrackId.h"
        "${PVZ_GAME_SOURCE_DIR}/Sexy.TodLib/ReanimTrackMphfGlobal.h"
    COMMAND "${Python3_EXECUTABLE}" -B
        "${CMAKE_SOURCE_DIR}/tools/resourcePipeline/src/build_resources.py"
        --compiler "$<TARGET_FILE:reanimc>" --cache "${PVZ_RESOURCE_CACHE}"
        --config "${CMAKE_SOURCE_DIR}/assets/definitions/ResourceBuild.pvzbuild"
    DEPENDS reanimc ${PVZ_RESOURCE_INPUTS}
        "${CMAKE_SOURCE_DIR}/tools/resourcePipeline/src/build_resources.py"
        "${CMAKE_SOURCE_DIR}/tools/runtime_asset_sources.py"
        "${CMAKE_SOURCE_DIR}/tools/definition_atlas.py"
        "${CMAKE_SOURCE_DIR}/tools/projectile_atlas.py"
        "${CMAKE_SOURCE_DIR}/tools/zombatar_atlas.py"
        "${CMAKE_SOURCE_DIR}/tools/scene_atlas.py"
        "${CMAKE_SOURCE_DIR}/tools/definition_catalog.py"
        "${CMAKE_SOURCE_DIR}/tools/static_definitions.py"
        "${CMAKE_SOURCE_DIR}/tools/static_definition_codegen.py"
        "${CMAKE_SOURCE_DIR}/tools/static_reanim_codegen.py"
        "${CMAKE_SOURCE_DIR}/tools/static_particle_codegen.py"
        "${CMAKE_SOURCE_DIR}/tools/resource_build_config.py"
        "${CMAKE_SOURCE_DIR}/tools/exact_atlas.py"
        "${CMAKE_SOURCE_DIR}/tools/compile_numeric_resources.py"
        "${CMAKE_SOURCE_DIR}/tools/resource_authoring.py"
        "${CMAKE_SOURCE_DIR}/tools/compile_numeric_fonts.py"
        "${CMAKE_SOURCE_DIR}/tools/build_numeric_runtime_pak64.py"
        "${CMAKE_SOURCE_DIR}/tools/gen_reanim_attacher_masks.py"
        "${CMAKE_SOURCE_DIR}/tools/reanim_type_map.txt"
        "${CMAKE_SOURCE_DIR}/tools/reanim_track_families.txt"
        "${CMAKE_SOURCE_DIR}/tools/font_symbol_ids.bin"
        "${PVZ_GAME_SOURCE_DIR}/Resources.h"
        "${PVZ_GAME_SOURCE_DIR}/Sexy.TodLib/ParticleImageVariants.inc"
    COMMENT "Compiling definitions, generated C++ and runtime PAK64"
    VERBATIM)
add_custom_target(pvz_resources
    COMMAND "${CMAKE_COMMAND}" -E make_directory "${CMAKE_BINARY_DIR}/$<CONFIG>"
    COMMAND "${CMAKE_COMMAND}" -E copy_if_different
        "${PVZ_RESOURCE_CACHE}/main.pak64" "${CMAKE_BINARY_DIR}/$<CONFIG>/main.pak64"
    DEPENDS "${PVZ_RESOURCE_CACHE}/resources.stamp" "${PVZ_RESOURCE_CACHE}/main.pak64"
    VERBATIM)
