cmake_minimum_required(VERSION 3.18 FATAL_ERROR)
# cmake_policy(VERSION 3.18)

set(CMAKE_CXX_STANDARD 14)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

project("crosswindow-playground" VERSION 1.0.0.0 LANGUAGES C CXX)

add_library(CrossWindow STATIC IMPORTED)

set_property(
  TARGET CrossWindow APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE
)

set_target_properties(CrossWindow PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "C"
  IMPORTED_LOCATION_DEBUG "${CrossWindow_ROOT}/cmake-build/Release/CrossWindow.lib"
)
  
set_target_properties(CrossWindow PROPERTIES
  MAP_IMPORTED_CONFIG_MINSIZEREL Release
  MAP_IMPORTED_CONFIG_RELWITHDEBINFO Release
)

target_include_directories(CrossWindow INTERFACE "${CrossWindow_ROOT}/src/CrossWindow")

add_executable(${PROJECT_NAME} 
  "src/main.cpp"
)

target_link_libraries(
  ${PROJECT_NAME}
  CrossWindow
)