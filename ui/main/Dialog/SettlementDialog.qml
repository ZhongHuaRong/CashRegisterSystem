import QtQuick 2.0
import QtQuick.Window 2.12
import "../../core"
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12

Window {
    id:settlementDialog 
    visible: false
    flags:Qt.Dialog | Qt.FramelessWindowHint
    modality: Qt.ApplicationModal
    width:1000
    height:635
    color: "#00000000"
    
    property alias total: totalText.text
    property alias discount: discountText.text
    property alias payable: payableText.text
    property alias actualPayment: actualPaymentText.text
    property alias arrears: arrearsText.text
    property alias givechange: givechangeText.text
    
    
    ButtonGroup{
        id:valueTicketGroup
        buttons: valueTicketItem.children
    }
    
    ButtonGroup{
        id:percentageTicketGroup
        buttons: percentageTicketItem.children
    }
    
    ButtonGroup{
        id:noteGroup
        buttons: noteItem.children
    }
    
    Rectangle{
        id: rectangle
        border.width: 1
        border.color: "#797979"
        radius: 8
        anchors.fill: parent
        
        RowLayout{
            spacing: 10
            anchors.fill: parent
            
            Item{
                id:leftItem
                Layout.fillWidth: true
                Layout.fillHeight: true
                
                Rectangle{
                    id:listRect
                    anchors.left: parent.left
                    anchors.leftMargin: 20
                    anchors.right: parent.right
                    anchors.rightMargin: 0
                    anchors.top: parent.top
                    anchors.topMargin: 20
                    border.width: 1
                    border.color: "#CCCCCC"
                    height:rect1.height * 6 - 5
                    
                    Rectangle{
                        id: rect1
                        height: 50
                        anchors.right: parent.right
                        anchors.rightMargin: 0
                        anchors.left: parent.left
                        anchors.leftMargin: 0
                        anchors.top: parent.top
                        anchors.topMargin: 0
                        border.width: 1
                        border.color: "#CCCCCC"
                        CText{
                            text: "原价:"
                            anchors.left: parent.left
                            anchors.leftMargin: 10
                            anchors.verticalCenter: parent.verticalCenter
                        }
                        
                        CText{
                            id:totalText
                            text:"0.00"
                            anchors.right: parent.right
                            anchors.rightMargin: 10
                            anchors.verticalCenter: parent.verticalCenter
                        }
                    }
                    
                    Rectangle{
                        id: rect2
                        height:rect1.height
                        anchors.top: rect1.bottom
                        anchors.topMargin: -1
                        anchors.right: parent.right
                        anchors.rightMargin: 0
                        anchors.left: parent.left
                        anchors.leftMargin: 0
                        border.width: 1
                        border.color: "#CCCCCC"
                        CText{
                            text: "优惠:"
                            anchors.left: parent.left
                            anchors.leftMargin: 10
                            anchors.verticalCenter: parent.verticalCenter
                        }
                        
                        CText{
                            id:discountText
                            text:"0.00"
                            anchors.right: parent.right
                            anchors.rightMargin: 10
                            anchors.verticalCenter: parent.verticalCenter
                        }
                    }
                    
                    Rectangle{
                        id: rect3
                        height:rect1.height
                        anchors.right: parent.right
                        anchors.rightMargin: 0
                        anchors.left: parent.left
                        anchors.leftMargin: 0
                        anchors.top: rect2.bottom
                        anchors.topMargin: -1
                        border.width: 1
                        border.color: "#CCCCCC"
                        CText{
                            id:payableTitleText
                            text: "应付:"
                            anchors.left: parent.left
                            anchors.leftMargin: 10
                            anchors.verticalCenter: parent.verticalCenter
                        }
                        
                        CButton{
                            id:removejiao
                            text: "抹角"
                            height:30
                            width:90
                            anchors.left: payableTitleText.right
                            anchors.leftMargin: 10
                            anchors.verticalCenter: parent.verticalCenter
                            text_color: "#FFFFFF"
                            pressedColor:"#169BD5"
                            exitedColor: "#169BD5"
                        }
                        
                        CButton{
                            id:removefen
                            text: "抹分"
                            height:30
                            width:90
                            anchors.left: removejiao.right
                            anchors.leftMargin: 5
                            anchors.verticalCenter: parent.verticalCenter
                            text_color: "#FFFFFF"
                            pressedColor:"#169BD5"
                            exitedColor: "#169BD5"
                        }
                        
                        CButton{
                            id:changePrice
                            text: "改价"
                            height:30
                            width:90
                            anchors.left: removefen.right
                            anchors.leftMargin: 5
                            anchors.verticalCenter: parent.verticalCenter
                            text_color: "#FFFFFF"
                            pressedColor:"#169BD5"
                            exitedColor: "#169BD5"
                        }
                        CText{
                            id:payableText
                            text:"0.00"
                            anchors.right: parent.right
                            anchors.rightMargin: 10
                            anchors.verticalCenter: parent.verticalCenter
                            color: "#e00000"
                            font.pixelSize: GlobalVar.$settings.font_pixel * 2
                        }
                    }
                    
                    Rectangle{
                        id: rect4
                        height:rect1.height
                        anchors.right: parent.right
                        anchors.rightMargin: 0
                        anchors.left: parent.left
                        anchors.leftMargin: 0
                        anchors.top: rect3.bottom
                        anchors.topMargin: -1
                        border.width: 1
                        border.color: "#CCCCCC"
                        CText{
                            text: "已付:"
                            anchors.left: parent.left
                            anchors.leftMargin: 10
                            anchors.verticalCenter: parent.verticalCenter
                        }
                        
                        CText{
                            id:actualPaymentText
                            text:"0.00"
                            anchors.right: parent.right
                            anchors.rightMargin: 10
                            anchors.verticalCenter: parent.verticalCenter
                        }
                    }
                    Rectangle{
                        id: rect5
                        height:rect1.height
                        anchors.right: parent.right
                        anchors.rightMargin: 0
                        anchors.left: parent.left
                        anchors.leftMargin: 0
                        anchors.top: rect4.bottom
                        anchors.topMargin: -1
                        border.width: 1
                        border.color: "#CCCCCC"
                        CText{
                            text: "尚欠:"
                            anchors.left: parent.left
                            anchors.leftMargin: 10
                            anchors.verticalCenter: parent.verticalCenter
                        }
                        
                        CText{
                            id:arrearsText
                            text:"0.00"
                            anchors.right: parent.right
                            anchors.rightMargin: 10
                            anchors.verticalCenter: parent.verticalCenter
                        }
                    }
                    
                    Rectangle{
                        id: rect6
                        height:rect1.height
                        anchors.top: rect5.bottom
                        anchors.topMargin: -1
                        anchors.right: parent.right
                        anchors.rightMargin: 0
                        anchors.left: parent.left
                        anchors.leftMargin: 0
                        border.width: 1
                        border.color: "#CCCCCC"
                        CText{
                            text: "找零:"
                            anchors.left: parent.left
                            anchors.leftMargin: 10
                            anchors.verticalCenter: parent.verticalCenter
                        }
                        
                        CText{
                            id:givechangeText
                            text:"0.00"
                            anchors.right: parent.right
                            anchors.rightMargin: 10
                            anchors.verticalCenter: parent.verticalCenter
                            color: "#e00000"
                            font.pixelSize: GlobalVar.$settings.font_pixel * 2
                        }
                    }
                }
                
                CText{
                    id:valueTicketText
                    text:"优惠券"
                    anchors.left: parent.left
                    anchors.leftMargin: 20
                    anchors.top: listRect.bottom
                    anchors.topMargin: 10
                }
                
                Item{
                    id:valueTicketItem
                    anchors.right: parent.right
                    anchors.rightMargin: 0
                    anchors.left: parent.left
                    anchors.leftMargin: 20
                    anchors.top: valueTicketText.bottom
                    anchors.topMargin: 10
                    height:oneBtn.height
                    
                    BackgroundButton{
                        id:oneBtn
                        text:"1.00"
                        anchors.top: parent.top
                        anchors.topMargin: 0
                        anchors.left: parent.left
                        anchors.leftMargin: 0
                        height:width / 2
                        width:parent.width / 4 - 3
                        color:"#CCCCCC"
                    } 
                    
                    BackgroundButton{
                        id:fiveBtn
                        text:"5.00"
                        anchors.left: oneBtn.right
                        anchors.leftMargin: 4
                        height:oneBtn.height
                        width:oneBtn.width
                        color:"#CCCCCC"
                    } 
                    
                    BackgroundButton{
                        id:tenBtn
                        text:"10.00"
                        anchors.left: fiveBtn.right
                        anchors.leftMargin: 4
                        height:oneBtn.height
                        width:oneBtn.width
                        color:"#CCCCCC"
                    } 
                    
                    BackgroundButton{
                        id:fiftyBtn
                        text:"50.00"
                        anchors.left: tenBtn.right
                        anchors.leftMargin: 4
                        height:oneBtn.height
                        width:oneBtn.width
                        color:"#CCCCCC"
                    } 
                }
                
                CText{
                    id:percentageTicketText
                    text:"优惠券"
                    anchors.left: parent.left
                    anchors.leftMargin: 20
                    anchors.top: valueTicketItem.bottom
                    anchors.topMargin: 10
                }
                
                Item{
                    id:percentageTicketItem
                    height:off5.height
                    anchors.left: parent.left
                    anchors.leftMargin: 20
                    anchors.top: percentageTicketText.bottom
                    anchors.topMargin: 10
                    
                    BackgroundButton{
                        id:off5
                        text:"9.5折"
                        anchors.left: parent.left
                        anchors.leftMargin: 0
                        anchors.top: parent.top
                        anchors.topMargin: 0
                        height:oneBtn.height
                        width:oneBtn.width
                        color:"#CCCCCC"
                    } 
                    
                    BackgroundButton{
                        id:off20
                        text:"8.00折"
                        anchors.left: off5.right
                        anchors.leftMargin: 4
                        height:oneBtn.height
                        width:oneBtn.width
                        color:"#CCCCCC"
                    } 
                    
                    BackgroundButton{
                        id:off21
                        text:"7.9折"
                        anchors.left: off20.right
                        anchors.leftMargin: 4
                        height:oneBtn.height
                        width:oneBtn.width
                        color:"#CCCCCC"
                    } 
                    
                    BackgroundButton{
                        id:off0
                        text:"10折"
                        anchors.left: off21.right
                        anchors.leftMargin: 4
                        height:oneBtn.height
                        width:oneBtn.width
                        color:"#CCCCCC"
                    } 
                }
                
                CText{
                    id:noteText
                    text:"备注"
                    anchors.left: parent.left
                    anchors.leftMargin: 20
                    anchors.top: percentageTicketItem.bottom
                    anchors.topMargin: 10
                }
                
                Item{
                    id:noteItem
                    height:firstBtn.height
                    anchors.right: parent.right
                    anchors.rightMargin: 0
                    anchors.left: parent.left
                    anchors.leftMargin: 20
                    anchors.top: noteText.bottom
                    anchors.topMargin: 10
                    
                    BackgroundButton{
                        id:firstBtn
                        text:"挂账"
                        anchors.left: parent.left
                        anchors.leftMargin: 0
                        anchors.top: parent.top
                        anchors.topMargin: 0
                        height:firstBtn.width / 2
                        width:parent.width / 3 - 6
                        color:"#CCCCCC"
                    }
                    BackgroundButton{
                        id:save
                        text:"寄存"
                        anchors.left: firstBtn.right
                        anchors.leftMargin: 9
                        height:firstBtn.height
                        width:firstBtn.width
                        color:"#CCCCCC"
                    }
                    BackgroundButton{
                        id:delivery
                        text:"送货上门"
                        anchors.left: save.right
                        anchors.leftMargin: 9
                        height:firstBtn.height
                        width:firstBtn.width
                        color:"#CCCCCC"
                    }
                }
            }
            
            Item{
                id:rightItem
                Layout.fillWidth: true
                Layout.fillHeight: true
                
                Item{
                    id:payItem
                    height:cash.height
                    anchors.left: parent.left
                    anchors.leftMargin: 0
                    anchors.right: parent.right
                    anchors.rightMargin: 20
                    anchors.top: rightItem.top
                    anchors.topMargin: 10
                    
                    BackgroundButton{
                        id:cash
                        text:"现金"
                        anchors.left: parent.left
                        anchors.leftMargin: 0
                        anchors.top: parent.top
                        anchors.topMargin: 0
                        height:oneBtn.height
                        width:oneBtn.width
                        color:"#CCCCCC"
                        fontColor: "#000000"
                    } 
                    
                    BackgroundButton{
                        id:memberCard
                        text:"会员卡"
                        anchors.left: cash.right
                        anchors.leftMargin: 4
                        height:oneBtn.height
                        width:oneBtn.width
                        color:"#CCCCCC"
                        fontColor: "#000000"
                    } 
                    
                    BackgroundButton{
                        id:aliPay
                        text:"支付宝"
                        anchors.left: memberCard.right
                        anchors.leftMargin: 4
                        height:oneBtn.height
                        width:oneBtn.width
                        color:"#CCCCCC"
                        fontColor: "#000000"
                    } 
                    
                    BackgroundButton{
                        id:wcPay
                        text:"微信"
                        anchors.left: aliPay.right
                        anchors.leftMargin: 4
                        height:oneBtn.height
                        width:oneBtn.width
                        color:"#CCCCCC"
                        fontColor: "#000000"
                    } 
                }
            }
        }
    }
    
//    MouseArea{
//        anchors.fill: parent 
//        onDoubleClicked: settlementDialog.close()
//    }
}
