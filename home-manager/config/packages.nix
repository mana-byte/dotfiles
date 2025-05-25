{
  pkgs,
  config,
  ...
}: {
  home.packages = with pkgs; [
    # work basics
    neovim
    git
    kitty
    tmux

    # nix packages
    alejandra
    nil

    # for nvim config lsp and tree sitter to work correctly
    cargo
    nodejs_23
    (python3.withPackages (python-pkgs: [
      python-pkgs.requests
    ]))
    gcc
    glibc

    # customisation
    starship
    neofetch
    sassc
    gtk-engine-murrine
    gnome-themes-extra
    rose-pine-hyprcursor

    # rofi applets dependencies: https://github.com/adi1090x/rofi?tab=readme-ov-file
    mpc_cli

    # desktop software
    gimp
    discord
    imv
    vlc
    brave
    acpi # for battery status in hyprland bar

    # anifetch dependencies
    bc
    chafa
    ffmpeg
  ];
}
