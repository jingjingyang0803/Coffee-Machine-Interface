import QtQuick 2.15
import QtQuick.Controls 2.15

Rectangle {
    width: 110
    height: 140
    radius: 20

    color: "#795548"

    property alias imageSource: clickableImage.source
    property alias description: description.text

    signal imageClicked(string coffeeName)

    Column {
        width: parent.width*0.8
        height: parent.height*0.8
        anchors.centerIn: parent

        Image {
            id: clickableImage
            source: "images/espresso.png"
            width: parent.width
            fillMode: Image.PreserveAspectFit
        }

        Text {
            id: description
            text: "Espresso"
            color: "#D7CCC8"
            font.pixelSize: 20
            width: parent.width
            horizontalAlignment: Text.AlignHCenter
        }
    }

    MouseArea {
        anchors.fill: parent
        onClicked: {
            console.log("Image of " + description.text + " clicked!")
            parent.imageClicked(description.text);
        }
    }
}
