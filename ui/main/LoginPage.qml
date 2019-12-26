import QtQuick 2.12
import QtQuick.Controls 2.5
import "../core"

Item {
    id: element
    
    signal loingClicked(var account,var pw,var shop_name)
    
    function get_account() {
        return account.text
    }
    
    function get_pw() {
        return pw.text
    }
    
    function get_shop() {
        return shop_name.currentText
    }
    
    function login_failed(errstr){
        busy_dialog.title = "登录失败"
        busy_dialog.text = errstr
        busy_dialog.icon = BusyDialog.Critical
        busy_dialog.standardButtons = BusyDialog.Ok 
        busy_dialog.open()
    }
    
    Component.onCompleted: {
        account.setText(GlobalVar.$settings.account)
    }
    
    Image {
        id: logo_img
        x: 170
        width: element.height / 10 * 3
        height: width
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: element.height / 10
        fillMode: Image.PreserveAspectFit
        source: "qrc:/image/login_logo.png"
    }
    
    
    CTextEdit {
        id:account
        width:logo_img.width
        height:dpH(30)
        anchors.top: logo_img.bottom
        anchors.topMargin: pw.anchors.topMargin * 2
        anchors.horizontalCenter: parent.horizontalCenter
        preset_text: "门店收银员账号"
        font_family: GlobalVar.$settings.font_family
        font_pixel: GlobalVar.$settings.font_pixel
    }
    
    CTextEdit{
        id:pw
        width:logo_img.width
        height:account.height
        anchors.top: account.bottom
        anchors.topMargin: dpH(10)
        echoMode:TextInput.Password
        anchors.horizontalCenter: parent.horizontalCenter
        preset_text: "登陆密码"
        font_family: GlobalVar.$settings.font_family
        font_pixel: GlobalVar.$settings.font_pixel
    }
    
    CComboBox {
        id: shop_name
        width:logo_img.width
        height:account.height
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: pw.bottom
        anchors.topMargin: pw.anchors.topMargin
    }
    
    CButton{
        id:login_button
        width:logo_img.width
        height:account.height
        anchors.top: shop_name.bottom
        anchors.topMargin: pw.anchors.topMargin * 2
        anchors.horizontalCenter: parent.horizontalCenter
        text: "收银员 登录"
        pressedColor:"#A3BF00"
        exitedColor: "#A3BF00"
        unClickedColor: "#A3BF00"
        enteredColor: "#A3BF00"
        borderWidth:0
        font_family: GlobalVar.$settings.font_family
        font_pixel: GlobalVar.$settings.font_pixel
        onClicked: {
            busy_dialog.title = "登录"
            busy_dialog.text = "正在登录中..."
            busy_dialog.icon = BusyDialog.Information
            busy_dialog.standardButtons = BusyDialog.Cancel 
            busy_dialog.open()
            element.loingClicked(account.text,pw.text,shop_name.currentText)
        }
    }
    
    BusyDialog {
        id:busy_dialog
    }
    
}
