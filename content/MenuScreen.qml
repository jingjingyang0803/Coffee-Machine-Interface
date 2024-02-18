import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
    visible: true
    width: 640
    height: 350

    // Custom signal to notify when a coffee type is selected
    signal coffeeSelected(string coffeeName)

    // Background rectangle with gradient
    Rectangle {
        anchors.fill: parent
        gradient: Gradient {
            GradientStop { position: 0.0; color: "#f5e0c3" } // Light creamy color
            GradientStop { position: 0.5; color: "#b08968" } // Medium coffee color
            GradientStop { position: 1.0; color: "#3b2b1e" } // Dark espresso color
        }
    }

    // GridView to display coffee options
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

            // Custom coffee component
            Coffee {
                id: coffeeComponent
                description: name // Bind the description to the coffee name
                imageSource: icon // Bind the image source to the coffee icon

                anchors.centerIn: parent // Center the coffee component in the delegate item

                // Handler for when an image in the coffee component is clicked
                onImageClicked: {
                    coffeeSelected(name) // Emit the coffeeSelected signal with the name of the coffee
                }
            }
        }
    }

    // Model to hold data about different coffee types
    ListModel {
        id: coffeeModel
        // Define each coffee type with a name and icon
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
