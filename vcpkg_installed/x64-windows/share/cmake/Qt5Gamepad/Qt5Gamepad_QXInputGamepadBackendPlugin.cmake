
add_library(Qt5::QXInputGamepadBackendPlugin MODULE IMPORTED)


if(EXISTS "${_qt5Gamepad_install_prefix}/plugins/gamepads/xinputgamepad.dll")
    _populate_Gamepad_plugin_properties(QXInputGamepadBackendPlugin RELEASE "gamepads/xinputgamepad.dll" FALSE)
endif()
if(EXISTS "${_qt5Gamepad_install_prefix}/debug/plugins/gamepads/xinputgamepadd.dll")
    _populate_Gamepad_plugin_properties(QXInputGamepadBackendPlugin DEBUG "gamepads/xinputgamepadd.dll" FALSE)
endif()

list(APPEND Qt5Gamepad_PLUGINS Qt5::QXInputGamepadBackendPlugin)
set_property(TARGET Qt5::Gamepad APPEND PROPERTY QT_ALL_PLUGINS_gamepads Qt5::QXInputGamepadBackendPlugin)
set_property(TARGET Qt5::QXInputGamepadBackendPlugin PROPERTY QT_PLUGIN_TYPE "gamepads")
set_property(TARGET Qt5::QXInputGamepadBackendPlugin PROPERTY QT_PLUGIN_EXTENDS "")
set_property(TARGET Qt5::QXInputGamepadBackendPlugin PROPERTY QT_PLUGIN_CLASS_NAME "QXInputGamepadBackendPlugin")
