import QtQuick 2.12
import "../../core"

Item {
    id: element
    
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
                font.family:  GlobalVar.$settings.font_family
                font.pixelSize: GlobalVar.$settings.font_pixel
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
                font_family: GlobalVar.$settings.font_family
                font_pixel: GlobalVar.$settings.font_pixel
                height: datebtn.height
                width: 70
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
            font_family: GlobalVar.$settings.font_family
            font_pixel: GlobalVar.$settings.font_pixel
            width:{
                if(rectangle.width - row.width > 320)
                    return 300
                else
                    return rectangle.width - row.width - 20
            }
        }
        
    }
    

    
    Column {
        id:column
        anchors.fill: parent
        anchors.leftMargin: 10
        anchors.rightMargin: 10
        anchors.topMargin: 10
        anchors.bottomMargin: 10
        spacing: 10
        

        
        Rectangle{
            color: "#000000"
        }
    }
}



/*##^## Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
 ##^##*/
