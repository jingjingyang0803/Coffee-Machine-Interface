import QtQuick 2.15

Item {
    width: 640
    height: 350

    property var stackView: null

    Image {
        id: clickableImage
        source: "images/beans.png"
        width: parent.width
        fillMode: Image.PreserveAspectFit // Keep the aspect ratio of the image
    }

    Canvas {
        id: canvas
        width: 160
        height: 160
        anchors.centerIn: parent

        property real angle: 0 // Property to keep track of the angle for the arc

        onAngleChanged: requestPaint() // Request to repaint whenever angle changes

        onPaint: {
            var ctx = getContext("2d");
            var x = width / 2; // Calculate the center x-coordinate
            var y = height / 2; // Calculate the center y-coordinate
            var radius = Math.min(x, y) - 10; // Calculate the radius of the circle
            var startAngle = -Math.PI / 2; // Starting angle for the arc (top of the circle)
            var endAngle = startAngle + angle * Math.PI / 180; // Ending angle for the arc

            // Clear the canvas before drawing
            ctx.clearRect(0, 0, width, height);

            // Draw background circle
            ctx.beginPath();
            ctx.arc(x, y, radius, 0, 2 * Math.PI, false);
            ctx.lineWidth = 15;
            ctx.strokeStyle = "#FEFBF6"; // Light color for the background circle
            ctx.stroke();

            // Draw progress arc
            ctx.beginPath();
            ctx.arc(x, y, radius, startAngle, endAngle, false);
            ctx.lineWidth = 15;
            ctx.strokeStyle = "#76453B"; // Dark color for the progress arc
            ctx.stroke();
        }

        // Arc animation
        NumberAnimation on angle {
            from: 0 // Start angle
            to: 360 + 10 // End angle (a little more than 360 for a complete circle)
            duration: 20000 // Duration of the animation: 20 seconds
            running: true // Start the animation immediately
        }
    }

    Timer {
        id: timer
        interval: 20000 // 20 seconds
        running: true
        repeat: false
        onTriggered: {
            stackView.pop(); // Pop the top item off the stack when the timer triggers
        }
    }
}
