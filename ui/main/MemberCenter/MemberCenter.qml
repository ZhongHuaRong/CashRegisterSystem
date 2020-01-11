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
    
    function return2Detail(){
        memberCenter.currentIndex = 1
        titleChanged("会员详情")
    }
    
    function change2Detail(isRecharge,data){
        details.setDetailLabel(isRecharge,data)
        return2Detail()
    }
    
    function change2Search(){
        memberCenter.setCurrentIndex(0)
        titleChanged("会员中心")
    }
    
    function change2Recording(isRecharge,data){
        memberCenter.setCurrentIndex(2)
        if(isRecharge)
            memberCenter.titleChanged("充值记录")
        else
            memberCenter.titleChanged("购买记录")
        recordingView.setData(isRecharge,data)
    }
    
    function setData(data){
        switch(memberCenter.currentIndex){
        case 0:
            centerListView.set_model_data(data)
            break
        case 1:
            details.setDetailLabel(details.get_current_index()===1,data[1])
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
            change2Detail(isRecharge,data)
        }
    }
    
    MemberDetails{
        id:details
        
        onChange2Recording: {
            GlobalVar.$event.search_member_recording_from_id(isRecharge,id,20,1)
        }
        
        onSearchFromID: {
            GlobalVar.$event.search_member_from_id(id)
        }
        
        onClose: {
            change2Search()
        }
    }
    
    MemberRecordingTableView{
        id:recordingView
        
        onGotoPage: {
            GlobalVar.$event.search_member_recording_from_id(recordingView.isRecharge,recordingView.id,20,page)
        }
        
        onClose: {
            return2Detail()
        }
    }
}
