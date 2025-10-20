_: {
  programs.git = {
    enable = true;

    ignores = [
      ".direnv/"
      ".envrc"
      "result"
      "result-doc"
    ];

    settings = {
      user = {
        name = "RubikCubed";
        email = "91467402+RubikCubed@users.noreply.github.com";
        signingKey = "~/.ssh/id_ed25519.pub";
      };
      init.defaultBranch = "main";
      github.user = "rubikcubed";
      gpg.format = "ssh";
      commit.gpgsign = "true";
    };
  };
}
