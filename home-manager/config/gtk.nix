{pkgs, ...}: {
  gtk = {
    enable = true;
    theme = {
<<<<<<< HEAD
      name = "Gruvbox-Dark";
      package = pkgs.gruvbox-gtk-theme;
      # package = pkgs.nwg-look;
    };
    iconTheme = {
      name = "oomox-gruvbox-dark";
      package = pkgs.gruvbox-dark-icons-gtk;
=======
      name = "catppuccin-frappe-blue-standard";
      package = pkgs.catppuccin-gtk;
      # package = pkgs.nwg-look;
    };
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.catppuccin-papirus-folders;
>>>>>>> anby
    };
    cursorTheme = {
      name = "Bibata-Modern-Classic";
      package = pkgs.bibata-cursors;
      size = 24;
    };
    font.name = "DepartureMono Nerd Font";
  };
}
