# Generated by BoostInstall.cmake for boost_variant-1.85.0

include(CMakeFindDependencyMacro)

if(NOT boost_assert_FOUND)
  find_dependency(boost_assert 1.85.0 EXACT)
endif()
if(NOT boost_config_FOUND)
  find_dependency(boost_config 1.85.0 EXACT)
endif()
if(NOT boost_container_hash_FOUND)
  find_dependency(boost_container_hash 1.85.0 EXACT)
endif()
if(NOT boost_core_FOUND)
  find_dependency(boost_core 1.85.0 EXACT)
endif()
if(NOT boost_detail_FOUND)
  find_dependency(boost_detail 1.85.0 EXACT)
endif()
if(NOT boost_integer_FOUND)
  find_dependency(boost_integer 1.85.0 EXACT)
endif()
if(NOT boost_mpl_FOUND)
  find_dependency(boost_mpl 1.85.0 EXACT)
endif()
if(NOT boost_preprocessor_FOUND)
  find_dependency(boost_preprocessor 1.85.0 EXACT)
endif()
if(NOT boost_static_assert_FOUND)
  find_dependency(boost_static_assert 1.85.0 EXACT)
endif()
if(NOT boost_throw_exception_FOUND)
  find_dependency(boost_throw_exception 1.85.0 EXACT)
endif()
if(NOT boost_type_index_FOUND)
  find_dependency(boost_type_index 1.85.0 EXACT)
endif()
if(NOT boost_type_traits_FOUND)
  find_dependency(boost_type_traits 1.85.0 EXACT)
endif()
if(NOT boost_utility_FOUND)
  find_dependency(boost_utility 1.85.0 EXACT)
endif()

include("${CMAKE_CURRENT_LIST_DIR}/boost_variant-targets.cmake")
