pragma ComponentBehavior: Bound

import "root:/components"
import "root:/config"
import "root:/services"
import Quickshell
import QtQuick

Column {
    id: root

    required property PersistentProperties visibilities

    padding: Appearance.padding.large

    anchors.verticalCenter: parent.verticalCenter
    anchors.left: parent.left

    spacing: Appearance.spacing.large

    SessionButton {
        id: logout

        icon: "logout"
        // command: ["loginctl", "terminate-user", ""] // doesn't work with my current SDDM use
        command: ["hyprctl", "dispatch", "exit", "0"]

        KeyNavigation.down: shutdown

        Connections {
            target: root.visibilities

            function onSessionChanged(): void {
              if (root.visibilities.session) {
                    logout.focus = true;
              }
            }
        }
    }

    SessionButton {
        id: shutdown

        icon: "power_settings_new"
        command: ["systemctl", "poweroff"]

        KeyNavigation.up: logout
        KeyNavigation.down: suspend
    }

    SessionButton {
        id: suspend

        icon: "downloading"
        command: ["systemctl", "suspend"]

        KeyNavigation.up: shutdown
        KeyNavigation.down: reboot
    }

    SessionButton {
        id: reboot

        icon: "cached"
        command: ["systemctl", "reboot"]

        KeyNavigation.up: suspend
    }

    component SessionButton: StyledRect {
        id: button

        required property string icon
        required property list<string> command

        implicitWidth: Config.session.sizes.button
        implicitHeight: Config.session.sizes.button

        radius: Appearance.rounding.large
        color: button.activeFocus ? Colours.palette.secondary_container : Colours.palette.surface_container

        Keys.onEnterPressed: Quickshell.execDetached(button.command)
        Keys.onReturnPressed: Quickshell.execDetached(button.command)
        Keys.onEscapePressed: root.visibilities.session = false

        StateLayer {
            radius: parent.radius
            color: button.activeFocus ? Colours.palette.secondary_container : Colours.palette.on_surface

            function onClicked(): void {
                Quickshell.execDetached(button.command);
            }
        }

        MaterialIcon {
            anchors.centerIn: parent

            text: button.icon
            color: button.activeFocus ? Colours.palette.on_secondary_container : Colours.palette.on_surface
            font.pointSize: Appearance.font.size.extraLarge
            font.weight: 500
        }
    }
}
