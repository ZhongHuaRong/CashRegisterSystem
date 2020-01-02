import QtQuick 2.12
import QtQuick.Controls 2.5
import "./"

TabButton {
    id:btn
    checkable: true
    padding:0
    clip: true
    font.family: GlobalVar.$settings.font_family
    font.pixelSize: GlobalVar.$settings.font_pixel
    
    signal close(var item)
    
    property bool show_icon: true

    contentItem:Rectangle{
        id: rectangle
        border.width: 1
        border.color: "#CCCCCC"
        color:btn.checked?"#3F3f3F":"#FFFFFF"
        
        Image {
            id:exit_icon
            visible: show_icon
            source: "qrc:/image/close_exit.png"
            sourceSize.width:{
                if(parent.height > 24)
                    return 16
                else 
                    return parent.height - 8
            }
            sourceSize.height:{
                if(parent.height > 24)
                    return 16
                else 
                    return parent.height - 8
            }

            anchors.right: parent.right
            anchors.rightMargin: 5
            anchors.verticalCenter :parent.verticalCenter
            
            MouseArea{
                anchors.fill: parent
                onPressed: exit_icon.source = "qrc:/image/close_enter.png"
                onExited: exit_icon.source = "qrc:/image/close_exit.png"
                onClicked: btn.close(btn)
            }
        }
        
        
        Text{
            id:txt  
            text:btn.text
            font:btn.font
            color: btn.checked?"#FFFFFF":"#333333"
            anchors.right: show_icon?exit_icon.left:parent.right
            anchors.rightMargin: 5
            anchors.left: parent.left
            anchors.leftMargin: 5
            anchors.verticalCenter :parent.verticalCenter
            elide :Text.ElideRight
        }
        
        
    }
}
