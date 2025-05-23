#!/usr/bin/env bash

swww init &
swww img  ~/Wallpapers/paper.png &

nm-applet --indicator &
waybar &
dunst &
hypridle &
hyprpaper &
systemctl --user start hyprpolkitagent 
