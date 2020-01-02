import QtQuick 2.0
import QtQuick.Controls 1.4

ScrollView {
    id:view
    horizontalScrollBarPolicy:Qt.ScrollBarAlwaysOff
    verticalScrollBarPolicy:Qt.ScrollBarAlwaysOff  
    
    property real headerHeight: 0
    property real mouseY: 0
    
    MouseArea{
        id:area
        anchors.fill: parent
        anchors.topMargin: headerHeight
        propagateComposedEvents:true
        onPressed: {
            view.mouseY = mouse.y
        }
        
        property real minY: -1 - view.headerHeight
        property real maxY: view.flickableItem.contentHeight - view.height - view.headerHeight
        
        onPositionChanged: {
            if(view.flickableItem.contentHeight < view.height)
                return;
            view.flickableItem.contentY -= (mouse.y - view.mouseY);
            view.mouseY = mouse.y
            if(view.flickableItem.contentY > maxY){
                view.flickableItem.contentY = maxY
            } else if(view.flickableItem.contentY < minY){
                view.flickableItem.contentY = minY
            } 
        }
    }
}
