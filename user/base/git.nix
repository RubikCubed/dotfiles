_: {
  programs.git = {
    enable = true;
    userName = "RubikCubed";
    userEmail = "91467402+RubikCubed@users.noreply.github.com";

    ignores = [
      ".direnv/"
      ".envrc"
      "result"
      "result-doc"
    ];

    extraConfig = {
      init.defaultBranch = "main";
      github.user = "rubikcubed";
      gpg.format = "ssh";
      user.signingKey = "~/.ssh/id_ed25519.pub";
      commit.gpgsign = "true";
    };
  };
}
