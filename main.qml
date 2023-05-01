import QtQuick 2.12
import QtMultimedia 5.12
import QtQuick.Dialogs 1.3
import QtQuick.Window 2.15

Window {
    width: 640
    height: 480
    visible:true

    property FileDialog fileDialog: FileDialog {}

    MediaPlayer {
        id: mediaPlayer
        autoPlay: false
    }

    VideoOutput {
        id: videoOutput
        anchors.fill: parent
        source: mediaPlayer
    }

    Rectangle {
        id: playPauseButton
        width: 40
        height: 40
        radius: 20
        color: "white"
        border.color: "black"
        border.width: 2
        anchors.right: parent.right
        anchors.bottom: parent.bottom

        Text {
            id:playPauseText
            text: mediaPlayer.playbackState === MediaPlayer.PlayingState ? "Pause" : "Play"
            anchors.centerIn: parent
        }

        MouseArea {
            anchors.fill: parent
            onClicked: {
                console.log("Clicked ...")
                if (mediaPlayer.playbackState === MediaPlayer.PlayingState) {
                    mediaPlayer.pause()
                    playPauseText = "Play"
                } else {
                    mediaPlayer.play()
                    playPauseText = "Pause"
                }
            }
        }
    }

    Rectangle {
        id: progressSlider
        width: parent.width - 40
        height: 10
        color: "gray"
        anchors.bottom: parent.bottom
        anchors.bottomMargin:4

        Rectangle {
            id: progressHandle
            width: 20
            height: 20
            color: "white"
            radius: 10
            x: (progressSlider.width - progressHandle.width) * (mediaPlayer.position / mediaPlayer.duration)
            y: (progressSlider.height - progressHandle.height) / 2

            MouseArea {
                anchors.fill: parent
                drag.target: progressHandle
                drag.axis: Drag.XAxis
                drag.minimumX: 0
                drag.maximumX: progressSlider.width - progressHandle.width
                onPositionChanged: {
                    mediaPlayer.position = (progressHandle.x / (progressSlider.width - progressHandle.width)) * mediaPlayer.duration
                }
            }
        }

        MouseArea {
            anchors.fill: parent
            onClicked: {
                var handleX = mouse.x - progressHandle.width / 2
                if (handleX < 0) {
                    handleX = 0
                } else if (handleX > progressSlider.width - progressHandle.width) {
                    handleX = progressSlider.width - progressHandle.width
                }
                progressHandle.x = handleX
                mediaPlayer.position = (progressHandle.x / (progressSlider.width - progressHandle.width)) * mediaPlayer.duration
            }
        }
    }

    FileDialog {
        id: fileDialog
        selectExisting: true
        nameFilters: ["Video files (*.mp4 *.avi)"]
        onAccepted: {
            mediaPlayer.source = fileUrl
            mediaPlayer.play()
            console.log("File selected for mediaPlayer : "+mediaPlayer.source)
        }
    }

    Rectangle {
        id: fileDialogButton
        width: 100
        height: 40
        anchors.right: parent.right
        anchors.rightMargin:4
        radius: 20
        color: "white"
        border.color: "black"
        border.width: 2

        Text {
            text: "Open file"
            anchors.centerIn: parent
        }

        MouseArea {
            anchors.fill: parent
            onClicked: {
                fileDialog.open()
            }
        }
    }
}
