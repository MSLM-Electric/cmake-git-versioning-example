if(GIT_EXECUTABLE)
  get_filename_component(SRC_DIR ${SRC}/version_generator DIRECTORY)
  # Generate a git-describe version string from Git repository tags
  execute_process(
    COMMAND ${GIT_EXECUTABLE} describe --tags --dirty --match "v*"
    WORKING_DIRECTORY ${SRC_DIR}
    OUTPUT_VARIABLE GIT_DESCRIBE_VERSION
    RESULT_VARIABLE GIT_DESCRIBE_ERROR_CODE
    OUTPUT_STRIP_TRAILING_WHITESPACE
    )
  if(NOT GIT_DESCRIBE_ERROR_CODE)
    set(PROJECTSHEADER_VERSION ${GIT_DESCRIBE_VERSION})
  endif()
endif()

# Final fallback: Just use a bogus version string that is semantically older
# than anything else and spit out a warning to the developer.
if(NOT DEFINED PROJECTSHEADER_VERSION)
  set(PROJECTSHEADER_VERSION v0.0.0-unknown)
  message(WARNING "Failed to determine PROJECTSHEADER_VERSION from Git tags. Using default version \"${PROJECTSHEADER_VERSION}\".")
endif()

message("this message from .cmake:" ${PROJECT_NAME})

add_definitions(-D${PROJECT_NAME}_VERSION)

configure_file(${SRC} ${DST} @ONLY)
get_filename_component(CONFIGURERCMAKE_DEFINES_DIR "${CMAKE_CURRENT_LIST_FILE}" DIRECTORY)
configure_file(${CONFIGURERCMAKE_DEFINES_DIR}/generateruntest_file.c.in ${CONFIGURERCMAKE_DEFINES_DIR}/funcGetVersion.c)
