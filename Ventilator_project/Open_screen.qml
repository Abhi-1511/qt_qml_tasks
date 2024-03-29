import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Styles 1.4
import QtQuick.Extras 1.4
import QtGraphicalEffects 1.12
import QtQuick.Controls 1.4
import QtQuick 2.2

Item {
    id:itemid
    width: mainwindowid.width
    height: mainwindowid.height
    property bool lockconfirm:false
    signal openmodepcv()
    signal gotopopuplock()
    signal gotopopupunlock()
    signal gotocalibrationpopup()
    signal gotovaluepage()
    property alias lockfactor:itemid.lockconfirm
    property alias lockrectid:lockrect.enabled
    property alias toprectids:toprect.enabled
    function unlockscreen(){
        lockconfirm=true
        openscreenid.visible=true
        openscreenid.enabled=true
        popuplockid.visible=false
        popuplockid.enabled=false
    }
    function unlockscreenoncancel(){
        lockconfirm=true
        openscreenid.visible=true
        openscreenid.enabled=true
        popupunlockid.visible=false
        popupunlockid.enabled=false

    }

    Rectangle{
        id:openScreenMainRect
        width:parent.width
        height:parent.height
        color:"black"
        Rectangle{
            id:toprect
            width:parent.width
            height:parent.height/10
            anchors.top:parent.top
            color:"black"
            enabled: lockconfirm===true?false:true

            Rectangle {
                id: defaultRect
                width: parent.width / 4.8484
                height: parent.height
                color: "black"
                anchors.left: parent.left

                ComboBox{
                    id: mannualComboBox
                    width: parent.width
                    height: parent.height
                    model: ListModel {
                        ListElement { text: "Default" }
                        ListElement { text: "Option 1" }
                        ListElement { text: "Option 2" }
                        ListElement { text: "Option 3" }
                    }
                    currentIndex: 0

                    style: ComboBoxStyle {

                        textColor: "white" // Set the text color to white directly on ComboBoxStyle
                        background: Rectangle {
                            color: "black"
                        }
                    }

                    Rectangle {
                        width: 20
                        height: mannualComboBox.height
                        color: "black"
                        anchors.right: parent.right;anchors.rightMargin: 10
                        Text {
                            anchors.verticalCenter: parent.verticalCenter
                            text: "\u25BD"
                            font.pixelSize: 16 // Adjust the font size as needed
                            color: "white" // Set the color of the down arrow symbol
                        }
                    }
                }
            }

            Rectangle{
                id:alarmrect
                width:parent.width/2.38
                height:parent.height
                color:"black"
                anchors.left:defaultRect.right
                Rectangle{
                    id:notificationrect
                    width:parent.width/4
                    height:parent.height
                    radius:50
                    color:"#89AAD3"
                    anchors.left:parent.left;
                    anchors.verticalCenter: parent.verticalCenter

                    Image {
                        width:parent.width*0.6
                        height:parent.height*0.6
                        anchors.left:parent.left
                        source: "file:///C:/Users/Abhi/Desktop/notification.png"
                        anchors.verticalCenter: parent.verticalCenter
                        fillMode: Image.PreserveAspectFit // Preserve the aspect ratio while fitting inside the rectangle
                    }

                }
                Rectangle{
                    id:settingsrect
                    width:parent.width/4
                    height:parent.height
                    radius:50
                    color:"#89AAD3"
                    anchors.right:parent.right;
                    anchors.verticalCenter: parent.verticalCenter
                    Image {
                        width:parent.width*0.6
                        height:parent.height*0.6
                        anchors.right:parent.right
                        source: "file:///C:/Users/Abhi/Desktop/settings.png"
                        anchors.verticalCenter: parent.verticalCenter
                        fillMode: Image.PreserveAspectFit // Preserve the aspect ratio while fitting inside the rectangle
                    }
                }
                Rectangle{
                    id:midalarmgreenrect
                    width:3*parent.width/4
                    height:parent.height
                    color:"#35D55A"
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                    Text {
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.horizontalCenter: parent.horizontalCenter
                        id: alarmtext
                        text: qsTr("No Alarm")
                        color:"white"
                        font.bold: true
                        font.pointSize: parent.width*0.05
                    }
                }

            }

            Rectangle {
                id: homerect
                width: parent.width / 7
                height: parent.height
                color: "black"
                anchors.left: alarmrect.right

                ComboBox {
                    id: mannualComboBox2
                    width: parent.width
                    height: parent.height
                    model: ListModel {
                        ListElement { iconSource: "file:///Users/Abhi/Desktop/home.png"}
                        ListElement { iconSource: "file:///Users/Abhi/Desktop/home.png" }
                        ListElement { iconSource: "file:///Users/Abhi/Desktop/home.png" }
                        ListElement { iconSource: "file:///Users/Abhi/Desktop/home.png"}
                    }
                    currentIndex: 0

                    //         delegate: Image {
                    //                     height: iconSource
                    //                     fillMode: Image.PreserveAspectFit
                    //                     source: iconSource
                    //                 }

                    style: ComboBoxStyle {
                        textColor: "transparent" // Make text color transparent
                        background: Rectangle {
                            color: "black"
                        }
                    }

                    Rectangle {
                        width: 20
                        height: mannualComboBox2.height
                        color: "black"
                        anchors.right: parent.right
                        anchors.rightMargin: 10
                        Text {
                            anchors.centerIn: parent
                            text: "\u25BD"
                            font.pixelSize: 16
                            color: "white"
                        }
                    }
                }
            }

            Rectangle{
                id:timerect
                width:parent.width/6
                height:parent.height
                color:"black"
                anchors.left:homerect.right
                Image {
                    id:img1
                    width:parent.width*0.2
                    height:parent.height
                    anchors.verticalCenter: parent.verticalCenter
                    source: "file:///C:/Users/Abhi/Desktop/thunder.png"
                    anchors.left: parent.left // Ensure the image fills the entire rectangle
                    //fillMode: Image.PreserveAspectFit // Preserve the aspect ratio while fitting inside the rectangle
                    rotation: 120
                }
                Image {
                    id:img2
                    width:parent.width*0.3
                    height:parent.height
                    anchors.verticalCenter: parent.verticalCenter
                    source: "file:///C:/Users/Abhi/Desktop/wifi.png"
                    anchors.left: img1.right // Ensure the image fills the entire rectangle
                    //fillMode: Image.PreserveAspectFit // Preserve the aspect ratio while fitting inside the rectangle
                }
                Text {
                    id: currentDateTimeText
                    anchors.left: img2.right
                    font.pixelSize: 12
                    color: "white"
                    anchors.verticalCenter: parent.verticalCenter
                    //anchors.top:parent.top;anchors.topMargin: 5

                    // JavaScript function to update the time and date
                    function updateDateTime() {
                        var now = new Date();
                        var hours = now.getHours();
                        var minutes = now.getMinutes().toString().padStart(2, '0'); // Ensure two digits
                        var am_pm = hours >= 12 ? "PM" : "AM";
                        hours = hours % 12;
                        hours = hours ? hours : 12;
                        var time = hours + ":" + minutes + " " + am_pm;
                        var date = now.toDateString();
                        currentDateTimeText.text =  date + "\n" + time;
                    }

                    // Call updateDateTime function immediately and every second thereafter
                    Component.onCompleted: updateDateTime()
                    Timer {
                        interval: 1000 // 1 second
                        running: true
                        repeat: true
                        onTriggered: currentDateTimeText.updateDateTime()
                    }
                }

            }
        }
        Rectangle{
            id:linerect
            color:"gray"
            width:parent.width
            height:parent.height/80
            anchors.top:toprect.bottom
        }

        /////////////////////////////
        Rectangle{
            id:midrect
            anchors.top:toprect.bottom;anchors.topMargin: 5
            width:parent.width
            height:parent.height/1.6
            color: "black"
            enabled: lockconfirm===true?false:true
            Rectangle {
                id: drawRect
                width: parent.width / 10
                height: parent.height / 5
                radius: 50
                color: "yellow"
                anchors.left: parent.left
                anchors.leftMargin: -50
                anchors.verticalCenter: parent.verticalCenter

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        drawer.open()
                    }
                }
            }

            Drawer {
                id: drawer
                width: 0.4 * mainwindowid.width
                height: midrect.height
                y:toprect.height+10
                Label {
                    width:parent.width
                    height: parent.height
                    anchors.centerIn: parent
                    Rectangle{
                        id:mainrectinsidedrawer
                        width:parent.width
                        height:parent.height
                        color:"#2893BF"
                        anchors.centerIn: parent
                        border.width:1
                        border.color:"black"
                        visible:true
                        enabled:true
                        Rectangle{
                            id:locid
                            width:parent.width*0.4
                            height:parent.height*0.12
                            color:"gray"
                            anchors.left: parent.left;anchors.leftMargin: 10
                            anchors.top:parent.top;anchors.topMargin: 30
                            Text{
                                text:"Location Id"
                                anchors.left: parent.left;anchors.leftMargin: 5
                                anchors.verticalCenter: parent.verticalCenter
                                color:"white"
                                font.pointSize: 12
                            }
                            MouseArea{
                                anchors.fill:parent
                                onClicked: {
                                    mainrectinsidedrawer.visible=false
                                    mainrectinsidedrawer.enabled=false
                                    mainrectinsidelocationid.visible=true
                                    mainrectinsidelocationid.enabled=true
                                }
                            }
                        }
                        Rectangle{
                            id:fio2calibrationrect
                            width:parent.width*0.4
                            height:parent.height*0.12
                            color:"gray"
                            anchors.left: locid.left;anchors.leftMargin: 200
                            anchors.top:parent.top;anchors.topMargin: 30
                            Text{
                                text:"FiO2 calibration"
                                anchors.left: parent.left;anchors.leftMargin: 5
                                anchors.verticalCenter: parent.verticalCenter
                                color:"white"
                                font.pointSize: 12
                            }
                            MouseArea{
                                anchors.fill:parent
                                onClicked: {
                                    gotocalibrationpopup()
                                    drawer.close()
                                }
                            }
                        }
                        Rectangle{
                            id:devicelogrect
                            width:parent.width*0.4
                            height:parent.height*0.12
                            color:"gray"
                            anchors.left: parent.left;anchors.leftMargin: 10
                            anchors.top:parent.top;anchors.topMargin: 90
                            Text{
                                text:"Device Logs"
                                anchors.left: parent.left;anchors.leftMargin: 5
                                anchors.verticalCenter: parent.verticalCenter
                                color:"white"
                                font.pointSize: 12
                            }
                        }
                        Rectangle{
                            id:devicesettingsrect
                            width:parent.width*0.4
                            height:parent.height*0.12
                            color:"gray"
                            anchors.left: parent.left;anchors.leftMargin: 10
                            anchors.top:parent.top;anchors.topMargin: 150
                            Text{
                                text:"Device Setting"
                                anchors.left: parent.left;anchors.leftMargin: 5
                                anchors.verticalCenter: parent.verticalCenter
                                color:"white"
                                font.pointSize: 12
                            }
                        }
                        Rectangle{
                            id:saveprofilerect
                            width:parent.width*0.4
                            height:parent.height*0.12
                            color:"gray"
                            anchors.left: parent.left;anchors.leftMargin: 10
                            anchors.top:parent.top;anchors.topMargin: 250
                            Text{
                                text:"Save as Profile"
                                anchors.left: parent.left;anchors.leftMargin: 5
                                anchors.verticalCenter: parent.verticalCenter
                                color:"white"
                                font.pointSize: 12
                            }
                        }
                        Rectangle{
                            id:removeprofilerect
                            width:parent.width*0.4
                            height:parent.height*0.12
                            color:"gray"
                            anchors.left: saveprofilerect.left;anchors.leftMargin: 200
                            anchors.top:parent.top;anchors.topMargin: 250
                            Text{
                                text:"Remove Profile"
                                anchors.left: parent.left;anchors.leftMargin: 5
                                anchors.verticalCenter: parent.verticalCenter
                                color:"white"
                                font.pointSize: 12
                            }
                        }
                    }
                    /////////////////////////////////
                    Rectangle{
                        id:mainrectinsidelocationid
                        width:parent.width
                        height:parent.height
                        color:"#2893BF"
                        anchors.centerIn: parent
                        border.width:1
                        border.color:"black"
                        visible:false
                        enabled:false
                        Text {
                            anchors.right: parent.right;anchors.rightMargin: 220
                            anchors.top:parent.top;anchors.topMargin: 40
                            id: bedidtext
                            text: qsTr("Bed Id")
                            font.pointSize: 20
                            font.bold:true
                            color:"white"
                        }
                        TextField {
                            id: bedinputid
                            anchors.right: parent.right;anchors.rightMargin: 50
                            anchors.top:parent.top;anchors.topMargin: 40
                            width: 150
                            height: 30
                            placeholderText: "Enter Bed Id"
                        }
                        Text {
                            anchors.right: parent.right;anchors.rightMargin: 220
                            anchors.top:parent.top;anchors.topMargin: 80
                            id: roomidtext
                            text: qsTr("Room Id")
                            font.pointSize: 20
                            font.bold:true
                            color:"white"
                        }
                        TextField {
                            id: roominputid
                            anchors.right: parent.right;anchors.rightMargin: 50
                            anchors.top:parent.top;anchors.topMargin: 80
                            width: 150
                            height: 30
                            placeholderText: "Enter Room Id"
                        }
                        Text {
                            anchors.right: parent.right;anchors.rightMargin: 220
                            anchors.top:parent.top;anchors.topMargin: 120
                            id: facilityidtext
                            text: qsTr("facility Id")
                            font.pointSize: 20
                            font.bold:true
                            color:"white"
                        }
                        TextField {
                            id: facilityid
                            anchors.right: parent.right;anchors.rightMargin: 50
                            anchors.top:parent.top;anchors.topMargin: 120
                            width: 150
                            height: 30
                            placeholderText: "Enter Facility Id"
                        }
                        Rectangle{
                            id:okrectid
                            width:parent.width*0.2
                            height:parent.height*0.1
                            anchors.left:parent.left;anchors.leftMargin:80
                            anchors.bottom: parent.bottom;anchors.bottomMargin: 50
                            border.width:2
                            border.color:"black"
                            color:"gray"
                            Text{
                                text:"ok"
                                anchors.centerIn: parent
                                font.pointSize: parent.width*0.15
                                color:"white"
                            }
                            MouseArea{
                                anchors.fill:parent
                                onClicked:{
                                    mainrectinsidedrawer.visible=true
                                    mainrectinsidedrawer.enabled=true
                                    mainrectinsidelocationid.visible=false
                                    mainrectinsidelocationid.enabled=false

                                }
                            }
                        }
                        Rectangle{
                            id:canclerectid
                            width:parent.width*0.2
                            height:parent.height*0.1
                            anchors.right:parent.right;anchors.rightMargin:80
                            anchors.bottom: parent.bottom;anchors.bottomMargin: 50
                            color:"gray"
                            border.width:2
                            border.color:"black"
                            Text{
                                text:"cancel"
                                anchors.centerIn: parent
                                font.pointSize: parent.width*0.15
                                color:"white"
                            }
                            MouseArea{
                                anchors.fill:parent
                                onClicked:{
                                    mainrectinsidedrawer.visible=true
                                    mainrectinsidedrawer.enabled=true
                                    mainrectinsidelocationid.visible=false
                                    mainrectinsidelocationid.enabled=false

                                }
                            }
                        }
                    }

                }
            }

            Rectangle{
                id:peakRect
                width:parent.width/5.7142
                height:parent.height/2.2
                color:"black"
                anchors.top:parent.top;anchors.topMargin: 10
                anchors.left:parent.left;anchors.leftMargin: parent.width/10
                RadialGradient {
                    anchors.fill: parent
                    gradient: Gradient {
                        GradientStop { position: 0.0; color: "#89AAD3" }
                        GradientStop { position: 0.4; color: "black" }
                    }
                }
                Text {
                    anchors.top: parent.top;anchors.topMargin: -6
                    anchors.horizontalCenter: parent.horizontalCenter
                    id: peekpmtext
                    text: qsTr("Peek P.")
                    color:"white"
                    font.bold: true
                    font.pointSize: parent.width*0.1
                }
                Text {
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    id: peekpmvalue
                    text: qsTr("0")
                    color:"white"
                    font.bold: true
                    font.pointSize: parent.width*0.2
                }
                Text {
                    anchors.bottom: parent.bottom;anchors.bottomMargin: 5
                    anchors.horizontalCenter: parent.horizontalCenter
                    id: peekpmtype
                    text: qsTr("cmH2O")
                    color:"white"
                    font.bold: true
                    font.pointSize: parent.width*0.08
                }
            }
            Rectangle{
                id:breathrect
                width:parent.width/5.7142
                height:parent.height/2.2
                anchors.top:parent.top;anchors.topMargin: 10
                anchors.left:peakRect.right
                RadialGradient {
                    anchors.fill: parent
                    gradient: Gradient {
                        GradientStop { position: 0.0; color: "#89AAD3" }
                        GradientStop { position: 0.4; color: "black" }
                    }
                }
                Text {
                    anchors.top: parent.top;anchors.topMargin: -6
                    anchors.horizontalCenter: parent.horizontalCenter
                    id: breathratemtext
                    text: qsTr("Breath Rate")
                    color:"white"
                    font.bold: true
                    font.pointSize: parent.width*0.1
                }
                Text {
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    id: breathratemvalue
                    text: qsTr("0")
                    color:"white"
                    font.bold: true
                    font.pointSize: parent.width*0.2
                }
                Text {
                    anchors.bottom: parent.bottom;anchors.bottomMargin: 5
                    anchors.horizontalCenter: parent.horizontalCenter
                    id: breathratemtype
                    text: qsTr("BPM")
                    color:"white"
                    font.bold: true
                    font.pointSize: parent.width*0.08
                }
            }
            Rectangle{
                id:spontrect
                width:parent.width/5.7142
                height:parent.height/2.2
                anchors.top:parent.top;anchors.topMargin: 10
                anchors.left:breathrect.right
                RadialGradient {
                    anchors.fill: parent
                    gradient: Gradient {
                        GradientStop { position: 0.0; color: "#89AAD3" }
                        GradientStop { position: 0.4; color: "black" }
                    }
                }
                Text {
                    anchors.top: parent.top;anchors.topMargin: -6
                    anchors.horizontalCenter: parent.horizontalCenter
                    id: spontbrmtext
                    text: qsTr("Spont BR")
                    color:"white"
                    font.bold: true
                    font.pointSize: parent.width*0.1
                }
                Text {
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    id: spontbrmvalue
                    text: qsTr("0")
                    color:"white"
                    font.bold: true
                    font.pointSize: parent.width*0.2
                }
                Text {
                    anchors.bottom: parent.bottom;anchors.bottomMargin: 5
                    anchors.horizontalCenter: parent.horizontalCenter
                    id: spontbrmtype
                    text: qsTr("%")
                    color:"white"
                    font.bold: true
                    font.pointSize: parent.width*0.08
                }
            }
            Rectangle{
                id:tvrect
                width:parent.width/5.7142
                height:parent.height/2.2
                anchors.top:parent.top;anchors.topMargin: 10
                anchors.left:spontrect.right
                RadialGradient {
                    anchors.fill: parent
                    gradient: Gradient {
                        GradientStop { position: 0.0; color: "#89AAD3" }
                        GradientStop { position: 0.4; color: "black" }
                    }
                }
                Text {
                    anchors.top: parent.top;anchors.topMargin: -6
                    anchors.horizontalCenter: parent.horizontalCenter
                    id: tviemtext
                    text: qsTr("TV(i/e)")
                    color:"white"
                    font.bold: true
                    font.pointSize: parent.width*0.1
                }
                Text {
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    id: tviemvalue
                    text: qsTr("0")
                    color:"white"
                    font.bold: true
                    font.pointSize: parent.width*0.2
                }
                Text {
                    anchors.bottom: parent.bottom;anchors.bottomMargin: 5
                    anchors.horizontalCenter: parent.horizontalCenter
                    id: tviemtype
                    text: qsTr("mL")
                    color:"white"
                    font.bold: true
                    font.pointSize: parent.width*0.08
                }
            }
            Rectangle{
                id:fioRect
                width:parent.width/5.7142
                height:parent.height/2.2
                //color:"black"
                anchors.left:parent.left;anchors.leftMargin: parent.width/10
                anchors.top:parent.top;anchors.topMargin: itemid.height/2.8
                RadialGradient {
                    anchors.fill: parent
                    gradient: Gradient {
                        GradientStop { position: 0.0; color: "#89AAD3" }
                        GradientStop { position: 0.4; color: "black" }
                    }
                }
                Text {
                    anchors.top: parent.top;anchors.topMargin: -6
                    anchors.horizontalCenter: parent.horizontalCenter
                    id: fio2mtext
                    text: qsTr("FiO2")
                    color:"white"
                    font.bold: true
                    font.pointSize: parent.width*0.1
                }
                Text {
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    id: fio2mvalue
                    text: qsTr("0")
                    color:"white"
                    font.bold: true
                    font.pointSize: parent.width*0.2
                }
                Text {
                    anchors.bottom: parent.bottom;anchors.bottomMargin: 5
                    anchors.horizontalCenter: parent.horizontalCenter
                    id: fio2mtype
                    text: qsTr("%")
                    color:"white"
                    font.bold: true
                    font.pointSize: parent.width*0.08
                }

            }
            Rectangle{
                id:ieratiorect
                width:parent.width/5.7142
                height:parent.height/2.2
                //color:"yellow"
                anchors.left:fioRect.right
                anchors.top:parent.top;anchors.topMargin: itemid.height/2.8
                RadialGradient {
                    anchors.fill: parent
                    gradient: Gradient {
                        GradientStop { position: 0.0; color: "#89AAD3" }
                        GradientStop { position: 0.4; color: "black" }
                    }
                }
                Text {
                    anchors.top: parent.top;anchors.topMargin: -6
                    anchors.horizontalCenter: parent.horizontalCenter
                    id: ieratiomtext
                    text: qsTr("I:E Ratio")
                    color:"white"
                    font.bold: true
                    font.pointSize: parent.width*0.1
                }
                Text {
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    id: ieratiomvalue
                    text: qsTr("0:0")
                    color:"white"
                    font.bold: true
                    font.pointSize: parent.width*0.2
                }

            }
            Rectangle{
                id:spo2rect
                width:parent.width/5.7142
                height:parent.height/2.2
                // color:"black"
                anchors.left:ieratiorect.right
                anchors.top:parent.top;anchors.topMargin: itemid.height/2.8
                RadialGradient {
                    anchors.fill: parent
                    gradient: Gradient {
                        GradientStop { position: 0.0; color: "#89AAD3" }
                        GradientStop { position: 0.4; color: "black" }
                    }
                }
                Text {
                    anchors.top: parent.top;anchors.topMargin: -6
                    anchors.horizontalCenter: parent.horizontalCenter
                    id: spo2hrmtext
                    text: qsTr("SpO2/HR")
                    color:"white"
                    font.bold: true
                    font.pointSize: parent.width*0.1
                }
                Text {
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    id: spo2hrmvalue
                    text: qsTr("__/__")
                    color:"white"
                    font.bold: true
                    font.pointSize: parent.width*0.1
                }
                Text {
                    anchors.bottom: parent.bottom;anchors.bottomMargin: 5
                    anchors.horizontalCenter: parent.horizontalCenter
                    id: spo2hrmtype
                    text: qsTr("%")
                    color:"white"
                    font.bold: true
                    font.pointSize: parent.width*0.08
                }
            }
            Rectangle{
                id:minuteVolrect
                width:parent.width/5.7142
                height:parent.height/2.2
                //color:"green"
                anchors.left:spo2rect.right
                //anchors.bottom: parent.bottom
                anchors.top:parent.top;anchors.topMargin: itemid.height/2.8
                RadialGradient {
                    anchors.fill: parent
                    gradient: Gradient {
                        GradientStop { position: 0.0; color: "#89AAD3" }
                        GradientStop { position: 0.4; color: "black" }
                    }
                }
                Text {
                    anchors.top: parent.top;anchors.topMargin: -6
                    anchors.horizontalCenter: parent.horizontalCenter
                    id: minutevolmtext
                    text: qsTr("Minute Vol")
                    color:"white"
                    font.bold: true
                    font.pointSize: parent.width*0.1
                }
                Text {
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    id: minutevolmvalue
                    text: qsTr("0")
                    color:"white"
                    font.bold: true
                    font.pointSize: parent.width*0.2
                }
                Text {
                    anchors.bottom: parent.bottom;anchors.bottomMargin: 5
                    anchors.horizontalCenter: parent.horizontalCenter
                    id: minutevolmtype
                    text: qsTr("L")
                    color:"white"
                    font.bold: true
                    font.pointSize: parent.width*0.08
                }
            }
            Rectangle {
                anchors.right: parent.right;anchors.rightMargin: 40
                width: itemid.width / 6
                height: parent.height
                color: "black"

                Gauge {
                    minimumValue: 0
                    maximumValue: 60
                    tickmarkStepSize: 15
                    minorTickmarkCount: 1
                    font.pixelSize: 20
                    anchors.centerIn: parent
                    anchors.horizontalCenterOffset: -4
                    height:itemid.height/1.6
                    style: GaugeStyle {
                        valueBar: Rectangle {
                            color: "#e34c22"
                            implicitWidth: 28
                        }
                        foreground: null
                        tickmark: Item {
                            implicitWidth: 8
                            implicitHeight: 4

                            Rectangle {
                                x: control.tickmarkAlignment === Qt.AlignLeft || control.tickmarkAlignment === Qt.AlignTop ? parent.implicitWidth : -28
                                width: 50
                                height: parent.height
                                color: "#ffffff" // White color for tickmarks
                            }
                        }
                        minorTickmark: Item {
                            implicitWidth: 8
                            implicitHeight: 2

                            Rectangle {
                                x: control.tickmarkAlignment === Qt.AlignLeft || control.tickmarkAlignment === Qt.AlignTop ? parent.implicitWidth : -28
                                width: 28
                                height: parent.height
                                color: "#ffffff" // White color for minor tickmarks
                            }
                        }
                    }
                }
            }
        }
        /////////////////////////
        Rectangle{
            id:bottomrect
            anchors.bottom: parent.bottom
            width:parent.width
            height:parent.height/4
            color: "green"
            Rectangle{
                id:modeRect
                width:parent.width/6.666
                height:parent.height
                color:"#D1CD08"
                anchors.left:parent.left
                border.width:2
                border.color:"black"
                enabled: lockconfirm===true?false:true
                Text {
                    anchors.top: parent.top;anchors.topMargin: 10
                    anchors.horizontalCenter: parent.horizontalCenter
                    id: modetext
                    text: qsTr("Mode")
                    color:"white"
                    font.bold: true
                    font.pointSize: parent.width*0.12
                }
                Text {
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    id: modetypetext
                    text: qsTr("PCV")
                    color:"white"
                    font.bold: true
                    font.pointSize: parent.width*0.10
                }
                MouseArea{
                    anchors.fill:parent
                    onClicked:{
                        openmodepcv()

                    }
                }
            }
            Rectangle{
                id:insprect
                width:parent.width/7.2727
                height:parent.height
                color:"#89AAD3"
                anchors.left:modeRect.right
                border.width:2
                border.color:"black"
                enabled: lockconfirm===true?false:true
                Text {
                    anchors.top: parent.top;anchors.topMargin: 10
                    anchors.horizontalCenter: parent.horizontalCenter
                    id: inspsstext
                    text: qsTr("Insp ss")
                    color:"white"
                    font.bold: true
                    font.pointSize: parent.width*0.12
                }
                Text {
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    id: inspvaluetext
                    text: "15"
                    color:"white"
                    font.bold: true
                    font.pointSize: parent.width*0.2
                }
                Text {
                    anchors.bottom: parent.bottom;anchors.bottomMargin: 10
                    anchors.horizontalCenter: parent.horizontalCenter
                    id: insptypetext
                    text: qsTr("cmH2O")
                    color:"white"
                    font.bold: true
                    font.pointSize: parent.width*0.10
                }
                MouseArea{
                    anchors.fill:parent
                    onClicked: {
                        gotovaluepage()
                    }
                }
            }
            Rectangle{
                id:peeprect
                width:parent.width/7.2727
                height:parent.height
                color:"#89AAD3"
                anchors.left:insprect.right
                border.width:2
                border.color:"black"
                enabled: lockconfirm===true?false:true
                Text {
                    anchors.top: parent.top;anchors.topMargin: 10
                    anchors.horizontalCenter: parent.horizontalCenter
                    id: peeptext
                    text: qsTr("PEEP")
                    color:"white"
                    font.bold: true
                    font.pointSize: parent.width*0.12
                }
                Text {
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    id: peepvaluetext
                    text: qsTr("2")
                    color:"white"
                    font.bold: true
                    font.pointSize: parent.width*0.2
                }
                Text {
                    anchors.bottom: parent.bottom;anchors.bottomMargin: 10
                    anchors.horizontalCenter: parent.horizontalCenter
                    id: peeptypetext
                    text: qsTr("cmH2O")
                    color:"white"
                    font.bold: true
                    font.pointSize: parent.width*0.10
                }
            }
            Rectangle{
                id:bRaterect
                width:parent.width/7.2727
                height:parent.height
                color:"#89AAD3"
                anchors.left:peeprect.right
                border.width:2
                border.color:"black"
                enabled: lockconfirm===true?false:true
                Text {
                    anchors.top: parent.top;anchors.topMargin: 10
                    anchors.horizontalCenter: parent.horizontalCenter
                    id: bratetext
                    text: qsTr("B. Rate")
                    color:"white"
                    font.bold: true
                    font.pointSize: parent.width*0.12
                }
                Text {
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    id: bratevaluetext
                    text: qsTr("12")
                    color:"white"
                    font.bold: true
                    font.pointSize: parent.width*0.2
                }
                Text {
                    anchors.bottom: parent.bottom;anchors.bottomMargin: 10
                    anchors.horizontalCenter: parent.horizontalCenter
                    id: bratetypetext
                    text: qsTr("BPM")
                    color:"white"
                    font.bold: true
                    font.pointSize: parent.width*0.10
                }
            }
            Rectangle{
                id:inspTimeRect
                width:parent.width/7.2727
                height:parent.height
                color:"#89AAD3"
                anchors.right:lockrect.left
                border.width:2
                border.color:"black"
                enabled: lockconfirm===true?false:true
                Text {
                    anchors.top: parent.top;anchors.topMargin: 10
                    anchors.horizontalCenter: parent.horizontalCenter
                    id: inspss2text
                    text: qsTr("Insp. Time")
                    color:"white"
                    font.bold: true
                    font.pointSize: parent.width*0.12
                }
                Text {
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    id: inspvalue2text
                    text: qsTr("1.5")
                    color:"white"
                    font.bold: true
                    font.pointSize: parent.width*0.2
                }
                Text {
                    anchors.bottom: parent.bottom;anchors.bottomMargin: 10
                    anchors.horizontalCenter: parent.horizontalCenter
                    id: insptype2text
                    text: qsTr("sec")
                    color:"white"
                    font.bold: true
                    font.pointSize: parent.width*0.10
                }
            }
            Rectangle {
                id: lockrect
                width: parent.width / 7.2727
                height: parent.height
                color: "white"
                anchors.right: playrect.left
                border.width: 2
                border.color: "black"
                enabled: true
                Image {
                    id: lockImage
                    width: parent.width * 0.8
                    height: parent.height * 0.8
                    anchors.centerIn: parent
                    fillMode: Image.PreserveAspectFit
                    source: lockconfirm===false ? "file:///C:/Users/Abhi/Desktop/lock.png" : "file:///C:/Users/Abhi/Desktop/locked.png"
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        if (toprect.enabled===true) {
                            gotopopuplock()

                        } else {
                            gotopopupunlock()
                            lockconfirm = false

                        }
                    }
                }
            }
            Rectangle{
                id:playrect
                width:parent.width/6.1538
                height:parent.height
                color:"white"
                anchors.right:parent.right
                border.width:2
                border.color:"black"
                enabled: lockconfirm===true?false:true
                Image {
                    width:parent.width*0.8
                    height:parent.height*0.8
                    source: "file:///C:/Users/Abhi/Desktop/play.png"
                    anchors.centerIn: parent
                    fillMode: Image.PreserveAspectFit
                }
            }
        }
    }
}



