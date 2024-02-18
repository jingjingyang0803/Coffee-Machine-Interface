import QtQuick 2.15
import QtQuick.Controls 2.15

ApplicationWindow {
    visible: true
    width: 640
    height: 350
    title: "Coffee App"

    StackView {
        id: stackView
        anchors.fill: parent

        initialItem: MenuScreen {
            onCoffeeSelected: function(coffeeName) {
                if (coffeeName === "Favorite") {
                    stackView.push(Qt.resolvedUrl("FavoriteScreen.qml"), {"stackView": stackView});
                } else {
                    stackView.push(Qt.resolvedUrl("DetailsScreen.qml"), {"coffeeName": coffeeName, "stackView": stackView});
                }
            }
        }
    }
}
