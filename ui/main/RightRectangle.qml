import QtQuick 2.12
import "../core"

Rectangle {
    id:rect
    
    signal connect_electronic_scale()

    Row {
        id: row
        height: 54
        anchors.right: parent.right
        anchors.rightMargin: 43
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.top: parent.top
        anchors.topMargin: 0
        spacing:10
        layoutDirection: Qt.RightToLeft

        CButton {
            id:exit_btn
            text:"退出"
            anchors.verticalCenter: parent.verticalCenter
            exitedColor:"#2DB7F5"
            enteredColor: "#5ECDB9"
            pressedColor:"#5ECDB9"
            text_color: "#FFFFFF"
            font_family: GlobalVar.$settings.font_family
            font_pixel: GlobalVar.$settings.font_pixel
            onClicked: Qt.quit()
        }  
        
        CButton {
            id:connect
            text:"未连接 连称"
            anchors.verticalCenter: parent.verticalCenter
            exitedColor:"#F33F2B"
            enteredColor: "#5ECDB9"
            pressedColor:"#5ECDB9"
            text_color: "#FFFFFF"
            font_family: GlobalVar.$settings.font_family
            font_pixel: GlobalVar.$settings.font_pixel
            onClicked: rect.connect_electronic_scale()
        }
        
        Text {
            id:name
            text:GlobalVar.$settings.account_name
            anchors.verticalCenter: parent.verticalCenter
            font.family: GlobalVar.$settings.font_family
            font.pixelSize: GlobalVar.$settings.font_pixel
            color: "#666666"
        }
        
        ClockText {
            id:clock
            text:GlobalVar.$settings.account_name
            anchors.verticalCenter: parent.verticalCenter
            font.family: GlobalVar.$settings.font_family
            font.pixelSize: GlobalVar.$settings.font_pixel
            color: "#666666"
        }
    }
    
    
    Rectangle{
        height:1
        color: "#E9E9E9"
        anchors.top: row.bottom
        anchors.topMargin: 0
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
    }
    
}
