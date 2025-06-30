pragma Singleton

import "root:/common"
import Quickshell
import Quickshell.Io
import QtQuick;

Singleton {
    id: root

    readonly property Palette palette: showPreview ? preview : current
    readonly property Palette current: Palette {}
    readonly property Palette preview: Palette {}

    readonly property Transparency transparency: Transparency {}

    property bool showPreview
    property string scheme

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

    function load(data: string, isPreview: bool): void {
        const colours = isPreview ? preview : current;
        const scheme = JSON.parse(data);

        if (!isPreview) {
            root.scheme = scheme.name;
        }

        for (const [name, colour] of Object.entries(scheme.colours)) {
          if (colours.hasOwnProperty(name)) {
                colours[name] = `${colour}`;
          }
        }
    }

    FileView {
        path: `${Paths.config}/scheme.json`
        watchChanges: true
        onFileChanged: reload()
        onLoaded: root.load(text(), false)
    }

    component Transparency: QtObject {
        readonly property bool enabled: true
        readonly property real base: 0.78
        readonly property real layers: 0.58
    }

    component Palette: QtObject {
        property color primary: "#C8BFFF"
        property color on_primary: "#30285F"

        property color tertiary: "#976A7D"

        property color surface: "#141318"
        property color surface_container: "#201F25"
        property color surface_container_high: "#2B292F"
        property color on_surface: "#E5E1E9"
        property color on_surface_variant: "#C9C5D0"

        property color outline_variant: "#48454E"

        property color scrim: "#000000"
        property color shadow: "#000000"

        property color test: "#ff0000"
    }

}
