# CMakeList.txt : Top-level CMake project file, do global configuration
# and include sub-projects here.
#
cmake_minimum_required (VERSION 3.8)

# Enable Hot Reload for MSVC compilers if supported.
if (POLICY CMP0141)
  cmake_policy(SET CMP0141 NEW)
  set(CMAKE_MSVC_DEBUG_INFORMATION_FORMAT "$<IF:$<AND:$<C_COMPILER_ID:MSVC>,$<CXX_COMPILER_ID:MSVC>>,$<$<CONFIG:Debug,RelWithDebInfo>:EditAndContinue>,$<$<CONFIG:Debug,RelWithDebInfo>:ProgramDatabase>>")
endif()
set(CMAKE_CXX_STANDARD 17)
project ("seg")
find_package(CGAL REQUIRED OPTIONAL_COMPONENTS Qt5)
set(CPACK_SET_DESTDIR true)
add_executable("seg" seg.cpp)
set(BUILD_SHARED_LIBS OFF)
set(CMAKE_EXE_LINKER_FLAGS "-static")
target_link_libraries("seg" PUBLIC CGAL::CGAL CGAL::CGAL_Basic_viewer -static)
include(InstallRequiredSystemLibraries)

set(CPACK_SOURCE_GENERATOR "WIX")
install(TARGETS "seg" RUNTIME DESTINATION bin)
include(CPack)
