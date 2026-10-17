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
