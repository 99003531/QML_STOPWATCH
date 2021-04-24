import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import ch.epfl.stopwatch 1.0

ApplicationWindow {
    id: root
    visible: true
    width: 640
    height: 480
    title: qsTr("Stopwatch")
    color:"black"



    Stopwatch {
        id: stopwatch
    }

    Row {
        anchors.top: parent.top
        anchors.topMargin: 230
        anchors.horizontalCenterOffset: 0
        anchors.horizontalCenter: parent.horizontalCenter
        spacing: 3
        Button {
            id: startButton
            text: "Start"
           // enabled:true//

            onClicked:{
                console.log("Start");
                pauseButton.enabled=true

                stopwatch.start();
                if(stopwatch.start===false)
                {
                    startButton.text=qsTr("Pause")
                    stopwatch.start=true
                }
                else
                {
                    startButton.text=qsTr("Resume")
                    stopwatch.start===false
                }
            }
        }
        Button {
            id: pauseButton
            text: "Pause"
            enabled:false
            onClicked: {

                stopwatch.stop();
            }
        }

        Button {
            id: cancelButton;
            text : "cancel"
            onClicked: {

                cancelButton.enabled=true

                stopwatch.reset();
                if(stopwatch.start===false)
                {
                    startButton.text=qsTr("cancel")
                    stopwatch.start===true
                }
                else
                {
                    startButton.text=qsTr("Start")
                    stopwatch.start===false
                 }
               }

            }

       Button {
            id: markButton
            text: "Mark"
            onClicked: {
                console.log(stopwatch.display)
            }
        }
}
    Text {
        anchors.verticalCenterOffset: -80
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        text: "Current time"
        font.bold: true
        font.family: "Arial"
    }
    Text {
        id: userDisplay
        width: 155
        height: 41
        text : stopwatch.display
        //anchors.verticalCenterOffset: -50
        anchors.horizontalCenterOffset: -30
        font.pointSize: 50
        color: "white"
        font.bold: true
        //anchors.top:parent.top
        anchors.topMargin: 2
        font.family: "Arial"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        anchors.top:parent.top
    }

 }


