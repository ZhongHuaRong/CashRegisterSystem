import QtQuick 2.0
import QtQuick.Window 2.2

Rectangle {
    id:main_window
    width:640
    height:480
    visible:true
    
    Text {
        id: element
        text: global_setting.remove_decimal_rule
        font.pixelSize: 8
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        anchors.fill: parent
    }
}
