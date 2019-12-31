import QtQuick 2.12
import QtQuick.Controls 2.5
import "../core"
import "./CheckoutCounter"
import "./OrderCenter"

Rectangle {
    id:rect
    color: "#F4F4F4"
    
    property var labelList: [0]
    property var labelButtonCom: Qt.createComponent("qrc:/ui/core/LabelButton.qml")
    property var checkoutCom: Qt.createComponent("qrc:/ui/main/CheckoutCounter/CheckoutCounter.qml")
    property var orderCom: Qt.createComponent("qrc:/ui/main/OrderCenter/OrderCenter.qml")
    signal connect_electronic_scale()
    signal itemChanged(int index)
    
    function set_current_view(index,labelName){
        for(var n = 0;n < labelList.length;++n){
            if(index == labelList[n]){
                bar.currentIndex = n
                return
            }
        }
        var i = labelButtonCom.createObject(bar,{
                                           "font.family":GlobalVar.$settings.font_family,
                                           "font.pixelSize":GlobalVar.$settings.font_pixel,
                                           "text":labelName,
                                           "width":mainbtn.width,
                                           "height":mainbtn.height
                                       })
        i.close.connect(rect.remove_label)
        add_view(labelName)
        labelList.push(index)
        bar.currentIndex = labelList.length - 1

    }
    
    function add_view(name){
        switch(name){
        case "订单中心":
            var page = orderCom.createObject(swipeView)
            page.titleChanged.connect(rect.set_current_tab_text)
            break
        case "会员中心":
        case "交接班":
        case "设置":
        default:
            checkoutCom.createObject(swipeView,{
                                         text:name
                                     })
        }
    }
    
    function remove_label(item){
        //移除标签，同时换页和移除页面
        var i = 0
        for(;i < bar.count;++i){
            if(bar.itemAt(i) === item){
                break
            }
        }
        if(i == bar.count)
            return
        list_erase(labelList,i)
        bar.removeItem(item)
        delete swipeView.takeItem(i)
    }
    
    function list_erase(list,index){
        if(index === list.length - 1){
            list.pop()
            return
        }

        var _list = []
        for(var i = list.length - 1;i > index;i--){
            _list.push(list[i])
            list.pop()
        }
        //移除index项
        list.pop()
        
        for(i = _list.length - 1;i >= 0;i--){
            list.push(_list[i])
            _list.pop()
        }
        
    }
    
    function set_current_tab_text(str){
        bar.currentItem.text = str
    }
    
    Rectangle{
        id: row
        height: 54
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.top: parent.top
        anchors.topMargin: 0
        color: "#FFFFFF"
        Row {
            anchors.fill: parent
            anchors.rightMargin: 20
            spacing:10
            layoutDirection: Qt.RightToLeft
    
            CButton {
                id:exit_btn
                text:"退出"
                anchors.verticalCenter: parent.verticalCenter
                exitedColor:"#2DB7F5"
                enteredColor: "#5ECDB9"
                pressedColor:"#5ECDB9"
                text_color: "#FFFFFF"
                font_family: GlobalVar.$settings.font_family
                font_pixel: GlobalVar.$settings.font_pixel
                onClicked: Qt.quit()
            }  
            
            CButton {
                id:connect
                text:"未连接 连称"
                anchors.verticalCenter: parent.verticalCenter
                exitedColor:"#F33F2B"
                enteredColor: "#5ECDB9"
                pressedColor:"#5ECDB9"
                text_color: "#FFFFFF"
                font_family: GlobalVar.$settings.font_family
                font_pixel: GlobalVar.$settings.font_pixel
                onClicked: rect.connect_electronic_scale()
            }
            
            Text {
                id:name
                text:GlobalVar.$settings.account_name
                anchors.verticalCenter: parent.verticalCenter
                font.family:  GlobalVar.$settings.font_family
                font.pixelSize: GlobalVar.$settings.font_pixel
                color: "#666666"
            }
            
            ClockText {
                id:clock
                text:GlobalVar.$settings.account_name
                anchors.verticalCenter: parent.verticalCenter
                font.family:  GlobalVar.$settings.font_family
                font.pixelSize: GlobalVar.$settings.font_pixel
                color: "#666666"
            }
        }
    }
    
    
    Rectangle{
        id:line
        height:1
        color: "#E9E9E9"
        anchors.top: row.bottom
        anchors.topMargin: 0
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
    }
    
    Rectangle{
        id:barrect
        height:40
        color: "#FFFFFF"            
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.top: line.bottom
        anchors.topMargin: 0
        
        TabBar{
            id:bar
            wheelEnabled: true
            spacing: 0
            clip: true
            anchors.fill: parent
            anchors.topMargin: 5
    
            onCurrentIndexChanged: {
                if(currentIndex > labelList.length)
                    return
                rect.itemChanged(labelList[currentIndex])
            }
            
            LabelButton {
                id:mainbtn
                width: 120
                height:30
                text: qsTr("收银台")
                font.family:  GlobalVar.$settings.font_family
                font.pixelSize: GlobalVar.$settings.font_pixel
                show_icon: false
            }
        }
    }
    
    SwipeView {
        id: swipeView
        anchors.top: barrect.bottom
        anchors.topMargin:10
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 10
        anchors.left: parent.left
        anchors.leftMargin: 5
        anchors.right: parent.right
        anchors.rightMargin: 5
        interactive:false
        clip: true
        currentIndex: bar.currentIndex
        
        CheckoutCounter {
            id: firstPage
        }
    }
    
}
