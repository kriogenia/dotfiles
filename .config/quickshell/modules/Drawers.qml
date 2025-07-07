pragma ComponentBehavior: Bound

import "root:/config"
import "root:/components"
import "root:/modules"
import "root:/services"
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

                model: panels.children

                Region {
                    required property Item modelData

                    x: modelData.x + bar.implicitWidth
                    y: modelData.y + Config.border.thickness
                    width: modelData.width
                    height: modelData.height
                    intersection: Intersection.Subtract
                }
            }

            HyprlandFocusGrab {
                active: visibilities.session
                windows: [win]
                onCleared: {
                    visibilities.session = false;
                }
            }

            StyledRect {
                anchors.fill: parent
                opacity: 0
                color: Colours.palette.scrim

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
                    panels: panels
                }
            }

            MultiEffect {
                anchors.fill: source
                source: background
                shadowEnabled: true
                blurMax: 15
                shadowColor: Qt.alpha(Palette.shadow, 0.7)
            }

            PersistentProperties {
                id: visibilities

                property bool session

                Component.onCompleted: Visibilities.screens[scope.modelData] = this
            }

            Interactions {
                screen: scope.modelData
                popouts: panels.popouts
                visibilities: visibilities
                panels: panels
                bar: bar

                Panels {
                    id: panels

                    screen: scope.modelData
                    visibilities: visibilities
                    bar: bar
                }
            }


            Bar {
                id: bar

                screen: scope.modelData
                popouts: panels.popouts
            }
        }
    }
}
