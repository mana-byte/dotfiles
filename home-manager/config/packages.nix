{pkgs, ...}:
{
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
    nwg-look
    kanagawa-gtk-theme
    kanagawa-icon-theme
    starship
    neofetch

    # desktop software
    gimp

    #cursor
    rose-pine-hyprcursor

  ];
}
