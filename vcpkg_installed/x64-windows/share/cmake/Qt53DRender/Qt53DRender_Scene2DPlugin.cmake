
add_library(Qt5::Scene2DPlugin MODULE IMPORTED)


if(EXISTS "${_qt53DRender_install_prefix}/plugins/renderplugins/scene2d.dll")
    _populate_3DRender_plugin_properties(Scene2DPlugin RELEASE "renderplugins/scene2d.dll" FALSE)
endif()
if(EXISTS "${_qt53DRender_install_prefix}/debug/plugins/renderplugins/scene2dd.dll")
    _populate_3DRender_plugin_properties(Scene2DPlugin DEBUG "renderplugins/scene2dd.dll" FALSE)
endif()

list(APPEND Qt53DRender_PLUGINS Qt5::Scene2DPlugin)
set_property(TARGET Qt5::3DRender APPEND PROPERTY QT_ALL_PLUGINS_renderplugins Qt5::Scene2DPlugin)
set_property(TARGET Qt5::Scene2DPlugin PROPERTY QT_PLUGIN_TYPE "renderplugins")
set_property(TARGET Qt5::Scene2DPlugin PROPERTY QT_PLUGIN_EXTENDS "")
set_property(TARGET Qt5::Scene2DPlugin PROPERTY QT_PLUGIN_CLASS_NAME "Scene2DPlugin")
