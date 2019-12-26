import QtQuick 2.0
import QtQuick.Window 2.12
import QtQuick.Controls 2.5

Rectangle {
    id:main_window
    width:640
    height:480
    visible:true
    
    function login(account,pw,shop_name) {
        console.debug(account)
        console.debug(pw)
        console.debug(shop_name)
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
