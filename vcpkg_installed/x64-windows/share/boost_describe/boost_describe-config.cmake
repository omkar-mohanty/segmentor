# Generated by BoostInstall.cmake for boost_describe-1.85.0

include(CMakeFindDependencyMacro)

if(NOT boost_mp11_FOUND)
  find_dependency(boost_mp11 1.85.0 EXACT)
endif()

include("${CMAKE_CURRENT_LIST_DIR}/boost_describe-targets.cmake")
