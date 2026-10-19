add_executable(pvz_data_array_tests EXCLUDE_FROM_ALL
    "${CMAKE_CURRENT_SOURCE_DIR}/../native/DataArrayTests.cpp")
target_link_libraries(pvz_data_array_tests PRIVATE pvz_source_headers)
target_compile_features(pvz_data_array_tests PRIVATE cxx_std_23)
if(PVZ_RENDER_BACKEND STREQUAL "D3D12")
    target_compile_definitions(pvz_data_array_tests PRIVATE PVZ_GPU_D3D12=1)
elseif(PVZ_RENDER_BACKEND STREQUAL "VULKAN")
    find_package(Vulkan REQUIRED)
    target_link_libraries(pvz_data_array_tests PRIVATE Vulkan::Headers)
elseif(PVZ_RENDER_BACKEND STREQUAL "METAL")
    target_compile_definitions(pvz_data_array_tests PRIVATE PVZ_GPU_METAL=1)
endif()

add_executable(pvz_game_perf_layout EXCLUDE_FROM_ALL
    game_perf_layout.cpp
    "${PVZ_GAME_SOURCE_DIR}/SexyAppFramework/graphics/Color.cpp")
target_link_libraries(pvz_game_perf_layout PRIVATE pvz_source_headers)
target_compile_features(pvz_game_perf_layout PRIVATE cxx_std_23)
target_compile_definitions(pvz_game_perf_layout PRIVATE
    "$<$<CONFIG:Release>:RELEASEFINAL>"
    "$<$<BOOL:${PVZ_ENABLE_GAME_PROBES}>:PVZ_ENABLE_GAME_PROBES=1>")
if(PVZ_RENDER_BACKEND STREQUAL "D3D12")
    target_compile_definitions(pvz_game_perf_layout PRIVATE PVZ_GPU_D3D12=1)
elseif(PVZ_RENDER_BACKEND STREQUAL "VULKAN")
    find_package(Vulkan REQUIRED)
    target_link_libraries(pvz_game_perf_layout PRIVATE Vulkan::Headers)
elseif(PVZ_RENDER_BACKEND STREQUAL "METAL")
    target_compile_definitions(pvz_game_perf_layout PRIVATE PVZ_GPU_METAL=1)
endif()

if(WIN32 AND MSVC AND TARGET LawnProject AND PVZ_WINDOWS_PLATFORM STREQUAL "WIN10")
    find_package(Vulkan REQUIRED)
    find_package(nlohmann_json CONFIG REQUIRED)
    add_executable(pvz_audio_backend_bench EXCLUDE_FROM_ALL
        audio_backend_bench.cpp
        "${PVZ_GAME_SOURCE_DIR}/SexyAppFramework/platform/windows/audio/DSoundManager.cpp"
        "${PVZ_GAME_SOURCE_DIR}/SexyAppFramework/platform/windows/audio/DSoundInstance.cpp"
        "${PVZ_GAME_SOURCE_DIR}/SexyAppFramework/sound/BassLoader.cpp"
        "${PVZ_GAME_SOURCE_DIR}/SexyAppFramework/sound/SoundDecode.cpp"
        "${PVZ_GAME_SOURCE_DIR}/SexyAppFramework/paklib/PakInterface.cpp")
    target_compile_features(pvz_audio_backend_bench PRIVATE cxx_std_23)
    target_compile_definitions(pvz_audio_backend_bench PRIVATE RELEASEFINAL NOMINMAX)
    if(PVZ_RENDER_BACKEND STREQUAL "D3D12")
        target_compile_definitions(pvz_audio_backend_bench PRIVATE PVZ_GPU_D3D12=1)
    endif()
    target_link_libraries(pvz_audio_backend_bench PRIVATE
        pvz_source_headers Vulkan::Headers nlohmann_json::nlohmann_json user32 psapi winmm
        ole32 mmdevapi uuid)
    set_property(TARGET pvz_audio_backend_bench PROPERTY INTERPROCEDURAL_OPTIMIZATION_RELEASE TRUE)
endif()

if(CMAKE_SYSTEM_NAME STREQUAL "Linux" AND TARGET LawnProject)
    add_custom_target(pvz_linux_perf_tools
        COMMAND "${Python3_EXECUTABLE}"
            "${CMAKE_CURRENT_SOURCE_DIR}/run-linux-game-perf.py"
            --prepare --build-dir "${CMAKE_BINARY_DIR}"
        DEPENDS pvz_game_perf_layout LawnProject
        COMMENT "Recording matching Linux game and performance layout"
        VERBATIM)
endif()
