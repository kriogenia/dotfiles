pragma ComponentBehavior: Bound

import "root:/config"
import "root:/components"
import "root:/modules"
import "drawers"
import Quickshell
import Quickshell.Wayland
import Quickshell.Hyprland
import QtQuick
import QtQuick.Effects

Variants {
    model: Quickshell.screens

    Scope {
        id: scope

        required property ShellScreen modelData

        Exclusions {
            screen: scope.modelData
            bar: bar
        }

        StyledWindow {
            id: win

            screen: scope.modelData
            name: "drawers"
            WlrLayershell.exclusionMode: ExclusionMode.Ignore

            mask: Region {
                x: bar.implicitWidth
                y: Config.border.thickness
                width: win.width - bar.implicitWidth - Config.border.thickness
                height: win.height - Config.border.thickness * 2
                intersection: Intersection.Xor

                regions: regions.instances
            }

            anchors.top: true
            anchors.bottom: true
            anchors.left: true
            anchors.right: true

            Variants {
                id: regions

                // model: panels.children

                Region {
                    required property Item modelData

                    x: modelData.x + bar.implicitWidth
                    y: modelData.y + Config.border.thickness
                    width: modelData.width
                    height: modelData.height
                    intersection: Intersection.Subtract
                }
            }

            StyledRect {
                anchors.fill: parent
                // opacity: visibilities.session ? 0.5 : 0
                opacity: 0
                color: "#000000" // FIXME
                // color: Palette.scrim

                Behavior on opacity {
                    NumberAnimation {
                        duration: Appearance.anim.durations.normal
                        easing.type: Easing.BezierSpline
                        easing.bezierCurve: Appearance.anim.curves.standard
                    }
                }
            }

            Item {
                id: background

                anchors.fill: parent
                visible: false

                Border {
                    bar: bar
                }

                Boxes {
                    bar: bar
                }
            }

            MultiEffect {
                anchors.fill: source
                source: background
                shadowEnabled: true
                blurMax: 15
                shadowColor: Qt.alpha(Palette.shadow, 0.7)
            }

            Bar {
                id: bar

                screen: scope.modelData
            }
        }
    }
}
