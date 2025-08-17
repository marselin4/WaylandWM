#!/bin/dash

wlr-randr --output DisplayPort-0 --mode 1920x1080 &
dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP=wlroots
mako &
mini-polkit "rofi -dmenu -password -p '{{MESSAGE}}'" &
waybar &
swww-daemon &
