import QtQuick 2.7
import QtQuick.Controls 2.5

Rectangle{
    id:rect 
    radius:5
    clip: true
    border.color: "#CCCCCC"
    border.width: 1
    
    property string text: input.text
    property string preset_text: ""
    property color preset_text_color: "#999999"
    property int echoMode: TextInput.Normal
    property string font_family: "微软雅黑"
    property int  font_pixel: 13
    
    function setText(text){
        input.text = text
    }
    
    Text {
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        anchors.fill:parent
        color: rect.preset_text_color
        text:rect.preset_text
        visible: input.text.length == 0
        font: input.font
        z:2
    }
    
    TextInput {
        id:input
        font.pixelSize: font_pixel 
        font.family: font_family
        width: parent.width
        anchors.centerIn: parent
        horizontalAlignment:TextInput.AlignVCenter
        echoMode:rect.echoMode
        leftPadding: 5
        rightPadding: 5
        z:12
    }    
}
