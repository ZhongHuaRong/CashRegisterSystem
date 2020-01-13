import QtQuick 2.12
import QtQuick.Controls 1.4
import "../../core"

TableView {
    id:view
    horizontalScrollBarPolicy:Qt.ScrollBarAlwaysOff
    verticalScrollBarPolicy:Qt.ScrollBarAlwaysOff  
    
    property real headerHeight: 25
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
    
    model:ListModel{
        id:listModel
    }
    
    headerVisible :true
    headerDelegate:Component{

        Rectangle{
            color:"#F2F2F2"
            height:headerHeight
            border.width: 0
            clip:true

            CText {
                anchors.fill:parent
                anchors.leftMargin: 5
                color: "#445266"
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment:Text.AlignHCenter
                text: styleData.value
            }
        }
    }   
    
    rowDelegate:Rectangle{
        color:"#ffffff"
        height:40
        border.width: 0
        Rectangle{
            height:1
            border.width: 0
            color: "#CCCCCC"
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 1
        }

    }
}
