import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12
import "../../core"

Item {
    id: element
//    
    
    property string balance: "0.5"
    property real rechargeValue: 0.00
    property bool increase: true
    
    RowLayout{
        id:header
        anchors.top: parent.top
        anchors.topMargin: 10
        anchors.right: parent.right
        anchors.rightMargin: 10
        anchors.left: parent.left
        anchors.leftMargin: 10
        height:40
        
        Item{
            Layout.fillHeight: true
            Layout.fillWidth: true
            CText{
                id:accountText
                text:"卡内余额:"
                anchors.left: parent.left
                anchors.leftMargin: 10
                anchors.verticalCenter: parent.verticalCenter
            }
            CText{
                id:accountID
                text:balance
                anchors.left: accountText.right
                anchors.leftMargin: 10
                anchors.verticalCenter: parent.verticalCenter
            }
        }
        
        Item{
            Layout.fillHeight: true
            Layout.fillWidth: true
            CText{
                id:amountText
                text:"本次充值:"
                anchors.verticalCenter: parent.verticalCenter
            }
            CText{
                id:maxamount
                text:{
                    if(increase)
                        return rechargeValue.toString()
                    else
                        return (0.00-rechargeValue).toString()
                }
                anchors.left: amountText.right
                anchors.leftMargin: 10
                anchors.verticalCenter: parent.verticalCenter
            }
        }
    }
    
    ButtonGroup{
        buttons: flowLayout.children
        onClicked: {
            rechargeValue = Number(button.text.slice(0,button.text.length - 1))
        }
    }

    Flow{
        id:flowLayout
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.top: header.bottom
        anchors.topMargin: 1
        padding: 10
        spacing: 10
        
        BorderButton{
            id:tenBtn
            text:"10元"
            height:width/1.5
            width:flowLayout.width / 4 - 13
        }
        
        BorderButton{
            id:twentyBtn
            text:"20元"
            height:tenBtn.height
            width:tenBtn.width
        }
        
        BorderButton{
            id:fiftyBtn
            text:"50元"
            height:tenBtn.height
            width:tenBtn.width
        }
        
        BorderButton{
            id:hundredBtn
            text:"100元"
            height:tenBtn.height
            width:tenBtn.width
        }
        
        BorderButton{
            id:twohundredBtn
            text:"200元"
            height:tenBtn.height
            width:tenBtn.width
        }
        
        BorderButton{
            id:threehundredBtn
            text:"300元"
            height:tenBtn.height
            width:tenBtn.width
        }
        
        BorderButton{
            id:fivehundredBtn
            text:"500元"
            height:tenBtn.height
            width:tenBtn.width
        }
        
        BorderButton{
            id:thousandBtn
            text:"1000元"
            height:tenBtn.height
            width:tenBtn.width
        }
    }
    
    Rectangle{
        id:actually
        height: 40
        color: "#00ffffff"
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.top: flowLayout.bottom
        anchors.topMargin: 0
        border.color: "#CCCCCC"
        border.width: 1
        
        CText{
            id:actuallyText
            text:"实付金额:"
            anchors.left: parent.left
            anchors.leftMargin: 10
            anchors.verticalCenter: parent.verticalCenter
        }
        
        CText{
            id:payText
            text: "0"
            anchors.left: actuallyText.right
            anchors.leftMargin: 5
            anchors.verticalCenter: parent.verticalCenter
        }
        
        CButton{
            id:flagBtn
            width: 70
            height: 30
            text: "负充"
            anchors.right: parent.right
            anchors.rightMargin: 10
            anchors.verticalCenter: parent.verticalCenter
            text_color: "#FFFFFF"
            pressedColor:"#169BD5"
            exitedColor: "#169BD5"
            borderWidth:0
            onClicked: {
                increase = !increase
            }
        }
    }
    
    Rectangle{
        id:giveAwayLayout
        height: 40
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.top: actually.bottom
        anchors.topMargin: 0
        color: "#00000000"
        border.color: "#CCCCCC"
        border.width: 1
        CText{
            id:giveAwayText
            text:"赠送余额:"
            anchors.left: parent.left
            anchors.leftMargin: 10
            anchors.verticalCenter: parent.verticalCenter
        }
        CText{
            text:"0"
            anchors.left: giveAwayText.right
            anchors.leftMargin: 5
            anchors.verticalCenter: parent.verticalCenter
        }
    }
    
    ButtonGroup{
        buttons: bottomRect.children
    }
    
    Item{
        id:bottomRect
        anchors.top: giveAwayLayout.bottom
        anchors.topMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.right: parent.right
        anchors.rightMargin: 0
        height:cashBtn.width / 1.5
        
        BorderButton{
            id:cashBtn
            text:"现金"
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 10
            anchors.top: parent.top
            anchors.topMargin: 5
            anchors.left: parent.left
            anchors.leftMargin: 9
            width:bottomRect.width / 3 - 12
            color:"#CCCCCC"
            checked: true
        }
        
        BorderButton{
            id:aliBtn
            text:"支付宝"
            anchors.top: parent.top
            anchors.topMargin: 5
            anchors.left: cashBtn.right
            anchors.leftMargin: 9
            height:cashBtn.height
            width:cashBtn.width
            color:"#CCCCCC"
        }
        
        BorderButton{
            id:wcBtn
            text:"微信"
            anchors.top: parent.top
            anchors.topMargin: 5
            anchors.left: aliBtn.right
            anchors.leftMargin: 9
            height:cashBtn.height
            width:cashBtn.width
            color:"#CCCCCC"
        } 

    }
    
    CButton{
        id:confirmBtn
        height: 30
        anchors.left: parent.left
        anchors.leftMargin: 9
        anchors.right: parent.right
        anchors.rightMargin: 9
        text_color: "#FFFFFF"
        pressedColor:"#169BD5"
        exitedColor: "#169BD5"
        borderWidth:0
        text:"确认充值"
        anchors.top: bottomRect.bottom
        anchors.topMargin: 10
    }
}
