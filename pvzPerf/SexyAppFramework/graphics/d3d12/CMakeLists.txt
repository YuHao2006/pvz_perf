cmake_minimum_required(VERSION 3.25)
if(CMAKE_SOURCE_DIR STREQUAL CMAKE_CURRENT_SOURCE_DIR)
    project(SexyFrameworkD3d12 LANGUAGES CXX)
    set(CMAKE_MSVC_RUNTIME_LIBRARY "MultiThreaded$<$<CONFIG:Debug>:Debug>DLL")
    include(CTest)
endif()
if(NOT WIN32)
    message(FATAL_ERROR "D3D12 requires the Win32 native window backend")
endif()
find_program(PVZ_DXC NAMES dxc
    HINTS "$ENV{VULKAN_SDK}/Bin"
          "C:/UserProgram/vcpkg/installed/x64-windows-static-md/tools/directx-dxc"
    REQUIRED)
find_package(Vulkan REQUIRED)
find_package(directx-dxc CONFIG REQUIRED GLOBAL
    HINTS "C:/UserProgram/vcpkg/installed/x64-windows-static-md/share/directx-dxc")
set(shaderDirectory "${CMAKE_CURRENT_BINARY_DIR}/shaders")
function(d3d12_shader source entry profile output)
    set(binary "${shaderDirectory}/${output}.dxil")
    add_custom_command(OUTPUT "${binary}"
        COMMAND "${CMAKE_COMMAND}" -E make_directory "${shaderDirectory}"
        COMMAND "${PVZ_DXC}" -WX -Ges -HV 2021 -O3 -T "${profile}" -E "${entry}"
            "${CMAKE_CURRENT_SOURCE_DIR}/shaders/${source}.hlsl" -Fo "${binary}"
        DEPENDS "${CMAKE_CURRENT_SOURCE_DIR}/shaders/${source}.hlsl"
            "${CMAKE_CURRENT_SOURCE_DIR}/shaders/game.hlsl"
        VERBATIM)
    set(d3d12Shaders ${d3d12Shaders} "${binary}" PARENT_SCOPE)
endfunction()
d3d12_shader(game VSMain vs_6_0 game_vs)
d3d12_shader(game PSMain ps_6_0 game_ps)
d3d12_shader(game SpritePS ps_6_0 game_sprite_ps)
d3d12_shader(game MixedSpritePS ps_6_0 game_sprite_mixed_ps)
d3d12_shader(game_pool PoolVS vs_6_0 game_pool_vs)
foreach(stage IN ITEMS alpha color font caustic)
    d3d12_shader("game_${stage}_cs" CSMain cs_6_0 "game_${stage}_cs")
endforeach()
d3d12_shader(game_hdr VSMain vs_6_0 game_present_vs)
d3d12_shader(game_hdr PSMain ps_6_0 game_present_ps)
add_custom_target(sexy_d3d12_shaders DEPENDS ${d3d12Shaders})
add_library(sexy_d3d12 STATIC D3d12Context.cpp D3d12Renderer.cpp)
target_sources(sexy_d3d12 PRIVATE
    ../vulkan/VulkanHdrDisplay.cpp ../vulkan/VulkanHdrObserver.cpp)
target_compile_features(sexy_d3d12 PUBLIC cxx_std_23)
target_include_directories(sexy_d3d12 PUBLIC "${CMAKE_CURRENT_SOURCE_DIR}")
target_link_libraries(sexy_d3d12 PRIVATE d3d12 dxgi dxguid user32 runtimeobject ole32)
add_dependencies(sexy_d3d12 sexy_d3d12_shaders)
add_library(sexy_d3d12_effects STATIC
    D3d12ScalePipeline.cpp D3d12ScaleDds.cpp
    ../../effect/ScaleEffectCompiler.cpp ../../effect/ScaleEffectSizing.cpp)
target_compile_features(sexy_d3d12_effects PUBLIC cxx_std_23)
target_compile_definitions(sexy_d3d12_effects PUBLIC SEXY_SCALE_EFFECT_AUTHORING=1)
target_include_directories(sexy_d3d12_effects PUBLIC "${CMAKE_CURRENT_SOURCE_DIR}")
target_link_libraries(sexy_d3d12_effects PRIVATE Vulkan::Headers
    d3d12 dxgi dxguid Microsoft::DirectXShaderCompiler)
target_link_libraries(sexy_d3d12 PUBLIC sexy_d3d12_effects)
set_target_properties(sexy_d3d12 sexy_d3d12_effects PROPERTIES
    INTERPROCEDURAL_OPTIMIZATION_RELEASE TRUE)
if(MSVC)
    target_compile_options(sexy_d3d12 PRIVATE /W4 /utf-8 /permissive-)
    target_compile_options(sexy_d3d12_effects PRIVATE /W4 /utf-8 /permissive-)
endif()
if(BUILD_TESTING)
    add_executable(sexy_d3d12_render_tests tests/render_tests.cpp)
    target_link_libraries(sexy_d3d12_render_tests PRIVATE sexy_d3d12)
    target_compile_definitions(sexy_d3d12_render_tests PRIVATE
        PVZ_D3D12_SHADER_DIRECTORY="${shaderDirectory}")
    add_test(NAME sexy_d3d12_render COMMAND sexy_d3d12_render_tests)
    set_tests_properties(sexy_d3d12_render
        PROPERTIES TIMEOUT 120 RUN_SERIAL TRUE)
    add_executable(sexy_d3d12_scale_compile_tests
        "${CMAKE_SOURCE_DIR}/tools/native-tests/scale_d3d12_compiler_tests.cpp")
    target_link_libraries(sexy_d3d12_scale_compile_tests PRIVATE
        sexy_d3d12_effects Microsoft::DirectXShaderCompiler)
    foreach(testTarget IN ITEMS sexy_d3d12_render_tests sexy_d3d12_scale_compile_tests)
        set_target_properties(${testTarget} PROPERTIES INTERPROCEDURAL_OPTIMIZATION_RELEASE TRUE)
        add_custom_command(TARGET ${testTarget} POST_BUILD
            COMMAND "${CMAKE_COMMAND}" -E copy_if_different
                "$<TARGET_FILE:Microsoft::DirectXShaderCompiler>"
                "$<TARGET_FILE_DIR:${testTarget}>"
            COMMAND "${CMAKE_COMMAND}" -E copy_if_different
                "$<TARGET_FILE_DIR:Microsoft::DirectXShaderCompiler>/dxil.dll"
                "$<TARGET_FILE_DIR:${testTarget}>" VERBATIM)
    endforeach()
    set(PVZ_D3D12_TEST_EFFECTS_DIRECTORY "${CMAKE_SOURCE_DIR}/effects" CACHE PATH
        "External MagpieFX corpus used by the independent D3D12 compiler test")
    add_test(NAME sexy_d3d12_scale_compile COMMAND sexy_d3d12_scale_compile_tests
        "${PVZ_D3D12_TEST_EFFECTS_DIRECTORY}")
    set_tests_properties(sexy_d3d12_scale_compile PROPERTIES TIMEOUT 180 RUN_SERIAL TRUE)
endif()
