import "root:/config"
import "root:/services"
import "popouts" as Popouts
import "session" as Session
import QtQuick
import QtQuick.Shapes

Shape {
    id: root

    required property Panels panels
    required property Item bar

    anchors.fill: parent
    anchors.margins: Config.border.thickness
    anchors.leftMargin: bar.implicitWidth
    preferredRendererType: Shape.CurveRenderer
    // opacity: Colours.transparency.enabled ? Colours.transparency.base : 1

    Session.Box {
        wrapper: panels.session

        startX: root.width
        startY: (root.height - wrapper.height) / 2 - rounding
    }
 
    Popouts.Box {
        wrapper: panels.popouts
        invertBottomRounding: wrapper.y + wrapper.height + 1 >= root.height

        startX: wrapper.x
        startY: wrapper.y - rounding * sideRounding
    }
}
