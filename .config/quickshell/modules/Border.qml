import "root:/common"
import "root:/components"
import "root:/config"
import "root:/services"

import Quickshell
import QtQuick
import QtQuick.Effects

Item {
    id: root

    required property Item bar

    anchors.fill: parent

    StyledRect {
        id: rect

        anchors.fill: parent
        color: Colours.palette.surface
        visible: false
    }

    Item {
        id: mask

        anchors.fill: parent
        layer.enabled: true
        visible: false

        Rectangle {
            anchors.fill: parent
            anchors.margins: Config.border.thickness
            anchors.leftMargin: root.bar.implicitWidth
            radius: Config.border.rounding
        }
    }

    MultiEffect {
        anchors.fill: parent
        maskEnabled: true
        maskInverted: true
        maskSource: mask
        source: rect
        maskThresholdMin: 0.5
        maskSpreadAtMin: 1
    }
}
