pragma Singleton

import Quickshell
import QtQuick;

Singleton {
    readonly property Transparency transparency: Transparency {}

    function alpha(c: color, layer: bool): color {
      if (!transparency.enabled) {
        return c;
      }

      c = Qt.rgba(c.r, c.g, c.b, layer ? transparency.layers : transparency.base);
      if (layer) {
        c.hsvValue = Math.max(0, Math.min(1, c.hslLightness + 0.2));
      }
      return c;
    }

    component Transparency: QtObject {
        readonly property bool enabled: true
        readonly property real base: 0.78
        readonly property real layers: 0.58
    }

}
