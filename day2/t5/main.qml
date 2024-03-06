import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    id:abc
    width: 1000
    height: 800
    visible: true
    title: qsTr("Hello World")
    property bool isvisible: true
    property bool editablei : false
    property bool editablej : false
    property bool editablek : false
    property bool editablel : false
    Row{
        id:a1
        anchors.centerIn: parent
        spacing: 10
        Image {
            id: im1
            width: abc.width/6
            height: abc.height/8
            source: "file:///C:/Users/Abhi/Pictures/Saved Pictures/wallpaper.png"
            enabled:  isvisible
            opacity: 0.5

            Rectangle{
                id:im1r
                color: "transparent"
                width: abc.width/5.8
                height: abc.height/7.8
                anchors.centerIn: parent
            }

            MouseArea{
                anchors.fill: parent
                onClicked: {
                    editablei= true;
                    editablej= false;
                    editablek= false;
                    editablel= false;
                    im1r.border.color="black"
                    im2r.border.color="transparent"
                    im3r.border.color="transparent"
                    im4r.border.color="transparent"
                    if(im1.opacity!=0){
                        im1.opacity=1;
                        im2.opacity=0.5;
                        im3.opacity=0.5;
                        im4.opacity=0.5;
                    }

                    im2.enabled = Qt.binding(function() {
                        return (im2.enabled === isvisible) ? !isvisible : isvisible;
                    });

                    im3.enabled = Qt.binding(function() {
                        return (im3.enabled === isvisible) ? !isvisible : isvisible;
                    });

                    im4.enabled = Qt.binding(function() {
                        return (im4.enabled === isvisible) ? !isvisible : isvisible;
                    });

                    im1.enabled=isvisible;
                }
            }



                Rectangle {

                    width: parent.width/8
                    height: parent.height/5
                    color: "blue"
                    anchors.left: parent.left
                    anchors.bottom: parent.bottom
                    opacity: 1
                    anchors.bottomMargin: 10


                    Text {
                        text: "+"
                        font.pointSize: 12
                    }
                    MouseArea{
                        anchors.fill:parent
                        onClicked: {
                            im1.opacity=im1.opacity+0.2;
                        }
                    }
                }

                Rectangle {
                    width: parent.width/8
                    height: parent.height/5
                    color: "blue"
                    anchors.right: parent.right
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 10
                    Text {
                        text: "-"
                        font.pointSize: 12
                    }
                    MouseArea{
                        anchors.fill:parent
                        onClicked: {
                            im1.opacity=im1.opacity-0.2;
                        }
                    }
                }

        }

        Image {
            id: im2
            width: abc.width/6
            height: abc.height/8
            source: "images/wallpaper.png"
            visible: isvisible
            opacity: 0.5
            Rectangle {
                id:im2r
                width: abc.width/5.8
                height: abc.height/7.8
                anchors.centerIn: parent
                color: "transparent"
            }
            MouseArea{

                anchors.fill: parent
                onClicked: {
                    editablej= true;
                    editablei= false;
                    editablek= false;
                    editablel= false;
                    im2r.border.color="black"
                    im1r.border.color="transparent"
                    im3r.border.color="transparent"
                    im4r.border.color="transparent"
                    if(im2.opacity!=0){
                        im2.opacity=1;
                        im1.opacity=0.5;
                        im3.opacity=0.5;
                        im4.opacity=0.5;
                    }
                    im1.enabled = Qt.binding(function() {
                        return (im1.enabled === isvisible) ? !isvisible : isvisible;
                    });

                    im3.enabled = Qt.binding(function() {
                        return (im3.enabled === isvisible) ? !isvisible : isvisible;
                    });

                    im4.enabled = Qt.binding(function() {
                        return (im4.enabled === isvisible) ? !isvisible : isvisible;
                    });

                    im2.enabled=isvisible;
                }
            }

                Rectangle {
                    width: parent.width/8
                    height: parent.height/5
                    color: "blue"
                    anchors.left: parent.left
                    anchors.bottom: parent.bottom
                    opacity: 1
                    anchors.bottomMargin: 10

                    Text {
                        text: "+"
                        font.pointSize: 12
                    }
                    MouseArea{
                        anchors.fill:parent
                        onClicked: {
                            im2.opacity=im2.opacity+0.2;
                        }
                    }
                }

                Rectangle {
                    width: parent.width/8
                    height: parent.height/5
                    color: "blue"
                    anchors.right: parent.right
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 10

                    Text {
                        text: "-"
                        font.pointSize: 12
                    }
                    MouseArea{
                        anchors.fill:parent
                        onClicked: {
                            im2.opacity=im2.opacity-0.2;
                        }
                    }
                }

        }
        Image {
            id: im3
            width: abc.width/6
            height: abc.height/8
            source: "/images/wallpaper.png"
            visible: isvisible
            opacity: 0.5
            Rectangle {
                id:im3r
                width: abc.width/5.8
                height: abc.height/7.8
                anchors.centerIn: parent
                color: "transparent"
            }
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    editablek= true;
                    editablej= false;
                    editablei= false;
                    editablel= false;
                    im3r.border.color="black"
                    im2r.border.color="transparent"
                    im1r.border.color="transparent"
                    im4r.border.color="transparent"
                    if(im3.opacity!=0){
                        im3.opacity=1;
                        im2.opacity=0.5;
                        im1.opacity=0.5;
                        im4.opacity=0.5;
                    }
                    im2.enabled = Qt.binding(function() {
                        return (im2.enabled === isvisible) ? !isvisible : isvisible;
                    });

                    im1.enabled = Qt.binding(function() {
                        return (im1.enabled === isvisible) ? !isvisible : isvisible;
                    });

                    im4.enabled = Qt.binding(function() {
                        return (im4.enabled === isvisible) ? !isvisible : isvisible;
                    });

                    im3.enabled=isvisible;
                }
            }

                Rectangle {
                    width: parent.width/8
                    height: parent.height/5
                    color: "blue"
                    anchors.left: parent.left
                    anchors.bottom: parent.bottom
                    opacity: 1
                    anchors.bottomMargin: 10

                    Text {
                        text: "+"
                        font.pointSize: 12
                    }
                    MouseArea{
                        anchors.fill:parent
                        onClicked: {
                            im3.opacity=im3.opacity+0.2;
                        }
                    }
                }

                Rectangle {
                    width: parent.width/8
                    height: parent.height/5
                    color: "blue"
                    anchors.right: parent.right
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 10

                    Text {
                        text: "-"
                        font.pointSize: 12
                    }
                    MouseArea{
                        anchors.fill:parent
                        onClicked: {
                            im3.opacity=im3.opacity-0.2;
                        }
                    }
                }

        }
        Image {
            id: im4
            width: abc.width/6
            height: abc.height/8
            source: "data:image/jpeg;base64,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"
            visible: isvisible
            opacity: 0.5
            Rectangle {
                id:im4r
                width: abc.width/5.8
                height: abc.height/7.8
                anchors.centerIn: parent
                color: "transparent"
            }
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    editablel= true;
                    editablej= false;
                    editablek= false;
                    editablei= false;
                    im4r.border.color="black"
                    im2r.border.color="transparent"
                    im3r.border.color="transparent"
                    im1r.border.color="transparent"
                    if(im4.opacity!=0){
                        im4.opacity=1;
                        im2.opacity=0.5;
                        im3.opacity=0.5;
                        im1.opacity=0.5;
                    }
                    im2.enabled = Qt.binding(function() {
                        return (im2.enabled === isvisible) ? !isvisible : isvisible;
                    });

                    im3.enabled = Qt.binding(function() {
                        return (im3.enabled === isvisible) ? !isvisible : isvisible;
                    });

                    im1.enabled = Qt.binding(function() {
                        return (im1.enabled === isvisible) ? !isvisible : isvisible;
                    });

                    im4.opacity=1;
                }
            }
                Rectangle {

                    width: parent.width/8
                    height: parent.height/5
                    color: "blue"
                    anchors.left: parent.left
                    anchors.bottom: parent.bottom
                    opacity: 1
                    anchors.bottomMargin: 10

                    Text {
                        text: "+"
                        font.pointSize: 12
                    }
                    MouseArea{
                        anchors.fill:parent
                        onClicked: {
                            im4.opacity=im4.opacity+0.2;
                        }
                    }
                }

                Rectangle {
                    width: parent.width/8
                    height: parent.height/5
                    color: "blue"
                    anchors.right: parent.right
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 10

                    Text {
                        text: "-"
                        font.pointSize: 12
                    }
                    MouseArea{
                        anchors.fill:parent
                        onClicked: {
                            im4.opacity=im4.opacity-0.2;
                        }
                    }
                }

        }
    }
    Row{
        //anchors.centerIn: parent
        anchors.top: a1.bottom
        anchors.bottom: abc.bottom
        anchors.margins: abc.width/50
        spacing: abc.width/100
        x:abc.width/2.3
        Rectangle {
            width:abc.width/15
            height:abc.height/20
            color:"green"

            Text{
                anchors.centerIn: parent
                text:"OP+"
            }
            MouseArea{
                anchors.fill:parent
                onClicked: {
                    if(editablei===true&&im1r.opacity>=0.4){
                            im1.opacity=im1.opacity+0.2;
                    }
                    if(editablej===true&&im2r.opacity>=0.4){
                            im2.opacity=im2.opacity+0.2;
                    }
                    if(editablek===true&&im3r.opacity>=0.4){
                            im3.opacity=im3.opacity+0.2;
                    }
                    if(editablel===true&&im4r.opacity>=0.4){
                            im4.opacity=im4.opacity+0.2;
                    }
                }
            }
        }
        Rectangle {
            width:abc.width/15
            height:abc.height/20
            color:"red"
            Text{
                anchors.centerIn: parent

                text:"OP-"
            }
            MouseArea{
                anchors.fill:parent
                onClicked: {
                    if(editablei===true&&im1r.opacity>=0.4){
                            im1.opacity=im1.opacity-0.2;
                    }
                    if(editablej===true&&im2r.opacity>=0.4){
                            im2.opacity=im2.opacity-0.2;
                    }
                    if(editablek===true&&im3r.opacity>=0.4){
                            im3.opacity=im3.opacity-0.2;
                    }
                    if(editablel===true&&im4r.opacity>=0.4){
                            im4.opacity=im4.opacity-0.2;
                    }
                }
            }
        }
    }
}
//opacity limit0.1
//border barbeku amele + -
