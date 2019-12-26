import QtQuick 2.6
import QtQuick.Controls 2.5

ComboBox {
    id: comboBox
    font.pixelSize: 16
    font.family: "微软雅黑"

//    function addOne(_text){
//        comboBox.model.append({
//                           text:_text
//                       })
//    }

//    function getText(){
//        return comboBox.model.get(comboBox.currentIndex).text;
//    }

//     //下拉列表的样式
//     delegate: ItemDelegate {
//         width: comboBox.width
//         contentItem: Text {
//             text: comboBox.model.get(index).text
//             color: "#445266"
//             font: comboBox.font
//             elide: Text.ElideRight
//             verticalAlignment: Text.AlignVCenter
//         }
//         height: comboBox.height
//         highlighted: comboBox.highlightedIndex == index
//     }

//     //箭头
//     indicator: Item{
//         Image {
////             source: comboBox.down==true?"qrc:/Resources/down-top@3x.png":"qrc:/Resources/left@3x.png"
//             anchors.top: parent.top
//             anchors.left: parent.left
//             anchors.topMargin: comboBox.height*0.35
//             anchors.leftMargin: comboBox.width*0.78
//             width:dpW(15)
//             height: dpH(14)
//         }
//     }

//     //主文字
//     contentItem: Text {
//         leftPadding: dpW(10)
//         rightPadding: comboBox.indicator.width + comboBox.spacing

//         text: comboBox.model.get(comboBox.currentIndex).text
//         font: comboBox.font
//         color: "#445266"
//         horizontalAlignment: Text.AlignLeft
//         verticalAlignment: Text.AlignVCenter
//         elide: Text.ElideRight
//     }

//     background: Rectangle {
////         implicitWidth: 120
////         implicitHeight: 40
//         border.color:"#445266"
//         border.width:1
//         color:"#ffffff"
//     }

//     popup: Popup {
//         y: comboBox.height - 1
//         width: comboBox.width
//         implicitHeight: comboBox.count>10?comboBox.height*10:comboBox.height*comboBox.count
//         padding: 1
//         closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutside

//         contentItem: ListView {
//             id: listview
//             clip: true
//             model: comboBox.popup.visible ? comboBox.delegateModel : null
//             currentIndex: comboBox.highlightedIndex

//             ScrollIndicator.vertical: ScrollIndicator { }
//         }

//         background: Rectangle {
//             border.color:"#445266"
//             border.width:1
//             color:"#ffffff"
//         }
//     }
 }
