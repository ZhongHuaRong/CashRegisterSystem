import QtQuick 2.12
import QtQuick.Controls 2.5
import "../../core"

SwipeView {
    id: orderCenter
    clip: true
    interactive: false
    background: Rectangle{
        color: "#FFFFFF"
    }
    
    signal titleChanged(string title)
    
    Component.onCompleted: {
        GlobalVar.$event.return_order_data.connect(search.set_model_data)
    }
    
    OrderSearch{
        id:search
        onSearchFromDate: {
            GlobalVar.$event.search_order_from_date(firstDate,secondDate,flag,count)
        }
        onSearchFromID: {
            GlobalVar.$event.search_order_from_id(id)
        }
    }
    
    OrderDetails{
        id:details
    }
}
