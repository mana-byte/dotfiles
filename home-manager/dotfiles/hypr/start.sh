#!/usr/bin/env bash

swww-daemon &
wal -i ${config.home.homeDirectory}/.config/me/background/animated/street.jpg &
swww img  ~/.config/me/background/animated/street.gif --transition-type center &
nm-applet --indicator &
waybar &
dunst &
hypridle &
systemctl --user start hyprpolkitagent &
udiskie --tray &
hyprsunset &
kdeconnectd &
kdeconnect-indicator &
blueman-applet
