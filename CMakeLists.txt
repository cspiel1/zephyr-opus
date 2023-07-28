#
# Copyright (c) 2023 Christian Spielberger
#

list(APPEND CMAKE_MODULE_PATH "${ZEPHYR_CURRENT_MODULE_DIR}")
list(APPEND CMAKE_MODULE_PATH "${ZEPHYR_CURRENT_MODULE_DIR}/cmake")

zephyr_library()

message("BINDIR: ${PROJECT_BINARY_DIR}")
zephyr_include_directories(
        ${ZEPHYR_CURRENT_MODULE_DIR}/lib/include
        ${PROJECT_BINARY_DIR}/../modules/opus
        ${PROJECT_BINARY_DIR}/../modules/opus/include
)

set(PRJ_SOURCE_DIR_SAV ${PROJECT_SOURCE_DIR})

set(PROJECT_SOURCE_DIR ${ZEPHYR_CURRENT_MODULE_DIR})

include(OpusFunctions)
include(OpusBuildtype)
include(OpusConfig)
include(OpusSources-zephyr)
include(CMakeDependentOption)
include(FeatureSummary)

set(HAVE_LRINT YES)
set(HAVE_LRINTF YES)
configure_file(lib/include/opus.h include/opus/opus.h COPYONLY)

set(PROJECT_SOURCE_DIR ${PRJ_SOURCE_DIR_SAV})

set(OPUS_CUSTOM_MODES_HELP_STR "enable non-Opus modes, e.g. 44.1 kHz & 2^n frames.")
option(OPUS_CUSTOM_MODES ${OPUS_CUSTOM_MODES_HELP_STR} OFF)
add_feature_info(OPUS_CUSTOM_MODES OPUS_CUSTOM_MODES ${OPUS_CUSTOM_MODES_HELP_STR})

set(OPUS_DISABLE_INTRINSICS_HELP_STR "disable all intrinsics optimizations.")
option(OPUS_DISABLE_INTRINSICS ${OPUS_DISABLE_INTRINSICS_HELP_STR} OFF)
add_feature_info(OPUS_DISABLE_INTRINSICS OPUS_DISABLE_INTRINSICS ${OPUS_DISABLE_INTRINSICS_HELP_STR})

set(OPUS_FIXED_POINT_HELP_STR "compile as fixed-point (for machines without a fast enough FPU).")
option(OPUS_FIXED_POINT ${OPUS_FIXED_POINT_HELP_STR} OFF)
add_feature_info(OPUS_FIXED_POINT OPUS_FIXED_POINT ${OPUS_FIXED_POINT_HELP_STR})

set(OPUS_ENABLE_FLOAT_API_HELP_STR "compile with the floating point API (for machines with float library).")
option(OPUS_ENABLE_FLOAT_API ${OPUS_ENABLE_FLOAT_API_HELP_STR} ON)
add_feature_info(OPUS_ENABLE_FLOAT_API OPUS_ENABLE_FLOAT_API ${OPUS_ENABLE_FLOAT_API_HELP_STR})

set(OPUS_FLOAT_APPROX_HELP_STR "enable floating point approximations (Ensure your platform supports IEEE 754 before enabling).")
option(OPUS_FLOAT_APPROX ${OPUS_FLOAT_APPROX_HELP_STR} OFF)
add_feature_info(OPUS_FLOAT_APPROX OPUS_FLOAT_APPROX ${OPUS_FLOAT_APPROX_HELP_STR})

set(OPUS_ASSERTIONS_HELP_STR "additional software error checking.")
option(OPUS_ASSERTIONS ${OPUS_ASSERTIONS_HELP_STR} OFF)
add_feature_info(OPUS_ASSERTIONS OPUS_ASSERTIONS ${OPUS_ASSERTIONS_HELP_STR})

set(OPUS_HARDENING_HELP_STR "run-time checks that are cheap and safe for use in production.")
option(OPUS_HARDENING ${OPUS_HARDENING_HELP_STR} ON)
add_feature_info(OPUS_HARDENING OPUS_HARDENING ${OPUS_HARDENING_HELP_STR})

set(OPUS_FUZZING_HELP_STR "causes the encoder to make random decisions (do not use in production).")
option(OPUS_FUZZING ${OPUS_FUZZING_HELP_STR} OFF)
add_feature_info(OPUS_FUZZING OPUS_FUZZING ${OPUS_FUZZING_HELP_STR})

set(OPUS_CHECK_ASM_HELP_STR "enable bit-exactness checks between optimized and c implementations.")
option(OPUS_CHECK_ASM ${OPUS_CHECK_ASM_HELP_STR} OFF)
add_feature_info(OPUS_CHECK_ASM OPUS_CHECK_ASM ${OPUS_CHECK_ASM_HELP_STR})

set(OPUS_FIXED_POINT_DEBUG_HELP_STR "debug fixed-point implementation.")
cmake_dependent_option(OPUS_FIXED_POINT_DEBUG
                      ${OPUS_FIXED_POINT_DEBUG_HELP_STR}
                      ON
                      "OPUS_FIXED_POINT; OPUS_FIXED_POINT_DEBUG"
                      OFF)
add_feature_info(OPUS_FIXED_POINT_DEBUG OPUS_FIXED_POINT_DEBUG ${OPUS_FIXED_POINT_DEBUG_HELP_STR})

set(OPUS_VAR_ARRAYS_HELP_STR "use variable length arrays for stack arrays.")
cmake_dependent_option(OPUS_VAR_ARRAYS
                      ${OPUS_VAR_ARRAYS_HELP_STR}
                      ON
                      "VLA_SUPPORTED; NOT OPUS_USE_ALLOCA; NOT OPUS_NONTHREADSAFE_PSEUDOSTACK"
                      OFF)
add_feature_info(OPUS_VAR_ARRAYS OPUS_VAR_ARRAYS ${OPUS_VAR_ARRAYS_HELP_STR})

set(OPUS_USE_ALLOCA_HELP_STR "use alloca for stack arrays (on non-C99 compilers).")
cmake_dependent_option(OPUS_USE_ALLOCA
                       ${OPUS_USE_ALLOCA_HELP_STR}
                       ON
                       "USE_ALLOCA_SUPPORTED; NOT OPUS_VAR_ARRAYS; NOT OPUS_NONTHREADSAFE_PSEUDOSTACK"
                       OFF)
add_feature_info(OPUS_USE_ALLOCA OPUS_USE_ALLOCA ${OPUS_USE_ALLOCA_HELP_STR})

set(OPUS_NONTHREADSAFE_PSEUDOSTACK_HELP_STR "use a non threadsafe pseudostack when neither variable length arrays or alloca is supported.")
cmake_dependent_option(OPUS_NONTHREADSAFE_PSEUDOSTACK
                       ${OPUS_NONTHREADSAFE_PSEUDOSTACK_HELP_STR}
                       ON
                       "NOT OPUS_VAR_ARRAYS; NOT OPUS_USE_ALLOCA"
                       OFF)
add_feature_info(OPUS_NONTHREADSAFE_PSEUDOSTACK OPUS_NONTHREADSAFE_PSEUDOSTACK ${OPUS_NONTHREADSAFE_PSEUDOSTACK_HELP_STR})

set(OPUS_FAST_MATH_HELP_STR "enable fast math (unsupported and discouraged use, as code is not well tested with this build option).")
cmake_dependent_option(OPUS_FAST_MATH
                       ${OPUS_FAST_MATH_HELP_STR}
                       ON
                       "OPUS_FLOAT_APPROX; OPUS_FAST_MATH; FAST_MATH_SUPPORTED"
                       OFF)
add_feature_info(OPUS_FAST_MATH OPUS_FAST_MATH ${OPUS_FAST_MATH_HELP_STR})

set(OPUS_STACK_PROTECTOR_HELP_STR "use stack protection.")
cmake_dependent_option(OPUS_STACK_PROTECTOR
                       ${OPUS_STACK_PROTECTOR_HELP_STR}
                       ON
                       "STACK_PROTECTOR_SUPPORTED"
                       OFF)
add_feature_info(OPUS_STACK_PROTECTOR OPUS_STACK_PROTECTOR ${OPUS_STACK_PROTECTOR_HELP_STR})

feature_summary(WHAT ALL)

set_package_properties(Git
                       PROPERTIES
                       TYPE
                       REQUIRED
                       DESCRIPTION
                       "fast, scalable, distributed revision control system"
                       URL
                       "https://git-scm.com/"
                       PURPOSE
                       "required to set up package version")

set(Opus_PUBLIC_HEADER
    ${CMAKE_CURRENT_SOURCE_DIR}/lib/include/opus.h
    ${CMAKE_CURRENT_SOURCE_DIR}/lib/include/opus_defines.h
    ${CMAKE_CURRENT_SOURCE_DIR}/lib/include/opus_multistream.h
    ${CMAKE_CURRENT_SOURCE_DIR}/lib/include/opus_projection.h
    ${CMAKE_CURRENT_SOURCE_DIR}/lib/include/opus_types.h)

if(OPUS_CUSTOM_MODES)
  list(APPEND Opus_PUBLIC_HEADER ${CMAKE_CURRENT_SOURCE_DIR}/lib/include/opus_custom.h)
endif()

zephyr_library_sources(${opus_headers} ${opus_sources} ${opus_sources_float} ${Opus_PUBLIC_HEADER})

zephyr_library_include_directories(
        ${ZEPHYR_CURRENT_MODULE_DIR}/lib/celt
        ${ZEPHYR_CURRENT_MODULE_DIR}/lib/silk
)

zephyr_link_libraries(${OPUS_REQUIRED_LIBRARIES})
zephyr_library_compile_definitions(OPUS_BUILD)

if(OPUS_FIXED_POINT_DEBUG)
  zephyr_library_compile_definitions(FIXED_DEBUG)
endif()

if(OPUS_FORTIFY_SOURCE)
  zephyr_library_compile_definitions(
                             $<$<NOT:$<CONFIG:debug>>:_FORTIFY_SOURCE=2>)
endif()

if(OPUS_FLOAT_APPROX)
  zephyr_library_compile_definitions(FLOAT_APPROX)
endif()

if(OPUS_ASSERTIONS)
  zephyr_library_compile_definitions(ENABLE_ASSERTIONS)
endif()

if(OPUS_HARDENING)
  zephyr_library_compile_definitions(ENABLE_HARDENING)
endif()

if(OPUS_FUZZING)
  zephyr_library_compile_definitions(FUZZING)
endif()

if(OPUS_CHECK_ASM)
  zephyr_library_compile_definitions(OPUS_CHECK_ASM)
endif()

if(OPUS_VAR_ARRAYS)
  zephyr_library_compile_definitions(VAR_ARRAYS)
elseif(OPUS_USE_ALLOCA)
  zephyr_library_compile_definitions(USE_ALLOCA)
elseif(OPUS_NONTHREADSAFE_PSEUDOSTACK)
  zephyr_library_compile_definitions(NONTHREADSAFE_PSEUDOSTACK)
else()
  message(ERROR "Need to set a define for stack allocation")
endif()

if(OPUS_CUSTOM_MODES)
  zephyr_library_compile_definitions(CUSTOM_MODES)
endif()

if(OPUS_FAST_MATH)
    zephyr_compile_options(-ffast-math)
endif()

if(OPUS_STACK_PROTECTOR)
    zephyr_compile_options(-fstack-protector-strong)
endif()

add_sources_group(${ZEPHYR_CURRENT_LIBRARY}
        lib/silk ${silk_headers} ${silk_sources})

add_sources_group(${ZEPHYR_CURRENT_LIBRARY}
        lib/celt ${celt_headers} ${celt_sources})

if(OPUS_FIXED_POINT)
  add_sources_group(${ZEPHYR_CURRENT_LIBRARY}
        lib/silk ${silk_sources_fixed})
  zephyr_library_include_directories(lib/silk/fixed)
  zephyr_library_compile_definitions(FIXED_POINT=1)
else()
  add_sources_group(${ZEPHYR_CURRENT_LIBRARY}
        lib/silk ${silk_sources_float})
  zephyr_library_include_directories(lib/silk/float)
endif()

if(NOT OPUS_ENABLE_FLOAT_API)
  zephyr_library_compile_definitions(DISABLE_FLOAT_API)
endif()

if(NOT OPUS_DISABLE_INTRINSICS)

  if(COMPILER_SUPPORT_NEON)
    if(OPUS_MAY_HAVE_NEON)
      if(RUNTIME_CPU_CAPABILITY_DETECTION)
        message(STATUS "OPUS_MAY_HAVE_NEON enabling runtime detection")
        zephyr_library_compile_definitions(OPUS_HAVE_RTCD)
        add_sources_group(${ZEPHYR_CURRENT_LIBRARY}
                lib/celt ${celt_sources_arm_rtcd})
        add_sources_group(${ZEPHYR_CURRENT_LIBRARY}
                lib/silk ${silk_sources_arm_rtcd})
      else()
        message(ERROR "Runtime cpu capability detection needed for MAY_HAVE_NEON")
      endif()
      # Do runtime check for NEON
      zephyr_library_compile_definitions(
                                 OPUS_ARM_MAY_HAVE_NEON
                                 OPUS_ARM_MAY_HAVE_NEON_INTR)
    endif()

    add_sources_group(${ZEPHYR_CURRENT_LIBRARY}
        lib/celt ${celt_sources_arm_neon_intr})
    add_sources_group(${ZEPHYR_CURRENT_LIBRARY}
        lib/silk ${silk_sources_arm_neon_intr})

    # silk arm neon depends on main_Fix.h
    zephyr_library_include_directories(lib/silk/fixed)

    if(OPUS_FIXED_POINT)
      add_sources_group(${ZEPHYR_CURRENT_LIBRARY}
        lib/silk ${silk_sources_fixed_arm_neon_intr})
    endif()

    if(OPUS_PRESUME_NEON)
      zephyr_library_compile_definitions(
                                 OPUS_ARM_PRESUME_NEON
                                 OPUS_ARM_PRESUME_NEON_INTR)
    endif()
  endif()
endif()

zephyr_library_compile_definitions(
                           $<$<BOOL:${HAVE_LRINT}>:HAVE_LRINT>
                           $<$<BOOL:${HAVE_LRINTF}>:HAVE_LRINTF>)
