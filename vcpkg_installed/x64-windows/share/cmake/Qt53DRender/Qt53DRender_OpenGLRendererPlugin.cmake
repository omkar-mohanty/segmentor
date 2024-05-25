
add_library(Qt5::OpenGLRendererPlugin MODULE IMPORTED)


if(EXISTS "${_qt53DRender_install_prefix}/plugins/renderers/openglrenderer.dll")
    _populate_3DRender_plugin_properties(OpenGLRendererPlugin RELEASE "renderers/openglrenderer.dll" FALSE)
endif()
if(EXISTS "${_qt53DRender_install_prefix}/debug/plugins/renderers/openglrendererd.dll")
    _populate_3DRender_plugin_properties(OpenGLRendererPlugin DEBUG "renderers/openglrendererd.dll" FALSE)
endif()

list(APPEND Qt53DRender_PLUGINS Qt5::OpenGLRendererPlugin)
set_property(TARGET Qt5::3DRender APPEND PROPERTY QT_ALL_PLUGINS_renderers Qt5::OpenGLRendererPlugin)
set_property(TARGET Qt5::OpenGLRendererPlugin PROPERTY QT_PLUGIN_TYPE "renderers")
set_property(TARGET Qt5::OpenGLRendererPlugin PROPERTY QT_PLUGIN_EXTENDS "")
set_property(TARGET Qt5::OpenGLRendererPlugin PROPERTY QT_PLUGIN_CLASS_NAME "OpenGLRendererPlugin")
