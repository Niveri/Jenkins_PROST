cmake_minimum_required(VERSION 3.8)
project(Jenkins_PROST)
# Unit Tests
# Add test cpp file
add_executable( runUnitTests test.cpp ${CMAKE_SOURCE_DIR}/Jenkins_PROST.h ${CMAKE_SOURCE_DIR}/Jenkins_PROST.cpp)

# Catch2
enable_testing()
set(CATCH_INCLUDE_DIR)
find_package(Catch2 CONFIG REQUIRED)
target_compile_features(runUnitTests PRIVATE cxx_std_14)


# Link test executable against gtest & gtest_main
target_link_libraries(runUnitTests Catch2::Catch2)
target_include_directories(runUnitTests PRIVATE ${CMAKE_SOURCE_DIR})
add_test( runUnitTests runUnitTests )