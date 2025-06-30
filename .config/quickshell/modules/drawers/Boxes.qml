import "root:/services"
import "root:/config"
import QtQuick
import QtQuick.Shapes

Shape {
    id: root

    required property Item bar

    anchors.fill: parent
    anchors.margins: Config.border.thickness
    anchors.leftMargin: bar.implicitWidth
    preferredRendererType: Shape.CurveRenderer
    opacity: Colours.transparency.enabled ? Colours.transparency.base : 1
}
