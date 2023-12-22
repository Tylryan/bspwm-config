#!/bin/bash

function run {
  if ! pgrep $1 ;
  then
    $@&
  fi
}

setxkbmap -option caps:swapescape                    # Swap caps with escape key
#Find out your monitor name with xrandr or arandr (save and you get this line)
#xrandr --output LVDS1 --primary --mode 1600x900 --rotate normal --output VGA1 --mode 1920x1080  --rotate normal --right-of LVDS1
xrandr --output LVDS-1 --primary --mode 1600x900 --rotate normal --output HDMI-3 --mode 1920x1080  --rotate normal --left-of LVDS-1

$HOME/.config/polybar/launch.sh &

keybLayout=$(setxkbmap -v | awk -F "+" '/symbols/ {print $2}')

run sxhkd -c ~/.config/bspwm/sxhkd/sxhkdrc &

#Some ways to set your wallpaper besides variety or nitrogen
feh --bg-scale ~/.config/bspwm/wallpaper

xsetroot -cursor_name left_ptr &
lxappearance &


numlockx on &
#picom --config $HOME/.config/bspwm/picom.conf &      # Window transitions and transparency
exec picom -b
wmname LG3D &
