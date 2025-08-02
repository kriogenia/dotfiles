import "root:/components"
import "root:/config"
import "root:/services"
import "root:/widgets"
import "popouts" as Popouts
import Quickshell
import QtQuick

Item {
    id: root

    required property ShellScreen screen
    required property Popouts.Wrapper popouts

    // TODO: break into different functions (use helper?)
    function checkPopout(y: real): void {
        const spacing = Appearance.spacing.small;
        const baseY = statusIcons.y + statusIconsInner.y - spacing / 2;

        const n = statusIconsInner.network;
        const ny = baseY + n.y;
 
        const b = statusIconsInner.battery;
        const by = baseY + b.y;

        if (y >= ny && y <= ny + n.implicitHeight + spacing) {
            popouts.currentName = "network";
            popouts.currentCenter = Qt.binding(() => statusIcons.y + statusIconsInner.y + n.y + n.implicitHeight / 2);
            popouts.hasCurrent = true;
        } else if (y >= by && y <= by + b.implicitHeight + spacing) {
            popouts.currentName = "battery";
            popouts.currentCenter = Qt.binding(() => statusIcons.y + statusIconsInner.y + b.y + b.implicitHeight / 2);
            popouts.hasCurrent = true;
        } else {
            popouts.hasCurrent = false;
        }
    }

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

        Tray {
            id: tray

            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: keyboard.top
            anchors.bottomMargin: Appearance.spacing.larger
        }

        Keyboard {
            id: keyboard

            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: clock.top
            anchors.bottomMargin: Appearance.spacing.normal
        }

        Clock {
            id: clock

            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: statusIcons.top
            anchors.bottomMargin: Appearance.spacing.normal
        }

        StyledRect {
            id: statusIcons

            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: power.top
            anchors.bottomMargin: Appearance.spacing.normal

            radius: Appearance.rounding.full
            color: Colours.palette.surface_container

            implicitHeight: statusIconsInner.implicitHeight + Appearance.padding.normal * 2

            StatusIcons {
                id: statusIconsInner

                anchors.centerIn: parent
            }
        }

        Power {
            id: power

            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
            anchors.bottomMargin: Appearance.padding.large
        }
    }

}
