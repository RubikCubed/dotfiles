_: {
  programs.starship = {
    enable = true;
    settings = {
      add_newline = false;
      nix_shell.symbol = " ";
      package.symbol = "󰏗 ";
      rust.symbol = " ";
      git_branch.symbol = " ";
    };
  };
}
