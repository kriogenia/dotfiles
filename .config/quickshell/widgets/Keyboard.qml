import "root:/components"
import "root:/config"
import "root:/services"
import QtQuick

Column {
    id: root

    property color colour: Colours.palette.secondary

    spacing: Appearance.spacing.minimal

    // TODO: on icon click open keyboard switcher

    MaterialIcon {
        id: icon

        text: "keyboard"
        color: root.colour

        anchors.horizontalCenter: parent.horizontalCenter
    }

    StyledText {
        id: text

        anchors.horizontalCenter: parent.horizontalCenter

        horizontalAlignment: StyledText.AlignHCenter
        text: Hyprland.activeLayout
        font.pointSize: Appearance.font.size.smaller
        font.family: Appearance.font.family.mono
        color: root.colour
    }
}
