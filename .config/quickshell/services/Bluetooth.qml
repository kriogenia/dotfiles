pragma Singleton

import Quickshell
import Quickshell.Io
import QtQuick

Singleton {
    id: root

    property bool powered
    property bool discovering
    // TODO: list devices

    Process {
        running: true
        command: ["bluetoothctl"]
        stdout: SplitParser {
            onRead: {
                getInfo.running = true;
            }
        }
    }

    Process {
        id: getInfo

        running: true
        command: ["bluetoothctl", "show"]
        environment: ({
                LANG: "C",
                LC_ALL: "C"
            })
        stdout: StdioCollector {
            onStreamFinished: {
                root.powered = text.includes("Powered: yes");
                root.discovering = text.includes("Discovering: yes");
            }
        }
    }

}
