import QtQuick 2.12
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.12
import "../View"
import "../../core"

Item {
    id:view
    
    property string headerText: {
        if(isRecharge)
            return "充值记录"
        else
            return "购买记录"
    }

    property bool isRecharge: false
    property var id: ""
    
    signal gotoPage(var page)
    signal close()
    
    function setData(isRecharge,data){
        view.id = data[0]["id"]
        bottomRect.totalNumText = data[0]["totalOrder"]
        bottomRect.pageNumText = data[0]["totalPage"]
        bottomRect.curPageText = data[0]["currentPage"]
        
        tableView.model.clear()
        if(isRecharge != view.isRecharge){
            view.isRecharge = isRecharge
            
            if(view.isRecharge){
                first.visible = false
                second.title = "充值账号"
                third.title = "充值金额"
                fourth.title = "充值时间"
            } else {
                first.visible = true
                second.title = "订单总额"
                third.title = "实收金额"
                fourth.title = "支付时间"
            }
        }
        
        if(view.isRecharge){
            for(var i = 1;i < data.length;i++){
                tableView.model.append({
                                     "num":data[i]["num"],
                                     "count":"0",
                                     "total":data[i]["account"],
                                     "amount":data[i]["rechargeAmount"],
                                     "time":data[i]["rechargeTime"],
                                     "state":data[i]["state"]
                                 })
            }
        } else {
            for(var i = 1;i < data.length;i++){
                tableView.model.append({
                                     "num":data[i]["num"],
                                     "count":data[i]["count"],
                                     "total":data[i]["total"],
                                     "amount":data[i]["actualAmount"],
                                     "time":data[i]["payTime"],
                                     "state":data[i]["state"]
                                 })
            }
        }
    }
    
    Item {
        id: element
        height: 40
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.top: parent.top
        anchors.topMargin: 0
        
        CText{
            text: headerText
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
        }
        
        CButton{
            id:closeBtn
            text_color: "#FFFFFF"
            pressedColor:"#169BD5"
            exitedColor: "#169BD5"
            unClickedColor: "#169BD5"
            enteredColor: "#169BD5"
            text: "关闭"
            height:30
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right
            anchors.rightMargin: 10
            onClicked: close()
        }
    }
    
    CTableView {
        id:tableView
        anchors.bottom: bottomRect.top
        anchors.bottomMargin: 5
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.top: element.bottom
        anchors.topMargin: 0
        
        
        TableViewColumn {
            id: num
            title: "订单号"
            role: "num"
        }
        TableViewColumn {
            id: first
            title: "商品数量"
            role: "count"
        }
        TableViewColumn {
            id: second
            title: "订单总额"
            role: "total"
        }
        TableViewColumn {
            id: third
            title: "实收金额"
            role: "amount"
        }
        TableViewColumn {
            id: fourth
            title: "支付时间"
            role: "time"
        }
        TableViewColumn {
            id: fifth
            title: "状态"
            role: "state"
        }
    
        itemDelegate: CText {
            anchors.fill: parent
            text:styleData.value
            color: "#445266"
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment:Text.AlignHCenter
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
        onGotoPage: view.gotoPage(page)
    }
}
