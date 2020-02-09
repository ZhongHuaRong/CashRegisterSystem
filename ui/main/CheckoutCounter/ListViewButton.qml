import QtQuick 2.0
import QtQuick.Controls 2.12

Button {
    id:btn
    background:Rectangle{
        border.width: 1
        border.color: "#CCCCCC"
        color: btn.down ? "#d0d0d0" : "#e0e0e0"
    }
}
