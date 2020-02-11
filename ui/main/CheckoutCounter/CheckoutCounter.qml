import QtQuick 2.12
import QtQuick.Controls 2.5
import "../../core"
import "../Dialog"

Rectangle {
    id: page
    color:"#00000000"
    
    signal change2MemberDetail(var id)
    
    property var dialogList: ["qrc:/ui/main/Dialog/MemberSearchDialog.qml",
                              "qrc:/ui/main/Dialog/SettlementDialog.qml"]
    property int curIndex: -1
    property bool editMode: false
    
    function openDialog(index){
        dialogLoader.source = dialogList[index]
        curIndex = index
        dialogLoader.item.show()
        dialogLoader.item.closing.connect(page.dialogClosing)
        switch(index){
        case 0:
            dialogLoader.item.searchMember.connect(GlobalVar.$event.search_member_from_id)
            GlobalVar.$event.return_member_data.connect(page.search_member_result)
//            dialogLoader.item.insertMember.connect()
            break;
        case 1:
        }
    }
    
    function dialogClosing(){
        switch(curIndex){
        case 0:
            dialogLoader.item.searchMember.disconnect(GlobalVar.$event.search_member_from_id)
            GlobalVar.$event.return_member_data.disconnect(page.search_member_result)
            break
        case 1:
        }
    }
    
    function getData(data){
        console.debug(data)
    }
    
    function search_member_result(data){
        if(data.length == 0){
            dialogLoader.item.searchfailed()
        } else {
            set_member_msg(data[1])
        }
    }
    
    function set_member_msg(data){
        memberCheckButton.name = data["name"]
        memberCheckButton.balance = data["balance"]
        memberCheckButton.integral = data["integral"]
        memberCheckButton.haveMember = true
        dialogLoader.item.close()
    }
    
    Item{
        id:leftItem
        anchors.top: parent.top
        anchors.topMargin: 10
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 10
        anchors.left: parent.left
        anchors.leftMargin: 10
        width:400
        
        CommodityListView{
            id:listView
            anchors.right: parent.right
            anchors.rightMargin: 0
            anchors.bottom: memberCheckButton.top
            anchors.bottomMargin: 10
            anchors.left: parent.left
            anchors.leftMargin: 0
            anchors.top: parent.top
            anchors.topMargin: 0
            
            onZeroing: {
                
            }
            
            onPeeled: {
                
            }
            
            onOrder: {
                
            }
            
            onClear: {
                
            }
        }
        
        MemberButton{
            id:memberCheckButton
            width:listView.width
            height:40
            anchors.left: parent.left
            anchors.leftMargin: 0
            anchors.bottom: settlementLabelRect.top
            anchors.bottomMargin: 10
            onClicked: {
                if(memberCheckButton.haveMember){
                    change2MemberDetail(memberCheckButton.name)
                } else {
                    openDialog(0)
                }
            }
        }
        
        SettlementLabelRect{
            id:settlementLabelRect
            width:listView.width
            height:110
            anchors.left: parent.left
            anchors.leftMargin: 0
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 0
            count: "共" + GlobalVar.$commodityList.length.toFixed(2) + "条"
            totalGold: GlobalVar.$totalGold.toFixed(2)
            discount: GlobalVar.$discount.toFixed(2)
            payable: (GlobalVar.$totalGold - GlobalVar.$discount).toFixed(2)
            onClicked: openDialog(1)
        }
        
        Rectangle{
            id:maskRect
            anchors.fill: parent 
            visible: editMode
            border.width: 0
            color: "#000000"
            opacity: 0.5
            
            MouseArea{
                anchors.fill: parent 
                onClicked: editMode = !editMode
            }
        }
        
        CText{
            anchors.fill: parent 
            visible: editMode
            text: "退出编辑模式"
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.bold: true
            font.pixelSize: GlobalVar.$settings.font_pixel * 2
            color: "#ffffff"
        }
    }
    
    Item{
        id:searchItem
        height: 40
        anchors.right: parent.right
        anchors.rightMargin: 10
        anchors.left: leftItem.right
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
            text: {
                if(editMode)
                    return "退出编辑"
                else
                    return "商品编辑"
            }
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
            onClicked: {
                editMode = !editMode
            }
        }
    }
    
    Flow{
        id:mainFlow
        anchors.bottom: weightRect.top
        anchors.bottomMargin: 10
        anchors.right: parent.right
        anchors.rightMargin: 10
        anchors.left: leftItem.right
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
        anchors.left: leftItem.right
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
