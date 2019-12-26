import QtQuick 2.0
import QtQuick.Window 2.12
import QtQuick.Controls 2.5
import "../core"

Rectangle {
    id:main_window
    width:640
    height:480
    visible:true
    
    //用于保存登录成功的信息
    property string account: ""
    property string shop_name: ""
    
    function login(account,pw,shop_name) {
        console.debug(account,pw,shop_name)
        main_window.account = account
        main_window.shop_name = shop_name
        if(account == "123" && pw == "123"){
            login_result(true,"")
        } else {
            login_result(false,"账号错误或者密码错误")
        }

    }
    
    function login_result(ret,str){
        if(ret){
            GlobalVar.$settings.account = main_window.account
            GlobalVar.$settings.shop_name = main_window.shop_name
            page_loader.setSource("qrc:/ui/main/MainPage.qml")
        } else {
            page_loader.item.login_failed(str)
        }
    }
    
    Loader{
        id:page_loader
        source: "qrc:/ui/main/LoginPage.qml"
        anchors.fill: parent
        onLoaded: {
            page_loader.item.loingClicked.connect(main_window.login)
        }
    }
}
