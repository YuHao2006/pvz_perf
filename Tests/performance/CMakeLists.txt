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
