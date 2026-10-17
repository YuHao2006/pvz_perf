if(NOT DEFINED DESTINATION OR NOT DEFINED CANDIDATES)
    message(FATAL_ERROR "DESTINATION and CANDIDATES are required")
endif()

string(REPLACE "|" ";" candidate_list "${CANDIDATES}")
foreach(candidate IN LISTS candidate_list)
    if(EXISTS "${candidate}")
        file(COPY_FILE "${candidate}" "${DESTINATION}" ONLY_IF_DIFFERENT)
        return()
    endif()
endforeach()

message(FATAL_ERROR "None of the candidate files exists: ${CANDIDATES}")
