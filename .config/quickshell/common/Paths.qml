pragma Singleton

import Quickshell
import Qt.labs.platform

Singleton {
    id: root

    readonly property url home: StandardPaths.standardLocations(StandardPaths.HomeLocation)[0]
    readonly property url pictures: StandardPaths.standardLocations(StandardPaths.PicturesLocation)[0]

    readonly property string key: "dotfiles"
    readonly property url state: `${StandardPaths.standardLocations(StandardPaths.GenericStateLocation)[0]}/${key}`
    readonly property url cache: `${StandardPaths.standardLocations(StandardPaths.GenericCacheLocation)[0]}/${key}`

    readonly property url imagecache: `${cache}/imagecache`

    function strip(path: url): string {
        return path.toString().replace("file://", "");
    }

    function mkdir(path: url): void {
        Quickshell.execDetached(["mkdir", "-p", strip(path)]);
    }

}
