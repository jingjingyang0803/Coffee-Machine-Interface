import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
    width: 640
    height: 350

    property var stackView: null // Property to hold a reference to the stackView

    // Background rectangle with a gradient
    Rectangle {
        anchors.fill: parent
        gradient: Gradient {
            GradientStop { position: 0.0; color: "#f5e0c3" } // Light creamy color
            GradientStop { position: 0.5; color: "#b08968" } // Medium coffee color
            GradientStop { position: 1.0; color: "#3b2b1e" } // Dark espresso color
        }
    }

    // Column layout to organize the controls vertically
    Column {
        spacing: 20
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        anchors.leftMargin: 50

        Column {
            // Coffee Strength Selection
            Label {
                id: strengthLabel
                font.pixelSize: 20
                text: "Milk to coffee ratio: " + strength.value
                color: "#353637"
                anchors.left: parent.left
                anchors.leftMargin: 5
            }
            Slider {
                id: strength
                width: 200
                from: 0
                to: 4
                stepSize: 0.5
                value: 0.5  // Set initial value
                onValueChanged: {
                    // Update the label text when the slider value changes
                    strengthLabel.text = "Milk to coffee ratio: " + value
                }
            }
        }

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
                    // Update the label text when the slider value changes
                    temperatureLabel.text = "Temperature: " + value + "°C"
                }
            }
        }

        Column {
            // Coffee Size Selection
            Label {
                id: sizeLabel
                font.pixelSize: 20
                text: "Size: " + size.value + " ml"
                color: "#353637"
                anchors.left: parent.left
                anchors.leftMargin: 5
            }
            Slider {
                id: size
                width: 200
                from: 200
                to: 500
                stepSize: 1
                value: 355  // Set initial value
                onValueChanged: {
                    // Update the label text when the slider value changes
                    sizeLabel.text = "Size: " + value + " ml"
                }
            }
        }

        // Row layout for buttons
        Row {
            spacing: 20 // Space between each button
            anchors.left: parent.left
            anchors.leftMargin: 10

            // Back Button
            Button {
                id: backButton
                text: "Back"
                font.pixelSize: 22

                onClicked: {
                    // Pop the current view from the stackView
                    stackView.pop();
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
                    // Log the selected options and push a new screen
                    console.log(strengthLabel.text)
                    console.log(temperatureLabel.text)
                    console.log(sizeLabel.text)

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


    Image {
        id: clickableImage
        source: "images/heart.png"
        height: parent.height*0.8
        fillMode: Image.PreserveAspectFit

        anchors.right: parent.right
        anchors.rightMargin: 20
        anchors.verticalCenter: parent.verticalCenter
    }
}


