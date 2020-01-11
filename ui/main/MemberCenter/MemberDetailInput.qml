import QtQuick 2.12
import QtQuick.Controls 2.5
import "../../core"


Item {
    
    property var w: {
        if(btnRect.width > btnRect.height){
            return (btnRect.height - 3) / 4
        } else {
            return (btnRect.width - 3) / 4
        }
    }
    property string preset: "请输入手机号码"
    
    function addNum(num){
        amountInputText.cursorVisible = true
        if(amountInputText.text === preset){
            amountInputText.text = num
            amountInputText.cursorPosition = 1
            return
        }
        amountInputText.insert(amountInputText.cursorPosition,num)
    }
    
    function moveCursor(num){
        amountInputText.cursorVisible = true
        amountInputText.cursorVisible = true
        amountInputText.cursorPosition = amountInputText.cursorPosition + num
    }
    
    function removeText(num){
        amountInputText.cursorVisible = true
        amountInputText.remove(amountInputText.cursorPosition - num,amountInputText.cursorPosition)
        if(amountInputText.text.length === 0)
            amountInputText.text = preset
    }
    
    function clear(){
        amountInputText.clear()
        amountInputText.text = preset
    }
    
    function getRet(){
        return amountInputText.text
    }
    
    Rectangle{
        id:amountRect
        color: "#F2F2F2"
        border.width: 0
        radius: 5
        anchors.top: parent.top
        anchors.topMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.right: parent.right
        anchors.rightMargin: 0
        height:30
        
        TextEdit{
            id:amountInputText
            anchors.fill: parent
            horizontalAlignment : TextEdit.AlignHCenter
            verticalAlignment: TextEdit.AlignVCenter
            font.family: GlobalVar.$settings.font_family
            font.pixelSize: GlobalVar.$settings.font_pixel
            readOnly:false
            color:"#999999"
            cursorVisible:true
            clip: true
            inputMethodHints:Qt.ImhDigitsOnly
            text:preset
        }
    }
    
    Item{
        id:btnRect
        anchors.top: amountRect.bottom
        anchors.topMargin: 5
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.right: parent.right
        anchors.rightMargin: 0
        
        Flow{
            id:layout
            anchors.fill: parent 
            spacing:1
            
            CButton{
                id:seven
                text:"7"
                width:w
                height: w
                onClicked: addNum(text)
                pressedColor:"#525152"
                exitedColor: "#525152"
                text_color: "#FFFFFF"
                font_pixel: GlobalVar.$settings.font_pixel + 4
                font_bold: true
            }
            CButton{
                text:"8"
                width:w
                height: w
                onClicked: addNum(text)
                pressedColor:"#525152"
                exitedColor: "#525152"
                text_color: "#FFFFFF"
                font_pixel: GlobalVar.$settings.font_pixel + 4
                font_bold: true
            }
            CButton{
                text:"9"
                width:w
                height: w
                onClicked: addNum(text)
                pressedColor:"#525152"
                exitedColor: "#525152"
                text_color: "#FFFFFF"
                font_pixel: GlobalVar.$settings.font_pixel + 4
                font_bold: true
            }
            CButton{
                text:"退格"
                width:w
                height: w
                onClicked: removeText(1)
                pressedColor:"#525152"
                exitedColor: "#525152"
                text_color: "#FFFFFF"
                font_pixel: GlobalVar.$settings.font_pixel + 4
                font_bold: true
            }
            CButton{
                text:"4"
                width:w
                height: w
                onClicked: addNum(text)
                pressedColor:"#525152"
                exitedColor: "#525152"
                text_color: "#FFFFFF"
                font_pixel: GlobalVar.$settings.font_pixel + 4
                font_bold: true
            }
            CButton{
                text:"5"
                width:w
                height: w
                onClicked: addNum(text)
                pressedColor:"#525152"
                exitedColor: "#525152"
                text_color: "#FFFFFF"
                font_pixel: GlobalVar.$settings.font_pixel + 4
                font_bold: true
            }
            CButton{
                text:"6"
                width:w
                height: w
                onClicked: addNum(text)
                pressedColor:"#525152"
                exitedColor: "#525152"
                text_color: "#FFFFFF"
                font_pixel: GlobalVar.$settings.font_pixel + 4
                font_bold: true
            }
            CButton{
                text:"<-"
                width:w
                height: w
                onClicked: moveCursor(-1)
                pressedColor:"#525152"
                exitedColor: "#525152"
                text_color: "#FFFFFF"
                font_pixel: GlobalVar.$settings.font_pixel + 4
                font_bold: true
            }
            CButton{
                text:"1"
                width:w
                height: w
                onClicked: addNum(text)
                pressedColor:"#525152"
                exitedColor: "#525152"
                text_color: "#FFFFFF"
                font_pixel: GlobalVar.$settings.font_pixel + 4
                font_bold: true
            }
            CButton{
                text:"2"
                width:w
                height: w
                onClicked: addNum(text)
                pressedColor:"#525152"
                exitedColor: "#525152"
                text_color: "#FFFFFF"
                font_pixel: GlobalVar.$settings.font_pixel + 4
                font_bold: true
            }
            CButton{
                text:"3"
                width:w
                height: w
                onClicked: addNum(text)
                pressedColor:"#525152"
                exitedColor: "#525152"
                text_color: "#FFFFFF"
                font_pixel: GlobalVar.$settings.font_pixel + 4
                font_bold: true
            }
            CButton{
                text:"->"
                width:w
                height: w
                onClicked: moveCursor(1)
                pressedColor:"#525152"
                exitedColor: "#525152"
                text_color: "#FFFFFF"
                font_pixel: GlobalVar.$settings.font_pixel + 4
                font_bold: true
            }
            CButton{
                text:"0"
                width:w * 3 + 2
                height: w
                onClicked: addNum(text)
                pressedColor:"#525152"
                exitedColor: "#525152"
                text_color: "#FFFFFF"
                font_pixel: GlobalVar.$settings.font_pixel + 4
                font_bold: true
            }
            CButton{
                text:"清空"
                width:w
                height: w
                onClicked: clear()
                pressedColor:"#525152"
                exitedColor: "#525152"
                text_color: "#FFFFFF"
                font_pixel: GlobalVar.$settings.font_pixel + 4
                font_bold: true
            }
            
        }
    }
}
