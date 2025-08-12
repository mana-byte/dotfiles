#!/usr/bin/env bash

swww-daemon &
swww img  ~/.config/me/background/anby.jpg --transition-type center &
nm-applet --indicator &
waybar &
dunst &
hypridle &
systemctl --user start hyprpolkitagent &
udiskie --tray &
rog-control-center &
hyprsunset
