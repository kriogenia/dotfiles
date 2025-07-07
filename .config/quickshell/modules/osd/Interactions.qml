import "root:/config"
import "root:/services"
import Quickshell
import QtQuick

Scope {
    id: root

    required property ShellScreen screen
    required property PersistentProperties visibilities
    required property bool hovered

    function show(): void {
        root.visibilities.osd = true;
        timer.restart();
    }

    Connections {
        target: Audio

        function onMutedChanged(): void {
            root.show();
        }

        function onVolumeChanged(): void {
            root.show();
        }
    }

    // TODO: brightness connection

    Timer {
        id: timer

        interval: Config.osd.hideDelay
        onTriggered: {
            if (!root.hovered) {
                root.visibilities.osd = false;
            }
        }
    }
}
