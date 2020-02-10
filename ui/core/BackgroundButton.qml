import QtQuick 2.12
import QtQuick.Controls 2.5
import "./"

Button {
    id:btn
    checkable: true
    padding: 0
    
    property color color: "#FFFFFF"
    property color checkedColor: "#2DB7F5"
    property color fontColor: "#999999"
    property color checkedFontColor: "#FFFFFF"
    property color border_color: "#CCCCCC"
    
    background: Rectangle{
        id:backgroundRect
        border.width: 1
        border.color: btn.border_color
        color: btn.checked?btn.checkedColor:btn.color
    }
    
    contentItem: CText{
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        color: btn.checked?btn.checkedFontColor:btn.fontColor
        font.bold: true
        font.pixelSize: GlobalVar.$settings.font_pixel + 4
        text:btn.text
    }
}
