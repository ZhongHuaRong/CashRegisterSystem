import QtQuick 2.7
import QtQuick.Window 2.12
import "./core/"
import "./main"
import "./secondary"

Window {
    id: main_window
    width:640
    height:480
    visible:true
    visibility: Window.Maximized
    screen:Qt.application.screens[0]
    
//    property real multiplierH: window.height/480
//    property real multiplierW: window.width/640
    
    function dpH(numbers) {
        return numbers
//        return numbers*window.multiplierH;
    }

    function dpW(numbers) {
        return numbers
//        return numbers*window.multiplierW;
    }

    function dpX(numbers){
        return numbers
//        return (dpW(numbers)+dpH(numbers))/2;
    }

    GlobalSettings{
        id: global_setting
    }
    
    MainWindow {
        id:main_rect
        anchors.fill: parent
    }
    
    GuestWindow {
        id:guest_window
    }
    

    
}
