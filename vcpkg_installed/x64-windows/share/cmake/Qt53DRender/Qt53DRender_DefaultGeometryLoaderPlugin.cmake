
add_library(Qt5::DefaultGeometryLoaderPlugin MODULE IMPORTED)


if(EXISTS "${_qt53DRender_install_prefix}/plugins/geometryloaders/defaultgeometryloader.dll")
    _populate_3DRender_plugin_properties(DefaultGeometryLoaderPlugin RELEASE "geometryloaders/defaultgeometryloader.dll" FALSE)
endif()
if(EXISTS "${_qt53DRender_install_prefix}/debug/plugins/geometryloaders/defaultgeometryloaderd.dll")
    _populate_3DRender_plugin_properties(DefaultGeometryLoaderPlugin DEBUG "geometryloaders/defaultgeometryloaderd.dll" FALSE)
endif()

list(APPEND Qt53DRender_PLUGINS Qt5::DefaultGeometryLoaderPlugin)
set_property(TARGET Qt5::3DRender APPEND PROPERTY QT_ALL_PLUGINS_geometryloaders Qt5::DefaultGeometryLoaderPlugin)
set_property(TARGET Qt5::DefaultGeometryLoaderPlugin PROPERTY QT_PLUGIN_TYPE "geometryloaders")
set_property(TARGET Qt5::DefaultGeometryLoaderPlugin PROPERTY QT_PLUGIN_EXTENDS "")
set_property(TARGET Qt5::DefaultGeometryLoaderPlugin PROPERTY QT_PLUGIN_CLASS_NAME "DefaultGeometryLoaderPlugin")
