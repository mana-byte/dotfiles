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
            critical = 20;
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
          tooltip-format = "NixOS x Hyprland x Kanagawa";
        };

        "custom/power" = {
          format = " ";
          on-click = "bash ${config.home.homeDirectory}/.config/rofi/powermenu/type-6/powermenu.sh";
          tooltip-format = "Bring up the power menu";
        };

        "custom/photo" = {
          format = "";
          on-click = "hyprshot -m window";
          on-click-right = "hyprshot -m region";
          tooltip-format = "Take a screenshot of a window (left click) or a region (right click)";
        };

        "custom/wallpaper" = {
          format = " ";
          on-click = "swww img ${config.home.homeDirectory}/.config/me/background/shop.png --transition-type outer --transition-pos 0.108,0.98 --transition-fps 60";
          on-click-right = "swww img ${config.home.homeDirectory}/.config/me/background/shop_night_moon.png --transition-type grow --transition-pos 0.108,0.98 --transition-fps 60";
          tooltip-format = "Change Wallpaper (left bright, right dark)";
        };
      }
    ];
    style = ''
      @define-color fuji_white       rgb(220, 215, 186);
      @define-color old_white        rgb(200, 192, 147);
      @define-color sumi_ink_0       rgb(22, 22, 29);
      @define-color sumi_ink_1       rgb(31, 31, 40);
      @define-color sumi_ink_2       rgb(42, 42, 55);
      @define-color sumi_ink_3       rgb(54, 54, 70);
      @define-color sumi_ink_4       rgb(84, 84, 109);
      @define-color wave_blue_1      rgb(34, 50, 73);
      @define-color wave_blue_2      rgb(45, 79, 103);
      @define-color winter_green     rgb(43, 51, 40);
      @define-color winter_yellow    rgb(73, 68, 60);
      @define-color winter_red       rgb(67, 36, 43);
      @define-color winter_blue      rgb(37, 37, 53);
      @define-color autumn_green     rgb(118, 148, 106);
      @define-color autumn_red       rgb(195, 64, 67);
      @define-color autumn_yellow    rgb(220, 165, 97);
      @define-color samurai_red      rgb(232, 36, 36);
      @define-color ronin_yellow     rgb(255, 158, 59);
      @define-color wave_aqua_1      rgb(106, 149, 137);
      @define-color dragon_blue      rgb(101, 133, 148);
      @define-color fuji_gray        rgb(114, 113, 105);
      @define-color spring_violet_1  rgb(147, 138, 169);
      @define-color oni_violet       rgb(149, 127, 184);
      @define-color crystal_blue     rgb(126, 156, 216);
      @define-color spring_violet_2  rgb(156, 171, 202);
      @define-color spring_blue      rgb(127, 180, 202);
      @define-color light_blue       rgb(163, 212, 213);
      @define-color wave_aqua_2      rgb(122, 168, 159);
      @define-color spring_green     rgb(152, 187, 108);
      @define-color boat_yellow_1    rgb(147, 128, 86);
      @define-color boat_yellow_2    rgb(192, 163, 110);
      @define-color carp_yellow      rgb(230, 195, 132);
      @define-color sakura_pink      rgb(210, 126, 153);
      @define-color wave_red         rgb(228, 104, 118);
      @define-color peach_red        rgb(255, 93, 98);
      @define-color surimi_orange    rgb(255, 160, 102);
      @define-color katana_gray      rgb(113, 124, 124);


      * {
      	border: none;
      	border-radius: 10;
          font-family: "JetbrainsMono Nerd Font" ;
      	font-size: 16px;
      	/* min-height: 10px; */
          margin: 2px;
      }

      window#waybar {
      	background: @sumi_ink_0;
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

      #tags button:hover {
      	transition: none;
      	box-shadow: inherit;
      	text-shadow: inherit;
          border-color: #E8A2AF;
          color: #E8A2AF;
      }

      #tags button.focused:hover {
          color: #E8A2AF;
      }

      #network {
      	margin-top: 6px;
      	margin-left: 8px;
      	padding-left: 10px;
      	padding-right: 10px;
      	margin-bottom: 0px;
      	border-radius: 10px;
      	transition: none;
      	color: @dragon_blue;
      }

      #pulseaudio {
      	margin-top: 6px;
      	margin-left: 8px;
      	padding-left: 10px;
      	padding-right: 10px;
      	margin-bottom: 0px;
      	border-radius: 10px;
      	transition: none;
      	color: @boat_yellow_2;
      }

      #battery {
      	margin-top: 6px;
      	margin-left: 8px;
      	padding-left: 10px;
      	padding-right: 10px;
      	margin-bottom: 0px;
      	border-radius: 10px;
      	transition: none;
      	color: @old_white;
      }

      #battery.charging, #battery.plugged {
          color: @autumn_green;
      }

      #battery.critical:not(.charging) {
          color: @samurai_red;
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
      	color: @spring_violet_2;
      }

      #memory {
      	margin-top: 6px;
      	margin-left: 8px;
      	padding-left: 10px;
      	margin-bottom: 0px;
      	padding-right: 10px;
      	border-radius: 10px;
      	transition: none;
      	color: @oni_violet;
      }
      #cpu {
      	margin-top: 6px;
      	margin-left: 8px;
      	padding-left: 10px;
      	margin-bottom: 0px;
      	padding-right: 10px;
      	border-radius: 10px;
      	transition: none;
      	color: @old_white;
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
          color: @crystal_blue;
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
      	color: @spring_green;
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
          color: @wave_red
      }
      #custom-media {
      	margin-top: 6px;
      	margin-left: 8px;
      	padding-left: 10px;
      	padding-right: 10px;
      	margin-bottom: 0px;
      	border-radius: 10px;
      	transition: none;
      	color: @autumn_green;
      }

      #workspaces button {
          transition: none;
          color: @fuji_white;
          font-size: 16px;
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
      	color: @wave_red;
      }


    '';
  };
  home.file.".config/waybar/scripts/mediaplayer.py" = {
    source = ../../dotfiles/waybar/scripts/mediaplayer.py;
    executable = true;
  };
}
