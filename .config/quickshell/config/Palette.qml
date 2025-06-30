pragma Singleton

import Quickshell
import QtQuick

Singleton {
  id: root
  
  readonly property color primary: "#C8BFFF"
  readonly property color m3onPrimary: "#30285F"

  readonly property color tertiary: "#976A7D"

  readonly property color surface: "#141318"
  readonly property color surfaceContainer: "#201F25"
  readonly property color m3surfaceContainerHigh: "#2B292F"
  readonly property color on_surface: "#E5E1E9"
  readonly property color onSurfaceVariant: "#C9C5D0"

  readonly property color outlineVariant: "#48454E"

  readonly property color scrim: "#000000"
  readonly property color shadow: "#000000"
}
