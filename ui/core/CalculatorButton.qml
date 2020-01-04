import QtQuick 2.12
import QtQuick.Controls 2.5
import QtGraphicalEffects 1.12
import "./"

Button{
    id:btn
    
    property var color: "#FFFFFF"
    property var backColor: "#525152"
    text:"10元"
    font.family: GlobalVar.$settings.font_family
    font.pixelSize: GlobalVar.$settings.font_pixel + 2
    font.bold:true
    
    background: Rectangle{
        color: backColor
        RadialGradient {
            anchors.fill: parent
            angle:90
            gradient: Gradient {
                GradientStop { position: 0.0; color: backColor }
                GradientStop { position: 1.0; color: "black" }
            }
        }
    }
    
    contentItem: Text{
        font:btn.font
        text:btn.text
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment:Text.AlignHCenter
        color: btn.color
    }
}
