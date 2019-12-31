import QtQuick 2.12
import QtQuick.Controls 2.5

SwipeView {
    id: orderCenter
    clip: true
    interactive: false
    background: Rectangle{
        color: "#FFFFFF"
    }
    
    signal titleChanged(string title)
    
    OrderSearch{
        id:search
    }
    
    OrderDetails{
        id:details
    }
}
