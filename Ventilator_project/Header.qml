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
}

