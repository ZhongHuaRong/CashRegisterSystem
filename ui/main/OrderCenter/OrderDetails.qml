import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12
import "../../core"

Rectangle {
    id:detail
    color: "#FFFFFF"
    
    signal close()
    signal refund()
    signal printReceipt()
    
    function setDetailLabel(data){
        //        QList<QVariant> list;
        //        QMap<QString,QVariant> map;
        //        map["name"] = "新疆红枣";
        //        map["price"] = "22";
        //        map["count"] = "1";
        //        map["unit"] = "包";
        //        list.append(map);
        //        map.clear();
        //        map["name"] = "椰青";
        //        map["price"] = "11.00";
        //        map["dis"] = "1.00";
        //        map["count"] = "1";
        //        map["unit"] = "件";
        //        list.append(map);
        //        item["list"] = list;
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
    }
    
    RowLayout{
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
            Layout.fillWidth:true
            Layout.fillHeight: true
        }
        
        SwipeView{
            id:swipeView
            Layout.fillWidth:true
            Layout.fillHeight: true
            
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
            text: "关闭"
            text_color: "#333333"
            pressedColor:"#FFFFFF"
            exitedColor: "#FFFFFF"
            borderWidth:1
            onClicked: detail.close()
            Layout.alignment:Qt.AlignVCenter | Qt.AlignRight
        }
        
        CButton {
            id:refundBtn
            height: closeBtn.height
            width:closeBtn.width
            text: "退款"
            text_color: "#FFFFFF"
            pressedColor:"#D1514D"
            exitedColor: "#D1514D"
            borderWidth:0
            onClicked: detail.refund()
            Layout.alignment:Qt.AlignVCenter | Qt.AlignHCenter
        }
        
        CButton {
            id:printBtn
            height: closeBtn.height
            width:closeBtn.width
            text: "打印小票"
            text_color: "#FFFFFF"
            pressedColor:"#169BD5"
            exitedColor: "#169BD5"
            borderWidth:0
            onClicked: detail.print()
            Layout.alignment:Qt.AlignVCenter | Qt.AlignLeft
        }
    }
}
