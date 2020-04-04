# @author: Roberto Preghenella

# Init
include(FindPackageHandleStandardArgs)

# find includes
find_path(AliceO2_INCLUDE_DIR
  NAMES Headers/DataHeader.h
  HINTS ENV O2_ROOT
  PATH_SUFFIXES "include"
)

set(AliceO2_INCLUDE_DIRS ${AliceO2_INCLUDE_DIR})

# find libraries
find_library(AliceO2_LIBRARY_GENERATORS NAMES O2Generators HINTS ${O2_ROOT}/lib ENV LD_LIBRARY_PATH)

set(AliceO2_LIBRARIES
  ${AliceO2_LIBRARY_GENERATORS}
)

# handle the QUIETLY and REQUIRED arguments and set AliceO2_FOUND to TRUE
# if all listed variables are TRUE
find_package_handle_standard_args(AliceO2
  REQUIRED_VARS AliceO2_INCLUDE_DIR AliceO2_LIBRARY_GENERATORS
  FAIL_MESSAGE "AliceO2 could not be found."
)

if(${AliceO2_FOUND})
    message(STATUS "AliceO2 found, libraries: ${AliceO2_LIBRARIES}")

    mark_as_advanced(AliceO2_INCLUDE_DIRS AliceO2_LIBRARIES)

    # add targets
    if(NOT TARGET AliceO2::Generators)
        add_library(AliceO2::Generators INTERFACE IMPORTED)
        set_target_properties(AliceO2::Generators PROPERTIES
          INTERFACE_INCLUDE_DIRECTORIES "${AliceO2_INCLUDE_DIRS}"
          INTERFACE_LINK_LIBRARIES "${AliceO2_LIBRARY_GENERATORS}"
        )
    endif()
    
endif()
