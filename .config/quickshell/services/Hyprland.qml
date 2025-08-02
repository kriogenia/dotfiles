pragma Singleton

import "root:/config"
import Quickshell
import Quickshell.Hyprland
import Quickshell.Io
import QtQuick

Singleton {
    id: root

    readonly property var toplevels: Hyprland.toplevels
    readonly property var workspaces: Hyprland.workspaces
    readonly property HyprlandWorkspace focusedWorkspace: Hyprland.focusedWorkspace
    readonly property int activeWsId: focusedWorkspace?.id ?? 1

    property string activeLayout: "en"
    readonly property string keyboardName: Config.keyboard.name

    Process {
        id: getActiveLayout
        running: true
        command: [
          "sh", "-c",
          `hyprctl devices -j | jq -r '.keyboards.[] | select(.name == "${keyboardName}").active_keymap'`
        ]
        stdout: StdioCollector {
            onStreamFinished: {
                if (text.includes("English")) {
                    activeLayout = "en"
                } else if (text.includes("Spanish")) {
                    activeLayout = "es"
                } else {
                    console.warn(`Unknown keyboard layout ${text}`);
                    activeLayout = "??";
                }
            }
        }
    }

    Connections {
        target: Hyprland

        function onRawEvent(event: HyprlandEvent): void {
            if (event.name.endsWith("v2")) {
                return;
            }

            if (event.name.includes("mon")) {
                Hyprland.refreshMonitors();
            } else if (event.name.includes("workspace")) {
                Hyprland.refreshWorkspaces();
            } else if (event.name.includes("activelayout")) {
                getActiveLayout.running = true;
            } else {
                Hyprland.refreshToplevels();
            }
        }
    }
}
