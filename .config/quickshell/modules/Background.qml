import "root:/components"
import Quickshell
import Quickshell.Wayland

Variants {
    model: Quickshell.screens

    StyledWindow {
        id: win
        name: "background"

        required property ShellScreen modelData

        screen: modelData
        WlrLayershell.exclusionMode: ExclusionMode.Ignore
        WlrLayershell.layer: WlrLayer.Background
        color: "black"

        anchors.top: true
        anchors.bottom: true
        anchors.left: true
        anchors.right: true
    }
}
