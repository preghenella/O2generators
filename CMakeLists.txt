project(O2generators)
cmake_minimum_required(VERSION 3.13 FATAL_ERROR)

cmake_policy(SET CMP0074 NEW)
cmake_policy(SET CMP0065 NEW)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

set(CMAKE_MODULE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/cmake)

find_package(pythia6 REQUIRED)
find_package(pythia REQUIRED)
find_package(HepMC REQUIRED)
find_package(ROOT REQUIRED)
find_package(FairLogger REQUIRED)
find_package(FairRoot REQUIRED)
find_package(AliceO2 REQUIRED)

include("${ROOT_DIR}/modules/RootNewMacros.cmake")

add_subdirectory(Generators)
