import QtQuick 2.12
import QtQuick.Controls 1.4
import "../../core"
import "../View"

Rectangle {
    id:listView
    border.width: 1
    border.color: "#CCCCCC"
    radius: 2
    
    signal zeroing()
    signal peeled()
    signal order()
    signal clear()
    
    property real columnWidth: (view.width)/ 3.0
    
    function dataClear(){
        view.model.clear()
    }
    
    function push_back(data){
        view.model.append({
                             "name":name,
                             "count":count,
                             "total":total
                         })
    }
    
    CTableView{
        id:view
        anchors.bottom: zeroBtn.top
        anchors.bottomMargin: 0
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.top: parent.top
        anchors.topMargin: 0
        
        TableViewColumn {
            title: "单价"
            role: "name"
            width: columnWidth
        }
        TableViewColumn {
            title: "数量/重量"
            role: "count"
            width: columnWidth
        }
        TableViewColumn {
            title: "小计"
            role: "total"
            width: columnWidth
        }
    
        itemDelegate: delegate
    }
    
    ItemDelegate{
        id:delegate
    }
    
    ListViewButton{
        id:zeroBtn
        height: 50
        width:parent.width / 4 
        text: "归零"
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        onClicked: listView.zeroing()
    }
    
    ListViewButton{
        id:removeBtn
        height: zeroBtn.height
        width:zeroBtn.width
        text: "去皮"
        anchors.left: zeroBtn.right
        anchors.leftMargin: 0
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        onClicked: listView.peeled()
    }
    
    ListViewButton{
        id:orderBtn
        height: zeroBtn.height
        width:zeroBtn.width
        text: "挂单"
        anchors.left: removeBtn.right
        anchors.leftMargin: 0
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        onClicked: listView.order()
    }
    
    ListViewButton{
        id:clearBtn
        height: zeroBtn.height
        width:zeroBtn.width
        text: "清空"
        anchors.left: orderBtn.right
        anchors.leftMargin: 0
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        onClicked: listView.clear()
    }
}
