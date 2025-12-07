#!/bin/bash

# Define system power states and actions
ACTIONS="Shutdown\nReboot\nSleep\nHybrid-Sleep\nHibernate\nLogout"

# Pipe actions to Tofi for selection
SELECTION=$(echo -e "$ACTIONS" | tofi --prompt-text " POWER > " --width 350 --height 300)

case "$SELECTION" in
    Shutdown)
        systemctl poweroff
        ;;
    Reboot)
        systemctl reboot
        ;;
    # --- NEW POWER STATES ---
    Sleep)
        # Suspend-to-RAM (Fastest recovery, constant power drain)
        systemctl suspend
        ;;
    Hybrid-Sleep)
        # Saves state to RAM and disk (Safe suspend, slow recovery)
        systemctl hybrid-sleep
        ;;
    Hibernate)
        # Saves state to disk and powers off (No power drain, slowest recovery)
        systemctl hibernate
        ;;
    # ------------------------
    Logout)
        loginctl terminate-session self
        ;;
    *)
        exit 1
        ;;
esac
