
add_library(Qt5::GLTFSceneImportPlugin MODULE IMPORTED)


if(EXISTS "${_qt53DRender_install_prefix}/plugins/sceneparsers/gltfsceneimport.dll")
    _populate_3DRender_plugin_properties(GLTFSceneImportPlugin RELEASE "sceneparsers/gltfsceneimport.dll" FALSE)
endif()
if(EXISTS "${_qt53DRender_install_prefix}/debug/plugins/sceneparsers/gltfsceneimportd.dll")
    _populate_3DRender_plugin_properties(GLTFSceneImportPlugin DEBUG "sceneparsers/gltfsceneimportd.dll" FALSE)
endif()

list(APPEND Qt53DRender_PLUGINS Qt5::GLTFSceneImportPlugin)
set_property(TARGET Qt5::3DRender APPEND PROPERTY QT_ALL_PLUGINS_sceneparsers Qt5::GLTFSceneImportPlugin)
set_property(TARGET Qt5::GLTFSceneImportPlugin PROPERTY QT_PLUGIN_TYPE "sceneparsers")
set_property(TARGET Qt5::GLTFSceneImportPlugin PROPERTY QT_PLUGIN_EXTENDS "")
set_property(TARGET Qt5::GLTFSceneImportPlugin PROPERTY QT_PLUGIN_CLASS_NAME "GLTFSceneImportPlugin")
