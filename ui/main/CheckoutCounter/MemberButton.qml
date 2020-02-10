import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import "../../core"

Button {
    id:btn
    
    property bool haveMember: false
    property string name: ""
    property real balance: 0
    property real integral: 0
    
    
    background: Rectangle {
        color: btn.down ? "#d0d0d0" : "#e0e0e0"
        border.width: 1
        border.color: "#CCCCCC"
    }
    
    contentItem: Item{
        id: element
        RowLayout{
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            spacing:20
            
            CText{
                id:nameText
                text: {
                    if(haveMember)
                        return name
                    else
                        return "会员查询"
                }
            }
            
            CText{
                text:"余额: " + balance.toFixed(2)
                visible: haveMember
            }
            
            CText{
                text:"积分: " + integral.toFixed(2)
                visible: haveMember
            }
        }
    }
}
