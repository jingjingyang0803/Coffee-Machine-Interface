import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts

Item {
    visible: true
    width: 640
    height: 350

    property var stackView: null

    Image {
        id: backgroundImage
        source: "images/coffee_break.png"
        width: parent.width
        fillMode: Image.PreserveAspectFit // Keep the aspect ratio of the image
    }

    // Main column layout for the interface elements
    Column {
        spacing: 20
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        anchors.leftMargin: 50

        // Sub-column for coffee temperature selection
        Column {
            // Label displaying the selected temperature
            Label {
                id: temperatureLabel
                font.pixelSize: 20
                text: "Temperature: " + temperature.value + "°C"
                color: "#353637"
                anchors.left: parent.left
                anchors.leftMargin: 5
            }

            // Slider for selecting the coffee temperature
            Slider {
                id: temperature
                width: 200 // Set width
                from: 0 // Minimum temperature value
                to: 100 // Maximum temperature value
                stepSize: 1 // Increment step
                value: 95  // Set initial value
                onValueChanged: {
                    temperatureLabel.text = "Temperature: " + value + "°C" // Update label text on value change
                }
            }
        }


        // Size selection using Radio Buttons
        Column {
            RadioButton { id: smallSize; text: "Small (240 ml)"; font.pixelSize: 20; checked: true }
            RadioButton { id: mediumSize; text: "Medium (355 ml)"; font.pixelSize: 20 }
            RadioButton { id: largeSize; text: "Large (475 ml)"; font.pixelSize: 20 }
        }

        Row {
            spacing: 20
            anchors.left: parent.left
            anchors.leftMargin: 10

            // Back button to return to the previous screen
            Button {
                id: backButton
                text: "Back"
                font.pixelSize: 22

                onClicked: {
                    stackView.pop(); // Pop the current view from the stack view
                }

                // Customizing the button appearance
                background: Rectangle {
                    color: "#79B82B"
                    radius: 10 // Corner radius
                }
            }

            // Confirm button to finalize the selection
            Button {
                text: "Confirm"
                font.pixelSize: 22

                onClicked: {
                    // Logic to handle the selection
                    console.log(temperatureLabel.text)

                    var selectedSize = "";
                    if (smallSize.checked) {
                        selectedSize = "Small";
                    } else if (mediumSize.checked) {
                        selectedSize = "Medium";
                    } else if (largeSize.checked) {
                        selectedSize = "Large";
                    }

                    console.log("Selected size: " + selectedSize);

                    // Push ProcessingScreen and pass the stackView
                    stackView.push(Qt.resolvedUrl("ProcessingScreen.qml"), {"stackView": stackView});
                }

                // Customizing the button appearance
                background: Rectangle {
                    color: "#79B82B"
                    radius: 10 // Corner radius
                }
            }
        }
    }
}
