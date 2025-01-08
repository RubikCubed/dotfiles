_: {
  programs.starship = {
    enable = true;
    settings = {
      add_newline = false;
      nix_shell.symbol = "nix ";
      package.symbol = "pkg ";
      rust.symbol = "rust ";
      git_branch.symbol = "git ";
      git_metrics.disabled = false;
    };
  };
}
