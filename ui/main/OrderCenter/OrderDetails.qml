import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12
import "../../core"

Rectangle {
    id:detail
    color: "#FFFFFF"
    
    signal close()
    signal refund(var num)
    signal printReceipt()
    
    function setDetailLabel(data){
        labelView.orderID = data["id"]
        labelView.cashier = data["cashier"]
        labelView.payState = data["state"]
        labelView.category = data["category"]
        labelView.totalAmount = data["totalAmount"]
        labelView.reduceAmount = data["reduceAmount"]
        labelView.discountedGold = data["discountedGold"]
        labelView.amountsPayable = data["amountsPayable"]
        labelView.actualAmount = data["actualAmount"]
        labelView.giveChange = data["giveChange"]
        labelView.paymentMethod = data["paymentMethod"]
        labelView.payTime = data["payTime"]
        labelView.user = data["user"]
        labelView.refund = data["refund"]
        labelView.refundTime = data["refundTime"]
        labelView.memberID = data["memberID"]
        labelView.integral = data["integral"]
        labelView.balance = data["balance"]
        listView.setData(data["list"])
        if(data["isRefund"])
            openRefund()
        else
            closeRefund()
    }
    
    function openRefund(){
        swipeView.currentIndex = 1
        swipeView.currentItem.maxAmount = labelView.amountsPayable
    }
    
    function closeRefund(){
        swipeView.currentIndex = 0
    }
    
    Item{
        id: element
        anchors.right: parent.right
        anchors.rightMargin: 10
        anchors.bottom: layout.top
        anchors.bottomMargin: 10
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.top: parent.top
        anchors.topMargin: 10
        
        
        OrderDetailLabelView{
            id:labelView
            width:detail.width /2 - 15
            anchors.top: parent.top
            anchors.topMargin: 0
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 0
            anchors.left: parent.left
            anchors.leftMargin: 0
            Layout.fillHeight: true
        }
        
        SwipeView{
            id:swipeView
            width: labelView.width
            anchors.top: parent.top
            anchors.topMargin: 0
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 0
            Layout.fillHeight: true
            anchors.right: parent.right
            anchors.rightMargin: 0
            currentIndex: 0
            interactive: false
            clip: true
            
            OrderDetailListView{
                id:listView
            }
            
            OrderDetailRefundView{
                id:refundView
            }
        }
    }

    
    RowLayout{
        id:layout
        height: 40
        anchors.right: parent.right
        anchors.rightMargin: 10
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        
        CButton{
            id:closeBtn
            height: parent.height - 10
            width:110
            text: {
                if(swipeView.currentIndex === 0){
                    return "关闭"
                } else {
                    return "取消"
                }
            }

            text_color: "#333333"
            pressedColor:"#FFFFFF"
            exitedColor: "#FFFFFF"
            borderWidth:1
            onClicked: {
                if(swipeView.currentIndex === 0){
                    detail.close()
                } else {
                    detail.closeRefund()
                }
            }

            Layout.alignment:Qt.AlignVCenter | Qt.AlignRight
        }
        
        CButton {
            id:refundBtn
            height: closeBtn.height
            width:closeBtn.width
            text: {
                if(labelView.payState !== "已退款"){
                    return "退款"
                } else {
                    return "已退款"
                }
            }
            text_color: "#FFFFFF"
            pressedColor:"#D1514D"
            exitedColor: "#D1514D"
            borderWidth:0
            visible: swipeView.currentIndex === 0
            onClicked: detail.openRefund()
            canClicked: labelView.payState !== "已退款"
            Layout.alignment:Qt.AlignVCenter | Qt.AlignHCenter
        }
        
        CButton {
            id:printBtn
            height: closeBtn.height
            width:closeBtn.width
            text:  {
                if(swipeView.currentIndex === 0){
                    return "打印小票"
                } else {
                    return "确认"
                }
            }
            text_color: "#FFFFFF"
            pressedColor:"#169BD5"
            exitedColor: "#169BD5"
            borderWidth:0
            onClicked: {
                if(swipeView.currentIndex === 0){
                    detail.print()
                } else {
                    detail.refund(refundView.getRet())
                }
            }

            Layout.alignment:Qt.AlignVCenter | Qt.AlignLeft
        }
    }
}
