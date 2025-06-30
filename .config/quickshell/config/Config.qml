pragma Singleton

import "root:/common"
import Quickshell
import Quickshell.Io

Singleton {
    id: root

    property alias bar: adapter.bar
    property alias border: adapter.border
    property alias session: adapter.session

    FileView {
        path: `${Paths.config}/config.json`
        watchChanges: true
        onFileChanged: reload()
        onAdapterUpdated: writeAdapter()

        JsonAdapter {
            id: adapter

            property JsonObject bar: BarConfig {}
            property JsonObject border: BorderConfig {}
            property JsonObject session: SessionConfig {}
        }
    }

    component BorderConfig: JsonObject {
        property int thickness: Appearance.padding.normal
        property int rounding: Appearance.rounding.large
    }

    component BarConfig: JsonObject {
        property JsonObject sizes: JsonObject {
            property int innerHeight: 30
            property int windowPreviewSize: 400
            property int trayMenuWidth: 300
            property int batteryWidth: 250
        }

        property JsonObject workspaces: JsonObject {
            property int shown: 5
            property bool activeIndicator: true
            property bool activeTrail: false
            property bool occupiedBg: false
            property bool rounded: true
            property bool showWindows: true
            property string label: "  "
            property string occupiedLabel: "󰮯 "
        }
    }

    component SessionConfig: JsonObject {
        property int dragThreshold: 30

        property JsonObject sizes: JsonObject {
            property int button: 80
        }
    }
}
