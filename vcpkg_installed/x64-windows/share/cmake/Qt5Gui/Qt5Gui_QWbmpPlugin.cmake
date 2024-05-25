
add_library(Qt5::QWbmpPlugin MODULE IMPORTED)


if(EXISTS "${_qt5Gui_install_prefix}/plugins/imageformats/qwbmp.dll")
    _populate_Gui_plugin_properties(QWbmpPlugin RELEASE "imageformats/qwbmp.dll" FALSE)
endif()
if(EXISTS "${_qt5Gui_install_prefix}/debug/plugins/imageformats/qwbmpd.dll")
    _populate_Gui_plugin_properties(QWbmpPlugin DEBUG "imageformats/qwbmpd.dll" FALSE)
endif()

list(APPEND Qt5Gui_PLUGINS Qt5::QWbmpPlugin)
set_property(TARGET Qt5::Gui APPEND PROPERTY QT_ALL_PLUGINS_imageformats Qt5::QWbmpPlugin)
set_property(TARGET Qt5::QWbmpPlugin PROPERTY QT_PLUGIN_TYPE "imageformats")
set_property(TARGET Qt5::QWbmpPlugin PROPERTY QT_PLUGIN_EXTENDS "")
set_property(TARGET Qt5::QWbmpPlugin PROPERTY QT_PLUGIN_CLASS_NAME "QWbmpPlugin")