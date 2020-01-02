import QtQuick.Controls 1.4
import QtQuick 2.0
import "../../core"
import "../View/"

Rectangle{
    id: rectangle
    
    property var columnWidth: (rectangle.width - 180)/ 6.0
    
    signal gotoPage(var page)
    signal orderDetail(var id)
    signal orderRefund(var id)
    
    function setData(orderTotal,pageTotal,cur_page,list){
        bottomRect.totalNumText = orderTotal
        bottomRect.pageNumText = pageTotal
        bottomRect.curPageText = cur_page
        view.model.clear()
        for(var i = 1;i < list.length;i++){
            view.model.append({
                                 "num":list[i]["order_num"],
                                 "count":list[i]["count"],
                                 "total":list[i]["order_total"],
                                 "glod":list[i]["gold"],
                                 "time":list[i]["time"],
                                 "state":list[i]["state"],
                                 "button":list[i]["state"] === "已退款"
                             })
        }
    }
    
    function setOrderDetail(data){
        
    }
    
    function checkOrder(row){
        orderDetail(view.model.get(row)["num"])
    }
    
    function refund(row){
        orderRefund(view.model.get(row)["num"])
    }
    
    CTableView {
        id:view
        anchors.bottom: bottomRect.top
        anchors.bottomMargin: 0
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.top: parent.top
        anchors.topMargin: 0
        
        
        TableViewColumn {
            title: "订单号"
            role: "num"
            width: columnWidth
        }
        TableViewColumn {
            title: "商品数量"
            role: "count"
            width: columnWidth
        }
        TableViewColumn {
            title: "订单总额"
            role: "total"
            width: columnWidth
        }
        TableViewColumn {
            title: "实收金额"
            role: "glod"
            width: columnWidth
        }
        TableViewColumn {
            title: "支付时间"
            role: "time"
            width: columnWidth
        }
        TableViewColumn {
            title: "状态"
            role: "state"
            width: columnWidth
        }
        TableViewColumn {
            title: "操作"
            role: "button"
            width: 180
        }
    
        itemDelegate: ItemDelegate{
            anchors.fill:parent
            isText: styleData.role !== "button"
            text: styleData.value
            firstBtnVisible:!styleData.value
            secondBtnVisible:true
            firstBtnText: "退款"
            secondBtnText: "查看"
            onFirstBtnClick: refund(styleData.row);
            onSecondBtnClick: checkOrder(styleData.row)
        }    
    }
    
    PageRect{
        id:bottomRect
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.right: parent.right
        anchors.rightMargin: 0
        onGotoPage: rectangle.gotoPage(page)
    }
}
