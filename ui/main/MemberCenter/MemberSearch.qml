import QtQuick 2.12
import QtQuick.Controls 1.4
import "../../core"
import "../View"

Item {
    id: element
    
    signal searchFromDate(var flag,int count,int pageNum)
    signal searchFromID(var id)
    signal change2Check(var isRecharge,var data)
    
    property var columnWidth: (rectangle.width - 180)/ 9.0
    
    function set_model_data(list){
        tableView.setData(list[0]["totalOrder"],list[0]["totalPage"],list[0]["currentPage"],list)
    }
    
    function recharge(data){
        change2Check(true,data)
    }
    
    function check(data){
        change2Check(false,data)
    }
    
    Rectangle{
        id: rectangle
        border.color: "#CCCCCC"
        border.width: 1
        color: "#00000000"
        anchors.right: parent.right
        anchors.rightMargin: 10
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.top: parent.top
        anchors.topMargin: 10
        height: 40
        
        Row{
            id:row
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            anchors.top: parent.top
            spacing: 15
            leftPadding: 10
            
            CComboBox{
                id:states
                implicitWidth: 120
                height: 30
                anchors.verticalCenter: parent.verticalCenter
                model:ListModel{
                    ListElement{
                        text:"全部"
                    }
                    ListElement{
                        text:"普通会员"
                    }
                    ListElement{
                        text:"VIP会员"
                    }
                }
            }
            
            CButton{
                id:searchbtn
                text: "搜索"
                text_color: "#FFFFFF"
                pressedColor:"#169BD5"
                exitedColor: "#169BD5"
                unClickedColor: "#169BD5"
                enteredColor: "#169BD5"
                anchors.verticalCenter: parent.verticalCenter
                borderWidth:0
                height: states.height
                width: 70
                onClicked: 
                    element.searchFromDate(states.currentText,
                                           30,1)
            }
        }
        
        CTextEdit{
            id:searchIDText
            height: 30
            anchors.right: parent.right
            anchors.rightMargin: 10
            anchors.top: parent.top
            anchors.topMargin: 5
            radius: 100
            preset_text:"搜索 手机号"
            width:{
                if(rectangle.width - row.width > 320)
                    return 300
                else
                    return rectangle.width - row.width - 20
            }
            onAccepted: element.searchFromID(searchIDText.text)
        }
        
    }
    
    MemberCenterTableView{
        id:tableView
        anchors.top: rectangle.bottom
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.rightMargin: 10
        anchors.topMargin: 5
        anchors.bottomMargin: 10
        onGotoPage: 
            element.searchFromDate(datebtn.firstDate,datebtn.secondDate,
                                   states.currentText,
                                   30,page)
        onRecharge: element.recharge(data)
        onCheck: element.check(data)
    }
}
