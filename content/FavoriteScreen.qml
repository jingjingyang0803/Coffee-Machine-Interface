import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
    width: 640
    height: 350

    Image {
        id: clickableImage
        source: "images/heart.png"
        height: parent.height
        fillMode: Image.PreserveAspectFit
    }
}
