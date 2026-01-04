#!/usr/bin/env bash
# ~/.config/rofi/scripts/system-menu.sh

# System menu with icons
CHOICE=$(echo -e "󰍃\tLog Out\n󰒲\tSuspend\n󰜉\tReboot\n󰐥\tShutdown\n󰂚\tNotifications\n󰂛\tClear Notifications\n󰩈\tLock Screen" | \
    rofi -dmenu -p "󰀓 System" -theme ~/.config/rofi/config.rasi -sep '\t')

case "$CHOICE" in
    *"Log Out")
        hyprctl dispatch exit || loginctl terminate-user $USER
        ;;
    *"Suspend")
        systemctl suspend
        ;;
    *"Reboot")
        systemctl reboot
        ;;
    *"Shutdown")
        systemctl poweroff
        ;;
    *"Notifications")
        dunstctl history-pop
        ;;
    *"Clear Notifications")
        dunstctl close-all
        ;;
    *"Lock Screen")
        # If using swaylock
        swaylock \
            --screenshots \
            --clock \
            --indicator \
            --indicator-radius 100 \
            --indicator-thickness 7 \
            --effect-blur 7x5 \
            --effect-vignette 0.5:0.5 \
            --ring-color bb00cc \
            --key-hl-color 880033 \
            --line-color 00000000 \
            --inside-color 00000088 \
            --separator-color 00000000 \
            --grace 2 \
            --fade-in 0.2
        ;;
esac
