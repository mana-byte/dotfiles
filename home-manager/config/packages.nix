{pkgs, ...}:
{
  home.packages = with pkgs; [
    # work basics
    neovim
    git
    kitty
    tmux

    # for nvim config lsp and tree sitter to work correctly
    cargo
    nodejs_23
    python314
    gcc
    glibc

    # customisation
    nwg-look
    kanagawa-gtk-theme
    kanagawa-icon-theme
    starship
    neofetch

    # desktop software
    gimp
    gparted

    #cursor
    rose-pine-hyprcursor
  ];
}
