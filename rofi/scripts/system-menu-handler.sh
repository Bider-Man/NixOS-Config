#!/usr/bin/env bash

choice=$(echo -e "󰍃  Log Out\n󰒲  Suspend\n󰜉  Reboot\n󰐥  Shutdown\n󰂚  Notifications\n󰂛  Clear Notifications" | rofi -dmenu -p "System" -theme-str 'window {width: 20%;}')

case "$choice" in
  "󰍃  Log Out")
    if [[ $(echo -e "Yes\nNo" | rofi -dmenu -p "Log out?") == "Yes" ]]; then
      hyprctl dispatch exit || loginctl terminate-user $USER
    fi
    ;;
  "󰒲  Suspend")
    if [[ $(echo -e "Yes\nNo" | rofi -dmenu -p "Suspend?") == "Yes" ]]; then
      systemctl suspend
    fi
    ;;
  "󰜉  Reboot")
    if [[ $(echo -e "Yes\nNo" | rofi -dmenu -p "Reboot?") == "Yes" ]]; then
      systemctl reboot
    fi
    ;;
  "󰐥  Shutdown")
    if [[ $(echo -e "Yes\nNo" | rofi -dmenu -p "Shutdown?") == "Yes" ]]; then
      systemctl poweroff
    fi
    ;;
  "󰂚  Notifications")
    # You can use mako or another notification daemon
    # makoctl dismiss && sleep 0.5 && makoctl list | rofi -dmenu
    dunstctl history-pop || notify-send "Notifications" "No unread notifications"
    ;;
  "󰂛  Clear Notifications")
    dunstctl close-all || makoctl dismiss -a
    ;;
esac
