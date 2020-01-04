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
    
    function change2Detail(data){
        details.setDetailLabel(data)
        orderCenter.currentIndex = 1
        titleChanged("订单详情")
    }
    
    function change2Search(){
        orderCenter.setCurrentIndex(0)
        titleChanged("订单中心")
        
    }
    
    function setData(data){
        search.set_model_data(data)
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
        onClose: {
            change2Search()
        }
        onPrintReceipt: {
            console.debug("print")
        }
    }
}
