import QtQuick 2.15
import QtQuick.Controls 2.15

ApplicationWindow {
    visible: true
    width: 640
    height: 350
    title: "Coffee App"

    // StackView for managing the navigation between screens
    StackView {
        id: stackView
        anchors.fill: parent

        // Set the initial item (screen) to be displayed in the StackView
        initialItem: MenuScreen {
            // Define a function to be called when a coffee type is selected
            onCoffeeSelected: function(coffeeName) {
                // Check if the selected coffee type is 'Favorite'
                if (coffeeName === "Favorite") {
                    // Push the FavoriteScreen onto the stack with stackView reference
                    stackView.push(Qt.resolvedUrl("FavoriteScreen.qml"), {"stackView": stackView});
                } else {
                    // Push the DetailsScreen onto the stack with the selected coffee name and stackView reference
                    stackView.push(Qt.resolvedUrl("DetailsScreen.qml"), {"coffeeName": coffeeName, "stackView": stackView});
                }
            }
        }
    }
}
