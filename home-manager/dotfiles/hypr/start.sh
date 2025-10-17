#!/usr/bin/env bash

swww-daemon &
swww img  ~/.config/me/background/anby_black.jpg --transition-type center &
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
