set(PVZ_PATH_TOOLS "${CMAKE_CURRENT_LIST_DIR}/../tools")
function(pvz_machine_path key output)
    find_package(Python3 COMPONENTS Interpreter REQUIRED)
    execute_process(COMMAND "${Python3_EXECUTABLE}" "${PVZ_PATH_TOOLS}/workspace_paths.py"
        "${key}" --optional OUTPUT_VARIABLE result OUTPUT_STRIP_TRAILING_WHITESPACE
        RESULT_VARIABLE status)
    if(NOT status EQUAL 0)
        message(FATAL_ERROR "Failed to read machine path configuration for ${key}")
    endif()
    set(${output} "${result}" PARENT_SCOPE)
endfunction()
