import "root:/config"
import Quickshell
import QtQuick

Item {
    id: root

    required property ShellScreen screen
    required property Item bar

    anchors.fill: parent
    anchors.margins: Config.border.thickness
    anchors.leftMargin: bar.implicitWidth
}
