#!/bin/bash

# FUNCTION: Send a notification that replaces the previous one
# ID: 9999 ensures we always update the same notification slot
notify_user() {
    notify-send -h string:x-canonical-private-synchronous:sys-notify -u low -h int:value:$1 "$2: $1%"
}

# CONTROLS
case $1 in
vol_up)
    pamixer -i 5
    val=$(pamixer --get-volume)
    notify_user "$val" "Volume"
    ;;
vol_down)
    pamixer -d 5
    val=$(pamixer --get-volume)
    notify_user "$val" "Volume"
    ;;
vol_mute)
    pamixer -t
    if $(pamixer --get-mute); then
        notify-send -h string:x-canonical-private-synchronous:sys-notify -u low "Volume: Muted"
    else
        val=$(pamixer --get-volume)
        notify_user "$val" "Volume"
    fi
    ;;
mic_mute)
    pamixer --default-source -t
    if $(pamixer --default-source --get-mute); then
         notify-send -h string:x-canonical-private-synchronous:sys-notify -u low "Mic: Muted"
    else
         notify-send -h string:x-canonical-private-synchronous:sys-notify -u low "Mic: Active"
    fi
    ;;
bright_up)
    brightnessctl set +5%
    val=$(brightnessctl -m | awk -F, '{print substr($4, 0, length($4)-1)}')
    notify_user "$val" "Brightness"
    ;;
bright_down)
    brightnessctl set 5%-
    val=$(brightnessctl -m | awk -F, '{print substr($4, 0, length($4)-1)}')
    notify_user "$val" "Brightness"
    ;;
esac
