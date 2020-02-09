import QtQuick 2.12
import "../core"

Item {
    id:detailspage
    
    Rectangle{
        id:topRect
        color: "#00000000"
        anchors.right: parent.right
        anchors.rightMargin: 1
        anchors.left: parent.left
        anchors.leftMargin: 1
        anchors.top: parent.top
        anchors.topMargin: 1
        border.width: 1
        border.color: "#CCCCCC"
        height:50
        
        Rectangle{
            id:logoRect
            width: 100
            color: "#00000000"
            border.width: 1
            border.color: "#000000"
            radius: 5
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 5
            anchors.top: parent.top
            anchors.topMargin: 5
            anchors.left: parent.left
            anchors.leftMargin: 10
            
            Image{
                anchors.fill: parent 
                source: "qrc:/image/login_logo.png"
            }
        }
        
        CText{
            id:name
            text:GlobalVar.$shopname
            anchors.left: logoRect.right
            anchors.leftMargin: 5
            anchors.verticalCenter: parent.verticalCenter
        }
        
        Rectangle{
            width: 600
            radius: 20
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 5
            anchors.top: parent.top
            anchors.topMargin: 5
            anchors.right: parent.right
            anchors.rightMargin: 10
            border.width: 1
            border.color: "#000000"
            color: "#00000000"
            
            CText{
                anchors.fill: parent
                text:GlobalVar.$settings.greeting
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
            }
        }
    }

    Item{
        id:leftRect
    }
    
    Item{
        id:rightRect
        
        ADRect{
            id:adRect
        }
        
        Rectangle{
            
        }
    }

}
