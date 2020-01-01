import QtQuick 2.0
import QtQuick.Layouts 1.12
import "../View"
import "../../core"

Item{
    id:loader
    
    property bool isText: true
    property string text: ""
    property bool firstBtnVisible: true
    property bool secondBtnVisible: false
    property string firstBtnText: "1"
    property string secondBtnText: "2"
    
    signal firstBtnClick()
    signal secondBtnClick()
    
    RowLayout{
        id: element
        anchors.fill: parent
        visible: !isText
        
        CButton{
            id:firstBtn
            height: parent.height - 10
            text: firstBtnText
            text_color: "#FFFFFF"
            pressedColor:"#169BD5"
            exitedColor: "#169BD5"
            unClickedColor:"#979797"
            enteredColor: "#169BD5"
            borderWidth:0
            font_family: GlobalVar.$settings.font_family
            font_pixel: GlobalVar.$settings.font_pixel
            onClicked: firstBtnClick()
            visible: firstBtnVisible
            Layout.alignment:Qt.AlignVCenter | Qt.AlignHCenter
            Layout.fillWidth:true
        }
        
        CButton{
            id:secondBtn
            height: parent.height - 10
            text: secondBtnText
            text_color: "#FFFFFF"
            pressedColor:"#169BD5"
            exitedColor: "#169BD5"
            unClickedColor:"#979797"
            enteredColor: "#169BD5"
            borderWidth:0
            font_family: GlobalVar.$settings.font_family
            font_pixel: GlobalVar.$settings.font_pixel
            visible: secondBtnVisible
            onClicked: secondBtnClick()
            Layout.alignment:Qt.AlignVCenter | Qt.AlignHCenter
            Layout.fillWidth:true
        }
        
    }
    
    Text {
        anchors.fill: parent
        text:loader.text
        visible: isText
        color: "#445266"
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment:Text.AlignHCenter
        elide :Text.ElideRight
        font.family: GlobalVar.$settings.font_family
        font.pixelSize: GlobalVar.$settings.font_pixel
    }
    
}
