import QtQuick 2.7
import QtQuick.Window 2.10
import "./core/"
import "./main"
import "./secondary"

Window {
    id: main_window
//    width:Qt.application.screens[0].width
//    height:Qt.application.screens[0].height + 1
    width:1280
    height:960
//    width:640
//    height:480
    visible:true
    x:0
    y:0
    flags:Qt.Window | Qt.FramelessWindowHint
    screen:Qt.application.screens[0]
    
    function addImage(list){
        GlobalVar.$adImageList = list
    }
    
    Component.onCompleted: {
        GlobalVar.$event.return_image_path_list.connect(main_window.addImage)
        GlobalVar.$event.find_image(GlobalVar.$settings.image_path)
    }
    
    Timer{
        interval: 500 
        running: true
        repeat: true
        onTriggered: {
            GlobalVar.$curImageIndex += 1
            GlobalVar.$curImageIndex %= GlobalVar.$adImageList.length
            guest_window.adChanged(GlobalVar.$curImageIndex)
        }
    }
    
    MainWindow {
        id:main_rect
        anchors.fill: parent

    }
    
    GuestWindow {
        id:guest_window
    }
    
}
