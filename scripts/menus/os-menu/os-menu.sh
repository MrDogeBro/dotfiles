#!/bin/bash

activeSessionId=$(for sessionid in $(loginctl list-sessions --no-legend | awk '{ print $1 }')
  do loginctl show-session -p Id -p Name -p User -p State -p Type -p Remote $sessionid | sort
  done |
  awk -F = '/Id/ { id = $2 } /State/ { state = $2 } /Type/ { type = $2 } /Remote/ { remote = $2 } /User/ && remote == "no" && state == "active" && (type == "x11" || type == "wayland") { print id }')


option0="Launch Program"
option1=""
option2="About"
option3="Reboot"
option4="Shutdown"
option5="Log Out of $(loginctl show-session -p Name $activeSessionId | awk -F = '/Name/ { name = $2 } /Name/ { print name }')"


options="$option0\n$option1\n$option2\n$option3\n$option4\n$option5"

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

menuSelected="$(echo -e "$options" | rofi -dmenu -p "Arch" -config $HOME/scripts/menus/os-menu/os-menu-rofi.rasi \
  -i -hide-scrollbar)"

case $menuSelected in
  $option0)
    rofi -show run -theme main-theme
    ;;
  $option2)
    alacritty --option font.size=8.5 -e bash -c 'neofetch; while true; do sleep 1; done'
    ;;
  $option3)
    if confirmSelection "Are you sure you would like to reboot?"; then
      reboot
    fi
    ;;
  $option4)
    if confirmSelection "Are you sure you would like to shutdown?"; then
      shutdown now
    fi
    ;;
  $option5)
    if confirmSelection "Are you sure you would like to logout?"; then
      logoutActive
    fi
    ;;
esac
