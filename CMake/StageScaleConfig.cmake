if(NOT EXISTS "${DESTINATION}/scale.json")
    configure_file("${SOURCE}" "${DESTINATION}/scale.json" COPYONLY)
endif()
