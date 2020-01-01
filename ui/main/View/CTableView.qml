import QtQuick 2.0
import QtQuick.Controls 1.4

TableView {
    horizontalScrollBarPolicy:Qt.ScrollBarAlwaysOff
    verticalScrollBarPolicy:Qt.ScrollBarAlwaysOff  
    
//        MouseArea{
//            id:area
//            anchors.fill: parent
        
//            onPressed: {
//                console.debug(1)
//            }
//        }
    
    model:ListModel{
        id:listModel
    }
    
    headerVisible :true
    headerDelegate:Component{

        Rectangle{
            color:"#F2F2F2"
            height:25
            border.width: 0
            clip:true

            Text {
                anchors.fill:parent
                anchors.leftMargin: 5
                color: "#445266"
                font.pixelSize: font_pixel
                font.family: font_family
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment:Text.AlignHCenter
                text: styleData.value
                elide :Text.ElideRight
            }
        }
    }   
    
    rowDelegate:Rectangle{
        color:"#ffffff"
        height:40
        border.width: 1
        border.color: "#CCCCCC"
    }
}
