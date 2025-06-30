pragma ComponentBehavior: Bound

import "root:/components"
import "root:/config"
import "root:/services"
import "workspaces"
import QtQuick
import QtQuick.Layouts

Item {
    id: root

    readonly property list<Workspace> workspaces: layout.children.filter(c => c.isWorkspace).sort((w1, w2) => w1.ws - w2.ws)
    readonly property var occupied: Hyprland.workspaces.values.reduce((acc, curr) => {
        acc[curr.id] = curr.lastIpcObject.windows > 0;
        return acc;
    }, {})
    readonly property int groupOffset: Math.floor((Hyprland.activeWsId - 1) / Config.bar.workspaces.shown) * Config.bar.workspaces.shown

    implicitWidth: layout.implicitWidth
    implicitHeight: layout.implicitHeight

    ColumnLayout {
        id: layout

        spacing: 0
        layer.enabled: true
        layer.smooth: true

        Repeater {
            model: Config.bar.workspaces.shown

            Workspace {
                occupied: root.occupied
                groupOffset: root.groupOffset
            }
        }
    }

}
