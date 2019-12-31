import QtQuick 2.12
import QtQuick.Controls 2.5
import "./"

Rectangle {
    id:rect  
    color: "#FFFFFF"
    border.width: 1
    border.color: "#CCCCCC"
//    clip: true
    
    Row {
        id: row
        anchors.fill: parent
        spacing: 2
        topPadding: 5
        leftPadding: 2
        rightPadding: 2
        bottomPadding: 5
        
        Button{
            id:firstBtn
            text:new Date().toLocaleDateString(GlobalVar.$locale,"yyyy-MM-dd")
            anchors.verticalCenter: parent.verticalCenter
            width:(row.width - spaceText.width - 8) / 2
            height:row.height - 10
            background: Rectangle{
                border.width: 0
                color: {
                    if(firstBtn.pressed)
                        return "#CCCCCC"
                    else
                        return "#00000000"
                }
            }
            onClicked: popup.open()
        }
        
        Text{
            id:spaceText
            text:"~"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            anchors.verticalCenter: parent.verticalCenter
        }
        
        Button{
            id:secondBtn
            text:firstBtn.text
            anchors.verticalCenter: parent.verticalCenter
            width:firstBtn.width
            height:row.height - 10
            background: Rectangle{
                border.width: 0
                color: {
                    if(secondBtn.pressed)
                        return "#CCCCCC"
                    else
                        return "#00000000"
                }
            }
            onClicked: popup.open()
        }
    }
    
    Popup{
        id:popup
        closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutside

        contentItem: Calendar {
            id: calendar
        }

        background: Rectangle {
            border.color:"#CCCCCC"
            border.width:1
            color:"#ffffff"
        }
    }
}
