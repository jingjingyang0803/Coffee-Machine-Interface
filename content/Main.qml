import QtQuick 2.15
import QtQuick.Controls 2.15

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: "Coffee Machine Interface"

    GridView {
        anchors.fill: parent
        model: coffeeModel
        delegate: Button {
            text: model.name
            iconSource: model.icon
            onClicked: {
                // Open customization screen or add to order
            }
        }
    }

    // Model for coffee types
    ListModel {
        id: coffeeModel
        ListElement { name: "Espresso"; icon: "espresso-icon.png" }
        // Add more coffee types
    }
}
