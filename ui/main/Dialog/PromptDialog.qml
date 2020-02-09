import QtQuick 2.0
import QtQuick.Window 2.12
import "../../core"
import QtQuick.Layouts 1.12

Window {
    id:promptDialog 
    visible: false
    flags:Qt.Dialog | Qt.FramelessWindowHint
    modality: Qt.ApplicationModal
    width:400
    height:200
    color: "#00000000"
    
    signal accept()
    
    property alias msg: msgText.text
    
    Rectangle{
        id: rectangle
        border.width: 1
        border.color: "#797979"
        radius: 8
        anchors.fill: parent
        
        CText{
            id:title
            text: memberSearch.title
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.topMargin: 10
            font.bold: true
        }
        
        Rectangle{
            id:line1
            height: 1
            color: "#797979"
            anchors.right: parent.right
            anchors.rightMargin: 15
            anchors.left: parent.left
            anchors.leftMargin: 15
            anchors.top: title.bottom
            anchors.topMargin: 5
            border.width: 0
        }
        
        CText{
            id:msgText
            height: 40
            verticalAlignment: Text.AlignVCenter
            anchors.right: parent.right
            anchors.rightMargin: 15
            anchors.left: parent.left
            anchors.leftMargin: 15
            anchors.top: line1.bottom
            anchors.topMargin: 30
            horizontalAlignment: Text.AlignHCenter
        }
        
        Rectangle{
            id:line2
            height: 1
            color: "#797979"
            anchors.right: parent.right
            anchors.rightMargin: 15
            anchors.left: parent.left
            anchors.leftMargin: 15
            anchors.top: textEdit.bottom
            anchors.topMargin: 30
            border.width: 0
        }
        
        RowLayout{
            id:layout
            anchors.top: line2.bottom
            anchors.topMargin: 10
            anchors.right: parent.right
            anchors.rightMargin: 10
            anchors.left: parent.left
            anchors.leftMargin: 10
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 10 
            
            CButton{
                id:closeBtn
                text: "否"
                text_color: "#FFFFFF"
                pressedColor:"#169BD5"
                exitedColor: "#169BD5"
                enteredColor: "#169BD5"
                borderWidth:0
                onClicked: promptDialog.hide()
                Layout.alignment: Qt.AlignVCenter |  Qt.AlignHCenter 
            }
            
            CButton{
                id:acceptBtn
                text: "是"
                text_color: "#FFFFFF"
                pressedColor:"#e00000"
                exitedColor: "#e00000"
                enteredColor: "#e00000"
                borderWidth:0
                Layout.alignment: Qt.AlignVCenter |  Qt.AlignHCenter 
                onClicked: promptDialog.accept()
            }
        }
    }
}
