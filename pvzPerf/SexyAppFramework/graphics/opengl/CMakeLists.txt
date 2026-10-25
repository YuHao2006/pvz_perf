if(NOT WIN32)
    message(FATAL_ERROR "OpenGL currently requires the Win32 WGL window backend")
endif()
set(PVZ_OPENGL_REANIM_RESIDENT ON) # Shared resident arena is required by particles.
set(SEXY_OPENGL_SOURCES
    OpenGLApi.cpp OpenGLContext.cpp OpenGLRenderer.cpp OpenGLShaders.cpp OpenGLImageOps.cpp OpenGLReanim.cpp
    ../../effect/ScaleEffectSizing.cpp)
set_property(DIRECTORY APPEND PROPERTY CMAKE_CONFIGURE_DEPENDS "${CMAKE_CURRENT_SOURCE_DIR}/../GpuParticleShader.glsl")
file(READ "${CMAKE_CURRENT_SOURCE_DIR}/../GpuParticleShader.glsl" PVZ_PARTICLE_SHADER_SOURCE)
configure_file(OpenGLParticleShader.h.in "${CMAKE_CURRENT_BINARY_DIR}/OpenGLParticleShader.h" @ONLY)
function(add_sexy_opengl_library target)
add_library(${target} STATIC ${SEXY_OPENGL_SOURCES})
set_property(TARGET ${target} PROPERTY INTERPROCEDURAL_OPTIMIZATION_RELEASE TRUE)
target_compile_features(${target} PUBLIC cxx_std_23)
target_compile_definitions(${target} PUBLIC PVZ_GPU_OPENGL=1)
target_include_directories(${target} PUBLIC
    "${CMAKE_SOURCE_DIR}"
    "${CMAKE_SOURCE_DIR}/pvzPerf"
    "${CMAKE_SOURCE_DIR}/pvzPerf/SexyAppFramework"
    "${CMAKE_CURRENT_SOURCE_DIR}")
target_include_directories(${target} PRIVATE "${CMAKE_CURRENT_BINARY_DIR}")
target_link_libraries(${target} PUBLIC opengl32 user32 gdi32)
if(TARGET pvz_resources)
    add_dependencies(${target} pvz_resources)
endif()
if(MSVC)
    target_compile_options(${target} PRIVATE /W4 /utf-8 /permissive- /fp:strict)
endif()
endfunction()
add_sexy_opengl_library(sexy_opengl)
if(PVZ_OPENGL_REANIM_RESIDENT)
    target_compile_definitions(sexy_opengl PUBLIC PVZ_OPENGL_REANIM_RESIDENT=1)
endif()
if(BUILD_TESTING)
    add_sexy_opengl_library(sexy_opengl_reanim_diagnostics)
    target_compile_definitions(sexy_opengl_reanim_diagnostics PUBLIC
        PVZ_OPENGL_REANIM_RESIDENT=1 PVZ_OPENGL_REANIM_DIAGNOSTICS=1)
    add_executable(sexy_opengl_reanim_tests tests/reanim_tests.cpp ../../misc/FastMath.cpp)
    target_link_libraries(sexy_opengl_reanim_tests PRIVATE sexy_opengl_reanim_diagnostics)
    add_test(NAME sexy_opengl_reanim COMMAND sexy_opengl_reanim_tests)
    set_tests_properties(sexy_opengl_reanim PROPERTIES TIMEOUT 120 RUN_SERIAL TRUE)
    # Explicit experiment only. Reuses the backend and exact CPU/GS parity suite;
    # production and ordinary correctness targets never compile this helper.
    add_sexy_opengl_library(sexy_opengl_reanim_compute_experiment)
    set_property(TARGET sexy_opengl_reanim_compute_experiment PROPERTY EXCLUDE_FROM_ALL TRUE)
    target_sources(sexy_opengl_reanim_compute_experiment PRIVATE OpenGLReanimCompute.cpp)
    target_compile_definitions(sexy_opengl_reanim_compute_experiment PUBLIC
        PVZ_OPENGL_REANIM_RESIDENT=1 PVZ_OPENGL_REANIM_DIAGNOSTICS=1
        PVZ_OPENGL_REANIM_COMPUTE_EXPERIMENT=1)
    add_executable(sexy_opengl_reanim_compute_tests EXCLUDE_FROM_ALL
        tests/reanim_tests.cpp ../../misc/FastMath.cpp)
    target_link_libraries(sexy_opengl_reanim_compute_tests PRIVATE sexy_opengl_reanim_compute_experiment)
    add_sexy_opengl_library(sexy_opengl_reanim_vertex_experiment)
    set_property(TARGET sexy_opengl_reanim_vertex_experiment PROPERTY EXCLUDE_FROM_ALL TRUE)
    target_compile_definitions(sexy_opengl_reanim_vertex_experiment PUBLIC
        PVZ_OPENGL_REANIM_RESIDENT=1 PVZ_OPENGL_REANIM_DIAGNOSTICS=1
        PVZ_OPENGL_REANIM_VERTEX_EXPERIMENT=1)
    add_executable(sexy_opengl_reanim_vertex_tests EXCLUDE_FROM_ALL
        tests/reanim_tests.cpp ../../misc/FastMath.cpp)
    target_link_libraries(sexy_opengl_reanim_vertex_tests PRIVATE sexy_opengl_reanim_vertex_experiment)
    add_executable(sexy_opengl_compare_tests EXCLUDE_FROM_ALL
        "${CMAKE_SOURCE_DIR}/Tests/native/BackendPixelCases.cpp")
    target_compile_definitions(sexy_opengl_compare_tests PRIVATE PVZ_COMPARE_GL=1)
    target_link_libraries(sexy_opengl_compare_tests PRIVATE sexy_opengl)
    add_executable(sexy_opengl_font_weights_tests
        "${CMAKE_SOURCE_DIR}/Tests/native/OpenGLFontWeightsTests.cpp")
    target_link_libraries(sexy_opengl_font_weights_tests PRIVATE pvz_source_headers)
    target_compile_features(sexy_opengl_font_weights_tests PRIVATE cxx_std_23)
    add_test(NAME sexy_opengl_font_weights COMMAND sexy_opengl_font_weights_tests)
    add_executable(sexy_opengl_render_tests
        "${CMAKE_SOURCE_DIR}/Tests/native/OpenGLRendererTests.cpp")
    target_link_libraries(sexy_opengl_render_tests PRIVATE sexy_opengl)
    add_test(NAME sexy_opengl_render COMMAND sexy_opengl_render_tests)
    set_tests_properties(sexy_opengl_render PROPERTIES TIMEOUT 120 RUN_SERIAL TRUE)
    if(MSVC)
        target_compile_options(sexy_opengl_reanim_tests PRIVATE /fp:strict /utf-8 /W4)
        target_compile_options(sexy_opengl_reanim_compute_tests PRIVATE /fp:strict /utf-8 /W4)
        target_compile_options(sexy_opengl_reanim_vertex_tests PRIVATE /fp:strict /utf-8 /W4)
        target_compile_options(sexy_opengl_font_weights_tests PRIVATE /fp:strict)
        target_compile_options(sexy_opengl_render_tests PRIVATE /fp:strict)
    endif()
endif()
