#!/bin/bash

function run {
  if ! pgrep $1 ;
  then
    $@&
  fi
}

#Find out your monitor name with xrandr or arandr (save and you get this line)

xrandr --output eDP1 --mode 1366x768 --output HDMI1 --mode 1920x1080 --right-of eDP1

#xrandr --output VGA-1 --primary --mode 1360x768 --pos 0x0 --rotate normal
#xrandr --output DP2 --primary --mode 1920x1080 --rate 60.00 --output LVDS1 --off &
#xrandr --output HDMI2 --mode 1920x1080 --pos 1920x0 --rotate normal --output HDMI1 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output VIRTUAL1 --off
#autorandr horizontal

$HOME/.config/polybar/launch.sh &

#change your keyboard if you need it
#setxkbmap -layout be

keybLayout=$(setxkbmap -v | awk -F "+" '/symbols/ {print $2}')

if [ $keybLayout = "be" ]; then
  run sxhkd -c ~/.config/bspwm/sxhkd/sxhkdrc-azerty &
else
  run sxhkd -c ~/.config/bspwm/sxhkd/sxhkdrc &
fi

#Some ways to set your wallpaper besides variety or nitrogen
feh --bg-scale ~/Pictures/Wallpapers/dark-sea-waves.jpg &
# feh --bg-fill ~/Pictures/Wallpapers/dark-sea-waves.jpg &
#feh --randomize --bg-fill ~/Képek/*
#feh --randomize --bg-fill ~/Dropbox/Apps/Desktoppr/*

dex $HOME/.config/autostart/arcolinux-welcome-app.desktop
xsetroot -cursor_name left_ptr &

# conky -c $HOME/.config/bspwm/system-overview &
# run variety &                                                     # Randomly changes background
# run nm-applet &                                                   # Tray: Network manager
# run pamac-tray &                                                  # Tray: Package updates
# run xfce4-power-manager &                                         # Manages/reduces power consumption
numlockx on &
# blueberry-tray &                                                  # Tray: Bluetooth
# run volumeicon &                                                  # Tray: Volume Thing
# picom --config $HOME/.config/bspwm/picom.conf &                   # Window transitions and transparency
# kill $(ps aux | grep gnome | tr -s ' ' | cut -d' ' -f2) 2>/dev/null # Kill everything gnome related
# /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &       # If bspwm runs: I'm using xfce
/usr/lib/xfce4/notifyd/xfce4-notifyd &
wmname LG3D &
setxkbmap -option caps:swapescape &                                 # Swap caps with escape key
#nitrogen --restore &                                               # Restores wallpaper: I'm using feh
#run caffeine &                                                     # Also see caffeinate
#run thunar &
#run dropbox &
#run insync start &
