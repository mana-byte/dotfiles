{
  config,
  pkgs,
  ...
}: {
  home.username = "mana";
  home.homeDirectory = "/home/mana";

  home.stateVersion = "24.05"; # Please read the comment before changing.
  nixpkgs.config.allowUnfree = true;

  imports = [
    ./config/env.nix
    ./config/packages.nix
    ./config/gtk.nix
    # ./config/programs/zsh.nix
    ./config/bashrc.nix
    ./config/programs/git.nix
    ./config/programs/neovim.nix
    ./config/programs/mpd.nix
    ./config/programs/starship.nix
    ./config/programs/kitty.nix
    # ./config/programs/tmux.nix
  ];

  home.file = {
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
