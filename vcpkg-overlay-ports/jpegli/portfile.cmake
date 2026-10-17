vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO google/jpegli
    REF 031a0077f5799a6041004267fc12b956c1f52a20
    SHA512 4d57baf7ff88a2a40f46dc0c4fe121df1455064ad36c3a6a479e6536f02c9e436088fb15462336f65bc5c7c6dda54bb740e1c05744399c834aa88a36c6635db9
    HEAD_REF main
    PATCHES
        static-windows-libjpeg.patch
        pool-registration-failure.patch
        pool-exceptions.patch
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
        -DBUILD_SHARED_LIBS=OFF
        -DBUILD_TESTING=OFF
        -DJPEGLI_LIBJPEG_INCLUDE_DIR=${CURRENT_INSTALLED_DIR}/include
        -DJPEGLI_ENABLE_TOOLS=OFF
        -DJPEGLI_ENABLE_DEVTOOLS=OFF
        -DJPEGLI_ENABLE_FUZZERS=OFF
        -DJPEGLI_ENABLE_DOXYGEN=OFF
        -DJPEGLI_ENABLE_MANPAGES=OFF
        -DJPEGLI_ENABLE_BENCHMARK=OFF
        -DJPEGLI_ENABLE_JNI=OFF
        -DJPEGLI_ENABLE_SJPEG=OFF
        -DJPEGLI_ENABLE_OPENEXR=OFF
        -DJPEGLI_ENABLE_SKCMS=OFF
        -DJPEGLI_FORCE_SYSTEM_LCMS2=ON
        -DJPEGLI_FORCE_SYSTEM_HWY=ON
        -DJPEGLI_ENABLE_JPEGLI_LIBJPEG=OFF
)

vcpkg_cmake_build(TARGET jpegli-static)
vcpkg_cmake_install()
vcpkg_cmake_config_fixup(CONFIG_PATH lib/cmake/jpegli)

file(INSTALL "${CMAKE_CURRENT_LIST_DIR}/jpegli-config.cmake"
     DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}")
file(INSTALL "${CURRENT_INSTALLED_DIR}/include/jerror.h"
     DESTINATION "${CURRENT_PACKAGES_DIR}/include/jpegli")

file(REMOVE_RECURSE
    "${CURRENT_PACKAGES_DIR}/debug/include"
    "${CURRENT_PACKAGES_DIR}/debug/share"
    "${CURRENT_PACKAGES_DIR}/lib/pkgconfig"
    "${CURRENT_PACKAGES_DIR}/debug/lib/pkgconfig"
)

vcpkg_copy_pdbs()
file(INSTALL "${SOURCE_PATH}/LICENSE" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME copyright)
