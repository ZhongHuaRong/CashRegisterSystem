import QtQuick 2.0
import "../../core"

Rectangle{
    id:bottomRect
    height: 40
    border.color: "#CCCCCC"
    border.width: 1
    
    property string totalNumText: "0"
    property string pageNumText: "0"
    property string curPageText: "1"
    
    signal gotoPage(var page)
    
    Row{
        id: row
        anchors.leftMargin: 5
        anchors.right: buttonRow.left
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.rightMargin: 5
        clip: true
        spacing: 7
        
        CText{
            text:"订单总数:"
            anchors.verticalCenter: parent.verticalCenter
        }
        
        CText {
            id:totalNum
            text:totalNumText
            anchors.verticalCenter: parent.verticalCenter
        }
        
        CText{
            text:"|"
            anchors.verticalCenter: parent.verticalCenter
        }
        
        CText{
            text:"总页数"
            anchors.verticalCenter: parent.verticalCenter
        }
        CText {
            id:pageNum
            text:pageNumText
            anchors.verticalCenter: parent.verticalCenter
        }
        CText{
            text:"|"
            anchors.verticalCenter: parent.verticalCenter
        }
        
        CText{
            text:"当前页数"
            anchors.verticalCenter: parent.verticalCenter
        }
        CText {
            id:curPage
            text:curPageText
            anchors.verticalCenter: parent.verticalCenter
        }
    }
    
    Row{
        id:buttonRow
        spacing: 10
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        anchors.top: parent.top
        anchors.topMargin: 0
        anchors.right: parent.right
        anchors.rightMargin: 5
        
        CButton{
            id:provious
            text: "上一页"
            text_color: "#FFFFFF"
            anchors.verticalCenter: parent.verticalCenter
            pressedColor:"#169BD5"
            exitedColor: "#169BD5"
            unClickedColor:"#979797"
            enteredColor: "#169BD5"
            borderWidth:0
            height: 30
            width: 100
            onClicked: gotoPage(Number(curPageText) - 1)
            canClicked: curPageText != "1"
        }
        
        CButton{
            id:next
            text: "下一页"
            text_color: "#FFFFFF"
            anchors.verticalCenter: parent.verticalCenter
            pressedColor:"#169BD5"
            exitedColor: "#169BD5"
            unClickedColor:"#979797"
            enteredColor: "#169BD5"
            borderWidth:0
            height: provious.height
            width: 100
            onClicked: gotoPage(Number(curPageText) + 1)
            canClicked: Number(curPageText) < Number(pageNumText)
        }
    }
}
