import QtQuick 2.12
import QtQuick.Controls 2.5
import "../core"

Rectangle {
    id:menubar
    
    color: "#2E2F30"
    
    signal itemChanged(int index,string label_name)
    
    Component.onCompleted: {
        view.currentItem.checked = true
    }
    
    function set_current_index(index){
        view.currentIndex = index
        view.currentItem.checked = true
    }
    
    CButton {
        id:title
        canClicked: false
        text: "收银台"
        height:30
        anchors.right: parent.right
        anchors.rightMargin: 10
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.top: parent.top
        anchors.topMargin: 12
        unClickedColor:"#979797"
        text_color: "#FFFFFF"
    }
    
    ListModel{
        id:list_model
        
        ListElement {
            name: "收银台"
        }
        ListElement {
            name: "订单中心"
        }
        ListElement {
            name: "会员中心"
        }
        ListElement {
            name: "交接班"
        }
        ListElement {
            name: "设置"
        }
    }
    
    ListView{
        id: view
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 12
        anchors.top: title.bottom
        anchors.topMargin: 12
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
        model:list_model
        clip: true
        
        delegate:ItemDelegate {
            id: itemDelegate
            text:name
            width:view.width
            height:40
            checkable: true
            autoExclusive: true
            background: Rectangle{
                color: {
                    if(itemDelegate.checked == true)
                        return "#2DB7F5"
                    else 
                        return "#00000000"
                }
            }
            contentItem: Item{
                Image {
                    id:icon
                    source:"qrc:/image/button_icon.png"
                    anchors.left: parent.left
                    anchors.leftMargin: 5
                    anchors.verticalCenter: parent.verticalCenter
                }
                
                CText{
                    id:txt
                    text:itemDelegate.text
                    anchors.left: icon.right
                    anchors.leftMargin: 10
                    anchors.verticalCenter: parent.verticalCenter
                    color:{
                        if(itemDelegate.checked == true)
                            return "#FFFFFF"
                        else 
                            return "#878787"
                    }
                }
            }
            
            onClicked: {
                menubar.itemChanged(index,name)
                view.currentIndex = index
            }
        }
    }
    
    
}
