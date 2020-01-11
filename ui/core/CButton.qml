import QtQuick 2.0
import "./"

Rectangle {
    id: rect
    height: 40
    width: 120
    color:"#00000000"
    radius:5
    clip: true

    property color pressedColor: "#CCE4F7"
    property color enteredColor: "#E5F1FB"
    property color exitedColor: "#E1E1E1"
    property color unClickedColor: "#DCDCDC"
    property int borderWidth: 0
    property bool isPressed: false
    property string text: "按钮"
    property var canClicked: true
    property var buttonTypeIsText: true
    property url imageUrl: ""
    property color text_color: "#000000"
    property int font_pixel: GlobalVar.$settings.font_pixel
    property string font_family: GlobalVar.$settings.font_family
    property bool font_bold: false

    //让子组件button暴露在接口
    property var buttonObject: button

    //checkButton property
    property bool checkable: false
    property bool checked: false

    signal clicked(var sender);
    signal pressed(var mouse);
    signal move(var mouse);
    signal released(var mouse);

    function reset(){
        if(!rect.checkable)
            return;
        rect.state="exited";
        rect.checked=false;
    }

    function setChecked(){
        if(!rect.checkable)
            return;
        rect.state="checked";
        rect.checked=true;
    }

    onCanClickedChanged: {
        if(canClicked)
            rect.state = "exited"
        else
            rect.state = "unClicked"
    }

    states :
        [
        State {
            name: "entered"
            PropertyChanges {
                target: button;
                color:rect.enteredColor
            }
        },
        State{
            name:"pressed";
            PropertyChanges {
                target: button;
                width:rect.width - rect.width*0.1
                height:rect.height - rect.height*0.1
                color:rect.pressedColor
            }
        },
        State{
            name:"exited";
        },
        State{
            name:"released";
            PropertyChanges {
                target: button;
                color:{
                    if(mouseArea.containsMouse)
                        rect.enteredColor;
                    else
                        rect.exitedColor;
                }
            }
        },
        State{
            name:"checked";
            PropertyChanges {
                target: button;
                color:{
                    if(mouseArea.containsMouse)
                        rect.enteredColor;
                    else
                        rect.exitedColor;
                }
                width:rect.width - rect.width*0.05;
                height:rect.height - rect.height*0.05;
            }
        },
        State{
            name:"unClicked";
            PropertyChanges {
                target: button;
                color:rect.unClickedColor
            }
        }

    ]

    transitions: Transition{
        ColorAnimation{
                target: button
                property: "color"
                duration: 250
        }

        ColorAnimation{
            target:button.border
            property: "color"
            duration:250
        }

        NumberAnimation {
            target: button;
            property: "width"
            duration:100
        }

        NumberAnimation {
            target: button;
            property: "height"
            duration:100
        }
    }
    MouseArea {
        id: mouseArea
        anchors.fill: parent
        hoverEnabled: false
        preventStealing:true

        onEntered: {
            if(!rect.canClicked){
                return;
            }

            if(!rect.isPressed)
                rect.state="entered";
            else
                rect.state="pressed";
        }

        onExited:{
            if(!rect.canClicked){
                return;
            }
            if(rect.checkable){
                if(rect.checked)
                    rect.state="checked";
                else
                    rect.state="exited";
            }
            else
                rect.state="exited";
        }

        onPressed: {
            if(!rect.canClicked){
                return;
            }
            rect.state="pressed";
            isPressed = true;
            rect.pressed(mouse)
        }

        onReleased: {
            if(!rect.canClicked){
                return;
            }
            //松开在点击之前，所以checked反着判断
            if(rect.checkable){
                if(rect.checked){
                    if(rect.group)
                        rect.state="checked";
                    else if(mouseArea.containsMouse)
                        rect.state="released";
                    else
                        rect.state="checked";
                }
                else{
                    if(mouseArea.containsMouse)
                        rect.state="checked";
                    else
                        rect.state="released";
                }
            }
            else
                rect.state="released";
            isPressed = false;
            rect.released(mouse)
        }

        onClicked: {
            if(!rect.canClicked){
                rect.state="unClicked";
                return;
            }
            if(rect.checkable){
                if(rect.group){
                    if(!rect.checked){
                        rect.checked=!rect.checked
                        rect.clicked(rect);
                    }
                }
                else{
                    rect.checked=!rect.checked
                    rect.clicked(rect);
                }
            }
            else
                rect.clicked(rect);
        }
        onPositionChanged: rect.move(mouse)
    }

    Rectangle{
        id:button
        width:parent.width
        height:parent.height
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        color:rect.exitedColor
        border.width: borderWidth
        radius: rect.radius

        Text {
            id: text1
            text: rect.text
            anchors.fill:parent
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: rect.font_pixel
            font.family: font_family
            font.bold:font_bold
            visible: buttonTypeIsText
            color:text_color
        }

        Image{
            id:image
            source:imageUrl
            anchors.fill:parent
            visible: !buttonTypeIsText
        }
    }
}


