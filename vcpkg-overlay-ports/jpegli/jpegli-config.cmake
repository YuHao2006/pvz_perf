include(CMakeFindDependencyMacro)
find_dependency(Threads)
find_dependency(hwy CONFIG)

# The upstream jpegli CMake target records its SIMD dependency as `hwy`.
# vcpkg exposes the same library as `hwy::hwy`; provide the local alias before
# importing the jpegli target so static consumers resolve it correctly.
if(TARGET hwy::hwy AND NOT TARGET hwy)
    add_library(hwy ALIAS hwy::hwy)
endif()

include("${CMAKE_CURRENT_LIST_DIR}/jpegliTargets.cmake")
