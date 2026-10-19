include(FetchContent)
find_package(Git REQUIRED)
find_path(PVZ_WIN7_JPEG_INCLUDE_DIR jpeglib.h REQUIRED)

function(pvz_add_win7_jpegli)
    # Match the existing vcpkg port, but compile with the selected Win7 CRT.
    if(NOT TARGET hwy)
        add_library(hwy ALIAS hwy::hwy)
    endif()
    set(BUILD_TESTING OFF)
    set(BUILD_SHARED_LIBS OFF)
    set(CMAKE_TRY_COMPILE_CONFIGURATION Release)
    foreach(option IN ITEMS TOOLS DEVTOOLS FUZZERS DOXYGEN MANPAGES
            BENCHMARK JNI SJPEG OPENEXR SKCMS JPEGLI_LIBJPEG)
        set(JPEGLI_ENABLE_${option} OFF)
    endforeach()
    set(JPEGLI_FORCE_SYSTEM_LCMS2 ON)
    set(JPEGLI_FORCE_SYSTEM_HWY ON)
    set(JPEGLI_LIBJPEG_INCLUDE_DIR "${PVZ_WIN7_JPEG_INCLUDE_DIR}")
    FetchContent_Declare(pvz_win7_jpegli
        URL https://github.com/google/jpegli/archive/031a0077f5799a6041004267fc12b956c1f52a20.tar.gz
        URL_HASH SHA512=4d57baf7ff88a2a40f46dc0c4fe121df1455064ad36c3a6a479e6536f02c9e436088fb15462336f65bc5c7c6dda54bb740e1c05744399c834aa88a36c6635db9
        DOWNLOAD_EXTRACT_TIMESTAMP TRUE
        PATCH_COMMAND "${CMAKE_COMMAND}" -E env "GIT_CEILING_DIRECTORIES=${FETCHCONTENT_BASE_DIR}"
            "${GIT_EXECUTABLE}" apply --ignore-whitespace --whitespace=nowarn
            "${CMAKE_SOURCE_DIR}/vcpkg-overlay-ports/jpegli/static-windows-libjpeg.patch"
            "${CMAKE_SOURCE_DIR}/vcpkg-overlay-ports/jpegli/pool-registration-failure.patch"
            "${CMAKE_SOURCE_DIR}/vcpkg-overlay-ports/jpegli/pool-exceptions.patch")
    FetchContent_MakeAvailable(pvz_win7_jpegli)
    add_library(jpegli::jpegli-static ALIAS jpegli-static)
    set_property(TARGET jpegli-static PROPERTY INTERPROCEDURAL_OPTIMIZATION_RELEASE TRUE)
endfunction()

pvz_add_win7_jpegli()
