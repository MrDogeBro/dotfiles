#!/bin/bash

rofi_config="$HOME/.config/rofi"

activeSessionId=$(for sessionid in $(loginctl list-sessions --no-legend | awk '{ print $1 }')
  do loginctl show-session -p Id -p Name -p User -p State -p Type -p Remote $sessionid | sort
  done |
  awk -F = '/Id/ { id = $2 } /State/ { state = $2 } /Type/ { type = $2 } /Remote/ { remote = $2 } /User/ && remote == "no" && state == "active" && (type == "x11" || type == "wayland") { print id }')


about=""
reboot=""
suspend=""
shutdown=""
logout=""

options="$about\n$reboot\n$suspend\n$shutdown\n$logout"

logoutActive() {
  activeDesktop=$(loginctl show-session -p Desktop $activeSessionId | awk -F = '/Desktop/ { de = $2 } /Desktop/ { print de }')
  pkill $activeDesktop
}

confirmSelection() {
  confirmRes="$(echo -e "No\nYes" | rofi -dmenu -p "Confirm" -config $HOME/scripts/menus/os-menu/os-menu-rofi.rasi \
    -i -hide-scrollbar)"

  case $confirmRes in
    "Yes")
      return 0
      ;;
    "No")
      return 1
      ;;
  esac

  return 1
}

menuSelected="$(echo -e "$options" | rofi -dmenu -theme "$rofi_config/themes/power.rasi" \
  -selected-row 2)"


case $menuSelected in
  $about)
    alacritty --option font.size=8.5 -e bash -c 'neofetch; while true; do sleep 1; done'
    ;;
  $reboot)
    if confirmSelection "Are you sure you would like to reboot?"; then
      reboot
    fi
    ;;
  $suspend)
    echo "hi"
    ;;
  $shutdown)
    if confirmSelection "Are you sure you would like to shutdown?"; then
      shutdown now
    fi
    ;;
  $logout)
    if confirmSelection "Are you sure you would like to logout?"; then
      logoutActive
    fi
    ;;
esac
