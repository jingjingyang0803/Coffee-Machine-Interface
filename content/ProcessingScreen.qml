import QtQuick 2.15

Item {
    width: 640
    height: 350

    property var stackView: null

    Image {
        id: clickableImage
        source: "images/beans.png"
        width: parent.width
        fillMode: Image.PreserveAspectFit
    }

    Canvas {
        id: canvas
        width: 160
        height: 160
        anchors.centerIn: parent

        property real angle: 0

        onAngleChanged: requestPaint() // Request to repaint whenever angle changes

        onPaint: {
            var ctx = getContext("2d");
            var x = width / 2;
            var y = height / 2;
            var radius = Math.min(x, y) - 10;
            var startAngle = -Math.PI / 2;
            var endAngle = startAngle + angle * Math.PI / 180;

            // Clear previous drawing
            ctx.clearRect(0, 0, width, height);

            // Draw background circle
            ctx.beginPath();
            ctx.arc(x, y, radius, 0, 2 * Math.PI, false);
            ctx.lineWidth = 15;
            ctx.strokeStyle = "#FEFBF6";
            ctx.stroke();

            // Draw progress arc
            ctx.beginPath();
            ctx.arc(x, y, radius, startAngle, endAngle, false);
            ctx.lineWidth = 15;
            ctx.strokeStyle = "#76453B";
            ctx.stroke();
        }

        // Arc animation
        NumberAnimation on angle {
            from: 0
            to: 360 + 10
            duration: 20000 // 20 seconds
            running: true
        }
    }

    Timer {
        id: timer
        interval: 20000 // 20 seconds
        running: true
        repeat: false
        onTriggered: {
            stackView.pop();
        }
    }
}
