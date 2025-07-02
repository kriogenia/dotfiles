pragma Singleton

import Quickshell
import Quickshell.Io
import Quickshell.Services.Notifications

Singleton {
    id: root

    readonly property string noWifi: "wifi_off"
    readonly property string categoryFallbackIcon: "wysiwyg"

    // TODO: move to config
    readonly property var customEntries: ({})
    readonly property var customCategories: ({
      vesktop: "Network"
    })

    readonly property var categoryIcons: ({
            WebBrowser: "captive_portal",
            Printing: "print",
            Security: "security",
            Network: "chat",
            Archiving: "archive",
            Compression: "archive",
            Development: "code",
            IDE: "code",
            TextEditor: "edit_note",
            Player: "motion_play",
            Audio: "music_note",
            Music: "music_note",
            Recorder: "mic",
            Game: "sports_esports",
            FileTools: "files",
            FileManager: "files",
            Filesystem: "files",
            FileTransfer: "files",
            Settings: "settings",
            DesktopSettings: "settings",
            HardwareSettings: "settings",
            TerminalEmulator: "terminal",
            ConsoleOnly: "terminal",
            Utility: "build",
            Monitor: "monitor_heart",
            Midi: "graphic_eq",
            Mixer: "graphic_eq",
            AudioVideoEditing: "video_settings",
            AudioVideo: "music_video",
            Video: "videocam",
            Building: "construction",
            Graphics: "photo_library",
            "2DGraphics": "photo_library",
            RasterGraphics: "photo_library",
            TV: "tv",
            System: "host",
            Office: "content_paste"
        })

    function getDesktopEntry(name: string): DesktopEntry {
        name = name.toLowerCase().replace(/ /g, "-");

        if (customEntries.hasOwnProperty(name)) {
            name = desktopEntrySubs[name];
        }

        return DesktopEntries.applications.values.find(a => a.id.toLowerCase() === name) ?? null;
    }

    function getAppCategoryIcon(name: string): string {
        const categories = getDesktopEntry(name)?.categories ?? customCategories[name] ?? [];

        if (categories) {
            for (const [key, value] of Object.entries(categoryIcons)) {
                if (categories.includes(key)) {
                    console.log(name, categories, key, value);
                    return value;
                }
            }
        }
        console.warn(`Icon not found for ${name} with ${categories}`);
        return categoryFallbackIcon;
    }


    function getNetworkIcon(strength: int): string {
        let signal = Math.min(4, Math.floor(( strength ) / 20));
        const name = (signal > 0 && signal < 4) ? "network" : "signal";
        return `${name}_wifi_${signal}_bar`;
    }
 
}
