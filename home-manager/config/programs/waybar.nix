{
  config,
  pkgs,
  ...
}: {
  programs.waybar = {
    enable = true;
    settings = [
      {
        layer = "top";
        modules-left = ["custom/launcher" "cpu" "memory" "custom/wallpaper" "custom/media" "tray"];
        modules-center = ["hyprland/workspaces"];
        modules-right = ["custom/photo" "network" "pulseaudio" "clock" "battery" "custom/power"];

        pulseaudio = {
          tooltip = false;
          scroll-step = 5;
          format = "{icon} {volume}%";
          format-muted = "{icon} {volume}%";
          on-click = ""; # set
          format-icons = {
            default = ["" "" ""];
          };
        };

        "river/tags" = {
          "num-tags" = 6;
        };

        network = {
          tooltip = true;
          format-wifi = "  ({signalStrength}%)";
          tooltip-format = "{ifname} via {gwaddr}";
          format-ethernet = "{ipaddr}/{cidr}";
          format-disconnected = "Disconnected ⚠";
          format-alt = "  {ifname}: {ipaddr}/{cidr}";
        };

        backlight = {
          tooltip = false;
          format = " {}%";
          interval = 1;
          # Uncomment and set these if needed
          # on-scroll-up = "light -A 5";
          # on-scroll-down = "light -U 5";
        };

        battery = {
          states = {
            good = 95;
            warning = 30;
            critical = 10;
          };
          format = "{icon}  {capacity}%";
          format-charging = " {capacity}%";
          format-plugged = " {capacity}%";
          format-alt = "{time} {icon}";
          format-icons = ["" "" "" "" ""];
        };

        tray = {
          "icon-size" = 22;
          spacing = 5;
        };

        clock = {
          format = "  {:%H:%M}";
          tooltip-format = "  {:%a %b %d}";
        };

        cpu = {
          interval = 15;
          format = " {}%";
          max-length = 10;
        };

        memory = {
          interval = 30;
          format = " {}%";
          max-length = 10;
        };

        "custom/media" = {
          interval = 1;
          format = "{}";
          "return-type" = "json";
          "max-length" = 20;
          escape = true;
          exec = "${config.home.homeDirectory}/.config/waybar/scripts/mediaplayer.py";
          on-click = "bash ${config.home.homeDirectory}/.config/rofi/applets/bin/mpd.sh";
        };

        "custom/launcher" = {
          tooltip = true;
          format = " ";
          on-click = "bash ${config.home.homeDirectory}/.config/rofi/applets/battery.sh";
          on-click-right = "killall rofi";
          tooltip-format = "NixOS x Hyprland x Anby";
        };

        "custom/power" = {
          format = " ";
          on-click = "hyprctl dispatch exit";
          tooltip-format = "Exit Hyprland";
        };

        "custom/photo" = {
          format = "";
          on-click = "hyprshot -m window";
          on-click-right = "hyprshot -m region";
          tooltip-format = "Take a screenshot of a window (left click) or a region (right click)";
        };

        "custom/wallpaper" = {
          format = " ";
<<<<<<< HEAD
          on-click = "swww img ${config.home.homeDirectory}/.config/me/background/shop.png --transition-type outer --transition-pos 0.108,0.98 --transition-fps 60";
          on-click-right = "swww img ${config.home.homeDirectory}/.config/me/background/shop_night_moon.png --transition-type grow --transition-pos 0.108,0.98 --transition-fps 60";
=======
          on-click = "wal -i ${config.home.homeDirectory}/.config/me/background/animated/street.jpg &
                      swww img ${config.home.homeDirectory}/.config/me/background/animated/street.gif --transition-type outer --transition-pos 0.108,0.98 --transition-fps 60 &
                      ${config.home.homeDirectory}/.config/waybar/scripts/restart.sh";
          on-click-right = "wal -i ${config.home.homeDirectory}/.config/me/background/animated/yaemiko_I_swear_me_not_pervert.png &
                      swww img ${config.home.homeDirectory}/.config/me/background/animated/yaemiko_I_swear_me_not_pervert.gif --transition-type grow --transition-pos 0.108,0.98 --transition-fps 60 &
                      ${config.home.homeDirectory}/.config/waybar/scripts/restart.sh";
>>>>>>> anby
          tooltip-format = "Change Wallpaper (left bright, right dark)";
        };
      }
    ];
    style = ''
      @import url("file:///home/mana/.cache/wal/colors-waybar.css");
      @define-color neon-red #ff242b;
      @define-color transparent_black rgba(0, 0, 0, 0.8);

      * {
      	border: none;
      	border-radius: 5;
        font-family: "DepartureMono Nerd Font";
      	font-size: 16px;
      	/* min-height: 10px; */
        margin: 2px;
      }

      *:hover {
            font-size: 18px;
            transition: all 0.2s ease-in-out;
      }

      window#waybar {
      	background: @transparent_black;
          border-radius: 0px;
          /* allows the buttons to not be cut */
          padding: 0px;
          margin: 0px;
      }

      window#waybar.hidden {
      	opacity: 0.2;
      }

      #window {
      	margin-top: 6px;
      	padding-left: 10px;
      	padding-right: 10px;
      	border-radius: 10px;
      	transition: none;
          color: transparent;
      	background: transparent;
      }
      #tags {
      	margin-top: 6px;
      	margin-left: 12px;
      	font-size: 4px;
      	margin-bottom: 0px;
      	border-radius: 10px;
      	background: #161320;
      	transition: none;
      }

      #tags button {
      	transition: none;
      	color: #B5E8E0;
      	background: transparent;
      	font-size: 16px;
      	border-radius: 2px;
      }

      #tags button.occupied {
      	transition: none;
      	color: #F28FAD;
      	background: transparent;
      	font-size: 4px;
      }

      #tags button.focused {
      	color: #ABE9B3;
          border-top: 2px solid #ABE9B3;
          border-bottom: 2px solid #ABE9B3;
      }


      #network {
      	margin-top: 6px;
      	margin-left: 8px;
      	padding-left: 10px;
      	padding-right: 10px;
      	margin-bottom: 0px;
      	border-radius: 10px;
      	transition: none;
      	color: @color2;
      }

      #pulseaudio {
      	margin-top: 6px;
      	margin-left: 8px;
      	padding-left: 10px;
      	padding-right: 10px;
      	margin-bottom: 0px;
      	border-radius: 10px;
      	transition: none;
      	color: @color5;
      }

      #battery {
      	margin-top: 6px;
      	margin-left: 8px;
      	padding-left: 10px;
      	padding-right: 10px;
      	margin-bottom: 0px;
      	border-radius: 10px;
      	transition: none;
      	color: @color3;
        border-radius: 0px;
      }

      #battery.charging, #battery.plugged {
          color: @color3;
      }

      #battery.critical:not(.charging) {
          color: @neon-red;
          animation-name: blink;
          animation-duration: 0.5s;
          animation-timing-function: linear;
          animation-iteration-count: infinite;
          animation-direction: alternate;
      }

      @keyframes blink {
          to {
              background-color: #BF616A;
              color: #B5E8E0;
          }
      }

      #clock {
      	margin-top: 6px;
      	margin-left: 8px;
      	padding-left: 10px;
      	padding-right: 10px;
      	margin-bottom: 0px;
      	border-radius: 10px;
      	transition: none;
      	color: @color6;
      }

      #memory {
      	margin-top: 6px;
      	margin-left: 8px;
      	padding-left: 10px;
      	margin-bottom: 0px;
      	padding-right: 10px;
      	border-radius: 10px;
      	transition: none;
      	color: @color4;
      }
      #cpu {
      	margin-top: 6px;
      	margin-left: 8px;
      	padding-left: 10px;
      	margin-bottom: 0px;
      	padding-right: 10px;
      	border-radius: 10px;
      	transition: none;
      	color: @color4;
      }

      #tray {
      	margin-top: 6px;
      	margin-left: 8px;
      	padding-left: 10px;
      	margin-bottom: 0px;
      	padding-right: 10px;
      	border-radius: 10px;
      	transition: none;
      	/* background-color: @dragon_blue; */
      }

      #custom-launcher {
      	font-size: 24px;
      	margin-top: 4px;
      	margin-left: 6px;
      	padding-left: 8px;
      	padding-right: 3px;
      	transition: none;
        color: @color1;
      }
      #custom-launcher:hover {
      	margin-top: 6px;
      	margin-left: 8px;
      	padding-left: 10px;
      	padding-right: 5px;
      }

      #custom-power {
      	font-size: 20px;
      	margin-top: 6px;
      	margin-left: 8px;
      	margin-right: 8px;
      	padding-left: 10px;
      	padding-right: 5px;
      	margin-bottom: 0px;
      	border-radius: 10px;
      	transition: none;
      	color: @color2;
      }

      #custom-photo {
          font-size: 20px;
      	margin-top: 6px;
      	margin-left: 8px;
      	padding-left: 10px;
      	padding-right: 10px;
      	margin-bottom: 0px;
      	border-radius: 10px;
      	transition: none;
          color: @neon-red;
      }
      #custom-media {
      	margin-top: 6px;
      	margin-left: 8px;
      	padding-left: 10px;
      	padding-right: 10px;
      	margin-bottom: 0px;
      	border-radius: 10px;
      	transition: none;
      	color: @color1;
      }

      #workspaces button {
          transition: none;
          background: transparent;
          color: @color6;
          font-size: 16px;
      }
      #workspaces button.active {
          color: @color1;
          background: transparent;
          border-bottom: 2px solid @color1;
          border-radius: 0px;
      }
      #workspaces:hover button {
          background: transparent;
      }



      #custom-wallpaper {
      	font-size: 20px;
      	margin-top: 6px;
      	margin-left: 8px;
      	margin-right: 8px;
      	padding-left: 10px;
      	padding-right: 5px;
      	margin-bottom: 0px;
      	border-radius: 10px;
      	transition: none;
      	color: @color7;
      }


    '';
  };
  home.file.".config/waybar/scripts/mediaplayer.py" = {
    source = ../../dotfiles/waybar/scripts/mediaplayer.py;
    executable = true;
  };
  home.file.".config/waybar/scripts/restart.sh" = {
    source = ../../dotfiles/waybar/scripts/restart.sh;
    executable = true;
  };
}
