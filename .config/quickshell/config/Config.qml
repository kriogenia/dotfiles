pragma Singleton

import "root:/common"
import Quickshell
import Quickshell.Io

Singleton {
    id: root

    property alias border: adapter.border

    FileView {
        path: `${Paths.config}/shell.json`
        watchChanges: true
        onFileChanged: reload()
        onAdapterUpdated: writeAdapter()

        JsonAdapter {
            id: adapter

            property JsonObject border: BorderConfig {}
        }
    }

    component BorderConfig: JsonObject {
        property int thickness: Appearance.padding.normal
        property int rounding: Appearance.rounding.large
    }

}
