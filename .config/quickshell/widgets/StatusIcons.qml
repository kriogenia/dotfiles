import "root:/components"
import "root:/config"
import "root:/services"
import Quickshell
import Quickshell.Services.UPower
import QtQuick

Item {
    id: root

    property color colour: Colours.palette.secondary

    readonly property Item network: network
    // TODO: bluetooth indicator
    // TODO: battery indicator

    clip: true
    implicitWidth: Math.max(network.implicitWidth)
    implicitHeight: network.implicitHeight

    MaterialIcon {
        id: network

        animate: true
        text: "signal_wifi_4_bar"
        color: root.colour

        anchors.horizontalCenter: parent.horizontalCenter
    }

    Behavior on implicitWidth {
        NumberAnimation {
            duration: Appearance.anim.durations.normal
            easing.type: Easing.BezierSpline
            easing.bezierCurve: Appearance.anim.curves.emphasized
        }
    }

    Behavior on implicitHeight {
        NumberAnimation {
            duration: Appearance.anim.durations.normal
            easing.type: Easing.BezierSpline
            easing.bezierCurve: Appearance.anim.curves.emphasized
        }
    }
}
