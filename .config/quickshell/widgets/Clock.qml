import "root:/components"
import "root:/config"
import "root:/services"
import QtQuick

Column {
    id: root

    property color colour: Colours.palette.tertiary

    spacing: Appearance.spacing.minimal

    // TODO: on icon click open calendar

    MaterialIcon {
        id: icon

        text: "calendar_month"
        color: root.colour

        anchors.horizontalCenter: parent.horizontalCenter
    }

    StyledText {
        id: text

        anchors.horizontalCenter: parent.horizontalCenter

        horizontalAlignment: StyledText.AlignHCenter
        text: Time.format("hh\nmm")
        font.pointSize: Appearance.font.size.smaller
        font.family: Appearance.font.family.mono
        color: root.colour
    }
}
