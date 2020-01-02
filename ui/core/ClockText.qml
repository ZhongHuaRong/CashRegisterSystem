import QtQuick 2.12
import "./"

CText {
    id:clock_text
    
    Timer {
        interval: 1000
        running: true
        repeat: true
        triggeredOnStart:true
        onTriggered: {
            clock_text.text = 
                    new Date().toLocaleString(GlobalVar.$locale,"yyyy-MM-dd hh:mm:ss")
        }
    }
}
