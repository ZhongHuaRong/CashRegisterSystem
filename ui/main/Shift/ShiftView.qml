import QtQuick 2.12
import QtQuick.Controls 2.5
import "../../core"

Item {
    id:shiftView
    
    property real netList: 0.00
    
    property real offlineAmount: cashAmount + cashAmount + alipayAmount +
                                 wcpayAmount + memberpayAmount + otherpayAmount
    property real onlineAmount: 15.00
    property real cashAmount: 1.00
    property real alipayAmount: 2.00
    property real wcpayAmount: 3.00
    property real memberpayAmount: 4.00
    property real otherpayAmount: 5.00
    
    property real cargeback: 6.00
    
    property real memberCash: 7.00
    property real memberAlipay: 8.00
    property real memberWcpay: 9.00
    property real memberTotal: 10.00
    
    property real onlineCount: 11
    property real cargebackCount: 12
    property real offlineCount: 13
    
    Rectangle{
        id: rectangle
        height: 40
        color:"#2DB7F5"
        anchors.right: parent.right
        anchors.rightMargin: 5
        anchors.left: parent.left
        anchors.leftMargin: 5
        anchors.top: parent.top
        anchors.topMargin: 5
        
        CText{
            anchors.verticalCenter: parent.verticalCenter
            text: "2019-11-30 16:50:22 16:55:22"
            anchors.left: parent.left
            anchors.leftMargin: 10
            color: "#FFFFFF"
        }
    }
    
    Rectangle{
        id:centerView
        color: "#FFFFFF"
        border.width: 0
        anchors.bottom: printBtn.top
        anchors.bottomMargin: 0
        anchors.right: parent.right
        anchors.rightMargin: 5
        anchors.left: parent.left
        anchors.leftMargin: 5
        anchors.top: rectangle.bottom
        anchors.topMargin: 0
        
        Rectangle{
            id:totalAmountRect
            border.width: 1
            border.color: "#CCCCCC"
            radius: 3
            anchors.left: parent.left
            anchors.leftMargin: 0
            anchors.top: parent.top
            anchors.topMargin: 5
            width:shiftView.width / 2 - 12.5
            height: centerView.height / 3 - 8 
            
            CText{
                id:totalAmountTitle
                text:"总销售额: ¥"
                anchors.top: parent.top
                anchors.topMargin: 10
                anchors.left: parent.left
                anchors.leftMargin: 10
                color:"#333333"
                font.bold: true
                font.pixelSize: offlineAmountTitle.font.pixelSize + 3
            }
            
            CText{
                text:(offlineAmount + onlineAmount).toString()
                anchors.top: parent.top
                anchors.topMargin: 10
                anchors.left: totalAmountTitle.right
                anchors.leftMargin: 0
                color:"#333333"
                font:totalAmountTitle.font
            }
            
            Rectangle{
                id:line1
                border.width: 0
                height:1
                color: "#CCCCCC"
                anchors.right: parent.right
                anchors.rightMargin: 5
                anchors.left: parent.left
                anchors.leftMargin: 10
                anchors.top: totalAmountTitle.bottom
                anchors.topMargin: 5
            }
            
            CText{
                id:offlineAmountTitle
                text:"门店销售额: ¥"
                anchors.top: line1.bottom
                anchors.topMargin: 10
                anchors.left: parent.left
                anchors.leftMargin: 10
                color:"#333333"
            }
            
            CText{
                id:offlineAmountText
                text:offlineAmount.toString()
                anchors.right: onlineAmountTitle.left
                anchors.rightMargin: 10
                anchors.top: line1.bottom
                anchors.topMargin: 10
                anchors.left: offlineAmountTitle.right
                anchors.leftMargin: 0
                color:"#333333"
            }
            
            CText{
                id:onlineAmountTitle
                text:"网单销售额: ¥"
                anchors.top: line1.bottom
                anchors.topMargin: 10
                anchors.left: parent.left
                anchors.leftMargin: parent.width / 2
                color:"#333333"
            }
            
            CText{
                id:onlineAmountText
                text:onlineAmount.toString()
                anchors.right: parent.right
                anchors.rightMargin: 10
                anchors.top: line1.bottom
                anchors.topMargin: 10
                anchors.left: onlineAmountTitle.right
                anchors.leftMargin: 0
                color:"#333333"
            }
        }
        
        Rectangle{
            id:totalNumberRect
            border.width: 1
            border.color: "#CCCCCC"
            radius: 3
            anchors.right: parent.right
            anchors.rightMargin: 0
            anchors.top: parent.top
            anchors.topMargin: 5
            width:totalAmountRect.width
            height: totalAmountRect.height
            
            CText{
                id:totalNumberTitle
                text:"总单据数: "
                anchors.top: parent.top
                anchors.topMargin: 10
                anchors.left: parent.left
                anchors.leftMargin: 10
                color:"#333333"
                font:totalAmountTitle.font
            }
            
            CText{
                text:(onlineCount + cargebackCount + offlineCount).toString()
                anchors.top: parent.top
                anchors.topMargin: 10
                anchors.left: totalNumberTitle.right
                anchors.leftMargin: 0
                color:"#333333"
                font:totalAmountTitle.font
            }
            
            Rectangle{
                id:line2
                border.width: 0
                height:1
                color: "#CCCCCC"
                anchors.right: parent.right
                anchors.rightMargin: 5
                anchors.left: parent.left
                anchors.leftMargin: 10
                anchors.top: totalNumberTitle.bottom
                anchors.topMargin: 5
            }
            
            CText{
                id:offlineCountTitle
                text:"门店订单: "
                anchors.top: line2.bottom
                anchors.topMargin: 10
                anchors.left: parent.left
                anchors.leftMargin: 10
                color:"#333333"
            }
            
            CText{
                id:offlineCountText
                text:offlineCount.toString()
                anchors.right: onlineCountTitle.left
                anchors.rightMargin: 10
                anchors.top: line2.bottom
                anchors.topMargin: 10
                anchors.left: offlineCountTitle.right
                anchors.leftMargin: 0
                color:"#333333"
            }
            
            CText{
                id:onlineCountTitle
                text:"线上订单: "
                anchors.top: line2.bottom
                anchors.topMargin: 10
                anchors.left: parent.left
                anchors.leftMargin: parent.width / 2
                color:"#333333"
            }
            
            CText{
                id:onlineCountText
                text:onlineCount.toString()
                anchors.right: parent.right
                anchors.rightMargin: 10
                anchors.top: line2.bottom
                anchors.topMargin: 10
                anchors.left: onlineCountTitle.right
                anchors.leftMargin: 0
                color:"#333333"
            }
            
            CText{
                id:cargebackCountTitle
                text:"退货单: "
                anchors.top: offlineCountTitle.bottom
                anchors.topMargin: 10
                anchors.left: parent.left
                anchors.leftMargin: 10
                color:"#333333"
            }
            
            CText{
                id:cargebackCountText
                text:cargebackCount.toString()
                anchors.right: parent.right
                anchors.rightMargin: 10
                anchors.top: offlineCountTitle.bottom
                anchors.topMargin: 10
                anchors.left: cargebackCountTitle.right
                anchors.leftMargin: 0
                color:"#333333"
            }
        }
        
        Rectangle{
            id:curAmountRect
            border.width: 1
            border.color: "#CCCCCC"
            radius: 3
            anchors.left: parent.left
            anchors.leftMargin: 0
            anchors.top: totalAmountRect.bottom
            anchors.topMargin: 5
            width:totalAmountRect.width
            height: totalAmountRect.height
            
            CText{
                id:offlineAmountRectTitle
                text:"门店销售额: ¥"
                anchors.top: parent.top
                anchors.topMargin: 10
                anchors.left: parent.left
                anchors.leftMargin: 10
                color:"#333333"
                font:totalAmountTitle.font
            }
            
            CText{
                text:offlineAmount.toString()
                anchors.top: parent.top
                anchors.topMargin: 10
                anchors.left: offlineAmountRectTitle.right
                anchors.leftMargin: 0
                color:"#333333"
                font:totalAmountTitle.font
            }
            
            Rectangle{
                id:line3
                border.width: 0
                height:1
                color: "#CCCCCC"
                anchors.right: parent.right
                anchors.rightMargin: 5
                anchors.left: parent.left
                anchors.leftMargin: 10
                anchors.top: offlineAmountRectTitle.bottom
                anchors.topMargin: 5
            }
            
            CText{
                id:cashAmountTitle
                text:"现金收款: ¥"
                anchors.top: line3.bottom
                anchors.topMargin: 10
                anchors.left: parent.left
                anchors.leftMargin: 10
                color:"#333333"
            }
            
            CText{
                id:cashAmountText
                text:cashAmount.toString()
                anchors.right: alipayAmountTitle.left
                anchors.rightMargin: 10
                anchors.top: line3.bottom
                anchors.topMargin: 10
                anchors.left: cashAmountTitle.right
                anchors.leftMargin: 0
                color:"#333333"
            }
            
            CText{
                id:alipayAmountTitle
                text:"支付宝收款: ¥"
                anchors.top: line3.bottom
                anchors.topMargin: 10
                anchors.left: parent.left
                anchors.leftMargin: parent.width / 2
                color:"#333333"
            }
            
            CText{
                id:alipayAmountText
                text:alipayAmount.toString()
                anchors.right: parent.right
                anchors.rightMargin: 10
                anchors.top: line3.bottom
                anchors.topMargin: 10
                anchors.left: alipayAmountTitle.right
                anchors.leftMargin: 0
                color:"#333333"
            }
            
            CText{
                id:wcpayAmountTitle
                text:"微信收款: ¥"
                anchors.top: cashAmountTitle.bottom
                anchors.topMargin: 10
                anchors.left: parent.left
                anchors.leftMargin: 10
                color:"#333333"
            }
            
            CText{
                id:wcpayAmountText
                text:wcpayAmount.toString()
                anchors.right: memberpayAmountTitle.left
                anchors.rightMargin: 10
                anchors.top: cashAmountTitle.bottom
                anchors.topMargin: 10
                anchors.left: wcpayAmountTitle.right
                anchors.leftMargin: 0
                color:"#333333"
            }
            
            CText{
                id:memberpayAmountTitle
                text:"会员卡收款: ¥"
                anchors.top: cashAmountTitle.bottom
                anchors.topMargin: 10
                anchors.left: parent.left
                anchors.leftMargin: parent.width / 2
                color:"#333333"
            }
            
            CText{
                id:memberpayAmountText
                text:memberpayAmount.toString()
                anchors.right: parent.right
                anchors.rightMargin: 10
                anchors.top: cashAmountTitle.bottom
                anchors.topMargin: 10
                anchors.left: memberpayAmountTitle.right
                anchors.leftMargin: 0
                color:"#333333"
            }
            
            CText{
                id:otherpayAmountTitle
                text:"其他收款: ¥"
                anchors.top: wcpayAmountTitle.bottom
                anchors.topMargin: 10
                anchors.left: parent.left
                anchors.leftMargin: 10
                color:"#333333"
            }
            
            CText{
                id:otherpayAmountText
                text:otherpayAmount.toString()
                anchors.right: parent.right
                anchors.rightMargin: 10
                anchors.top: wcpayAmountTitle.bottom
                anchors.topMargin: 10
                anchors.left: wcpayAmountTitle.right
                anchors.leftMargin: 0
                color:"#333333"
            }
            
        }
        
        Rectangle{
            id:rechargeRect
            border.width: 1
            border.color: "#CCCCCC"
            radius: 3
            anchors.right: parent.right
            anchors.rightMargin: 0
            anchors.top: totalNumberRect.bottom
            anchors.topMargin: 5
            width:totalAmountRect.width
            height: totalAmountRect.height
            CText{
                id:rechargeTitle
                text:"会员充值: ¥"
                anchors.top: parent.top
                anchors.topMargin: 10
                anchors.left: parent.left
                anchors.leftMargin: 10
                color:"#333333"
                font:totalAmountTitle.font
            }
            
            CText{
                text:(memberTotal+memberAlipay+memberCash+memberWcpay).toString()
                anchors.top: parent.top
                anchors.topMargin: 10
                anchors.left: rechargeTitle.right
                anchors.leftMargin: 0
                color:"#333333"
                font:totalAmountTitle.font
            }
            
            Rectangle{
                id:line4
                border.width: 0
                height:1
                color: "#CCCCCC"
                anchors.right: parent.right
                anchors.rightMargin: 5
                anchors.left: parent.left
                anchors.leftMargin: 10
                anchors.top: rechargeTitle.bottom
                anchors.topMargin: 5
            }
            
            CText{
                id:memberCashTitle
                text:"现金充值: ¥"
                anchors.top: line4.bottom
                anchors.topMargin: 10
                anchors.left: parent.left
                anchors.leftMargin: 10
                color:"#333333"
            }
            
            CText{
                id:memberCashText
                text:memberCash.toString()
                anchors.right: memberAlipayTitle.left
                anchors.rightMargin: 10
                anchors.top: line4.bottom
                anchors.topMargin: 10
                anchors.left: memberCashTitle.right
                anchors.leftMargin: 0
                color:"#333333"
            }
            
            CText{
                id:memberAlipayTitle
                text:"支付宝充值: ¥"
                anchors.top: line4.bottom
                anchors.topMargin: 10
                anchors.left: parent.left
                anchors.leftMargin: parent.width / 2
                color:"#333333"
            }
            
            CText{
                id:memberAlipayText
                text:memberAlipay.toString()
                anchors.right: parent.right
                anchors.rightMargin: 10
                anchors.top: line4.bottom
                anchors.topMargin: 10
                anchors.left: memberAlipayTitle.right
                anchors.leftMargin: 0
                color:"#333333"
            }
            
            CText{
                id:memberWcpayTitle
                text:"微信充值: ¥"
                anchors.top: memberCashTitle.bottom
                anchors.topMargin: 10
                anchors.left: parent.left
                anchors.leftMargin: 10
                color:"#333333"
            }
            
            CText{
                id:memberWcpayText
                text:memberWcpay.toString()
                anchors.right: memberTotalTitle.left
                anchors.rightMargin: 10
                anchors.top: memberCashTitle.bottom
                anchors.topMargin: 10
                anchors.left: memberWcpayTitle.right
                anchors.leftMargin: 0
                color:"#333333"
            }
            
            CText{
                id:memberTotalTitle
                text:"增额总计: ¥"
                anchors.top: memberCashTitle.bottom
                anchors.topMargin: 10
                anchors.left: parent.left
                anchors.leftMargin: parent.width / 2
                color:"#333333"
            }
            
            CText{
                id:memberTotalText
                text:memberTotal.toString()
                anchors.right: parent.right
                anchors.rightMargin: 10
                anchors.top: memberCashTitle.bottom
                anchors.topMargin: 10
                anchors.left: memberTotalTitle.right
                anchors.leftMargin: 0
                color:"#333333"
            }
        }
        
        Rectangle{
            id:cargebackRect
            border.width: 1
            border.color: "#CCCCCC"
            radius: 3
            anchors.left: parent.left
            anchors.leftMargin: 0
            anchors.top: curAmountRect.bottom
            anchors.topMargin: 5
            width:totalAmountRect.width
            height: totalAmountRect.height
            
            CText{
                id:cargebackRectTitle
                text:"退货总额: ¥"
                anchors.top: parent.top
                anchors.topMargin: 10
                anchors.left: parent.left
                anchors.leftMargin: 10
                color:"#333333"
                font:totalAmountTitle.font
            }
            
            CText{
                text:cargeback.toString()
                anchors.top: parent.top
                anchors.topMargin: 10
                anchors.left: cargebackRectTitle.right
                anchors.leftMargin: 0
                color:"#333333"
                font:totalAmountTitle.font
            }
            
            Rectangle{
                id:line5
                border.width: 0
                height:1
                color: "#CCCCCC"
                anchors.right: parent.right
                anchors.rightMargin: 5
                anchors.left: parent.left
                anchors.leftMargin: 10
                anchors.top: cargebackRectTitle.bottom
                anchors.topMargin: 5
            }
            
            CText{
                id:cargebackTitle
                text:"退货总额: ¥"
                anchors.top: line5.bottom
                anchors.topMargin: 10
                anchors.left: parent.left
                anchors.leftMargin: 10
                color:"#333333"
            }
            
            CText{
                id:cargebackText
                text:cargeback.toString()
                anchors.right: parent.right
                anchors.rightMargin: 10
                anchors.top: line5.bottom
                anchors.topMargin: 10
                anchors.left: cargebackTitle.right
                anchors.leftMargin: 0
                color:"#333333"
            }
        }
        
    }
    
    CheckBox{
        id:printBtn
        text: "打印收据"
        anchors.bottom: bottomRect.top
        anchors.bottomMargin: 5
        anchors.left: parent.left
        anchors.leftMargin: 5
        font.family: GlobalVar.$settings.font_family
        font.pixelSize: GlobalVar.$settings.font_pixel
    }
    
    Rectangle{
        id:bottomRect
        color: "#FFFFFF"
        anchors.right: parent.right
        anchors.rightMargin: 5
        anchors.left: parent.left
        anchors.leftMargin: 5
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 5
        height:50
        
        CButton {
            id:changeBtn
            height: 30
            width:120
            text: "交接班"
            anchors.horizontalCenterOffset: -80
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            text_color: "#FFFFFF"
            pressedColor:"#169BD5"
            exitedColor: "#169BD5"
            borderWidth:0
        }
        
        CButton {
            id:closeBtn
            height: changeBtn.height
            width:changeBtn.width
            text:  "退出"
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

