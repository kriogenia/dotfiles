import "root:/components"
import "root:/config"
import "root:/services"
import Quickshell
import QtQuick
import QtQuick.Layouts

Item {
    id: root

    required property int index
    required property var occupied
    required property int groupOffset

    readonly property bool isWorkspace: true // Flag for finding workspace children
    // Unanimated prop for others to use as reference
    readonly property real size: childrenRect.height + (hasWindows ? Appearance.padding.smaller : 0)

    readonly property int ws: groupOffset + index + 1
    readonly property bool isOccupied: occupied[ws] ?? false
    readonly property bool hasWindows: isOccupied && Config.bar.workspaces.showWindows

    Layout.preferredWidth: childrenRect.width
    Layout.preferredHeight: size

    function isActive(): bool {
      console.log(this.ws);
      console.log(Hyprland.activeWsId);
      return Hyprland.activeWsId === root.ws
    }

    StyledText {
        id: indicator

        readonly property string label: Config.bar.workspaces.label || root.ws
        readonly property string occupiedLabel: Config.bar.workspaces.occupiedLabel || label
        readonly property string activeLabel: Config.bar.workspaces.activeLabel || (root.isOccupied ? occupiedLabel : label)

        animate: false
        text: Hyprland.activeWsId === root.ws ? activeLabel : root.isOccupied ? occupiedLabel : label
        color: Config.bar.workspaces.occupiedBg || root.isOccupied || Hyprland.activeWsId === root.ws ? "#E5E1E9" : "#48454E"
        // color: Config.bar.workspaces.occupiedBg || root.isOccupied || Hyprland.activeWsId === root.ws ? Palette.on_surface : Palette.outlineVariant // TODO
        horizontalAlignment: StyledText.AlignHCenter
        verticalAlignment: StyledText.AlignVCenter

        width: Config.bar.sizes.innerHeight
        height: Config.bar.sizes.innerHeight
    }

    Behavior on Layout.preferredWidth {
        Anim {}
    }

    Behavior on Layout.preferredHeight {
        Anim {}
    }

    component Anim: NumberAnimation {
        duration: Appearance.anim.durations.normal
        easing.type: Easing.BezierSpline
        easing.bezierCurve: Appearance.anim.curves.standard
    }
}
