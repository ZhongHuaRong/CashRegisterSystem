import QtQuick 2.12
import QtQuick.Controls 2.5
import "./"

Item {
    id: element
    
    property real maxNum: 0
    property alias retNumText: amountInputText.text
    property real btnWidth: (element.width - 3) / 4
    property real btnHeight: {
        var h = btnWidth / 4
        if(h * 9 > btnRect.height)
            return (btnRect.height - 4) / 9
        else
            return h
    }
    
    function setNum(num){
        amountInputText.cursorVisible = true
        if(num >maxNum)
            amountInputText.text = maxNum
        else
            amountInputText.text = num
        amountInputText.cursorPosition = amountInputText.text.length
    }
    
    function addNum(num){
        amountInputText.cursorVisible = true
        if(amountInputText.text ==="0"){
            amountInputText.text = num
            amountInputText.cursorPosition = 1
            return
        }
        amountInputText.insert(amountInputText.cursorPosition,num)
        if(Number(amountInputText.text)>maxNum){
            amountInputText.text = maxNum
            amountInputText.cursorPosition = amountInputText.text.length
        }
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
            amountInputText.text = "0"
    }
    
    function addPoint(){
        amountInputText.cursorVisible = true
        if(amountInputText.text.indexOf(".") < 0){
            if(amountInputText.text ==="0"){
                amountInputText.text = "0."
                amountInputText.cursorPosition = 2
                return
            }
            amountInputText.insert(amountInputText.cursorPosition,".")
        }
    }
    
    function clear(){
        amountInputText.clear()
        amountInputText.text = "0"
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
            text:"0"
        }
    }
    
    Item{
        id:btnRect
        anchors.top: amountRect.bottom
        anchors.topMargin: 10
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
            
            CalculatorButton{
                text:"10元"
                width:btnWidth
                height: btnHeight
                backColor: "#8ABFC7"
                onClicked: setNum(10)
            }
            CalculatorButton{
                text:"20元"
                width:btnWidth
                height: btnHeight
                backColor: "#E2CD9D"
                onClicked: setNum(20)
            }
            CalculatorButton{
                text:"50元"
                width:btnWidth
                height: btnHeight
                backColor: "#3DCCBE"
                onClicked: setNum(50)
            }
            CalculatorButton{
                text:"100元"
                width:btnWidth
                height: btnHeight
                backColor: "#E9826B"
                onClicked: setNum(100)
            }
            CalculatorButton{
                id:seven
                text:"7"
                width:btnWidth
                height: btnHeight * 2
                onClicked: addNum(text)
            }
            CalculatorButton{
                text:"8"
                width:btnWidth
                height: seven.height
                onClicked: addNum(text)
            }
            CalculatorButton{
                text:"9"
                width:btnWidth
                height: seven.height
                onClicked: addNum(text)
            }
            CalculatorButton{
                text:"退格"
                width:btnWidth
                height: seven.height
                onClicked: removeText(1)
            }
            CalculatorButton{
                text:"4"
                width:btnWidth
                height: seven.height
                onClicked: addNum(text)
            }
            CalculatorButton{
                text:"5"
                width:btnWidth
                height: seven.height
                onClicked: addNum(text)
            }
            CalculatorButton{
                text:"6"
                width:btnWidth
                height: seven.height
                onClicked: addNum(text)
            }
            CalculatorButton{
                text:"<-"
                width:btnWidth
                height: seven.height
                backColor: "#CCCCCC"
                onClicked: moveCursor(-1)
            }
            CalculatorButton{
                text:"1"
                width:btnWidth
                height: seven.height
                onClicked: addNum(text)
            }
            CalculatorButton{
                text:"2"
                width:btnWidth
                height: seven.height
                onClicked: addNum(text)
            }
            CalculatorButton{
                text:"3"
                width:btnWidth
                height: seven.height
                onClicked: addNum(text)
            }
            CalculatorButton{
                text:"->"
                width:btnWidth
                height: seven.height
                backColor: "#CCCCCC"
                onClicked: moveCursor(1)
            }
            CalculatorButton{
                text:"0"
                width:btnWidth * 2 + 1
                height: seven.height
                onClicked: addNum(text)
            }
            CalculatorButton{
                text:"."
                width:btnWidth
                height: seven.height
                onClicked: addPoint()
            }
            CalculatorButton{
                text:"清空"
                width:btnWidth
                height: seven.height
                onClicked: clear()
            }
            
        }
    }
}
