import "root:/components"
import "root:/config"
import "root:/services"
import QtQuick

Column {
    id: root

    // TODO: add brightness display

    padding: Appearance.padding.large

    anchors.verticalCenter: parent.verticalCenter
    anchors.left: parent.left

    spacing: Appearance.spacing.normal

    VerticalSlider {
        icon: {
            if (Audio.muted) {
                return "no_sound";
            }
            if (value >= 0.5) {
                return "volume_up";
            }
            if (value > 0) {
                return "volume_down";
            }
            return "volume_mute";
        }
        value: Audio.volume
        onMoved: Audio.setVolume(value)

        implicitWidth: Config.osd.sizes.sliderWidth
        implicitHeight: Config.osd.sizes.sliderHeight
    }
 
}
