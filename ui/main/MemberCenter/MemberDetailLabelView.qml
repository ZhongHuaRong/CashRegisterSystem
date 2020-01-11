import QtQuick 2.12
import "../../core"

Item  {
    id:view

    property string name: "无"
    property string phone: "12345678999"
    property string balance: "100"
    property string msg: ""
    
    signal change2Recording(var isRecharge,var id)
    
    function setData(level,name,num,expireDate,balance,remark){
        view.name = name
        view.phone = num
        view.balance = balance
        view.msg = remark
        if(level === "普通会员"){
            levelBox.currentIndex  = 0
        } else{
            levelBox.currentIndex  = 1
        }
        if(expireDate === "长期")
            dateBox.currentIndex =  3
        else if(expireDate === "冻结")
            dateBox.currentIndex = 4
        else {
            dateBox.currentIndex = 2
        }
    }
    
    Item{
        id:levelItem
        height: 40
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.top: parent.top
        anchors.topMargin: 0
        CText{
            id:levelText
            text:"会员等级"
            anchors.left: parent.left
            anchors.leftMargin: 10
            anchors.verticalCenter: parent.verticalCenter
        }
        
        CComboBox{
            id:levelBox
            anchors.right: parent.right
            anchors.rightMargin: 10
            anchors.verticalCenter: parent.verticalCenter
            model:ListModel{
                ListElement{
                    text:"普通会员(默认)"
                }
                ListElement{
                    text:"VIP会员"
                }
            }
        }
        
        Rectangle{
            border.width: 1
            border.color: "#CCCCCC"
            height: 2
            anchors.right: parent.right
            anchors.rightMargin: 0
            anchors.left: parent.left
            anchors.leftMargin: 0
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 0
        }
        
    }
    
    Item{
        id:nameItem
        height: 40
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.top: levelItem.bottom
        anchors.topMargin: 0
        CText{
            id:nameText
            text:"会员姓名"
            anchors.left: parent.left
            anchors.leftMargin: 10
            anchors.verticalCenter: parent.verticalCenter
        }
        
        CText{
            text:name
            anchors.right: namebtn.left
            anchors.rightMargin: 15
            anchors.verticalCenter: parent.verticalCenter
        }
        
        CButton{
            id:namebtn
            text: "编辑"
            anchors.right: parent.right
            anchors.rightMargin: 10
            text_color: "#FFFFFF"
            anchors.verticalCenter: parent.verticalCenter
            pressedColor:"#169BD5"
            exitedColor: "#169BD5"
            unClickedColor: "#169BD5"
            enteredColor: "#169BD5"
            borderWidth:0
            height: 30
            width: 70
            onClicked: {
                
            }
        }
        
        Rectangle{
            border.width: 1
            border.color: "#CCCCCC"
            height: 2
            anchors.right: parent.right
            anchors.rightMargin: 0
            anchors.left: parent.left
            anchors.leftMargin: 0
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 0
        }
    }
    
    Item{
        id:phoneItem
        height: 40
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.top: nameItem.bottom
        anchors.topMargin: 0
        CText{
            id:phoneText
            text:"手机号码"
            anchors.left: parent.left
            anchors.leftMargin: 10
            anchors.verticalCenter: parent.verticalCenter
        }
        
        CText{
            text:phone
            anchors.right: phonebtn.left
            anchors.rightMargin: 15
            anchors.verticalCenter: parent.verticalCenter
        }
        
        CButton{
            id:phonebtn
            text: "编辑"
            anchors.right: parent.right
            anchors.rightMargin: 10
            text_color: "#FFFFFF"
            anchors.verticalCenter: parent.verticalCenter
            pressedColor:"#169BD5"
            exitedColor: "#169BD5"
            unClickedColor: "#169BD5"
            enteredColor: "#169BD5"
            borderWidth:0
            height: 30
            width: 70
            onClicked: {
                
            }
        }
    }
    
    Item{
        id:dateItem
        height: 40
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.top: phoneItem.bottom
        anchors.topMargin: 0
        CText{
            id:dateText
            text:"到期时间"
            anchors.left: parent.left
            anchors.leftMargin: 10
            anchors.verticalCenter: parent.verticalCenter
        }
        
        CComboBox{
            id:dateBox
            anchors.right: parent.right
            anchors.rightMargin: 10
            anchors.verticalCenter: parent.verticalCenter
            model:ListModel{
                ListElement{
                    text:"一个月"
                }
                ListElement{
                    text:"半年"
                }
                ListElement{
                    text:"一年"
                }
                ListElement{
                    text:"永久"
                }
                ListElement{
                    text:"注销"
                }
            }
        }
        
        Rectangle{
            border.width: 1
            border.color: "#CCCCCC"
            height: 2
            anchors.right: parent.right
            anchors.rightMargin: 0
            anchors.left: parent.left
            anchors.leftMargin: 0
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 0
        }
        
    }
    
    Item{
        id:balanceItem
        height: 40
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.top: dateItem.bottom
        anchors.topMargin: 0
        CText{
            id:balanceText
            text:"卡内余额"
            anchors.left: parent.left
            anchors.leftMargin: 10
            anchors.verticalCenter: parent.verticalCenter
        }
        
        CText{
            text:"¥" + balance
            anchors.right: parent.right
            anchors.rightMargin: 10
            anchors.verticalCenter: parent.verticalCenter
        }
        
        Rectangle{
            border.width: 1
            border.color: "#CCCCCC"
            height: 2
            anchors.right: parent.right
            anchors.rightMargin: 0
            anchors.left: parent.left
            anchors.leftMargin: 0
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 0
        }
    }
    
    Item{
        id:payItem
        height: 40
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.top: balanceItem.bottom
        anchors.topMargin: 0
        CText{
            id:payText
            text:"购买记录"
            anchors.left: parent.left
            anchors.leftMargin: 10
            anchors.verticalCenter: parent.verticalCenter
        }

        CButton{
            id:payBtn
            text: "查看"
            anchors.right: parent.right
            anchors.rightMargin: 10
            text_color: "#FFFFFF"
            anchors.verticalCenter: parent.verticalCenter
            pressedColor:"#169BD5"
            exitedColor: "#169BD5"
            unClickedColor: "#169BD5"
            enteredColor: "#169BD5"
            borderWidth:0
            height: 30
            width: 70
            onClicked: {
                change2Recording(false,phone)
            }
        }
        Rectangle{
            border.width: 1
            border.color: "#CCCCCC"
            height: 2
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 0
            anchors.left: parent.left
            anchors.leftMargin: 0
            anchors.right: parent.right
            anchors.rightMargin: 0
        }
    }
    
    Item{
        id:rechargeItem
        height: 40
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.top: payItem.bottom
        anchors.topMargin: 0
        CText{
            id:rechargeText
            text:"充值记录"
            anchors.left: parent.left
            anchors.leftMargin: 10
            anchors.verticalCenter: parent.verticalCenter
        }
        
        CButton{
            id:rechargebtn
            text: "查看"
            anchors.right: parent.right
            anchors.rightMargin: 10
            text_color: "#FFFFFF"
            anchors.verticalCenter: parent.verticalCenter
            pressedColor:"#169BD5"
            exitedColor: "#169BD5"
            unClickedColor: "#169BD5"
            enteredColor: "#169BD5"
            borderWidth:0
            height: 30
            width: 70
            onClicked: {
                change2Recording(true,phone)
                
            }
        }
        Rectangle{
            border.width: 1
            border.color: "#CCCCCC"
            height: 2
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 0
            anchors.right: parent.right
            anchors.rightMargin: 0
            anchors.left: parent.left
            anchors.leftMargin: 0
        }
    }
    
    Item{
        id:remarkItem
        height: 40
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.top: rechargeItem.bottom
        anchors.topMargin: 0
        CText{
            id:remarkText
            text:"备注"
            anchors.left: parent.left
            anchors.leftMargin: 10
            anchors.verticalCenter: parent.verticalCenter
        }
        
        CButton{
            id:remarkbtn
            text: "编辑"
            anchors.right: parent.right
            anchors.rightMargin: 10
            text_color: "#FFFFFF"
            anchors.verticalCenter: parent.verticalCenter
            pressedColor:"#169BD5"
            exitedColor: "#169BD5"
            unClickedColor: "#169BD5"
            enteredColor: "#169BD5"
            borderWidth:0
            height: 30
            width: 70
            onClicked: {
                remarkEdit.readOnly = false
            }
        }
        Rectangle{
            border.width: 1
            border.color: "#CCCCCC"
            height: 2
            anchors.right: parent.right
            anchors.rightMargin: 0
            anchors.left: parent.left
            anchors.leftMargin: 0
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 0
        }
    }
    
    Item{
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.top: remarkItem.bottom
        anchors.topMargin: 0
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        
        TextEdit{
            id:remarkEdit
            anchors.rightMargin: 3
            anchors.leftMargin: 3
            anchors.bottomMargin: 3
            anchors.topMargin: 3
            anchors.fill: parent
            readOnly: true        
            font.family: GlobalVar.$settings.font_family
            font.pixelSize: GlobalVar.$settings.font_pixel
            color:"#999999"
            cursorVisible:true
            clip: true
            mouseSelectionMode:
                TextEdit.SelectWords
            wrapMode:
                TextEdit.Wrap 
            text:msg
        }
        
    }
 
}
