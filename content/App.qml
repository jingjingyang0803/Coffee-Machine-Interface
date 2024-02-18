import QtQuick 2.15
import QtQuick.Controls 2.15

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: "Coffee App"

    StackView {
        id: stackView
        anchors.fill: parent

        initialItem: MenuScreen {
            onCoffeeSelected: stackView.push(detailsScreen)
        }
    }

    Component {
        id: detailsScreen
        DetailsScreen {} //
    }
}
