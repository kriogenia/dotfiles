import "root:/components"
import "root:/config"
import "root:/services"
import "root:/widgets"
import Quickshell
import QtQuick

Item {
    id: root

    required property ShellScreen screen

    anchors.top: parent.top
    anchors.bottom: parent.bottom
    anchors.left: parent.left

    implicitWidth: child.implicitWidth + Config.border.thickness * 2

    Item {
        id: child

        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter

        implicitWidth: Math.max(osIcon.implicitWidth, workspaces.implicitWidth)
 
        OsIcon {
            id: osIcon

            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.topMargin: Appearance.padding.large
        }

        StyledRect {
            id: workspaces

            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: osIcon.bottom
            anchors.topMargin: Appearance.spacing.normal

            radius: Appearance.rounding.full
            color: Colours.palette.surface_container

            implicitWidth: workspacesInner.implicitWidth + Appearance.padding.small * 2
            implicitHeight: workspacesInner.implicitHeight + Appearance.padding.small * 2

            Workspaces {
                id: workspacesInner

                anchors.centerIn: parent
            }
        }

        // TODO: add other components

        Power {
            id: power

            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
            anchors.bottomMargin: Appearance.padding.large
        }
    }

}
