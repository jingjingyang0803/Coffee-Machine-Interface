import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
    visible: true
    width: 640
    height: 350

    signal coffeeSelected(string coffeeName)

    Rectangle {
        anchors.fill: parent
        gradient: Gradient {
            GradientStop { position: 0.0; color: "#f5e0c3" } // Light creamy color
            GradientStop { position: 0.5; color: "#b08968" } // Medium coffee color
            GradientStop { position: 1.0; color: "#3b2b1e" } // Dark espresso color
        }
    }

    GridView {
        width: cellWidth * 4
        height: cellHeight * 2
        cellWidth: 110 + 20
        cellHeight: 140 + 20
        model: coffeeModel
        anchors.centerIn: parent

        delegate: Item {
            width: 130
            height: 160

            Coffee {
                id: coffeeComponent
                description: name
                imageSource: icon

                // Anchor the coffeeComponent in the center of the delegate item
                anchors.centerIn: parent

                onImageClicked: {
                    coffeeSelected(name) // Emit the signal with the coffee name
                }
            }
        }
    }

    // Model for coffee types
    ListModel {
        id: coffeeModel
        ListElement { name: "Espresso"; icon: "images/espresso.png" }
        ListElement { name: "Americano"; icon: "images/americano.png" }
        ListElement { name: "Cappuccino"; icon: "images/cappuccino.png" }
        ListElement { name: "Latte"; icon: "images/latte.png" }
        ListElement { name: "Mocha"; icon: "images/mocha.png" }
        ListElement { name: "Chocolate"; icon: "images/chocolate.png" }
        ListElement { name: "Milk"; icon: "images/milk.png" }
        ListElement { name: "Favorite"; icon: "images/favorite.png" }
    }
}
