{
  pkgs,
  config,
  ...
}: {
  home.packages = with pkgs; [
    # system info : battery health, cpu temp, memory usage, disk usage, etc.
    inxi

    killall # kill all processes of a specific name

    # work basics
    neovim
    git
    kitty
    tmux
    nautilus
    clipman

    # apps
    rofi-wayland
    networkmanagerapplet

    # notifications
    dunst
    libnotify

    # nix packages
    alejandra
    nil

    # for nvim config lsp and tree sitter to work correctly
    cargo
    nodejs_24
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
    swww
    pywal
    # nwg-look

    # rofi applets dependencies: https://github.com/adi1090x/rofi?tab=readme-ov-file
    mpc_cli

    # desktop software
    gimp
    discord
    imv
    # video playyer : also dependency for youtube tui
    mpv

    # youtube tui (to watch youtube from terminal) depenndencies
    youtube-tui
    pavucontrol
    yt-dlp
    libsixel
    xorg.libxcb

    brave # web browser
    acpi # for battery status in hyprland bar
    cheese # for webcam

    # anifetch dependencies
    bc
    chafa
    ffmpeg
  ];
}
