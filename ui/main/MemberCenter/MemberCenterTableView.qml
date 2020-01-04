import QtQuick.Controls 1.4
import QtQuick 2.0
import "../../core"
import "../View/"

Rectangle{
    id: rectangle
    
    property real columnWidth: (rectangle.width - 180)/ 8.0
    
    signal gotoPage(var page)
    signal recharge(var id)
    signal check(var id)
    
    function setData(orderTotal,pageTotal,cur_page,list){
        bottomRect.totalNumText = orderTotal
        bottomRect.pageNumText = pageTotal
        bottomRect.curPageText = cur_page
        view.model.clear()
        for(var i = 1;i < list.length;i++){
            view.model.append({
                                 "num":list[i]["num"],
                                 "integral":list[i]["integral"],
                                 "balance":list[i]["balance"],
                                 "count":list[i]["count"],
                                 "registrationTime":list[i]["registrationTime"],
                                 "expireDate":list[i]["expireDate"],
                                 "level":list[i]["level"],
                                 "state":list[i]["state"],
                                 "name":list[i]["name"],
                                 "remark":list[i]["remark"],
                                 "button":list[i]["state"] === "冻结"
                             })
        }
    }

    function checkMember(row){
        check(view.model.get(row))
    }
    
    function memberRecharge(row){
        recharge(view.model.get(row)["num"])
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
            title: "电话号码"
            role: "num"
            width: columnWidth
        }
        TableViewColumn {
            title: "积分"
            role: "integral"
            width: columnWidth
        }
        TableViewColumn {
            title: "余额"
            role: "balance"
            width: columnWidth
        }
        TableViewColumn {
            title: "订单数量"
            role: "count"
            width: columnWidth
        }
        TableViewColumn {
            title: "注册时间"
            role: "registrationTime"
            width: columnWidth
        }
        TableViewColumn {
            title: "到期时间"
            role: "expireDate"
            width: columnWidth
        }
        TableViewColumn {
            title: "等级"
            role: "level"
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
            firstBtnText: "充值"
            secondBtnText: "查看"
            onFirstBtnClick: memberRecharge(styleData.row);
            onSecondBtnClick: checkMember(styleData.row)
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
        totalText: "会员总数"
        onGotoPage: rectangle.gotoPage(page)
    }
}
