import QtQuick 2.12
import QtQuick.Controls 2.5
import "./"

Rectangle{
    id:rect 
    radius:5
    clip: true
    border.color: "#CCCCCC"
    border.width: 1
    
    signal accepted()
    property string text: input.text
    property string preset_text: ""
    property color preset_text_color: "#999999"
    property int echoMode: TextInput.Normal
    property string font_family: GlobalVar.$settings.font_family
    property int  font_pixel: GlobalVar.$settings.font_pixel
    
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
        horizontalAlignment:TextInput.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        echoMode:rect.echoMode
        leftPadding: 5
        rightPadding: 5
        focus: true
        selectByMouse:true
        onAccepted: rect.accepted()
        z:12
    }    
}
