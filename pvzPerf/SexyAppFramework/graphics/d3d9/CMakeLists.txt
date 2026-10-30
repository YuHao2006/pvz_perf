if(NOT WIN32)
    message(FATAL_ERROR "Direct3D9Ex requires Windows")
endif()
find_program(PVZ_FXC_EXECUTABLE NAMES fxc
    HINTS "$ENV{WindowsSdkDir}/bin/$ENV{WindowsSDKVersion}/x64"
          "$ENV{WindowsSdkDir}/bin/x64"
    REQUIRED)
file(GLOB shaderSources CONFIGURE_DEPENDS "${CMAKE_CURRENT_SOURCE_DIR}/shaders/*.hlsl")
set(shaderOutputs)
function(pvz_d3d9_shader source entry profile output)
    set(destination "${CMAKE_CURRENT_BINARY_DIR}/shaders/${output}.cso")
    add_custom_command(OUTPUT "${destination}"
        COMMAND "${CMAKE_COMMAND}" -E make_directory "${CMAKE_CURRENT_BINARY_DIR}/shaders"
        COMMAND "${PVZ_FXC_EXECUTABLE}" /nologo /O3 /Gis /WX
            /T "${profile}" /E "${entry}" /Fo "${destination}"
            "${CMAKE_CURRENT_SOURCE_DIR}/shaders/${source}.hlsl"
        DEPENDS ${shaderSources}
        VERBATIM)
    set(shaderOutputs ${shaderOutputs} "${destination}" PARENT_SCOPE)
endfunction()
pvz_d3d9_shader(scene_vs sceneVS vs_3_0 scene_vs)
pvz_d3d9_shader(image_vs imageVS vs_3_0 image_vs)
pvz_d3d9_shader(scene_ps scenePS ps_3_0 scene_ps)
pvz_d3d9_shader(image_ps copyPS ps_3_0 copy_ps)
pvz_d3d9_shader(image_ps colorizePS ps_3_0 colorize_ps)
pvz_d3d9_shader(image_ps composeAlphaPS ps_3_0 compose_alpha_ps)
pvz_d3d9_shader(caustics_ps causticsPS ps_3_0 caustics_ps)
pvz_d3d9_shader(font_ps fontPS ps_3_0 font_ps)
pvz_d3d9_shader(present_ps presentPS ps_3_0 present_ps)
pvz_d3d9_shader(pool_vs poolVS vs_3_0 pool_vs)
add_custom_target(sexy_d3d9_shaders DEPENDS ${shaderOutputs})
add_library(sexy_d3d9 STATIC D3d9Context.cpp D3d9Renderer.cpp
    D3d9ImageOps.cpp ../../effect/ScaleEffectSizing.cpp)
target_sources(sexy_d3d9 PRIVATE ../PoolMesh.cpp)
include(CheckIPOSupported)
check_ipo_supported(RESULT d3d9IpoSupported OUTPUT d3d9IpoError LANGUAGES CXX)
if(NOT d3d9IpoSupported)
    message(FATAL_ERROR "Direct3D9 Release requires LTO: ${d3d9IpoError}")
endif()
set_property(TARGET sexy_d3d9 PROPERTY INTERPROCEDURAL_OPTIMIZATION_RELEASE TRUE)
target_compile_features(sexy_d3d9 PUBLIC cxx_std_23)
target_compile_definitions(sexy_d3d9 PUBLIC PVZ_GPU_D3D9=1)
target_include_directories(sexy_d3d9 PUBLIC "${CMAKE_SOURCE_DIR}"
    "${CMAKE_SOURCE_DIR}/pvzPerf" "${CMAKE_SOURCE_DIR}/pvzPerf/SexyAppFramework"
    "${CMAKE_CURRENT_SOURCE_DIR}")
target_link_libraries(sexy_d3d9 PUBLIC user32 gdi32)
add_dependencies(sexy_d3d9 sexy_d3d9_shaders)
if(TARGET pvz_resources)
    add_dependencies(sexy_d3d9 pvz_resources)
endif()
if(MSVC)
    target_compile_options(sexy_d3d9 PRIVATE /W4 /utf-8 /permissive- /fp:strict)
endif()
if(BUILD_TESTING)
    add_executable(sexy_d3d9_render_tests "${CMAKE_SOURCE_DIR}/Tests/native/OpenGLRendererTests.cpp")
    target_compile_definitions(sexy_d3d9_render_tests PRIVATE PVZ_TEST_D3D9=1)
    set_property(TARGET sexy_d3d9_render_tests PROPERTY INTERPROCEDURAL_OPTIMIZATION_RELEASE TRUE)
    target_link_libraries(sexy_d3d9_render_tests PRIVATE sexy_d3d9)
    add_test(NAME sexy_d3d9_render COMMAND sexy_d3d9_render_tests
        "${CMAKE_CURRENT_BINARY_DIR}/shaders")
    set_tests_properties(sexy_d3d9_render PROPERTIES TIMEOUT 120 RUN_SERIAL TRUE)
    add_executable(sexy_d3d9_compare_tests EXCLUDE_FROM_ALL
        "${CMAKE_SOURCE_DIR}/Tests/native/BackendPixelCases.cpp")
    target_compile_definitions(sexy_d3d9_compare_tests PRIVATE PVZ_COMPARE_D3D9=1)
    set_property(TARGET sexy_d3d9_compare_tests PROPERTY INTERPROCEDURAL_OPTIMIZATION_RELEASE TRUE)
    target_link_libraries(sexy_d3d9_compare_tests PRIVATE sexy_d3d9)
    if(MSVC)
        target_compile_options(sexy_d3d9_render_tests PRIVATE /fp:strict)
        target_compile_options(sexy_d3d9_compare_tests PRIVATE /fp:strict)
    endif()
endif()
