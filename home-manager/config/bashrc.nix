{
  pkgs,
  config,
  ...
}: {
  programs.bash = {
    enable = true;
    initExtra = ''
      eval "$(starship init bash)"
      cd ${config.home.homeDirectory}
    '';
  };
}
