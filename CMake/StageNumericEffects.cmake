file(GLOB_RECURSE assets RELATIVE "${SOURCE}"
    "${SOURCE}/*.hlsl" "${SOURCE}/*.hlsli" "${SOURCE}/*.dds")
foreach(relative IN LISTS assets)
    get_filename_component(directory "${DESTINATION}/${relative}" DIRECTORY)
    file(MAKE_DIRECTORY "${directory}")
    configure_file("${SOURCE}/${relative}" "${DESTINATION}/${relative}" COPYONLY)
endforeach()
