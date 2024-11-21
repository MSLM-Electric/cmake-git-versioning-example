cmake_minimum_required(VERSION 2.8 FATAL_ERROR)
project(cmake-git-versioning-example C)
include_directories(${CMAKE_BINARY_DIR}/../version_generator)
add_executable(foobar ${CMAKE_SOURCE_DIR}/version_generator/runversiontest.c)
find_package(Git)
add_custom_target(version
  ${CMAKE_COMMAND} -D SRC=${CMAKE_SOURCE_DIR}/version_generator/foobar_version.h.in
                   -D DST=${CMAKE_SOURCE_DIR}/foobar_version.h
                   -D GIT_EXECUTABLE=${GIT_EXECUTABLE}
                   -P ${CMAKE_SOURCE_DIR}/version_generator/GenerateVersionHeader.cmake
  )
add_dependencies(foobar version)

