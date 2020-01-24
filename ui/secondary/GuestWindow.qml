import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    id:guest_window
    width:640
    height:480
    visible: true
//    visible:Qt.application.screens.length > 1
//    visibility: Qt.application.screens.length > 1?Window.Maximized:Window.Hidden
//    screen:{
//        if(Qt.application.screens.length > 1)
//            return Qt.application.screens[1]
//        else
//            return Qt.application.screens[0]
//    }
    
    onClosing: Qt.quit()
    
    function adChanged(index){
        console.debug(index)
    }
    
    ADRect{
        anchors.fill: parent
    }
}
