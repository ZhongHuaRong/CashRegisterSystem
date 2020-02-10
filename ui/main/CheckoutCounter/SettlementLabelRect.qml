import QtQuick 2.0
import QtQuick.Layouts 1.12
import "../../core"

Rectangle {
    id:rect
    color: "#e00000"
    border.width: 0
    
    property alias count: countText.text
    property alias totalGold: totalGoldText.text
    property alias discount: discountText.text
    property alias payable: payableText.text
    
    signal clicked()
    
    ColumnLayout{
        id:leftItem
        anchors.left: parent.left
        anchors.leftMargin: 10
        width:parent.width / 2
        anchors.verticalCenter: parent.verticalCenter
        spacing: 10
        
        CText{
            id:countText
            color: "#FFFFFF"
        }
        
        RowLayout{
            
            CText{
                id:totalGoldTitleText
                color: "#FFFFFF"
                text: "应付金额:¥"
            }
            
            CText{
                id:totalGoldText
                color: "#FFFFFF"
            }
        }

        RowLayout{
            CText{
                id:discountTitleText
                color: "#FFFFFF"
                text: "优惠金额:¥"
            }
            
            CText{
                id:discountText
                color: "#FFFFFF"
            }
        }
    }
    
    RowLayout{
        id:rightItem
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.left: leftItem.right
        anchors.leftMargin: 0
        anchors.verticalCenter: parent.verticalCenter
        
        CText{
            id:settlementText
            color: "#FFFFFF"
            text: "结算:"
        }
        
        ColumnLayout{
            
            CText{
                id:payableTitleText
                color: "#FFFFFF"
                text: "订单总计(元)"
            }
            
            CText{
                id:payableText
                color: "#FFFFFF"
                font.bold: true
                font.pixelSize: payableTitleText.font.pixelSize + 5
            }
        }
    }
    
    MouseArea{
        anchors.fill: parent 
        onClicked: rect.clicked()
    }
}
