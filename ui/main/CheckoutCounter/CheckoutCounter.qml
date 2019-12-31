import QtQuick 2.12
import QtQuick.Controls 2.5

Rectangle {
    id: page
    color:"#00000000"
    
    property string text  : "page"
    
    Text {
        id: txt
        text: page.text
        font.pixelSize: 13
        anchors.fill: parent
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
    }
}
