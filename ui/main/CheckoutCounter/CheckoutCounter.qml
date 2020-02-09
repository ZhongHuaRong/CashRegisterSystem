import QtQuick 2.12
import QtQuick.Controls 2.5
import "../../core"

Rectangle {
    id: page
    color:"#00000000"
    
    signal commodityEdit()
    
    CommodityListView{
        id:listView
        width: 400
        anchors.bottom: memberCheckButton.top
        anchors.bottomMargin: 10
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.top: parent.top
        anchors.topMargin: 10
        
        onZeroing: {
            
        }
        
        onPeeled: {
            
        }
        
        onOrder: {
            
        }
        
        onClear: {
            
        }
    }
    
    CButton{
        id:memberCheckButton
        width:listView.width
        height:40
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.bottom: settlementLabelRect.top
        anchors.bottomMargin: 10
        text_color: "#333333"
        pressedColor:"#FFFFFF"
        exitedColor: "#FFFFFF"
        borderWidth:1
        text: "会员查询"
    }
    
    SettlementLabelRect{
        id:settlementLabelRect
        width:listView.width
        height:150
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 10
        count: "共" + GlobalVar.$commodityList.length.toString() + "条"
        totalGold: GlobalVar.$totalGold.toString()
        discount: GlobalVar.$discount.toString()
        payable: (GlobalVar.$totalGold - GlobalVar.$discount).toString()
    }
    
    Item{
        id:searchItem
        height: 40
        anchors.right: parent.right
        anchors.rightMargin: 10
        anchors.left: listView.right
        anchors.leftMargin: 10
        anchors.top: parent.top
        anchors.topMargin: 0
        
        CTextEdit{
            id:searchTextEdit
            anchors.right: searchBtn.left
            anchors.rightMargin: 5
            anchors.left: parent.left
            anchors.leftMargin: 0
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 0
            anchors.top: parent.top
            anchors.topMargin: 0
            preset_text:"搜索 名称/缩写/条码"
            radius: 100
        }
        
        CButton{
            id:searchBtn
            width: 100
            radius: 5
            text: "商品编辑"
            anchors.right: parent.right
            anchors.rightMargin: 0
            anchors.top: parent.top
            anchors.topMargin: 0
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 0
            text_color: "#FFFFFF"
            pressedColor:"#169BD5"
            exitedColor: "#169BD5"
            borderWidth:0
            font_bold:true
            onClicked: page.commodityEdit()
        }
    }
}
