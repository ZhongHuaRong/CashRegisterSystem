import QtQuick 2.12

Rectangle {
    id:main_page
    
    LeftRectangle {
        id:left_rect
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        anchors.top: parent.top
        anchors.topMargin: 0
        width:main_page.width / 6 > 200?200:main_page.width / 6
        onItemChanged: {
            right_rect.set_current_view(index,label_name)
        }
    }
    
    RightRectangle{
        id:right_rect
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.left: left_rect.right
        anchors.leftMargin: 0
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        anchors.top: parent.top
        anchors.topMargin: 0
        onItemChanged: {
            left_rect.set_current_index(index)
        }
    }
}
