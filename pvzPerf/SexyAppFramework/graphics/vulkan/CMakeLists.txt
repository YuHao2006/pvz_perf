cmake_minimum_required(VERSION 3.25)
if(CMAKE_SOURCE_DIR STREQUAL CMAKE_CURRENT_SOURCE_DIR)
    project(SexyFrameworkVulkan LANGUAGES CXX)
    set(CMAKE_MSVC_RUNTIME_LIBRARY "MultiThreaded$<$<CONFIG:Debug>:Debug>DLL")
    include(CTest)
endif()

find_package(Vulkan 1.2 REQUIRED)
find_program(PVZ_GLSLC NAMES glslc HINTS "$ENV{VULKAN_SDK}/Bin"
    "C:/UserProgram/VulkanSDK/1.4.350.0/Bin" REQUIRED)
find_program(PVZ_SPIRV_VAL NAMES spirv-val HINTS "$ENV{VULKAN_SDK}/Bin"
    "C:/UserProgram/VulkanSDK/1.4.350.0/Bin" REQUIRED)

add_library(sexy_vulkan STATIC VulkanContext.cpp VulkanRenderer.cpp)
# Particle rendering uses the resident arena in every build. The reanimation
# draw policy can still be selected independently by its experimental option.
target_compile_definitions(sexy_vulkan PRIVATE PVZ_REANIM_GEOMETRY=1 PVZ_REANIM_UNIFIED=1)
if(NOT WIN32 OR NOT PVZ_WINDOWS_PLATFORM STREQUAL "WIN7")
    target_sources(sexy_vulkan PRIVATE VulkanHdrDisplay.cpp VulkanHdrObserver.cpp)
endif()
if(WIN32)
    target_sources(sexy_vulkan PRIVATE platform/Win32Surface.cpp)
elseif(ANDROID)
    target_compile_definitions(sexy_vulkan PRIVATE VK_USE_PLATFORM_ANDROID_KHR)
    target_link_libraries(sexy_vulkan PRIVATE android log)
else()
    target_sources(sexy_vulkan PRIVATE platform/LinuxSurface.cpp)
    target_link_libraries(sexy_vulkan PUBLIC sexy_native_window)
    if(PVZ_WINDOW_BACKEND STREQUAL "X11")
        find_package(X11 REQUIRED)
        set_property(SOURCE platform/LinuxSurface.cpp APPEND PROPERTY
            COMPILE_DEFINITIONS VK_USE_PLATFORM_XLIB_KHR)
        target_link_libraries(sexy_vulkan PRIVATE X11::X11)
    elseif(PVZ_WINDOW_BACKEND STREQUAL "WAYLAND")
        set_property(SOURCE platform/LinuxSurface.cpp APPEND PROPERTY
            COMPILE_DEFINITIONS VK_USE_PLATFORM_WAYLAND_KHR)
    endif()
endif()
target_include_directories(sexy_vulkan PUBLIC "${CMAKE_CURRENT_SOURCE_DIR}" "${CMAKE_CURRENT_SOURCE_DIR}/../../../Sexy.TodLib")
target_compile_features(sexy_vulkan PUBLIC cxx_std_23)
target_link_libraries(sexy_vulkan PUBLIC Vulkan::Vulkan)
if(WIN32)
    target_link_libraries(sexy_vulkan PRIVATE user32 ole32)
    if(NOT PVZ_WINDOWS_PLATFORM STREQUAL "WIN7")
        target_link_libraries(sexy_vulkan PRIVATE runtimeobject)
    endif()
endif()
if(MSVC)
    target_compile_options(sexy_vulkan PRIVATE /W4 /utf-8 /permissive-)
endif()

set(PVZ_NATIVE_SHADER_DIR "${CMAKE_CURRENT_BINARY_DIR}/shaders/$<CONFIG>")
foreach(stage IN ITEMS vs pool_vs ps hdr_ps coverage_ps caustic_cs font_cs alpha_cs color_cs reanim_unified_vs reanim_unified_gs)
    if(stage STREQUAL "vs" OR stage STREQUAL "pool_vs")
        set(shaderStage vertex)
        set(shaderSource "${CMAKE_CURRENT_SOURCE_DIR}/shaders/game_${stage}.hlsl")
        set(shaderLanguage -x hlsl)
    elseif(stage STREQUAL "reanim_unified_vs" OR stage STREQUAL "reanim_unified_gs")
        if(stage STREQUAL "reanim_unified_vs")
            set(shaderStage vertex)
            set(shaderSource "${CMAKE_CURRENT_SOURCE_DIR}/shaders/game_${stage}.vert")
        else()
            set(shaderStage geometry)
            set(shaderSource "${CMAKE_CURRENT_SOURCE_DIR}/shaders/game_${stage}.geom")
        endif()
        set(shaderLanguage "")
    elseif(stage STREQUAL "ps" OR stage STREQUAL "coverage_ps")
        # GLSL：bindless 数组采样需要 nonuniformEXT 装饰，glslc 的 HLSL 前端
        # 没有 NonUniformResourceIndex 内建
        set(shaderStage fragment)
        set(shaderSource "${CMAKE_CURRENT_SOURCE_DIR}/shaders/game_${stage}.frag")
        set(shaderLanguage "")
    elseif(stage STREQUAL "caustic_cs" OR stage STREQUAL "font_cs" OR stage STREQUAL "alpha_cs" OR stage STREQUAL "color_cs")
        # GLSL：HLSL 前端无法标注 storage image 格式（需 rgba8 匹配视图）
        set(shaderStage compute)
        set(shaderSource "${CMAKE_CURRENT_SOURCE_DIR}/shaders/game_${stage}.comp")
        set(shaderLanguage "")
    else()
        # hdr_ps 保持 HLSL：它只服务呈现单四边形（槽位跨调用动态一致，
        # 无需非一致装饰），且被 hdr_probe_cs.hlsl 以 HLSL include 复用
        set(shaderStage fragment)
        set(shaderSource "${CMAKE_CURRENT_SOURCE_DIR}/shaders/game_${stage}.hlsl")
        set(shaderLanguage -x hlsl)
    endif()
    set(output "${PVZ_NATIVE_SHADER_DIR}/game_${stage}.spv")
    add_custom_command(OUTPUT "${output}"
        COMMAND "${CMAKE_COMMAND}" -E make_directory "${PVZ_NATIVE_SHADER_DIR}"
        COMMAND "${PVZ_GLSLC}" -Werror ${shaderLanguage} "-fshader-stage=${shaderStage}"
            --target-env=vulkan1.2 -O "${shaderSource}"
            -o "${output}"
        COMMAND "${PVZ_SPIRV_VAL}" --target-env vulkan1.2 "${output}"
        DEPENDS "${shaderSource}" "${CMAKE_CURRENT_SOURCE_DIR}/../GpuParticleShader.glsl" VERBATIM)
    list(APPEND nativeShaders "${output}")
endforeach()
add_custom_target(sexy_vulkan_shaders DEPENDS ${nativeShaders})
add_dependencies(sexy_vulkan sexy_vulkan_shaders)

# User-authored scaling effects compile once while loading configuration.
find_package(directx-dxc CONFIG REQUIRED GLOBAL)
add_library(sexy_vulkan_effects STATIC
    VulkanEffectPrograms.cpp
    VulkanScaleDds.cpp
    VulkanScalePipeline.cpp
    ../../effect/ScaleEffectCompiler.cpp
    ../../effect/ScaleEffectSizing.cpp)
target_include_directories(sexy_vulkan_effects PUBLIC "${CMAKE_CURRENT_SOURCE_DIR}" "${CMAKE_CURRENT_SOURCE_DIR}/../../effect")
target_compile_features(sexy_vulkan_effects PUBLIC cxx_std_23)
target_compile_definitions(sexy_vulkan_effects PUBLIC SEXY_SCALE_EFFECT_AUTHORING=1)
target_link_libraries(sexy_vulkan_effects PUBLIC Vulkan::Vulkan PRIVATE Microsoft::DirectXShaderCompiler)
if(MSVC)
    target_compile_options(sexy_vulkan_effects PRIVATE /W4 /utf-8 /permissive-)
endif()

# Authoring parsers/DXC are available only in the explicitly offline asset tool.
add_executable(compile_numeric_scale EXCLUDE_FROM_ALL
    "${CMAKE_SOURCE_DIR}/tools/compile-numeric-scale.cpp"
    ../../effect/ScaleEffectCompiler.cpp)
target_compile_definitions(compile_numeric_scale PRIVATE SEXY_SCALE_EFFECT_AUTHORING=1)
target_compile_features(compile_numeric_scale PRIVATE cxx_std_23)
target_include_directories(compile_numeric_scale PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/../../effect")
target_link_libraries(compile_numeric_scale PRIVATE Vulkan::Vulkan Microsoft::DirectXShaderCompiler)
add_custom_command(TARGET compile_numeric_scale POST_BUILD
    COMMAND "${CMAKE_COMMAND}" -E copy_if_different
        "$<TARGET_FILE:Microsoft::DirectXShaderCompiler>" "$<TARGET_FILE_DIR:compile_numeric_scale>")
if(MSVC)
    target_compile_options(compile_numeric_scale PRIVATE /W4 /utf-8 /permissive-)
endif()

set(PVZ_EFFECTS_ROOT "${CMAKE_SOURCE_DIR}/effects")
file(GLOB_RECURSE scaleSources CONFIGURE_DEPENDS "${PVZ_EFFECTS_ROOT}/*.hlsl")
file(GLOB_RECURSE scaleIncludes CONFIGURE_DEPENDS "${PVZ_EFFECTS_ROOT}/*.hlsli")
foreach(source IN LISTS scaleSources)
    list(APPEND numericEffects "${source}.vfx")
endforeach()
if(numericEffects)
    add_custom_command(OUTPUT ${numericEffects}
        COMMAND "$<TARGET_FILE:compile_numeric_scale>" --effects "${PVZ_EFFECTS_ROOT}"
        DEPENDS compile_numeric_scale ${scaleSources} ${scaleIncludes}
        COMMENT "Baking numeric scale assets offline"
        VERBATIM)
else()
    message(STATUS "No external scaling effects found; skipping offline effect baking")
endif()
add_custom_target(bake_numeric_scale DEPENDS ${numericEffects})

target_link_libraries(sexy_vulkan PRIVATE sexy_vulkan_effects)
set_target_properties(sexy_vulkan sexy_vulkan_effects PROPERTIES
    INTERPROCEDURAL_OPTIMIZATION_RELEASE TRUE)

if(BUILD_TESTING)
    set(PVZ_TEST_EFFECTS_DIR "${CMAKE_SOURCE_DIR}/effects" CACHE PATH
        "External scaling effect fixtures for Vulkan tests")
    add_executable(sexy_vulkan_enumeration_tests tests/enumeration_tests.cpp)
    target_compile_features(sexy_vulkan_enumeration_tests PRIVATE cxx_std_23)
    target_include_directories(sexy_vulkan_enumeration_tests PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}")
    target_link_libraries(sexy_vulkan_enumeration_tests PRIVATE Vulkan::Headers)
    add_test(NAME sexy_vulkan_enumeration COMMAND sexy_vulkan_enumeration_tests)
    set_tests_properties(sexy_vulkan_enumeration PROPERTIES TIMEOUT 10)
    add_executable(sexy_vulkan_scale_compile_tests tests/scale_compile_tests.cpp)
    target_link_libraries(sexy_vulkan_scale_compile_tests PRIVATE sexy_vulkan_effects)
    target_compile_definitions(sexy_vulkan_scale_compile_tests PRIVATE
        PVZ_EFFECTS_DIR="${PVZ_TEST_EFFECTS_DIR}")
    add_custom_command(TARGET sexy_vulkan_scale_compile_tests POST_BUILD
        COMMAND "${CMAKE_COMMAND}" -E copy_if_different
            "$<TARGET_FILE:Microsoft::DirectXShaderCompiler>"
            "$<TARGET_FILE_DIR:sexy_vulkan_scale_compile_tests>")
    add_test(NAME sexy_vulkan_scale_compile COMMAND sexy_vulkan_scale_compile_tests)
    set_tests_properties(sexy_vulkan_scale_compile PROPERTIES TIMEOUT 180)
endif()

if(BUILD_TESTING AND WIN32)
    add_library(sexy_scale_authoring ALIAS sexy_vulkan_effects)
    if(WIN32 AND NOT PVZ_WINDOWS_PLATFORM STREQUAL "WIN7")
        add_executable(sexy_vulkan_hdr_observer_tests tests/hdr_observer_tests.cpp)
        target_link_libraries(sexy_vulkan_hdr_observer_tests PRIVATE sexy_vulkan ole32)
        add_test(NAME sexy_vulkan_hdr_observer COMMAND sexy_vulkan_hdr_observer_tests)
        set_tests_properties(sexy_vulkan_hdr_observer PROPERTIES TIMEOUT 60 ENVIRONMENT "VK_LAYER_VALIDATE_SYNC=1")
    endif()
    add_executable(sexy_vulkan_initialization_tests tests/initialization_tests.cpp)
    target_link_libraries(sexy_vulkan_initialization_tests PRIVATE sexy_vulkan)
    add_test(NAME sexy_vulkan_initialization COMMAND sexy_vulkan_initialization_tests)
    set_tests_properties(sexy_vulkan_initialization PROPERTIES TIMEOUT 60 ENVIRONMENT "VK_LAYER_VALIDATE_SYNC=1")
    # Opt-in interception evidence only; observations/errors must not be hidden
    # inside an automatically passing test. Includes just four clear/presents.
    add_executable(sexy_vulkan_layer_probe EXCLUDE_FROM_ALL tests/layer_probe.cpp)
    target_link_libraries(sexy_vulkan_layer_probe PRIVATE sexy_vulkan)
    set(hdrProbe "${PVZ_NATIVE_SHADER_DIR}/hdr_probe.spv")
    add_custom_command(OUTPUT "${hdrProbe}"
        COMMAND "${PVZ_GLSLC}" -Werror -x hlsl -fshader-stage=compute --target-env=vulkan1.2 -O
            "${CMAKE_CURRENT_SOURCE_DIR}/tests/hdr_probe_cs.hlsl" -o "${hdrProbe}"
        COMMAND "${PVZ_SPIRV_VAL}" --target-env vulkan1.2 "${hdrProbe}"
        DEPENDS tests/hdr_probe_cs.hlsl shaders/game_hdr_ps.hlsl VERBATIM)
    add_custom_target(sexy_vulkan_hdr_probe DEPENDS "${hdrProbe}")
    add_dependencies(sexy_vulkan_hdr_probe sexy_vulkan_shaders)
    if(NOT WIN32 OR NOT PVZ_WINDOWS_PLATFORM STREQUAL "WIN7")
        add_executable(sexy_vulkan_hdr_tests tests/hdr_tests.cpp)
        target_link_libraries(sexy_vulkan_hdr_tests PRIVATE sexy_vulkan)
        target_compile_definitions(sexy_vulkan_hdr_tests PRIVATE PVZ_NATIVE_SHADER_DIR="${PVZ_NATIVE_SHADER_DIR}")
        add_dependencies(sexy_vulkan_hdr_tests sexy_vulkan_hdr_probe)
        add_test(NAME sexy_vulkan_hdr COMMAND sexy_vulkan_hdr_tests)
        set_tests_properties(sexy_vulkan_hdr PROPERTIES TIMEOUT 60 ENVIRONMENT "VK_LAYER_VALIDATE_SYNC=1")
    endif()
    add_executable(sexy_vulkan_scale_pipeline_tests tests/scale_pipeline_tests.cpp)
    target_link_libraries(sexy_vulkan_scale_pipeline_tests PRIVATE sexy_vulkan_effects sexy_vulkan)
    target_compile_definitions(sexy_vulkan_scale_pipeline_tests PRIVATE
        PVZ_NATIVE_SHADER_DIR="${PVZ_NATIVE_SHADER_DIR}"
        PVZ_EFFECTS_DIR="${PVZ_TEST_EFFECTS_DIR}")
    add_custom_command(TARGET sexy_vulkan_scale_pipeline_tests POST_BUILD
        COMMAND "${CMAKE_COMMAND}" -E copy_if_different
            "$<TARGET_FILE:Microsoft::DirectXShaderCompiler>" "$<TARGET_FILE_DIR:sexy_vulkan_scale_pipeline_tests>")
    add_test(NAME sexy_vulkan_scale_pipeline COMMAND sexy_vulkan_scale_pipeline_tests)
    set_tests_properties(sexy_vulkan_scale_pipeline PROPERTIES TIMEOUT 180 ENVIRONMENT "VK_LAYER_VALIDATE_SYNC=1")
    add_executable(sexy_vulkan_scale_gpu_tests tests/scale_gpu_tests.cpp)
    target_link_libraries(sexy_vulkan_scale_gpu_tests PRIVATE sexy_vulkan_effects sexy_vulkan)
    target_compile_definitions(sexy_vulkan_scale_gpu_tests PRIVATE
        PVZ_EFFECTS_DIR="${PVZ_TEST_EFFECTS_DIR}")
    add_custom_command(TARGET sexy_vulkan_scale_gpu_tests POST_BUILD
        COMMAND "${CMAKE_COMMAND}" -E copy_if_different
            "$<TARGET_FILE:Microsoft::DirectXShaderCompiler>" "$<TARGET_FILE_DIR:sexy_vulkan_scale_gpu_tests>")
    add_test(NAME sexy_vulkan_scale_gpu COMMAND sexy_vulkan_scale_gpu_tests)
    set_tests_properties(sexy_vulkan_scale_gpu PROPERTIES TIMEOUT 180 ENVIRONMENT "VK_LAYER_VALIDATE_SYNC=1")
    if(WIN32)
        add_executable(sexy_vulkan_compare_tests EXCLUDE_FROM_ALL
            "${CMAKE_SOURCE_DIR}/Tests/native/BackendPixelCases.cpp")
        target_link_libraries(sexy_vulkan_compare_tests PRIVATE sexy_vulkan)
    endif()
    add_executable(sexy_vulkan_render_tests tests/render_tests.cpp)
    target_link_libraries(sexy_vulkan_render_tests PRIVATE sexy_vulkan)
    target_compile_definitions(sexy_vulkan_render_tests PRIVATE
        PVZ_NATIVE_SHADER_DIR="${PVZ_NATIVE_SHADER_DIR}")
    add_test(NAME sexy_vulkan_render_semantics COMMAND sexy_vulkan_render_tests)
    set_tests_properties(sexy_vulkan_render_semantics PROPERTIES
        TIMEOUT 60 ENVIRONMENT "VK_LAYER_VALIDATE_SYNC=1")
    if(WIN32)
    # Explicitly opt in after coordinating access to the GPU. Kept outside the
    # ordinary CTest run until production pixel and performance gates are met.
    get_target_property(reanimBenchmarkSources sexy_vulkan SOURCES)
    add_library(sexy_vulkan_reanim_unified_backend STATIC EXCLUDE_FROM_ALL ${reanimBenchmarkSources})
    target_include_directories(sexy_vulkan_reanim_unified_backend PUBLIC
        "$<TARGET_PROPERTY:sexy_vulkan,INTERFACE_INCLUDE_DIRECTORIES>")
    target_compile_features(sexy_vulkan_reanim_unified_backend PUBLIC cxx_std_23)
    target_compile_definitions(sexy_vulkan_reanim_unified_backend PUBLIC
        PVZ_REANIM_BENCHMARK=1 PVZ_REANIM_GEOMETRY=1 PVZ_REANIM_UNIFIED=1)
    target_link_libraries(sexy_vulkan_reanim_unified_backend PUBLIC Vulkan::Vulkan
        PRIVATE sexy_vulkan_effects user32 ole32)
    if(NOT PVZ_WINDOWS_PLATFORM STREQUAL "WIN7")
        target_link_libraries(sexy_vulkan_reanim_unified_backend PRIVATE runtimeobject)
    endif()
    add_dependencies(sexy_vulkan_reanim_unified_backend sexy_vulkan_shaders)
    if(MSVC)
        target_compile_options(sexy_vulkan_reanim_unified_backend PRIVATE /W4 /utf-8 /permissive-)
    endif()
    set_target_properties(sexy_vulkan_reanim_unified_backend PROPERTIES INTERPROCEDURAL_OPTIMIZATION_RELEASE TRUE)
    add_executable(sexy_vulkan_reanim_unified_tests EXCLUDE_FROM_ALL tests/reanim_tests.cpp ../../misc/FastMath.cpp)
    target_link_libraries(sexy_vulkan_reanim_unified_tests PRIVATE sexy_vulkan_reanim_unified_backend)
    target_compile_definitions(sexy_vulkan_reanim_unified_tests PRIVATE PVZ_NATIVE_SHADER_DIR="${PVZ_NATIVE_SHADER_DIR}")
    endif()
endif()
