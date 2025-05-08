{
  programs.git = {
    enable = true;

    userName = "mana-byte";
    userEmail = "manaikilaut@gmail.com";

    extraConfig = {
      init.defaultBranch = "main";
      pull.rebase = false;
      credential.helper = "store";
      color.ui = "auto";
    };
  };
}
