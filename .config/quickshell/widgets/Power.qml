import "root:/components"
import "root:/config"
import "root:/services"
import Quickshell

MaterialIcon {
    text: "power_settings_new"
    color: Colours.palette.error
    font.bold: true
    font.pointSize: Appearance.font.size.normal

    StateLayer {
        anchors.fill: undefined
        anchors.centerIn: parent
        anchors.horizontalCenterOffset: 1

        implicitWidth: parent.implicitHeight + Appearance.padding.small * 2
        implicitHeight: implicitWidth

        radius: Appearance.rounding.full

        // TODO: add onclick
    }
}
