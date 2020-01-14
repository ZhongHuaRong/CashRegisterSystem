import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12
import "../../core"

Item {
    id: settingView
    
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
                enabled: !checked
                checked:true
            }
            
            UnderlineButton {
                height:30
                text: qsTr("打印机设置")
                Layout.fillWidth: true
            }
            
            UnderlineButton {
                height:30
                text: qsTr("广告设置")
                Layout.fillWidth: true
            }
            
            UnderlineButton {
                height:30
                text: qsTr("界面设置")
                Layout.fillWidth: true
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
                spacing: 10
                
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
                
                CText{
                    id:adText
                    text: "广告词设置"
                    font.bold: true
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
