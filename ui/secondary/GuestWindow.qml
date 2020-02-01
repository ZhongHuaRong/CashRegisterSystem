import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Window 2.12
import "../core"

Window {
    id:guest_window
    width:1280
    height:960
    visible: true
//    visible:Qt.application.screens.length > 1
//    visibility: Qt.application.screens.length > 1?Window.Maximized:Window.Hidden
//    screen:{
//        if(Qt.application.screens.length > 1)
//            return Qt.application.screens[1]
//        else
//            return Qt.application.screens[0]
//    }
    
    onClosing: Qt.quit()
    
    function adChanged(index){
        console.debug(GlobalVar.$adImageList[index])
        adpage.midPath = GlobalVar.$adImageList[index]
    }
    
    
    SwipeView {
        id: swipeView
        anchors.fill: parent
//        interactive:false
//        clip: true
//        currentIndex: 1
        
        ADRect{
            id:adpage
        }
        
        DetailsPage{
            id:detailspage
        }
    }
}
