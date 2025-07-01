pragma Singleton

import Quickshell
import Quickshell.Io
import Quickshell.Services.Notifications

Singleton {
    id: root

    readonly property string noWifi: "wifi_off"

    function getNetworkIcon(strength: int): string {
        let signal = Math.min(4, Math.floor(( strength ) / 20));
        const name = (signal > 0 && signal < 4) ? "network" : "signal";
        return `${name}_wifi_${signal}_bar`;
    }
 
}
