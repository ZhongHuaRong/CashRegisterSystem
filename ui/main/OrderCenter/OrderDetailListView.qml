import QtQuick.Controls 1.4
import QtQuick 2.0
import "../../core"
import "../View/"

CTableView {
    id:view
    
    property real columnWidth: (view.width)/ 4.0
    
    function setData(list){
        view.model.clear()
        var name = ""
        var price = ""
        var count = ""
        var total = ""
        for(var i = 0;i < list.length;i++){
            name = (i+1).toString() + "." + list[i]["name"]
            if(list[i]["dis"] === 0){
                price = list[i]["price"]
            } else {
                price = list[i]["price"] + "(-" + list[i]["dis"] + ")"
            }
            count = list[i]["count"] + "(" + list[i]["unit"] + ")"
            total = (Number(list[i]["price"]) - Number(list[i]["dis"])) * Number(list[i]["count"])
            view.model.append({
                                 "name":name,
                                 "price":price,
                                 "count":count,
                                 "total":total
                             })
        }
    }
    
    TableViewColumn {
        title: "商品名"
        role: "name"
        width: columnWidth
    }
    TableViewColumn {
        title: "单价"
        role: "price"
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

    itemDelegate: CText{
        anchors.fill: parent
        anchors.leftMargin: 5
        color: styleData.role !=="total"?"#445266":"#F33F2B"
        horizontalAlignment: styleData.role ==="name"?Text.AlignLeft:Text.AlignHCenter
        verticalAlignment:Text.AlignVCenter
        text:styleData.value
    }
}
