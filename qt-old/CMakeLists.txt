cmake_minimum_required(VERSION 3.21)

project(
  app
  VERSION 1.0
  DESCRIPTION
    "An example repository to showcase how to build a simple C++ android app with Qt/QML and CMake"
  LANGUAGES CXX)

find_package(Qt6 REQUIRED COMPONENTS Core Quick)
set(ANDROID_PACKAGE_SOURCE_DIR "${CMAKE_CURRENT_SOURCE_DIR}/android" CACHE INTERNAL "" FORCE)


set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)

if(NOT ANDROID)
  add_executable(QMLDesktopExample)
elseif(ANDROID)
  add_library(QMLDesktopExample SHARED)
  find_package(Qt6 REQUIRED AndroidExtras)
  target_link_libraries(QMLDesktopExample PRIVATE Qt6::AndroidExtras)
  set_target_properties(QMLDesktopExample PROPERTIES LIBRARY_OUTPUT_NAME ${PROJECT_NAME})
  add_dependencies(apk QMLDesktopExample)
endif()

target_sources(QMLDesktopExample PRIVATE src/main.cpp)
target_link_libraries(QMLDesktopExample PRIVATE Qt6::Core Qt6::Quick)