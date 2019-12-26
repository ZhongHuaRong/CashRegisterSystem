import QtQuick 2.0
import QtQuick.Window 2.12

Window {
    id:guest_window
    width:640
    height:480
    visible:Qt.application.screens.length > 1
    visibility: Qt.application.screens.length > 1?Window.Maximized:Window.Hidden
    screen:{
        if(Qt.application.screens.length > 1)
            return Qt.application.screens[1]
        else
            return Qt.application.screens[0]
    }
}
