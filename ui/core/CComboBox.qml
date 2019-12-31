import QtQuick 2.6
import QtQuick.Controls 2.5

ComboBox {
    id: comboBox
    font.pixelSize: 16
    font.family: "微软雅黑"
    
    property var horizontalAlignment: Text.AlignLeft

    function addOne(_text){
        comboBox.model.append({
                           text:_text
                       })
    }

    function getText(){
        return comboBox.model.get(comboBox.currentIndex).text;
    }

     //下拉列表的样式
     delegate: ItemDelegate {
         width: comboBox.width
         contentItem: Text {
             text: comboBox.model.get(index).text
             color: "#445266"
             font: comboBox.font
             elide: Text.ElideRight
             verticalAlignment: Text.AlignVCenter
             horizontalAlignment: comboBox.horizontalAlignment
         }
         height: comboBox.height
         highlighted: comboBox.highlightedIndex == index
     }

     //主文字
     contentItem: Text {
         leftPadding: 10

         text: comboBox.count == 0?"":comboBox.model.get(comboBox.currentIndex).text
         font: comboBox.font
         color: "#445266"
         horizontalAlignment: comboBox.horizontalAlignment
         verticalAlignment: Text.AlignVCenter
         elide: Text.ElideRight
     }

     background: Rectangle {
//         implicitWidth: 120
//         implicitHeight: 40
         border.color:"#CCCCCC"
         border.width:1
         color:"#ffffff"
         radius: 5
     }
     
//     indicator:Item{
//         width:0
//         height:0
//     }

     popup: Popup {
         y: comboBox.height - 1
         width: comboBox.width
         implicitHeight: comboBox.count>10?comboBox.height*10:comboBox.height*comboBox.count
         padding: 1
         closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutside

         contentItem: ListView {
             id: listview
             clip: true
             model: comboBox.popup.visible ? comboBox.delegateModel : null
             currentIndex: comboBox.highlightedIndex

             ScrollIndicator.vertical: ScrollIndicator { }
         }

         background: Rectangle {
             border.color:"#CCCCCC"
             border.width:1
             color:"#ffffff"
         }
     }
 }
