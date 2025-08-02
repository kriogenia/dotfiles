import "root:/config"
import "osd" as Osd
import "popouts" as Popouts
import "session" as Session
import Quickshell
import QtQuick

Item {
    id: root

    required property ShellScreen screen
    required property PersistentProperties visibilities
    required property Item bar

    readonly property Osd.Wrapper osd: osd
    readonly property Session.Wrapper session: session
    readonly property Popouts.Wrapper popouts: popouts

    anchors.fill: parent
    anchors.margins: Config.border.thickness
    anchors.leftMargin: bar.implicitWidth

    Osd.Wrapper {
        id: osd

        clip: root.visibilities.session
        screen: root.screen
        visibility: root.visibilities.osd

        anchors.verticalCenter: parent.verticalCenter
        anchors.right: parent.right
        anchors.rightMargin: session.width
    }

    Session.Wrapper {
        id: session

        visibilities: root.visibilities

        anchors.verticalCenter: parent.verticalCenter
        anchors.right: parent.right
    }

    Popouts.Wrapper {
        id: popouts

        screen: root.screen

        x: isDetached ? (root.width - nonAnimWidth) / 2 : 0
        y: {
            if (isDetached) {
                return (root.height - nonAnimHeight) / 2;
            }

            const off = currentCenter - Config.border.thickness - nonAnimHeight / 2;
            const diff = root.height - Math.floor(off + nonAnimHeight);
            return (diff < 0) ? off + diff : off;
        }
    }

}
