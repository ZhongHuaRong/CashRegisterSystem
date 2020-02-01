import QtQuick 2.12
import "../core"

Item {
    id:adRect
    
    property string leftPath: ""
    property string midPath: ""
    property string rightPath: ""

//    ImageItem{
//        id:leftImg
//        width:adRect.width
//        height:adRect.height / 4 * 3
//        x:-adRect.width
//        y:adRect.height / 4
//        source: leftPath
//    }
    
    ImageItem{
        id:midImg
        width:adRect.width
        height:adRect.height
        x:0
        y:0
        source: midPath
    }
    
//    ImageItem{
//        id:rightImg
//        width:adRect.width
//        height:leftImg.height
//        x:adRect.width
//        y:leftImg.y
//        source: rightPath
//    }
}
