# Copyright CERN and copyright holders of ALICE O2. This software is distributed
# under the terms of the GNU General Public License v3 (GPL Version 3), copied
# verbatim in the file "COPYING".
#
# See http://alice-o2.web.cern.ch/license for full licensing information.
#
# In applying this license CERN does not waive the privileges and immunities
# granted to it by virtue of its status as an Intergovernmental Organization or
# submit itself to any jurisdiction.

set(CMAKE_VERBOSE_MAKEFILE ON)

set(SOURCES
  src/GeneratorTGenerator.cxx
  src/GeneratorHepMC.cxx
  src/GeneratorPythia6.cxx
  src/GeneratorPythia8.cxx
  src/GeneratorPythia8Param.cxx
  )

set(HEADERS
  src/GeneratorTGenerator.h
  src/GeneratorHepMC.h
  src/GeneratorPythia6.h
  src/GeneratorPythia8.h
  src/GeneratorPythia8Param.h
  )

get_target_property(HEPMC_INCLUDE_DIRECTORIES   MC::HepMC   INTERFACE_INCLUDE_DIRECTORIES)
get_target_property(PYTHIA_INCLUDE_DIRECTORIES  MC::Pythia  INTERFACE_INCLUDE_DIRECTORIES)

include_directories(${CMAKE_CURRENT_SOURCE_DIR}
  ${HEPMC_INCLUDE_DIRECTORIES}
  ${PYTHIA6_INCLUDE_DIRECTORIES}
  ${PYTHIA_INCLUDE_DIRECTORIES})

add_library(O2GeneratorsExtra SHARED ${SOURCES} G__Generators.cxx)
root_generate_dictionary(G__Generators ${HEADERS} LINKDEF src/GeneratorsLinkDef.h)

target_link_libraries(O2GeneratorsExtra
  ROOT::EGPythia6
  MC::Pythia6
  MC::Pythia
  MC::HepMC
  AliceO2::Generators
  FairRoot::Gen
  )

install(TARGETS O2GeneratorsExtra DESTINATION lib)
