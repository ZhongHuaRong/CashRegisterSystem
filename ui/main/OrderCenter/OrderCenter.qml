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
        GlobalVar.$event.return_order_detail.connect(orderCenter.change2Detail)
    }
    
    function change2Detail(data){
        
        orderCenter.currentIndex = 1
    }
    
    function change2Search(data){
        orderCenter.setCurrentIndex(0)
        
    }
    
    OrderSearch{
        id:search
        onSearchFromDate: {
            GlobalVar.$event.search_order_from_date(firstDate,secondDate,flag,count,pageNum)
        }
        onSearchFromID: {
            GlobalVar.$event.search_order_from_id(id)
        }
        onSearchOrderDetail: {
            GlobalVar.$event.search_order_detail(id,isRefund)
        }
    }
    
    OrderDetails{
        id:details
    }
}
