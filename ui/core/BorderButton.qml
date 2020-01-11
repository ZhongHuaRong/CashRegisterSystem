import QtQuick 2.12
import QtQuick.Controls 2.5
import "./"

Button {
    id:btn
    checkable: true
    padding: 0
    
    property color color: "#F33F2B"
    property color  checkedColor: "#2DB7F5"
    
    background: Rectangle{
        border.width: 1
        border.color: btn.checked?btn.checkedColor:btn.color
    }
    
    contentItem: CText{
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        color: btn.checked?btn.checkedColor:btn.color
        font.bold: true
        font.pixelSize: GlobalVar.$settings.font_pixel + 4
        text:btn.text
    }
}
