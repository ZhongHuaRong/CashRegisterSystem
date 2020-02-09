import QtQuick 2.12
import "../core"

Item {
    id:adRect
    
    property alias midPath: midImg.source
    
    ImageItem{
        id:midImg
        anchors.fill: parent
    }

}
