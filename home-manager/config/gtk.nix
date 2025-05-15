{
  pkgs,
  config,
  ...
}: {
  gtk = {
    enable = true;
    theme = {
      name = "Kanagawa-BL";
      package = pkgs.kanagawa-gtk-theme;
      # package = pkgs.nwg-look;
    };
    iconTheme = {
      name = "Kanagawa";
      package = pkgs.kanagawa-icon-theme;
    };
    cursorTheme.name = "rose-pine-hyprcursor";
    cursorTheme.package = pkgs.rose-pine-hyprcursor;
  };
}
