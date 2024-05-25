# Generated by BoostInstall.cmake for boost_ptr_container-1.85.0

include(CMakeFindDependencyMacro)

if(NOT boost_array_FOUND)
  find_dependency(boost_array 1.85.0 EXACT)
endif()
if(NOT boost_assert_FOUND)
  find_dependency(boost_assert 1.85.0 EXACT)
endif()
if(NOT boost_circular_buffer_FOUND)
  find_dependency(boost_circular_buffer 1.85.0 EXACT)
endif()
if(NOT boost_config_FOUND)
  find_dependency(boost_config 1.85.0 EXACT)
endif()
if(NOT boost_core_FOUND)
  find_dependency(boost_core 1.85.0 EXACT)
endif()
if(NOT boost_iterator_FOUND)
  find_dependency(boost_iterator 1.85.0 EXACT)
endif()
if(NOT boost_mpl_FOUND)
  find_dependency(boost_mpl 1.85.0 EXACT)
endif()
if(NOT boost_range_FOUND)
  find_dependency(boost_range 1.85.0 EXACT)
endif()
if(NOT boost_smart_ptr_FOUND)
  find_dependency(boost_smart_ptr 1.85.0 EXACT)
endif()
if(NOT boost_static_assert_FOUND)
  find_dependency(boost_static_assert 1.85.0 EXACT)
endif()
if(NOT boost_type_traits_FOUND)
  find_dependency(boost_type_traits 1.85.0 EXACT)
endif()
if(NOT boost_unordered_FOUND)
  find_dependency(boost_unordered 1.85.0 EXACT)
endif()
if(NOT boost_utility_FOUND)
  find_dependency(boost_utility 1.85.0 EXACT)
endif()

include("${CMAKE_CURRENT_LIST_DIR}/boost_ptr_container-targets.cmake")
