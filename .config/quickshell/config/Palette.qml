pragma Singleton

import Quickshell
import QtQuick

Singleton {
  id: root
 
  readonly property color primary: "#C8BFFF"
  readonly property color on_primary: "#30285F"

  readonly property color tertiary: "#976A7D"

  readonly property color surface: "#141318"
  readonly property color surface_container: "#201F25"
  readonly property color surface_container_high: "#2B292F"
  readonly property color on_surface: "#E5E1E9"
  readonly property color on_surface_variant: "#C9C5D0"

  readonly property color outline_variant: "#48454E"

  readonly property color scrim: "#000000"
  readonly property color shadow: "#000000"

  readonly property color test: "#ff0000"
}
