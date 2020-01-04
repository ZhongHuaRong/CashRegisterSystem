import QtQuick 2.12
import QtQuick.Layouts 1.12
import "../../core"
import an.qt.DottedLine 1.0

Rectangle {
    id:labelView
    color: "#FFFFFF"
    border.width: 1
    border.color: "#000000"
    radius: 5
    
    property string orderID: ""
    property string cashier: ""
    property string payState: "1"
    property string category: ""
    property string totalAmount: ""
    property string reduceAmount: ""
    property string discountedGold: ""
    property string amountsPayable: ""
    property string actualAmount: ""
    property string giveChange: ""
    property string paymentMethod: ""
    property string payTime: ""
    property string memberID: ""
    property string integral: ""
    property string balance: ""
    property bool showRefund: payState === "已退款"
    property string user: ""
    property string refund: ""
    property string refundTime: ""
    
    Rectangle{
        id:header
        height: 40
        anchors.right: parent.right
        anchors.rightMargin: 1
        anchors.left: parent.left
        anchors.leftMargin: 1
        anchors.top: parent.top
        anchors.topMargin: 1
        color:"#F2F2F2"
        border.width: 0
        
        RowLayout{
            anchors.fill: parent
            
            CText{
                text:"订单号:"
                Layout.alignment:Qt.AlignVCenter | Qt.AlignHCenter
                color: "#445266"
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment:Text.AlignHCenter
            }
            CText{
                text:orderID
                Layout.alignment:Qt.AlignVCenter | Qt.AlignLeft
                color: "#445266"
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment:Text.AlignHCenter
            }
        }
    }
    
    CScrollView{
        id:scrollView
        anchors.top: header.bottom
        anchors.topMargin: 10
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 10
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.right: parent.right
        anchors.rightMargin: 10
        clip: true
        
        Column{
            id: column
            anchors.right: parent.right
            anchors.left: parent.left
            anchors.top: parent.top
            spacing:15
            
            Rectangle{
                id: element
                height:categoryLayout.height
                width:scrollView.width
                Row{
                    spacing: 5
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    anchors.leftMargin: 0
                    anchors.right: sataeText.left
                    anchors.rightMargin: 10
                    CText{
                        text:"收银员:"
                    }
                    CText{
                        text:cashier
                    }
                }
                
                CText{
                    id:sataeText
                    text:payState
                    horizontalAlignment: Text.AlignRight
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.right: parent.right
                    anchors.rightMargin: 10
                }
                
            }
            
            Row{
                spacing: 5
                id:categoryLayout
                CText{
                    text:"商品种类:"
                }
                CText{
                    text:category
                }
            }
            
            Row{
                spacing: 5
                CText{
                    text:"订单总额:"
                    Layout.alignment:Qt.AlignVCenter
                }
                CText{
                    text:totalAmount + "元"
                    Layout.alignment:Qt.AlignVCenter
                }
            }
            
            Row{
                spacing: 5
                CText{
                    text:"优惠金额:"
                }
                CText{
                    text:reduceAmount + "元"
                }
            }
            
            Row{
                spacing: 5
                CText{
                    text:"折后金额:"
                }
                CText{
                    text:discountedGold + "元"
                }
            }
            
            Row{
                spacing: 5
                CText{
                    text:"应付金额:"
                }
                CText{
                    text:amountsPayable + "元"
                }
            }
            
            Row{
                spacing: 5
                CText{
                    text:"实付金额:"
                }
                CText{
                    text:actualAmount + "元"
                }
            }
            
            Row{
                spacing: 5
                CText{
                    text:"找零:"
                }
                CText{
                    text:giveChange
                }
            }
            
            Row{
                spacing: 5
                CText{
                    text:"支付方式:"
                }
                CText{
                    text:paymentMethod
                }
            }
            
            Row{
                spacing: 5
                CText{
                    text:"订单支付时间:"
                }
                CText{
                    text:payTime
                }  
            }
            
            Row{     
                visible: showRefund
                DottedLine{
                    direction: DottedLine.Vertical
                    width:scrollView.width
                    height:1
                    anchors.verticalCenter: parent.verticalCenter
                }
            }
            
            Row{
                spacing: 5
                visible: showRefund
                CText{
                    text:"操作人:"
                }
                CText{
                    text:user
                }
            }
            
            Row{
                spacing: 5
                visible: showRefund
                CText{
                    text:"退款金额:"
                }
                CText{
                    text:refund
                }
            }
            
            Row{
                spacing: 5
                visible: showRefund
                CText{
                    text:"退款时间:"
                }
                CText{
                    text:refundTime
                }
            }
            
            Row{       
                DottedLine{
                    direction: DottedLine.Vertical
                    width:scrollView.width
                    height:1
                    anchors.verticalCenter: parent.verticalCenter
                }
            }
            
            Row{
                spacing: 5
                CText{
                    text:"会员:"
                }
                CText{
                    text:memberID
                }
            }
            
            Row{
                spacing: 5
                CText{
                    text:"积分:"
                }
                CText{
                    text:integral
                }
            }
            
            Row{
                spacing: 5
                CText{
                    text:"余额:"
                }
                CText{
                    text:balance
                }
            }
        }
    }
}
