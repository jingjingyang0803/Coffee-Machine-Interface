import QtQuick 2.15
import QtQuick.Controls 2.15

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: "Coffee Machine Interface"

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
        cellWidth: 130
        cellHeight: 160
        model: coffeeModel
        delegate: Coffee {
            description: name
            imageSource: icon
        }
        anchors.centerIn: parent
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
