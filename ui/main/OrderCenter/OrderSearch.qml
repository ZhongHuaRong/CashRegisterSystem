import QtQuick 2.12
import "../../core"

Item {
    id: element
    
    signal searchFromDate(var firstDate,var secondDate,var flag,int count,int pageNum)
    signal searchFromID(var id)
    signal searchOrderDetail(var id,var isRefund)
    
    function set_model_data(list){
        tableView.setData(list[0]["totalOrder"],list[0]["totalPage"],list[0]["currentPage"],list)
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
            
            DateIntervalSelectButton {
                id:datebtn
                implicitWidth: 150
                height:30
                anchors.verticalCenter: parent.verticalCenter
            }
            
            CComboBox{
                id:states
                implicitWidth: 90
                height: datebtn.height
                anchors.verticalCenter: parent.verticalCenter
                model:ListModel{
                    ListElement{
                        text:"全部"
                    }
                    ListElement{
                        text:"未支付"
                    }
                    ListElement{
                        text:"已支付"
                    }
                    ListElement{
                        text:"已退款"
                    }
                }
            }
            
            CButton{
                id:searchbtn
                text: "搜索"
                text_color: "#FFFFFF"
                anchors.verticalCenter: parent.verticalCenter
                pressedColor:"#169BD5"
                exitedColor: "#169BD5"
                unClickedColor: "#169BD5"
                enteredColor: "#169BD5"
                borderWidth:0
                height: datebtn.height
                width: 70
                onClicked: 
                    element.searchFromDate(datebtn.firstDate,datebtn.secondDate,
                                           states.currentText,
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
            preset_text:"搜索 订单号"
            width:{
                if(rectangle.width - row.width > 320)
                    return 300
                else
                    return rectangle.width - row.width - 20
            }
            onAccepted: element.searchFromID(searchIDText.text)
        }
        
    }
    
    OrderTableView{
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
        onOrderDetail: element.searchOrderDetail(id,false)
        onOrderRefund: element.searchOrderDetail(id,true)
    }
}
