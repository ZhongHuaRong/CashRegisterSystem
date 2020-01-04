import QtQuick 2.12
import QtQuick.Controls 2.5
import "../../core"

SwipeView {
    id: memberCenter
    clip: true
    interactive: false
    background: Rectangle{
        color: "#FFFFFF"
    }
    
    signal titleChanged(string title)
    
    function change2Detail(data){
        details.setDetailLabel(data)
        memberCenter.currentIndex = 1
        titleChanged("会员详情")
    }
    
    function change2Search(){
        memberCenter.setCurrentIndex(0)
        titleChanged("会员中心")
    }
    
    function change2Recording(title){
        memberCenter.setCurrentIndex(2)
        titleChanged(title)
    }
    
    function setData(data){
        switch(memberCenter.currentIndex){
        case 0:
            centerListView.set_model_data(data)
            break
        case 1:
            centerListView.set_model_data(data)
            break
        }
    }
    

    MemberSearch{
        id:centerListView
        onSearchFromDate: {
            GlobalVar.$event.search_member_from_level(flag,count,pageNum)
        }
        onSearchFromID: {
            GlobalVar.$event.search_member_from_id(id)
        }
        onChange2Check:{
            change2Detail(data)
        }
    }
    
    MemberDetails{
        id:detail
    }
    
    MemberRecordingTableView{
        id:recordingView
    }
}
