cmake_minimum_required(VERSION 2.8 FATAL_ERROR)
#project(cmake-git-versioning-generator C)
set(PROJ_NAME SomeProject)
project(${PROJ_NAME} C)
include_directories(${CMAKE_BINARY_DIR}/../version_generator)
add_executable(${PROJ_NAME}_executable ${CMAKE_SOURCE_DIR}/version_generator/runversiontest.c ${CMAKE_SOURCE_DIR}/version_generator/funcGetVersion.c ${CMAKE_SOURCE_DIR}/version_generator/funcGetVersion.h)
#add_definitions
find_package(Git)
add_custom_target(version
  #${CMAKE_COMMAND} -D SRC=${CMAKE_SOURCE_DIR}/version_generator/generateheader_version.in
  ${CMAKE_COMMAND} -D SRC=${CMAKE_SOURCE_DIR}/version_generator/generateheader_version.h.in
                   -D DST=${CMAKE_SOURCE_DIR}/${PROJ_NAME}_version.h
                   -D PROJECT_NAME=${PROJ_NAME}
                   -D SHOWFUNC_SRC=${CMAKE_SOURCE_DIR}/version_generator/generateruntest_file.c.in
                   -D SHOWFUNC_DST=${CMAKE_SOURCE_DIR}/version_generator/funcGetVersion.c
                   -D GIT_EXECUTABLE=${GIT_EXECUTABLE}                   
                   -P ${CMAKE_SOURCE_DIR}/version_generator/GenerateVersionHeader.cmake
  )
add_dependencies(${PROJ_NAME}_executable version)

