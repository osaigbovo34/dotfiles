#!/bin/bash

# Define options with Nerd Font icons
opt_browser="  Web Browser"
opt_files="  File Manager"
opt_editor="  Editor"
opt_wifi="  WiFi Menu"
opt_power="  Power Menu"

# Pipe content to Rofi
# -dmenu: reads from stdin
# -i: case insensitive
# -p: prompt title
selected=$(echo -e "$opt_browser\n$opt_files\n$opt_editor\n$opt_wifi\n$opt_power" | rofi -dmenu -i -p "Hub")

case $selected in
    $opt_browser)
        librewolf ;;
    $opt_files)
        thunar ;;  # or dolphin/ranger
    $opt_editor)
        alacritty -e nvim ;;
    $opt_wifi)
        # Assuming you have a wifi script or use the nm-applet
        ~/.config/hypr/scripts/wifi_menu.sh ;;
    $opt_power)
        ~/.config/hypr/scripts/powermenu.sh ;;
esac
