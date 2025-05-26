#!/usr/bin/env bash

swww init &
swww img  ~/.config/me/background/shop.png --transition-type center &
nm-applet --indicator &
waybar &
dunst &
hypridle &
systemctl --user start hyprpolkitagent 
