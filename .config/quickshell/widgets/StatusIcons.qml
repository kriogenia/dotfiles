import "root:/common"
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
    readonly property Item battery: battery
    // TODO: bluetooth indicator

    clip: true
    implicitWidth: Math.max(network.implicitWidth)
    implicitHeight: network.implicitHeight + battery.implicitHeight

    MaterialIcon {
        id: network

        animate: true
        text: Network.active ? Icons.getNetworkIcon(Network.active.strength ?? 0) : Icons.noWifi
        color: root.colour

        anchors.horizontalCenter: parent.horizontalCenter
    }

    MaterialIcon {
        id: battery

        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: network.bottom
        anchors.topMargin: Appearance.spacing.smaller / 2

        animate: true
        text: {
            if (!UPower.displayDevice.isLaptopBattery) {
                if (PowerProfiles.profile === PowerProfile.PowerSaver) {
                    return "energy_savings_leaf";
                }
                if (PowerProfiles.profile === PowerProfile.Performance) {
                    return "rocket_launch";
                }
                return "balance";
            }

            const perc = UPower.displayDevice.percentage;
            const charging = !UPower.onBattery;
            if (perc === 1) {
                return charging ? "battery_charging_full" : "battery_full";
            }
            let level = Math.floor(perc * 7);
            if (charging && (level === 4 || level === 1)) {
                level--;
            }
            return charging ? `battery_charging_${(level + 3) * 10}` : `battery_${level}_bar`;
        }
        color: !UPower.onBattery || UPower.displayDevice.percentage > 0.2 ? root.colour : Colours.palette.error
        fill: 1
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
