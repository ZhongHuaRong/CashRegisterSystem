import QtQuick 2.12
import QtQuick.Layouts 1.12
import "../../core"

Rectangle {
    id:i1
    border.width: 1
    border.color: "#CCCCCC"


    property string title: ""
    property alias text: input.text

    signal editingFinished()

    Rectangle{
        id:rect
        anchors.left: parent.left
        anchors.leftMargin: 1
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 1
        anchors.top: parent.top
        anchors.topMargin: 1
        width: titleText.width + 10
        border.width: 0
        color: "#EEEEEE"

        CText{
            id:titleText
            text:title
            anchors.left: parent.left
            anchors.leftMargin: 5
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 0
            anchors.top: parent.top
            anchors.topMargin: 0
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
        }
    }


    TextInput {
        id:input
        clip: true
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: rect.right
        anchors.leftMargin: 10
        anchors.right: parent.right
        anchors.rightMargin: 5
        font.pixelSize: GlobalVar.$settings.font_pixel
        font.family: GlobalVar.$settings.font_family
        selectByMouse:true
        onEditingFinished: i1.editingFinished()
    }
}
