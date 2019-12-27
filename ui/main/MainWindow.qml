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
            login_success("111")
        } else {
            login_failed("账号错误或者密码错误")
        }

    }
    
    //需要修改,参数可能还需要多几个
    function login_success(account_name){
        GlobalVar.$settings.account = main_window.account
        GlobalVar.$settings.shop_name = main_window.shop_name
        GlobalVar.$settings.account_name = account_name
        page_loader.setSource("qrc:/ui/main/MainPage.qml")
    }
    
    function login_failed(errstr){
        page_loader.item.login_failed(errstr)
    }
    
    Loader{
        id:page_loader
        anchors.fill: parent
        source: "qrc:/ui/main/LoginPage.qml"
        onLoaded: {
            if(page_loader.source == "qrc:/ui/main/LoginPage.qml")
                page_loader.item.loingClicked.connect(main_window.login)
        }
    }
}
