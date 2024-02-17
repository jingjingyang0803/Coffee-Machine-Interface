import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
    width: 100
    height: 130

    property alias imageSource: clickableImage.source
    property alias description: description.text

    signal imageClicked()

    Column {
        width: parent.width
        height: parent.height

        Image {
            id: clickableImage
            source: "images/espresso.png"
            width: parent.width
            fillMode: Image.PreserveAspectFit
        }

        Text {
            id: description
            text: "Espresso"
            font.pixelSize: 20
            width: parent.width
            horizontalAlignment: Text.AlignHCenter
        }
    }

    MouseArea {
        anchors.fill: parent
        onClicked: {
            console.log("Image clicked!")
            parent.imageClicked();
        }
    }
}
