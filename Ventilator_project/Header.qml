import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Styles 1.4
import QtQuick.Extras 1.4
import QtGraphicalEffects 1.12
import QtQuick.Controls 1.4
import QtQuick 2.2
import QtQuick.Layouts 1.15
import com.ventilatorproject.database 1.0
Item {
    id:itemid
    width: mainwindowid.width
    height: mainwindowid.height
    signal gotograph()
    signal gotoopenscreendbdata(string profileName)
    property bool checkalarmtimer: true
    signal shownotifications()
    signal sendcurrentindexval(string profileName)
    property int countDownValue: 5
    Database {
        id: db
    }
    onVisibleChanged: {
        mannualComboBox.model=db.getPNames()
        // mannualComboBox.currentText="default"
    }
    // function appendvalue(name){
    //     mannualComboBox.model=db.getPNames()
    //     openscreenid.visible=true
    //     openscreenid.enabled=true
    //     saveprofileid.visible=false
    //     saveprofileid.enabled=false
    // }
    // function deletevalue(val){
    //     mannualComboBox.model=db.getPNames()
    //     openscreenid.visible=true
    //     openscreenid.enabled=true
    //     saveprofileid.visible=false
    //     saveprofileid.enabled=false
    // }

    Rectangle{
        id:toprect
        width:parent.width
        height:parent.height/10
        anchors.top:parent.top
        color:"black"

        Rectangle {
            id: defaultRect
            width: parent.width / 4.8484
            height: parent.height
            color: "transparent"
            anchors.left: parent.left

            ComboBox{
                id: mannualComboBox
                width: parent.width
                height: parent.height
                model:db.getPNames()
                onCurrentIndexChanged: {
                    gotoopenscreendbdata(currentText)
                    sendcurrentindexval(currentText)
                }
                style: ComboBoxStyle {
                    textColor: "white"
                    background: Rectangle {
                        color: "transparent"
                    }
                }
                Rectangle {
                    width: 20
                    height: mannualComboBox.height
                    color: "transparent"
                    anchors.right: parent.right;anchors.rightMargin: 10
                    Text {
                        anchors.verticalCenter: parent.verticalCenter
                        text: "\u25BD" // Hexadecimal Unicode escape sequence
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
            color:"transparent"
            anchors.left:defaultRect.right
            Rectangle {
                id: notificationrect
                width: parent.width / 4
                height: parent.height
                radius: 50
                color: "#89AAD3"
                anchors.left: parent.left
                anchors.verticalCenter: parent.verticalCenter

                Image {
                    id: firstImage
                    width: parent.width * 0.6
                    height: parent.height * 0.6
                    anchors.left: parent.left
                    source: "file:///C:/Users/Abhi/Desktop/notification.png"
                    anchors.verticalCenter: parent.verticalCenter
                    fillMode: Image.PreserveAspectFit // Preserve the aspect ratio while fitting inside the rectangle

                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            if(checkalarmtimer===true||countdowntext.visible === false){
                                secondImage.visible = true;
                                timer.start();
                                countDownValue = 5;
                                countdowntext.visible = true;
                                checkalarmtimer=false
                            }else{
                                secondImage.visible = false;
                                countdowntext.visible = false;
                                checkalarmtimer=true
                            }
                        }
                    }

                    Text {
                        id: countdowntext
                        text: countDownValue.toString()
                        color: "orange"
                        visible: false // Initially hidden
                        font.pointSize: parent.width * 0.3
                        anchors.bottom: parent.bottom
                    }


                    Timer {
                        id: timer
                        interval: 1000
                        repeat: true
                        running: false
                        onTriggered: {
                            if (countDownValue === 0||countdowntext.visible === false) {
                                timer.stop();
                                secondImage.visible = false;
                                countdowntext.visible = false;
                                countDownValue=5
                                countdowntext.text = countDownValue.toString();
                            } else {
                                countDownValue--;
                                countdowntext.text = countDownValue.toString(); // Update countdown text

                            }
                        }
                    }
                }

                Image {
                    id: secondImage
                    width: parent.width * 0.6
                    height: parent.height * 0.6
                    anchors.left: parent.left
                    source: "file:///C:/Users/Abhi/Desktop/redline.png"
                    anchors.verticalCenter: parent.verticalCenter
                    fillMode: Image.PreserveAspectFit // Preserve the aspect ratio while fitting inside the rectangle
                    visible: false // Initially hidden
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
                MouseArea{
                    anchors.fill:parent
                    onClicked: {
                        slideid.visible=true
                        slideid.enabled=true
                        //openscreenid.visible=false
                        openscreenid.enabled=false
                    }
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
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        console.log("shownotificationsignal")
                        shownotifications()
                    }
                }
            }

        }

        Rectangle {
            id: homerect
            width: parent.width / 7
            height: parent.height
            color: "transparent"
            anchors.left: alarmrect.right

            Text {
                id: graphtext
                text: qsTr("Graph Mode")
                anchors.centerIn: parent
                color:"white"
                font.bold: true
                font.pointSize: parent.width*0.08
            }
            MouseArea{
                anchors.fill:parent
                onClicked: {
                    //openscreenid.visible=false
                    openscreenid.enabled=false
                    graphid.enabled=true
                    graphid.visible=true
                }
            }
        }

        Rectangle{
            id:timerect
            width:parent.width/4.5
            height:parent.height
            color:"transparent"
            anchors.left:homerect.right;
            Image {
                id:img1
                width:parent.width*0.2
                height:parent.height+5
                anchors.verticalCenter: parent.verticalCenter
                source: "file:///C:/Users/Abhi/Desktop/thunder.png"
                anchors.left: parent.left;// Ensure the image fills the entire rectangle
                //fillMode: Image.PreserveAspectFit // Preserve the aspect ratio while fitting inside the rectangle
                rotation: 120
            }
            Image {
                id:img2
                width:parent.width*0.3
                height:parent.height
                anchors.verticalCenter: parent.verticalCenter
                source: "file:///C:/Users/Abhi/Desktop/wifi.png"
                anchors.left: img1.right;// Ensure the image fills the entire rectangle
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
}

