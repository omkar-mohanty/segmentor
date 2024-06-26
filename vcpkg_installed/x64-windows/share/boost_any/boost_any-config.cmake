# Generated by BoostInstall.cmake for boost_any-1.85.0

include(CMakeFindDependencyMacro)

if(NOT boost_config_FOUND)
  find_dependency(boost_config 1.85.0 EXACT)
endif()
if(NOT boost_throw_exception_FOUND)
  find_dependency(boost_throw_exception 1.85.0 EXACT)
endif()
if(NOT boost_type_index_FOUND)
  find_dependency(boost_type_index 1.85.0 EXACT)
endif()

include("${CMAKE_CURRENT_LIST_DIR}/boost_any-targets.cmake")
