import QtQuick 2.15
import QtQuick.Controls 2.15

// Define a custom rectangle component
Rectangle {
    width: 110
    height: 140
    radius: 20

    color: "#BD8769"

    // Declare properties that can be bound to external values
    property alias imageSource: clickableImage.source
    property alias description: description.text

    // Declare a custom signal that will be emitted when the image is clicked
    signal imageClicked(string coffeeName)

    // Column layout for the image and text
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
            color: "white"
            font.pixelSize: 20
            width: parent.width
            horizontalAlignment: Text.AlignHCenter
        }
    }

    // Mouse area to detect clicks
    MouseArea {
        anchors.fill: parent
        onClicked: {
            console.log("Image of " + description.text + " clicked!")

            // Emit the custom signal with the description text
            parent.imageClicked(description.text);
        }
    }
}
