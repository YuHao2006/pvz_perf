if(NOT DEFINED PROGRAM OR NOT DEFINED OUTPUT OR NOT DEFINED SOURCE)
    message(FATAL_ERROR "PROGRAM, OUTPUT, and SOURCE are required")
endif()

if(DEFINED SDK_BIN AND NOT SDK_BIN STREQUAL "")
    set(ENV{PATH} "${SDK_BIN};$ENV{PATH}")
endif()

execute_process(
    COMMAND "${PROGRAM}" -O --target-env=vulkan1.3 -o "${OUTPUT}" "${SOURCE}"
    RESULT_VARIABLE compile_result
    OUTPUT_VARIABLE compile_output
    ERROR_VARIABLE compile_error
)
if(NOT compile_result EQUAL 0)
    message(FATAL_ERROR
        "Vulkan shader compilation failed (${compile_result}) for ${SOURCE}\n"
        "${compile_output}${compile_error}")
endif()

if(DEFINED VALIDATOR AND NOT VALIDATOR STREQUAL "" AND EXISTS "${VALIDATOR}")
    execute_process(
        COMMAND "${VALIDATOR}" --target-env vulkan1.3 "${OUTPUT}"
        RESULT_VARIABLE validate_result
        OUTPUT_VARIABLE validate_output
        ERROR_VARIABLE validate_error
    )
    if(NOT validate_result EQUAL 0)
        message(FATAL_ERROR
            "SPIR-V validation failed (${validate_result}) for ${OUTPUT}\n"
            "${validate_output}${validate_error}")
    endif()
endif()
