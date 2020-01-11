import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12
import "../../core"

Rectangle {
    id:detail
    color: "#FFFFFF"
    
    signal change2Recording(var isRecharge,var id)
    signal close()
    signal searchFromID(var id)
    
    function setDetailLabel(isRecharge,data){
        if(isRecharge === false)
            change2Edit()
        else
            change2Recharge()
        
        labelView.setData(data["level"],data["name"],
                          data["num"],data["expireDate"],
                          data["balance"],data["remark"])
    }
    
    function get_current_index(){
        return swipeView.currentIndex
    }
    
    function change2Edit(){
        rechargeBtn.enabled = true
        rechargeBtn.checked = false
        editBtn.checked = true
        editBtn.enabled = false
        swipeView.currentIndex = 0
    }
    
    function change2Recharge(){
        editBtn.enabled = true
        editBtn.checked = false
        rechargeBtn.checked = true
        rechargeBtn.enabled = false
        swipeView.currentIndex = 1
    }
    
    Item {
        id: swipeItem
        width:detail.width /2 - 15
        anchors.top: parent.top
        anchors.topMargin: 10
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 10
        anchors.left: parent.left
        anchors.leftMargin: 10
        
        Item{
            id: element
            height: 40
            anchors.right: parent.right
            anchors.rightMargin: 0
            anchors.left: parent.left
            anchors.leftMargin: 0
            anchors.top: parent.top
            anchors.topMargin: 0
            
            UnderlineButton {
                id:editBtn
                width: element.width / 2
                height:30
                text: qsTr("编辑")
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.leftMargin: 0
                Layout.fillWidth: true
                enabled: !checked
                checked:true
                onClicked: change2Edit()
            }
            
            UnderlineButton {
                id:rechargeBtn
                height:30
                text: qsTr("充值")
                anchors.left: editBtn.right
                anchors.leftMargin: 0
                anchors.right: parent.right
                anchors.rightMargin: 0
                anchors.verticalCenter: parent.verticalCenter
                onClicked: change2Recharge()
            }
        }
        
        
        SwipeView{
            id:swipeView
            anchors.top: element.bottom
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            anchors.topMargin: 2
            currentIndex: 0
            interactive: false
            clip: true
            
            background:Rectangle{
                color: "#FFFFFF"
                border.width: 1
                border.color: "#CCCCCC"
                radius: 5
            }
            
            MemberDetailLabelView{
                id:labelView
                
                onChange2Recording: {
                    detail.change2Recording(isRecharge,id)
                }
            }
            
            MemberRechargeView{
                id:rechargeView
            }
        }
    }
    
    Rectangle{
        id:line
        width: 2
        anchors.left: swipeItem.right
        anchors.leftMargin: 5
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 10
        anchors.top: parent.top
        anchors.topMargin: 10
        border.width: 1
        border.color: "#CCCCCC"
    }
    
    MemberDetailInput{
        id:phoneInput
        width: swipeItem.width
        anchors.top: parent.top
        anchors.topMargin: 10
        anchors.right: parent.right
        anchors.rightMargin: 10
        height: {
            if(swipeItem.width > swipeItem.height){
                return swipeItem.height - bottomLayout.height - bottomLayout.anchors.topMargin - 
                        phoneInput.anchors.topMargin + phoneInput.anchors.topMargin
            } else {
                return 35 + swipeItem.width
            }
        }
    }
    
    RowLayout{
        id:bottomLayout
        width:phoneInput.width
        height: 30
        anchors.top: phoneInput.bottom
        anchors.topMargin: 10
        anchors.right: parent.right
        anchors.rightMargin: 10
        CButton{
            id:closeBtn
            height: 30
            text: "取消"
            Layout.fillWidth: true
            text_color: "#333333"
            pressedColor:"#FFFFFF"
            exitedColor: "#FFFFFF"
            borderWidth:1
            onClicked: detail.close()
        }
        
        CButton {
            id:printBtn
            height: 30
            text:  "查找会员"
            Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
            Layout.fillWidth: true
            text_color: "#FFFFFF"
            pressedColor:"#169BD5"
            exitedColor: "#169BD5"
            borderWidth:0
            onClicked: searchFromID(phoneInput.getRet())
        }
    }
    
}
