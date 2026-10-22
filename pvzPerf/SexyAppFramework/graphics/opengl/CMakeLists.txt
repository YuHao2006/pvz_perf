if(NOT WIN32)
    message(FATAL_ERROR "OpenGL currently requires the Win32 WGL window backend")
endif()
add_library(sexy_opengl STATIC
    OpenGLApi.cpp OpenGLContext.cpp OpenGLRenderer.cpp OpenGLShaders.cpp OpenGLImageOps.cpp
    ../../effect/ScaleEffectSizing.cpp)
set_property(TARGET sexy_opengl PROPERTY INTERPROCEDURAL_OPTIMIZATION_RELEASE TRUE)
target_compile_features(sexy_opengl PUBLIC cxx_std_23)
target_compile_definitions(sexy_opengl PUBLIC PVZ_GPU_OPENGL=1)
target_include_directories(sexy_opengl PUBLIC
    "${CMAKE_SOURCE_DIR}"
    "${CMAKE_SOURCE_DIR}/pvzPerf"
    "${CMAKE_SOURCE_DIR}/pvzPerf/SexyAppFramework"
    "${CMAKE_CURRENT_SOURCE_DIR}")
target_link_libraries(sexy_opengl PUBLIC opengl32 user32 gdi32)
if(TARGET pvz_resources)
    add_dependencies(sexy_opengl pvz_resources)
endif()
if(MSVC)
    target_compile_options(sexy_opengl PRIVATE /W4 /utf-8 /permissive- /fp:strict)
endif()
if(BUILD_TESTING)
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
        target_compile_options(sexy_opengl_font_weights_tests PRIVATE /fp:strict)
        target_compile_options(sexy_opengl_render_tests PRIVATE /fp:strict)
    endif()
endif()
