import QtQuick 2.0
import QtQuick.Layouts 1.12
import "../View"
import "../../core"

Item{
    id:loader
    clip: true
    
    property bool isText: true
    property string text: ""
    property bool firstBtnVisible: true
    property bool secondBtnVisible: false
    property string firstBtnText: "1"
    property string secondBtnText: "2"
    
    signal firstBtnClick()
    signal secondBtnClick()
    
    RowLayout{
        id: element
        anchors.fill: parent
        visible: !isText
        spacing: 5
        
        CButton{
            id:firstBtn
            height: parent.height - 10
            width:70
            text: firstBtnText
            text_color: "#FFFFFF"
            pressedColor:"#169BD5"
            exitedColor: "#169BD5"
            unClickedColor:"#979797"
            enteredColor: "#169BD5"
            borderWidth:0
            onClicked: firstBtnClick()
            visible: firstBtnVisible
            Layout.alignment:Qt.AlignVCenter | Qt.AlignRight
        }
        
        Item{
            Layout.alignment:Qt.AlignVCenter | Qt.AlignHCenter
            width:1
            visible: firstBtnVisible
        }
        
        CButton{
            id:secondBtn
            height: parent.height - 10
            width:70
            text: secondBtnText
            text_color: "#FFFFFF"
            pressedColor:"#169BD5"
            exitedColor: "#169BD5"
            unClickedColor:"#979797"
            enteredColor: "#169BD5"
            borderWidth:0
            visible: secondBtnVisible
            onClicked: secondBtnClick()
            Layout.alignment:{
                if(firstBtnVisible)
                    Qt.AlignVCenter | Qt.AlignLeft
                else
                    Qt.AlignVCenter | Qt.AlignHCenter
            }
        }
        
    }
    
    CText {
        anchors.fill: parent
        text:loader.text
        visible: isText
        color: "#445266"
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment:Text.AlignHCenter
    }
    
}
