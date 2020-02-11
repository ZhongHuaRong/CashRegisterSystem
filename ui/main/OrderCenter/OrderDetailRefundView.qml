import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12
import "../../core"

Rectangle {
    id:refundView
    border.width: 1
    border.color: "#CCCCCC"
    
    property real maxAmount: 0
    
    function getRet(){
        return Number(calculator.retNumText)
    }
    
    Item{
        id:header
        anchors.top: parent.top
        anchors.topMargin: 10
        anchors.right: parent.right
        anchors.rightMargin: 10
        anchors.left: parent.left
        anchors.leftMargin: 10
        height:40
        CText{
            id:accountText
            text:"操作人:"
            anchors.left: parent.left
            anchors.leftMargin: 10
            anchors.verticalCenter: parent.verticalCenter
        }
        CText{
            id:accountID
            text:GlobalVar.$accountID
            anchors.left: accountText.right
            anchors.leftMargin: 10
            anchors.verticalCenter: parent.verticalCenter
        }
        
        CText{
            id:amountText
            text:"最大退款金额:"
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: accountText.right
            anchors.leftMargin: 50
        }
        CText{
            id:maxamount
            text:maxAmount.toString() + "元"
            anchors.left: amountText.right
            anchors.leftMargin: 10
            anchors.verticalCenter: parent.verticalCenter
        }
    }
    
    Calculator{
        id:calculator
        anchors.top: header.bottom
        anchors.topMargin: 10
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.right: parent.right
        anchors.rightMargin: 10
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 10
        maxNum: maxAmount
    }
    
}
