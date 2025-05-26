{pkgs, ...}: {
  gtk = {
    enable = true;
    theme = {
      name = "Gruvbox-Dark";
      package = pkgs.gruvbox-gtk-theme;
      # package = pkgs.nwg-look;
    };
    iconTheme = {
      name = "oomox-gruvbox-dark";
      package = pkgs.gruvbox-dark-icons-gtk;
    };
    cursorTheme = {
      name = "rose-pine-cursor";
      package = pkgs.rose-pine-cursor;
      size = 24;
    };
  };
}
