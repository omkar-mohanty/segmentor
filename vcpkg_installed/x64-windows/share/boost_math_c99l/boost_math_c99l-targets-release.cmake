#----------------------------------------------------------------
# Generated CMake target import file for configuration "Release".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "Boost::math_c99l" for configuration "Release"
set_property(TARGET Boost::math_c99l APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(Boost::math_c99l PROPERTIES
  IMPORTED_IMPLIB_RELEASE "${_IMPORT_PREFIX}/lib/boost_math_c99l-vc143-mt-x64-1_85.lib"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/bin/boost_math_c99l-vc143-mt-x64-1_85.dll"
  )

list(APPEND _cmake_import_check_targets Boost::math_c99l )
list(APPEND _cmake_import_check_files_for_Boost::math_c99l "${_IMPORT_PREFIX}/lib/boost_math_c99l-vc143-mt-x64-1_85.lib" "${_IMPORT_PREFIX}/bin/boost_math_c99l-vc143-mt-x64-1_85.dll" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
