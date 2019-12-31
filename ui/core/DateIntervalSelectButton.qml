import QtQuick 2.12
import QtQuick.Controls 2.5
import "./"

Rectangle {
    id:rect  
    color: "#FFFFFF"
    border.width: 1
    border.color: "#CCCCCC"
//    clip: true
    
    property var curDate: new Date()
    property bool firstFlag: true
    property var firstDate: curDate
    property var secondDate: curDate
    
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
            text:curDate.toLocaleDateString(GlobalVar.$locale,"yyyy-MM-dd")
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
            onClicked: {
                firstFlag = true
                calendar.maximumDate = secondDate
                calendar.minimumDate = Date.fromLocaleString(GlobalVar.$locale, 
                                                             "1970-01-01", "yyyy-MM-dd")
                calendar.selectedDate = firstDate
                popup.open()
            }
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
            text:curDate.toLocaleDateString(GlobalVar.$locale,"yyyy-MM-dd")
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
            onClicked: {
                firstFlag = false
                calendar.maximumDate = curDate
                calendar.minimumDate = firstDate
                calendar.selectedDate = secondDate
                popup.open()
            }
        }
    }
    
    Popup{
        id:popup
        closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutside
        y:row.y + row.height
        
        leftInset: 0
        leftPadding: 0
        topInset: 0
        topPadding: 0
        bottomInset: 0
        bottomPadding: 0
        rightPadding:0
        rightInset: 0
        contentItem: Calendar {
            id: calendar
            maximumDate: curDate.toLocaleDateString(GlobalVar.$locale,"yyyy-MM-dd")
            onClicked: {
                popup.close()
                if(firstFlag){
                    firstDate = date
                    firstBtn.text = date.toLocaleDateString(GlobalVar.$locale,"yyyy-MM-dd")
                }
                else {
                    secondDate = date
                    secondBtn.text = date.toLocaleDateString(GlobalVar.$locale,"yyyy-MM-dd")
                }
            }
        }

        background: Rectangle {
            border.color:"#CCCCCC"
            border.width:1
            color:"#ffffff"
        }
    }
}
