import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    id:mainwindowid
    width: 1000
    height: 500
    visible: true
    title: qsTr("Hello World")

    Open_screen{
        id:openscreenid
        onOpenmodepcv: {
            modepcvid.visible=true
            modepcvid.enabled=true
        }
        onGotopopuplock: {
            openscreenid.visible=false
            openscreenid.enabled=false
            popuplockid.visible=true
            popuplockid.enabled=true
        }
        onGotopopupunlock: {
            openscreenid.visible=false
            openscreenid.enabled=false
            popupunlockid.visible=true
            popupunlockid.enabled=true
        }
        onGotocalibrationpopup: {
            popUpCalibrationid.visible=true
            popUpCalibrationid.enabled=true
        }
        onGotovaluepage: {
            valuepageid.visible=true
            valuepageid.enabled=true
            openscreenid.visible=false
            openscreenid.enabled=false
        }

    }
    Modepcv{
        id:modepcvid
        visible:false
        onGotoopenscreen:{
            modepcvid.visible=false
            modepcvid.enabled=false
            openscreenid.visible=true
            openscreenid.enabled=true
        }
    }
    PopUp_Lock{
        id:popuplockid
        visible:false
        onGotoopenscreen: {
            openscreenid.visible=true
            openscreenid.enabled=true
            popuplockid.visible=false
            popuplockid.enabled=false
        }
    }
    PopUp_Unlock{
        id:popupunlockid
        visible:false
        onGotoopenscreen: {
            openscreenid.visible=true
            openscreenid.enabled=true
            popupunlockid.visible=false
            popupunlockid.enabled=false
        }
    }
    PopUp_Calibration{
        id:popUpCalibrationid
        visible:false
        onGotoopenscreen: {
            openscreenid.visible=true
            openscreenid.enabled=true
            popUpCalibrationid.visible=false
            popUpCalibrationid.enabled=false
        }

    }
    Value_page{
        id:valuepageid
        visible:false
        onGotoopenscreen:{
            openscreenid.visible=true
            openscreenid.enabled=true
        }
    }
    Bottom_components{
        id:bottomcomponentsid
        visible:false

        onOpenmodepcv: {
            modepcvid.visible=true
            modepcvid.enabled=true
        }
        onGotopopuplock: {
            bottomcomponentsid.visible=false
            bottomcomponentsid.enabled=false
            popuplockid.visible=true
            popuplockid.enabled=true
        }
        onGotopopupunlock: {
            bottomcomponentsid.visible=false
            bottomcomponentsid.enabled=false
            popupunlockid.visible=true
            popupunlockid.enabled=true
        }
        onGotovaluepage: {
            valuepageid.visible=true
            valuepageid.enabled=true
            bottomcomponentsid.visible=false
            bottomcomponentsid.enabled=false
        }

    }

    Component.onCompleted:{
        popuplockid.gotoopenscreenlock.connect(openscreenid.unlockscreen)
        popupunlockid.gotoopenscreenlock.connect(openscreenid.unlockscreenoncancel)
        openscreenid.gotovaluepage.connect(valuepageid.openvaluedrawer)
        popuplockid.gotoopenscreenlock.connect(bottomcomponentsid.unlockscreen)
        popupunlockid.gotoopenscreenlock.connect(bottomcomponentsid.unlockscreenoncancel)
        bottomcomponentsid.gotovaluepage.connect(valuepageid.openvaluedrawer)
    }

}
