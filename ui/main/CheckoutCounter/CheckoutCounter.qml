import QtQuick 2.12
import QtQuick.Controls 2.5
import "../../core"
import "../Dialog"

Rectangle {
    id: page
    color:"#00000000"
    
    signal commodityEdit()
    
    property var dialogList: ["qrc:/ui/main/Dialog/MemberSearchDialog.qml"]
    
    function openDialog(index){
        dialogLoader.source = dialogList[index]
        dialogLoader.item.show()
        dialogLoader.item.closing.connect(page.dialogClosing)
        switch(index){
        case 0:
            dialogLoader.item.searchMember.connect()
            dialogLoader.item.insertMember.connect()
        }
    }
    
    function dialogClosing(){
    }
    
    function getData(data){
        console.debug(data)
    }
    
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
        onClicked: openDialog(0)
    }
    
    SettlementLabelRect{
        id:settlementLabelRect
        width:listView.width
        height:150
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 10
        count: "共" + GlobalVar.$commodityList.length.toFixed(2) + "条"
        totalGold: GlobalVar.$totalGold.toFixed(2)
        discount: GlobalVar.$discount.toFixed(2)
        payable: (GlobalVar.$totalGold - GlobalVar.$discount).toFixed(2)
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
    
    Flow{
        id:mainFlow
        anchors.bottom: weightRect.top
        anchors.bottomMargin: 10
        anchors.right: parent.right
        anchors.rightMargin: 10
        anchors.left: listView.right
        anchors.leftMargin: 10
        anchors.top: searchItem.bottom
        anchors.topMargin: 10
    }
    
    Rectangle{
        id:weightRect
        border.width: 1
        border.color: "#CCCCCC"
        color: "#00000000"
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 10
        anchors.right: parent.right
        anchors.rightMargin: 10
        anchors.left: settlementLabelRect.right
        anchors.leftMargin: 10
        height:settlementLabelRect.height
        
        CText{
            id:weightText
            font.pixelSize: GlobalVar.$settings.font_pixel + 8
            font.bold: true
            color: "#000000"
            text: "净重: " + GlobalVar.$netWeight.toFixed(2) + " kg"
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
        }
    }
    
    Loader{
        id:dialogLoader
    }
}
