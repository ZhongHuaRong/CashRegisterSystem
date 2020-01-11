import QtQuick 2.0
import QtQuick.Controls 2.5

Button {
    id:btn
    
    property var color: "#CCCCCC"
    property var checkedColor: "#45BEF4"
    
    text:"10元"
    font.family: GlobalVar.$settings.font_family
    font.pixelSize: GlobalVar.$settings.font_pixel + 2
    font.bold:true
    checkable:true
    
    background: Rectangle{
        color: "#FFFFFF"
        border.width: 0
        
        Rectangle{
            color: "#00000000"
            border.width: 1
            border.color: btn.checked?btn.checkedColor:btn.color
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            anchors.right:parent.right
            height:2
        }
    }
    
    contentItem: Text{
        font:btn.font
        text:btn.text
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment:Text.AlignHCenter
        color: btn.checked?btn.checkedColor:btn.color
    }
    
}
