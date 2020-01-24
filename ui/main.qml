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
    
    function addImage(list){
        GlobalVar.$adImageList = list
    }
    
    Component.onCompleted: {
        GlobalVar.$event.return_image_path_list.connect(main_window.addImage)
        GlobalVar.$event.find_image(GlobalVar.$settings.image_path)
    }
    
    MainWindow {
        id:main_rect
        anchors.fill: parent

    }
    
    GuestWindow {
        id:guest_window
    }
    

    
}
