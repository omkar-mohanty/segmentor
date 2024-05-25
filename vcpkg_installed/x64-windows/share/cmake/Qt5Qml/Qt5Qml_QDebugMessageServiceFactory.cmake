
add_library(Qt5::QDebugMessageServiceFactory MODULE IMPORTED)


if(EXISTS "${_qt5Qml_install_prefix}/plugins/qmltooling/qmldbg_messages.dll")
    _populate_Qml_plugin_properties(QDebugMessageServiceFactory RELEASE "qmltooling/qmldbg_messages.dll" FALSE)
endif()
if(EXISTS "${_qt5Qml_install_prefix}/debug/plugins/qmltooling/qmldbg_messagesd.dll")
    _populate_Qml_plugin_properties(QDebugMessageServiceFactory DEBUG "qmltooling/qmldbg_messagesd.dll" FALSE)
endif()

list(APPEND Qt5Qml_PLUGINS Qt5::QDebugMessageServiceFactory)
set_property(TARGET Qt5::Qml APPEND PROPERTY QT_ALL_PLUGINS_qmltooling Qt5::QDebugMessageServiceFactory)
set_property(TARGET Qt5::QDebugMessageServiceFactory PROPERTY QT_PLUGIN_TYPE "qmltooling")
set_property(TARGET Qt5::QDebugMessageServiceFactory PROPERTY QT_PLUGIN_EXTENDS "")
set_property(TARGET Qt5::QDebugMessageServiceFactory PROPERTY QT_PLUGIN_CLASS_NAME "QDebugMessageServiceFactory")
