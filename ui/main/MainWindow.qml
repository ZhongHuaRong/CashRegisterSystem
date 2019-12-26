import QtQuick 2.0
import QtQuick.Window 2.2

Rectangle {
    id:main_window
    width:640
    height:480
    visible:true
    
    Loader{
        id:page_loader
        source: "qrc:/ui/main/LoginPage.qml"
        anchors.fill: parent
        onLoaded: {
        }
    }
}
