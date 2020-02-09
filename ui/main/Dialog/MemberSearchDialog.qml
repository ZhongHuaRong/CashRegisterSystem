import QtQuick 2.0
import QtQuick.Window 2.12
import "../../core"
import QtQuick.Layouts 1.12

Window {
    id:memberSearch 
    visible: false
    flags:Qt.Dialog | Qt.FramelessWindowHint
    modality: Qt.ApplicationModal
    width:400
    height:200
    color: "#00000000"
    title: "会员查询"
    
    signal searchMember(var data)
    signal insertMember(var data)
    
    function searchfailed(){
        promptDialog.show()
    }
    
    Rectangle{
        id: rectangle
        border.width: 1
        border.color: "#797979"
        radius: 8
        anchors.fill: parent
        
        CText{
            id:title
            text: memberSearch.title
            anchors.left: parent.left
            anchors.leftMargin: 15
            anchors.top: parent.top
            anchors.topMargin: 10
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
        
        CTextEdit{
            id:textEdit
            height: 40
            anchors.right: parent.right
            anchors.rightMargin: 15
            anchors.left: parent.left
            anchors.leftMargin: 15
            anchors.top: line1.bottom
            anchors.topMargin: 30
            horizontalAlignment: Text.AlignLeft
            preset_text: "输入会员卡号/手机号"
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
                text: "取消"
                text_color: "#FFFFFF"
                pressedColor:"#169BD5"
                exitedColor: "#169BD5"
                enteredColor: "#169BD5"
                borderWidth:0
                onClicked: memberSearch.close()
                Layout.alignment: Qt.AlignVCenter |  Qt.AlignHCenter 
            }
            
            CButton{
                id:acceptBtn
                text: "确认"
                text_color: "#FFFFFF"
                pressedColor:"#169BD5"
                exitedColor: "#169BD5"
                enteredColor: "#169BD5"
                borderWidth:0
                Layout.alignment: Qt.AlignVCenter |  Qt.AlignHCenter 
                onClicked: {
                    memberSearch.searchMember(textEdit.text)
                    memberSearch.close()
                }
                canClicked: textEdit.text.length != 0
            }
        }
    }
    
    PromptDialog{
        id:promptDialog
        title: "操作提示"
        msg:"未查询到会员，是否添加?"
        onAccept: {
            promptDialog.hide()
            memberSearch.insertMember(textEdit.text)
            memberSearch.close()
        }
    }
}
