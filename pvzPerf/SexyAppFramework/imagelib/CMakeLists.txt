find_package(Threads REQUIRED)
find_package(hwy CONFIG REQUIRED)
if(WIN32 AND PVZ_WINDOWS_PLATFORM STREQUAL "WIN7")
    include("${CMAKE_SOURCE_DIR}/CMake/Win7Jpegli.cmake")
else()
    find_package(jpegli CONFIG REQUIRED)
endif()
find_package(SPNG CONFIG REQUIRED)
find_package(ZLIB REQUIRED)

# jpegli exports the C-compatible JPEG ABI, but its C++ implementation can
# throw (e.g. vector/new allocation). /EHsc would let MSVC assume these extern
# "C" calls never throw and omit our resource unwinding. Limit /EHs semantics
# to this caller; do not enable asynchronous SEH catching for the whole game.
if(MSVC)
    set_property(SOURCE "${CMAKE_CURRENT_SOURCE_DIR}/ImageLib.cpp"
        TARGET_DIRECTORY ${PROJECT_NAME} APPEND PROPERTY COMPILE_OPTIONS /EHsc-)
endif()

target_link_libraries(${PROJECT_NAME} PRIVATE
    jpegli::jpegli-static
    ZLIB::ZLIB
)
target_link_libraries(${PROJECT_NAME} PRIVATE
    $<IF:$<TARGET_EXISTS:spng::spng>,spng::spng,spng::spng_static>)

target_sources(${PROJECT_NAME} PRIVATE
    "ImageLib.cpp"
    "ImageLib.h"
)
