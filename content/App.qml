// Copyright (C) 2021 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

import QtQuick 6.5
import CoffeMachineInterface

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: "Coffee Shop"

    StackView {
        id: stackView
        anchors.fill: parent

        initialItem: Menu {
            onImageClicked: stackView.push(Qt.resolvedUrl("Customization.qml"), {"coffeeName": name})
        }
    }
}

