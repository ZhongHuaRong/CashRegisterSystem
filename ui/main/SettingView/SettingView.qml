import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12
import "../../core"

Item {
    id: settingView

    function addImage(list){
        console.debug(list.length)
        console.debug(list[0])
    }

    function gotoItem(item){
//        scrollView.flickableItem.flick(0,-item.y)
        if(viewLayout.height < item.y + scrollView.height)
            scrollView.flickableItem.contentY = viewLayout.height - scrollView.height
        else
            scrollView.flickableItem.contentY = item.y
    }

    
    Rectangle{
        id:contentRect
        color: "#FFFFFF"
        anchors.bottom: bottomRect.top
        anchors.bottomMargin: 5
        anchors.right: parent.right
        anchors.rightMargin: 5
        anchors.left: parent.left
        anchors.leftMargin: 5
        anchors.top: parent.top
        anchors.topMargin: 10
        border.width: 0
        
        ButtonGroup{
            buttons: element.children
        }
        
        RowLayout{
            id: element
            height: 40
            anchors.right: parent.right
            anchors.rightMargin: 5
            anchors.left: parent.left
            anchors.leftMargin: 5
            anchors.top: parent.top
            anchors.topMargin: 0
            spacing:0
            
            UnderlineButton {
                height:30
                text: qsTr("称重设置")
                Layout.fillWidth: true
                checked:true
                onClicked:gotoItem(electronicScaleTitle)
            }
            
            UnderlineButton {
                height:30
                text: qsTr("打印机设置")
                Layout.fillWidth: true
                onClicked:gotoItem(printerTitle)
            }
            
            UnderlineButton {
                height:30
                text: qsTr("广告设置")
                Layout.fillWidth: true
                onClicked:gotoItem(adTitle)
            }
            
            UnderlineButton {
                height:30
                text: qsTr("界面设置")
                Layout.fillWidth: true
                onClicked:gotoItem(viewTitle)
            }
        }
        
        CScrollView{
            id:scrollView
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 0
            anchors.right: parent.right
            anchors.rightMargin: 5
            anchors.left: parent.left
            anchors.leftMargin: 15
            anchors.top: element.bottom
            anchors.topMargin: 10
            
            
            ColumnLayout{
                id:viewLayout
                spacing: 25
                
                CText{
                    id:electronicScaleTitle
                    text: "称重设置"
                }
                
                Rectangle{
                    border.width: 0
                    color: "#CCCCCC"
                    height:1
                    width:300
                }
                
                Item{
                    id: element1
                    height:40
                    
                    CText{
                        id:stateTitle
                        text: "电子秤状态: "
                        anchors.left: parent.left
                        anchors.leftMargin: 0
                        anchors.verticalCenter: parent.verticalCenter
                        font.bold: true
                    }
                    
                    CText{
                        id:stateText
                        text: GlobalVar.$electronicScaleState
                        anchors.topMargin: 5
                        anchors.left: stateTitle.right
                        anchors.leftMargin: 5
                        anchors.verticalCenter: parent.verticalCenter
                        color:"#FF000000"
                    }
                    
                    Button{
                        id:stateBtn
                        text: "重新连接"
                        anchors.left: stateText.right
                        anchors.leftMargin: 15
                        anchors.verticalCenter: parent.verticalCenter
                        height:30
                    }
                }
            
                
                Item{
                    id: element2
                    height:40
                    
                    CText{
                        id: typeTitle
                        text: "电子秤类型: "
                        anchors.left: parent.left
                        anchors.leftMargin: 0
                        anchors.verticalCenter: parent.verticalCenter
                        font.bold: true
                    }
                    
                    CComboBox{
                        id:typeBox
                        width: 129
                        height: 28
                        anchors.topMargin: 5
                        anchors.left: typeTitle.right
                        anchors.leftMargin: 0
                        anchors.verticalCenter: parent.verticalCenter
                    }
                }
                
                
                CText{
                    id:printerTitle
                    text: "打印机设置"
                }
                
                Rectangle{
                    border.width: 0
                    color: "#CCCCCC"
                    height:1
                    width:300
                }
                
                
                Item{
                    id: element3
                    height:40
                    
                    CText{
                        id: receiptTitle
                        text: "小票打印机: "
                        anchors.left: parent.left
                        anchors.leftMargin: 0
                        anchors.verticalCenter: parent.verticalCenter
                        font.bold: true
                    }
                    
                    CComboBox{
                        id:receiptBox
                        width: 129
                        height: 28
                        anchors.topMargin: 5
                        anchors.left: receiptTitle.right
                        anchors.leftMargin: 0
                        anchors.verticalCenter: parent.verticalCenter
                    }
                }
                
                
                Item{
                    id: element4
                    height:40
                    
                    CText{
                        id: labelTitle
                        text: "标签打印机: "
                        anchors.left: parent.left
                        anchors.leftMargin: 0
                        anchors.verticalCenter: parent.verticalCenter
                        font.bold: true
                    }
                    
                    CComboBox{
                        id:labelBox
                        width: 129
                        height: 28
                        anchors.topMargin: 5
                        anchors.left: labelTitle.right
                        anchors.leftMargin: 0
                        anchors.verticalCenter: parent.verticalCenter
                    }
                }
                
                
                CText{
                    id:adTitle
                    text: "广告设置"
                }
                
                Rectangle{
                    border.width: 0
                    color: "#CCCCCC"
                    height:1
                    width:300
                }
                
                CText{
                    id:adimgText
                    text: "客显轮播图设置"
                    font.bold: true
                }

                Flow{
                    id:imageFlow
                }
                
                CText{
                    id:adText
                    text: "广告词设置"
                    font.bold: true
                }

                TitleInput{
                    id:billing_ad_input
                    title: "结算时广告词"
                    height: 40
                    width: 500
                    text:GlobalVar.$settings.billing_ad
                    onEditingFinished: {
                        GlobalVar.$settings.billing_ad = text
                    }
                }

                TitleInput{
                    id:billing_finsh_ad_input
                    title:"结算完成广告词"
                    height: 40
                    width: 500
                    text:GlobalVar.$settings.billing_finsh_ad
                    onEditingFinished: {
                        GlobalVar.$settings.billing_finsh_ad = text
                    }
                }

                TitleInput{
                    id:greeting_input
                    title:"问候广告词"
                    height: 40
                    width: 500
                    text:GlobalVar.$settings.greeting
                    onEditingFinished: {
                        GlobalVar.$settings.greeting = text
                    }
                }
                
                
                CText{
                    id:viewTitle
                    text: "界面设置"
                }
                
                Rectangle{
                    border.width: 0
                    color: "#CCCCCC"
                    height:1
                    width:300
                }
                
                Item{
                    id: element5
                    height:40
                    
                    CText{
                        id: sortTitle
                        text: "商品排序 "
                        anchors.left: parent.left
                        anchors.leftMargin: 0
                        anchors.verticalCenter: parent.verticalCenter
                        font.bold: true
                    }
                    
                    CComboBox{
                        id:sortBox
                        width: 140
                        height: 28
                        anchors.topMargin: 5
                        anchors.left: sortTitle.right
                        anchors.leftMargin: 0
                        anchors.verticalCenter: parent.verticalCenter
                        
                        model:ListModel{
                            ListElement{
                                text:"默认"
                            }
                            ListElement{
                                text:"7日销量降序"
                            }
                            ListElement{
                                text:"7日销量升序"
                            }
                        }
                        
                        currentIndex: GlobalVar.$settings.shop_sort
                        
                        onCurrentIndexChanged: {
                            GlobalVar.$settings.shop_sort = sortBox.currentIndex
                        }
                    }
                    
                    CText{
                        id: iconTitle
                        text: "图标大小 "
                        anchors.left: sortBox.right
                        anchors.leftMargin: 30
                        anchors.verticalCenter: parent.verticalCenter
                        font.bold: true
                    }
                    
                    CComboBox{
                        id:iconBox
                        width: 140
                        height: 28
                        anchors.topMargin: 5
                        anchors.left: iconTitle.right
                        anchors.leftMargin: 0
                        anchors.verticalCenter: parent.verticalCenter
                        
                        model:ListModel{
                            ListElement{
                                text:"小图标"
                            }
                            ListElement{
                                text:"中图标"
                            }
                            ListElement{
                                text:"大图标"
                            }
                        }
                        
                        currentIndex: GlobalVar.$settings.icon_size
                        
                        onCurrentIndexChanged: {
                            GlobalVar.$settings.icon_size = iconBox.currentIndex
                        }
                    }
                    
                    CText{
                        id: wipeTitle
                        text: "默认抹零 "
                        anchors.left: iconBox.right
                        anchors.leftMargin: 30
                        anchors.verticalCenter: parent.verticalCenter
                        font.bold: true
                    }
                    
                    CComboBox{
                        id:wipeBox
                        width: 140
                        height: 28
                        anchors.topMargin: 5
                        anchors.left: wipeTitle.right
                        anchors.leftMargin: 0
                        anchors.verticalCenter: parent.verticalCenter
                        
                        model:ListModel{
                            ListElement{
                                text:"不抹零"
                            }
                            ListElement{
                                text:"抹掉分"
                            }
                            ListElement{
                                text:"抹掉角"
                            }
                        }
                        
                        currentIndex: GlobalVar.$settings.remove_decimal
                        
                        onCurrentIndexChanged: {
                            GlobalVar.$settings.remove_decimal = wipeBox.currentIndex
                        }
                    }
                }
                
                Item{
                    id: element6
                    height:40
                    
                    CText{
                        id: ruleTitle
                        text: "抹零规则 "
                        anchors.left: parent.left
                        anchors.leftMargin: 0
                        anchors.verticalCenter: parent.verticalCenter
                        font.bold: true
                    }
                    
                    CComboBox{
                        id:ruleBox
                        width: 140
                        height: 28
                        anchors.topMargin: 5
                        anchors.left: ruleTitle.right
                        anchors.leftMargin: 0
                        anchors.verticalCenter: parent.verticalCenter
                        
                        model:ListModel{
                            ListElement{
                                text:"四舍五入"
                            }
                            ListElement{
                                text:"直接抹零"
                            }
                        }
                        
                        currentIndex: GlobalVar.$settings.remove_decimal_rule
                        
                        onCurrentIndexChanged: {
                            GlobalVar.$settings.remove_decimal_rule = ruleBox.currentIndex
                        }
                    }
                    
                    CText{
                        id: receiptFontSizeTitle
                        text: "小票文字大小 "
                        anchors.left: ruleBox.right
                        anchors.leftMargin: 30
                        anchors.verticalCenter: parent.verticalCenter
                        font.bold: true
                    }
                    
                    CComboBox{
                        id:receiptFontSizeBox
                        width: 140
                        height: 28
                        anchors.topMargin: 5
                        anchors.left: receiptFontSizeTitle.right
                        anchors.leftMargin: 0
                        anchors.verticalCenter: parent.verticalCenter
                        
                        model:ListModel{
                            ListElement{
                                text:"12"
                            }
                            ListElement{
                                text:"14"
                            }
                            ListElement{
                                text:"16"
                            }
                        }
                        
                        currentIndex: GlobalVar.$settings.receipt_font_size_index
                        
                        onCurrentIndexChanged: {
                            GlobalVar.$settings.receipt_font_size_index = receiptFontSizeBox.currentIndex
                        }
                    }
                    
                    CText{
                        id: labelFontSizeTitle
                        text: "标签文字大小 "
                        anchors.left: receiptFontSizeBox.right
                        anchors.leftMargin: 30
                        anchors.verticalCenter: parent.verticalCenter
                        font.bold: true
                    }
                    
                    CComboBox{
                        id:labelFontSizeBox
                        width: 140
                        height: 28
                        anchors.topMargin: 5
                        anchors.left: labelFontSizeTitle.right
                        anchors.leftMargin: 0
                        anchors.verticalCenter: parent.verticalCenter
                        
                        model:ListModel{
                            ListElement{
                                text:"12"
                            }
                            ListElement{
                                text:"14"
                            }
                            ListElement{
                                text:"16"
                            }
                        }
                        
                        currentIndex: GlobalVar.$settings.label_font_size_index
                        
                        onCurrentIndexChanged: {
                            GlobalVar.$settings.label_font_size_index = labelFontSizeBox.currentIndex
                        }
                    }
                }
                
                CText{
                    text: "支付方式设置 "
                    font.bold: true
                }
                
                Item{
                    id: element7
                    height:40

                    CText{
                        id: alipayTitle
                        text: "支付宝: "
                        anchors.left: parent.left
                        anchors.leftMargin: 0
                        anchors.verticalCenter: parent.verticalCenter
                        font.bold: true
                    }

                    Switch{
                        id:alipaySwitch
                        width: 129
                        height: alipayTitle.height
                        text:{
                            checked?"打开":"关闭"
                        }
                        checked: GlobalVar.$settings.alipay
                        onCheckedChanged: {
                            GlobalVar.$settings.alipay = alipaySwitch.checked
                        }
                        anchors.topMargin: 5
                        anchors.left: alipayTitle.right
                        anchors.leftMargin: 0
                        anchors.verticalCenter: parent.verticalCenter
                    }

                    CText{
                        id: wcpayTitle
                        text: "微信支付: "
                        anchors.left: alipaySwitch.right
                        anchors.leftMargin: 100
                        anchors.verticalCenter: parent.verticalCenter
                        font.bold: true
                    }

                    Switch{
                        id:wcpaySwitch
                        width: 129
                        height: alipayTitle.height
                        text:{
                            checked?"打开":"关闭"
                        }
                        checked: GlobalVar.$settings.wxpay
                        onCheckedChanged: {
                            GlobalVar.$settings.wxpay = wcpaySwitch.checked
                        }
                        anchors.topMargin: 5
                        anchors.left: wcpayTitle.right
                        anchors.leftMargin: 0
                        anchors.verticalCenter: parent.verticalCenter
                    }

                    CText{
                        id: memberTitle
                        text: "会员卡: "
                        anchors.left: wcpaySwitch.right
                        anchors.leftMargin: 100
                        anchors.verticalCenter: parent.verticalCenter
                        font.bold: true
                    }

                    Switch{
                        id:memberSwitch
                        width: 129
                        height: alipayTitle.height
                        text:{
                            checked?"打开":"关闭"
                        }
                        checked: GlobalVar.$settings.membership_card
                        onCheckedChanged: {
                            GlobalVar.$settings.membership_card = memberSwitch.checked
                        }
                        anchors.topMargin: 5
                        anchors.left: memberTitle.right
                        anchors.leftMargin: 0
                        anchors.verticalCenter: parent.verticalCenter
                    }
                }
            }
        }
    }
    
    Rectangle{
        id:bottomRect
        color: "#FFFFFF"
        anchors.right: parent.right
        anchors.rightMargin: 5
        anchors.left: parent.left
        anchors.leftMargin: 5
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 10
        height:50
        
        CButton {
            id:synchronizeBtn
            height: 30
            width:120
            text: "同步数据"
            anchors.horizontalCenterOffset: -80
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            text_color: "#FFFFFF"
            pressedColor:"#169BD5"
            exitedColor: "#169BD5"
            borderWidth:0
        }
        
        CButton {
            id:switchBtn
            height: synchronizeBtn.height
            width:synchronizeBtn.width
            text:  "切换店铺"
            anchors.horizontalCenterOffset: 80
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            text_color: "#FFFFFF"
            pressedColor:"#D1514D"
            exitedColor: "#D1514D"
            borderWidth:0
        }
    }
    
}
