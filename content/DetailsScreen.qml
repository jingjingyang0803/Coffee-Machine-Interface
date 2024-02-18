import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts

Item {
    visible: true
    width: 640
    height: 350

    Image {
        id: clickableImage
        source: "images/coffee_break.png"
        width: parent.width
        fillMode: Image.PreserveAspectFit
    }

    Column {
        spacing: 20
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        anchors.leftMargin: 50

        Column {
            // Coffee Temperature Selection
            Label {
                id: temperatureLabel
                font.pixelSize: 20
                text: "Temperature: " + temperature.value + "°C"
                color: "#353637"
                anchors.left: parent.left
                anchors.leftMargin: 5
            }
            Slider {
                id: temperature
                width: 200
                from: 0
                to: 100
                stepSize: 1
                value: 95  // Set initial value
                onValueChanged: {
                    temperatureLabel.text = "Temperature: " + value + "°C"
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

            // Back Button
            Button {
                id: backButton
                text: "Back"
                font.pixelSize: 22

                onClicked: {
                }

                // Customizing the button appearance
                background: Rectangle {
                    color: "#79B82B"
                    radius: 10 // Corner radius
                }
            }

            // Confirm Button
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
