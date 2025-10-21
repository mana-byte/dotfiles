{
  pkgs,
  config,
  ...
}: {
  programs.bash = {
    enable = true;
    initExtra = ''
      eval "$(starship init bash)"
      alias nvf="nix run ~/nvim"
      alias sudo="sudo "
      alias CD="cd Desktop"
    '';
  };
}
