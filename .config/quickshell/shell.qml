import "config/"
import "modules/"
import Quickshell
import Quickshell.Hyprland

ShellRoot {
    property bool enableDrawers: true

    Background {}
    LazyLoader { active: enableDrawers; component: Drawers {} }

    GlobalShortcut {
        name: "toggleShell"
        description: "Toggle the whole shell"
        onPressed: enableDrawers = !enableDrawers;
    }
}

