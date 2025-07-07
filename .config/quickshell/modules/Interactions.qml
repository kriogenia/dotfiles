import "root:/config"
import "root:/services"
import "osd" as Osd
import "popouts" as Popouts
import Quickshell
import QtQuick

MouseArea {
    id: root

    required property ShellScreen screen
    required property Popouts.Wrapper popouts
    required property PersistentProperties visibilities
    required property Panels panels
    required property Item bar

    property bool osdHovered
    property point dragStart

    property bool osdShortcutActive

    function withinPanelHeight(panel: Item, x: real, y: real): bool {
        const panelY = Config.border.thickness + panel.y;
        return y >= panelY - Config.border.rounding && y <= panelY + panel.height + Config.border.rounding;
    }

    function inRightPanel(panel: Item, x: real, y: real): bool {
        return x > bar.implicitWidth + panel.x && withinPanelHeight(panel, x, y);
    }

    function inTopPanel(panel: Item, x: real, y: real): bool {
        const panelX = bar.implicitWidth + panel.x;
        return y < Config.border.thickness + panel.y + panel.height && x >= panelX - Config.border.rounding && x <= panelX + panel.width + Config.border.rounding;
    }

    anchors.fill: parent
    hoverEnabled: true

    onPressed: event => dragStart = Qt.point(event.x, event.y)
    onContainsMouseChanged: {
        if (!containsMouse) {
            // Only hide if not activated by shortcut
            if (!osdShortcutActive) {
                visibilities.osd = false;
                osdHovered = false;
            }
            popouts.hasCurrent = false;
        }
    }

    onPositionChanged: event => {
        const x = event.x;
        const y = event.y;

        const showOsd = inRightPanel(panels.osd, x, y);
        // Always update visibility based on hover if not in shortcut mode
        if (!osdShortcutActive) {
            visibilities.osd = showOsd;
            osdHovered = showOsd;
        } else if (showOsd) {
            // If hovering over OSD area while in shortcut mode, transition to hover control
            osdShortcutActive = false;
            osdHovered = true;
        }

        // Show/hide session on drag
        if (pressed && withinPanelHeight(panels.session, x, y)) {
            const dragX = x - dragStart.x;
            if (dragX < -Config.session.dragThreshold) {
                visibilities.session = true;
              } else if (dragX > Config.session.dragThreshold) {
                visibilities.session = false;
              }
        }

        const popout = panels.popouts;
        if (x < bar.implicitWidth + popout.width) {
            if (x < bar.implicitWidth) {
                bar.checkPopout(y); // Handle like part of bar
            } else {
                popouts.hasCurrent = withinPanelHeight(popout, x, y);  // Keep on hover
            }
        } else {
            popouts.hasCurrent = false;
        }
    }

    Connections {
        target: root.visibilities
 
        function onOsdChanged() {
            if (root.visibilities.osd) {
                // OSD became visible, immediately check if this should be shortcut mode
                const inOsdArea = root.inRightPanel(root.panels.osd, root.mouseX, root.mouseY);
                if (!inOsdArea) {
                    root.osdShortcutActive = true;
                }
            } else {
                // OSD hidden, clear shortcut flag
                root.osdShortcutActive = false;
            }
        }
    }
 
    Osd.Interactions {
        screen: root.screen
        visibilities: root.visibilities
        hovered: root.osdHovered
    }

}
